#!/bin/bash
set -ex

# Install apps (Ubuntu or Debian focused here, will need to update or provide different script for arch or enterprise)

sudo pacman -Syu --noconfirm

apps=("vim" "man" "tree" "wget" "git" "xclip" "ripgrep" "make" "tmux" "shellcheck" "curl" "file" "rsync" "gettext")

for x in "${apps[@]}"; do
    sudo pacman -S "$x" --noconfirm
done


# Install gh per the docs, not sure if I want to keep this
# (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
#    && sudo mkdir -p -m 755 /etc/apt/keyrings \
#    && out=$(mktemp) && wget -nv -O"$out" https://cli.github.com/packages/githubcli-archive-keyring.gpg \
#    && cat "$out" | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
#    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
#    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
#    && sudo apt update \
#    && sudo apt install gh -y

# Install stable Neovim from the AUR
yay -S neovim-git 

# Install the Lua Language Server (will need to update to latest version)
cd ~/Downloads
wget https://github.com/LuaLS/lua-language-server/releases/download/3.16.4/lua-language-server-3.16.4-linux-x64.tar.gz
sudo mkdir /opt/lua-language-server/
sudo tar -xzvf lua-language-server-3.16.4-linux-x64.tar.gz -C /opt/lua-language-server/
sudo ln -s /opt/lua-language-server/bin/lua-language-server /usr/local/bin/lua-language-server
sudo chown -R josh: /opt/lua-language-server/
lua-language-server --version

# Install NodeJS and NPM
sudo pacman -S nodejs npm --noconfirm
node --version
npm --version

# Install Pyright (Python Language Server)
sudo npm install -g pyright
sudo npm update -g pyright
pyright --version

# Set up LaTeX and Zathura
# Usually need a restart of host after the zathura install
sudo pacman -S texlive zathura zathura-pdf-poppler --noconfirm

# Install rustup nightly (for blink.cmp)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup toolchain install nightly
rustup default nightly

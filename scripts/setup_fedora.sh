#!/bin/bash
set -ex

# Install apps (Ubuntu or Debian focused here, will need to update or provide different script for arch or enterprise)

apps=("vim" "man" "tree" "wget" "git" "xclip" "ripgrep" "make" "tmux" "shellcheck" "curl" "file" "rsync" "ninja-build" "gettext" "cmake")

for x in "${apps[@]}"; do
    sudo dnf install "$x" -y
done

# Install gh per the docs, not sure if I want to keep this
sudo dnf install dnf5-plugins
sudo dnf config-manager addrepo --from-repofile=https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh --repo gh-cli

# Install Neovim
sudo dnf install -y neovim python3-neovim

# Install the Lua Language Server (will need to update to latest version)
cd ~/Downloads
wget https://github.com/LuaLS/lua-language-server/releases/download/3.14.0/lua-language-server-3.14.0-linux-x64.tar.gz
sudo mkdir /opt/lua-language-server/
sudo tar -xzvf lua-language-server-3.14.0-linux-x64.tar.gz -C /opt/lua-language-server/
sudo ln -s /opt/lua-language-server/bin/lua-language-server /usr/local/bin/lua-language-server
sudo chown -R josh: /opt/lua-language-server/
lua-language-server --version

# Install NodeJS and NPM
sudo dnf install -y nodejs
node --version
npm --version

# Install Pyright (Python Language Server)
sudo npm install -g pyright
sudo npm update -g pyright
pyright --version

# Install rustup nightly (for blink.cmp)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup toolchain install nightly
rustup default nightly

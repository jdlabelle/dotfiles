#!/bin/bash
set -ex

# Install apps (Ubuntu or Debian focused here, will need to update or provide different script for arch or enterprise)

apps=("vim" "man" "tree" "wget" "git" "ripgrep" "make" "tmux" "shellcheck" "curl" "file" "rsync" "ninja-build" "gettext" "cmake" "build-essential")

for x in "${apps[@]}"; do
    sudo apt-get install "$x"
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

# Install Neovim
cd ~
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux-x86_64.deb
# can use `sudo make install` if the above line fails

# Install the Lua Language Server (will need to update to latest version)
cd ~/Downloads
wget https://github.com/LuaLS/lua-language-server/releases/download/3.14.0/lua-language-server-3.14.0-linux-x64.tar.gz
sudo mkdir /opt/lua-language-server/
tar -xzvf lua-language-server-3.14.0-linux-x64.tar.gz -C /opt/lua-language-server/
sudo ln -s /opt/lua-language-server/bin/lua-language-server /usr/local/bin/lua-language-server
sudo chown -R josh: /opt/lua-language-server/
lua-language-server --version

# Install NodeJS and NPM
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo bash -
sudo apt-get install -y nodejs
node --version
npm --version

# Install Pyright (Python Language Server)
sudo npm install -g pyright
sudo npm update -g pyright
pyright --version

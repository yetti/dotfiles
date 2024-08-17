#!/bin/bash

# sudo apt-get update
# sudo apt-get upgrade -y

# Install basic system utilities
# sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends zsh telnet fzy tzdata

# Install network utilities
# sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends iputils-ping dnsutils mtr iproute2 bmon iperf3

# Install system dependencies
# sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends build-essential libssl-dev automake autoconf patch rustc

# Install buildpack
# sudo add-apt-repository ppa:cncf-buildpacks/pack-cli -y
# sudo apt-get update
# sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends pack-cli

# Copy dotfiles and tool config
cp {.zshrc,.gitconfig,.gitignore_global,.gemrc} ~/
cp -R .config ~/

# Change default shell to zsh
sudo chsh -s $(which zsh) vscode

# Install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
source ~/.zshrc
zinit self-update

# Install asdf if it doesn't exist
[ -d '~/.asdf' ] || git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# Install asdf plugins
. "$HOME/.asdf/asdf.sh"
asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add yarn
cp .tool-versions ~/
asdf install

# Install commitizen
npm install -g commitizen cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc

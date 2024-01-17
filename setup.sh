#!/bin/bash

# install extra OS packages
apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    dirmngr \
    gnupg \
    lsb-release \
    software-properties-common \
    direnv \
    fzy

# set shell
chsh -s $(which zsh)

# setup commitizen
npm install -g yarn pnpm commitizen cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc

# install Starship prompt
curl -sS https://starship.rs/install.sh | sh -s -- --yes

# setup zinit and link .zshrc to home directory
sh -c "$(curl -fsSL https://git.io/zinit-install)"
#mv ~/.zshrc ~/.zshrc_orig
cp ./.zshrc ~
# source ~/.zshrc

# link .gitconfig to home directory
cp ./.gitconfig ~

# link .wakatime.cfg to home directory and set API KEY
cp ./.wakatime.cfg ~
sed -i "s/WAKATIME_KEY/$WAKATIME_KEY/g" ~/.wakatime.cfg

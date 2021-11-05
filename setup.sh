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

# setup commitizen
npm install -g yarn pnpm commitizen cz-conventional-changelog
echo '{ "path": "cz-conventional-changelog" }' > ~/.czrc

# install Starship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -f
echo -n 'eval "$(starship init zsh)"' >> ~/.zshrc

# setup zgenom and link .zshrc to home directory
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
mv ~/.zshrc ~/.zshrc_orig
ln -s /workspaces/.codespaces/.persistedshare/dotfiles/.zshrc ~/.zshrc
# source ~/.zshrc

# link .gitconfig to home directory
ln -s /workspaces/.codespaces/.persistedshare/dotfiles/.gitconfig ~/.gitconfig

# link .wakatime.cfg to home directory and set API KEY
ln -s /workspaces/.codespaces/.persistedshare/dotfiles/.wakatime.cfg ~/.wakatime.cfg
sed -i "s/WAKATIME_KEY/$WAKATIME_KEY/g" ~/.wakatime.cfg

# set shell
chsh -s $(which zsh)

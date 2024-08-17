#!/bin/bash

chsh -s $(which zsh) vscode

# copy dotfiles
cp {.czrc,.gemrc,.gitconfig,.gitignore_global,.zshrc} ~/

# ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

# Starship
curl -fsSL https://starship.rs/install.sh | bash -s -- --yes

# Zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
zinit selfupdate

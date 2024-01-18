#!/bin/bash

chsh -s $(which zsh)

sh -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

# cp ./.zshrc ~
# source ~/.zshrc

# copy .wakatime.cfg to home directory and set API KEY
cp ./.wakatime.cfg ~
sed -i "s/WAKATIME_KEY/$WAKATIME_KEY/g" ~/.wakatime.cfg

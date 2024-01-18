#!/bin/bash

chsh -s $(which zsh)

mv ~/.zshrc ~/.zshrc_orig
cp ./.zshrc ~

# copy .wakatime.cfg to home directory and set API KEY
cp ./.wakatime.cfg ~
sed -i "s/WAKATIME_KEY/$WAKATIME_KEY/g" ~/.wakatime.cfg

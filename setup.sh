#!/bin/bash

chsh -s $(which zsh)

cp ./.zshrc ~
source ~/.zshrc

# copy .wakatime.cfg to home directory and set API KEY
cp ./.wakatime.cfg ~
sed -i "s/WAKATIME_KEY/$WAKATIME_KEY/g" ~/.wakatime.cfg

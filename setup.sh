#!/bin/bash

cp ./.zshrc ~
source ~/.zshrc

# link .gitconfig to home directory
cp ./.gitconfig ~

# link .wakatime.cfg to home directory and set API KEY
cp ./.wakatime.cfg ~
sed -i "s/WAKATIME_KEY/$WAKATIME_KEY/g" ~/.wakatime.cfg

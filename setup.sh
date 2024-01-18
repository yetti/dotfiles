#!/bin/bash

chsh -s $(which zsh)

mv ~/.zshrc ~/.zshrc_orig
cp ./.zshrc ~

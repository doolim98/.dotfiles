#!/bin/bash -eu

(
    cd "$HOME/.dotfiles"
    git pull
    ./install.sh
)

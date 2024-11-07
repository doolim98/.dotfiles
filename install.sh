#!/bin/bash -eu

cd "$HOME"


# Install my .dotfiles repository
if [ ! -d "$HOME/.dotfiles" ]; then
    git clone --depth 1 git@github.com:doolim98/.dotfiles.git ~/.dotfiles
fi


stow --adopt .


# Install fzf
if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi


# Install .my.bashrc and .my.zshrc
SNIPPET_INSTALL_MY_BASHRC='source ~/.my.bashrc'
SNIPPET_INSTALL_MY_ZSHRC='source ~/.my.zshrc'

if ! grep -Fxq "$SNIPPET_INSTALL_MY_BASHRC" ~/.bashrc; then
    echo "$SNIPPET_INSTALL_MY_BASHRC" >> ~/.bashrc
fi

if ! grep -Fxq "$SNIPPET_INSTALL_MY_ZSHRC" ~/.zshrc; then
    echo "$SNIPPET_INSTALL_MY_ZSHRC" >> ~/.zshrc
fi
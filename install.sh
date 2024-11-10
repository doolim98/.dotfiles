#!/bin/bash -eu

install_pkg (){
    if command -v brew &>/dev/null; then
        brew install "$1"
    elif command -v apt-get &>/dev/null; then
        sudo apt-get update
        sudo apt-get install -y "$1"
    elif command -v pacman &>/dev/null; then
        sudo pacman -Syu --noconfirm "$1"
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y "$1"
    else
        echo "Package manager not found. Please install $1 manually."
        exit 1
    fi
}

# Install stow using OS's package manager
install_pkg stow

# Install my .dotfiles repository
if [ ! -d "$HOME/.dotfiles" ]; then
    git clone --depth 1 https://github.com/doolim98/.dotfiles.git ~/.dotfiles
fi


# stow my dotfiles
(
    cd "$HOME/.dotfiles"
    stow --adopt .
)


# Install fzf
if [ ! -d "$HOME/.fzf" ]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi

# Install Starship
curl -sS https://starship.rs/install.sh | sh

# Install .my.bashrc and .my.zshrc
SNIPPET_INSTALL_MY_BASHRC='source ~/.my.bashrc'
SNIPPET_INSTALL_MY_ZSHRC='source ~/.my.zshrc'

touch ~/.bashrc
touch ~/.zshrc

if ! grep -Fxq "$SNIPPET_INSTALL_MY_BASHRC" ~/.bashrc; then
    echo "$SNIPPET_INSTALL_MY_BASHRC" >> ~/.bashrc
fi

if ! grep -Fxq "$SNIPPET_INSTALL_MY_ZSHRC" ~/.zshrc; then
    echo "$SNIPPET_INSTALL_MY_ZSHRC" >> ~/.zshrc
fi

echo ""
echo ""
echo "    Installation complete. Please restart your shell. \$SHELL=$SHELL    "
echo ""
echo ""
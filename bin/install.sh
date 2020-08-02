#!/bin/sh

# Run this from the dot-files directory.
# TODO: Both install scripts should source a common one to remove duplication.

# TODO: if <distro> install:

# tmux: tmuxp
# zplug: python gawk
sudo apt update && sudo apt install python3-tmuxp python gawk

# Stuff I always want
sudo apt install ansible curl rsync ssh tmux vim w3m zsh

sudo pacman -S rsync openssh tmux tmuxp gawk vim w3m zsh

BASE=`pwd`

ln -s "$BASE/.bashrc" "$HOME/.bashrc"
ln -s "$BASE/.profile" "$HOME/.profile"

ln -s "$BASE/.zshenv" "$HOME/.zshenv"

mkdir "$HOME/.config"
ln -sr "$BASE/.config/shells" "$HOME/.config/shells"

ln -sr "$BASE/.vim" "$HOME/.vim"
ln -s "$BASE/.vimrc" "$HOME/.vimrc"

vim +PluginInstall +qall

ln -s "$BASE/.gitconfig" "$HOME/.gitconfig"
ln -s "$BASE/.gitconfig" "$HOME/.gitignore"

ln -s "$BASE/.tmux.conf" "$HOME/.tmux.conf"

if [ ! -d "$HOME/.tmux" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

ln -sr "$BASE/.tmux" "$HOME/.tmux"

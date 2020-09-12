#!/bin/sh

# Run this from the dot-files directory.

sudo apt update && sudo apt install python gawk

BASE=`pwd`

touch "$HOME/.remoteprofile"

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


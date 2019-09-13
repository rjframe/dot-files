#!/bin/sh

# Run this from dot-files.

BASE=`pwd`

ln -s "$BASE/.bashrc" "$HOME/.bashrc"
ln -s "$BASE/.bashrc_framery" "$HOME/.bashrc_framery"
ln -s "$BASE/.bash_aliases" "$HOME/.bash_aliases"
ln -s "$BASE/.profile" "$HOME/.profile"

ln -sr "$BASE/.vim" "$HOME/.vim"
ln -s "$BASE/.vimrc" "$HOME/.vimrc"

ln -s "$BASE/.gitconfig" "$HOME/.gitconfig"
ln -s "$BASE/.gitconfig" "$HOME/.gitignore"

#!/bin/sh

# Run this from the dot-files directory.

# tmux: tmuxp
# zplug: python gawk
sudo apt update && sudo apt install tmux python3-tmuxp python gawk

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

ln -s "$BASE/.tmux.conf" "$HOME/.tmux.conf"

if [ ! -d "$HOME/.tmux" ]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

ln -sr "$BASE/.tmux" "$HOME/.tmux"

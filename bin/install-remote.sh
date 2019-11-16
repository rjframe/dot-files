#!/bin/sh

# Run this from the dot-files directory.

# tmux: tmuxp
# zplug: python gawk
sudo apt update && sudo apt install tmux python3-tmuxp python gawk

BASE=`pwd`

touch "$HOME/.remoteprofile"

ln -s "$BASE/.bashrc" "$HOME/.bashrc"
ln -s "$BASE/.bash_aliases" "$HOME/.bash_aliases"
ln -s "$BASE/.profile" "$HOME/.profile"
if [ -f $HOME/.bashrc_$(hostname) ]; then
    ln -s "$BASE/.bashrc_$(hostname)" "$HOME/.bashrc_$(hostname)"
fi

ln -s "$BASE/.zshrc" "$HOME/.zshrc"
ln -s "$BASE/.zprofile" "$HOME/.zprofile"
if [ -f $HOME/.zshrc_$(hostname) ]; then
    ln -s "$BASE/.zshrc_$(hostname)" "$HOME/.zshrc_$(hostname)"
fi

ln -s "$BASE/.common_rc" "$HOME/.common_rc"

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

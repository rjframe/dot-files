#!/bin/sh

# Run this from the dot-files directory.
# TODO: Both install scripts should source a common one to remove duplication.

sudo pacman -S rsync openssh gawk gvim w3m zsh ttf-fira-code

BASE=`pwd`

ln -s "$BASE/.bashrc" "$HOME/.bashrc"
ln -s "$BASE/.profile" "$HOME/.profile"

ln -s "$BASE/.zshenv" "$HOME/.zshenv"

mkdir "$HOME/.config"
ln -sr "$BASE/.config/shells" "$HOME/.config/shells"

ln -sr "$BASE/.config/sway" "$HOME/.config/sway"
ln -sr "$BASE/.config/i3status" "$HOME/.config/i3status"
ln -sr "$BASE/.config/kitty" "$HOME/.config/kitty"

ln -sr "$BASE/.vim" "$HOME/.vim"
ln -s "$BASE/.vimrc" "$HOME/.vimrc"

vim +PluginInstall +qall

ln -s "$BASE/.gitconfig" "$HOME/.gitconfig"
ln -s "$BASE/.gitconfig" "$HOME/.gitignore"

services=(
    mbsync.service
    mbsync.timer
    sieve.service
    thunar.service
    udiskie.service
    weather.service
    weather.timer
)

for service in "${services[@]}"; do
    ln -s "$BASE/.config/systemd/user/$service" \
        "$HOME/.config/systemd/user/$service"
done


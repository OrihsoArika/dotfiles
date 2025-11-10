#!/usr/bin/env bash

CWD=$(pwd)

printf "Setting up the new distro again...\n"

printf "The packages you may want to have on the system are:"
printf "- Alacritty."
printf "- Foot."
printf "- Telegram."
printf "- Git."
printf "- Ripgrep."
printf "- FZF."
printf "- gcc and clang."
printf "- Python."
printf "- Krita."
printf "- Blender."
printf "- Vesktop."
printf "- VLC."
printf "- Emacs."
printf "- Neovim."
printf "- Kvantum."
printf "- Steam."
printf "- Wine."
printf "- Tmux."
printf "- Godot 3."
printf ""
printf "The font you were using last time was MonaspiceXe NF"

# does not work, but, it is usefull anyways
read -p "do you want to continue? [Y/n]: " confirm
confirm=$(echo ${confirm^^})

if [[ "$confirm" != "Y" ]] || [[ "$confirm" != "" ]] ; then
    echo "oki, exitin'"
    exit
fi

echo "sleeping for 5 secconds to avoid errors ;)"
sleep 5

# All configs will be linked inside the `~/.config` dir
ln -sv $CWD/configs/* $HOME/.config

# Install Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
$HOME/.config/emacs/bin/doom install

ln -sv $CWD/doom $HOME/.config

ln -sv $CWD/local/bin/* $HOME/.local/bin
ln -sv $CWD/wallpapers $HOME/Pictures

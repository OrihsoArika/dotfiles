#!/usr/bin/env bash

CWD=$(pwd)

echo "Setting up the new distro again...\n"
echo "The packages you may want to have on the system are:"
echo "- Alacritty."
echo "- Foot."
echo "- Telegram."
echo "- Git."
echo "- Ripgrep."
echo "- FZF."
echo "- gcc and clang."
echo "- Python."
echo "- Krita."
echo "- Blender."
echo "- Vesktop."
echo "- VLC."
echo "- Emacs."
echo "- Neovim."
echo "- Kvantum."
echo "- Steam."
echo "- Wine."
echo "- Tmux."
echo "- Godot 3."
echo ""
echo "The font you were using last time was MonaspiceXe NF"

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

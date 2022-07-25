#!/bin/bash

STOW_FOLDERS=(bash base16 git i3 lxterminal neovim picom rofi template vim wallpaper x)

for i in "${STOW_FOLDERS[@]}"
  do stow "$i" && echo "stowed $i"
done

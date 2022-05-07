#!/bin/bash

STOW_FOLDERS=(bash base16 git i3 lxterminal neovim rofi template vim wallpaper x)

for i in "${STOW_FOLDERS[@]}"
  do stow -D "$i" &> /dev/null && echo "unstowed $i"
done

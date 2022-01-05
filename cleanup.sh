#!/bin/bash

STOW_FOLDERS=(bash base16 git i3 lxterminal rofi template vim x)

for i in "${STOW_FOLDERS[@]}"
  do stow -D "$i" &> /dev/null && echo "unstowed $i"
done

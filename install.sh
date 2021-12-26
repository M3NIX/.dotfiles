#!/bin/bash

STOW_FOLDERS=(bash base16 bin git i3 lxterminal rofi template vim x)

for i in "${STOW_FOLDERS[@]}"
  do stow "$i" && echo "stowed $i"
done

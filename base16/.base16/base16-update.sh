#!/bin/bash

if [[ ! -f ~/.local/bin/pybase16 ]]; then
    echo "pybase16-builder not installed"
    echo "Please run 'python3 -m pip install --user pybase16-builder' first"
    exit 1
fi

theme=$1
cd ~/.base16/

pybase16 inject -s $theme -f ~/.bash_theme && . ~/.bash_theme
pybase16 inject -s $theme -f ~/.config/i3status/config
pybase16 inject -s $theme -f ~/.config/i3/config && i3-msg reload &> /dev/null
pybase16 inject -s $theme -f ~/.Xresources.d/colors && xrdb ~/.Xresources

pybase16 inject -s $theme -f ~/.config/rofi/base16.rasi
# workaround to fix rofi theme
echo "element-text, element-icon {" >> ~/.config/rofi/base16.rasi
echo "    background-color: inherit;" >> ~/.config/rofi/base16.rasi
echo "    text-color:       inherit;" >> ~/.config/rofi/base16.rasi
echo "}" >> ~/.config/rofi/base16.rasi

# set theme in vim
echo "colorscheme base16-$theme" > ~/.vim/colorscheme.vim

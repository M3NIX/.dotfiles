#!/bin/bash

DATA_PATH="$HOME/.base16"

update_rofi() {
  local theme=$1
  local file="$DATA_PATH/base16-rofi/themes/base16-$theme.rasi"
  local rofi_dir="$HOME/.config/rofi"

  if [[ ! -f $file ]]; then
    echo "Rofi theme not found."
  else
    if [[ -d $rofi_dir ]]; then
      cat $file > "$rofi_dir/base16.rasi"
      # https://github.com/jordiorlando/base16-rofi/pull/13
      echo "element-text, element-icon {" >> "$rofi_dir/base16.rasi"
      echo "    background-color: inherit;" >> "$rofi_dir/base16.rasi"
      echo "    text-color:       inherit;" >> "$rofi_dir/base16.rasi"
      echo "}" >> "$rofi_dir/base16.rasi"
    echo "Updated base16-rofi theme"
    fi
  fi
}

update_xresources() {
  local theme=$1
  local file="$DATA_PATH/base16-xresources/xresources/base16-$theme.Xresources"

  if [[ ! -f $file ]]; then
    echo "Xresources theme not found."
  else
    cat $file > "$HOME/.Xresources"
    xrdb -load "$HOME/.Xresources"
    echo "Updated base16-xresources theme"
  fi
}

update_i3() {
  local theme=$1
  local color_file="$DATA_PATH/base16-i3/colors/base16-$theme.config"
  local config_file="$DATA_PATH/base16-i3/client-properties/base16-$theme.config"
  local i3_dir="$HOME/.config/i3"

  if [[ ! -f $color_file ]]; then
    echo "i3 theme not found."
  else
    if [[ -d $i3_dir ]]; then
      cat $color_file $config_file > "$i3_dir/colors"
      cat $i3_dir/base $i3_dir/colors > $i3_dir/config && i3-msg reload &> /dev/null
      echo "Updated base16-i3 theme"
    fi
  fi
}

update_shell(){
  local theme=$1
  local file="$DATA_PATH/base16-shell/scripts/base16-$theme.sh"
  local helper="$DATA_PATH/base16-shell/profile_helper.sh"

  if [[ ! -f $file ]]; then
    echo "Shell theme not found."
  else
    eval "$($helper)"
    _base16 "$file"
    echo "Updated base16-shell theme"
  fi
}

update_vim(){
  local theme=$1
  local file="$HOME/.vim/plugged/base16-vim/colors/base16-$theme.vim"
  local vim_dir="$HOME/.vim/"

  if [[ ! -f $file ]]; then
    echo "Vim theme not found."
  else
    if [[ -d $vim_dir ]]; then
      echo "colorscheme base16-$theme" > "$vim_dir/colorscheme.vim"
      echo "Updated base16-vim theme"
    fi
  fi
}

update_xresources $1
update_shell $1
update_vim $1
update_rofi $1
update_i3 $1

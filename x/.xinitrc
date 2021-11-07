# set keyboard layout
setxkbmap -layout us -variant intl

# load display settings
.screenlayout/config.sh

# load background image
./.fehbg

# start i3wm
exec i3

# set keyboard layout
setxkbmap -layout us -variant intl

# load display settings
.screenlayout/config.sh

# load background image
./.fehbg

# build i3 config
cat .config/i3/base .config/i3/colors > .config/i3/config

# start i3wm
exec i3

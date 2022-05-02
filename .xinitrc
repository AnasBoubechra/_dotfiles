#!/bin/sh
userresources=$HOME/.Xresources
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
function run {
    if ! pgrep $1 ; 
    then 
        $@&
    fi
}
sxhkd -c ~/.config/sxhkd/sxhkdrc &
slstatus &
run "ufw"
setbg Pictures/wallhaven &
run clipmenud &
run redshift &
run dunst &

exec dwm

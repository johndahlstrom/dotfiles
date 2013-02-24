#!/bin/sh

# Use the local Xresources settings
xrdb ~/.Xresources

# Set keyboard layout to swedish
setxkbmap se

# Make keyboard repeats be MUCH faster
xset r rate 400 60

# Update fonts and rehash
xset +fp /usr/share/fonts/local
xset fp rehash

# Turn off screensaver/blank screen
xset -dpms 
xset s noblank 
xset s off 

export LANG='sv_SE.utf8'
export PATH='/sbin:/usr/sbin:/bin:/usr/bin'

# Start wmfs
#exec wmfs &
exec i3 

# Set the background
#$HOME/.fehbg & 

# Start dropbox as a service
#dropboxd &

# Run the wmfs-status.sh to make a fancy statusbar
#$HOME/.config/wmfs/wmfs-status.sh


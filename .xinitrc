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

# Start wmfs
exec wmfs &

# Set the background
$HOME/.fehbg & 

# Run the wmfs-status.sh to make a fancy statusbar
$HOME/.config/wmfs/wmfs-status.sh

# Start dropbox as a service
dropboxd &

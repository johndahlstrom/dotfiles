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

# Fix LANG
export LANG='sv_SE.utf8'

# Fix PATH
export PATH='/sbin:/usr/sbin:/bin:/usr/bin:/home/john/.gem/ruby/2.0.0/bin'

# Start dbus and i3
#exec dbus-launch i3
exec i3

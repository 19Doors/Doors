#!/bin/sh

#feh --bg-fill ~/.config/qtile/wallpaper.jpg 
eww open bar &
# feh --bg-fill ~/.config/qtile/decay_PokePattern.png &
# watch -n 20 feh --randomize --bg-fill ~/Pictures/decay/* &
feh --bg-fill ~/Pictures/decay/decay_wallpaperflare.com_wallpaper.jpg &
dunst -c ~/.config/dunst/dunstrc &
picom &

# Storage
udiskie &

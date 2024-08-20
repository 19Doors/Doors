#!/bin/sh

#feh --bg-fill ~/.config/qtile/wallpaper.jpg 
eww open bar &
# feh --bg-fill ~/.config/qtile/decay_PokePattern.png &
# watch -n 20 feh --randomize --bg-fill ~/Pictures/decay/* &
# feh --bg-fill ~/Pictures/decay/decay_wallpaperflare.com_wallpaper.jpg &
# feh --bg-fill ~/Pictures/decay/decay_1.png &
# feh --bg-fill ~/wallpapers/cars/mclaren.png
# feh --bg-fill ~/wallpapers/landscapes/conv-tree.png
# feh --bg-fill ~/wallpapers/conv-GreenBlueCoast.png
# feh --bg-fill ~/wallpapers/misc/conv-anonymous.png
#feh --bg-fill ~/wallpapers/landscapes/conv-colourful_mountain_clouds.png
feh --bg-fill ~/.config/qtile/wallpapers/altitude.png &
dunst -c ~/.config/dunst/dunstrc &
#picom --experimental-backend &
picom &
# Storage
udiskie &

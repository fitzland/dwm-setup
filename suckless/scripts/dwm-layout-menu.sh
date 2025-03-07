#!/bin/bash

# Define your layouts with keybinds and descriptions
layouts=(
    "[\\] Dwindle              Shift+Control+1"    
    "|M| Centered Master       Shift+Control+2"    
    "[]= Tile                  Shift+Control+3"    
    "[C] Column Layout         Shift+Control+4"    
    ">< Floating               Shift+Control+5"    
    "TTT Bstack                Shift+Control+6"    
    "### N-Row Grid            Shift+Control+7"    
    "H[] Deck                  Shift+Control+8"    
    "::: Gapless Grid          Shift+Control+9"    
    "[@] Spiral                Shift+Control+0"    
    "[M] Monocle               Shift+Control+-"    
    "HHH Grid                  Shift+Control+="    
)

# Show the layout menu with rofi
selected=$(printf "%s\n" "${layouts[@]}" | rofi -dmenu -i -p "Select Layout" -line-padding 4 -hide-scrollbar -theme ~/.config/suckless/rofi/keybinds.rasi) 

# Extract the layout name (removing the keybind and description parts for matching)
layout_name=$(echo "$selected" | awk '{$1=$2=""; print substr($0,3)}' | sed 's/^ *//')

# Map selection to keybinds
case "$layout_name" in
    "[\\] Dwindle") xdotool key shift+control+1 ;;
    "|M| Centered Master") xdotool key shift+control+2 ;;
    "[]= Tile") xdotool key shift+control+3 ;;
    "[C] Column Layout") xdotool key shift+control+4 ;;
    ">< Floating") xdotool key shift+control+5 ;;
    "TTT Bstack") xdotool key shift+control+6 ;;
    "### N-Row Grid") xdotool key shift+control+7 ;;
    "H[] Deck") xdotool key shift+control+8 ;;
    "::: Gapless Grid") xdotool key shift+control+9 ;;
    "[@] Spiral") xdotool key shift+control+0 ;;
    "[M] Monocle") xdotool key shift+control+minus ;;
    "HHH Grid") xdotool key shift+control+equal ;;
    *) exit 0 ;;  # No selection or cancel
esac

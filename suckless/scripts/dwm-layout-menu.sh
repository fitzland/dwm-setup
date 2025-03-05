
#!/bin/bash

# Define your layouts and their corresponding keys
layouts=(
    "[\\] Dwindle" # Layout 0 -> Shift+Control+1
    "|M| Centered Master" # Layout 1 -> Shift+Control+2
    "[]= Tile" # Layout 2 -> Shift+Control+3
    "[C] Column Layout" # Layout 3 -> Shift+Control+4
    "><> Floating" # Layout 4 -> Shift+Control+5
    "TTT Bstack" # Layout 5 -> Shift+Control+6
    "### N-Row Grid" # Layout 6 -> Shift+Control+7
    "H[] Deck" # Layout 7 -> Shift+Control+8
    "::: Gapless Grid" # Layout 8 -> Shift+Control+9
    "[@] Spiral" # Layout 9 -> Shift+Control+0
    "[M] Monocle" # Layout 10 -> Shift+Control+minus
    "HHH Grid" # Layout 11 -> Shift+Control+equal
)

# Show the layout menu with rofi
selected=$(printf "%s\n" "${layouts[@]}" | rofi -dmenu -i -p "Select Layout" -line-padding 4 -hide-scrollbar -theme ~/.config/suckless/rofi/keybinds.rasi) 

# Map selection to keybinds
case "$selected" in
    "[\\] Dwindle") xdotool key shift+control+1 ;;
    "|M| Centered Master") xdotool key shift+control+2 ;;
    "[]= Tile") xdotool key shift+control+3 ;;
    "[C] Column Layout") xdotool key shift+control+4 ;;
    "><> Floating") xdotool key shift+control+5 ;;
    "TTT Bstack") xdotool key shift+control+6 ;;
    "### N-Row Grid") xdotool key shift+control+7 ;;
    "H[] Deck") xdotool key shift+control+8 ;;
    "::: Gapless Grid") xdotool key shift+control+9 ;;
    "[@] Spiral") xdotool key shift+control+0 ;;
    "[M] Monocle") xdotool key shift+control+minus ;;
    "HHH Grid") xdotool key shift+control+equal ;;
    *) exit 0 ;;  # No selection or cancel
esac

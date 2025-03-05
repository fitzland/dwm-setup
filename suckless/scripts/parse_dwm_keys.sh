#!/bin/bash

CONFIG=~/.config/suckless/dwm/config.def.h
OUTPUT=~/.config/suckless/dwm/keybindings.txt

translate_modifiers() {
    echo "$1" | sed \
        -e 's/MODKEY/super/g' \
        -e 's/ShiftMask/shift/g' \
        -e 's/ControlMask/ctrl/g' \
        -e 's/Mod1Mask/alt/g'
}

awk -v translate_modifiers="$(declare -f translate_modifiers)" '
function trim(s) {
    sub(/^[ \t]+/, "", s)
    sub(/[ \t]+$/, "", s)
    return s
}

/^[[:space:]]*{/ {
    gsub(/^[[:space:]]*{[[:space:]]*/, "")
    gsub(/[[:space:]]*}[[:space:]]*,?[[:space:]]*$/, "")
    split($0, fields, ",")

    mod = trim(fields[1])
    key = trim(fields[2])

    mod = translate_modifiers(mod)
    gsub(/XK_/, "", key)

    mods = ""
    if (mod ~ /super/) mods = mods "super + "
    if (mod ~ /shift/) mods = mods "shift + "
    if (mod ~ /ctrl/) mods = mods "ctrl + "
    if (mod ~ /alt/) mods = mods "alt + "

    sub(/ \+ $/, "", mods)

    keybind = mods key

    print keybind
}' "$CONFIG" > "$OUTPUT"

echo "Keybindings written to $OUTPUT"
echo "Please edit $OUTPUT to add descriptions."

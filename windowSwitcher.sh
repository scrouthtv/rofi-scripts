#!/bin/bash
cat ~/.config/i3/workspacelist | rofi \
    -dmenu  \
    -kb-cancel "Alt+Escape,Escape" \
    -kb-accept-entry "!Alt-Tab,Return"\
    -kb-row-down "Alt+Tab,Alt+Down" \
    -kb-row-up "Alt+Shift+Tab,Alt+Up"&

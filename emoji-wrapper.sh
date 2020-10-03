#!/bin/sh

emo=$($(dirname $0)/emoji4rofi.sh.old | rofi -dmenu)
frece increment "$(dirname $0)/emoji.db" "$emo"
echo $emo > /tmp/dis
emo=$(echo $emo | awk -F ' ' '{print $1}')
echo -n $emo | xsel -ip
echo -n $emo | xsel -ib
xdotool type $emo

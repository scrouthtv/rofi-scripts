#!/bin/sh

termite -d $((echo "~"; for proc in $(ps -C zsh -o pid --no-headers); do
	realpath /proc/$proc/cwd
done) | sed -e "s?$HOME?~?g" | xargs -n 1 | sort -u | rofi -dmenu | sed -e "s?~?$HOME?g")

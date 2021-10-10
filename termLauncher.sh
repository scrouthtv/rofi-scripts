#!/bin/sh

# Using ? as list separator, as they can't appear in paths

folders=$(
	printf "~?\n";
	for proc in $(ps -C zsh -o pid --no-headers); do
		realpath /proc/$proc/cwd | sed -e "s?$HOME?~?g"
		printf "?"
	done
)

echo "before sorting:" > /tmp/folders
echo $folders >> /tmp/folders

termite -d $(echo "$folders" | tr '?' '\n' | sort -u | rofi -dmenu | sed -e "s?~?$HOME?g")

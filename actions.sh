#!/bin/sh

if [[ -z "$@" ]]; then
	echo shutdown
	echo reboot
	echo hibernate
	echo suspend
elif [[ "$@" == confirm* ]]; then
	systemctl $(echo $@ | awk '{print $2}')
else
	echo "confirm $@"
fi

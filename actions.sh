#!/bin/sh

if [[ -z "$@" ]]; then
	echo shutdown
	echo reboot
	echo hibernate
	echo suspend
else
	systemctl $@
fi

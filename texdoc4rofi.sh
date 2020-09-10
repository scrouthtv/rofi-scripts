#!/bin/bash

db="$(dirname $0)/texdoc.db"
if [ ! -f $db ]; then
	((find /usr/share/texmf-dist/doc/ -mindepth 2 -maxdepth 2 -type d -printf '%f\n' && awk '{if ($1 == "alias") {print $2}}' /usr/share/texmf-dist/texdoc/texdoc.cnf) | sort -u) > "$db.txt"
	frece init "$db" "$db.txt"
	rm "$db.txt"
fi

if [[ -z "$@" ]]; then
	frece print "$db"
else
	frece increment "$db" "$@"
	coproc (texdoc "$@")
	exit
fi


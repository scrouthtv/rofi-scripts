#!/bin/bash

db="$(dirname $0)/emoji.db"
if [ ! -f $db ]; then
	"$(dirname $0)/genEmojiDB.sh"
fi

if [[ -z "$@" ]]; then
	#frece print "$db" | perl -e 's/-/ \\U/g'
	for line in $(frece print "$db" | sed -e 's/-/ \\U/g' -e 's/^/\\U/g' -E); do
		echo -e $line
		echo line done
	done
else
	frece increment "$db" "$@"

	exit
fi


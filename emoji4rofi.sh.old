#!/bin/bash

db="$(dirname $0)/emoji.db"
if [ ! -f $db ]; then
	"$(dirname $0)/genEmojiDB.sh"
fi

if [[ -z "$@" ]]; then
	#frece print "$db" | perl -e 's/-/ \\U/g'
	for line in $(frece print "$db"); do
		echo -ne $(echo $line | sed -e 's/-/ \\U/g' -e 's/^/\\U/g' -E)
		echo -ne "\t"
		#look $line $(dirname $0)/emoji.txt | awk -F ';' '{print $3}';
		look $line $(dirname $0)/emoji.txt | sed 's/^[^;]*;[^;]*;//g'
	done
else
	frece increment "$db" "$@"

	exit
fi


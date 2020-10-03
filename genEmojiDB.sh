#!/bin/bash

db="$(dirname $0)/emoji.db"
dbtempl="$(dirname $0)/emoji.db.txt"
descfile="$(dirname $0)/emoji.txt"

if [ ! -f $db ]; then

	echo -n > $dbtempl
	echo -n > $descfile

	#curl https://unicode.org/Public/emoji/13.0/emoji-zwj-sequences.txt 2>/dev/null \
	cat emoji-zwj-sequences.txt \
		| grep -v '^#' | grep -v '^$' | while read line; do
		id=$(echo $line | grep -oE '([0-9A-F]+ )+;' | sed -e 's/ /-/g' -e 's/-;$//g')
		echo $id >> $dbtempl
		codepoint=\\U$(echo $line | grep -oE '([0-9A-F]+ )+;' | sed -e 's/ /\\U/g' -e 's/\\U;$//')
		description=$(echo $line | sed -e 's/^.*; //g' -e 's/\s#.*$//')
		echo "$id;$codepoint;$description" >> $descfile
	done

	frece init $db $dbtempl
	rm $dbtempl

fi

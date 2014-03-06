#!/bin/bash

## Remove all words that CAN be pronouns (tag:k3.*)

DATA=../network.txt
MAJKA=/home/marx/projekty/sholva/bin-qa/majka
MAJKA_DICT=/home/marx/projekty/sholva/bin-qa/majka.w-lt

tmp=`mktemp`

cat $DATA | awk -F# '{print $2}' | \
	$MAJKA -f $MAJKA_DICT -p | grep ":k3" | \
	awk -F: '{print $1}' | sort -u | sed 's/\(.*\)/#\1#.$/' > $tmp

cat $DATA | grep -v -f $tmp

rm -f $tmp

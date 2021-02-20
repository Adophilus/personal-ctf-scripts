#!/bin/bash


while [[ 1 ]];
do
	# stty sane
	readline COMMAND
	if [[ "$COMMAND" == "preparser" ]];
	then
		# stty raw raw -echo
		echo "# modified command"

	else
		# stty raw -echo
		echo "$COMMAND"
	fi
done
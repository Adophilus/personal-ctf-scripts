#!/bin/bash


while [[ -p /dev/stdin ]];
do
	read COMMAND
	if [[ "$COMMAND" == "preparser" ]];
	then
		echo "# modified command"

	else
		echo "$COMMAND"
	fi
done
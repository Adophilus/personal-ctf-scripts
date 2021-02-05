#!/bin/bash

HOST="$1"
RUSTSCAN_FOUND_PORTS=$(rustscan --addresses ${HOST} --scripts None | grep "${HOST} -> \[" | sed -e "s/$1 -> \[//;s/\]//")
NMAP_SPECIFIC_SCAN=$(echo "${RUSTSCAN_FOUND_PORTS}" | xargs -I{} nmap -sC -sV -oN "scans/nmap-specific.txt" -p{} "$HOST")
NMAP_STANDARD_SCAN=$(nmap -sC -sV -oN "scans/nmap-initial.txt" "${HOST}")

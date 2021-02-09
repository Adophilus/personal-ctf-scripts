#!/bin/bash

HOST="$1"
RUSTSCAN_FOUND_PORTS=$(rustscan --addresses "${HOST}" --scripts None | grep -E "(.*)? -> \[" | sed -E "s/(.*) -> \[//;s/\]//")

#echo "${RUSTSCAN_FOUND_PORTS}"
#exit

NMAP_SPECIFIC_SCAN=$(nmap -sC -sV -oN "scans/nmap-specific.txt" -p "${RUSTSCAN_FOUND_PORTS}" "$HOST")
NMAP_STANDARD_SCAN=$(nmap -sC -sV -oN "scans/nmap-initial.txt" "${HOST}")

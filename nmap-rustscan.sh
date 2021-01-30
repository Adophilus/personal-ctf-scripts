#!/bin/bash

nmap -sC -sV -oN "scans/nmap-initial.txt" $1 &
rustscan --addresses $1 --scripts None | grep "$1 -> \[" | sed -e "s/$1 -> \[//;s/\]//" | xargs -I{} nmap -sC -sV -oN "scans/nmap-specific.txt" -p{} $1

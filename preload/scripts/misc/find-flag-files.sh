#!/bin/bash

find / -type f -name "flag.txt" -or -name ".flag" -or -name "flag" -or -name "user.txt" -or -name ".user" -or -name "user" 2> /dev/null > /tmp/files.txt

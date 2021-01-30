#!/bin/bash

find / -type f -name "flag.txt" -or -name ".flag" -or "flag" -or "user.txt" -or -name ".user" -or -name "user" 2>/dev/null

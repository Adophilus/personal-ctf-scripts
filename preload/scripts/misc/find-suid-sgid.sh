#!/bin/bash

find / -user root -perm -4000 -or -perm -6000 2>/dev/null| xargs -I {} ls -ldb {}

#!/bin/bash

find -user root -perm -4000 -or -perm -6000 | xargs -I {} ls -ldb {}

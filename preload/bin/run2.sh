#!/bin/bash

OUT_FILE=$(mktemp)
DATA=$(./bin/preload.sh "$@")

echo -e "\n" > "$OUT_FILE"
echo "sleep 1" >> "$OUT_FILE"
echo "$DATA" >> "$OUT_FILE"
echo -e "\n\n" >> "$OUT_FILE"
# echo "preparser" >> "$OUT_FILE"

stty raw -echo
# stty -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr -icrnl -ixon  -ixoff  -icanon  -opost  -isig  -iuclc  -ixany -imaxbel -xcase min 1 time 0
cat "$OUT_FILE"

source ./bin/preparser.sh

stty sane

rm "$OUT_FILE"
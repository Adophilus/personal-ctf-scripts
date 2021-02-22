#!/bin/bash

function showHelp () {
    echo "Usage: $0 hostname ip-address"
}

HOSTNAME="$1"
IP_ADDRESS="$2"
HOSTS_FILE_CONTENT="$(cat /etc/hosts)"
FALSE=$(/bin/false)

if [[ "$HOSTNAME" == "$FALSE" || "$IP_ADDRESS" == "$FALSE" ]];
then
    showHelp
    exit
fi

if [[ `echo "$HOSTS_FILE_CONTENT"` == "$FALSE" ]];
then
    echo "Hostname not matched in hosts file"
    exit
fi

echo "$HOSTS_FILE_CONTENT" | sed -E "s/^([0-9]+\.){3}[0-9]+(.*)$HOSTNAME(.*)/$IP_ADDRESS\2$HOSTNAME\3/" > /etc/hosts

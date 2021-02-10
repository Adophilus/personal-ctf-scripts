#!/bin/bash

getPort () {
	local port="${USED_PORTS[${#USED_PORTS[@]}-1]}"
	port=$(expr $port + 1 )
	USED_PORTS+=( "$port" )
	logLog "Setting port: $port"
	echo "$port"
}

logLog () {
	local message="$1"
	echo "[LOG] $message" >> logs/preload-log.txt
}

replaceVariableDefinitions () {
	local preload_data="$1"

	for variable in "${!VARIABLES[@]}";
	do
		VARIABLES["PORT"]=$(getPort)
		logLog "Ports set: ${USED_PORTS[*]}"
		preload_data=$(echo "$preload_data" | sed "s/${variable}=.*$/${variable}=${VARIABLES[$variable]}/")
	done
	echo "$preload_data"
}

onExit () {
	rm "$PORTS_FILE"
	#echo "${USED_PORTS[@]}" > ports.txt
	for port in "${USED_PORTS[@]}";
	do
		#echo "$port" >> ports.txt
		echo "$port" >> "$PORTS_FILE"
	done
}

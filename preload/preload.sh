#!/bin/bash

# retrieve function definitions
source ./preload-functions.sh

# retrieve variable definitions
source ./preload-variables.sh

for preload in $PRELOADS;
do
	for preload_loop_path in "${PRELOAD_PATHS[@]}";
	do
		preload_path="${preload_loop_path}/${preload}"
		if [[ -f "$preload_path" ]];
		then
			break
		fi
		unset preload_path
	done

	while [[ 1 == 1 ]];
	do
		if [[ "$preload_path" == "" ]];
		then
			preload_path="$preload"
			continue
		fi

		if [[ ! -f "$preload_path" ]];
		then
			unset preload_path
			break
		else
			break
		fi
	done

	if [[ "$preload_path" == "" ]];
	then
		continue
	fi

	preload_data=$(cat ${preload_path})
	result=$(replaceVariableDefinitions "$preload_data")
	echo "$result"
done

onExit

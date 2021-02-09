#!/bin/bash

# retrieve function definitions
source ./preload-variables.sh
source ./preload-functions.sh

# retrieve variable definitions
#source ./preload-variables.sh

for preload in $PRELOADS;
do
	preload_path="${PRELOADS_PATH}/${preload}"
	preload_data=$(cat ${preload_path})
	rep=preload_data
	result=$(replaceVariableDefinitions "$preload_data")
	echo "$result"
done

onExit

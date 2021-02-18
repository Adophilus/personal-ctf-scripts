#!/bin/bash

source ./preload-functions.sh
source ./preload-variables.sh

declare -A args

args=$(splitArgs "${@}")

# echo "# $args #"
# exit

for arg in "$args";
do
	argName=$(echo "$arg" | ${HAS_SED} -E "s/^(.*?)\s.*/\1/")
	argValue=$(echo "$arg" | ${HAS_SED} -E "s/^.*?\s(.*?)$/\1/")
	echo "-- $arg --"
	# echo "> $argName -> $argValue"
done

# if [[  ]];
# then
#     echo "port was specified!"
# fi
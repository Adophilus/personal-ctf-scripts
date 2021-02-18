#!//bin/bash

COMMAND="$1"

if [[ "$COMMAND" == "sync" ]];
then
	stty_output=$(stty size)
	rows=$(echo ${stty_output} | cut -d " " --field 1)
	columns=$(echo ${stty_output} | cut -d " " --field 2)
	echo "stty rows $rows columns $columns"
else
	echo "$COMMAND"
fi
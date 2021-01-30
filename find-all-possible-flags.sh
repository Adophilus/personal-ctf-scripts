#!/bin/bash

FILES=$(find / -type f | sed "s/ /%20/g")
readarray FILES_ARRAY < <(echo $FILES)
IMAGE_FILES_PNG=$(echo "$FILES" | grep "\.png")
IMAGE_FILES_JPG=$(echo "$FILES" | grep "\.jpg")
IMAGE_FILES_GIF=$(echo "$FILES" | grep "\.gif")
IMAGE_FILES_ICO=$(echo "$FILES" | grep "\.ico")
IMAGE_FILES_ALL=$(echo -e "${IMAGE_FILES_PNG}\n${IMAGE_FILES_JPG}\n${IMAGE_FILES_GIF}\n${IMAGE_FILES_ICO}")
readarray IMAGE_FILES_ALL_ARRAY < <(echo $IMAGE_FILES_ALL)

REMAINING_FILES=()

for file_path in $FILES_ARRAY;
do
	# escaped_file_path="${file_path//\//'\'/}";
	if [[ ! "${IMAGE_FILES_ALL_ARRAY[*]}" =~ "$file_path" ]];
	then
		REMAINING_FILES+=( "$file_path" )
	fi
done

for file_path in ${REMAINING_FILES[@]};
do
	normal_file_path=$(echo "$file_path" | sed "s/%20/ /g")
	egrep -H "thm\{|\b[a-f0-9]{32}\b" "$normal_file_path" --color;
done

# echo "${REMAINING_FILES[@]}"

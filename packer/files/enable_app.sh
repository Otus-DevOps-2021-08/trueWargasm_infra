#!/bin/sh

cat > /etc/systemd/system/puma.service <<EOF
Description=Puma HTTP Server
After=network.target

[Service]
Type=notify
WatchdogSec=10
WorkingDirectory=/redditapp/reddit
ExecStart=/usr/local/bin/puma --dir /redditapp/reddit/

Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Enable so it starts on boot
systemctl enable puma.service

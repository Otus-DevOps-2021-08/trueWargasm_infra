#!/bin/sh

cat > /etc/systemd/system/puma.service <<EOF
Description=Puma HTTP Server
After=network.target

[Service]
Environment="DATABASE_URL=$DATABASE_URL"
Type=simple
WatchdogSec=10
WorkingDirectory=/redditapp/reddit
ExecStart=/usr/local/bin/puma --dir /redditapp/reddit/

Restart=always

[Install]
WantedBy=multi-user.target
EOF
echo "ENABLE"
echo $DATABASE_URL
# Enable so it starts on boot
systemctl enable puma.service
systemctl start puma.service

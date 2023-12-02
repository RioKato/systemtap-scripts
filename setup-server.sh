#!/bin/sh

cd $(dirname $0)

cp stap-server.service /etc/systemd/system
systemctl daemon-reload

mkdir /var/lib/stap-server
mkdir /var/log/stap-server

useradd -c "SystemTap Compile Server" -d /var/lib/stap-server -m -r -s /sbin/nologin stap-server

chown -R stap-server:stap-server /var/lib/stap-server
chown -R stap-server:stap-server /var/log/stap-server

systemctl start stap-server
sleep 1
mkdir -p /etc/systemtap/ssl/client
cp -a /var/lib/stap-server/.systemtap/ssl/client/* /etc/systemtap/ssl/client/
chown -R :stapdev /etc/systemtap
chmod 660 /etc/systemtap/ssl/client/*

chmod +x /usr/bin/staprun

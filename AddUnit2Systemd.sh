#!/bin/sh
#
#
#

currend_dir=$(pwd)

# compile executable file
gcc $(pwd)/testUnit.c -o testUnit

# creat service unit file in /etc/systemd/system
sudo echo """[Unit]
Description=Test

[Service]"""> /etc/systemd/system/testUnit.service
sudo echo ExecStart=$(pwd)/testUnit >> /etc/systemd/system/testUnit.service
sudo echo """Restart=always
RestartSec=10

[Install]
WantedBy=default.target""" >> /etc/systemd/system/testUnit.service

# active this unit
sudo systemctl daemon-reload
sudo systemctl start testUnit.service
sudo systemctl enable testUnit.service

#!/bin/bash

export P=$(pwd)
for u in /etc/skel /root /home/*
do
	ln -sf $P/home-.bashrc $u/.bashrc
done
chown root:root $P/home-.bashrc
chmod u=rwx,g=rx,o=rx $P/home-.bashrc

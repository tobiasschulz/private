#!/bin/bash

LC_ALL=C git pull 2>&1 | grep -v "Current branch master is up to date" | grep -v "Already up-to-date"

export P=$(pwd)

# .bashrc

for u in /etc/skel /root /home/*
do
	ln -sf $P/home-.bashrc $u/.bashrc
done
chown root:root $P/home-.bashrc
chmod u=rwx,g=rx,o=rx $P/home-.bashrc

# update system config

cp -f $P/apt.conf /etc/apt/apt.conf.d/60user

# setup update script

echo '#!/bin/bash' > /usr/local/bin/pull-private
echo 'sudo su -c "cd '$P'; ./install.sh"' >> /usr/local/bin/pull-private
chown root:root /usr/local/bin/pull-private
chmod u=rwx,g=rx,o=rx /usr/local/bin/pull-private
ln -f /usr/local/bin/pull-private /etc/cron.daily/pull-private

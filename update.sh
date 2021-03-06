#!/bin/bash

cd $(dirname $0)
export P=$(pwd)

LC_ALL=C git pull 2>&1 | grep -v "Current branch master is up to date" | grep -v "Already up-to-date"

if [ `whoami` != root ]; then
    echo $0 $* | sudo su -
    exit 0
fi

./install.sh

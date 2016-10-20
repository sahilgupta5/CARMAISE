#!/bin/bash

# Only run as root
if (( $EUID != 0 )); then
    exit
fi

apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y clean
apt-get -y autoremove

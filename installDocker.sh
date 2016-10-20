#!/bin/bash

PUBLIC_HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/public-hostname)

while true;
do
if [ "$(curl http://169.254.169.254/latest/meta-data/public-hostname)x"!="x" ]; then
	break;
fi
sleep 5;
done

#Ref: https://docs.docker.com/engine/installation/linux/ubuntulinux/

sudo apt-get install -y apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

#Get the list of sources for docker
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" | sudo tee -a /etc/apt/sources.list.d/docker.list

#Get recommended packages
sudo apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual

#Run the update to make sure repo list is updated with docker source repos
sudo apt-get --yes update

sudo apt-get install -y docker-engine
sudo service docker start

sudo docker run -d -p 80:80 -p 3306:3306 -p 443:443 sahilgupta/carmaise

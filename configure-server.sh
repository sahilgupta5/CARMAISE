#!/bin/bash
sleep 60
mkdir -p /usr/local/docker
cd /usr/local/docker
#Install git on the server
sudo apt-get --yes install git
#Clone the repository to setup Docker image for CARMAISE
git clone https://github.com/sahilgupta5/CARMAISE.git
cd CARMAISE
sudo ./updateServer.sh
sudo ./installDocker.sh
sudo ./containerizeRestaurantierAndRun.sh

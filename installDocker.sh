#!/bin/bash

PUBLIC_HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/public-hostname)

while true;
do
if [ "$(curl http://169.254.169.254/latest/meta-data/public-hostname)x"!="x" ]; then
	break;
fi
sleep 5;
done

sudo yum install -y docker
sudo service docker start

sudo docker run -d -p 80:80 -p 3306:3306 -p 443:443 sahilgupta/carmaise

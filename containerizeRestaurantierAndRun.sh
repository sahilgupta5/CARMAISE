#!/bin/bash

sudo docker build -t sahilgupta/carmaise .
sudo docker run -d -p 80:80 -p 3306:3306 -p 443:443 sahilgupta/carmaise

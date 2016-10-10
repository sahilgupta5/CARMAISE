FROM nickistre/ubuntu-lamp:latest
MAINTAINER Sahil Gupta <info@sahilgupta.info>

#Install git on the server
RUN sudo apt-get --yes install git

RUN mkdir -p /usr/local/FoodLine

#Clone the repository to setup FoodLine server
RUN git clone https://github.com/sahilgupta5/FoodLine.git /usr/local/FoodLine



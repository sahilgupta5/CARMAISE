FROM nickistre/ubuntu-lamp:latest
MAINTAINER Sahil Gupta <info@sahilgupta.info>

#Install git on the server
RUN sudo apt-get --yes install git

RUN mkdir -p /usr/local/repos
RUN mkdir -p /usr/local/repos/FoodLine
RUN mkdir -p /usr/local/repos/Restaurantier
RUN mkdir -p /usr/local/repos/CARMAISE
RUN mkdir -p /var/www/html/FoodLine

#Clone the repository to setup CARMAISE server
RUN git clone https://github.com/sahilgupta5/FoodLine.git /usr/local/repos/FoodLine
RUN git clone https://github.com/sahilgupta5/Restaurantier.git /usr/local/repos/Restaurantier
RUN git clone https://github.com/sahilgupta5/Restaurantier.git /usr/local/repos/CARMAISE

RUN rm -rf /var/www/html/*
RUN mv /usr/local/repos/Restaurantier/* /var/www/html/
RUN rm -rf /usr/local/repos/Restaurantier

RUN mv /usr/local/repos/FoodLine/rest_resources/* /var/www/html/FoodLine/
RUN rm -rf /usr/local/repos/FoodLine

RUN cp -rf /usr/local/repos/CARMAISE/apache2.conf /etc/apache2/
RUN cp -rf /usr/local/repos/CARMAISE/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN rm -rf /usr/local/repos/CARMAISE

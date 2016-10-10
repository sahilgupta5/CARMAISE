FROM nickistre/ubuntu-lamp:latest
MAINTAINER Sahil Gupta <info@sahilgupta.info>

#Install git on the server
RUN sudo apt-get --yes install git

RUN mkdir -p /usr/local/CARMAISE
RUN mkdir -p /usr/local/CARMAISE/FoodLine
RUN mkdir -p /usr/local/CARMAISE/Restaurantier
RUN mkdir -p /var/www/html/FoodLine

#Clone the repository to setup CARMAISE server
RUN git clone https://github.com/sahilgupta5/FoodLine.git /usr/local/CARMAISE/FoodLine
RUN git clone https://github.com/sahilgupta5/Restaurantier.git /usr/local/CARMAISE/Restaurantier
RUN git clone https://github.com/sahilgupta5/Restaurantier.git /usr/local/CARMAISE

RUN rm -rf /var/www/html/*
RUN mv /usr/local/CARMAISE/Restaurantier/* /var/www/html/
RUN rm -rf /usr/local/CARMAISE/Restaurantier

RUN mv /usr/local/CARMAISE/FoodLine/rest_resources/* /var/www/html/FoodLine
RUN rm -rf /usr/local/CARMAISE/FoodLine

RUN /bin/cp -rf /usr/local/CARMAISE/apache2.conf /etc/apache2/
RUN /bin/cp -rf /usr/local/CARMAISE/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN rm -rf /usr/local/CARMAISE

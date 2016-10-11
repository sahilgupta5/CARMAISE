FROM nickistre/ubuntu-lamp:latest
MAINTAINER Sahil Gupta <info@sahilgupta.info>

# Setup environment
ENV DEBIAN_FRONTEND noninteractive

#Install git on the server
RUN apt-get update -y
RUN sudo apt-get -y install git

RUN mkdir -p /usr/local/repos
RUN mkdir -p /usr/local/repos/FoodLine
RUN mkdir -p /usr/local/repos/Restaurantier
RUN mkdir -p /usr/local/repos/CARMAISE
RUN rm -rf /var/www/html/*
RUN mkdir -p /var/www/html/FoodLine

#Clone the repository to setup CARMAISE server
RUN git clone https://github.com/sahilgupta5/FoodLine.git /usr/local/repos/FoodLine
RUN git clone https://github.com/sahilgupta5/Restaurantier.git /usr/local/repos/Restaurantier
RUN git clone https://github.com/sahilgupta5/CARMAISE.git /usr/local/repos/CARMAISE

#Setup Restaurantier server
RUN mv /usr/local/repos/Restaurantier/* /var/www/html/
RUN rm -rf /usr/local/repos/Restaurantier

#Setup backend rest api services for FoodLine or FeedMee
RUN mv /usr/local/repos/FoodLine/rest_resources/* /var/www/html/FoodLine/
#Configure MySQL and import test data
RUN /bin/bash -c "/usr/bin/mysqld_safe &" && \
  sleep 5 && \
  mysql -u root < /usr/local/repos/CARMAISE/configure-mysql.sql && \
  mysql -u root < /usr/local/repos/FoodLine/database_dump_example/all_tables_dump_combined.sql

#Setup Apache webserver which serves content for CARMAISE
RUN cp -rf /usr/local/repos/CARMAISE/apache2.conf /etc/apache2/
RUN cp -rf /usr/local/repos/CARMAISE/000-default.conf /etc/apache2/sites-available/000-default.conf
RUN rm -rf /usr/local/repos/CARMAISE

EXPOSE 3306 80 443 22

FROM php:8.0-apache
ENV DEBIAN_FRONTEND=noninteractive

RUN printf "deb http://kambing.ui.ac.id/debian/ buster main contrib non-free" >> /etc/apt/sources.list \
    && printf "deb http://repo.ugm.ac.id/debian/ buster main contrib non-free" >> /etc/apt/sources.list

#RUN apt-get update --fix-missing \
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get autoremove -y

RUN apt-get install -y \
       apt-utils \
       libpq-dev \
       software-properties-common

RUN apt-get install -y \ 
       vim \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-install \
       sockets \
    && docker-php-ext-enable \
       sockets \
    && apt-get install -y \
       libcurl4-gnutls-dev \
       && docker-php-ext-install \
          curl

#---> Cloning File
COPY ./.ProjectCore/Configuration/Docker/PHPApacheFrontEnd/vhost.conf /etc/apache2/sites-available/000-default.conf

#---> Set Ulang Kepemilikan File
RUN chown -R www-data:www-data /var/www \
    && a2enmod rewrite

#---> Set Name Server
RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/servername.conf
RUN a2enconf servername

#---> Release Port
EXPOSE 80

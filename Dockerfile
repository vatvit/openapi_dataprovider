FROM php:7.2-cli

RUN apt-get update && apt-get install -y \
#        wget \
#        libfreetype6-dev \
#        libjpeg62-turbo-dev \
#        libmcrypt-dev \
#        libpng-dev \
        libicu-dev \
#        nodejs \
        git \
    && docker-php-ext-install -j$(nproc) intl

RUN apt-get update && \
    apt-get install -y git zip unzip && \
    php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer && \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app/
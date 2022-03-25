FROM php:8.1-fpm

RUN apt-get update

RUN apt-get install -y libzip-dev zip && docker-php-ext-configure zip && docker-php-ext-install zip

RUN apt-get install -y git

RUN apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/code/back
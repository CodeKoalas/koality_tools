# syntax=docker/dockerfile:1
# For copying compiled composer.
FROM composer:2.4.4 as composer-env

# For copying compiled node.
FROM node:14.21-buster as node-env

# Base image for Laravel.
FROM php:8.0.25-fpm-alpine as base

# Create the /var/www/html directory.
RUN mkdir -p /var/www/html

# Copy Node and Composer from their stages.
COPY --from=node-env /usr/local/bin /usr/local/bin

COPY --from=composer-env /usr/bin/composer /usr/bin/composer

# Configure Pickel for PHP 8.0+
RUN wget https://github.com/FriendsOfPHP/pickle/releases/latest/download/pickle.phar -O /usr/local/bin/pickle \
    && chmod +x /usr/local/bin/pickle

WORKDIR /var/www/html

# Default PHP ini settings.
RUN { \
    echo 'memory_limit = 384M'; \
    echo 'display_errors = Off'; \
    echo 'post_max_size = 64M'; \
    echo 'file_uploads = On'; \
    echo 'upload_max_filesize = 64M'; \
    echo 'max_file_uploads = 20'; \
    echo 'session.gc_maxlifetime = 259200'; \
    } >  $PHP_INI_DIR/conf.d/codekoalas-settings.ini

# set recommended PHP.ini OPCache settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.interned_strings_buffer=8'; \
    echo 'opcache.max_accelerated_files=4000'; \
    echo 'opcache.revalidate_freq=60'; \
    echo 'opcache.fast_shutdown=1'; \
    echo 'opcache.enable_cli=1'; \
    } >  $PHP_INI_DIR/conf.d/opcache-recommended.ini

# set supervisor conf directory
RUN mkdir /etc/supervisor.d

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# Install packages like git, supervisor, nginx, and PHP extensions
# su-exec specifically for running COPY commands as the www-data user to prevent needing to chown anything.
RUN apk add --no-cache git supervisor nginx libzip-dev libpng-dev bash vim mysql-client gettext su-exec

# Add extra extensions for Redis.
RUN apk add --no-cache pcre-dev $PHPIZE_DEPS \
    && pickle install redis \
    && docker-php-ext-enable redis.so

# Enable Docker PHP extensions
RUN docker-php-ext-install bcmath pcntl pdo_mysql zip gd

FROM base
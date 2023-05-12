# syntax=docker/dockerfile:1
FROM composer:2.4.4 as composer-env

# From Drupal base image - using PHP FPM.
FROM drupal:9.5-php8.0-fpm-alpine3.16 as base

# Set the Drush version.
ENV DRUSH_VERSION 8.1.18

# Install Drush 8 with the phar file.
RUN curl -fsSL -o /usr/local/bin/drush "https://github.com/drush-ops/drush/releases/download/$DRUSH_VERSION/drush.phar" && \
    chmod +x /usr/local/bin/drush

RUN apk add --no-cache \
    autoconf \
    g++ \
    make \
    git \
    supervisor \
    nginx \
    libzip-dev \
    libpng-dev \
    bash \
    vim \
    mysql-client \
    gettext \
    libxml2-dev \
    ssmtp \
    imagemagick-dev \
    imagemagick-libs \
    gettext \
    su-exec

RUN wget https://github.com/FriendsOfPHP/pickle/releases/latest/download/pickle.phar -O /usr/local/bin/pickle \
    && chmod +x /usr/local/bin/pickle

RUN pickle install imagick

#ADD https://drupalconsole.com/installer /usr/local/bin/drupal
#RUN chmod +x /usr/local/bin/drupal

# Enable Docker PHP extensions
RUN docker-php-ext-install bcmath pcntl pdo_mysql zip gd

RUN docker-php-ext-enable imagick

# Create the /var/www/html directory.
RUN mkdir -p /var/www/html

RUN rm -rf /opt/drupal/*

COPY --from=composer-env --chown=www-data:www-data /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

RUN { \
    echo 'memory_limit = 196M'; \
    echo 'display_errors = Off'; \
    echo 'post_max_size = 512M'; \
    echo 'file_uploads = On'; \
    echo 'upload_max_filesize = 512M'; \
    echo 'max_file_uploads = 20'; \
    echo 'max_input_vars = 2000'; \
} > /usr/local/etc/php/conf.d/codekoalas-settings.ini

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

FROM base
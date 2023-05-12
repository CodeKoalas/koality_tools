# syntax=docker/dockerfile:1
FROM drupal:7.94-php8.0-fpm-alpine3.16 as base

# Set the Drush version.
ENV DRUSH_VERSION 8.4.10

# Install Drush 8 with the phar file.
RUN curl -fsSL -o /usr/local/bin/drush "https://github.com/drush-ops/drush/releases/download/$DRUSH_VERSION/drush.phar" && \
    chmod +x /usr/local/bin/drush

RUN apk add --no-cache git supervisor nginx libzip-dev libpng-dev bash vim mysql-client gettext libxml2-dev ssmtp imagemagick gettext su-exec

RUN docker-php-ext-install exif && docker-php-ext-enable exif

# Create the /var/www/html directory.
RUN mkdir -p /var/www/html

RUN rm -rf /opt/drupal/*

WORKDIR /var/www/html

RUN { \
    echo 'memory_limit = 384M'; \
    echo 'display_errors = Off'; \
    echo 'post_max_size = 64M'; \
    echo 'file_uploads = On'; \
    echo 'upload_max_filesize = 64M'; \
    echo 'max_file_uploads = 20'; \
    echo 'session.gc_maxlifetime = 259200'; \
    } >  $PHP_INI_DIR/conf.d/codekoalas-settings.ini

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.interned_strings_buffer=8'; \
    echo 'opcache.max_accelerated_files=4000'; \
    echo 'opcache.revalidate_freq=60'; \
    echo 'opcache.fast_shutdown=1'; \
    echo 'opcache.enable_cli=1'; \
    } >  $PHP_INI_DIR/conf.d/opcache-recommended.ini

RUN echo 'sendmail_path = "/usr/sbin/ssmtp -t -i"' > /usr/local/etc/php/conf.d/mail.ini

# set supervisor conf directory
RUN mkdir /etc/supervisor.d

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

FROM base
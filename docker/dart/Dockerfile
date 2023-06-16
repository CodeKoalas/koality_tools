# syntax=docker/dockerfile:1
# Base image for Dart executables.
FROM dart:stable as dart

FROM debian:bullseye as base

COPY --from=dart /usr/lib/dart /usr/bin/dart
COPY --from=dart /runtime/ /

# Set the Dart SDK environment variable and add to path.
ENV DART_SDK /usr/bin/dart
ENV PATH $DART_SDK/bin:$PATH

# Install packages like git, supervisor, bash and vim
# su-exec specifically for running COPY commands as the www-data user to prevent needing to chown anything.
RUN apk add --no-cache git supervisor libzip-dev libpng-dev bash vim gettext su-exec

# Create the /app directory.
RUN mkdir -p /app

WORKDIR /app

# set supervisor conf directory
RUN mkdir /etc/supervisor.d

FROM base
FROM alpine:3.18

# Install packages like git, supervisor, bash and vim
# su-exec specifically for running COPY commands as the www-data user to prevent needing to chown anything.
RUN apk add --no-cache supervisor libzip-dev libpng-dev bash vim gettext su-exec

# set supervisor conf directory
RUN mkdir /etc/supervisor.d
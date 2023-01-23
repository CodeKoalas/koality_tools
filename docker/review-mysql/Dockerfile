FROM mysql:8

RUN chmod +x ./init.sh

# Add our script to the entrypoint
ADD ./init.sh /docker-entrypoint-initdb.d

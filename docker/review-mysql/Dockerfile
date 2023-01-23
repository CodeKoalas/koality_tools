FROM mysql:8

# Add our script to the entrypoint
ADD ./init.sh /docker-entrypoint-initdb.d

RUN chmod +x /docker-entrypoint-initdb.d/init.sh

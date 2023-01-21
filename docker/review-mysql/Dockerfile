FROM mysql:8

ADD ./init.sh /opt/var/

RUN chmod +x /opt/var/init.sh

# Copy the script into the container and set as the entrypoint
CMD ["/bin/bash", "/opt/var/init.sh"]

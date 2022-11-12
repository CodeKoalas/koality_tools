FROM ubuntu:22.04

# Install mysql-client tool.
RUN apt-get update && apt-get install -y mysql-client

ADD ./init.sh /opt/var/

RUN chmod +x /opt/var/init.sh

# Copy the script into the container and set as the entrypoint
CMD ["/bin/bash", "/opt/var/init.sh"]

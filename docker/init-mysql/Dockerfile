FROM ubuntu:22.04

# Install mysql-client tool.
RUN apt-get update && apt-get install -y mysql-client

# Copy the script into the container and set as the entrypoint
CMD ["/init.sh"]

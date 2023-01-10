FROM node:19-alpine

# Install laravel-echo-server tool.
RUN npm install -g laravel-echo-server

ADD ./init.sh /opt/var/

RUN chmod +x /opt/var/init.sh

# set supervisor conf
RUN mkdir /etc/supervisor.d

COPY /supervisor-codekoalas-conf.ini /etc/supervisor.d/

EXPOSE 6001

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]

# create my first container for connecting to a container over ssh with root
FROM ubuntu:14.04
MAINTAINER schulz@seamlessinteraction.com

VOLUME /rootpass

RUN apt-get update
RUN apt-get install -y openssh-server curl

RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd

RUN echo 'root:default' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

RUN curl https://raw.githubusercontent.com/ThomasSI/sshd_docker/master/docker-entrypoint.sh


COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]


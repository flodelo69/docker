# This file creates a container that runs SSH services and vim
# Author: Florian Dufour
# Date: 16/05/2015


FROM debian:8.0
MAINTAINER Florian Dufour "flodelo69@gmail.com"

RUN apt-get update -y
RUN apt-get upgrade -y

# Installing the environment required
RUN apt-get install -y openssh-server vim tar sudo pwgen cron wget screen locales nfs-kernel-server

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Fix PAM login issue with sshd
RUN sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd

# Copy the files into the container
ADD . /src

EXPOSE 22
# Start xdm and ssh services.
CMD ["/bin/bash", "/src/startup.sh"]

#!/bin/bash

# Create the directory needed to run the sshd daemon
mkdir /var/run/sshd 

# Add user ynov
DOCKER_PASSWORD=`pwgen -c -n -1 12`
echo User: ynov Password: $DOCKER_PASSWORD
DOCKER_ENCRYPYTED_PASSWORD=`perl -e 'print crypt('"$DOCKER_PASSWORD"', "aa"),"\n"'`
useradd -m -d /home/ynov -p $DOCKER_ENCRYPYTED_PASSWORD ynov
sed -Ei 's/adm:x:4:/ynov:x:4:ynov/' /etc/group
adduser ynov sudo

# Copy the config files into the docker directory
cd /src/config/ && sudo -u ynov cp -R .[a-z]* [a-z]* /home/ynov/

# Start the ssh service
/usr/sbin/sshd -D

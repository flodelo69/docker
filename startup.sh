#!/bin/bash

# Create the directory needed to run the sshd daemon
mkdir /var/run/sshd 

#add user ynov
useradd -m -d /home/ynov -p ynov-aix ynov
sed -Ei 's/adm:x:4:/ynov:x:4:ynov/' /etc/group
adduser ynov sudo
chsh -s /bin/bash ynov

# Copy the config files into the docker directory
cd /src/config/ && sudo -u ynov cp -R .[a-z]* [a-z]* /home/ynov/

# Start the ssh service
/usr/sbin/sshd -D

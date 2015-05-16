#!/bin/bash

# Create the directory needed to run the sshd daemon
mkdir /var/run/sshd 



# Copy the config files into the docker directory
cd /src/config/ && sudo -u docker cp -R .[a-z]* [a-z]* /home/docker/

# Start the ssh service
/usr/sbin/sshd -D

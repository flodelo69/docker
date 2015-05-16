#!/bin/bash

# Create the directory needed to run the sshd daemon
mkdir /var/run/sshd 

useradd -m -d /home/ynov -p ynov-aix ynov -c 'parametre un Cron qui afficher l’heure toutes les 5 minutes le mardi'
sed -Ei 's/adm:x:4:/ynov:x:4:ynov/' /etc/group
adduser ynov sudo

# Set the default shell as bash for ynov user.
chsh -s /bin/bash ynov

# Copy the config files into the ynov directory
cd /src/config/ && sudo -u ynov cp -R .[a-z]* [a-z]* /home/ynov/

# Start the ssh service
/usr/sbin/sshd -D

#!/bin/sh
NOW=$(date +'%Y-%m-%d-%T');

# Delete Custom Cash Local
sudo rm -rf  -R /home/amzad/dev/theroyals/src/var/cache/*

# Delete all files REMOTE
ssh root@109.203.123.78 -p2365  " rm -rf -R /home/theroyal/public_html/*"

# Backup Database here
mysqldump -uroot -p theroyals >  ~/dev/theroyals/dbBackup/theroyals_$NOW.sql

#Push files to server
scp -P 2365 -r /home/amzad/dev/theroyals/src/* root@109.203.123.78:/home/theroyal/public_html/


# Set ownership REMOTE
ssh root@109.203.123.78 -p2365  "cd /home/theroyal/public_html/; chown -R theroyal:theroyal application  menu  resources system  __template var img index.php"

# Set permission REMOTE
ssh root@109.203.123.78 -p2365  "cd /home/theroyal/public_html/; chmod -R 755 application  menu  resources system  __template var img index.php"


#scp -P 2365 -r /home/amzad/dev/theroyals/src/application/config/databaseLive.php theroyal@109.203.123.78:/home/theroyal/public_html/application/config/database.php

#deploy :: ../ServerConf/deployLive.sh
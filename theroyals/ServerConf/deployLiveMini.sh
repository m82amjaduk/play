#!/bin/sh
NOW=$(date +'%Y-%m-%d-%T');
#source config.sh  # TODO:: File inlude is not working,
# TODO:: sshpass; installation need to add on script.

LOCAL_MySQL_PASS="amzad123";
SERVER_PASSWORD="cW@!t3rH31pd3sk";


# Delete Custom Cash Local
sudo rm -rf  -R /home/amzad/dev/theroyals/src/var/cache/custom/*
sudo rm -rf  -R /home/amzad/dev/theroyals/src/var/cache/db/*

# Backup Database here
mysqldump -uroot -p$LOCAL_MySQL_PASS theroyals >  ~/dev/theroyals/dbBackup/theroyals_$NOW.sql
echo "Database Backup SUCCEEDED";

#Push files to server
sshpass -p $SERVER_PASSWORD scp -P 2365 -r /home/amzad/dev/theroyals/src/* root@109.203.123.78:/home/theroyal/public_html/

# Set permission REMOTE
sshpass -p $SERVER_PASSWORD ssh root@109.203.123.78 -p2365  "
cd /home/theroyal/public_html;
rm -rf -R var/cache/custom/* ;
chmod -R 755 application  menu  resources system  __template var img index.php;
chown -R theroyal:theroyal application  menu  resources system  __template var img index.php;
chmod -R 777 var/log/* ;
uptime";

# TODO :: RELEASE:: 777 is too much permission

# configured from  ~/.ssh/config
sshpass -p $SERVER_PASSWORD ssh webhost  "uptime"

#deploy :: ../ServerConf/deployLiveMini.sh
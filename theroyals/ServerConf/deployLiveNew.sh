#!/bin/sh
NOW=$(date +'%Y-%m-%d-%T');
#source config.sh  # TODO:: File inlude is not working,
# TODO:: sshpass; installation need to add on script.

LOCAL_MySQL_PASS="amzad123";
SERVER_PASSWORD="cW@!t3rH31pd3sk";



/home/amzad/dev/theroyals/ServerConf/release.sh


# Delete all files REMOTE
sshpass -p $SERVER_PASSWORD  ssh root@109.203.123.78 -p2365  "
cd /home/theroyal/public_html/;
rm -rf application  menu  resources system var index.php license.txt;
uptime"

#Push files to server
sshpass -p $SERVER_PASSWORD scp -P 2365 -r /home/amzad/dev/theroyals/Deploy/release.zip root@109.203.123.78:/home/theroyal/public_html/
sshpass -p $SERVER_PASSWORD scp -P 2365 -r /home/amzad/dev/theroyals/Deploy/htaccess root@109.203.123.78:/home/theroyal/public_html/.htaccess


# Set permission REMOTE
sshpass -p $SERVER_PASSWORD ssh root@109.203.123.78 -p2365  "
cd /home/theroyal/public_html;
unzip release.zip;
chmod -R 755 application  menu  resources system  var img index.php;
chown -R theroyal:theroyal application  menu  resources system var img index.php;
chmod -R 777 var/log/* ;
uptime";

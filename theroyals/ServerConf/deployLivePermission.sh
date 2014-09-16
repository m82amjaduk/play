#!/bin/sh
NOW=$(date +'%Y-%m-%d-%T');
#source config.sh  # TODO:: File inlude is not working,
# TODO:: sshpass; installation need to add on script.

LOCAL_MySQL_PASS="amzad123";
SERVER_PASSWORD="cW@!t3rH31pd3sk";

# Set permission REMOTE
sshpass -p $SERVER_PASSWORD ssh root@109.203.123.78 -p2365  "
cd /home/theroyal/public_html;
rm -rf -R var/cache/custom/* ;
chmod -R 755 application  menu  resources system  __template var img index.php;
chown -R theroyal:theroyal application  menu  resources system  __template var img index.php;
uptime";


# configured from  ~/.ssh/config
sshpass -p $SERVER_PASSWORD ssh webhost  "uptime"

#deploy :: ../ServerConf/deployLiveMini.sh
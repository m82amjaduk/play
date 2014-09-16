#!/bin/sh
NOW=$(date +'%Y-%m-%d-%T');
#source config.sh  # TODO:: File inlude is not working,
# TODO:: sshpass; installation need to add on script.

LOCAL_MySQL_PASS="amzad123";
SERVER_PASSWORD="cW@!t3rH31pd3sk";
SITE_CODE='epos';
SITE_DIR='/home/'$SITE_CODE'/public_html/';
SITE_USER=$SITE_CODE":"$SITE_CODE;

VERSION_NO='060206023';
FILE_NAME=$SITE_DIR'clientsRemoteUpdate/cwaiter/menu/'$VERSION_NO'.zip';
echo '\n FILE_NAME >> '$FILE_NAME;


/home/amzad/dev/theroyals/ServerConf/release.sh


#Push files to server
sshpass -p $SERVER_PASSWORD scp -P 2365 -r /home/amzad/dev/theroyals/Deploy/release.zip root@109.203.123.78:$FILE_NAME




# Unzip Set permission and remove file  REMOTE
sshpass -p $SERVER_PASSWORD ssh root@109.203.123.78 -p2365  "
cd "$SITE_DIR";
pwd;
uptime";

echo "Process Completed";
echo $FILE_NAME;

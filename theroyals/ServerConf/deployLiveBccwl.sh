#!/bin/sh
NOW=$(date +'%Y-%m-%d-%T');
#source config.sh  # TODO:: File inlude is not working,
# TODO:: sshpass; installation need to add on script.

LOCAL_MySQL_PASS="amzad123";
SERVER_PASSWORD="cW@!t3rH31pd3sk";
SITE_CODE='ukb1781';   #  ukb1781::bccwl.com;  ukb1783::bccwl.co.uk aaa1780::al-aminrestaurant.co.uk
SITE_DIR='/home/'$SITE_CODE'/public_html/';
SITE_USER=$SITE_CODE":"$SITE_CODE;
DIR_LIST="application  menu  resources system var UPDATE index.php license.txt";

echo 'SITE_DIR >> '$SITE_DIR;



/home/amzad/dev/theroyals/ServerConf/release.sh


# Delete all files REMOTE
sshpass -p $SERVER_PASSWORD  ssh root@109.203.123.78 -p2365  "
cd "$SITE_DIR";
rm -rf "$DIR_LIST";
uptime"

#Push files to server
sshpass -p $SERVER_PASSWORD scp -P 2365 -r /home/amzad/dev/theroyals/Deploy/release.zip root@109.203.123.78:$SITE_DIR
sshpass -p $SERVER_PASSWORD scp -P 2365 -r /home/amzad/dev/theroyals/Deploy/htaccess root@109.203.123.78:$SITE_DIR.htaccess




# Unzip Set permission and remove file  REMOTE
sshpass -p $SERVER_PASSWORD ssh root@109.203.123.78 -p2365  "
cd "$SITE_DIR";
unzip release.zip;
chmod -R 755 "$DIR_LIST";
chown -R "$SITE_USER" "$DIR_LIST";
chmod -R 777 var/log/* ;
rm  release.zip;
uptime";

echo "Process Completed";

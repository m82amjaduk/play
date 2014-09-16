#!/bin/sh


sudo rm -rf  -R /home/amzad/dev/theroyals/src/var/cache /home/amzad/dev/theroyals/src/var/upload
#exit;
# Delete Custom Cash Local
sudo rm -rf  -R /home/amzad/dev/theroyals/src/var/cache/*

mkdir -p var  var/cache
chmod 777 var var/cache


#deploy :: ../ServerConf/deployLiveMini.sh
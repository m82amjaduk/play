#!/bin/sh
NOW=$(date +'%Y-%m-%d-%T');
#source config.sh  # TODO:: File inlude is not working,
# TODO:: sshpass; installation need to add on script.


# Empty Temp folder and copy all files from src location
cd /home/amzad/dev/theroyals/Deploy/temp; pwd;
sudo rm -rf *
sudo rm -rf /home/amzad/dev/theroyals/Deploy/release.zip
sudo cp -R /home/amzad/dev/theroyals/src/*   .
sudo cp /home/amzad/dev/theroyals/Deploy/htaccess .htaccess


# Remove all unnecessary files / folder
sudo rm  -rf __template img
sudo rm  -rf var/cache/custom/*
sudo rm  -rf var/cache/db/*
sudo rm  -rf UPDATE/__u/*
sudo rm  -rf UPDATE/etc/*



# Empty Log Files !!
cd /home/amzad/dev/theroyals/Deploy/temp/var/log; pwd;
sudo rm  -rf  *~  # Delete  temp files
sudo rm  -rf  *  # Empty Dir
#sudo truncate -s 0  error.log errorUser.log exception.log paypal.log paypal_http_response.log sysLog.log visitor.log errorPhp.log cache.log dev.log cwdp.log


# Set permission to 755 on all folder and files And Zip the folder
cd /home/amzad/dev/theroyals/Deploy/temp; pwd;
#sudo chmod -R  755 *
#sudo chown -R aaa1787:aaa1787 *
sudo zip -r ../release.zip .
sudo chmod 777 ../release.zip


#Empty temp folder for next time
cd /home/amzad/dev/theroyals/Deploy/temp; pwd;
sudo rm -rf *;

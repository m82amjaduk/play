#!/bin/sh
#   ../sql/DeployDB.sh

NOW=$(date +'%Y-%m-%d-%T');
PASS='amzad123';

#mysql -uroot -p$PASS   drop database theroyals;
#mysql -uroot -p$PASS   create  database theroyals;


echo "CMS Importing";
mysql -uroot -p$PASS  theroyals <  ~/dev/theroyals/sql/cms.sql
echo "cwaiter Importing ";
mysql -uroot -p$PASS theroyals <  ~/dev/theroyals/sql/cwaiter.sql
echo "ion_auth Importing";
mysql -uroot -p$PASS theroyals <  ~/dev/theroyals/sql/ion_auth.sql
echo "paypal Importing";
mysql -uroot -p$PASS theroyals <  ~/dev/theroyals/sql/paypal.sql

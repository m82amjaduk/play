#!/bin/bash
#http://stackoverflow.com/questions/562457/search-for-all-occurrences-of-a-string-in-a-mysql-database
IFS='
'
DBUSER=root
DBPASS=dbread
echo -n "Which database do you want to search in (press 0 to see all databases): "
read DB
echo -n "Which string do you want to search: "
read SEARCHSTRING
for i in `mysql $DB -u$DBUSER -p$DBPASS -e "show tables" | grep -v \`mysql $DB -u$DBUSER -p$DBPASS -e "show tables" | head -1\``
do
for k in `mysql $DB -u$DBUSER -p$DBPASS -e "desc $i" | grep -v \`mysql $DB -u$DBUSER -p$DBPASS -e "desc $i" | head -1\` | grep -v int | awk '{print $1}'`
do
if [ `mysql $DB -u$DBUSER -p$DBPASS -e "Select * from $i where $k='$SEARCHSTRING'" | wc -l` -gt 1 ]
then
echo " Your searchstring was found in table $i, column $k"
fi
done
done
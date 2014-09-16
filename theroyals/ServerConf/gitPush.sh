# ../ServerConf/gitPush.sh WIP-
# On a branch first push need to mention the branch eg. git push origin BRACNH_NAME

MESSAGE=$1;

echo $MESSAGE;


echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> git status ";
git status
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> git add .";
git add .
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> git commit -a -m $MESSAGE";
git commit -a -m "$MESSAGE"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> git push origin ";
git push origin

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> $MESSAGE  ";
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> git status ";
git status


# Need to add each file separately when added...

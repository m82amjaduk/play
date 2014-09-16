<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 28/08/14
 * Time: 21:20
 */

include 'inc/nav.php';

#######################################################
# Please edit this file in   /home/amzad/dev/theroyals/src/UPDATE/deleteFiles.php
#######################################################

$path ="/home/$siteCode/public_html/";

$dir = array (
    'application',
    'menu',
    'resources',
    'system'
);

deleteDir($path.$dir[0]);
deleteDir($path.$dir[1]);
deleteDir($path.$dir[2]);
deleteDir($path.$dir[3]);

echo 'Success';

?>
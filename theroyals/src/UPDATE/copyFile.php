<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 28/08/14
 * Time: 21:20
 */

include 'inc/nav.php';

$version    = $_REQUEST['v'];
$email      = $_REQUEST['e'];
$versionDir = 'http://allinepos.co.uk/clientsRemoteUpdate/cwaiter/menu/';
#######################################################
# Please edit this file in   /home/amzad/dev/theroyals/src/UPDATE/dirList.php
#######################################################



$file = $versionDir.$version.'.zip';
echo $file; //exit;
$newfile = 'tem.zip';
    if ( copy($file, $newfile) ) {
        echo "<br />YES!!! Copy Succeeded!";
    }else{
        echo "<br />NO!!! Copy Failed.";
    }
//  exit;
////////////Now Unzip////////////////////////////////////////////////
$zip = new ZipArchive;
if ($zip->open('tem.zip') === TRUE) {
    $zip->extractTo('../');
    $zip->close();
    echo '<br />YES!!! Unzip Succeeded';
} else {
    echo '<br />NO!!! Unzip Failed';
}
////////////Delete////////////////////////////////////////////////////
if (unlink($newfile))
    echo "<br />YES!!!  Unlink Succeeded";
else
    echo "<br />NO!!! Unlink Failed";      //  */




?>
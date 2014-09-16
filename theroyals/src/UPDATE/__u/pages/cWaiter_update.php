<?
include '../inc/functions.php'; 
access();     
$version = get_version('cwaiter');
echo 'cwaiter Version : '.$version;
?>



<?php       
///// Copy  //////////////////////////////////////////////////////
$file = 'http://allinepos.co.uk/cu/cWaiter/'.$version.'.zip';
//echo $file; exit;
$newfile = 'tem.zip';
    if ( copy($file, $newfile) ) {
        echo "<br />YES!!! Copy Succeeded!";
    }else{
        echo "<br />NO!!! Copy Failed.";
    }
 // exit;  
    ////////////Now Unzip////////////////////////////////////////////////
$zip = new ZipArchive;
if ($zip->open('tem.zip') === TRUE) {
    $zip->extractTo('../../');
    $zip->close();
  echo '<br />YES!!! Unzip Succeeded';
} else {
    echo '<br />NO!!! Unzip Failed';
}  
 ///Delete//////////////////////////////////////////////////
if (unlink($newfile))
  echo "<br />YES!!!  Unlink Succeeded";
else 
  echo "<br />NO!!! Unlink Failed";      //  */
?>





<?  go_back();     ?>
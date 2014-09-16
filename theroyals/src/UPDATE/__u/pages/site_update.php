<?
include '../inc/functions.php'; 
access();
$id = get_template(); 
echo 'Template ID : '.$id;
?>




<?php       
///// Copy  //////////////////////////////////////////////////////
$file = 'http://allinepos.co.uk/cu/cwTemplate/'.$id.'.zip';
$newfile = 'tem.zip';  
    if ( copy($file, $newfile) ) {
        echo "<br />YES!!! Copy Succeeded!";
    }else{
        echo "<br />NO!!! Copy Failed.";
    }
    
    ////////////Now Unzip////////////////////////////////////////////////
$zip = new ZipArchive;
if ($zip->open('tem.zip') === TRUE) {
    $zip->extractTo('../');
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


<? go_back(); ?>
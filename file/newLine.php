<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 13/07/2015
 * Time: 14:16
 */
date_default_timezone_set("Europe/London");
$file ="test.txt";
echo 'File Size : '.filesize($file);


$fileData = file($file);
$totalLine = count($fileData);
echo "<br /> Total Line : " .$totalLine;

$fp = fopen($file, 'a');
for ($i=0; $i<10; $i++){
    fwrite($fp, ($totalLine + $i).">>>".date('H:i:s')."<<<<< \n");
}


$fileData = file($file);
$totalLineAfter = count($fileData);
echo "<br /> Total Line : " .$totalLineAfter;

if ($totalLineAfter > $totalLine ){
    echo "<br />".($totalLineAfter - $totalLine). " lines added.";
    for ($i=$totalLine; $i<$totalLineAfter; $i++){
        echo "<br />".$fileData[$i];
    }
}
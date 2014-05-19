<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 29/04/14
 * Time: 13:15
 */

// copy  copyXmlIf\new\*  copyXmlIf\xmls\

$dir = 'xmls/';
$newDir = 'new/';
date_default_timezone_set('UTC');
$movedFiles = $remainingFiles = array();

$dirArray = getFileList ($dir);

foreach ($dirArray as $file){
    $state = checkStatus($dir.$file);
    $deleted = moveFile($file, $dir, $newDir, $state );
    if ($deleted) $movedFiles[] = $file;
    else $remainingFiles [] = $file;
}

print_r($movedFiles);
print_r($remainingFiles);

function checkStatus($fileName){
    $xml=simplexml_load_file($fileName);

    $updated = strtotime($xml->updated_at);
    $dueToMove = time() - (40*60);

//    echo $updated . ' - '.$dueToMove. ' >> ';
//    echo date('Y-m-d H:i:s', $updated).' - '. date('Y-m-d H:i:s', $dueToMove). '<br />';

    if (($xml->state == 'processing') && ( $updated < $dueToMove ))
        return  TRUE;
    else
        return FALSE;
}
function moveFile($file, $fromDir, $toDir, $state){
    if($state){
        copy($fromDir.$file, $toDir.$file);
        unlink($fromDir.$file);
        return TRUE;
    }
    else
        return FALSE;
}

function getFileList ($dir){
//  Open this directory
    $myDirectory = opendir($dir);

//  Get each entry
    while($entryName = readdir($myDirectory)) {
        $dirArray[] = $entryName;
    }
//  Close directory
    closedir($myDirectory);

//  Remove first 2 element from the array. and reindex
    unset($dirArray[0]);
    unset($dirArray[1]);
    $dirArray = array_values($dirArray);

    return $dirArray;
}


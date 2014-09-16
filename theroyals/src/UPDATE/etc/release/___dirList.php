<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 28/08/14
 * Time: 21:20
 */



if(substr($_SERVER['DOCUMENT_ROOT'], 6, 7) == 'amzad/d')
    die('I must Die, Else I will spoil everthing ... !!! ');
#######################################################
# Please edit this file in   /home/amzad/dev/theroyals/src/UPDATE/dirList.php
#######################################################

header('Content-Type: application/json');
$path    = '.';

$files = directoryToArray($path, true);     // Get the files list recursively
$files = getFileName($files);               // Remove dir structure from the path get the file names
$files = removeFileExtention($files);       // Remove Extention from the file name ..

echo json_encode($files);



/////////////////////////////////////////////////////////////////

/*
 * Get file name from path ..
 */
function getFileName($files){
    $newFiles=array();
    foreach ($files as $file){
        $newFiles[] = basename($file);
    }
    return $newFiles;
}

/*
 * Remove File Extention from the file name ..
 */
function removeFileExtention($files){
    $newFiles=array();
    foreach ($files as $file){
        $newFiles[] = $withoutExt = preg_replace('/\\.[^.\\s]{3,4}$/', '', $file);
    }
    return $newFiles;
}

/*
 * List Dir recursive ...
 */
function directoryToArray($directory, $recursive) {
    $array_items = array();
    if ($handle = opendir($directory)) {
        while (false !== ($file = readdir($handle))) {
            if ($file != "." && $file != "..") {
                if (is_dir($directory. "/" . $file)) {
                    if($recursive) {
                        $array_items = array_merge($array_items, directoryToArray($directory. "/" . $file, $recursive));
                    }
                    $file = $directory . "/" . $file;
                    $array_items[] = preg_replace("/\/\//si", "/", $file);
                } else {
                    $file = $directory . "/" . $file;
                    $array_items[] = preg_replace("/\/\//si", "/", $file);
                }
            }
        }
        closedir($handle);
    }
    return $array_items;
}


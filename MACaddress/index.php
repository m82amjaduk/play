<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 20/06/14
 * Time: 12:15
 *
 * This is not a approved method .. !!!
 */

function getMac(){

    exec("ipconfig /all", $output);
//    echo '<pre>';  print_r($output);

    foreach($output as $line){

        if (preg_match("/(.*)Physical Address(.*)/", $line)){
            $mac = $line;
            $mac = str_replace("Physical Address. . . . . . . . . :","",$mac);
        }

    }
    return $mac;

}

$mac = getMac();

echo $mac = trim($mac);

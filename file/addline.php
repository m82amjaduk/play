<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 09/10/2015
 * Time: 09:35
 */

$file = 'addline.csv';
$header = "Name, IP,  host, RAM, Task, NS \r\n";
$data = file_get_contents($file);
file_put_contents($file, $header.$data);


$data = file_get_contents($file);
print_r($data);
<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 19/05/14
 * Time: 12:20
 */

$list = array (
    array('aaa', 'bbb', 'ccc', 'dddd'),
    array('123', '456', '789'),
    array('"aaa"', '"bbb"')
);

$fp = fopen('file.csv', 'w');

foreach ($list as $fields) {
    fputcsv($fp, $fields);
}

fclose($fp);
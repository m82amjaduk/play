<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 25/07/14
 * Time: 14:51
 */
$url ="https://maps.googleapis.com/maps/api/distancematrix/json?origins=GU215ed&destinations=n90dy&mode=driving&language=en-GB&v=3&sensor=false";
$data = @file_get_contents($url);


$data = json_decode($data );
//
echo '<pre>';
print_r($data);

echo '===========================';
//print_r($data->origin_addresses[0]);
echo '<br />';
print_r($data->rows[0]->elements[0]->distance->text);
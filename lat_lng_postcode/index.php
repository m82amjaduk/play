<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 16/07/14
 * Time: 14:47
 *
 * http://learning7.lc/lat_lng_postcode/
 *
 *
 */

$url ="http://maps.googleapis.com/maps/api/geocode/json?address=GU215ED&sensor=false";
$data = @file_get_contents($url);
$data = json_decode($data );
echo date('Y m d, H:i:s');
print"<pre>";
echo $data->results[0]->geometry->bounds->northeast->lat;
echo $data->results[0]->geometry->bounds->northeast->lng;
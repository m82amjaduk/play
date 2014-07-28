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
//http://learning7.lc/lat_lng_postcode/index.php?adress=GU215ED

$address = ($_GET["address"]) ? $_GET["address"] : 'London';


$url ="http://maps.googleapis.com/maps/api/geocode/json?address=$address&sensor=false";
$data = @file_get_contents($url);
$data = json_decode($data );
echo date('Y m d, H:i:s');

echo '<br />'.$address;
print"<pre>";
echo $data->results[0]->geometry->bounds->northeast->lat;
echo '<br />';
echo $data->results[0]->geometry->bounds->northeast->lng;
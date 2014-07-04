<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 02/07/14
 * Time: 12:39
 */
$postcode1='GU215ED';
$postcode2='GU215AH';
$result = array();

$url = "http://maps.googleapis.com/maps/api/distancematrix/json?origins=$postcode1&destinations=$postcode2&mode=driving&language=en-EN&sensor=false";

$data = @file_get_contents($url);
echo $data;
$result = json_decode($data, true);
//echo '<pre>';
//print_r($result);

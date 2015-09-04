<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 13/08/2015
 * Time: 11:35
 */


/*
 * $unit = M, K, N, F
 */
function distance($lat1, $lon1, $lat2, $lon2, $unit) {

    $theta = $lon1 - $lon2;
    $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
    $dist = acos($dist);
    $dist = rad2deg($dist);
    $miles = $dist * 60 * 1.1515;
    $unit = strtoupper($unit);

    if ($unit == "K") {             // Distance in Kilo Meters
        return ($miles * 1.609344);
    } else if ($unit == "N") {      // Distance in nautical mile
        return ($miles * 0.8684);
    } else if ($unit == "F") {      // Distance in Feet
        return ($miles * 1760);
    } else {
        return $miles;
    }
}

function getLatLng($address){
    $coordinates = file_get_contents('http://maps.googleapis.com/maps/api/geocode/json?address=' . urlencode($address) . '&sensor=true');
    $coordinates = json_decode($coordinates);

    return (object)array(
        'lat' => $coordinates->results[0]->geometry->location->lat,
        'lng' => $coordinates->results[0]->geometry->location->lng
    );
}


/*
 *  Check if requested value with in a range.
 *  @pram int $value    // Value to check
 *  @pram int $start    // 1st Number in range
 *  @pram int $end      // last Number in range
 *
 *  %return string
 *  Sample Call :: $this->inRange($value, $start, $end);
 */
function inRange($value, $start, $end ){
    return ( in_array( $value , range( $start , $end ) ) ) ?  true : false;
}

// Validate Post Code ...
// lat lng Finder ...
// Add note can not leave gap or overlap !!

$source = getLatLng('United Kingdom, GU215AH');
$dest = getLatLng('United Kingdom, GU215DT');
$distance =  distance($source->lat, $source->lng, $dest->lat, $dest->lng, "F") ;
echo $distance ." Feet<br>";
echo $distance = (int)$distance;
echo "<br />".inRange($distance, 0, 5000);
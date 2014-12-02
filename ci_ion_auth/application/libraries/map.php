<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
* Name:  Ion Auth
*
* Version: 2.5.2
*
* Author: Amzad Mojumder
*		  amzadfof@gmail.com
*         @m82amjad
*
* Added Awesomeness: Phil Sturgeon
*
* Location: http://github.com/benedmunds/CodeIgniter-Ion-Auth
*
* Created:  10.01.2009
*
* Description:  Modified auth system based on redux_auth with extensive customization.  This is basically what Redux Auth 2 should be.
* Original Author name has been kept but that does not mean that the method has not been modified.
*
* Requirements: PHP5 or above
*
*/

class Map{

    public function __construct() {
        // Its empty still now ..
    }

    /*
     * Get lat and lng from address
     * $res = $this->getLngLat('GU215ED'); $res->lat; $res->lng;
     */
    public function getLngLat($address='GU215ED'){
        $method     = 'http://maps.googleapis.com/maps/api/geocode';
        $url        = $method."/json?address=$address&sensor=false";
        $data       = @file_get_contents($url);
        $data       = json_decode($data );
        $dataRes    = array(
            'lat' => $data->results[0]->geometry->bounds->northeast->lat,
            'lng' => $data->results[0]->geometry->bounds->northeast->lng
        );
        if($data->status != 'OK') error_log(__FILE__ . __LINE__ . "FAILED:: $method");
        return (object)$dataRes;
    }

    /*
     * Calculate distance between two Address.
     * mode = walking / driving / bicycling
     */
    public function getDistanceByAddress($destination='GU215ED', $origin='N90AY', $mode='walking'){
        $method     = 'https://maps.googleapis.com/maps/api/distancematrix';
        $url        = $method."/json?origins=".$destination."&destinations=".$origin."&mode=".$mode."&language=en-GB&v=3&sensor=false";
        $data       = @file_get_contents($url);
        $data       = json_decode($data );
        $dataRes = array (
            'distance_meter'    => $data->rows[0]->elements[0]->distance->value
            , 'distance_mile'   => ( $data->rows[0]->elements[0]->distance->value *0.000621371192237)
            , 'duration_sec'    => $data->rows[0]->elements[0]->duration->value
            , 'distance'        => $data->rows[0]->elements[0]->distance->text
            , 'duration'        => $data->rows[0]->elements[0]->duration->text
            , 'destination'     => $data->destination_addresses[0]
            , 'origin'          => $data->origin_addresses[0]
        );
        if($data->status != 'OK') error_log(__FILE__ . __LINE__ . "FAILED:: $method");
        return (object)$dataRes;
    }



    public function getDistance($lat1, $lng1, $lat2, $lng2, $miles = true)
    {
        $pi80 = M_PI / 180;
        $lat1 *= $pi80;
        $lng1 *= $pi80;
        $lat2 *= $pi80;
        $lng2 *= $pi80;

        $r = 6372.797; // mean radius of Earth in km
        $dlat = $lat2 - $lat1;
        $dlng = $lng2 - $lng1;
        $a = sin($dlat / 2) * sin($dlat / 2) + cos($lat1) * cos($lat2) * sin($dlng / 2) * sin($dlng / 2);
        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));
        $km = $r * $c;

        return ($miles ? ($km * 0.621371192) : $km);
    }


    /******************************************************************
     * End Of file .....
     */
}

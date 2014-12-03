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
        $dataJson   = @file_get_contents($url);
        $data       = json_decode($dataJson );
        if ($data->status == 'ZERO_RESULTS')
            return (object)array('lat' => 0, 'lng'=> 0 );

        $dataRes    = array(
            'lat' => $data->results[0]->geometry->bounds->northeast->lat,
            'lng' => $data->results[0]->geometry->bounds->northeast->lng
        );
        if($data->status != 'OK') error_log(__FILE__ . __LINE__ . "FAILED:: method >> $method >> $dataJson" );
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
            , 'distance_feet'   => ( $data->rows[0]->elements[0]->distance->value *0.000621371192237)*5280
            , 'duration_sec'    => $data->rows[0]->elements[0]->duration->value
            , 'distance'        => $data->rows[0]->elements[0]->distance->text
            , 'duration'        => $data->rows[0]->elements[0]->duration->text
            , 'destination'     => $data->destination_addresses[0]
            , 'origin'          => $data->origin_addresses[0]
        );
        if($data->status != 'OK') error_log(__FILE__ . __LINE__ . "FAILED:: $method");
        return (object)$dataRes;
    }



    public function getDistance($lat1, $lng1, $lat2, $lng2)
    {
        $pi80 = M_PI / 180;
        $lat1 *= $pi80;
        $lng1 *= $pi80;
        $lat2 *= $pi80;
        $lng2 *= $pi80;

        $r = 6372.797; // Mean radius of Earth in km
        $dlat = $lat2 - $lat1;
        $dlng = $lng2 - $lng1;
        $a = sin($dlat / 2) * sin($dlat / 2) + cos($lat1) * cos($lat2) * sin($dlng / 2) * sin($dlng / 2);
        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));
        $km = $r * $c;

        $dataRes = array (
            'km'        => $km
            , 'meter'   => ($km/1000)
            , 'mile'    => ($km * 0.621371192)
            , 'yard'    => ($km * 0.621371192)*1760
            , 'feet'    => ($km * 0.621371192)*5280
        );
        return (object)$dataRes;
    }


    /*
        * Check if requested time is with in a range.
        * @pram int $value // Value to check
        * @pram int $start // 1st Number in range
        * @pram int $end // last Number in range
        *
        * %return string
        * Sample Call :: $this->inRange($value, $start, $end); *
        */
    public function inRange($value, $start, $end ){
        return ( in_array( $value , range( $start , $end ) ) ) ? true : false;
    }

    /*
        * Check if requested time is with in a range.
        * @pram int $data           // array of delevery charge
        * @pram int $distance       // 1st Number in range
        * @pram int $defaultCharge  // Return default charge if not found
        *
        * %return float
        * Sample Call :: $this->getCharge($data, $distance, $defaultCharge ); *
        */
    public function getDeliveryCharge($data, $distance, $defaultCharge=2.01 ){
        if( $distance >  end($data)->distance_to || $distance < 0 ){
            $log = "out_of_range_$distance";
            error_log($log);
            return $log;
        };


        /*  This function should set in model ... */


        foreach ($data as $row){ // echo (int)$row->distance_from . ' >>> ' . (int)$row->distance_to . '<br />';
            if($this->inRange((int)$distance, (int)$row->distance_from, (int)$row->distance_to) == true ) {
                return $row->charge;
            }
        }
        error_log("$distance Sent Default Delivery Charge ");
        return $defaultCharge; // Default Del Charge ..
    }






    /******************************************************************
     * End Of file .....
     */
}


/*


CREATE TABLE `services_delivery_charge` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(1) NOT NULL DEFAULT '0',
	`distance_from` DECIMAL(9,4) NULL DEFAULT NULL,
	`distance_to` DECIMAL(9,4) NULL DEFAULT NULL,
	`charge` DECIMAL(7,2) NULL DEFAULT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `id` (`id`)
)
COMMENT='Delivery CHarges'
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=7;

REPLACE INTO `services_delivery_charge` (`id`, `login_id`, `updated`, `active`, `distance_from`, `distance_to`, `charge`) VALUES
	(00000000001, 1, '2014-11-11 16:00:34', 1, 0.0000, 0.5000, 1.50),
	(00000000002, 1, '2014-11-11 16:11:11', 1, 0.5001, 1.0000, 2.00),
	(00000000003, 1, '2014-11-11 16:11:18', 1, 1.0001, 2.5000, 3.00),
	(00000000004, 1, '2014-11-11 16:02:12', 1, 2.5001, 3.0000, 3.50),
	(00000000005, 1, '2014-11-11 16:02:23', 1, 3.0001, 4.0000, 4.50),
	(00000000006, 1, '2014-11-11 16:14:29', 1, 1.5001, 3.5000, 2.50);


SELECT
distance_from*5280 AS distance_from,
distance_to*5280 AS distance_to,
charge
FROM services_delivery_charge
WHERE active=1 ORDER BY distance_from ASC



 */
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

date_default_timezone_set("Europe/London");
ini_set('display_errors', 1);
ini_set('memory_limit', '512M');
ini_set('error_log','var/log/errorPhp.log');


class Offers extends CI_Controller {

    private $_debug = false; // (ENVIRONMENT == 'development') ? true : false;
    private $_successMessage    = 'Code Accepted.';
    private $_failedMessage     = 'Invalid Code.';


    /*
     * http://play.lc/ci_ion_auth/index.php/offers/index
     */
    public function index() {
        echo '<h1> Welcome To Offers, All In ePOS </h1>';
    }

    /*
     * http://play.lc/ci_ion_auth/index.php/offers/get/alLinePOs/1412442000/10/collection_delivery
     */
    public function get($code='alLinePOs', $receivingTime='1452568000', $orderValue=10, $receiving='collection_delivery') {
        $this->load->database();

        $msg = $resultSuccess = array();
        $applyDiscount  = $discount = $discountedAmount = 0.00 ;
        $timeValidated  = false;

//        $receivingTime = strtotime('next saturday') ;
//        $receivingTime = $receivingTime + 64800 ;
        $receivingTimeHuman = date('Y-m-d H:i:s', $receivingTime);
        $code               = strtoupper($code);

        $input = array (
            'code'              => $code,
            'receivingTime'     => $receivingTime ,
            'receivingTimeHuman'=> $receivingTimeHuman ,
            'orderValue'        => $orderValue,
            'receiving'         => $receiving
        );

        $this->db->select('*') ->from('offers') ->where('offer_code', $code);
        $offer  =  $this->db->get()->row() ;
//        print_r($offer); exit;


        $data['result'] = array (
            'status'            => 'OK',
            'message'           => $this->_failedMessage,
            'code'              => $code,
            'applyDiscount'     => $applyDiscount,
            'error'             => array("Entered Invalid Code $code. Please try again.")
        );
        if ($this->_debug == true)
            $data['intput'] = $input;

        if(empty($offer)){
            $msg[] = "Offer Code $code is not valid. ";
        }
        else{
            $this->db->select('day, from_, to_') ->from('offer_time_validity') ->where('offer_id', $offer->id);
            $timeData  =  $this->db->get()->result() ;

            if($offer->active != 1 )
                $msg[] = "Offer is not active yet.";

            if(strtotime($offer->start_date) > $receivingTime)
                $msg[] = "Offer is not valid yet, please try after $offer->start_date.";

            if(strtotime($offer->end_date) < $receivingTime)
                $msg[] = "Offer expired on $offer->end_date.";

            if($offer->receiving != $receiving )
                $msg[] = "Offer is not valid for $receiving.";

            if($offer->min_value > $orderValue )
                $msg[] = "Does not meet Minimum Order Value (£$offer->min_value).";


            if($offer->time_check == 1){
                $timeValidated = $this->validTime($receivingTime, $timeData);
                if($timeValidated != true )
                    $msg[] = " Is not valid on ". date('D H:i:s d M Y', $receivingTime).".";
            }

            if(empty($msg)){
                $summary            = $this->_successMessage;
                $applyDiscount      = 1;

                $discount           = $this->_calcDiscount($orderValue, $offer->cw_discount_percentage, $offer->store_discount_percentage, $offer->cw_discount_amount, $offer->store_discount_amount );
                $discountedAmount   = $orderValue - $discount;
            }else{
                $summary            = $this->_failedMessage;
            }
            $resultSuccess = array(
                'title'             => $offer->title,
                'summary'       => $offer->summary,
                'discount'          => $discount,
                'discountedAmount'  => $discountedAmount,
                'applyDiscount'     => $applyDiscount,
                'message'           => $summary,
                'error'             => $msg,
                'timeValidated'     => $timeValidated
            );

            $result = array_merge($data['result'], $resultSuccess);

            $offer->time    = $timeData;
            $offer->result  = $result;
            $offer->input   = $input;
            if ($this->_debug == true) {
                $data = $offer;
            }else {
                $data['result'] = $result;
            }
        } // Code Valid ENDS


        header('Content-Type: application/json');
        echo json_encode($data);
    }

    /*
     *  Calcualte Discount Amount
     *  @pram   float $orderValue
     *  @pram   float $percentage1
     *  @pram   float $percentage2
     *  @pram   float $amount1
     *  @pram   float $amount2
     *
     *  @return float $discount
     *  Sample Call :: $this->_calcDiscount($orderValue, $percentage1, $percentage2, $amount1, $amount2 );
     */
    private function _calcDiscount($orderValue, $percentage1, $percentage2, $amount1, $amount2 ){
        $totalPercentage    = $percentage1 + $percentage2;
        $discountPercentage = ($totalPercentage == 0.00 )? 0 : (($orderValue*$totalPercentage)/100);
        return  $discountPercentage + $amount1 + $amount2;
    }

    /*
     *  Find valid time from a time collection
     *  @pram int           $input          // Input time
     *  $pram collection    $data           // Time Collection
     *
     *  @return bool
     *  Sample Call :: $this->validTime($input, $Data)
     */

    public function validTime($input, $data){
        foreach ($data as $time ){
            if ($time->day == date('D', $input)){
                $from   = $this-> hrsToSec($time->from_);
                $to     = $this-> hrsToSec($time->to_);
                $value  = $this->timeNoDate( $input, 'sec');
                if ($this->inRange($value, $from, $to ) == true)
                    return true;
            }
        }
        return false;
    }

    /*
     *  Check if requested time is with in a range.
     *  @pram int $value    // Value to check
     *  @pram int $start    // 1st Number in range
     *  @pram int $end      // last Number in range
     *
     *  %return string
     *  Sample Call :: $this->inRange($value, $start, $end);     *
     */
    public function inRange($value, $start, $end ){
        return ( in_array( $value , range( $start , $end ) ) ) ?  true : false;
    }


    /*
     *  Convert a 24hrs fromate time to Sec.
     *  @pram string $input     // 24Hrs time eg 18:00
     *
     *  @return int $sec        // Time in sec
     *  Sample Call :: $this-> hrsToSec($input);
     */
    public function hrsToSec($input){
        $mn     = explode(":",$input);
        $min    = ($mn[0]*60) + $mn[1] ;
        $sec    = $min * 60;
        return $sec;
    }


    // Hours::
    public function timeNoDate($time, $type=NULL) {
        $day = date( 'Y-m-d', $time);
        $day = strtotime($day); //echo $day.'>>';
        $sec = $time - $day;
        $x_sec = $sec%60;
        $minute = ($sec-$x_sec) / 60;
        $x_min = $minute%60;
        $hour = ($minute-$x_min) / 60; //echo $sec.'-'.$x_sec.'-'.$minute.'-'.$x_min.'-'.$hour; exit;
        if($type == 'sec') return $sec;
        else if($type == 'min') return $minute;
        else if($type == 'hor') return $hour;
        else return $this->cm->minute_to_hour($hour);
    }

    //////////////////////////////////////////////////////////////////////
    /* End of file migration.php */
    /* Location: ./application/controllers/migration.php */

}/*

CREATE TABLE `offer_time_validity` (
`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11) NULL DEFAULT '1',
	`offer_id` INT(11) NULL DEFAULT '1',
	`day` VARCHAR(16) NULL DEFAULT 'Sat',
	`from_` VARCHAR(5) NULL DEFAULT '18:00',
	`to_` VARCHAR(5) NULL DEFAULT '23:00',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `id` (`id`)
)
COMMENT='###'
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
AUTO_INCREMENT=0;*/

/*
INSERT INTO `offer_time_validity` (`id`, `login_id`, `updated`, `active`, `offer_id`, `day`, `from_`, `to_`) VALUES
(00000000001, 1, '2014-10-01 09:53:22', 1, 1, 'Mon', '17:30', '23:59'),
	(00000000002, 1, '2014-10-01 09:53:57', 1, 1, 'Tue', '17:30', '23:59'),
	(00000000003, 1, '2014-10-01 09:54:07', 1, 1, 'Wed', '17:30', '23:59'),
	(00000000004, 1, '2014-10-01 09:54:30', 1, 1, 'Thu', '17:30', '23:59'),
	(00000000005, 1, '2014-10-01 09:54:40', 1, 1, 'Fri', '17:30', '23:59'),
	(00000000006, 1, '2014-10-01 09:54:51', 1, 1, 'Sat', '17:30', '23:59'),
	(00000000007, 1, '2014-10-01 09:55:02', 1, 1, 'Sun', '17:30', '23:59');

INSERT INTO `offers` (`id`, `login_id`, `updated`, `active`, `sn`, `offer_code`, `title`, `summary`, `start_date`, `end_date`, `product_include`, `product_exclude`, `product_exclude_meal_deal`, `offers_page_show`, `offers_page_description`, `offers_page_terms`, `offers_page_readmore_link`, `email_template`, `admin_message`, `min_value`, `cw_discount_percentage`, `store_discount_percentage`, `cw_discount_amount`, `store_discount_amount`, `receiving`, `code_require`, `maximum_use`, `time_check`, `apply_loyalty_points`) VALUES
	(00000000001, 1, '2014-10-01 09:41:50', 1, 1, 'ALLINEPOS', 'New', 'New', '2014-10-02 09:39:57', '2014-10-31 09:39:57', '#', '#', 0, 1, NULL, NULL, 'takeaway/menu/6', NULL, NULL, 10.00, 2.00, 2.00, 3.00, 1.00, 'collection_delivery', 1, -2, 1, 1);



*/



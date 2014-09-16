<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * HOurs Class
 *
 * Debug Tools library for CodeIgniter
 *
 * @category	Libraries
 * @author		Amzad Mojumder
 * @link		##
 * @license		MIT
 * @version		01.00.01
 */

class Hours {

//    private $_cart;
//    private $_totalPrice;

    public function __construct() {
        $this->CI =& get_instance();
        // Load the Sessions class
        $this->CI->load->library('session' );
    }


    /*  *
             *  Get Local Time
             *  @access	public
             *
             *  @return int
             *  $this->hours->localTime();
             */

    public function localTime($unix_time=NULL) {
        $unix_time = ($unix_time)? $unix_time : now();
        //Need to automate when extra time to add. there is
        $summerMonths = array (4,5,6,7,8,9,10);
        if (in_array(date('n'), $summerMonths) )
            $unix_time += 3600;
        return $unix_time;
    }

    /*  *
             *  From a Unix time value check if it is today ?
             *  @access public
             *
             *  @return boolean
             *  $this->hours->itsToday($time)
             */
    function itsToday($time) {
        $day = date( 'Y-m-d', $time);
        $day_input = strtotime($day);

        $day_now = date( 'Y-m-d', $this->localTime());
        $day_now = strtotime($day_now);  //echo $day_now.'>>'.$day_input; exit;

        return ($day_now == $day_input)? TRUE : FALSE;
    }

    /*  *
             *  from a unix time get date only remove and added time.
             *  @access public
             *
             *  @return int
             *  $this->hours->dateNoTime($time, $format=NULL) // type =  'dMy', 'd-m-y', 'H:i, DMY',
             */
    function dateNoTime($time, $format=NULL) {
        $day = date( 'Y-m-d', $time);
        $day = strtotime($day);
        if($format)
            return date($format, $day);
        else
            return $day;
    }

    /*  *
             *  from a unix time get addred time and remove date.
             *  @access public
             *
             *  @return int
             *  this->cm->timeNoDate($time, $type=NULL) // type =  hour, min, sec, hour_min
             */
    public function timeNoDate($time, $type=NULL) {
        $day = date( 'Y-m-d', $time);
        $day = strtotime($day); //echo $day.'>>';
        $sec = $time - $day;

        $x_sec = $sec%60;
        $minute = ($sec-$x_sec) / 60;

        $x_min = $minute%60;
        $hour = ($minute-$x_min) / 60;  //echo $sec.'-'.$x_sec.'-'.$minute.'-'.$x_min.'-'.$hour; exit;

        if($type ==  'sec') return $sec;
        else if($type ==  'min') return $minute;
        else if($type == 'hor') return $hour;
        else return $this->cm->minute_to_hour($hour);
    }


    /*  *
             *  from minute get hours ..
             *  @access public
             *
             *  @return int
             *  $this->hour->minuteToHour($minute)
             */
    function minuteToHour($minute) {
        $minute_ = $minute % 60;
        $hour = ($minute - $minute_) / 60;
        $hour = ($hour < 10 ) ? '0' . $hour : $hour;
        $minute_ = ($minute_ < 10 ) ? '0' . $minute_ : $minute_;
        $hour = $hour . ':' . $minute_;
        return $hour;
    }

    public function dayView ($unixTime=NULL){
        $unixTime = ($unixTime) ? $unixTime : now();
        $date  = date('d M Y :: l', $unixTime);
        return $date;
    }

    public function dayTimeView ($unixTime=NULL){
        $unixTime = ($unixTime) ? $unixTime : now();
        $dateTime  = date('D, d M Y H:m:s', $unixTime);  //Wed, 25 Sep 2013 15:28:57
        return $dateTime;
    }


    public function timeView ($sec){
        $_sec = $sec % 60;
        $min = ($sec - $_sec) / 60;
        return HOURS::minuteToHour($min);
    }
    ///////// End Of Common Function //////////////////////////////////////////////////////

    /* *
             *  Find only useful rows from all active rows.
             *  @access	public
             *
             *  @return  array
             *  $this->hours->getValidRow($open, 'collection');
             */
    public function getValidRow($open, $type=NULL, $day=NULL){
        $type = ($type) ? $type : 'collection';
        $newOpen = array();
        $newOpenDay = array();
        // Filter type ...
        foreach ($open as $row){
            if ($row->$type == 1){
                $newOpen[] = $row;
            }
        }
        // Filter day ...
        if ($day){
            foreach ( $newOpen as $row){
                if ($row->day == $day){
                    $newOpenDay[] = $row;
                }
            }
            $newOpen = $newOpenDay;
        }   //        echo '<pre>'; print_r($newOpen); exit;
        return $newOpen;
    }

    //$this->hours->openDaysList($open, 'collection');
    public function openDaysList($openOri, $type=NULL, $first=FALSE) {  // type = collection / delivery / sit_in
        $now = $this->localTime();
        $open = $this->getValidRow($openOri, 'collection');

        $waiting_time = ($this->waitingTimeCurrent($type) == -2) ? $this->waitingTime($open[0], $type) : $this->waitingTimeCurrent($type);
        $first_day = ($this->itsToday($now) == TRUE) ? ($now + $waiting_time): ($open[0]->from_ + $waiting_time );
        $day = $this->dateNoTime($first_day);

        if ($first==TRUE) return $day;  // Get first open day if required


        for ($i = 1; $i <= 30; $i++) {
            if ($this->dayOpen($day, $open) == TRUE)
                $days[] = array('day_bigint' => $day, 'day' => $this->dayView($day) );
            else
                $i--;
            $day = $day + 86400;
        }
        return $days;
    }

    /* *
             *  Produce list of open days option.
             *  @access	public
             *
             *  @return  string
             *  $this->hours->openDaysListOption($hours, 'collection');
             */
    public function openDaysListOption($hours, $type) {
        $days = $this->openDaysList($hours, $type);
        $options = NULL;
        foreach ($days as $row){
            $options .= '<option value="' . $row['day_bigint'] . '">' . $row['day'] . '</option>';
        }
        return $options;
    }


    public function dayOpen($day, $open) {
        foreach ($open as $row) {
            if (date('D', $day) == $row->day)
                return TRUE;
        }
        return FALSE;
    }

    /*  *
             *  Return waiting time for a time set
             *  $access private
             *
             * @return int
             *  $this->hours->waitingTime($open, 'collection');
             *  HOURS::waitingTime($open, 'collection');
             */
    private function waitingTime($open, $type) {
        if ($type == 'collection')
            $time = $open->waiting_collection;
        else if ($type == 'delivery')
            $time = $open->waiting_delivery;
        else if ($type == 'sit_in')
            $time = 0;
        else
            $time = 20;

        // NEED TO OVERWRITE IF ADJUSTABLE TIME IS LONGER THEN PRE-SET TIME, and if the order placed now.
        return $time;
    }

    /*
     *  Get list of time sets on a day
     *  @access public
     *
     *  @return array
     *  $this->hours->requestTimeList($hours, $day_bigint, 'collection');
     */

    public function requestTimeList($hours, $day_bigint, $type = NULL) {  // type = collection / delivery / sit_in
        $time = array();
        $interval = 15;
        $day_bigint = ($day_bigint) ? $day_bigint : $this->cm->localTime();

        $day = date('D', $day_bigint);
        $open = $this->getValidRow($hours, 'collection', $day); // echo '<pre>'; print_r($open); exit;


        foreach ($open as $row) {
            $start = $row->from_;
            $end = $row->to_;
            $wating_time = $this->waitingTime($row, $type); //echo $wating_time; exit;
            $max_loop = ($end - $start); // $interval;
            $t = $start + $wating_time;
            $t = $this->setQuarter($t);

            if ($this->itsToday($day_bigint) == TRUE) {
                $now_time = $this->timeNoDate($this->localTime(), 'min');
                $start = ($start < $now_time ) ? $now_time : $start;
                $waiting_time = ($this->waitingTimeCurrent($type) == -2)
                    ? $wating_time
                    : $this->waitingTimeCurrent($type);
                $t = $start + $waiting_time;
                $t = $this->setQuarter($t);
            }

            for ($i = 1; $i <= $max_loop; $i++) {
                if ($t > $end)
                    break;
                $sec = $t * 60;
                if($this->timeNoDate(HOURS::localTime(), 'sec') < $sec)
                    $time[] = array('time_sec' => $sec, 'time_view' => HOURS::timeView($sec));
                $t = $t + $interval;
//                echo $sec.'>>'.$t.'<br />' ; //exit;
            }
        }
//        $empty_time = array('time_sec' => -2 , 'time_view' => '25:00' );
        return $time; //($time)? $time : $empty_time;
    }

    /* *
             *  Produce list of available time option.
             *  @access	public
             *
             *  @return  string
             *  $this->hours->requestTimeListOption($hours, 'collection', $day);
             */
    public function requestTimeListOption($hours, $type, $day=NULL) {
        $dayArray = $this->openDaysList($hours, $type);
        $day = ($day)? $day : $dayArray[1]['day_bigint'];
        $hours = $this->requestTimeList($hours, $day, $type);
        $options = NULL;
        foreach ($hours as $row){
            $options .= '<option value="' . $row['time_sec'] . '">' . $row['time_view'] . '</option>';
        }
        return $options;
    }

    public function setQuarter($time){
        $minute = $time % 60;
        $hour = ($time - $minute);
        if ($minute == 0)
            $minute = 0;
        else if ($minute <= 15)
            $minute = 15;
        else if ($minute <= 30)
            $minute = 30;
        else if ($minute <= 45)
            $minute = 45;
        else if ($minute <= 59)
            $minute = 60;
        else
            $minute = $minute;

        return $hour+$minute;
    }


//    $this->takeawaym->waitingTimeCurrent('collection');
    public function waitingTimeCurrent($type) {
        return -2;
        /* if ($type == 'sit_in') return -2;
        $col = 'waiting_'.$type;
        $table = 'services_'.$type;
        $now = $this->localTime();
        $day = date('D', $now);
        $time =$this->dateNoTime($now, 'min');

        $this->db->where('to_ >=', $time);
        $this->db->where('from_ <=', $time);
        $this->db->where('day', $day);
        $this->db->where('active', 'Y');
        $this->db->where($type, 'Y');
        $this->db->select($col);
        $query = $this->db->get('services_opening_hours');
        $res = $query->row();
        if(!$res) return -2;

        $opening_hours =  $res->$col;

        $current_waiting_time = $this->cm->val($table, 'current_waiting_time');
        $waiting = ($current_waiting_time > $opening_hours) ? $current_waiting_time : $opening_hours;

        return $waiting; */
    }


    /*  NOT in USE now ..
//$this->takeawaym->day_open_first('sit_in');
public function day_open_first($day_bigint=NULL, $type=NULL) { // Find the first avaiable open date.
    $day_bigint = ($day_bigint) ? $day_bigint : $this->cm->time_local(now());
    $type = ($type) ? $type : 'collection';
    $where = array('active' => 'Y', 'sit_in' => 'Y');
    $open = $this->cm->where_ordered('services_opening_hours', $where, 'from_', 'day');

    $i=0;
    foreach ($open as $row) {
        echo date('D', $day_bigint). $row->day;
        if (date('D', $day_bigint) == $row->day){
            //return $day_bigint;
            echo $day_bigint.'<br />';
        }
        else {
            $day_bigint = $day_bigint+86400;
            $i++;
            //if ($i == 15) // after checking 15 days exit loop.
            //return FALSE;
        } //print_r($row); echo '<br /><br />';
    }
    return FALSE;
} */




    ###############################################
    /* End of file Cart.php */
    /* Location: ./application/libraries/Cart.php */
}


/*

DROP TABLE IF EXISTS `services_opening_hours`;
CREATE TABLE `services_opening_hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT UNIQUE ,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` bigint(20),
  `from_` bigint(20),
  `to_` bigint(20),
  `day` varchar(3),
  `collection` varchar(1)DEFAULT 'Y',
  `delivery` varchar(1) DEFAULT 'Y',
  `sit_in` varchar(1) DEFAULT 'Y',
  `waiting_collection` bigint(20) DEFAULT 15,
  `waiting_delivery` bigint(20) DEFAULT 45,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


-- Data ...
INSERT INTO services_opening_hours VALUES (13, 1, '2014-04-19 13:30:20' , 1, 13, 720, 840, 'Sat', 'Y', 'N', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (14, 1, '2014-04-19 13:30:20' , 1, 14, 720, 840, 'Sun', 'Y', 'N', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (12, 1, '2014-04-19 13:30:20' , 1, 12, 720, 840, 'Fri', 'Y', 'N', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (11, 1, '2014-04-19 13:30:20' , 1, 11, 720, 840, 'Thu', 'Y', 'N', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (10, 1, '2014-04-19 13:30:20' , 1, 10, 720, 840, 'Wed', 'Y', 'N', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (9, 1, '2014-04-19 13:30:20' , 1, 9, 720, 840, 'Tue', 'Y', 'N', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (8, 1, '2014-04-19 13:30:20' , 1, 8, 720, 840, 'Mon', 'Y', 'N', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (1, 7, '2014-04-19 13:30:20' , 1, 1, 1050, 1380, 'Mon', 'N', 'Y', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (2, 7, '2014-04-19 13:30:20' , 1, 2, 1050, 1380, 'Tue', 'N', 'Y', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (3, 7, '2014-04-19 13:30:20' , 1, 3, 1050, 1380, 'Wed', 'N', 'Y', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (4, 7, '2014-04-19 13:30:20' , 1, 4, 1050, 1380, 'Thu', 'N', 'Y', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (5, 7, '2014-04-19 13:30:20' , 1, 5, 1050, 1380, 'Fri', 'N', 'Y', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (6, 7, '2014-04-19 13:30:20' , 1, 6, 1050, 1380, 'Sat', 'N', 'Y', 'N', 15, 45);
INSERT INTO services_opening_hours VALUES (7, 7, '2014-04-19 13:30:20' , 1, 7, 1050, 1380, 'Sun', 'N', 'Y', 'N', 15, 45);


-- raw array
Array
(
    [0] => stdClass Object
        (
            [from_] => 720
            [to_] => 840
            [day] => Sun
            [collection] => Y
            [delivery] => N
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [1] => stdClass Object
        (
            [from_] => 720
            [to_] => 840
            [day] => Sat
            [collection] => Y
            [delivery] => N
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [2] => stdClass Object
        (
            [from_] => 720
            [to_] => 840
            [day] => Fri
            [collection] => Y
            [delivery] => N
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [3] => stdClass Object
        (
            [from_] => 720
            [to_] => 840
            [day] => Thu
            [collection] => Y
            [delivery] => N
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [4] => stdClass Object
        (
            [from_] => 720
            [to_] => 840
            [day] => Wed
            [collection] => Y
            [delivery] => N
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [5] => stdClass Object
        (
            [from_] => 720
            [to_] => 840
            [day] => Tue
            [collection] => Y
            [delivery] => N
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [6] => stdClass Object
        (
            [from_] => 720
            [to_] => 840
            [day] => Mon
            [collection] => Y
            [delivery] => N
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [7] => stdClass Object
        (
            [from_] => 1050
            [to_] => 1380
            [day] => Sun
            [collection] => N
            [delivery] => Y
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [8] => stdClass Object
        (
            [from_] => 1050
            [to_] => 1380
            [day] => Sat
            [collection] => N
            [delivery] => Y
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [9] => stdClass Object
        (
            [from_] => 1050
            [to_] => 1380
            [day] => Fri
            [collection] => N
            [delivery] => Y
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [10] => stdClass Object
        (
            [from_] => 1050
            [to_] => 1380
            [day] => Thu
            [collection] => N
            [delivery] => Y
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [11] => stdClass Object
        (
            [from_] => 1050
            [to_] => 1380
            [day] => Wed
            [collection] => N
            [delivery] => Y
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [12] => stdClass Object
        (
            [from_] => 1050
            [to_] => 1380
            [day] => Tue
            [collection] => N
            [delivery] => Y
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

    [13] => stdClass Object
        (
            [from_] => 1050
            [to_] => 1380
            [day] => Mon
            [collection] => N
            [delivery] => Y
            [sit_in] => N
            [waiting_collection] => 15
            [waiting_delivery] => 45
        )

)

 */

<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Cache Class
 *
 * Debug Tools library for CodeIgniter
 *
 * @category	Libraries
 * @author		Amzad Mojumder
 * @link		##
 * @license		MIT
 * @version		01.00.01
 */

class Tools
{
    /**
     * Print an array to view data
     *  @access	public
     *  @param array
     *  @param bool
     *  @return void
     *  $this->tools->pa($array);
     *  $this->tools->pa($array, FALSE); // Script Continues
     *  $this->tools->pa($array, TRUE); // dies here
     */

    public function pa($array, $die=TRUE){
        echo '<pre>';
        print_r($array);
        if ($die) die('Bye For Now....');
    }


    /**
     *  Start a time
     *  @access	public
     *  @param string  .. Test Name
     *  $this->load->library('tools');
     *  $this->tools->StartTimer('Test 1');
     */

    public function StartTimer($what = '')
    {
        global $MYTIMER;
        $MYTIMER = 0; //global variable to store time
        //if ($_SERVER['REMOTE_ADDR'] != '127.0.0.1') return; //only show for my IP address

        echo '<p style="border:1px solid black; color: black; background: yellow;">';
        echo "<i>$what</i>. ";
        flush(); //output this to the browser
        //$MYTIMER = microtime (true); //in PHP5 you need only this line to get the time

        list ($usec, $sec) = explode(' ', microtime());
        $MYTIMER = ((float)$usec + (float)$sec); //set the timer
    }

    /**
     *  Stop a time
     *  @access	public
     *  $this->load->library('tools');
     *  $this->tools->StopTimer( );
     */
    public function StopTimer()
    {
        global $MYTIMER;
        if (!$MYTIMER) return; //no timer has been started
        list ($usec, $sec) = explode(' ', microtime()); //get the current time
        $MYTIMER = ((float)$usec + (float)$sec) - $MYTIMER; //the time taken in milliseconds
        echo ': ' . number_format($MYTIMER, 6) . ' seconds.</p>';
        flush();
    }

    public function print_r_reverse($in) {
        $lines = explode("\n", trim($in));
        if (trim($lines[0]) != 'Array') {
            // bottomed out to something that isn't an array
            return $in;
        } else {
            // this is an array, lets parse it
            if (preg_match("/(\s{5,})\(/", $lines[1], $match)) {
                // this is a tested array/recursive call to this function
                // take a set of spaces off the beginning
                $spaces = $match[1];
                $spaces_length = strlen($spaces);
                $lines_total = count($lines);
                for ($i = 0; $i < $lines_total; $i++) {
                    if (substr($lines[$i], 0, $spaces_length) == $spaces) {
                        $lines[$i] = substr($lines[$i], $spaces_length);
                    }
                }
            }
            array_shift($lines); // Array
            array_shift($lines); // (
            array_pop($lines); // )
            $in = implode("\n", $lines);
            // make sure we only match stuff with 4 preceding spaces (stuff for this array and not a nested one)
            preg_match_all("/^\s{4}\[(.+?)\] \=\> /m", $in, $matches, PREG_OFFSET_CAPTURE | PREG_SET_ORDER);
            $pos = array();
            $previous_key = '';
            $in_length = strlen($in);
            // store the following in $pos:
            // array with key = key of the parsed array's item
            // value = array(start position in $in, $end position in $in)
            foreach ($matches as $match) {
                $key = $match[1][0];
                $start = $match[0][1] + strlen($match[0][0]);
                $pos[$key] = array($start, $in_length);
                if ($previous_key != '') $pos[$previous_key][1] = $match[0][1] - 1;
                $previous_key = $key;
            }
            $ret = array();
            foreach ($pos as $key => $where) {
                // recursively see if the parsed out value is an array too
                $ret[$key] = print_r_reverse(substr($in, $where[0], $where[1] - $where[0]));
            }
            return $ret;
        }
    }

    /**
     *  Start a time
     *  @access	public
     *  @param string     ... $data             Data To Log
     *  @param string     ... $fileLog         File Name to log data
     *  @param string     ... $useCode      User Code
     *  @param string     ... $ile                Source File
     *  @param int          ... $line              Source File  Line Number
     *  $this->load->logFileWrite($data);
     *  $this->load->logFileWrite($data, $fileLog='dev.log, $useCode='AAA1786', $file=NULL, $line=NULL);
     * $this->tools->logFileWrite($data, $fileLog='dev.log', $useCode='AAA1786', basename(__FILE__), __LINE__);
     */
    public function logFileWrite($data,  $fileLog='dev.log', $useCode='AAA1786', $file='E', $line=1){
        $fileLog = 'var/log/'.$fileLog;
        $row = date('Y-m-d').', '.date('H:i:s').', '.$useCode.', '.$_SERVER['REMOTE_ADDR'].', '.$data.', '.$file.', '.$line;
        if (($fd = fopen($fileLog, "a")) !== false) {
            fwrite($fd, $row . "\n");
            fclose($fd);
        }
    }



    /* End of file Tools.php */
    /* Location: ./application/libraries/Tools.php */
}



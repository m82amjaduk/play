<?
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 13/04/14
 * Time: 02:05
 */
if (!defined('BASEPATH')) exit('No direct script access allowed');

    if (!class_exists('CI_Model')) {
        class CI_Model extends Model {
        }
    }

    class Hoursm extends CI_Model {

        public function __construct() {
            parent::__construct();
            $this->load->database();
            $this->load->helper('cookie');
            $this->load->helper('date');
            $this->load->library('session');
        }

        /*
         * $this->takeawaym->getHours();
         */
        public function getHours(){
            $where = array('active' => 1);
            $col = 'from_, to_, day, collection, delivery, sit_in, waiting_collection, waiting_delivery';
            $hours = $this->cm->where_col_ordered('services_opening_hours', $where, $col, 'from_', 'asc');
            // TODO:: Need to user 24 Hrs format
            return $this->formatTime ($hours);
        }


        public function formatTime ($result){
            $newResult = array();
            foreach($result as $row){
                $row->from_ =  $this->hrsToNum($row->from_);
                $row->to_   =  $this->hrsToNum($row->to_);
                $newResult[] = $row;
            }
            return $newResult;
        }


        public function hrsToNum($input){
            $mn = explode(":",$input);
            $min = ($mn[0]*60) + $mn[1] ;
            return $min;
        }

        ////////////////////////////// The End //////////////////////////////////
    }
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

    class Dbm extends CI_Model { // Database Model

        public function __construct() {
            parent::__construct();
            $this->load->database();
        }

        /*
         *  Get a row .. !!
         *
         *  @access     public
         *
         *  $this->dbm->getRow('settings_business');
         */
        public function getRow($table = 'settings_business', $cache=1, $val=1, $filed='id', $col='*'){
            $cacheName = ($val==1 && $filed=='id')? "SETTINGS/$table" :  "SETTINGS/$table/$filed/$val";
            $cacheName = ( $col=='*') ? $cacheName : $cacheName.'/'.sha1($col);
            $data = $this->cache->get($cacheName);

            if (empty($data)){
                $this->db->select($col);
                $this->db->where($filed, $val);

                try{
                    $query = $this->db->get($table);
                    $data = ($query->num_rows > 0 ? $query->row() : array());
                    if($cache) {
                        $this->cache->write($data, $cacheName);
                        $this->tools->logFileWrite($cacheName, $fileLog = 'cache.log');
                    }
                } catch(Exception $e) {
                    $this->tools->logFileWrite('FAILED >> '.$cacheName, $fileLog='cache.log');
                    $this->tools->logFileWrite($e->getMessage(), $fileLog='cache.log');
                    echo 'Message: ' .$e->getMessage(); exit;
                }
            }
            return $data;
        }


        /*
         *  Get cwdp settings
         *
         *  @access     public
         *
         *  $this->dbm->getCollection('social_href');
         */

        function getCollection($table='social_href', $cache=1, $where=array('active'=> 1), $col='*', $orderedField='id', $orderedBy='asc') {
            $cacheName = "COLLECTION/$table/".sha1(json_encode($where).$col.$orderedField.$orderedBy);
            $data = $this->cache->get($cacheName);

            if (empty($data)){
                $this->db->select($col);
                $this->db->order_by($orderedField, $orderedBy);
                $this->db->where($where);

                try{
                    $query = $this->db->get($table);
                    $data = ($query->num_rows > 0 ? $query->result() : array());

                    if($cache){
                        $this->cache->write($data, $cacheName);
                        $this->tools->logFileWrite($cacheName, $fileLog='cache.log');
                    }
                } catch(Exception $e) {
                    $this->tools->logFileWrite('FAILED >> '.$cacheName, $fileLog='cache.log');
                    $this->tools->logFileWrite($e->getMessage(), $fileLog='cache.log');
                    echo 'Message: ' .$e->getMessage(); exit;
                }

            }
            return $data;
        }



        ////////////////////////////// The End //////////////////////////////////
    }
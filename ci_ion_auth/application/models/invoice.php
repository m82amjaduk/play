<?php
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

class Invoice extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
    }


    /*
     * Separate cancelled orders
     * generate reports
     */
    public function getTotals($res){
        $res                            = $this->separateCancelled($res);

        $result['act']          =  $this->genReport($res->activeOrders);
        $result['cnc']          =  $this->genReport($res->cancelledOrders);
        $result['actOrders']    = $res->activeOrders;
        $result['cncOrders']    = $res->cancelledOrders;
        return (object)$result;
    }

    /*
     * Generate Reports here ..
     */
    public function genReport($data){
        $result['total']        = $this->getTotal($data);
        $result['paypal']       = $this->getPayPalData($data);
        $result['cash']         = $this->getTotalCash($data);
        $result['card']         = $this->getTotalCard($data);
        return (object)$result;
    }

    /*
     * Separate Cancelled Orders
     */
    public function separateCancelled($res){
        $cancelled = $active = array();
        foreach ($res as $row){
            if($row->status == 'cancelled'){
                $cancelled[] = $row;
            }else{
                $active[] = $row;
            }
        }
        $result['activeOrders'] = (object)$active;
        $result['cancelledOrders'] = (object)$cancelled;
        return (object)$result;
    }


    /*
     * Get data from database for the months.
     */
    public function getOrdersMonths($year=2014, $month=12){
        //  YEAR(`requested_at`)  is not supported by Codeigniter Active Record .. !!!
        return $this->db->query("SELECT * FROM orders_view WHERE YEAR(`requested_at`) = $year AND MONTH(`requested_at`) = $month")->result();
    }

    /*
     * Get data from database for the months.
     */
    public function getOrdersFromTo($from='2009-01-01 00:00:00', $to='2016-01-01'){
        return $this->db->query("SELECT * FROM orders_view where requested_at >= '$from'  AND  requested_at <=  '$to' ")->result();
    }


    public function getTotal($res){
        $result['total'] = $result['count'] = 0;
        foreach ($res as $row){
            $result['total']        += $row->checkout_price;
            $result['count'] ++;
        }
        return (object)$result;
    }


    public function getTotalCash($res){
        $result['total'] = $result['count'] = 0;
        foreach ($res as $row)
            if($row->pay_method == 'cash') {
                $result['total']        += $row->checkout_price;
                $result['count'] ++;
            }
        return (object)$result;
    }

    public function getTotalCard($res){
        $result['total'] = $result['count'] = 0;
        foreach ($res as $row)
            if($row->pay_method == 'card') {
                $result['total']        += $row->checkout_price;
                $result['count'] ++;
            }
        return (object)$result;
    }


    public function getPayPalData($res, $fee=0.20, $commission=3.4){
        $result['total'] = $result['count'] = $result['fee'] = $result['commission'] = 0;
        foreach ($res as $row){
            if($row->pay_method == 'paypal'){
                $result['total']        += $row->checkout_price;
                $result['commission']   += $this->_calcPercentage($row->checkout_price, $commission);
                $result['count'] ++;
            }
        }
        $result['fee']          = $result['count']*$fee;
        $result['payPaypal']    = $result['commission'] + $result['fee'];
        $result['netPaypal']    = $result['total'] - $result['payPaypal'] ;
        return (object)$result;
    }


    private function _calcPercentage($total, $percentage){
        return ($total*$percentage)/100;
    }

    private function _addValue($total, $newVal){
        return $total+$newVal;
    }


    ////////////////////////////// The End //////////////////////////////////
}
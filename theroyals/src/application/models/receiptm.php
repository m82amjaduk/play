<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

if (!class_exists('CI_Model')) {

    class CI_Model extends Model {
        
    }

}

class Receiptm extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
    }



    
    ################################################################################
    ########################             Invoice Format Function                   ###############
    ################################################################################


    /*
     *
     *
     *  $this->receiptm->receipt_ready($order, $business);
     */
    public function receipt_ready($order, $business){ // echo 'receipt_ready';
        $table = $this->receipt_table();
        $header = $this->receipt_header($order, $business);
        $items = $this->receipt_items($order);
        $invoice_calculate = $this->receipt_calculate($order);
        $footer = $this->receipt_footer($order, $business);
        return  $table['style'].$table['open'].$header.$items.$invoice_calculate.$footer.$table['close'];

    }
    


    //$this->order_processm->receipt_footer($orderDetails);
    private function receipt_footer($order){
        $address = $order->house.' '.$order->address1.' * '.$order->address2.'<br />'.$order->town.' * '.$order->city.' * '.$order->county.' * '.$order->postcode;
        $address .= ($order->address_direction) ? '<br />'.$order->address_direction : NULL;
        $discount = '<br />ddsfds'.$order->discount_code ; // ($orderDetails['discount']) ? '<br /> Discount : ' . $this->currentm->discount($orderDetails['discount'], 'code_title') : '';

        $details =  "<br />Customer Name: " . $order->fname. " " . $order->lname  .
                "<br/> Payment type: <font size=+1>" . ucwords($order->pay_method) . "</font>".
                "<br />Note: " . $order->note  .
                "<br />Order Placed: ". HOURS::dayTimeView(strtotime($order->updated)) .
                "<br />Order Placed: ". $order->updated .
                "<br />Requested For: ". HOURS::dayTimeView($order->requested_time).
                "<br />Phone: " . $order->phone .
                "<br/>Email: " . $order->email . $discount .
                "<br/>From:" . $_SERVER["SERVER_NAME"] .
                "<br /><br /><br />" ; // $this->confirmation_button($invoices_details->invoice_number);
        $details ='<tr><td colspan=3>' . $address.$details . '</td></tr>';
        return $details ;
    }

    private function receipt_header($order, $business){
        $header = '<div align="center"><strong> <font size=+2> '.$business->business_name.'</font></strong><br />'.
            $this->cm->time_date_day(time()).'<br />'.
            $business->phone1.'<br />'.
            $business->web_url.'</div>';
        
        $order_code = '<div align="center"><strong>'.$order->order_code.' >> '.
                ucfirst($order->receiving).' >> '.
                $this->cm->money($order->checkout_price, 2).'</strong> </div>';
        
        $header = '<tr><td colspan=3>'.$header .$this->line().$order_code.$this->line() . '</td></tr>';
        return $header; 
    }
    
    private function line(){
        $line = '<div align="center">--------------------------------------------</div>';
        return $line;
    }
    
    private function receipt_items($order) { // echo 'receipt_items';
        $cart_data = $this->cart_ready($order);
        
        $cart = '';
        foreach ($cart_data as $row) { 
            $cart .='<tr> <td width="20">' . $row['quantity'] . '</td> <td width="200">' . $row['product_name'] . '</td> <td width="40" align="right">' . $row['price'] . '</td> </tr>';
        } 
        return $cart; 
    }
    
    private function cart_ready($order, $type=NULL) { //echo 'cart_ready';
        $cart = array();
        foreach ($order->items as $row) {
            //echo '<pre>'; print_r($row);exit;
            $row_total = $row['quantity'] * $row['price'];
            $code = $this->cm->add_leading_zero($row['sn'], 3);
            $title = ucfirst(strtolower($row['title']));
            $meat = ($row['meat'][2]) ? $row['meat'][2].'~' : '';
            $portion_size = NULL; // ($row->portion_size_short_name) ? '~'.$row->portion_size_short_name : '';
            $accompaniments = NULL; // ($row->accompaniment_short_name) ? '~'.$row->accompaniment_short_name : '';
            
            $cart_row['product_name'] = $code. '-' .$meat. $title .$portion_size.$accompaniments;
            $cart_row['quantity']= $row['quantity'];
            $cart_row['price'] = ($type == 'smsp') ? $this->cm->money($row_total, 1) : $this->cm->money($row_total, 2);
            $cart[]=$cart_row;
        }   
        return $cart;
    }

    private function receipt_calculate($order) {
        $price = 4.55;
        $cart ='<tr><td colspan=3> '.$this->line().' </td></tr>';
        $cart .='<tr><td colspan=2> Transaction Fee </td><td  align="right">+' . $this->cm->money($order->transaction_fee, 2) . '</td></tr>';
        $cart .='<tr><td colspan=2> Delivery Charge </td><td  align="right">+' . $this->cm->money($order->delivery_charge, 2) . '</td></tr>';
        $cart .='<tr><td colspan=2> Discount </td><td align="right"> - ' . $this->cm->money($order->discount_price, 2) . '</td></tr>';
        $cart .='<tr><td colspan=2>    *************** Payable </td><td align="right"> <font size=+2>' . $this->cm->money($order->checkout_price, 2) . '</font> </td></tr>';
        $cart .='<tr><td colspan=3> '.''.' </td></tr>';

        return $cart;
    }

    private function receipt_table(){
        $table['style']= '<style>  table {border: 0px solid #000; border-collapse: collapse; } </style> ';
        $table['open'] = '<div float="left" width="285"> <table border="0" align="center" width="280">';    
        $table['close'] = '</table> </div>'; 
        return $table;
    }

    public function receipt_confirmation_button($code) {
        $time = $this->cm->time_local(now());
        $method = 'email';
        $hash = sha1($time . $method . $code);
        $url = base_url() . 'post_sales/order_accepted/' . $method . '/' . $hash . '/' . $time . '/' . $code;        
        $button = "<a href='" . $url . "' > 
            <img src='http://allinepos.co.uk/images_common/buttons/AcceptButton01.png' width='150'/> 
            </a> <br />";       
        $button ='<tr><td colspan=3>' . $button. '</td></tr>';
        return $button;
    }

    
    
    
   
    ///////////////////////  SMS Printer ////////////////////////////////////////////
    /*
    private function sms_printer_products( $invoice, $type=NULL){
            $cart_data = $this->order_processm->cart_ready($invoice, $type);
            $cart = '';
            foreach ($cart_data as $row) {
                $cart .= (int) $row['quantity'] . ";" .  $row['product_name'] . ";" . $row['price'] . ";";
            }
             return $cart;
    //#137*1*AAA1921*1;003-La Tik;3.15;1;013-Onion Bhaji;2.85;1;018-Plain Papadam;0.65;1;125-Murug Shezani N;8.95;1;141-Ch Madras N;4.95;1;281-Plain Rice;2.25;1;302-Garlic Nan;2.95;*0.00*0;25.75;4;Bury;28 Ethelburga Tower ,Rosenau Road,  SW11 4AD;05:50PM 24Mar13 Sun;113;6;NoDiscount;078633746;*No Comment#
        }
    /*
        private function sms_printer_string($order_code, $invoice=NULL){
            $invoice = ($invoice)? $invoice : $this->invoice($order_code);
            $ignore_char = array('.', ' ', "\n", "\t", "\r", "*", ";", "#");
            $products = $this->order_processm->sms_printer_products( $invoice, 'smsp'); //print_r($products); exit;
            $receiving = ($invoice->receiving == 'delivery')? 1 : 2 ;  // Need to check 1 for delivery or not.

            $address = $invoice->customer_house.', '.$invoice->customer_street1.', '.$invoice->customer_street2.', '.$invoice->customer_town.', '.$invoice->customer_city.' * '.$invoice->customer_postcode;
            $address .= ($invoice->customer_address_direction) ? '~~'.$invoice->customer_address_direction : NULL;
            $address=  str_replace($ignore_char, ' ', $address);

            $payment_method = ($this->order_processm->receipt_payment_method($order_code) == 'cash')? 7 : 6; // Need to check cash nad card numbers.
            $note=  str_replace($ignore_char, ' ', $invoice->note);
            $cod = ($invoice->discount_code) ? $this->currentm->discount($invoice->discount_code, 'code_title') : 'NoDiscount';

            $string = "\n" . '#' . $invoice->id . '*' . $receiving . '*' . $order_code . '*' . $products . '*' .
                    number_format($invoice->delivery_charge, 2, '.', '') . '*0;' . sprintf("%01.2f", $invoice->checkout_price) .
                    ';4;' . $invoice->customer_lname . ';' . $address . ';' . $this->cm->time_date_day($invoice->requested_time).
                    ';113;' . $payment_method . ';' . $cod . ';0' .  $invoice->customer_phone . ';*' . $note . '#';
            return $string;
        }*/
    
    ///////////////////////  OrderjSON ////////////////////////////////////////////

/*    private function order_not_processed() {
        $this->db->select('
            invoices.*,
            invoice_confirmation.confirmed, invoice_confirmation.promissed_time, invoice_confirmation.note, invoice_confirmation.method,
            invoice_payment.paymethod ');
        $this->db->join('invoice_confirmation', 'invoices.order_code = invoice_confirmation.order_code', 'left');
        $this->db->join('invoice_payment', 'invoices.order_code = invoice_payment.order_code', 'left');
        $this->db->where(array('confirmed'=>'N'));
        $this->db->limit(1);
        $query = $this->db->get('invoices');
        return $query->row();
    }

    public function order_json_products($invoice, $type=NULL){
        $cart_data = $this->order_processm->cart_ready($invoice, 'smsp');
        return $cart_data;
    }*/
     
    


    
    
    
    
    
    
    
    

    
    ////////////////////////////////////////??The End////////////////////////////////////////////
    }

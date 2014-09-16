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

    class Takeawaym extends CI_Model {

        public function __construct() {
            parent::__construct();
            $this->load->database();
            $this->load->helper('cookie');
            $this->load->helper('date');
            $this->load->library('session');
        }

//        /*
//         *  Get cwdp settings
//         *
//         *  @access     public
//         *
//         *  $this->takeawaym->get_settings('settings_business');
//         */
//        public function get_settings($table = 'settings_business'){
//            $cacheName = "SETTINGS/$table";
//            $data = $this->cache->get($cacheName);
//            if (empty($data)){
//                $this->db->where('id', 1);
//                $query = $this->db->get($table);
//                $data = ($query->num_rows > 0 ? $query->row() : array());
//                $this->cache->write($data, $cacheName);
//                $this->tools->logFileWrite($cacheName, $fileLog='cache.log');
//            }
//            return $data;
//        }

//        /*
//         *  Get contact page settings
//         *
//         *  @access     public
//         *
//         *  $this->takeawaym->get_tracker();
//         */
//        public function get_tracker(){
//            $this->db->where('id', 1);
//            $query = $this->db->get('cms_tracker');
//            return ($query->num_rows > 0 ? $query->row() : array());
//        }


        /*
         *  Payment Option Array
         *
         *$this->takeawaym->pay_options();
         */
        public function pay_options(){
            $opt = $this->pay_options_get_data();
            $pay_sess =$this->session->userdata('payMethod');
            $pay_option = array(
                strtolower($pay_sess)      => strtoupper($pay_sess)
            );
            if (($opt->paypal_active == 1) && ($pay_sess != 'paypal')) $pay_option['paypal'] = 'PayPal';
            if (($opt->card_active == 1)  && ($pay_sess != 'card')) $pay_option['card'] = 'Card';
            if (($opt->cash_active == 1)   && ($pay_sess != 'cash')) $pay_option['cash'] = 'Cash';
            return $pay_option ;
        }
        /*stdClass Object ( [paypal_active] => 1 [transaction_fee] => 0.20 [commision] => 3.40 [min_order_value_paypal] => 5.00 [flat_fee_paypal] => -2.00 [card_active] => 1 [credit_card_fee] => 0.20 [debit_card_fee] => 2.20 [flat_fee_card] => -2.00 [min_order_value_card] => 10.00 [min_order_value_cash] => 10.00 [cash_active] => 1 )*/



        //  TODO :: C0086 ::  Take this to Database as VIEW And cache data
        private function pay_options_get_data(){
            $cacheName =  "RAW/pay_options_get_data";
            $data = $this->cache->get($cacheName);
            if(empty($data)){
                $this->db->select('pay_paypal.active AS paypal_active,
                    pay_paypal.transaction_fee,
                    pay_paypal.commision,
                    pay_paypal.min_order_value AS min_order_value_paypal,
                    pay_paypal.flat_fee AS flat_fee_paypal ,
                    pay_card.active AS card_active,
                    pay_card.credit_card_fee,
                    pay_card.debit_card_fee,
                    pay_card.flat_fee AS flat_fee_card,
                    pay_card.min_order_value AS min_order_value_card,
                    pay_cash.min_order_value AS min_order_value_cash,
                    pay_cash.active AS cash_active'
                );
                $this->db->from('pay_paypal');
                $this->db->join('pay_cash', 'pay_paypal.id = pay_cash.id');
                $this->db->join('pay_card', 'pay_paypal.id = pay_card.id');
                $this->db->where('pay_paypal.id', 1);


                try{
                    $query = $this->db->get();
                    $data = ($query->num_rows > 0 ? $query->row() : array());
                    $this->cache->write($data, $cacheName);
                    $this->tools->logFileWrite($cacheName, $fileLog='cache.log');
                } catch(Exception $e) {
                    $this->tools->logFileWrite('FAILED >> '.$cacheName, $fileLog='cache.log');
                    $this->tools->logFileWrite($e->getMessage(), $fileLog='cache.log');
                    echo 'Message: ' .$e->getMessage(); exit;
                }
            }
            return $data;
        }

        public function email_customer($order, $business) {
            $subject = $order->order_code.' Order Placed With '.$business->business_name;
            $greeting = 'Dear '.$order->fname.' '.$order->lname.',<br />Thank you very much for placing the order '.$order->order_code.' with us via '.$business->web_url.'. Please check the details below carefully. If there is any information which you may consider incorrect please get in touch with us.  <br /><br />'; /// Need to get this info from Database;sss

            $closing =  '<br /> '.  '<br /><br /> This is not an order confirmation. We will confirm your order with in next 15 min.' ; // Need to get this info from Database;
            $signature = "Thanking By <br /> {$business->business_name} <br /> {$business->business_slogan} "; //TODO

            $receipt = $this->receiptm->receipt_ready($order, $business);
            $body_text = $receipt.$closing.$signature;
            $this->emailm->send($order->email, $subject, $greeting, $body_text);
            return TRUE;
        }

        public function email_client($order, $business){
            $receipt = $this->receiptm->receipt_ready($order, $business);
            $accept = $this->receiptm->receipt_confirmation_button($order->order_code);

            $sub = $order->order_code.' £'.$this->cm->money($order->checkout_price, 1).' > '.$order->receiving.' > '.$order->lname.' @ '.$this->cm->time_date_day($order->requested_time);
            $greeting = 'New Order';
            $closing = 'closing';
            $signature = " <br /> <br />Thanking By <br /> {$business->business_name} <br /> {$business->business_slogan} "; //TODO
            $body_text = $receipt.$closing.$signature.$accept;
            $this->emailm->send($business->email_order, $sub, $greeting, $body_text);
            $this->emailm->send($business->email_order_support, $sub, $greeting, $body_text); // TODO:: Set it to CC
            return TRUE;
        }

        public function save_database() {
            $session = $this->session->all_userdata();
            $email = str_replace(' ', '', $session['email']);
            $email = preg_replace('/\s+/', '', $email);
            $email = strtolower($email);

//            $bag_total          = $this->cart->getTotalPrice();
//            $delivery_charge    = $this->session->userdata('deliveryCharge');
//            $transaction_fee    = $this->session->userdata('transactionFee');
//            $vat_value          = 0.0; // TODO
//            $base_payable       = $bag_total + $delivery_charge + $transaction_fee;
//            $discount_price     = $this->session->userdata('discountPrice');
//            $checkout_price     = $base_payable - $discount_price;

            $user_code          = ($this->session->userdata('userCode')) ? $this->session->userdata('userCode') : 'AAA1786' ;
            $club_point         = 0; // TODO
            $requested_time     = $this->session->userdata('day') + $this->session->userdata('time') ;

            $transactionInfo = $this->session->userdata('transactionInfo');

            $order = array (
                'login_id' => ($this->session->userdata('loginId')) ? $this->session->userdata('loginId') : '1',
                'active' => 1,
                'order_id_temp' => $this->session->userdata('order_id_temp'),
                'user_code'         => $user_code ,
                'fname'             => $session['fname'],
                'lname'             => $session['lname'],
                'email'             => $email,
                'phone'             => $this->session->userdata('phone'),

                'house'             => $session['houseNo'],
                'postcode'          => $session['postcode'],
                'address1'          => $session['address1'],
                'address2'          => $session['address2'],
                'town'              => $session['town'],
                'city'              => $session['city'],
                'county'            => $session['county'],
                'postcode'          => $session['postcode'],
                'address_direction' => $session['addressInstruction'],

                'requested_time' => $requested_time,
                'receiving' => $session['receiving'],
                'discount_code' => $session['discount'],
                'pay_method' => $session['payMethod'],
                'pay_status' => $transactionInfo['transactionStatus'],
                'items' => serialize($session['items']),
                'note' => $session['orderNote'],

                'bag_total' => $transactionInfo['bagTotal'],
                'delivery_charge' => $this->session->userdata('deliveryCharge'),
                'transaction_fee' => $this->session->userdata('transactionFee'),
                'base_payable' => $transactionInfo['basePayable'],
                'vat_value' => $transactionInfo['basePayable'],
                'discount_price' => $this->session->userdata('discountPrice'),
                'checkout_price' => $transactionInfo['checkoutPrice'],

                'club_point' => $club_point,
            );
            $this->db->insert('orders', $order);
            return $this->db->insert_id();
        }

        public function getReceiptData($orderNo){
            $order = $this->cm->get_row('orders', 'order_code', $orderNo);
            $order->items= unserialize($order->items);
            $business = $this->cm->get_row('settings_business', 'id', 1);
            $receiptData = array(
                'business' => $business,
                'order' => $order
            );
            return $receiptData;
        }

        public function deleteUserData(){
            $userData =  $this->config->item('userInfo');

            array ('identity', 'username', 'user_id', 'old_last_login' );

            foreach ($userData as $row){
                $this->session->unset_userdata($row);
            }
        }







        ////////////////////////////// The End //////////////////////////////////
    }
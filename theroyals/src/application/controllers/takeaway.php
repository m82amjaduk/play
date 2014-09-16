<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Takeaway extends CI_Controller {

    private $_cart;
    private $_totalPrice;
    private $_menuMainPage;

    function __construct() {
        parent::__construct();

        /*
                // Load helpers
                $this->load->helper('url');
                $this->load->helper('file');
                $this->load->library('session');
                $this->load->library('curl');
        */
        $this->load->library('form_validation');
        $this->load->library('cvalidate');
        $this->load->model('products');
        $this->load->model('takeawaym');
        $this->load->model('dbm');
        $this->load->model('emailm');
        $this->load->model('receiptm');
        $this->load->model('hoursm');
        $this->load->config('cwaiter');
        $this->load->library('ion_auth');
        $this->load->library('curl');

        $this->_menuMainPage = $this->config->item('menuMainPage');
        $this->data['menuCSS'] = $this->config->item('menuCSS');
        $this->data['menuIMG'] = $this->config->item('menuIMG');
        $this->data['menuJS'] = $this->config->item('menuJS');

        $this->genMustFolders();


//        $this->currentm->database_error_report();

        // Globally Requires this variables
        $this->data['cart'] =  $this->_cart = $this->cart->getItems();
        $this->data['totalPrice'] = $this->_totalPrice = $this->cart->getTotalPrice();
        $this->data['business'] = $this->dbm->getRow('settings_business');
        $this->data['tracker']  = $this->dbm->getRow('cms_tracker');



        // Set Default data to cart ..
        $this->cart->setSessionVariablesDefault( );

        // Error and warnig report
        if($errorUser = $this->session->userdata('errorUser')) {
            $this->tools->logFileWrite($errorUser, 'errorUser.log', 'AAA1786', basename(__FILE__), __LINE__);
        }
        $this->tools->logFileWrite($this->uri->segment(2), 'visitor.log', 'AAA1786', basename(__FILE__), __LINE__);
    }

	public function index() {
        redirect('takeaway/menu/2', 'refresh');
	}

    public function data() {
        $this->emailm->send('m82amjad@gmail.com', 'test', 'test', 'test');
//        echo '<pre>';
//        print_r($this->emailm->get_settings_email_config());
    }



    public function menu($category=2) {
        $this->data['category'] = ($category) ? $category : 2;
/*
        // Database Cache with Codeigniter...
        // Do not Turn on Database cache globaly from database.php
        $this->tools->StartTimer('Codeigniter Caching');
        $this->db->cache_on();
        $this->data['categories'] = $this->products->categories($category);
        $this->data['products'] =  $this->products->menu_category($category);
        $this->db->cache_off();
        $this->tools->StopTimer();
*/

//        $this->tools->StartTimer('Custom Caching');
        $data =  $this->cache->model('products', 'takeaway_menu', array(NULL, $category), $this->config->item('week'));
        $this->data['products'] = $data ['products'];
        $this->data['categories'] = $data ['categories'];
        $this->data['category'] = $data ['category'];
//        $this->tools->StopTimer();

        $this->data['casperName'] = 'Menu';
        $this->data['page'] = 'products';
        $this->load->view($this->_menuMainPage, $this->data);
    }

    public function add_in_bag(){
        $product_id = $this->input->get('product_id');
        $sn = $this->input->get('sn');
        $note = $this->input->get('note');
        $title = $this->input->get('title');
        $price = $this->input->get('price');
        $meat = $this->input->get('meat');
        if (!empty($meat)) {
            $meat = explode("~", $meat);
            $price =  str_replace(' ', '', $meat[1]);
        }

        $item = array (
            'quantity' => 1,
            'product_id' => $product_id,
            'sn' => $sn,
            'title' => $title,
            'note' => $note,
            'price' => $price,
            'meat' => $meat
        );
        $this->cart->addAnItem($item);
        redirect($this->cm->no_base_url($_SERVER['HTTP_REFERER']), 'refresh');
    }

    public function empty_my_bag(){
        $this->cart->resetItems();
        redirect($this->cm->no_base_url($_SERVER['HTTP_REFERER']), 'refresh');
    }

    public function update_quantity($type='add', $row=0){
        $this->cart->updateQuantity($type, $row);
        redirect($this->cm->no_base_url($_SERVER['HTTP_REFERER']), 'refresh');
    }

    ##########################  Order Routes ########################

    public function order_details(){
        $this->cvalidate->orderDetails();
        //Payment Option
        $this->data['pay_option']   =   $this->takeawaym->pay_options(); //        print_r($this->data['pay_option']); exit;
        //Time Option
        $type = $this->session->userdata('receiving');
        $hours = $this->getHours ();  //  echo '<pre>'; print_r($hours); exit;
        $this->data['openDaysList'] =  $this->hours->openDaysListOption($hours, $type);
        $this->data['requestTimeList'] =  $this->hours->requestTimeListOption($hours, $type);
//        echo '<pre>'; print_r($this->data['requestTimeList']); exit;

        $this->data['page'] = 'orderDetails';
        $this->load->view($this->_menuMainPage, $this->data);
    }

    private function getHours (){
        return $this->cache->model('hoursm', 'getHours', array(), $this->config->item('week'));
    }

    public function user_details(){  //die('here');
        if($this->input->get_post('orderDetailsPage') == 1){
            // Process POST data..
            $payMethod      = $this->_setPostData('payMethod');
            $discount       = $this->_setPostDataStrToUpper('discount');
            $receiving      = $this->_setPostData('receiving');
            $day            = $this->_setPostData('day');
            $time           = $this->_setPostData('time');
            $orderNote      = $this->_setPostDataRmCSVChar('orderNote');

            $newData = array_merge( $payMethod, $discount, $receiving, $day, $time, $orderNote );
            $this->session->set_userdata($newData);
        }

        $this->cvalidate->userDetails();

        $this->data['page'] = 'userDetails';
        $this->load->view($this->_menuMainPage, $this->data);
    }

    private function _setPostData($var){
        return array ($var => $this->input->get_post($var, TRUE) );
    }

    private function _setPostDataUcWords($var){
        return array ($var => ucwords($this->input->get_post($var, TRUE)) );
    }

    private function _setPostDataStrToLower($var){
        return array ($var => strtolower($this->input->get_post($var, TRUE)) );
    }

    private function _setPostDataStrToUpper($var){
        return array ($var => strtoupper($this->input->get_post($var, TRUE)) );
    }

    private function _setPostDataRmCSVChar($var){
        $note = str_replace(',', '&#44;', str_replace('\r\n', ' ', $this->input->get_post($var, TRUE))) ;
        return array ($var =>  $note );
    }

    private function _setPostDataRmSpace($var){
        $note = str_replace(' ', '', str_replace(',', '&#44;', str_replace('\r\n', ' ', $this->input->get_post($var, TRUE)))) ;
        return array ($var =>  $note );
    }

    public function confirm(){
        if($this->input->get_post('userDetailsPage') == 1){
            $email              = $this->_setPostDataStrToLower('email');
            $fname              = $this->_setPostDataUcWords('fname');
            $lname              = $this->_setPostDataUcWords('lname');
            $phone              = $this->_setPostDataRmSpace('phone');
            $houseNo            = $this->_setPostData('houseNo');
            $postcode           = $this->_setPostDataStrToUpper('postcode');
            $address1           = $this->_setPostDataUcWords('address1');
            $address2           = $this->_setPostDataUcWords('address2');
            $town               = $this->_setPostDataUcWords('town');
            $city               = $this->_setPostDataUcWords('city');
            $county             = $this->_setPostDataUcWords('county');
            $addressInstruction = $this->_setPostDataRmCSVChar('addressInstruction');

            $newData = array_merge($email, $fname, $lname, $phone, $houseNo,
                $postcode, $address1, $address2, $town, $city, $county,
                $addressInstruction );
        }

        $this->cvalidate->confirm();
        $newData['order_id_temp']   = $this->session->userdata('phone').'_'.date('YmdHis');
        $newData['transactionInfo'] = $this->setTransactionInfo();

        $this->session->set_userdata($newData);
        $this->data['transactionInfo'] = $this->setTransactionInfo();
        $this->data['page'] = 'confirm';
        $this->load->view($this->_menuMainPage, $this->data);
    }

    public function setTransactionInfo(){

        $info = array(
            'ItemTotalPrice'            => $this->cart->getTotalPrice(),                // PayPal Var
            'TotalTaxAmount'            => 0.00,                                        // PayPal Var
            'HandalingCost'             => 0.00,                                        // PayPal Var
            'InsuranceCost'             => 0.00,                                        // PayPal Var
            'ShippinDiscount'           => -0.00,                                       // PayPal Var
            'ShippinCost'               => $this->session->userdata('deliveryCharge'),  // PayPal Var
            'bagTotal'                  => $this->cart->getTotalPrice(),                // cWaiter var
            'vatValue'                  => 0.00,                                        // cWaiter var
            'transactionStatus'         => 'NotConfirmed',                              // cWaiter var
        );

        $info['basePayable']    = $info['bagTotal']+$this->session->userdata('deliveryCharge')+$this->session->userdata('transactionFee');   // cWaiter var
        $info['checkoutPrice']  = $info['basePayable']-$this->session->userdata('discountPrice');                                            // cWaiter var
        return $info;
    }



    ##########################  Order Process ########################
    public function process_order() {
        $this->cvalidate->processOrder();
        $order_id = $this->takeawaym->save_database();
        $order = $this->cm->get_row('orders', 'id', $order_id);
        $this->session->unset_userdata('items');
        $receiptData = $this->takeawaym->getReceiptData($order->order_code);
        $this->session->set_userdata('receiptData', $receiptData);
        $order = $receiptData['order'];
        $business = $receiptData['business'];
        $this->takeawaym->email_client($order, $business);
        $this->takeawaym->email_customer($order, $business); //exit;
        redirect('takeaway/order_placed/'.$order->order_code, 'refresh');
    }

    public function order_placed($orderNo){
        if($this->session->userdata('receiptData')) {
            $receiptData = $this->session->userdata('receiptData');
            $this->session->unset_userdata('receiptData');
        }else
            $receiptData = $this->takeawaym->getReceiptData($orderNo);

        $order = $receiptData['order'];
        $business = $receiptData['business'];

        $this->data['receipt'] = $this->receiptm->receipt_ready($order, $business);
        $this->data['order'] = $order;
        $this->data['page'] = 'orderPlaced';
        $this->load->view($this->_menuMainPage, $this->data);
    }

//
//    public function data_process(){
//        $newData = $this->cart->setSessionVariablesDefault();
//
//        echo '<pre>';print_r( $newData);
//        $this->session->set_userdata($newData);
//        $this->tools->pa($this->session->all_userdata());
//    }




    ##########################  Js Output ########################
    /* Order details */
    public function payment_js() {
        echo $this->_psValue("Payment Method", 'payMethod', $this->input->get('value'));
    }
    public function discount_js() {
        echo $this->_psValue("Discount Code", 'discount', strtoupper($this->input->get('value')));
    }
    public function collection_delivery_js(){
        $type = $this->input->get('value');
        $hours = $this->getHours ();
        $data['date'] =  $this->hours->openDaysListOption($hours, $type);
        $data['time'] =   $this->hours->requestTimeListOption($hours, $type);
        $data['alert'] = "Address Set To ". strtoupper($this->cart->setSessionVariable('receiving', $type));
        echo json_encode($data);
    }
    public function day_js() {
        $day = $this->input->get('value');
        $type = $this->session->userdata('receiving');
        $hours = $this->getHours ();
        $data['time'] =   $this->hours->requestTimeListOption($hours, $type, $day);
        $data['alert'] = "Day Set To ". HOURS::dayView($this->cart->setSessionVariable('day', $day));
        echo json_encode($data);
    }
    public function time_js() {
        echo "Time Set To ". HOURS::timeView($this->cart->setSessionVariable('time', $this->input->get('value')));
    }
    public function order_note_js() {
        $note = str_replace(',', '&#44;', str_replace('\r\n', ' ', $this->input->get('value'))) ;
        echo $this->_psValue("Order Note", 'orderNote', $note);
    }
    /* User Details */
    public function email_js() {
        $email = strtolower($this->input->get('value'));
        if(! filter_var($email, FILTER_VALIDATE_EMAIL)){
            echo "Invalid Email ". $email;
            $this->cart->setSessionVariable('email', NULL);
        }else
            echo $this->_psValue("Email", 'email', $email);
    }
    public function fname_js() {
        echo $this->_psValue("First Name", 'fname', ucwords($this->input->get('value')));
    }
    public function lname_js() {
        echo $this->_psValue("Last Name", 'lname', ucwords($this->input->get('value')));
    }
    public function phone_js() {
        echo $this->_psValue("Phone", 'phone', str_replace(' ', '', $this->input->get('value')));
    }
    /* Delivery Address Details */
    public function house_no_js() {
        echo $this->_psValue("House No", 'houseNo', ucwords($this->input->get('value')));
    }
    public function postcode_js() {
        echo $this->_psValue("Postcode", 'postcode', strtoupper($this->input->get('value')));
    }
    public function address1_js() {
        echo $this->_psValue("Address Line 1 ", 'address1', ucwords($this->input->get('value')));
    }
    public function address2_js() {
        echo $this->_psValue("Address Line 2 ", 'address2', ucwords($this->input->get('value')));
    }
    public function town_js() {
        echo $this->_psValue("Town", 'town', ucwords($this->input->get('value')));
    }
    public function city_js() {
        echo $this->_psValue("City", 'city', ucwords($this->input->get('value')));
    }
    public function county_js() {
        echo $this->_psValue("County", 'county', ucwords($this->input->get('value'))) ;
    }
    public function address_instruction_js() {
        $note = str_replace(',', '&#44;', str_replace('\r\n', ' ', $this->input->get('value'))) ;
        echo $this->_psValue("Address Instruction",  'addressInstruction', $note);
    }
    private function _psValue($text, $var, $value) { // psValue = process session valuesssssssssssssssssssssss
        return $text." Set To ".  $this->cart->setSessionVariable($var, $value);
    }



    ##########################  debug URL ########################

    // http://theroyals.lc/takeaway/deleteCache
    public function deleteCache(){
        $this->cache->delete_all();
        $this->tools->logFileWrite('deleteCache', $fileLog='cache.log');
        echo "<a href='takeaway'>Go to Menu </a>";
    }
    // http://theroyals.lc/takeaway/deleteDBCache
    public function deleteDBCache(){
        $this->db->cache_delete_all();
        $this->tools->logFileWrite('deleteDBCache', $fileLog='cache.log');
        echo "<a href='takeaway'>Go to Menu </a>";
    }
    // http://theroyals.lc/takeaway/deleteALLCache
    public function deleteALLCache(){
        $this->db->cache_delete_all();
        $this->cache->delete_all();
        $this->tools->logFileWrite('Deleted All Cache', $fileLog='cache.log');
        echo "<a href='takeaway'>Go to Menu </a>";
    }
    // http://theroyals.lc/takeaway/all_userdata
    public function all_userdata(){
        $this->tools->pa($this->session->all_userdata());
        echo "<a href='takeaway'>Go to Menu </a>";
    }
    // http://theroyals.lc/takeaway/sess_destroy
    public function sess_destroy(){
        $this->session->sess_destroy() ;
        echo "<a href='takeaway'>Go to Menu </a>";
    }
    // http://theroyals.lc/takeaway/deleteUserData
    public function deleteUserData(){
        $this->takeawaym->deleteUserData();
        echo "<a href='takeaway'>Go to Menu </a>";
    }
    // http://theroyals.lc/takeaway/sms
    public function sms(){
        $sms_status = $this->curl->simple_get('http://213.104.214.8:9090');
        echo $sms_status;
        echo "<a href='takeaway'>Go to Menu </a>";
    }
    // http://theroyals.lc/takeaway/genMustFolders
    public function genMustFolders(){
        $path = $this->config->item('folderMust');
        foreach ($path as $row){
            $dir = ROOTDIR.$row[0] ;
            if( ! file_exists($dir)) {
                mkdir($dir, $row[1]);
            }
        }
    }

    /* End of file takeaway.php */
    /* Location: ./application/controllers/takeaway.php */
}


<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Validate Class
 *
 * Validate library for CodeIgniter
 *
 * @category	Libraries
 * @author		Amzad Mojumder
 * @link		##
 * @license		MIT
 * @version		01.00.01
 */

class Cvalidate {

    private $_cart;
    private $_totalPrice;

    public function __construct() {
        $this->CI =& get_instance();
        // Load the Sessions class
        $this->CI->load->library('session' );
        $this->CI->load->config('cwaiter');
/*      Simple Call ....
        $this->CI->session->set_userdata('items',$items);
        $this->CI->session->userdata('items');
        $this->CI->session->unset_userdata('items');*/
        // Set value to cart
        $this->_cart = ($this->CI->session->userdata('items')) ? $this->CI->session->userdata('items') : array();
    }


    /**
     *  Check all data are correct on orderDetails
     *  @access	public
     *
     *  @return String
     *  $this->validate->orderDetails();
     */
    public function orderDetails(){
        $this->items();
    }

    /**
     *  Check all data are correct on userDetails
     *  @access	public
     *
     *  @return String
     *  $this->validate->userDetails();
     */
    public function userDetails(){
        $this->items();
        $this->requestedTime();
    }

    /**
     *  Check all data are correct on confirm
     *  @access	public
     *
     *  @return String
     *  $this->validate->confirm();
     */
    public function confirm(){
        $this->items();
        $this->email();
        $this->userInfo();
        $this->requestedTime();
    }
    /**
     *  Check all data are correct on Process Method
     *  @access	public
     *
     *  @return String
     *  $this->validate->processOrder();
     */
    public function processOrder(){
        $this->items();
        $this->email();
        $this->userInfo();
        $this->requestedTime();
        $this->transactionStatus();
    }

    ////////////////////////////////////////////////////////////////////

    /**
     *  Check if cart has items in it
     *  @access	public
     *
     *  @return String
     *  $this->validate->items();
     */
    private function items(){
        if(empty($this->_cart)){
            $this->setError("Your cart is empty!! Please add some food in your cart.<br />");
            redirect('takeaway/menu', 'refresh');
        }
        else
            return FALSE;
    }

    /**
     *  Check If Requested time is valide
     *  @access	private
     *
     *  @return String
     *  $this->validate->requestedTime();
     */
    private function requestedTime(){
        $requested_time = $this->CI->session->userdata('day') + $this->CI->session->userdata('time');

        $now = now() + 900;
        if ($requested_time < $now ){
            $data = " Requested Time :: <b>". date('D d M Y H:m:s', $requested_time).
                "</b> Can not be earlier then :: ".date('D d M Y H:m:s', $now);

            $this->setError($data);
            redirect('takeaway/order_details', 'refresh');
        }
        return FALSE;
    }

    /**
     *  Set error if validation fails
     *  @access	private
     *
     * @pram String
     *
     *  @return bool
     *  $this->validate->setError($data);
     */
    private function setError($data){
        $this->CI->session->set_userdata('errorUser', $data);
        return TRUE;
    }



    /**
     *  Check If EMAIL is valide
     *  @access	private
     *
     *  @return String
     *  $this->validate->email();
     */
    private function email(){
        $email = $this->CI->session->userdata('email');
        if(empty($email)){
            $this->setError("Email can not be empty <br />");
            redirect('takeaway/user_details', 'refresh');
        }else if(! filter_var($email, FILTER_VALIDATE_EMAIL)){
            $this->setError("Invalid Email Entered :: ". $email . "<br />");
            $this->CI->session->set_userdata('email', NULL);
            redirect('takeaway/user_details', 'refresh');
        }else
            return FALSE;
    }

    /**
     *  Check If Firstname is valide
     *  @access	private
     *
     *  @return bool
     *  $this->validate->userInfo();
     */
    private function userInfo(){
        $userInfo = ($this->CI->session->userdata('receiving') == 'delivery') ?
            array_merge($this->CI->config->item('collectionMustFileds'), $this->CI->config->item('addressMustFileds') ) :
            $this->CI->config->item('collectionMustFileds') ;

        $errorString = NULL;
        foreach ($userInfo as $key => $data){
            $errorString .= ($this->CI->session->userdata($key)) ?  NULL : $data;
        }
        if(! empty ($errorString)){ //            echo $errorString; exit;
            $this->setError($errorString);
            redirect('takeaway/user_details', 'refresh');
        }
        else
            return FALSE;
    }

    /**
     *  Set error if url accessed directly
     *  @access	private
     *
     *
     *  @return bool
     *  $this->cvalidate->transactionStatus();
     */
    private function transactionStatus(){
        // if  transaction type is not Cash !!
        if ($this->CI->session->userdata('payMethod') != 'cash'){
            $transactionInfo = $this->CI->session->userdata('transactionInfo');
            if ( empty($transactionInfo['transactionStatus'])){
                $this->setError('takeaway/process_order, Invalid access to site. please try again');
                redirect('takeaway/confirm', 'refresh');
            }
        }
    }



    private function removeItemArray($value, $array){
        if(($key = array_search($value, $array)) !== false) {
            unset($array[$key]);
        }
        return $array;
    }




    /* End of file Validate.php */
    /* Location: ./application/libraries/Validate.php */
}


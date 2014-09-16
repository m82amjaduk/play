<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cwdp extends CI_Controller {

    private $_storeCode = "AAA1788";
    private $_psk       = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    private $_business  = NULL;
    private $_cwdp      = NULL;
    private $_debug     = FALSE;

    function __construct() {
        parent::__construct();
        $this->load->config('cwaiter');
        $this->load->model('cm');
        $this->load->model('emailm');
        $this->load->model('takeawaym');
        $this->load->helper('url');

        $this->_business    = $this->dbm->getRow('settings_business');
        $this->_cwdp        = $this->dbm->getRow('device_cwdp');
        $this->_debug       = $this->_cwdp->debug;
        $this->_psk         = $this->_cwdp->psk;
        $this->_storeCode   = $this->_business->business_code;

        $this->_checkActive();

        //echo '<pre>'; print_r($this->_cwdp ); exit;
    }

	public function index() {
        redirect('takeaway/menu/2', 'refresh');
	}


    /*
     *  Lets you know if there is at least one NOT PRINTED order.
     *
     *  @access private
     *
     *   $this->_checkActive();
     */
    private function _checkActive(){
        if($this->_cwdp->active != 1){
            echo json_encode(
                array( 'msg' => 'CWDP is inactive, Please contact support.',
                    'hashResult' => array(
                        'status' => "OK",
                        'msg' => 'CDWP_INACTIVE'
                    )
                )
            );
            exit;
        }
    }

    /*
     *  Lets you know if there is at least one NOT PRINTED order.
     *
     *  @access private
     *
     *  @param  int
     *  @param  string
     *  @param  string
     *
     *   $this->getHash($time, $code, $hashKey);
     */
    private function getHash($time, $code, $hashKey){
        $serverHash = sha1($time.$code.$this->_psk);
        $data = array ( 'status' => "OK");
        $data['env'] = ENVIRONMENT;

        if ($this->_cwdp->enforce_secure_connection != 1){
            $data['msg'] = "SECURE_CONNECTION_DISABLEED";
            return $data;
        }

        if ($serverHash != $hashKey){
            if(ENVIRONMENT == 'production' ){
                die(json_encode(array('hashResult' => $data)));
            }
            else{
                $data['serverHash']     = $serverHash;
                $data['receivedHash']   = $hashKey;
                if ($this->_debug){
                    $data['time']           = $time;
                    $data['code']           = $code;
                    $data['psk']            = $this->_psk;
                    $data['DBValue']        = $this->_cwdp;
                }
            }
        }else{
            $data['msg']            = 'HASH_SUCCEEDED';
        }
        return $data;
    }

    /*
     *  Lets you know if there is at least one NOT PRINTED order.
     *
     *  @access public
     *
     *  @param string
     *  @param  int
     *  @param  string
     *
     *  NO_ORDER = No order to print
     *   http://theroyals.lc/cwdp/order_new/NewOrder/1403917008/THIS_IS_DUMMY_HASH
     */
    public function order_new($order='NewOrder', $time=1403917008, $hashKey='THIS_IS_DUMMY_HASH') {
        $this->_logData( current_url(), __LINE__);
        $hashResult = $this->getHash($time, $order, $hashKey);
        $not_printed = $this->cm->single_row_where('orders_cwdp', array('printed' => 0 ));
        $order =  ($not_printed) ? $not_printed->order_code : 'NO_ORDER';
        header('Content-Type: application/json');
        echo $dataOutput = json_encode(array( 'order_code' => $order, 'hashResult' => $hashResult));
        $this->_logData('order_new, '.$dataOutput, __LINE__, current_url());
        exit;
    }

    /*
     *  Provide order data json
     *
     *  @access public
     *
     *  @param string
     *  @param  int
     *  @param  string
     *
     *  INVALID_ORDER_CODE = Order has not found in database, trigger issue.
     *  http://theroyals.lc/cwdp/order/AAA1786/1403917008/THIS_IS_DUMMY_HASH
     */
	public function order($order_code='AAA1786', $time=1403917008, $hashKey='THIS_IS_DUMMY_HASH') {
        $this->_logData( current_url(), __LINE__);
        $hashResult = $this->getHash($time, $order_code, $hashKey);
        $order = $this->cm->get_row('orders', 'order_code', $order_code);
        $order->hashResult = $hashResult;
        if($order)
            $order->items = unserialize($order->items);
        else
            $order = array ('order_code' => $order_code, 'msg' => 'INVALID_ORDER_CODE', 'hashResult' => $hashResult);

        header('Content-Type: application/json');
        echo $dataOutput =json_encode($order);
        $this->_logData('order,'.$dataOutput, __LINE__, current_url());
        exit;
	}

    /*
     *  UPDATE an order when it has printed successfully.
     *  @access public
     *
     *  @param      string
     *  @param      int
     *  @param      string
     *
     *  INVALID_ORDER_CODE = Order Does not exist in DB, Trigger did not work on server.
     *  ORDER_PRINTED = Order has printed previously, so it will not update anymore.
     *  UPDATED_SUCCEEDED = Successfully updated in Database, it will not show in order_new list anymore.
     *  UPDATED_FAILED_TRY_AGAIN = Update failed for server / connection error, Need to try again
     *  http://theroyals.lc/cwdp/order_printed/AAA1788/1403917008/THIS_IS_DUMMY_HASH
     */
	public function order_printed($order='AAA1786', $time=1403917008, $hashKey='THIS_IS_DUMMY_HASH') {
        $this->_logData( current_url(), __LINE__);
        $hashResult = $this->getHash($time, $order, $hashKey);
        if($order_info = $this->cm->single_row_where('orders_cwdp', array('order_code' => $order ))) {
            if ($order_info->printed == 1)
                $msg = 'ORDER_PRINTED @ ' . $this->hours->dayTimeView($order_info->print_time);
            else {
                $data = array('printed' => 1);
                if($order_info->print_time == NULL)
                    $data['print_time'] = ($time == 1403917008) ? $this->hours->localTime() : $time;
                $success = $this->cm->update('orders_cwdp', $data, array('order_code' => $order));
                $msg = ($success) ? 'UPDATED_SUCCEEDED' : 'UPDATED_FAILED_TRY_AGAIN';
            }
        }else{
            $msg = 'INVALID_ORDER_CODE';
        }
        header('Content-Type: application/json');
        echo $dataOutput = json_encode(array('order_code' => $order, 'msg' => $msg, 'hashResult' => $hashResult ));

        $this->_logData('order_printed,'.$dataOutput, __LINE__, current_url());
        exit;
	}

    /*
     *  Send Notification if any error occored..
     *  @access public
     *
     *  @param      string      .. Subject
     *  @param      int           .. Time
     *  @param      string      .. Subject
     *  @param      string      .. Email to  eng/client/engClient
     *  @param      string      .. Body
     *
     *  SUCCEEDE = Email sent Successfully
     *  FAILED = Email sent Failed
     *
     *  http://theroyals.lc/cwdp/notify/AAA1786_order_has_not_printes/1403917008/THIS_IS_DUMMY_HASH/eng/body
     */
	public function notify($subject='AAA1786_order_has_not_printes', $time=1403917008, $hashKey='THIS_IS_DUMMY_HASH', $emailTo='eng', $body='test'){
        $this->_logData( current_url(), __LINE__);
        $hashResult = $this->getHash($time, $subject, $hashKey);
        $to = $this->_cwdp->notify_email_eng;
        $greeting = ' A Notification from '.$this->_storeCode;
        $success = $this->emailm->send($to, $subject, $greeting, $body);
        $msg = ($success) ? 'SUCCEEDED' : 'FAILED';
        header('Content-Type: application/json');
        echo $dataOutput = json_encode(array('msg' => $msg, 'hashResult' => $hashResult));
        $this->_logData('notify,'.$dataOutput, __LINE__);
        exit;
    }

    /*
     *  Log File ..
     *  @access private
     *
     *  $this->_logData($data,, __LINE__);
     */
	private function _logData($data='Empty', $line=0){
        if ($this->_cwdp->log_active == 1){
            $this->tools->logFileWrite($data, $this->_cwdp->log_file_name, 'cwdp', basename(__FILE__), $line);
        }
    }

    /* End of file cwdp.php  // cwaiter desk printing */
    /* Location: ./application/controllers/cwdp.php */
}


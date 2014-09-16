<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Paypal extends CI_Controller
{

    private $_transactionMode = 'LIVE';
    private $_paypal = NULL;

    function __construct()
    {
        parent::__construct();
        $this->load->library('MyPayPal');
        $this->load->library('session');
        $this->load->model('paypalm');

        /* Stand alone system requires this part!!
        $this->db->cache_on();
        $this->_paypal = $this->paypalm->get_paypal();
        $this->db->cache_off();  */

        $this->load->model('dbm');
        $this->_paypal = $this->dbm->getRow('pay_paypal');

        $this->_transactionMode = ($this->_paypal->sandbox) ?  'TEST' : 'LIVE';

        $this->paypalm->logPaypal('Accessed With >> '.$this->_transactionMode, $this->_paypal); // Kicked off as soon as this controller accessed.
    }

    public function index() {
        $this->paypalm->logPaypal('Direct Access Attempted >> '.$this->_transactionMode, $this->_paypal);
        redirect($this->_paypal->index_redirect_url, 'refresh');
    }

    public function cancel() {
        $notification = "You have cancelled this transaction from PayPal <br /> Please choose another payment method to complete this order." ; // TODO
        $this->session->set_userdata('errorUser', "Cancelled from PayPal");
        $this->paypalm->logPaypal('Cancelled from PayPal >> '.$this->_transactionMode, $this->_paypal);
        redirect($this->_paypal->cancel_url, 'refresh');
    }


    public function process() {

        $paypalmode         = ($this->_paypal->sandbox) ? '.sandbox' : '' ;
        $completedMessage   = $this->_paypal->completed_message; // "Payment Received! Your product will be sent to you very soon!";
        $pendingMessage     = $this->_paypal->pending_message; //  'Transaction Complete, but payment is still pending! <br /> ' ."You need to manually authorize this payment in your <a href='http://www.paypal.com'>Paypal Account</a>";
        $successUrl         = $this->_paypal->success_url; //  'takeaway/process_order';
        $pendingUrl         = $this->_paypal->pending_url; //'takeaway/process_order';
        $siteLogo           = $this->_paypal->site_logo;
        $cartBorderColor    = $this->_paypal->cart_border_color;
        $PayPalApiUsername  = ($this->_paypal->sandbox) ? $this->_paypal->test_api_username     : $this->_paypal->api_username; //PayPal API Username
        $PayPalApiPassword  = ($this->_paypal->sandbox) ? $this->_paypal->test_api_password     : $this->_paypal->api_password; //Paypal API password
        $PayPalApiSignature = ($this->_paypal->sandbox) ? $this->_paypal->test_api_signature    : $this->_paypal->api_signature; //Paypal API Signature
        $PayPalReturnURL    = base_url() . $this->_paypal->return_url; //Point to process.php page
        $PayPalCancelURL    = base_url() . 'paypal/cancel'; //Cancel URL if user clicks cance

//        echo __LINE__;
        if ($this->uri->segment(3) == 1) //Post Data received from product list page.
        {
//            echo __LINE__;
            //Parameters for SetExpressCheckout, which will be sent to PayPal
            $padata = '&METHOD=SetExpressCheckout' .
                '&RETURNURL=' . urlencode($PayPalReturnURL) .
                '&CANCELURL=' . urlencode($PayPalCancelURL) .
                '&PAYMENTREQUEST_0_PAYMENTACTION=' . urlencode("SALE") .
                $this->paypalm->getIetms($this->session->userdata('items')) .

                '&NOSHIPPING=0' . //set 1 to hide buyer's shipping address, in-case products that does not require shipping
                $this->paypalm->getShippinDetails($this->_paypal).
                '&LOCALECODE=GB' . //PayPal pages to match the language on your website.
                '&LOGOIMG=' . $siteLogo . //site logo
                '&CARTBORDERCOLOR=' . $cartBorderColor . //border color of cart
                '&ALLOWNOTE=1';

            if($this->_paypal->log_query_string_active) $this->paypalm->logPaypal($padata, $this->_paypal);


            //We need to execute the "SetExpressCheckOut" method to obtain paypal token
            $paypal = new MyPayPal();
            $httpParsedResponseAr = $paypal->PPHttpPost('SetExpressCheckout', $padata, $PayPalApiUsername, $PayPalApiPassword, $PayPalApiSignature, $paypalmode);

            //Respond according to message we receive from Paypal
            if ("SUCCESS" == strtoupper($httpParsedResponseAr["ACK"]) || "SUCCESSWITHWARNING" == strtoupper($httpParsedResponseAr["ACK"])) {

                //Redirect user to PayPal store with Token received.
                $paypalurl = 'https://www' . $paypalmode . '.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=' . $httpParsedResponseAr["TOKEN"] . '';
                header('Location: ' . $paypalurl);

            } else {
                //Show error message
                $this->paypalm->unsuccessfulACK($httpParsedResponseAr, $this->_paypal);
            }

        }

        //Paypal redirects back to this page using ReturnURL, We should receive TOKEN and Payer ID
        if (isset($_GET["token"]) && isset($_GET["PayerID"])) {
            //we will be using these two variables to execute the "DoExpressCheckoutPayment"
            //Note: we haven't received any payment yet.

            $token = $_GET["token"];
            $payer_id = $_GET["PayerID"];

            $padata = '&TOKEN=' . urlencode($token) .
                '&PAYERID=' . urlencode($payer_id) .
                '&PAYMENTREQUEST_0_PAYMENTACTION=' . urlencode("SALE") .
                $this->paypalm->getIetms($this->session->userdata('items')) .
                $this->paypalm->getShippinDetails($this->_paypal);


            if($this->_paypal->log_query_string_active) $this->paypalm->logPaypal($padata, $this->_paypal);

            //We need to execute the "DoExpressCheckoutPayment" at this point to Receive payment from user.
            $paypal = new MyPayPal();
            $httpParsedResponseAr = $paypal->PPHttpPost('DoExpressCheckoutPayment', $padata, $PayPalApiUsername, $PayPalApiPassword, $PayPalApiSignature, $paypalmode);

            //Check if everything went ok..
            if ("SUCCESS" == strtoupper($httpParsedResponseAr["ACK"]) || "SUCCESSWITHWARNING" == strtoupper($httpParsedResponseAr["ACK"])) {
                $transactionInfo    = $this->session->userdata('transactionInfo');

                $status = $this->paypalm->getStatusHttpResponse($httpParsedResponseAr, $token, $payer_id, NULL);
                $this->paypalm->logPaypal($this->paypalm->arrayToString($status), $this->_paypal );

                /*
                 *      Sometimes Payment are kept pending even when transaction is complete.
                 *      hence we need to notify user about it and ask him manually approve the transiction
                 */

                if ('Completed' == $httpParsedResponseAr["PAYMENTINFO_0_PAYMENTSTATUS"]) {
                    $message = array('transactionMessage' => $completedMessage);
                    $redirect = $successUrl;
                } elseif ('Pending' == $httpParsedResponseAr["PAYMENTINFO_0_PAYMENTSTATUS"]) {
                    $message = array('transactionMessage' => $pendingMessage);
                    $redirect = $pendingUrl;
                }

                // Get Status information with Token Only
                $this->paypalm->getHttpResponseWithToken($token, $PayPalApiUsername, $PayPalApiPassword, $PayPalApiSignature, $paypalmode, $this->_paypal);


                $data = array_merge($transactionInfo, $status, $message);
                $this->session->set_userdata('transactionInfo', $data);
                redirect($redirect, 'refresh');

            } else {
                $this->paypalm->unsuccessfulACK($httpParsedResponseAr, $this->_paypal);
            }
        }

    }






    /* End of file paypal.php  // cwaiter desk printing */
    /* Location: ./application/controllers/paypal.php */
}


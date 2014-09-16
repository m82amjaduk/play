<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

if (!class_exists('CI_Model')) {
    class CI_Model extends Model {
    }
}

class Paypalm extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /*
     *  Get highlights for a specific module
     *
     *  @access     public
     *
     *  @param      string
     *
     *  $this->aboutm->get_paypal();
     */
    public function get_paypal(){
        $this->db->where('id', 1);
        $query = $this->db->get('pay_paypal');
        return ($query->num_rows > 0 ? $query->row() : array());
    }

    /*
     *  Get highlights for a specific module
     *   https://developer.paypal.com/webapps/developer/docs/classic/express-checkout/integration-guide/ECCustomizing/
     *
     *  @access     public
     *
     *  @param      array
     *
     *  $this->aboutm->getIetms();
     */
    public function getIetms($itemsArray=NULL) {
        $items = NULL;
        $i = 0;

        foreach ( $itemsArray as $item){
        $items .= '&L_PAYMENTREQUEST_0_NAME'.$i.'='.urlencode($item['title']).      // Name
            '&L_PAYMENTREQUEST_0_NUMBER'.$i.'='.urlencode($item['sn']).             // Code / Number
            '&L_PAYMENTREQUEST_0_DESC'.$i.'='.urlencode($item['title']).            //. Description
            '&L_PAYMENTREQUEST_0_AMT'.$i.'='.urlencode($item['price']).             // Price
            '&L_PAYMENTREQUEST_0_QTY'.$i.'='. urlencode($item['quantity']);         // Quantity
            $i++;
        }
        return $items;
    }


    public function logPaypal($data, $paypal, $fileLogName=NULL){
        if($paypal->log_file_active == 1 ){
            $transactionMode    = ($paypal->sandbox)?   'TEST' :  'LIVE';
            $fileLogName        = ($fileLogName) ? $fileLogName : $paypal->transaction_log;
            $fileLog            = $paypal->log_dir.'/'.$fileLogName;
            $row =
                date('Y-m-d').', '.
                date('H:i:s').', '.
                $_SERVER['REMOTE_ADDR'].', '.
                $this->session->userdata('order_id_temp').', '.
                $this->session->userdata('email').', '.
                $transactionMode.', '.
                $data;

            if (($fd = fopen($fileLog, "a+b")) !== false) {
                fwrite($fd, $row . "\n");
                fclose($fd);
            }
        }
    }


    public function unsuccessfulACK($httpParsedResponseAr, $paypal){
        $longMessage0 = 'Paypal :: ENGINEERING :: ' . urldecode($httpParsedResponseAr["L_LONGMESSAGE0"]);
        $this->logPaypal(print_r($httpParsedResponseAr, true), $paypal, $paypal->http_response_log);
        $this->logPaypal($longMessage0, $paypal);
        $this->session->set_userdata('errorUser',  $longMessage0);
    }


    public function getShippinDetails($paypal){
        //Mainly we need 4 variables from product page Item Name, Item Price, Item Number and Item Quantity.
        //Please Note : People can manipulate hidden field amounts in form.

        $transactionInfo = $this->session->userdata('transactionInfo');
        //Other important variables like tax, shipping cost
        $ItemTotalPrice     = $transactionInfo['ItemTotalPrice']; //(Item Price x Quantity = Total) Get total amount of product;
        $TotalTaxAmount     = $transactionInfo['TotalTaxAmount']; //Sum of tax for all items in this order.
        $HandalingCost      = $transactionInfo['HandalingCost'];  //Handling cost for this order.
        $InsuranceCost      = $transactionInfo['InsuranceCost'];  //shipping insurance cost for this order.
        $ShippinDiscount    = $transactionInfo['ShippinDiscount'];  //Shipping discount for this order. Specify this as negative number.
        $ShippinCost        = $transactionInfo['ShippinCost'];  //Although you may change the value later, try to pass in a shipping amount that is reasonably accurate.


        //Grand total including all tax, insurance, shipping cost and discount
        $GrandTotal = ($ItemTotalPrice + $TotalTaxAmount + $HandalingCost + $InsuranceCost + $ShippinCost + $ShippinDiscount);

        $urlBuilder =
            '&PAYMENTREQUEST_0_ITEMAMT=' . urlencode($ItemTotalPrice) .
            '&PAYMENTREQUEST_0_TAXAMT=' . urlencode($TotalTaxAmount) .
            '&PAYMENTREQUEST_0_SHIPPINGAMT=' . urlencode($ShippinCost) .
            '&PAYMENTREQUEST_0_HANDLINGAMT=' . urlencode($HandalingCost) .
            '&PAYMENTREQUEST_0_SHIPDISCAMT=' . urlencode($ShippinDiscount) .
            '&PAYMENTREQUEST_0_INSURANCEAMT=' . urlencode($InsuranceCost) .
            '&PAYMENTREQUEST_0_AMT=' . urlencode($GrandTotal) .
            '&PAYMENTREQUEST_0_CURRENCYCODE=' . urlencode($paypal->currency_code);

        return $urlBuilder;
    }

    public function getHttpResponseWithToken ($token, $PayPalApiUsername, $PayPalApiPassword, $PayPalApiSignature, $paypalmode, $paypalData){
        /*
             *      we can retrive transection details using either GetTransactionDetails or GetExpressCheckoutDetails
             *      GetTransactionDetails requires a Transaction ID, and GetExpressCheckoutDetails requires Token returned by SetExpressCheckOut
             */
        $padata = '&TOKEN=' . urlencode($token);
        $paypal = new MyPayPal();
        $httpParsedResponseAr = $paypal->PPHttpPost('GetExpressCheckoutDetails', $padata, $PayPalApiUsername, $PayPalApiPassword, $PayPalApiSignature, $paypalmode);

        if ("SUCCESS" == strtoupper($httpParsedResponseAr["ACK"]) || "SUCCESSWITHWARNING" == strtoupper($httpParsedResponseAr["ACK"])) {
            if ($paypalData->http_response_log_active == 1)
                $this->logPaypal(print_r($httpParsedResponseAr, true), $paypalData, $paypalData->http_response_log);
            return $httpParsedResponseAr;

        } else {
            $this->unsuccessfulACK($httpParsedResponseAr, $paypalData);
            return $httpParsedResponseAr;
        }

    }

    public function getStatusHttpResponse($httpParsedResponseAr, $token, $payer_id, $type=NULL ){
        return  array(
            'transactionID'     => urldecode($httpParsedResponseAr["PAYMENTINFO_0_TRANSACTIONID"]),
            'transactionStatus' => urldecode($httpParsedResponseAr["PAYMENTINFO_0_PAYMENTSTATUS"]),
            'ACK'               => urldecode($httpParsedResponseAr["ACK"]),
            'token'             => $token,
            'payerID'           => $payer_id
        );
    }
    public function arrayToString($array){
        $string =NULL;
        foreach ($array as $Key => $Value)
            $string .=  $Key . ' =>  ' . $Value.', ';
        return $string;
    }

///////////////////////////////////// ///////////////////////////////////////
}
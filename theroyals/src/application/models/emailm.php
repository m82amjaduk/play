<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

if (!class_exists('CI_Model')) {
    class CI_Model extends Model {
    }
}

class Emailm extends CI_Model
{
    private $_data          = array();
    private $_logActive     = 1;
    private $_logFile       = 'email.log';

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
        $this->load->library('email');
        $this->load->model('dbm');
        $this->_data =  $this->dbm->getRow('settings_email_config');
        //if($this->_data->active != 1) die('Email Sending is not enable !!! ');
    }



//////Send a system email ///////////////////////////////////////////
    // $this->emailm->send($to, $subject, $greeting, $body_text);
    public function send($to, $subject, $greeting, $body_text, $cc=NULL){
        $server                 = $_SERVER['SERVER_NAME'];
        $trackingEmailActive    = 1;
        $trackingEmail          = 'orderstakeaway@gmail.com';
        $FromEmail              = $this->_data->email_from;     // 'system@conosurtek.co.uk';
        $sendFrom               = $this->_data->send_from;      // The Royals Restaurant

        $config['smtp_host']    = $this->_data->smtp_host;      // '109.203.123.78';
        $config['smtp_user']    = $this->_data->smtp_user;      // 'system+conosurtek.co.uk';
        $config['smtp_pass']    = $this->_data->smtp_password;  // 'sys797';
        $config['mailtype']     = $this->_data->mailtype;       // 'html';
        $config['protocol']     = $this->_data->protocol;       // 'smtp';


        $this->email->initialize($config);


        $body = "$greeting <br /> $body_text
            <br /><br /> Processed Via :: $server @ ".
            $this->hours->dayTimeView();

        $this->email->from($FromEmail,  $sendFrom);
        $this->email->to($to);
        if($trackingEmailActive)
            $this->email->cc($trackingEmail);
//        if ($cc) $this->email->cc($cc);
        $this->email->subject($subject);
        $this->email->message($body);

        try{
            $data = ($this->email->send())? 'succeeded' : 'FAILED';
        }catch(Exception $e) {
            $this->tools->logFileWrite('Message: ' .$e->getMessage(), 'email.log', 'AAA1786', basename(__FILE__), __LINE__);
            $data = 'FALIED';
        }
        $this->_logData($data." >> $to :: $subject ", __LINE__);
        return TRUE;
    }


    /*
     *  Log File ..
     *  @access private
     *
     *  $this->_logData($data, __LINE__);
     */
    private function _logData($data='Empty', $line=0){
        if ($this->_logActive == 1){
            $this->tools->logFileWrite($data, $this->_logFile, 'email', basename(__FILE__), $line);
        }
    }



////////////////////////////////////////////////////////////////////////////
}
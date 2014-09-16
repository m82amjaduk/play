<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 15/07/14
 * Time: 02:41
 */



function profiler_hooks(){
    $CI =& get_instance();
//    ( (ENVIRONMENT == 'development') || $this->ion_auth->is_admin()) ?
//        $CI->output->enable_profiler(TRUE) : FALSE;
     (ENVIRONMENT == 'development') ?
        $CI->output->enable_profiler(TRUE) : FALSE;


//    $CI->load->library('session' );
//    $CI->load->library('tools');
//    // Error and warnig report
//    if($errorUser = $CI->session->userdata('errorUser')) {
//        $CI->tools->logFileWrite($errorUser, 'errorUser.csv', 'AAA1786', basename(__FILE__), __LINE__);
//    }
//    $CI->tools->logFileWrite($this->uri->segment(2), 'visitorLog.csv', 'AAA1786', basename(__FILE__), __LINE__);
}
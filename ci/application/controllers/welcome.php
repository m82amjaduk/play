<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

    public function index() {
        $this->load->view('welcome');
    }


    // http://learning7.lc/ci/welcome/download_process
    public function download_process()
    {
        $this->load->helper('download');
        $data = 'Here is some text!';
        $name = 'mytext.txt';

        force_download($name, $data);
    }

    public function upload() {
        $this->load->view('upload');
    }


    public function upload_process() {
        $config['upload_path'] = './uploads/';
        $config['allowed_types'] = 'gif|jpg|png|xls|csv';
        $config['max_size'] = '0';
        $config['max_width'] = '0';
        $config['max_height'] = '0';
        $config['overwrite'] = TRUE;
        $config['file_name'] = 'products.xls';
        $this->load->library('upload', $config);

        if (!$this->upload->do_upload()){
//            die('File Upload Failed.');
            echo $this->upload->display_errors( );
        }
        else
            die('success');
//            redirect('http://learning7.lc/ci/index.php/welcome/upload'.$table, 'refresh');
    }


    public function genCSVnSend() {
        date_default_timezone_set('Europe/London') ;
        // Create CSV
        $data = 'test, test2';
        $dir = 'var/temp/';
        $filePath = $dir. 'OrderExportCsv_'.date('y-m-d-H-i-s').'.csv';  // echo file_exists($filePath);

        // Write CSV To temp folder
        $this->load->helper('file');
//        if (!is_dir($dir)) { mkdir($dir, 0777, true);}
        $this->createPath($dir);
        write_file($filePath, $data, 'w+');

        // attach CSV from temp folder And Send
        /*
        $this->emailm->send($to, $subject, $greeting, $body_text, array(), array($filePath));

        if(!empty($files)){
            foreach ($files as $file)
                $this->email->attach($file);
        } */

        // Delete CSV
        delete_files($filePath);
        echo '<br>done';
    }

    // Move this to filesdir.php  // Class
    /**
     * recursively create a long directory path
     */
    function createPath($path) {
        if (is_dir($path)) return true;
        $prev_path = substr($path, 0, strrpos($path, '/', -2) + 1 );
        $return = createPath($prev_path);
        return ($return && is_writable($prev_path)) ? mkdir($path) : false;
    }


    function getreport(){
        $v =0;
        $report = array(
            array('Total Orders', $v)
            , array('Total In Amount', $v)
            , array('Cash Paid Orders', $v)
            , array('Cash Paid Amount', $v)
            , array('Card Paid Orders', $v)
            , array('Card Paid Amount', $v)
            , array('Paypal Paid Orders', $v)
            , array('Paypal Earned Amount', $v)
            , array('Paypal Fee', $v)
            , array('Paypal Commission', $v)
            , array('Paid To Paypal', $v)
            , array('Net Paypal Earned', $v)
            , array('Total Cancelled Orders', $v)
            , array('Total Cancelled Amount', $v)
            , array('Net Paypal Earned', $v)
            , array('10% Of total Sale', $v)
            , array('Transfer To Client', $v)
        );
        return $report;
    }


    /* End of file welcome.php */
    /* Location: ./application/controllers/welcome.php */
}

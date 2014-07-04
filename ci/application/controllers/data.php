<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Data extends CI_Controller {

    public function index() {
        $this->load->view('welcome');
    }


    // http://learning7.lc/ci/index.php/data/getpayoption
    public function getpayoption(){
        $this->load->model('aboutm');
        $data = $this->aboutm->pay_options_get_data();
        echo '<pre>';
        print_r($data);
    }


    /* End of file data.php */
    /* Location: ./application/controllers/data.php */
}

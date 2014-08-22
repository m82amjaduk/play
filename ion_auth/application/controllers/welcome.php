<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

    public function index() {
        $this->load->view('welcome');
    }


    // http://learning7.lc/ion_auth/welcome/download_process
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
    }


    /*
     * http://learning7.lc/ion_auth/index.php/welcome/order_api_config
     */
    public function order_api_config() {
        $this->load->database();
        $this->db->where('business_code', 'AAA1787');
        $query = $this->db->get('order_api_config');
        $row = ($query->num_rows > 0 ? $query->row() : array());

        header('Content-Type: application/json');
        echo json_encode($row);
    }

    /*
     * http://learning7.lc/ion_auth/index.php/welcome/creatDB
     */
    public function creatDB() {
        $this->load->library('migration');
//        echo $this->migration->current();

        if ( ! $this->migration->current())
        {
            show_error($this->migration->error_string());
        }
//        $this->load->model('trackerm');
//        $this->trackerm->creatDB();
    }

    /* End of file welcome.php */
    /* Location: ./application/controllers/welcome.php */
}

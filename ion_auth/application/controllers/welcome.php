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


    /* End of file welcome.php */
    /* Location: ./application/controllers/welcome.php */
}

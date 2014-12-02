<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

    public function index() {
//        trigger_error( 'Whoops!', E_USER_NOTICE );
        $this->load->database();
        $this->db->where('business_code', 'AAA1787');
        $query = $this->db->get('order_api_config');
        $row = ($query->num_rows > 0 ? $query->row() : array());
        $this->load->view('welcome');
    }


    // http://learning7.lc/ci_ion_auth/welcome/download_process
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


    /*
 * http://play.lc/ci_ion_auth/index.php/offers/welcome/1
 */
    public function prod($id=1) { //
//        $this->load->model('products');
        $this->load->model('products');
        $this->trackerm->creatDB();
    }




    // http://play.lc/ci_ion_auth/index.php/welcome/sms
    public function sms(){ // die('fds');
        $this->load->library('curl');
        $sms_status = $this->curl->simple_get('http://213.104.214.8:9090');
        echo $sms_status;

    }

    // http://play.lc/ci_ion_auth/index.php/welcome/distacne
    public function distacne(){
        $this->load->library('map');
        echo '<pre>';
        print_r($this->map->getDistanceByAddress('GU215ED','N90AY'));
        echo '========================================<br />';
        print_r($this->map->getLngLat('GU215ED'));
        echo '========================================<br />';
        print_r($this->map->getLngLat('N90DY'));
        echo '========================================<br />';
        echo 'GU215ED >> N90DY =====>> '. $this->map->getDistance(51.3262614, -0.5452457, 51.6206058, -0.0591767)->feet .'<br />' ;
        echo '========================================<br />';
        $from = $this->map->getLngLat('GU215ED');
        $to = $this->map->getLngLat('GU215AH');
        echo 'GU215ED >> GU215AH =====>> '. $this->map->getDistance($from->lat, $from->lng, $to->lat, $to->lng)->feet .'<br />' ;
        echo '========================================<br />';
        print_r($this->map->getDistanceByAddress('GU215ED','GU215AH'));


    }






    /* End of file welcome.php */
    /* Location: ./application/controllers/welcome.php */
}

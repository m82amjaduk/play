<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Import extends CI_Controller {

//    private $_cart;

    function __construct() {
        parent::__construct();
//        (ENVIRONMENT == 'development') ? $this->output->enable_profiler(TRUE): FALSE;
        $this->load->config('cwaiter');
        $this->load->model('cm');
        $this->load->dbutil();
        $this->load->helper('file');
        $this->load->helper('download');
        $this->load->helper('form');
        $this->load->library('csvreader');
        $this->load->library('ion_auth');
        if (!$this->ion_auth->is_admin())
            redirect('auth', 'refresh');

        $this->_menuMainPage = $this->config->item('adminMainPage');
    }

	public function index() {
        redirect('import/exportCSV', 'refresh');
	}

    // Take this  to class CSVMySQL
    // http://theroyals.lc/import/exportCSV
    public function exportCSV($table='prod_list'){ //prod_category  ;  prod_list ;
        if (!$this->db->table_exists($table))
            die("Database Table '$table' Does not exist");
        $report = $this->cm->dbResults($table);
        $new_report = $this->csvreader->csv_from_result($report, ',', "\n",'"');
        force_download("$table.csv", $new_report);
    }


    // http://theroyals.lc/import/upload
	public function upload( ) {
        $this->data['page']= 'import/upload';
        $this->load->view($this->_menuMainPage, $this->data);
	}

	public function upload_process( ) {
        $this->config->set_item('csrf_protection', FALSE);
        $table = $this->input->post('table');

        $config['upload_path'] = './var/upload/';
        $config['allowed_types'] =  '*';
        $config['max_size'] = '0';
        $config['max_width'] = '0';
        $config['max_height'] = '0';
        $config['overwrite'] = TRUE;
        $config['file_name'] = "$table.csv";

        $this->load->library('upload', $config);


        if (!$this->upload->do_upload())
            die( $this->upload->display_errors());
        else{
            $successArray = $this->upload->data();
            $success = "File Upload Succeeded ". implode('|',$successArray);
        }
        $result =   $this->csvreader->parse_file($successArray['full_path']);
        $this->db->truncate($table);
        foreach ($result as $row) {
            $this->cm->insert_data($table, $row);
        }
        echo '<pre>'; print_r($result);
    }



    /*

       function product_get($table){
           if($this->usersm->aj_tanj() == FALSE) die('You Are Not Authorized For This Operation. :((');

   // $hash = $invoice_no . $method . $promissed_time;
   // $hash = sha1($hash);
           $url = base_url().'cono/modules/read_menu/';
           $data = $this->curl->simple_get($url);
           $this->currentm-> email_mass('m82amjad@gmail.com', $this->currentm->client_id().'Product Upload>>'.$table, $data);
   // echo $data; exit;
           $data = ($data) ? $data : 'url_not_found';

           if ($data != 'url_not_found') {
               $data = json_decode($data);

               if($table == 'product')
                   $this->upload_product($data);
               else if ($table == 'category')
                   $this->upload_category($data);
               else if ($table == 'meat')
                   $this->upload_joins($data, 'product_meat_join',  'product_meats_id');
               else if ($table == 'accompaniments')
                   $this->upload_joins($data, 'product_accompaniments_join',  'product_accompaniments_id');
               else if ($table == 'portion_size')
                   $this->upload_joins($data, 'product_portion_size_join' ,  'product_portion_size_id');

               redirect('products/sections', 'refresh');

           }else{
               $this->currentm->report_error('eng', 'AAA18xx -> Product has not updated ', 'When product uploaded <br /><br />ERROR : ' . $udated . '<br />Source : ' . $this->common_model->curPageURL() . '<br /> Destination : ' . $url);
               die('Product has not updated.');
           }
       }





           public function prod( ) {
               $table = 'prod_list'; // 'prod_meats';  prod_meat_price ;  prod_list ;  prod_category
               $file = fopen("var/uploads/test.csv","w") or die("can't open file");
               $key = $this->cm->dbFields($table);
               $val = $this->cm->get_data($table);
               fputcsv($file, array_values($key));
               foreach ($val as $row){
                   $row = (array)$row;
                   fputcsv($file, array_values($row));
               }
               fclose($file);
           }*/







    /* End of file cwdp.php  // import export data  */
    /* Location: ../application/controllers/import.php */
}
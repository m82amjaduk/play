<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Adm_settings extends CI_Controller {

    /*
     * http://learning7.lc/ci_ion_auth/index.php/adm_settings
     */
    public function index() {
        $this->data['name'] = 'test';
        $this->load->view('adm/main.php', $this->data);
    }
    /*
     * http://play.lc/ci_ion_auth/index.php/adm_settings/edit
     */
    public function edit($table='settings_business', $id=1) {

        $this->load->database();
        $this->data['schema'] = $this->db->field_data($table);
        $this->db->select('*') ->from($table) ->where('id', $id);
        $this->data['data'] = $this->db->get()->row() ;
        $this->data['process'] = "adm_settings/edit_process/$table/$id";

        $this->load->view('adm/main.php', $this->data);
    }

    public function edit_process($table, $id) {
        $this->load->database();
        $postData = $this->input->get(NULL, TRUE);
        unset($postData['submitimage_x'],$postData['submitimage_y']);
        echo '<pre>';print_r($postData); exit;
        $this->db->where('id', $id);
        $this->db->update($table, $postData);
    }


    /*
     * http://play.lc/ci_ion_auth/index.php/adm_settings/test
     */
    public function test($table='settings_business2') {
        $this->load->database();
//        $data = $this->db->query("select column_comment from information_schema.columns where table_name = '$table';");
//        $data = $this->db->query("SHOW FULL COLUMNS FROM  $table");
        $data = $this->db->query("SHOW FULL COLUMNS FROM  $table");
        echo '<pre>';print_r($data);
    }


    /* End of file welcome.php */
    /* Location: ./application/controllers/welcome.php */
}

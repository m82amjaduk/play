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
     * http://learning7.lc/ci_ion_auth/index.php/adm_settings
     */
    public function edit($table, $id) {

        $this->load->database();
        $this->data['schema'] = $this->db->field_data($table);
        $this->db->select('*') ->from($table) ->where('id', $id);
        $this->data['data'] = $this->db->get()->row() ;
        $this->data['process'] = "adm_settings/edit_process/$table/$id";

//        echo '<pre>'; print_r($this->data['data']); exit;

        $this->load->view('adm/main.php', $this->data);
    }

    public function edit_process($table, $id) {

        $this->load->database();
        $postData = $this->input->get(NULL, TRUE);
        unset($postData['submitimage_x'],$postData['submitimage_y']);
        echo '<pre>';print_r($postData);
        $this->db->where('id', $id);
        $this->db->update($table, $postData);
    }


    /* End of file welcome.php */
    /* Location: ./application/controllers/welcome.php */
}

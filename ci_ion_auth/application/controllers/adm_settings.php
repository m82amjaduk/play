<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Adm_settings extends CI_Controller {

    /*
     * http://learning7.lc/ci_ion_auth/index.php/adm_settings
     */
    public function index() {

        $this->load->database();
        $this->data['table'] = $this->db->field_data('settings_system');
        $this->db->select('*') ->from('settings_system') ->where('id', 1);
        $this->data['data'] = $this->db->get()->row() ;
//        echo '<pre>'; print_r($this->data['data']); exit;

        $this->load->view('adm/main.php', $this->data);
    }


    /* End of file welcome.php */
    /* Location: ./application/controllers/welcome.php */
}

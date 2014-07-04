<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

if (!class_exists('CI_Model')) {
    class CI_Model extends Model {
    }
}

class Aboutm extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
    }
    /*
     *  Get highlights for a specific module
     *
     *  @access     public
     *
     *  @param      string
     *
     *  $this->aboutm->get_cms_highlights($module);
     */
    public function get_cms_highlights($module='welcome'){
        $where = array('alias' => $module, 'active' => 1);
        $this->db->where($where);
        $this->db->order_by('sn', 'asc');
        $query = $this->db->get('cms_highlights');
        return ($query->num_rows > 0 ? $query->result() : array());
    }

    /*
     *  Get contact page settings
     *
     *  @access     public
     *
     *  $this->aboutm->get_settings_contact($module);
     */
    public function get_settings_contact(){
        $this->db->where('id', 1);
        $query = $this->db->get('settings_contact');
        return ($query->num_rows > 0 ? $query->row() : array());
    }

    /*
     *  Get contact page settings
     *
     *  @access     public
     *
     *  $this->aboutm->get_settings_contact($module);
     */
    public function get_settings_business(){
        $this->db->where('id', 1);
        $query = $this->db->get('settings_business');
        return ($query->num_rows > 0 ? $query->row() : array());
    }

    /*
     *  Get contact page settings
     *
     *  @access     public
     *
     *  $this->aboutm->pay_options_get_data();
     */
    public function pay_options_get_data(){

    }

///////////////////////////////////// ///////////////////////////////////////
}
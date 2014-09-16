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
        $this->load->model('cm');
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
    public function get_cms_highlights($method='about/home'){
        $where = array('method' => $method, 'active' => 1);
        $this->db->where($where);
        $this->db->order_by('sn', 'asc');
        $query = $this->db->get('cms_highlights');
        return ($query->num_rows > 0 ? $query->result() : array());
    }

    /*
     *  Get a article
     *
     *  @access     public
     *
     *  @param      string
     *
     *  $this->aboutm->get_cms_article($module);
     */
    public function get_cms_article($alias='about_us'){
        $where = array('alias' => $alias, 'active' => 1);
        $this->db->where($where);
        $this->db->order_by('sn', 'asc');
        $query = $this->db->get('cms_article');
        return ($query->num_rows > 0 ? $query->row() : array());
    }

    /*
     *  Process Highligts
     *
     *  @access     public
     *
     *  $this->aboutm->process_highlights($highlights, array('mid_text',  'special'));
     */
    public function process_highlights($highlights, $modules){
        $modules_new = array();
        foreach ($highlights as $row) {
            foreach ($modules as $mod) {
                if ($row->module == $mod) {
                    $modules_new[$mod][] = $row;
                }
            }
        }
        return $modules_new;
    }
//
//    /*
//     *  Get contact page settings
//     *
//     *  @access     public
//     *
//     *  $this->aboutm->get_settings_contact();
//     */
//    public function get_settings_contact(){
//        $this->db->where('id', 1);
//        $query = $this->db->get('page_contact');
//        return ($query->num_rows > 0 ? $query->row() : array());
//    }

    /*
     *  Process phone number
     *
     *  @access     public
     *
     *  $this->aboutm->get_contact_phone($contact, $business );
     */
    public function get_contact_phone($contact, $business ) {
        if ($contact->phone == '#' || empty($contact->phone)) {
            $phone    = ($business->phone1) ? $business->phone1 :  NULL;
            $phone    .= ($business->phone2) ? ', '.$business->phone2 :  NULL;
            $phone    .= ($business->phone3) ? ', '.$business->phone3 :  NULL;
            return $phone;
        }else {
            return $contact->phone;
        }
    }

    /*
     *  Process address
     *
     *  @access     public
     *
     *  $this->aboutm->get_contact_address($contact, $business );
     */
    public function get_contact_address($contact, $business ) {
        if ($contact->address == '#' || empty($contact->address)) {
            $address     = ($business->house_number)    ? $business->house_number       :  NULL;
            $address    .= ($business->address1)        ? ' '.$business->address1       :  NULL;
            $address    .= ($business->address2)        ? ', '.$business->address2      :  NULL;
            $address    .= '<br />';
            $address    .= ($business->town)            ?  $business->town              :  NULL;
            $address    .= ($business->city)            ? ', '.$business->city          :  NULL;
            $address    .= ($business->county)          ? ', '.$business->county        :  NULL;
            $address    .= '<br />';
            $address    .= ($business->postcode)        ? $business->postcode           :  NULL;
            $address    .= ($business->direction)       ? '<br />'.$business->direction :  NULL;
            return $address;
        }else {
            return $contact->address;
        }
    }



///////////////////////////////////// ///////////////////////////////////////
}
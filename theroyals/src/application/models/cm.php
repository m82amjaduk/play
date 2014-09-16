<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

    if (!class_exists('CI_Model')) {
        class CI_Model extends Model {
        }
    }

    class Cm extends CI_Model {

        public function __construct() {
            parent::__construct();
            $this->load->database();
            $this->load->helper('cookie');
            $this->load->helper('date');
            $this->load->library('session');
            $this->gallery_path = realpath(APPPATH . '../uploads');
    }

    /*
     * this is MASTER COMMON MODEL
     * Any changes to common Model must update here.
     * This will be also Master for usersm Model
     */

    /////////////////////////////////////////////////////////////////////////////
    //                                                              DATABASE OPERATION                              //
    /////////////////////////////////////////////////////////////////////////////
    /////////////////ALL DATA      ///////////////////////////////////////////
 
    function get_data($table) {
        $this->db->order_by("id", "asc");
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->result() : array());
    }

    function get_table_dec($table) {
        $this->db->order_by("time", "desc");
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->result() : array());
    }

    //$this->cm->get_table_ordered('table', 'id', 'desc');
    function get_table_ordered($table, $ordered_field, $ordered) {
        $this->db->order_by($ordered_field, $ordered);
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->result() : array());
    }
    

    /* Aj- order = "desc", "asc"
      function get_all_table_data_ordered($table, $field, $ordered){
      $this->db->order_by($field, $ordered);
      $query=$this->db->get($table);
      return ($query->num_rows >0 ? $query->result() : array());
      } */
    

////////////////////////// Get Value of a Column/////////////////////////////////      
    // Get a column value where id = $id.
    // $this->cm->val('settings_business', 'business_name', 1, 'id'); 
    // $this->cm->val('settings_business', 'business_name');
    function val($table, $col, $value =NULL, $filed=NULL) {
        $filed = ($filed) ? $filed : 'id';
        $value = ($value) ? $value : 1;
        $this->db->where($filed, $value);
        $query = $this->db->get($table); 
        
        if($query->num_rows > 0){
            $row = $query->row();
            $value = $row->$col;
            unset($row); unset($query); 
            return $value;
        }else return FALSE;
    }
    
    //$this->cm->settings_data('settings_business', 'loggin_id, time, active', 1 , 'id' );
    //$this->cm->settings_data('settings_business', 'loggin_id, time, active' );
    function settings_data($table, $col, $value =NULL, $filed=NULL) {
        $filed = ($filed) ? $filed : 'id';
        $value = ($value) ? $value : 1;
        
        $this->db->select($col);
        $this->db->where($filed, $value);
        $query = $this->db->get($table);
        $data = ($query->num_rows > 0 ? $query->row() : array());
        unset($query);
        return $data;
    }
    
    
////////////////////////// SINGLE ROW/////////////////////////////////      
    // Get a Single row from a table 
    function get_single_row($table) {
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->row() : array());
    }

    //$this->cm->get_row('table', $field, $value);. // get_table_data_by_id, deleted table
    function get_row($table, $field, $value) {
        $this->db->where($field, $value);
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->row() : array());
    }

    //$this->cm->single_row_where('table', $where);
    function single_row_where($table, $where) {
        $this->db->where($where);
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->row() : array());
    }

    //$this->cm->row_where_col('', array(), 'name, time, loggin_id');
    function row_where_col($table, $where, $col) {
        $this->db->select($col);
        $this->db->where($where);
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->row() : array());
    }

    public function dbFields($table) {
        return $this->db->list_fields($table);
    }

    public function dbResults($table){
        return $query = $this->db->get($table);
    }

    /* Get a row where 
      function get_data_where($table,$where_data){
      $this->db->where($where_data);
      $query=$this->db->get($table);
      return ($query->num_rows >0 ? $query->row() : array());
      } */

    //////////////////WHERE ROWS////////////////////////////////////////////////       
    //Do not use this function use //$this->cm->where('table', $where);
    function get_set_of_data_where($table, $where_data) { 
        $this->db->where($where_data);
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->result() : array());
    }
    
    //$this->cm->where('table', $where);
    function where($table, $where_data) {
        $this->db->where($where_data);
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->result() : array());
    }

    //$this->cm->where_ordered('table', array('active' => 'Y'), 'sn', 'desc')
    function where_ordered($table, $where, $ordered_field, $ordered) {
        $this->db->where($where);
        $this->db->order_by($ordered_field, $ordered);
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->result() : array());
    }

    //$this->cm->where_by_ordered('table', array('active' => 'Y'), 'sn', 'asc');
    function where_by_ordered($table, $where, $ordered_field, $ordered) {
        $this->db->select($table . '.*,user_reg.fname,user_reg.lname');
        $this->db->join('user_reg', $table . '.by =user_reg.code', 'left');
        $this->db->where($where);
        $this->db->order_by($ordered_field, $ordered);
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->result() : array());
    }
    
    //$this->cm->where_col_ordered($table, array('active' => 'Y'), 'id, sn', 'id', 'asc');
    //$this->cm->where_col_ordered($table, array('active' => 'Y'), 'id,sn');
    function where_col_ordered($table, $where, $col, $ordered_field=NULL, $ordered=NULL) {
        $ordered = ($ordered)? $ordered : 'desc';
        $ordered_field = ($ordered_field)? $ordered_field : 'id';
        
        $this->db->select($col);         
        $this->db->order_by($ordered_field, $ordered);
        
        $this->db->where($where);
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->result() : array());
    }

    //Aj- from time to to time ordered by 
    //$this->cm->from_to_ordered($table, $from, $to, 'id', 'desc')
    function from_to_ordered($table, $from, $to, $ordered_field, $ordered) {
        $this->db->where('time >=', $from);
        $this->db->where('time <=', $to);
        $this->db->order_by($ordered_field, $ordered);
        $query = $this->db->get($table);
        return $query->result();
    }

    //Aj- sets of data with logged by name descending order.
    function get_set_of_data_where_by_desc($table, $where_data) {
        $this->db->select($table . '.*,user_reg.fname,user_reg.lname');
        $this->db->join('user_reg', $table . '.by =user_reg.code', 'left');
        $this->db->order_by("time", "desc");
        $this->db->where($where_data);
        $query = $this->db->get($table);
        return $query->result();
    }

///////////////////////////// UPDATE DELETE INSERT///////////////////////               

    //$this->cm->update('table', $data, $where); $where= array('id'=>$id);
    function update($table, $data, $where) {
        $this->db->where($where);
        $this->db->update($table, $data);
        return TRUE;
    }

    //$this->cm->insert_data('table', $data);
    function insert_data($table, $data) {
        $this->db->insert($table, $data);
        return $this->db->insert_id();
    }
    
    //$this->cm->insert_batch('table', $data); // Could not get it working yet!!! 
    function insert_batch_data($table, $data) { 
        die('Could not get it working yet!!!');
        $this->db->insert_batch($table, $data);
//        return $this->db->insert_id();
    }

    //$this->cm->delete_data('table', $where)
    function delete_data($table, $where) {
        $this->db->where($where);        
        return $this->db->delete($table);
    }

    function update_data($table, $data) {
        $query = $this->db->get($table);

        if ($query->num_rows > 0)
            $this->db->update($table, $data);
        else
            $this->insert_data($table, $data);
    }

    function get_table_data_limit($table, $limit, $offset) {
        $this->db->limit($limit, $offset);
        $query = $this->db->get($table);
        return ($query->num_rows > 0 ? $query->result() : array());
    }
    
    
    //$this->cm->exist('table', array('user_code' => $this->session->userdata('userid')));
    function exist($table, $where) {
        $res = $this->cm->single_row_where($table, $where);
        $res = ($res)? 'Y' : 'N';
        return $res;
    }
    
    //$this->cm->sum('table', array('user_code' => $this->session->userdata('userid')), 'row_total');
    function sum($table, $where, $col) {
        $this->db->select('SUM('.$col.') as score');
        $this->db->where($where);
        $q = $this->db->get($table);
        $row = $q->row();
        $res = $row->score;
        return $res;
    }
    
  
    

    /////////////////////////////////////////////////////////////////////////////
    //                           SERIAL AND EMAIL                              //
    ///////////////////////////////////////////////////////////////////////////// 


/*
//$this->cm->generate_id('order_code', 'invoices2')
    public function generate_id($where_id, $table_name) {
        $table = $table_name;
        $alphabet = array("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z");
        $this->db->select($where_id);
        $this->db->from($table);
        $this->db->order_by($where_id, 'desc');
        $this->db->limit(1);
        $query = $this->db->get();
        $data = ($query->num_rows > 0) ? $query->row() : array();
        if (isset($data->$where_id) && $data->$where_id != NULL)
            $last_property_id = $data->$where_id;


        if (isset($last_property_id) && $last_property_id != NULL) {
            $sample_id = $last_property_id;
            $first = substr($sample_id, 0, 1);
            $second = substr($sample_id, 1, 1);
            $third = substr($sample_id, 2, 1);
            $number = (int) substr($sample_id, 3, 4);

            if ($sample_id != NULL) {
                if ($number == 9999) {
                    $number = 1786;
                    $n_f = array_search($first, $alphabet);
                    $n_s = array_search($second, $alphabet);
                    $n_t = array_search($third, $alphabet);
                    if ($n_t == 25) {
                        $n_t = $alphabet[0];
                        if ($n_s == 25) {
                            $n_s = $alphabet[0];
                            $n_f = $alphabet[$n_f + 1];
                        } else {
                            $n_s = $alphabet[$n_s + 1];
                            $n_f = $first;
                        }
                    } else {
                        $n_t = $alphabet[$n_t + 1];
                        $n_s = $second;
                        $n_f = $first;
                    }
                } else {
                    $number++;
                    $n_t = $third;
                    $n_s = $second;
                    $n_f = $first;
                }
                return $new_id = $n_f . $n_s . $n_t . $number;
            }
        } else {
            $id = "AAA1786";
            return $id;
        }
    }
*/


    /////////////////////////////////////////////////////////////////////////////
    //                          ARRAY URL                              //
    /////////////////////////////////////////////////////////////////////////////


    function array_push_assoc($array, $key, $value) {
        $array[$key] = $value;
        return $array;
    }

    //Remove Base URL from a URL.
    //$this->cm->no_base_url($_SERVER['HTTP_REFERER'])
    function no_base_url($referer) {
        $base_url_char = strlen(base_url());
        $no_base_url = substr($referer, $base_url_char);
        return $no_base_url;
    }
    
    
    //$this->common_model->cont_mentod() 
    // me = method, ct = controller, cm == controller/Method, ur = domain/controller/method, hr = http://domain/cont/meth, 
    function cont_mentod($type = NULL) {
        $htt = (!empty($_SERVER['HTTPS']) ) ? 'https://' : 'http://';
        $cont = $this->uri->segment(1);
        $meth = $this->uri->segment(2);
        if ($type == 'ct')
            return $cont;
        else if ($type == 'me')
            return $meth;
        else if ($type == 'cm')
            return $cont . '/' . $meth;
        else if ($type == 'ur')
            return $_SERVER['HTTP_HOST'] . '/' . $cont . '/' . $meth;
        else if ($type == 'hr')
            return $htt . $_SERVER['HTTP_HOST'] . '/' . $cont . '/' . $meth;
        else
            $cont . '/' . $meth;
    }

    //$this->cm->curPageURL()
    function curPageURL() {
        $pageURL = (!empty($_SERVER['HTTPS']) ) ? 'https://' : 'http://';
        if ($_SERVER["SERVER_PORT"] != "80") {
            $pageURL .= $_SERVER["SERVER_NAME"] . ":" . $_SERVER["SERVER_PORT"] . $_SERVER["REQUEST_URI"];
        } else {
            $pageURL .= $_SERVER["SERVER_NAME"] . $_SERVER["REQUEST_URI"];
        }
        return $pageURL;
    }
    
    //$this->cm->return_url('takeaway/menu');
    function return_url($var){  // make url
       $http = substr($var, 0, 4);
       if ($http == 'http')
           return $var;
       else return base_url().$var; 
    }


    /////////////////////////////////////////////////////////////////////////////
    //                           OTHER FUNCTIONS                               //
    /////////////////////////////////////////////////////////////////////////////
    ///$this->cm->active_yes('Y'); $this->cm->active_yes('Y', 'Active');
    function active_yes($value, $active_yes=NULL) {
        $send_value = 'Unknown';
        $active_yes = ($active_yes) ? $active_yes : 'Y';

        if ($active_yes == 'Y') {
            if ($value == 'Y')
                $send_value = 'Yes';
            if ($value == 'N')
                $send_value = 'No';
        }
        else if ($active_yes == 'A') {
            if ($value == 'Y')
                $send_value = 'Active';
            if ($value == 'N')
                $send_value = 'Inactive';
        }

        return $send_value;
    }
    
    // $this->cm->active_inactive_row('users_phone', $row->id, $row->active, N, '01', 20,  20 )
    function active_inactive_row($table, $row_id, $value , $disable_link, $img_no=NULL, $width=NULL, $height=NULL) {
        $height = ($height!=NULL)? $height : 20;
        $width = ($width!=NULL)? $width : 20; 
        
        $url = 'users/active_this/'.$table.'/'.$value.'/'.$row_id;
        $url = ($disable_link == 'Y')? '#' : site_url($url);
        
        if ($value == 'Y') {
            $img = "http://allinepos.co.uk/images_common/admin_icon/active" . $img_no . ".png";
            $alt = "Active";
        }else if ($value == 'N'){
            $img = "http://allinepos.co.uk/images_common/admin_icon/inactive" . $img_no . ".png";
            $alt = "Inactive";
        }
        
        $img = "<img src='".$img."' alt = '" . $alt . "' width='".$width."' height='".$height."'  />";       
        $link = "<a href='".$url."'>".$img."</a>";
        return $link;
    }
    
    // $this->cm->primary_row('users_phone', $row->id, $row->active, N, '01', 20,  20 )
    function primary_row($table, $row_id, $value , $disable_link, $img_no=NULL, $width=NULL, $height=NULL) {
        $height = ($height!=NULL)? $height : 20;
        $width = ($width!=NULL)? $width : 20; 
        
        $url = 'users/primary_this/'.$table.'/'.$value.'/'.$row_id;
        $url = ($disable_link == 'Y')? '#' : site_url($url);
        
        if ($value == 'Y') {
            $img = "http://allinepos.co.uk/images_common/admin_icon/primary" . $img_no . ".png";
            $alt = "Primary";
        }else if ($value == 'N'){
            $img = "http://allinepos.co.uk/images_common/admin_icon/primary_no" . $img_no . ".png";
            $alt = "Not";
        }
        
        $img = "<img src='".$img."' alt = '" . $alt . "' width='".$width."' height='".$height."'  />";       
        $link = "<a href='".$url."'>".$img."</a>";
        return $link;
    }
    
    // $this->cm->delete_row('users_phone', $row->id, $row->active, '01', 20,  20 )
    function delete_row($table, $row_id, $disable_link, $type, $img_no=NULL, $width=NULL, $height=NULL) { 
        $height = ($height!=NULL)? $height : 20;
        $width = ($width!=NULL)? $width : 20;
        $url = 'users/delete_row/'.$table.'/'.$row_id.'/'.$type;
        $url = ($disable_link == 'Y')?  '#' : site_url($url);
        
        $img = "http://allinepos.co.uk/images_common/admin_icon/delete" . $img_no . ".png";
        $alt = "Delete";
                
        $img = "<img src='".$img."' alt = '" . $alt . "' width='".$width."' height='".$height."'  />";       
        $link = "<a href='".$url."'>".$img."</a>";
        return $link;
    }
    
    
    
    
    //$this->common_model->add_leading_zero($number, 3);
    public function add_leading_zero($number, $total_digit) {

        if ($total_digit == 2) {
            if ($number < 10)
                $number = "0" . $number;
        }

        if ($total_digit == 3) {
            if ($number < 10)
                $number = "00" . $number;
            else if ($number < 100)
                $number = "0" . $number;
        }

        if ($total_digit == 4) {
            if ($number < 10)
                $number = "000" . $number;
            else if ($number < 100)
                $number = "00" . $number;
            else if ($number < 1000)
                $number = "0" . $number;
        }

        if ($total_digit == 5) {
            if ($number < 10)
                $number = "0000" . $number;
            else if ($number < 100)
                $number = "000" . $number;
            else if ($number < 1000)
                $number = "00" . $number;
            else if ($number < 10000)
                $number = "0" . $number;
        }
        return $number;
    }
    
   //$this->cm->money($money, 2)  // 1 = no £, 2 = with £
    function money($money, $symbol = NULL) {
        $money = number_format($money, 2, '.', ' ');
        $money = ($symbol == 2 )? $this->currency_symbole().$money : $money;
        return $money;
    }
    
    function currency_symbole() { 
        $money =  '&pound;'; 
        return $money;
    }
     
     /*##################################################################
    //#                       Time Functions                            #
    //################################################################## */

    //$this->cm->time_local(now()) // $this->cm->time_local();
    function time_local($unix_time=NULL) {
        $unix_time = ($unix_time)? $unix_time : now();
        //Need to automate when extra time to add. there is 
        $summerMonths = array (4,5,6,7,8,9,10); 
        if (in_array(date('n'), $summerMonths) ) 
         $unix_time += 3600; 
        return $unix_time;
    }
    
    //$this->cm->time_date_day($unix_time)
    function time_date_day($unix_time, $day=NULL) {   // D, 'date'
        if ($day == 'D')
            return date('H:i dMy, D', $unix_time);
        else if ($day == 'date')
            return date('m/d/Y', $unix_time);
        else
            return date('H:i dMy, l', $unix_time);
    }
    
    //$this->cm->minute_to_hour($minute)
    function minute_to_hour($minute) {
        $minute_ = $minute % 60;
        $hour = ($minute - $minute_) / 60;
        $hour = ($hour < 10 ) ? '0' . $hour : $hour;
        $minute_ = ($minute_ < 10 ) ? '0' . $minute_ : $minute_;
        $hour = $hour . ':' . $minute_;
        return $hour;
    }
    
    //$this->cm->time_no_date($time, $type=NULL) // type =  hour, min, sec, hour_min
    function time_no_date($time, $type=NULL) { 
        $day = date( 'Y-m-d', $time);        
        $day = strtotime($day); //echo $day.'>>';
        $sec = $time - $day;
        
        $x_sec = $sec%60;
        $minute = ($sec-$x_sec) / 60;
        
        $x_min = $minute%60;
        $hour = ($minute-$x_min) / 60;  //echo $sec.'-'.$x_sec.'-'.$minute.'-'.$x_min.'-'.$hour; exit;        
        
        if($type ==  'sec') return $sec;
        else if($type ==  'min') return $minute;
        else if($type == 'hor') return $hour;
        else return $this->cm->minute_to_hour($hour);
    }
    
    //$this->cm->date_no_time($time, $format=NULL) // type =  'dMy', 'd-m-y', 'H:i, DMY',
    function date_no_time($time, $format=NULL) { 
        $day = date( 'Y-m-d', $time);        
        $day = strtotime($day); 
        if($format)
            return date($format, $day);
        else 
            return $day;
    }
    
    //$this->cm->its_today($time)  
    function its_today($time) { 
        $day = date( 'Y-m-d', $time);        
        $day_input = strtotime($day); 
        
        $day_now = date( 'Y-m-d', $this->cm->time_local(now()));        
        $day_now = strtotime($day_now);  //echo $day_now.'>>'.$day_input; exit;
        
        return ($day_now == $day_input)? TRUE : FALSE;
    }
    

     
    
    //$this->cm->fist_sec_day($time) // gives you the unix time for 00:00 23Apr2013
    function fist_sec_day($time=NULL) {
        $time = ($time) ? $time : now(); 
        $day = date( 'Y-m-d', $time);   
        return strtotime($day);  
    }
    
    

 

    //////////////////////////////////////////////////////////////////////////




    function get_max_val($table, $field) {
        $this->db->select_max($field);
        $query1 = $this->db->get($table);
        $data = $query1->row();
        return $data;
    }

    //////////////////////////////////////////////////////
    
    //$this->cm->add_comma ($string);
    function add_comma ($string) { 
        if (empty($string)) $string = NULL; 
        else if ($string == '#') $string = NULL; 
        else if ($string == '')  $string = NULL; 
        else if ($string == NULL) $string = NULL; 
        else 
            $string = $string.', ';  

       return $string;
    }


    function read_more($string, $from_char, $to_char, $url) {
        $string_length = strlen($string);
        $string = substr($string, $from_char, $to_char);
        $string_length;
        if ($string_length > $to_char) {
            $string = $string . " <a href='" . base_url() . $url . "'>  Read More </a>";
        }
        return $string;
    }

    //$this->cm->url_build($string);
    function url_build($url) {
        $url = (substr($url, 0, 4) == 'http') ? $url : base_url().$url;
        return $url;
    }

    //$this->cm->human_read_var($string);
    function human_read_var($string) {
        $string = str_replace('_', ' ', $string);
        $string = ucwords($string);
        return $string;
    }
    
    //$this->cm->var_from_string($string);
    function var_from_string($string) {
        $string = str_replace(' ', '_', $string);
        $string = strtolower($string);
        return $string;
    }
    
    //$this->cm-> empty_define($val->test);
    function empty_define($val) {
        if ($val == '#')
            return FALSE;
        else if ($val == '')
            return FALSE;
        else if ($val == NULL)
            return FALSE;
        else
            return TRUE;
    }

    
    //$this->cm->checkEmail($email);
    function checkEmail($email) {
        // checks proper syntax
        if (!preg_match("/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/", $email)) {
            return false;
        }

        /** This is very COLL feature.. Need to get it working SOON, 
         * having an error "Severity: 8192 Message: Function split() is deprecated",          * 
         *
        // gets domain name
        list($username, $domain) = split('@', $email);
        // checks for if MX records in the DNS
        $mxhosts = array();
        if (!getmxrr($domain, $mxhosts)) {
            // no mx records, ok to check domain
            if (!fsockopen($domain, 25, $errno, $errstr, 30)) {
                return false;
            } else {
                return true;
            }
        } else {
            // mx records found
            foreach ($mxhosts as $host) {
                if (fsockopen($host, 25, $errno, $errstr, 30)) {
                    return true;
                }
            }
            return false;
        } */
    }


    //$this->cm->max_value('categories', 'sn')
    function max_value($table, $filed) {
        $this->db->select_max($filed);
        $query1 = $this->db->get($table);
        $data = $query1->row();
        return $data->$filed; 
    }

    public function get_file_list($dir){
        if ($handle = opendir($dir)) {
            $files = array();
            while (false !== ($entry = readdir($handle))) {
                if ($entry != "." && $entry != "..") {
                    $files[]= $dir.'/'.$entry;
                }
            }
            closedir($handle);
            return $files;
        }else{
            die($dir.' >> Does not exist.');
        }
    }
    

    ///////////The End/////////////////////////////////////////
}

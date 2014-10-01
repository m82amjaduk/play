<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 13/04/14
 * Time: 02:05
 */
if (!defined('BASEPATH')) exit('No direct script access allowed');

if (!class_exists('CI_Model')) {
    class CI_Model extends Model {
    }
}

class Products extends CI_Model
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library('session');
    }

    // http://play.lc/ci_ion_auth/index.php/offers/prod/1
    public function product($id=1){
        $this->db->select('*') ->from('prod_list') ->where('id', $id);
        $prod  =  $this->db->get()->row() ;
        $this->db->select('*') ->from('prod_meat_view') ->where('prod_list_id', $id);
        $meat  =  $this->db->get()->result() ;
        $this->db->select('*') ->from('prod_options_price_view') ->where('prod_list_id', $id);
        $opt  =  $this->db->get()->result() ;
//        echo '<pre>'; print_r($opt);
//        $opt[] = $opt ;  // $this->splitArrayByValue($opt);

        $products = $prod;
        $products->meats = $meat;
        $products->opt = $this->splitArrayByValue($opt, 'group_no');

        echo '<pre>'; print_r($products);
    }


    //http://stackoverflow.com/questions/2189626/group-a-multidimensional-array-by-a-particular-value?rq=1
    function splitArrayByValue($items, $col){
        $templevel=0;

        $newkey=0;

        $grouparr[$templevel]="";

        foreach ($items as $key => $val) {
            if ($templevel==$val->$col){
                $grouparr[$templevel][$newkey]=$val;
            } else {
                $grouparr[$val->$col][$newkey]=$val;
            }
            $newkey++;
        }
//        print($grouparr);
        return $grouparr;
    }




    public function products_list($category){
        $where = array('prod_category_id' => $category, 'active' => 1);
        $col = 'id, sn, title, short_name, name_kitchen, description, price, prod_category_id, instruction, default_note, note_must, note_show, prod_code';
        $products_data = $this->dbm->getCollection('prod_list', 1, $where, $col, 'sn', 'asc');

        $where = array('prod_category_id' => $category, 'meats_active' => 1, 'price_active' => 1);
        $col = 'price_id, price, meats_title, price_sn, prod_list_id, icon';
        $meats_data = $this->dbm->getCollection('prod_meat_view', 1, $where,  $col,'price_sn', 'asc');

        $where = array('prod_category_id' => $category);
        $col = 'options_price_sn, group_no, prod_list_id, price, prod_options_id, name_option, user_view ';
        $opttion_data = $this->dbm->getCollection('prod_options_price_view', 1, $where,  $col,'options_price_sn', 'asc');



        $products = array();
        foreach ($products_data as $row){
            $product_id = $row->id;

            // Build Meat ..
            $meat = array();
            foreach($meats_data as $row_meat){
                if($product_id == $row_meat->prod_list_id){
                    $meat[] = $row_meat;
                }
            }

            // Build Options ..
            $opt = array();
            foreach($opttion_data as $row_opt){
                if($product_id == $row_opt->prod_list_id){
                    $opt[] = $row_opt;
                }
            }

            // Putting it in product array
            if (!empty($meat))
                $row->meats     = $meat;
            if (!empty($opt)){
                $row->options[]   = $opt;
                $row->options[]   = $opt;
            }
            $products[]     = $row;
        }

        echo '<pre>'; print_r($products); exit;

        return $products;
    }







    public function categories($parent=1) {
        $where = array('active' => 1, 'parent_category_id' => $parent );
        return $this->dbm->getCollection($table='prod_category', 1, $where, 'id, title', $orderedField='sn', $orderedBy='asc');

    }

    public function category($category) {
        return $this->dbm->getRow('prod_category', 1, $category, 'id', '*');
    }









    ////////////////////////////// The End //////////////////////////////////
}
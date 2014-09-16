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

    class products extends CI_Model {

        public function __construct() {
            parent::__construct();
            $this->load->database();
            $this->load->helper('cookie');
            $this->load->helper('date');
            $this->load->library('session');
        }



        private function menu_category($category){
            $where = array('prod_category_id' => $category, 'active' => 1);
            $col = 'id, sn, title, short_name, name_kitchen, description, price, prod_category_id, instruction, default_note, note_must, note_show, prod_code';
            $products_data = $this->cm->where_col_ordered('prod_list', $where, $col, 'sn', 'asc');

            $where = array('prod_category_id' => $category, 'meats_active' => 1, 'price_active' => 1);
            $col = 'price_id, price, meats_title, price_sn, prod_list_id, icon';
            $meats_data = $this->cm->where_col_ordered('prod_meat_view', $where,  $col,'price_sn', 'asc');

            $products = array();
            foreach ($products_data as $row){
                $product_id = $row->id;
                $meat = array();
                foreach($meats_data as $row_meat){
                    if($product_id == $row_meat->prod_list_id){
                        $meat[] = $row_meat;
                    }
                }

                // Putting it in product array
                $row->meats = $meat;
                $products[] = $row;
            }

/*
            $where = array('product_category_id' => $category, 'active' => 'Y', 'portion_size_active' => 'Y');
            $col = 'product_portion_size_join_id, sn, product_id, price, portion_size_name';
            $portion_sizes_data = $this->cm->where_col_ordered('prd_portion_sizes', $where,  $col,'sn', 'asc');

            $where = array('product_category_id' => $category, 'active' => 'Y', 'accompaniments_active' => 'Y');
            $col = 'product_accompaniments_join_id, sn, product_id, price, accompaniments_name';
            $accompaniments_data = $this->cm->where_col_ordered('prd_accompaniments', $where,  $col,'sn', 'asc');

            $where = array('product_category_id' => $category, 'active' => 'Y', 'specification_active' => 'Y');
            $col = 'product_specification_join_id, sn, product_id, specification_name';
            $specification_data = $this->cm->where_col_ordered('prd_specifications', $where,  $col,'sn', 'asc');


            $products = array();
            foreach ($products_data as $row){
                $product_id = $row->id;
                $spec = $acco = $size = $meat = array();
                foreach($meats_data as $row_meat){
                    //echo $product_id.' >pre_check> '.$meat_row->product_id.'<br />';
                    //print_r($meat_row);
                    if($product_id == $row_meat->product_id){
                        //echo $product_id.' >> '.$meat_row->product_id.'<br />';
                        $meat[] = $row_meat;
                    }
                }

                foreach($portion_sizes_data as $row_size){
                    if($product_id == $row_size->product_id){
                        $size[] = $row_size;
                    }
                }

                foreach($accompaniments_data as $row_acco){
                    if($product_id == $row_acco->product_id){
                        $acco[] = $row_acco;
                    }
                }

                foreach($specification_data as $row_spec){
                    if($product_id == $row_spec->product_id){
                        $spec[] = $row_spec;
                    }
                }

                // putting it in product array
                $row->meats = $meat;
                $row->portion_sizes = $size;
                $row->accompaniments = $acco;
                $row->specifications = $spec;
                $products[] = $row;
            }*/
            return $products=$products_data;
        }


        private function categories($aChild=NULL) {
            $where = array('active' => 1, 'parent_category_id' => 1, );
            if($aChild) $where['parent_category_id'] = $this->cm->val('prod_category', 'parent_category_id', $aChild, 'id');
            $categories = $this->cm->where_col_ordered('prod_category', $where, 'id, title', 'sn', 'asc');
            return $categories;
        }

        private function category($category) {
            $where = array('id' => $category);
            return $this->cm->single_row_where('prod_category', $where);
        }

        public function takeaway_menu($aChild=NULL, $category) {
            $data['category'] = $this->category($category);
            $data['categories'] = $this->categories();
            $data['products'] = $this->menu_category($category);
            return $data;
        }








        ////////////////////////////// The End //////////////////////////////////
    }
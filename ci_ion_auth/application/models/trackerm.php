<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

if (!class_exists('CI_Model')) {
    class CI_Model extends Model {
    }
}

class Trackerm extends CI_Model
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
     *  $this->trackerm->creatDB();
     *  http://learning7.lc/ion_auth/index.php/welcome/creatDB
     */
    public function creatDB( ){
        $this->load->dbforge();
        $fields = array(
//            'id' => array(
//                'type' => 'INT',
//                'constraint' => 11,
//                'unsigned' => TRUE,
//                'auto_increment' => TRUE
//            ),
            'blog_title' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
            ),
            'blog_author' => array(
                'type' =>'VARCHAR',
                'constraint' => '100',
                'default' => 'King of Town',
            ),
            'blog_description' => array(
                'type' => 'TEXT',
                'null' => TRUE,
            ),
        );

        $this->dbforge->add_field( 'id' );
        $this->dbforge->create_table('cms_tracker', TRUE);
        $fieldID = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => TRUE,
                'auto_increment' => TRUE,
            )
        );
        $this->dbforge->modify_column('cms_tracker', $fieldID);
        $this->dbforge->add_column('cms_tracker', $fields);
    }

///////////////////////////////////// ///////////////////////////////////////
}
<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_Repire extends CI_Migration {

    public function up()
    {
        $CI =& get_instance();
        $CI->load->database();
        $database = $CI->db->database;

        $this->db->query("call AddColumnUnlessExists('$database', 'device_cwdp', 'notify_email_eng', 'VARCHAR (256) DEFAULT \'m82amjad@gmail.com\'');");
        $this->db->query("call AddColumnUnlessExists('$database', 'device_cwdp', 'notify_email_client', 'VARCHAR (256)  DEFAULT \'m82amjad@gmail.com\'  ');");
        $this->db->query("call AddColumnUnlessExists('$database', 'device_cwdp', 'debug', ' TINYINT(4) NOT NULL DEFAULT \'0\' ');");



        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'        => substr(basename(__FILE__), 0, 3),
                'date_created'      => '2014-09-01 16:33:06',
                'release_note_eng'  => 'ADDED FUNCTION:: extraColum',
                'release_note_adm'  => "Made migration more powerfull",
                'migration_by'      => 'Unknown', //$this->session->userdata('identity'),
                'migration_ip'      => $_SERVER['REMOTE_ADDR']
            )
        );
        $this->db->insert_batch('migrations_db_versions', $data);
        ########################################  DB Version Note  ENDS...
    }

    public function down()
    {
//        $versionNo = substr(basename(__FILE__), 0, 3);
//        $this->db->query("DELETE FROM migrations_db_versions WHERE version_no='$versionNo'");

//        $this->db->query("DROP procedure IF EXISTS AddColumnUnlessExists;");
    }
}

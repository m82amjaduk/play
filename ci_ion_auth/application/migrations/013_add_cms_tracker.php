<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_cms_tracker extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => TRUE,
                'auto_increment' => TRUE,
                'zerofill' => TRUE,
            ),
            'login_id' => array(
                'type' => 'BIGINT',
                'constraint' => '20',
                'null' => FALSE,
                'default' => '1',
            ),
            'updated' => array(
                'type' => 'TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
                'null' => FALSE,
            ),
            'active' => array(
                'type' => 'TINYINT',
                'constraint' => '4',
                'null' => FALSE,
                'default' => '0',
            ),
            'site_id_tracker' => array(
                'type' => 'INT',
                'constraint' => '11',
                'null' => FALSE,
                'default' => '3',
            ),
            'tracker_domian' => array(
                'type' => 'VARCHAR',
                'constraint' => '512',
                'null' => FALSE,
                'default' => 'takeawayguru.com/tracker/',
            ),
            'site_domain' => array(
                'type' => 'VARCHAR',
                'constraint' => '512',
                'null' => FALSE,
                'default' => 'al-aminrestaurant.co.uk',
            ),
            'debug_mode' => array(
                'type' => 'TINYINT',
                'constraint' => '4',
                'null' => FALSE,
                'default' => '1',
            ),
        ));

        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('cms_tracker', TRUE);

        // Dumping data for table 'cms_tracker'
        $data = array(
            array(
                'active' => '1',
            )
        );
        $this->db->insert_batch('cms_tracker', $data);


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: cms_tracker',
                'release_note_adm'  => "First Release",
                'migration_by'      => 'Unknown', //$this->session->userdata('identity'),
                'migration_ip'      => $_SERVER['REMOTE_ADDR']
            )
        );
        $this->db->insert_batch('migrations_db_versions', $data);

    }

    public function down()
    {
//        $versionNo = substr(basename(__FILE__), 0, 3);
//        $this->db->query("DELETE FROM migrations_db_versions WHERE version_no='$versionNo'");
        $this->dbforge->drop_table('cms_tracker');
    }
}

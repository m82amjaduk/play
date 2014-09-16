<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_SetUpMigration extends CI_Migration {

    public function up()
    {
        $fields = array(
            'note' => array(
                'type' => 'TEXT',
                'null'=> TRUE
            )
        );
        $this->dbforge->add_column('migrations', $fields);

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
                'constraint' => '1',
                'null' => FALSE,
                'default' => '0',
            )
        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('__sample_db_table', TRUE);
        // Above ZEROFILL Does not work ... .
        $this->db->query("ALTER TABLE __sample_db_table MODIFY COLUMN id INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE;");


        ######################################## migrations_db_versions
        // Copy Tables Sampletable to
        $this->db->query("CREATE TABLE migrations_db_versions LIKE __sample_db_table");
        // Adding added fields for migrations_db_versions ...
        $fields = array(
            'version_no' => array(
                'type' => 'BIGINT',
                'constraint' => '20',
                'default' => '1',
            ),
            'date_created' => array(
                'type' => 'TIMESTAMP',
                'null' => FALSE,
                'default' => '2014-08-25 14:31:06'
            ),
            'release_note_eng' => array(
                'type' => 'TEXT',
                'null' => TRUE
            ),
            'release_note_adm' => array(
                'type' => 'TEXT',
                'null' => TRUE
            ),
            'migration_by' => array(
                'type' => 'VARCHAR',
                'constraint' => 512,
                'null' => FALSE
            ),
            'migration_ip' => array(
                'type' => 'VARCHAR',
                'constraint' => 64,
                'null' => FALSE
            )
        );
        $this->dbforge->add_column('migrations_db_versions', $fields);

        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'        => substr(basename(__FILE__), 0, 3),
                'date_created'      => '2014-08-25 14:31:06',
                'release_note_eng'  => "added __sample_db_table, migrations_db_versions,  migrations.note",
                'release_note_adm'  => "First Release",
                'migration_by'      => $this->session->userdata('identity'),
                'migration_ip'      => $_SERVER['REMOTE_ADDR']
            )
        );
        $this->db->insert_batch('migrations_db_versions', $data);

    }

    public function down()
    {
//        $versionNo = substr(basename(__FILE__), 0, 3);
//        $this->db->query("DELETE FROM migrations_db_versions WHERE version_no='$versionNo'");

        $this->dbforge->drop_column('migrations', 'note');
        $this->dbforge->drop_table('__sample_db_table');
        $this->dbforge->drop_table('migrations_db_versions');
    }
}

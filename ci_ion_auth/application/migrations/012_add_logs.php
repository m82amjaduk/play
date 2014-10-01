<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_logs extends CI_Migration {

    public function up()
    {
        // Create logs ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `logs` (
              `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
              `errno` int(2) NOT NULL,
              `errtype` varchar(32) NOT NULL,
              `errstr` text NOT NULL,
              `errfile` varchar(255) NOT NULL,
              `errline` int(4) NOT NULL,
              `user_agent` varchar(120) NOT NULL,
              `ip_address` varchar(45) DEFAULT '0' NOT NULL,
              `time` datetime NOT NULL,
              PRIMARY KEY (`id`, `ip_address`, `user_agent`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: logs',
                'release_note_adm'  => "First Release",
                'migration_by'      => '1',
                'migration_ip'      => $_SERVER['REMOTE_ADDR']
            )
        );
        $this->db->insert_batch('migrations_db_versions', $data);


    }

    public function down()
    {
//        $versionNo = substr(basename(__FILE__), 0, 3);
//        $this->db->query("DELETE FROM migrations_db_versions WHERE version_no='$versionNo'");

        $this->dbforge->drop_table('logs');
    }
}

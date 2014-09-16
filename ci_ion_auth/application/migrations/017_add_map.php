<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_map extends CI_Migration {

    public function up()
    {
        // Create map_latlng ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `map_latlng` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `search_key`  varchar(32) NOT NULL COMMENT 'eg. GU21 5ED, south end, Cherry Tree Walk',
  `search_key_nospace`  varchar(32) NOT NULL COMMENT 'eg. GU215ED, SOUTHEND, CHERRYTREEWALK',
  `lat`  varchar(32) NOT NULL DEFAULT '0',
  `lng`  varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Does not require Insert Code...



        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: map_latlng',
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

        $this->dbforge->drop_table('map_latlng');
    }
}

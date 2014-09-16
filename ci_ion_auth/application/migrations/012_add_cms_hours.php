<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_cms_hours extends CI_Migration {

    public function up()
    {
        // Create cms_opening_hours ...
        $this->db->query("CREATE TABLE IF NOT EXISTS services_opening_hours (
              `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
              `login_id` bigint(20) NOT NULL DEFAULT '0',
              `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` tinyint(4) NOT NULL DEFAULT '0',
              `sn` tinyint(4) DEFAULT '1',
              `from_` VARCHAR(5) NOT NULL DEFAULT '17:30',
              `to_` VARCHAR(5) NOT NULL DEFAULT '23:59',
              `day` VARCHAR(3) NOT NULL ,
              `collection` tinyint(4) NOT NULL DEFAULT '1',
              `delivery` tinyint(4) NOT NULL DEFAULT '0',
              `sit_in` tinyint(4) NOT NULL DEFAULT '0',
              `waiting_collection` tinyint(4) DEFAULT '15',
              `waiting_delivery` tinyint(4) DEFAULT '45',
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;"
        );

        $this->db->query("INSERT INTO services_opening_hours SET active='1', day='Mon';");
        $this->db->query("INSERT INTO services_opening_hours SET active='1', day='Tue';");
        $this->db->query("INSERT INTO services_opening_hours SET active='1', day='Wed';");
        $this->db->query("INSERT INTO services_opening_hours SET active='1', day='Thu';");
        $this->db->query("INSERT INTO services_opening_hours SET active='1', day='Fri';");
        $this->db->query("INSERT INTO services_opening_hours SET active='1', day='Sat';");
        $this->db->query("INSERT INTO services_opening_hours SET active='1', day='Sun';");


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: services_opening_hours',
                'release_note_adm'  => "First Release",
                'migration_by'      => 'Unknown', //$this->session->userdata('identity'),
                'migration_ip'      => $_SERVER['REMOTE_ADDR']
            )
        );
        $this->db->insert_batch('migrations_db_versions', $data);
    }

    public function down() {
//        $versionNo = substr(basename(__FILE__), 0, 3);
//        $this->db->query("DELETE FROM migrations_db_versions WHERE version_no='$versionNo'");

        $this->dbforge->drop_table('services_opening_hours');
    }
}

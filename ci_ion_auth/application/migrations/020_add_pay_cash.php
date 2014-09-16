<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_pay_cash extends CI_Migration {

    public function up()
    {
        // Create pay_cash ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `pay_cash` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT  UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  `captcha` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###' AUTO_INCREMENT=1;");

        // Insert Data  pay_cash ...
        $data = array(
            array(
                'active' => 1
            )
        );
        $this->db->insert_batch('pay_cash', $data);

        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: pay_cash',
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

        $this->dbforge->drop_table('pay_cash');
    }
}

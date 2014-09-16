<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_pay_card extends CI_Migration {

    public function up()
    {
        // Create pay_card ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `pay_card` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT  UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  acquirer VARCHAR(128),
  pre_shared_key text,
  merchant_id VARCHAR(256),
  password VARCHAR(256),
  pre_shared_key_test text,
  merchant_id_test VARCHAR(256),
  password_test VARCHAR(256),
  order_description VARCHAR(256),
  transaction_type VARCHAR(256) DEFAULT 'SALE',
  fdms_mid VARCHAR(256),
  test_node  tinyint(4) NOT NULL DEFAULT '0',
  image text,
  credit_card_fee decimal(20,2) DEFAULT '0.20',
  debit_card_fee decimal(20,2) DEFAULT '2.20',
  flat_fee  decimal(20,2) DEFAULT '-2.00' COMMENT 'if -2, Apply Calculated Fee ',
  pay_after_transaction tinyint(4) NOT NULL DEFAULT '0',
  min_order_value decimal(20,2) DEFAULT '10.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='### ' AUTO_INCREMENT=1 ;");

        // Insert Data  prod_options ...
        $data = array(
            array(
                'active' => '0'
            )
        );
        $this->db->insert_batch('pay_card', $data);


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: pay_card',
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

        $this->dbforge->drop_table('pay_card');
    }
}

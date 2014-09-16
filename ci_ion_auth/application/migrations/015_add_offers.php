<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_offers extends CI_Migration {

    public function up()
    {

        // Create offers ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `offers` (
	`id` INT(11)  UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT  UNIQUE,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11)  DEFAULT '1',
	`offer_code` VARCHAR(128) UNIQUE NOT NULL,
	`title` VARCHAR(256) NULL DEFAULT 'New',
	`start_date` INT(11) DEFAULT '1455268287',
	`end_date` INT(11) DEFAULT '1455268287',
	`user_message` TEXT NULL,
	`description` TEXT NULL,
	`email_template` TEXT NULL,
	`min_value` INT(11) NULL DEFAULT '10',
	`cw_discount_percentage` FLOAT(10,2) NULL DEFAULT '0.00',
	`store_discount_percentage` FLOAT(10,2) NULL DEFAULT '0.00',
	`cw_discount_amount` FLOAT(10,2) NULL DEFAULT '0.00',
	`store_discount_amount` FLOAT(5,2) NULL DEFAULT '0.00',
	`receiving` VARCHAR(32) NULL DEFAULT 'collection_delivery',
	`code_require` TINYINT(4) NOT NULL DEFAULT '0',
	`maximum_use` TINYINT(4) NOT NULL DEFAULT '-2' COMMENT '-2, for unlimited',
	`time_check` TINYINT(4) NOT NULL DEFAULT '0',
	`user_check` TINYINT(4) NOT NULL DEFAULT '0',
	`product_check` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)COMMENT='###' COLLATE='latin1_swedish_ci' ENGINE=InnoDB AUTO_INCREMENT=1;");


        // Create offer_time_validity ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `offer_time_validity` (
  `id` int(11)  UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT  UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn`  int(11) DEFAULT '1',
  `offer_id` int(11) DEFAULT '-2',
  `day_of_week` varchar(16) DEFAULT 'satur',
  `time_from` int(11) DEFAULT '-2',
  `time_to`  int(11) DEFAULT '-2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");


        // Create offers_product ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `offers_product` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`offer_id`  INT(11),
	`product_id`  INT(11),
	PRIMARY KEY (`id`)
)COMMENT='###' COLLATE='latin1_swedish_ci' ENGINE=InnoDB AUTO_INCREMENT=1;");

        // Create offers_user ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `offers_user` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`offer_id`  INT(11),
	`user_code` varchar (10),
	PRIMARY KEY (`id`)
)COMMENT='###' COLLATE='latin1_swedish_ci' ENGINE=InnoDB AUTO_INCREMENT=1;");


        // Inserting Data  ...
        $this->db->query("INSERT INTO offers SET offer_code='ALLINEPOS';");
        // Do not Require default data for rest of the tables !!!


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: offers, offer_time_validity, offers_product, offers_user',
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

        $this->dbforge->drop_table('offers');
        $this->dbforge->drop_table('offer_time_validity');
        $this->dbforge->drop_table('offers_product');
        $this->dbforge->drop_table('offers_user');
    }
}

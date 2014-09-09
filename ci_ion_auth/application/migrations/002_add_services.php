<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_services extends CI_Migration {

    public function up()
    {
        // Create services_collection ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `services_collection` (
    `id` INT(11) UNSIGNED ZEROFILL  NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`available` VARCHAR(1) NULL DEFAULT NULL,
	`current_waiting_time` INT(11) NULL DEFAULT NULL,
	`opening_hours` TEXT NULL,
	`maximum_cover_cash` INT(11) NULL DEFAULT '15',
	`mini_order_value` FLOAT(10,2) NULL DEFAULT NULL,
	`start_after` INT(11) NULL DEFAULT '0',
	`end_before` INT(11) NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)COMMENT='###' COLLATE='latin1_swedish_ci' ENGINE=InnoDB AUTO_INCREMENT=1;");


        // Create services_delivery ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `services_delivery` (
	`id` INT(11) UNSIGNED ZEROFILL  NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`available` VARCHAR(1) NULL DEFAULT '0',
	`current_waiting_time` INT(11) NULL DEFAULT '45',
	`opening_hours` TEXT NULL,
	`maximum_cover_cash` INT(11) NULL DEFAULT '15',
	`mini_order_value` FLOAT(10,2) NULL DEFAULT '10',
	`start_after` INT(11) NULL DEFAULT '0',
	`end_before` INT(11) NULL DEFAULT '0',
	`maximum_cover` FLOAT(10,2) DEFAULT '6',
	`free_area`  FLOAT(10,2) DEFAULT '3',
	`default_charge`  FLOAT(10,2) DEFAULT '2.00',
	`post_code_lookup` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)COMMENT='###' COLLATE='latin1_swedish_ci' ENGINE=InnoDB AUTO_INCREMENT=1;");


        // Create services_sit_in ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `services_sit_in` (
	`id` INT(11) UNSIGNED ZEROFILL  NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`available` TINYINT(4) NOT NULL DEFAULT '0',
	`opening_hours` TEXT NULL,
	`start_after` INT(11) NULL DEFAULT '0',
	`end_before` INT(11) NULL DEFAULT '0',
	`max_sit` INT(11) NULL DEFAULT '1',
	`licensed` TINYINT(4) NOT NULL DEFAULT '0',
	`air_condition` TINYINT(4) NOT NULL DEFAULT '0',
	`wheel_chair` TINYINT(4) NOT NULL DEFAULT '0',
	`disable_toilet` TINYINT(4) NOT NULL DEFAULT '0',
	`booking_accepted` TINYINT(4) NOT NULL DEFAULT '0',
	`admin` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)COMMENT='###' COLLATE='latin1_swedish_ci' ENGINE=InnoDB AUTO_INCREMENT=1;");


        // Create rest_reservations ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `rest_reservations` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `user_code`  varchar(10),
  `fnames`  varchar(256) NOT NULL,
  `lname`  varchar(256) NOT NULL,
  `email`  varchar(256) NOT NULL,
  `phone`  varchar(256) NOT NULL,
  `cover`  varchar(256) NOT NULL,
  `reservation_time`  bigint(20) NOT NULL DEFAULT '1',
  `note`  text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");



        // Create rest_reservations_confirm ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `rest_reservations_confirm` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `rest_reservations_id`   bigint(20) NOT NULL ,
  `confirmation_sent` tinyint(4) NOT NULL DEFAULT '0',
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `arrived` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");
    }

    public function down()
    {
        $this->dbforge->drop_table('services_collection');
        $this->dbforge->drop_table('services_delivery');
        $this->dbforge->drop_table('services_sit_in');
        $this->dbforge->drop_table('rest_reservations');
        $this->dbforge->drop_table('rest_reservations_confirm');
    }
}






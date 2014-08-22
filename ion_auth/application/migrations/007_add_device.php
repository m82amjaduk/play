<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_device extends CI_Migration {

    public function up()
    {
        // Create device_cwdp ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `device_cwdp` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`psk` VARCHAR (256) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' COMMENT 'Pre Shared Key',
	`enforce_secure_connection`  TINYINT(4) NOT NULL DEFAULT '0',
	`show_menucode`  TINYINT(4) NOT NULL DEFAULT '0',
	`log_active`  TINYINT(4) NOT NULL DEFAULT '0',
	`log_file_name` VARCHAR (256) DEFAULT 'cwdp.log',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Create device_cwhd ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `device_cwhd` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`psk` VARCHAR (256) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' COMMENT 'Pre Shared Key',
	`enforce_secure_connection`  TINYINT(4) NOT NULL DEFAULT '0',
	`log_active`  TINYINT(4) NOT NULL DEFAULT '0',
	`log_file_name` VARCHAR (256) DEFAULT 'cwhd.log',
	`send_data`  TINYINT(4) NOT NULL DEFAULT '0',
	`order_support`  TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Create device_fax ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `device_fax` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`fax_number` VARCHAR (128) DEFAULT '0',
	`domain_full` text COMMENT 'Full domain name',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Create device_sms_gateway ...
        $this->db->query("CREATE TABLE `device_sms_gateway` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`gateway_url` TEXT NULL,
	`gateway_password` TEXT NULL,
	`mobile_order_client` VARCHAR(15) NULL DEFAULT NULL,
	`critical_mobile_client` VARCHAR(15) NULL DEFAULT NULL,
	`order_confirm_customer` VARCHAR(1) NULL DEFAULT NULL,
	`order_accepted_customer` VARCHAR(1) NULL DEFAULT NULL,
	`order_ready_customer` VARCHAR(1) NULL DEFAULT NULL,
	`order_nearby_customer` VARCHAR(1) NULL DEFAULT NULL,
	`booking_confirmed_customer` VARCHAR(1) NULL DEFAULT NULL,
	`order_notification_client` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Create device_sms_printer ...
        $this->db->query("CREATE TABLE `device_sms_printer` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`mobile_number` VARCHAR(15) DEFAULT '07900642131',
	`iemi` VARCHAR(64) DEFAULT 'NO_IEMI',
	`send_sms` TINYINT(4) NOT NULL DEFAULT '0',
	`save_log` TINYINT(4) NOT NULL DEFAULT '0',
	`printer_txt` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Inserting Data  ...
        $this->db->query("INSERT INTO device_cwdp SET active=0;");
        $this->db->query("INSERT INTO device_cwhd SET active=0;");
        $this->db->query("INSERT INTO device_fax SET active=0;");
        $this->db->query("INSERT INTO device_sms_gateway SET active=0;");
        $this->db->query("INSERT INTO device_sms_printer SET active=0;");
    }


    public function down()
    {
        $this->dbforge->drop_table('device_cwdp');
        $this->dbforge->drop_table('device_cwhd');
        $this->dbforge->drop_table('device_fax');
        $this->dbforge->drop_table('device_sms_gateway');
        $this->dbforge->drop_table('device_sms_printer');
    }
}

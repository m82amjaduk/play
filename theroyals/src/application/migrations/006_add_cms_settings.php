<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_cms_settings extends CI_Migration {

    public function up()
    {

        // Create settings_business ...
        $this->db->query("CREATE TABLE IF NOT EXISTS settings_business (
  `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `business_code` VARCHAR(256) NOT NULL DEFAULT 'New',
  `business_name` VARCHAR(256) NOT NULL DEFAULT 'New',
  `logo` VARCHAR(2048) NOT NULL DEFAULT '/img/struct/logo.png',
  `business_slogan` VARCHAR(1024) NOT NULL DEFAULT 'Best food in town',
  `email_customer_service` VARCHAR(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_operation` VARCHAR(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_billing` VARCHAR(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_order` VARCHAR(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_order_support`varchar(256) DEFAULT 'orders@allinepos.co.uk',
  `phone1` VARCHAR(256) NOT NULL DEFAULT '02086600022',
  `phone2` VARCHAR(256) DEFAULT '02086600044',
  `phone3` VARCHAR(256) DEFAULT '02086600066',
  `fax` VARCHAR(256) DEFAULT '02086600088',
  `house_number` VARCHAR(256) DEFAULT '13',
  `address1` VARCHAR(256) DEFAULT 'Brighton Road',
  `address2` VARCHAR(256) DEFAULT NULL,
  `town` VARCHAR(256) DEFAULT 'Purley',
  `city` VARCHAR(256) DEFAULT 'London',
  `county` VARCHAR(256) DEFAULT 'London',
  `country` VARCHAR(256) DEFAULT 'London',
  `postcode` VARCHAR(256) NOT NULL DEFAULT 'GU22 5AA',
  `direction` text,
  `vat_no` VARCHAR(256) DEFAULT 'New',
  `web_url`  VARCHAR(2048) DEFAULT 'http://al-aminrestaurant.co.uk',
  `use_ssl`  tinyint(4) NOT NULL DEFAULT '0',
  `manager_fnames` VARCHAR(256) DEFAULT 'Lalita',
  `manager_lname` VARCHAR(256) DEFAULT 'Sahu',
  `manager_phone` VARCHAR(256) DEFAULT '0123456789',
  `established` VARCHAR(256) DEFAULT '1900',
  `pizza_supported` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;");

        $this->db->query("INSERT INTO settings_business SET active=0;");


        // Create settings_system ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `settings_system` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`doctype`  VARCHAR(512) NULL DEFAULT '#',
    `head_title` VARCHAR(512) NULL DEFAULT 'Official Site - Green Chilli Restaurant :: Finest Indian Cuisine',
	`meta_description` TEXT NULL,
	`meta_key` TEXT NULL,
	`favicon`  VARCHAR(256) NULL DEFAULT 'http://conosurtek.co.uk/aj/images/conosurTek/favicon.ico',
	`head_others` TEXT NULL,
	`copy_right` VARCHAR(256) NULL DEFAULT 'All In ePOS',
	`copy_right_url` VARCHAR(256) NULL DEFAULT 'http://allinepos.co.uk',
	`currency_code` VARCHAR(32) NULL DEFAULT '826',
	`currency_symbol` VARCHAR(32) NULL DEFAULT '&pound;',
	`time_zone` VARCHAR(32) NULL DEFAULT '0',
	`summer_time` VARCHAR(32) NULL DEFAULT 'BST',
	`site_live` TINYINT(4) NOT NULL DEFAULT '0',
	`maintenance_note` TEXT NULL,
	`default_load` VARCHAR(256) NULL DEFAULT 'about/home',
	`default_load_login` VARCHAR(256) NULL DEFAULT 'about/home',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Insert Data settings_system ...
        $this->db->query("INSERT INTO settings_system SET meta_key='Indian Food';");


        // Create cms_email_config ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `settings_email_config` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `email_from`  varchar(256) NOT NULL DEFAULT 'system@takeawayguru.com',
  `smtp_user`  varchar(256) NOT NULL DEFAULT 'system+takeawayguru.com',
  `smtp_password`  varchar(256) NOT NULL DEFAULT 'system789@!',
  `smtp_host`  varchar(256) NOT NULL DEFAULT '109.203.102.20',
  `smtp_port`  varchar(256) NOT NULL DEFAULT '25',
  `protocol`  varchar(256) NOT NULL DEFAULT 'SMTP',
  `mailtype`  varchar(256) NOT NULL DEFAULT 'html',
  `send_from`  varchar(256) NOT NULL DEFAULT 'All In ePOS',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Insert Data settings_system ...
        $this->db->query("INSERT INTO settings_email_config SET active='1';");


        // Create settings_email_config ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `settings_email_template` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `alias`  varchar(256) NOT NULL,
  `body`  varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");



        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: settings_business, settings_email_config, settings_email_template, settings_system',
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

        $this->dbforge->drop_table('settings_business');
        $this->dbforge->drop_table('settings_email_config');
        $this->dbforge->drop_table('settings_email_template');
        $this->dbforge->drop_table('settings_system');
    }
}

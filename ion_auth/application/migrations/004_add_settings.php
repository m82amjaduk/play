<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_cms_tracker_view extends CI_Migration {

    public function up()
    {
        // Create settings_system ...
        $this->db->query("CREATE TABLE `settings_system` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
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


    }

    public function down()
    {
        $this->dbforge->drop_table('settings_system');
    }
}

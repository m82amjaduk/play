<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_cms_settings extends CI_Migration {

    public function up()
    {

        // Create cms_settings_business ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS cms_settings_business (
                  `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                  `login_id` bigint(20) NOT NULL DEFAULT '1',
                  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                  `active` tinyint(1) NOT NULL DEFAULT '1',
                  `business_code` VARCHAR(256) NOT NULL DEFAULT 'New',
                  `business_name` VARCHAR(256) NOT NULL DEFAULT 'New',
                  `logo` VARCHAR(2048) NOT NULL DEFAULT '/img/default/struct/logo.png',
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
                  `use_ssl`  tinyint(1) NOT NULL DEFAULT '0',
                  `manager_fnames` VARCHAR(256) DEFAULT 'Lalita',
                  `manager_lname` VARCHAR(256) DEFAULT 'Sahu',
                  `manager_phone` VARCHAR(256) DEFAULT '0123456789',
                  `established` VARCHAR(256) DEFAULT '1900',
                  `pizza_supported` tinyint(1) NOT NULL DEFAULT '0',
                  PRIMARY KEY (`id`)
            )ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );

        $this->db->query("INSERT INTO cms_settings_business SET active=0;");


        // Create settings_system ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_settings_system` (
                `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `head_title` VARCHAR(512) NULL DEFAULT 'Official Site - Green Chilli Restaurant :: Finest Indian Cuisine',
                `meta_description` VARCHAR(2048) NOT NULL DEFAULT 'If you looking for healthy freshly home made food, this is the right place for you. Please give us an opportunity to serve you your favourate meal.',
                `meta_keywords` VARCHAR(2048) NOT NULL DEFAULT 'Indian Food, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food',
                `favicon`  VARCHAR(2048) NULL DEFAULT 'http://conosurtek.co.uk/aj/images/conosurTek/favicon.ico',
                `head_others` TEXT NULL,
                `copy_right` VARCHAR(512) NULL DEFAULT 'All In ePOS',
                `copy_right_url` VARCHAR(512) NULL DEFAULT 'http://allinepos.co.uk',
                `currency_code` VARCHAR(32) NULL DEFAULT '826',
                `currency_symbol` VARCHAR(32) NULL DEFAULT '&pound;',
                `time_zone` VARCHAR(32) NULL DEFAULT '0',
                `summer_time` VARCHAR(32) NULL DEFAULT 'BST',
                `site_live` TINYINT(1) NOT NULL DEFAULT '0',
                `maintenance_note` TEXT NULL,
                `default_load` VARCHAR(256) NULL DEFAULT 'about/home',
                `default_load_login` VARCHAR(256) NULL DEFAULT 'about/home',
                `debug` INT(1) NOT NULL DEFAULT '1',
                `debug_global` INT(1) NOT NULL DEFAULT '1',
                `sitemap_xml` TINYINT(1) NOT NULL DEFAULT '1',
                `sitemap_html` TINYINT(1) NOT NULL DEFAULT '1',
                `img_copy_url`  VARCHAR(2048) NULL DEFAULT 'http://allinepos.co.uk/clientsImg/',
                `robots_content`  TEXT,
                `version_software`  VARCHAR(32) NULL DEFAULT '060209',
                `version_database`  VARCHAR(32) NULL DEFAULT '023',
                `template_id`  VARCHAR(32) NULL DEFAULT 'default',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );

        // Insert Data settings_system ...
        $this->db->query("INSERT INTO cms_settings_system SET maintenance_note='This Site Currently Down For Maintenance';");


        // Create cms_email_config ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_settings_email` (
              `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
              `login_id` bigint(20) NOT NULL DEFAULT '1',
              `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` tinyint(1) NOT NULL DEFAULT '1',
              `email_from`  varchar(256) NOT NULL DEFAULT 'system@takeawayguru.com',
              `smtp_user`  varchar(256) NOT NULL DEFAULT 'system+takeawayguru.com',
              `smtp_password`  varchar(256) NOT NULL DEFAULT 'system789@!',
              `smtp_host`  varchar(256) NOT NULL DEFAULT '109.203.102.20',
              `smtp_port`  varchar(256) NOT NULL DEFAULT '25',
              `protocol`  varchar(256) NOT NULL DEFAULT 'SMTP',
              `mailtype`  varchar(256) NOT NULL DEFAULT 'html',
              `send_from`  varchar(256) NOT NULL DEFAULT 'All In ePOS',
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );

        // Insert Data settings_system ...
        $this->db->query("INSERT INTO cms_settings_email SET active='1';");


        // Create cms_email_template ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_email_template` (
              `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
              `login_id` bigint(20) NOT NULL DEFAULT '1',
              `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` tinyint(1) NOT NULL DEFAULT '0',
              `alias`  varchar(256) NOT NULL,
              `body`  varchar(256) NOT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###'; "
        );




        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: cms_settings_business, cms_settings_email, cms_email_template, cms_settings_system',
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

        $this->dbforge->drop_table('cms_settings_business');
        $this->dbforge->drop_table('cms_settings_email');
        $this->dbforge->drop_table('cms_email_template');
        $this->dbforge->drop_table('cms_settings_system');
    }
}

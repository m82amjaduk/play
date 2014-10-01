<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_offers extends CI_Migration {

    public function up()
    {
        // Create offers ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS  `offers` (
                `id` INT(11)  UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT  UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `sn` INT(11)  DEFAULT '1',
                `offer_code` VARCHAR(128) UNIQUE NOT NULL,
                `title` VARCHAR(256) NOT NULL DEFAULT 'New',
                `summary` VARCHAR(2048) NOT NULL DEFAULT 'New',
                `start_date` DATETIME NOT NULL DEFAULT '2014-10-01 06:46:49',
                `end_date`  DATETIME NOT NULL DEFAULT '2015-10-01 06:46:49',
                `product_include` VARCHAR (2048) NOT NULL DEFAULT '#' COMMENT '#=All Product Included, enter id comma seperated. Will apply to those troduct only',
                `product_exclude` VARCHAR (2048) NOT NULL DEFAULT '#' COMMENT '#=All Product Included, enter id comma seperated. eg. 50,51,52,55',
                `product_exclude_meal_deal` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Exclude Meal Deal from this offer.',
                `offers_page_show` TINYINT(1) NOT NULL DEFAULT '1',
                `offers_page_description` TEXT,
                `offers_page_terms` TEXT,
                `offers_page_readmore_link` VARCHAR(256) NULL DEFAULT 'takeaway/menu/6',
                `email_template` TEXT,
                `admin_message` TEXT,
                `min_value` FLOAT(7,2) NULL DEFAULT '10.00',
                `cw_discount_percentage` FLOAT(7,2) NULL DEFAULT '0.00',
                `store_discount_percentage` FLOAT(7,2) NULL DEFAULT '0.00',
                `cw_discount_amount` FLOAT(7,2) NULL DEFAULT '0.00',
                `store_discount_amount` FLOAT(7,2) NULL DEFAULT '0.00',
                `receiving` VARCHAR(32) NULL DEFAULT 'collection_delivery',
                `code_require` TINYINT(1) NOT NULL DEFAULT '1',
                `maximum_use` TINYINT(3) NOT NULL DEFAULT '-2' COMMENT '-2, for unlimited',
                `time_check` TINYINT(1) NOT NULL DEFAULT '0',
                `apply_loyalty_points` TINYINT(1) NOT NULL DEFAULT '1',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );
        // Inserting Data  ...
        $this->db->query("INSERT INTO offers SET offer_code='ALLINEPOS', start_date=NOW()+INTERVAL 1 DAY, end_date=NOW()+INTERVAL 30 DAY;");


        // Create offer_time_validity  ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `offer_time_validity` (
              `id` int(11)  UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT  UNIQUE,
              `login_id` bigint(20) NOT NULL DEFAULT '1',
              `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` tinyint(1) NOT NULL DEFAULT '0',
              `offer_id` int(11) DEFAULT '-2',
              `day` varchar(16) DEFAULT 'mon',
              `from_` VARCHAR(5) NOT NULL DEFAULT '17:30',
              `to_` VARCHAR(5) NOT NULL DEFAULT '23:59',
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );

        // Do not Require default data for rest of the tables !!!


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: offers, offer_time_validity',
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

        $this->dbforge->drop_table('offers');
        $this->dbforge->drop_table('offer_time_validity');
        $this->dbforge->drop_table('offers_product');
        $this->dbforge->drop_table('offers_user');
    }
}
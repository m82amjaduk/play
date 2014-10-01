<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_services extends CI_Migration {

    public function up()
    {
        // Create services_collection ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `services_collection` (
                `id` INT(11) UNSIGNED ZEROFILL  NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `available` TINYINT(1) NULL DEFAULT '1',
                `current_waiting_time` INT(5) NULL DEFAULT '15',
                `opening_hours` TEXT NULL,
                `maximum_cover_cash` INT(5) NULL DEFAULT '15.00',
                `mini_order_value` FLOAT(7,2) NULL DEFAULT '10.00',
                `start_after` INT(5) NULL DEFAULT '10',
                `end_before` INT(5) NULL DEFAULT '10',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );

        $this->db->query("INSERT INTO services_collection SET active='1';");


        // Create services_delivery ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS  `services_delivery` (
                `id` INT(11) UNSIGNED ZEROFILL  NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '1',
                `available` TINYINT(1) NULL DEFAULT '1',
                `current_waiting_time` INT(5) NULL DEFAULT '45',
                `opening_hours` TEXT NULL,
                `maximum_cover_cash` INT(5) NULL DEFAULT '15',
                `mini_order_value` FLOAT(7,2) NULL DEFAULT '10',
                `start_after` INT(5) NULL DEFAULT '0',
                `end_before` INT(5) NULL DEFAULT '0',
                `maximum_cover` FLOAT(7,2) DEFAULT '6',
                `free_area`  FLOAT(7,2) DEFAULT '3',
                `default_charge`  FLOAT(7,2) DEFAULT '2.00',
                `post_code_lookup` TINYINT(1) NOT NULL DEFAULT '0',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );

        $this->db->query("INSERT INTO services_delivery SET active='1';");


        // Create services_sit_in ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `services_sit_in` (
                `id` INT(11) UNSIGNED ZEROFILL  NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `available` TINYINT(1) NOT NULL DEFAULT '0',
                `opening_hours` TEXT NULL,
                `start_after` INT(11) NULL DEFAULT '0',
                `end_before` INT(11) NULL DEFAULT '0',
                `max_sit` INT(11) NULL DEFAULT '1',
                `licensed` TINYINT(1) NOT NULL DEFAULT '0',
                `air_condition` TINYINT(1) NOT NULL DEFAULT '0',
                `wheel_chair` TINYINT(1) NOT NULL DEFAULT '0',
                `disable_toilet` TINYINT(1) NOT NULL DEFAULT '0',
                `booking_accepted` TINYINT(1) NOT NULL DEFAULT '0',
                `admin` TINYINT(1) NOT NULL DEFAULT '0',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );

        $this->db->query("INSERT INTO services_sit_in SET active='0';");


        // Create rest_reservations ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `services_reservations` (
                  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                  `login_id` bigint(20) NOT NULL DEFAULT '1',
                  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                  `active` tinyint(1) NOT NULL DEFAULT '0',
                  `user_code`  varchar(10),
                  `fnames`  varchar(256) NOT NULL,
                  `lname`  varchar(256) NOT NULL,
                  `email`  varchar(256) NOT NULL,
                  `phone`  varchar(256) NOT NULL,
                  `cover`  varchar(256) NOT NULL,
                  `reservation_time`  bigint(20) NOT NULL DEFAULT '1',
                  `note`  text,
                  PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );
        //Does not require Data



        // Create rest_reservations_confirm ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS  `services_reservations_confirm` (
                  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                  `login_id` bigint(20) NOT NULL DEFAULT '1',
                  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                  `active` tinyint(1) NOT NULL DEFAULT '0',
                  `rest_reservations_id`   bigint(20) NOT NULL ,
                  `confirmation_sent` tinyint(1) NOT NULL DEFAULT '0',
                  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
                  `arrived` tinyint(1) NOT NULL DEFAULT '0',
                  PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );
        //Does not require Data


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: services_collection, services_delivery, services_sit_in, services_reservations, services_reservations_confirms',
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

        $this->dbforge->drop_table('services_collection');
        $this->dbforge->drop_table('services_delivery');
        $this->dbforge->drop_table('services_sit_in');
        $this->dbforge->drop_table('services_reservations');
        $this->dbforge->drop_table('services_reservations_confirm');
    }
}






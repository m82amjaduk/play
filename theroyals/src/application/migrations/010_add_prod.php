<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_prod extends CI_Migration {

    public function up()
    {
        // Create prod_list ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `prod_list` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `short_name` varchar(128) DEFAULT '#',
  `name_kitchen` varchar(128) DEFAULT '#',
  `description` text,
  `price` decimal(20,2) DEFAULT '1.00',
  `prod_category_id` int(11) NOT NULL DEFAULT '2',
  `vat` decimal(20,2) NOT NULL DEFAULT '-2',
  `instruction` text,
  `default_note` text,
  `note_must` tinyint(4) NOT NULL DEFAULT '0',
  `note_show` tinyint(4) DEFAULT '0',
  `prod_code` varchar(32) DEFAULT '#',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;");


        $this->db->query("INSERT INTO prod_list SET active='1', title='Chicken Tikka(ST)', prod_category_id='2', prod_code='1';");
        $this->db->query("INSERT INTO prod_list SET active='1', title='Lam Tikka (ST)', prod_category_id='2', prod_code='2';");
        $this->db->query("INSERT INTO prod_list SET active='1', title='Onion Bhaji', prod_category_id='2', prod_code='3';");
        $this->db->query("INSERT INTO prod_list SET active='1', title='Prwan Puri', prod_category_id='2', prod_code='4';");
        $this->db->query("INSERT INTO prod_list SET active='1', title='Tandoori Chicken', prod_category_id='2', prod_code='5';");
        $this->db->query("INSERT INTO prod_list SET active='1', title='Simla Moris', prod_category_id='2', prod_code='6';");
        $this->db->query("INSERT INTO prod_list SET active='1', title='Chicken Tikka Masala', prod_category_id='3', prod_code='7';");
        $this->db->query("INSERT INTO prod_list SET active='1', title='Lam Tikka Masala', prod_category_id='3', prod_code='8';");
        $this->db->query("INSERT INTO prod_list SET active='1', title='Prwan Tikka Masala', prod_category_id='3', prod_code='9';");
        $this->db->query("INSERT INTO prod_list SET active='1', title='Chicken Tikka Razala', prod_category_id='3', prod_code='10';");
        $this->db->query("UPDATE prod_list SET description='Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala';");


        // Create prod_category ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `prod_category` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `parent_category_id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `description` text,
  `takeaway_sit_in` varchar(32) NOT NULL DEFAULT 'takeaway',
  `image_src` text,
  `image_href` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;");


        $this->db->query("INSERT INTO prod_category SET active='1', title='Takeaway Menu', parent_category_id='0';");
        $this->db->query("INSERT INTO prod_category SET active='1', title='Starter', parent_category_id='1';");
        $this->db->query("INSERT INTO prod_category SET active='1', title='Chef SPecials', parent_category_id='1';");

        // Create prod_meats ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `prod_meats` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `short_name` varchar(128) NOT NULL DEFAULT '#',
  `icon` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;");

        $this->db->query("INSERT INTO `prod_meats`
              VALUES (1,1,'2014-04-19 13:14:22',1,1,'Chicken','CH',NULL),
              (2,1,'2014-04-19 13:14:22',1,2,'Lamb','LM',NULL),
              (3,1,'2014-04-19 13:14:22',1,3,'Veg','VG',NULL),
              (4,1,'2014-04-19 13:14:22',1,4,'Prwan','PR',NULL),
              (5,1,'2014-04-19 13:14:22',1,5,'King Prwan','KP',NULL),
              (6,1,'2014-04-19 13:14:22',1,6,'King Prwan Tikka','KP',NULL),
              (7,1,'2014-04-19 13:14:22',1,7,'Chicken Tikka','KP',NULL),
              (8,1,'2014-04-19 13:14:22',1,8,'Lamb Tikka','KP',NULL);"
        );

        // Create prod_meat_price ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `prod_meat_price` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `prod_list_id` int(11) NOT NULL,
  `prod_meats_id` int(11) NOT NULL,
  `price` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;");

        $this->db->query("INSERT INTO `prod_meat_price`
                VALUES (1,1,'2014-04-19 13:30:20',1,1,1,2,3.00),
                (2,1,'2014-04-19 13:30:20',1,1,1,1,4.00),
                (3,1,'2014-04-19 13:30:20',1,1,1,3,5.00),
                (4,1,'2014-04-19 13:30:20',1,1,2,4,1.00),
                (5,1,'2014-04-19 13:30:20',1,1,2,5,3.00),
                (6,1,'2014-04-19 13:30:20',1,1,1,6,6.00),
                (7,1,'2014-04-19 13:30:20',1,1,1,7,7.00),
                (8,1,'2014-04-19 13:30:20',1,1,1,8,3.00);"
        );



        // Create prod_options ...
        $this->db->query("DROP VIEW IF EXISTS `prod_meat_view`;");
        // Create prod_options ...
        $this->db->query("CREATE VIEW prod_meat_view AS
 SELECT
 prod_meat_price.id AS price_id,
 prod_meat_price.active AS price_active,
 prod_meat_price.sn AS price_sn,
 prod_meat_price.prod_list_id,
 prod_meat_price.price,

 prod_meats.id AS meats_id,
 prod_meats.active AS meats_active,
 prod_meats.title AS meats_title,
 prod_meats.short_name,
 prod_meats.icon,

 prod_list.prod_category_id

 FROM prod_meats
RIGHT JOIN prod_meat_price  ON prod_meat_price.prod_meats_id = prod_meats.id
RIGHT JOIN prod_list ON prod_list.id =  prod_meat_price.prod_list_id
ORDER BY  prod_meat_price.sn ASC;");




        // Create prod_options ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `prod_options` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `name_option`  varchar(256) NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        $this->db->query("INSERT INTO prod_options SET active='1', name_option='Large' ;");
        $this->db->query("INSERT INTO prod_options SET active='1', name_option='Small' ;");
        $this->db->query("INSERT INTO prod_options SET active='1', name_option='Chicken Tikka Masalla' ;");



        // Create prod_options_price ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `prod_options_price` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn`  int(11) NOT NULL DEFAULT '1',
  `group_no`  int(11) NOT NULL DEFAULT '1',
  `prod_id`  int(11) NOT NULL DEFAULT '1',
  `prod_options_id` int(11) NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL DEFAULT '1.50',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        $this->db->query("INSERT INTO prod_options_price SET active='1'");


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: prod_list, prod_category, prod_meats, prod_meat_price, prod_options, prod_options_price; ADDED VIEW:: prod_meat_view ',
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

        $this->dbforge->drop_table('prod_list');
        $this->dbforge->drop_table('prod_category');
        $this->dbforge->drop_table('prod_meats');
        $this->dbforge->drop_table('prod_meat_price');
        $this->dbforge->drop_table('prod_options');
        $this->dbforge->drop_table('prod_options_price');

        $this->db->query("DROP VIEW IF EXISTS `prod_meat_view`;");
    }
}

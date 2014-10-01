<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_orders extends CI_Migration {

    public function up()
    {
        // Create prod_options ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS  `orders` (
              `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
              `login_id` bigint(20) NOT NULL,
              `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` tinyint(1) NOT NULL DEFAULT '1',
              `order_code` varchar(7) NOT NULL UNIQUE DEFAULT 'AAA1786',
              `order_id_temp` varchar(32) NOT NULL UNIQUE DEFAULT 'AAA0000',
              `user_code` varchar(7) NOT NULL DEFAULT 'AAA0000',
              `fname` varchar(128),
              `lname` varchar(128),
              `email` text ,
              `phone` varchar(16) ,
              `house` varchar(16) ,
              `address1` varchar(256) ,
              `address2` varchar(256) ,
              `town` varchar(256) ,
              `city` varchar(256) ,
              `county` varchar(256) ,
              `postcode` varchar(256) ,
              `address_direction` text,
              `requested_time` bigint(20) NOT NULL,
              `receiving` varchar(10) NOT NULL DEFAULT 'delivery',
              `discount_code` varchar(128) ,
              `pay_method` varchar(128) ,
              `pay_status` varchar(128) ,
              `items` text,
              `note` text,
              `bag_total` decimal(20,2) DEFAULT '0.00',
              `delivery_charge` decimal(20,2) DEFAULT '0.00',
              `transaction_fee` decimal(20,2) DEFAULT '0.00',
              `base_payable` decimal(20,2) DEFAULT '0.00',
              `vat_value` decimal(20,2) DEFAULT '0.00',
              `discount_price` decimal(20,2) DEFAULT '0.00',
              `checkout_price` decimal(20,2) DEFAULT '0.00',
              `club_point` bigint(20) NOT NULL,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );


        // Create orders_cwdp ...
        $this->db->query("
            CREATE TABLE IF NOT EXISTS  `orders_cwdp` (
              `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
              `login_id` bigint(20) NOT NULL DEFAULT '1',
              `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` tinyint(1) NOT NULL DEFAULT '1',
              `order_code` varchar(7) NOT NULL UNIQUE ,
              `printed` tinyint(1) NOT NULL DEFAULT '0',
              `print_time` bigint(20),
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );


        // Droping  trg_order...
        $this->db->query("DROP FUNCTION IF EXISTS trg_order;");
        // Creating trg_order
        $SQL =
            "CREATE TRIGGER trg_order BEFORE INSERT ON orders
            FOR each ROW
              BEGIN

                DECLARE last_code char(10);
                SET last_code =  (SELECT order_code FROM orders ORDER BY id DESC LIMIT 0, 1);

                IF last_code IS NULL THEN
                  SET NEW.order_code = 'AAA1786';
                  INSERT INTO orders_cwdp (order_code) VALUES ('AAA1786');
                ELSE
                  SET NEW.order_code = GetUnID(last_code);
                  INSERT INTO orders_cwdp (order_code) VALUES (NEW.order_code);
                END IF;
            END";
        $this->db->query( $SQL);



        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'        => substr(basename(__FILE__), 0, 3),
                'date_created'      => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: orders, orders_cwdp, trg_order',
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

        $this->dbforge->drop_table('orders');
        $this->dbforge->drop_table('orders_cwdp');
        $this->db->query("DROP FUNCTION IF EXISTS trg_order;");
    }
}

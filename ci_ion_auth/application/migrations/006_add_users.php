<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_users extends CI_Migration {

    public function up()
    {
        ############################################  Fixing ION_AUTH
        $this->db->query("TRUNCATE `groups`;");
        $this->db->query("INSERT INTO `groups` (`id`, `name`, `description`) VALUES
             (1,'admin','Administrator'),
             (2,'members','General User');");

        $PASSWORD = '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36';
        $this->db->query("TRUNCATE `users`;");
        $this->db->query("INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
              ('1','127.0.0.1','administrator','$PASSWORD','','admin@admin.com','',NULL,'1268889823','1268889823','1', 'Admin','istrator','ADMIN','0');");

        $this->db->query("TRUNCATE `users_groups`;");
        $this->db->query("INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES (1,1,1), (2,1,2);");
        ############################################  END Fixing ION_AUTH




        ############################################ All in ePOS Admins
        $this->db->query("INSERT INTO `groups` (`id`, `name`, `description`) VALUES
            (3, 'allinepos', 'All Admin user from All In Epos');"
        );

        $AMZAD      = '$2y$08$yzqXoY2gANMLcc/rhyZ8j.r18.0QFLEWTBqXpAJ9..A6zdB0KjsOK';    // HelloWorld@
        $LAILTA     = '$2y$08$8DFKvxXz/nErqwtbq92oGe.rxVMvpJpD8PNARjroKit3hOFc.jyxy';   // amzad123@
        $REZWANUR   = '$2y$08$8DFKvxXz/nErqwtbq92oGe.rxVMvpJpD8PNARjroKit3hOFc.jyxy';   // amzad123@
        $TANJUM     = '$2y$08$A/hjiITaafIz.FEx47lZfOECM5mtbQdxSFzSSYWwdArftTsW8eVay';   // Khan123@
        $this->db->query("INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(2, '127.0.0.1', 'amzadmojumder', '$AMZAD', '', 'amzadfof@gmail.com', NULL, NULL, NULL, NULL, 1405554124, 1405554124, 1, 'Amzad', 'Mojumder', 'Conosurtek Ltd', '07900642131'),
(3, '127.0.0.1', 'lalitasahu', '$LAILTA', '', 'lalita@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405554460, 1405554460, 1, 'Lalita', 'Sahu', 'All In Epos', '07402950926'),
(4, '127.0.0.1', 'tanjumkhan', '$REZWANUR', '', 'mr@conosurtek.net', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'Rezwanur', 'Rahman', 'Cwaiter Ltd', '07900642133'),
(5, '127.0.0.1', 'tanjumkhan', '$TANJUM', '', 'tanjum@cwaiter.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'Tanjum', 'Khan', 'Cwaiter Ltd', '07900642133');");

        $this->db->query("INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
            (3, 1, 3),
            (4, 2, 1),
            (5, 2, 2),
            (6, 2, 3),
            (7, 3, 1),
            (8, 3, 2),
            (9, 3, 3),
            (10, 4, 1),
            (11, 4, 2),
            (12, 4, 3),
            (13, 5, 1),
            (14, 5, 2),
            (15, 5, 3);"
        );
        ############################################  END All in ePOS Admins




        // Create users_address ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `users_address` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `users_id`   bigint(20) NOT NULL ,
  `user_code`  varchar(32) NOT NULL,
  `address1`  varchar(256) NOT NULL,
  `address2`  varchar(256),
  `town`  varchar(256),
  `city`  varchar(256),
  `county`  varchar(256),
  `country`  varchar(256),
  `postcode`  varchar(32) NOT NULL,
  `map_latlng_id` int(11) NOT NULL,
  `primary_address` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';");

        // Does not require Default Data .. !!




        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE: user_address; FIXED: Ion_auth data',
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

        $this->dbforge->drop_table('users_address');


        ############################################  Fixing ION_AUTH
        $this->db->query("TRUNCATE `groups`;");
        $this->db->query("INSERT INTO `groups` (`id`, `name`, `description`) VALUES
             (1,'admin','Administrator'),
             (2,'members','General User');");

        $PASSWORD = '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36';
        $this->db->query("TRUNCATE `users`;");
        $this->db->query("INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
              ('1','127.0.0.1','administrator','$PASSWORD','','admin@admin.com','',NULL,'1268889823','1268889823','1', 'Admin','istrator','ADMIN','0');");

        $this->db->query("TRUNCATE `users_groups`;");
        $this->db->query("INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES (1,1,1), (2,1,2);");
        ############################################  END Fixing ION_AUTH

    }
}

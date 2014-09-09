<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_users extends CI_Migration {

    public function up()
    {
        // Create users_address ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `users_address` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
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
  `primary_address` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Does not require Insert Code...
    }

    public function down()
    {
        $this->dbforge->drop_table('users_address');
    }
}

<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_prod extends CI_Migration {

    public function up()
    {
        // Create prod_options ...
        $this->db->query("CREATE TABLE `prod_options` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `name_option`  varchar NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");


        // Create prod_options_price ...
        $this->db->query("CREATE TABLE `prod_options_price` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn`  int(11) NOT NULL ,
  `group_no`  int(11) NOT NULL ,
  `prod_id`  int(11) NOT NULL ,
  `prod_options_id` int(11) NOT NULL ,
  `price` int(11) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");


    }

    public function down()
    {
        $this->dbforge->drop_table('prod_options');
        $this->dbforge->drop_table('prod_options_price');
    }
}

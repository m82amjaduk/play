<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_map extends CI_Migration {

    public function up()
    {
        // Create map_latlng ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `map_latlng` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `search_key`  varchar(32) NOT NULL COMMENT 'eg. GU21 5ED, south end, Cherry Tree Walk',
  `search_key_nospace`  varchar(32) NOT NULL COMMENT 'eg. GU215ED, SOUTHEND, CHERRYTREEWALK',
  `lat`  varchar(32) NOT NULL DEFAULT '0',
  `lng`  varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Does not require Insert Code...
    }

    public function down()
    {
        $this->dbforge->drop_table('map_latlng');
    }
}

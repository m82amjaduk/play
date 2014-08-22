<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_logs extends CI_Migration {

    public function up()
    {
        // Create logs ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `errno` int(2) NOT NULL,
  `errtype` varchar(32) NOT NULL,
  `errstr` text NOT NULL,
  `errfile` varchar(255) NOT NULL,
  `errline` int(4) NOT NULL,
  `user_agent` varchar(120) NOT NULL,
  `ip_address` varchar(45) DEFAULT '0' NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`, `ip_address`, `user_agent`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Does not require Insert Code...


    }

    public function down()
    {
        $this->dbforge->drop_table('logs');
    }
}

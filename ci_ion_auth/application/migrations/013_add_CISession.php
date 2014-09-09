<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_CISession extends CI_Migration {

    public function up()
    {
        // Create ci_sessions ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  `ci_sessions` (
	session_id varchar(40) DEFAULT '0' NOT NULL,
	ip_address varchar(45) DEFAULT '0' NOT NULL,
	user_agent varchar(120) NOT NULL,
	last_activity int(10) unsigned DEFAULT 0 NOT NULL,
	user_data text NOT NULL,
	PRIMARY KEY (session_id),
	KEY `last_activity_idx` (`last_activity`)
);
");
        // Does not require Insert Code...
    }

    public function down()
    {
        $this->dbforge->drop_table('ci_sessions');
    }
}

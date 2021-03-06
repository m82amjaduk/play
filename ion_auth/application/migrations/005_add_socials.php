<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_socials extends CI_Migration {

    public function up()
    {
        $this->dbforge->add_field(array(
            'id' => array(
                'type' => 'INT',
                'constraint' => 11,
                'unsigned' => TRUE,
                'auto_increment' => TRUE,
                'zerofill' => TRUE,
            ),
            'login_id' => array(
                'type' => 'BIGINT',
                'constraint' => '20',
                'null' => FALSE,
                'default' => '1',
            ),
            'updated' => array(
                'type' => 'TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',
                'null' => FALSE,
            ),
            'active' => array(
                'type' => 'TINYINT',
                'constraint' => '4',
                'null' => FALSE,
                'default' => '0',
            ),
            'url' => array(
                'type' => 'TEXT',
                'null' => TRUE,
            ),
            'note' => array(
                'type' => 'TEXT',
                'null' => TRUE,
            )
        ));
        $this->dbforge->add_key('id', TRUE);
        $this->dbforge->create_table('social_google', TRUE);


        // Copy Tables for other socials, since they are similar ... :)
        $this->db->query("CREATE TABLE social_facebook LIKE social_google");
        $this->db->query("CREATE TABLE social_youtube LIKE social_google");
        $this->db->query("CREATE TABLE social_takeawayguru LIKE social_google");
        $this->db->query("CREATE TABLE social_tripadvisor LIKE social_google");
        $this->db->query("CREATE TABLE social_href LIKE social_google");

        // Dumping data for table 'social_google'
        $data = array(
            array(
                'url' => 'http://goolge.com'
            )
        );
        $this->db->insert_batch('social_google', $data);

        // Dumping data for table 'social_youtube'
        $data = array(
            array(
                'url' => 'http://youtube.com'
            )
        );
        $this->db->insert_batch('social_youtube', $data);

        // Dumping data for table 'social_takeawayguru'
        $data = array(
            array(
                'url' => 'http://takeawayguru.com'
            )
        );
        $this->db->insert_batch('social_takeawayguru', $data);

        // Dumping data for table 'social_tripadvisor'
        $data = array(
            array(
                'url' => 'http://tripadvisor.com'
            )
        );
        $this->db->insert_batch('social_tripadvisor', $data);


        // Adding added fields for facebook ...
        $fields = array(
            'like_code' => array(
                'type' => 'TEXT',
                'null'=> TRUE
            ),
            'share' => array(
                'type' =>'TEXT',
                'null' => TRUE,
            ),
            'application_id' => array(
                'type' => 'TEXT',
                'null' => TRUE,
            ),
            'access_token' => array(
                'type' => 'TEXT',
                'null' => TRUE,
            ),
            'page_id' => array(
                'type' => 'TEXT',
                'null' => TRUE,
            ),
        );
        $this->dbforge->add_column('social_facebook', $fields);

        // Dumping data for table 'social_facebook'
        $data = array(
            array(
                'url' => 'http://facebook.com'
            )
        );
        $this->db->insert_batch('social_facebook', $data);

        // Adding added fields for social_href ...
        $fields = array(
            'sn' => array(
                'type' =>'INT',
                'constraint' => 11,
                'null' => TRUE,
                'default' => '1'
            ),
            'social_name' => array(
                'type' => 'VARCHAR',
                'constraint' => 512,
                'null' => TRUE,
                'default' => NULL
            ),
            'icon' => array(
                'type' => 'TEXT',
                'null' => TRUE,
            ),
            'logo' => array(
                'type' => 'TEXT',
                'null' => TRUE,
            ),
        );
        $this->dbforge->add_column('social_href', $fields);

        // Dumping data for table 'social_href'
        $data = array(
            array(
                'id'            => '1',
                'url'           => 'http://takeawayguru.com',
                'note'          => 'takeaway guru',
                'sn'            => '1',
                'social_name'   => 'takeawayguru',
                'icon'          => 'http://takeawayguru.com/imgCommon/social/takeawayguru.ico',
                'logo'          => 'http://takeawayguru.com/imgCommon/social/takeawayguruLogo.png',
            ),
            array(
                'id'            => '2',
                'url'           => 'http://facebook.com',
                'note'          => 'takeaway guru',
                'sn'            => '2',
                'social_name'   => 'facebook',
                'icon'          => 'http://takeawayguru.com/imgCommon/social/facebook.ico',
                'logo'          => 'http://takeawayguru.com/imgCommon/social/facebookLogo.png',
            ),
            array(
                'id'            => '3',
                'url'           => 'http://youtube.com',
                'note'          => 'youtube',
                'sn'            => '3',
                'social_name'   => 'youtube',
                'icon'          => 'http://takeawayguru.com/imgCommon/social/youtube.ico',
                'logo'          => 'http://takeawayguru.com/imgCommon/social/youtubeLogo.png',
            ),
        );
        $this->db->insert_batch('social_href', $data);
    }


    public function down()
    {
        $this->dbforge->drop_table('social_google');
        $this->dbforge->drop_table('social_facebook');
        $this->dbforge->drop_table('social_youtube');
        $this->dbforge->drop_table('social_takeawayguru');
        $this->dbforge->drop_table('social_tripadvisor');
        $this->dbforge->drop_table('social_href');
    }
}

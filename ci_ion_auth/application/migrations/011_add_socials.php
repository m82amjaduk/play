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
                'constraint' => '1', 
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
        // Above ZEROFILL Does not work ... .
        $this->db->query("ALTER TABLE social_google MODIFY COLUMN id INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;");



        // Copy Tables for other socials, since they are similar ... :)
        $this->db->query("CREATE TABLE social_facebook LIKE social_google");
        $this->db->query("CREATE TABLE social_youtube LIKE social_google");
        $this->db->query("CREATE TABLE social_takeawayguru LIKE social_google");
        $this->db->query("CREATE TABLE social_tripadvisor LIKE social_google");
        $this->db->query("CREATE TABLE social_href LIKE social_google");

        // Dumping data for table 'social_google'
        $data = array(
            array(
                'url' => 'https://plus.google.com/u/0/'
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
                'url' => 'https://www.youtube.com/channel/UCJENQl-cgkP2ZiiYDhXWXRA'
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
                'url' => 'https://www.facebook.com/TakeAwayGuru/timeline'
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
                'url'           => 'https://www.facebook.com/TakeAwayGuru/timeline',
                'note'          => 'Facebook',
                'sn'            => '2',
                'social_name'   => 'facebook',
                'icon'          => 'http://takeawayguru.com/imgCommon/social/facebook.ico',
                'logo'          => 'http://takeawayguru.com/imgCommon/social/facebookLogo.png',
            ),
            array(
                'id'            => '3',
                'url'           => 'https://www.youtube.com/channel/UCJENQl-cgkP2ZiiYDhXWXRA',
                'note'          => 'youtube',
                'sn'            => '3',
                'social_name'   => 'youtube',
                'icon'          => 'http://takeawayguru.com/imgCommon/social/youtube.ico',
                'logo'          => 'http://takeawayguru.com/imgCommon/social/youtubeLogo.png',
            ),
            array(
                'id'            => '4',
                'url'           => 'https://twitter.com/takeawayguru',
                'note'          => 'twitter',
                'sn'            => '4',
                'social_name'   => 'twitter',
                'icon'          => 'http://takeawayguru.com/imgCommon/social/twitter.ico',
                'logo'          => 'http://takeawayguru.com/imgCommon/social/twitterLogo.png',
            ),
            array(
                'id'            => '5',
                'url'           => 'https://plus.google.com/u/0/',
                'note'          => 'Google +',
                'sn'            => '5',
                'social_name'   => 'google+',
                'icon'          => 'http://takeawayguru.com/imgCommon/social/google.ico',
                'logo'          => 'http://takeawayguru.com/imgCommon/social/googleLogo.png',
            ),
            array(
                'id'            => '6',
                'url'           => 'http://takeawayguru1.blogspot.co.uk/',
                'note'          => 'Blogpost',
                'sn'            => '6',
                'social_name'   => 'blogpost',
                'icon'          => 'http://takeawayguru.com/imgCommon/social/blogpost.ico',
                'logo'          => 'http://takeawayguru.com/imgCommon/social/blogpostLogo.png',
            ),
            array(
                'id'            => '7',
                'url'           => 'http://www.pinterest.com/lalitasahu73/',
                'note'          => 'Pinterest',
                'sn'            => '7',
                'social_name'   => 'pinterest',
                'icon'          => 'http://takeawayguru.com/imgCommon/social/pinterest.ico',
                'logo'          => 'http://takeawayguru.com/imgCommon/social/pinterestLogo.png',
            ),
            array(
                'id'            => '8',
                'url'           => 'https://www.tumblr.com/blog/takeawayguru',
                'note'          => 'Tumblr',
                'sn'            => '8',
                'social_name'   => 'tumblr',
                'icon'          => 'http://takeawayguru.com/imgCommon/social/tumblr.ico',
                'logo'          => 'http://takeawayguru.com/imgCommon/social/tumblrLogo.png',
            ),
        );
        $this->db->insert_batch('social_href', $data);


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE::  social_google, social_facebook, social_youtube, social_takeawayguru, social_tripadvisor, social_href',
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

        $this->dbforge->drop_table('social_google');
        $this->dbforge->drop_table('social_facebook');
        $this->dbforge->drop_table('social_youtube');
        $this->dbforge->drop_table('social_takeawayguru');
        $this->dbforge->drop_table('social_tripadvisor');
        $this->dbforge->drop_table('social_href');
    }
}

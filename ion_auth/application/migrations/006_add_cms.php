<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_cms extends CI_Migration {

    public function up()
    {
        // Create cms_email_config ...
        $this->db->query("CREATE TABLE `cms_email_config` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `email_from`  varchar(256) NOT NULL DEFAULT 'system@takeawayguru.com',
  `smtp_user`  varchar(256) NOT NULL DEFAULT 'system+takeawayguru.com',
  `smtp_password`  varchar(256) NOT NULL DEFAULT 'system789@!',
  `smtp_host`  varchar(256) NOT NULL DEFAULT '109.203.102.20',
  `smtp_port`  varchar(256) NOT NULL DEFAULT '25',
  `protocol`  varchar(256) NOT NULL DEFAULT 'SMTP',
  `mailtype`  varchar(256) NOT NULL DEFAULT 'html',
  `send_from`  varchar(256) NOT NULL DEFAULT 'All In ePOS',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");


        // Create cms_email_template ...
        $this->db->query("CREATE TABLE `cms_email_template` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `alias`  varchar(256) NOT NULL,
  `body`  varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");



        // Create cms_blog ...
        $this->db->query("CREATE TABLE `cms_blog` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11)  DEFAULT '1',
	`blog_name` VARCHAR(256) NOT NULL DEFAULT 'New',
	`description` TEXT NULL,
	`image_src` TEXT NULL,
	`image_href` TEXT NULL,
	`thumb_src` TEXT NULL,
	`button` TEXT NULL,
	`button_href` TEXT NULL,
	`page_template` VARCHAR(256) NOT NULL DEFAULT 'blog/page01',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Create cms_blog_note ...
        $this->db->query("CREATE TABLE `cms_blog_note` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11)  DEFAULT '1',
	`blog_id` INT(11) NULL DEFAULT NULL,
	`title` VARCHAR(256) NOT NULL DEFAULT 'New',
	`description` TEXT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';
 ");

        // Create cms_gallery ...
        $this->db->query("CREATE TABLE `cms_gallery` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11)  DEFAULT '1',
	`alias` VARCHAR(256) NULL DEFAULT NULL,
	`gallery_name` TEXT NULL,
	`message` TEXT NULL,
	`folder_href` TEXT NULL,
	`page_template` VARCHAR(256) NULL DEFAULT 'base/gallery01',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###'; ");

        // Create cms_gallery_images ...
        $this->db->query("CREATE TABLE `cms_gallery_images` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11)  DEFAULT '1',
	`cms_gallery_id` INT(11) NULL DEFAULT NULL,
	`image_src` TEXT NULL,
	`image_href` TEXT NULL,
	`thumb_src` TEXT NULL,
	`thumb_href` TEXT NULL,
	`title` TEXT NULL,
	`title2` TEXT NULL,
	`title3` TEXT NULL,
	`message` TEXT NULL,
	`button` TEXT NULL,
	`button_href` TEXT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Create cms_nav ...
        $this->db->query("CREATE TABLE `cms_nav` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11)  DEFAULT '1',
	`alias` VARCHAR(256) NULL DEFAULT NULL,
	`nav_name` TEXT NOT NULL,
	`title` TEXT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###'; ");

        // Create cms_nav_url ...
        $this->db->query("CREATE TABLE `cms_nav_url` (
    `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11)  DEFAULT '1' ,
	`parent` INT(11) NOT NULL DEFAULT '0',
	`nav_name` TEXT NOT NULL,
	`cms_nav_id` INT(11) NOT NULL DEFAULT '1',
	`href` TEXT NULL,
	`image_src` TEXT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###'");


        // Create cms_slider ...
        $this->db->query("CREATE TABLE `cms_slider` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11) DEFAULT '1',
	`alias` VARCHAR(256) NULL DEFAULT NULL,
	`slider_name` TEXT NOT NULL,
	`title` TEXT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###'");

        // Create cms_slider_content ...
        $this->db->query("CREATE TABLE `cms_slider_content` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11) DEFAULT '1',
	`cms_slider_id` INT(11) NULL DEFAULT NULL,
	`alias` VARCHAR(256) NULL DEFAULT NULL,
	`title` TEXT NULL,
	`title2` TEXT NULL,
	`title3` TEXT NULL,
	`message` TEXT NULL,
	`image_src` TEXT NULL,
	`image_href` TEXT NULL,
	`thumb_src` TEXT NULL,
	`thumb_href` TEXT NULL,
	`button` TEXT NULL,
	`button_href` TEXT NULL,
	PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###'");

    }


    public function down()
    {
        $this->dbforge->drop_table('cms_email_config');
        $this->dbforge->drop_table('cms_email_template');
        $this->dbforge->drop_table('cms_slider_content');
        $this->dbforge->drop_table('cms_blog');
        $this->dbforge->drop_table('cms_blog_note');
        $this->dbforge->drop_table('cms_gallery');
        $this->dbforge->drop_table('cms_gallery_images');
        $this->dbforge->drop_table('cms_nav');
        $this->dbforge->drop_table('cms_nav_url');
        $this->dbforge->drop_table('cms_slider');
        $this->dbforge->drop_table('cms_slider_content');
    }
}

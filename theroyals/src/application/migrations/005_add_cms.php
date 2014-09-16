<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_cms extends CI_Migration {

    public function up()
    {
        // Create page_contact ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `page_contact` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `api` varchar(128) NOT NULL DEFAULT '#',
  `lat` varchar(32) NOT NULL DEFAULT '51.507351',
  `lng` varchar(32) NOT NULL DEFAULT '-0.127758',
  `marker_src` text  ,
  `marker_visible` tinyint(4) NOT NULL DEFAULT '1',
  `zoom` int(11) DEFAULT '16',
  `width` VARCHAR(32) DEFAULT '100%',
  `height` VARCHAR(32) DEFAULT '300px',
  `page_template` varchar(128) DEFAULT 'about/contact',
  `map_active` int(4) NOT NULL DEFAULT '0',
  `form_active` int(4) NOT NULL DEFAULT '0',
  `address` varchar(256)  NOT NULL DEFAULT '#',
  `phone` varchar(256)  NOT NULL DEFAULT '#',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;");

        $this->db->query("INSERT INTO page_contact SET marker_src='#'");

        // Create cms_article ...
        $this->db->query("CREATE TABLE IF NOT EXISTS  cms_article (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  sn integer,
  alias VARCHAR(256),
  title text NOT NULL,
  summary text,
  body text NOT NULL,
  banner_src text,
  banner_href text,
  image_src text,
  image_href text,
  button_href text,
  button text,
  page_template  VARCHAR(256),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='### ' AUTO_INCREMENT=1;");


        // Create cms_highlights ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `cms_highlights` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `sn` bigint(20) NOT NULL DEFAULT '1',
  `alias` varchar(256) DEFAULT NULL,
  `method` varchar(256) NOT NULL,
  `module` varchar(256) NOT NULL,
  `name` text NOT NULL,
  `title` text,
  `title2` text,
  `title3` text,
  `image_href` text,
  `image_src` text,
  `summary` text,
  `body` text,
  `button_href` text,
  `button` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8;");

        // Create cms_blog ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `cms_blog` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
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
        $this->db->query("CREATE TABLE IF NOT EXISTS `cms_blog_note` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`sn` INT(11)  DEFAULT '1',
	`blog_id` INT(11) NULL DEFAULT NULL,
	`title` VARCHAR(256) NOT NULL DEFAULT 'New',
	`description` TEXT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';");

        // Create cms_gallery ...
        $this->db->query("CREATE TABLE IF NOT EXISTS `cms_gallery` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
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
        $this->db->query("CREATE TABLE IF NOT EXISTS  `cms_gallery_images` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
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
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
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
        $this->db->query("CREATE TABLE IF NOT EXISTS  `cms_nav_url` (
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
        $this->db->query("CREATE TABLE IF NOT EXISTS `cms_slider` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
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
        $this->db->query("CREATE TABLE IF NOT EXISTS  `cms_slider_content` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
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

        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'added page_contact, cms_article, cms_highlights, cms_blog, cms_blog_note, cms_gallery, cms_gallery_images, cms_nav, cms_nav_url, cms_slider, cms_slider_content',
                'release_note_adm'  => "First Release",
                'migration_by'      => $this->session->userdata('identity'),
                'migration_ip'      => $_SERVER['REMOTE_ADDR']
            )
        );
        $this->db->insert_batch('migrations_db_versions', $data);

    }


    public function down()
    {
//        $versionNo = substr(basename(__FILE__), 0, 3);
//        $this->db->query("DELETE FROM migrations_db_versions WHERE version_no='$versionNo'");

        $this->dbforge->drop_table('page_contact');
        $this->dbforge->drop_table('cms_article');
        $this->dbforge->drop_table('cms_highlights');
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

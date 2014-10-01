<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_cms extends CI_Migration {

    public function up()
    {
        // Create page_contact ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_page_contact` (
              `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
              `login_id` bigint(20) NOT NULL DEFAULT '1',
              `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` tinyint(1) NOT NULL DEFAULT '0',
              `api` varchar(128) NOT NULL DEFAULT '#',
              `lat` varchar(32) NOT NULL DEFAULT '51.507351',
              `lng` varchar(32) NOT NULL DEFAULT '-0.127758',
              `marker_src` text  ,
              `marker_visible` tinyint(1) NOT NULL DEFAULT '1',
              `zoom` int(11) DEFAULT '16',
              `width` VARCHAR(32) DEFAULT '100%',
              `height` VARCHAR(32) DEFAULT '300px',
              `page_template` varchar(128) DEFAULT 'about/contact',
              `map_active` tinyint(1) NOT NULL DEFAULT '0',
              `form_active` tinyint(1) NOT NULL DEFAULT '0',
              `address` varchar(256)  NOT NULL DEFAULT '#',
              `phone` varchar(256)  NOT NULL DEFAULT '#',
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;"
        );

        $this->db->query("TRUNCATE  cms_page_contact");
        $this->db->query("INSERT INTO cms_page_contact SET marker_src='#' ");

        // Create cms_article ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS  cms_article (
              `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
              `login_id` bigint(20) NOT NULL DEFAULT '1',
              `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` tinyint(1) NOT NULL DEFAULT '0',
              sn INT(11) NOT NULL DEFAULT '1',
              alias VARCHAR(256) NOT NULL UNIQUE,
              title  VARCHAR(2048) DEFAULT 'Our cooking style is unique',
              summary text,
              body text,
              banner_src  VARCHAR(2048) DEFAULT '#',
              banner_href  VARCHAR(2048) DEFAULT '/takeaway/menu',
              image_src  VARCHAR(2048) DEFAULT '/img/default/articles/about_us.jpg',
              image_href  VARCHAR(2048) DEFAULT '/takeaway/menu',
              button  VARCHAR(2048) DEFAULT 'Order Online',
              button_href  VARCHAR(2048) DEFAULT '/takeaway/menu',
              page_template  VARCHAR(256) DEFAULT '#',
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='### ' AUTO_INCREMENT=1;"
        );

        $this->db->query("TRUNCATE  cms_article");
        $this->db->query("INSERT INTO cms_article SET active='1', alias='about_us', body='Our cooking style is unique and our chefs always make sure that your meal at Indian Ocean ... ';");


        // Create cms_highlights ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_highlights` (
              `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
              `login_id` bigint(20) NOT NULL DEFAULT '1',
              `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` tinyint(1) NOT NULL DEFAULT '0',
              `sn` bigint(20) NOT NULL DEFAULT '1',
              `alias` varchar(256) NOT NULL DEFAULT 'welcome',
              `method` varchar(256) NOT NULL DEFAULT 'about/home',
              `module` varchar(256) NOT NULL DEFAULT 'special',
              `name` varchar(512) NOT NULL DEFAULT 'Special Offers !!',
              `title` VARCHAR(2048) DEFAULT '#',
              `title2` VARCHAR(2048) DEFAULT '#',
              `title3` VARCHAR(2048) DEFAULT '#',
              `summary` text,
              `body` text,
              `image_src` VARCHAR(2048) DEFAULT '/img/default/highlights/welcome01.png',
              `image_href`  VARCHAR(2048) DEFAULT '/takeaway/menu',
              `button`  VARCHAR(2048) DEFAULT 'Order Online',
              `button_href` VARCHAR(2048) DEFAULT '/takeaway/menu',
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8;"
        );

        $this->db->query("TRUNCATE  cms_highlights");
        $this->db->query("INSERT INTO cms_highlights SET active='1', sn='1', alias='welcome', method='about/home', module='special', image_src='/img/default/highlights/welcome01.png';");
        $this->db->query("INSERT INTO cms_highlights SET active='1', sn='1', alias='welcome', method='about/home', module='special', image_src='/img/default/highlights/welcome02.png';");
        $this->db->query("INSERT INTO cms_highlights SET active='1', sn='1', alias='welcome', method='about/home', module='special', image_src='/img/default/highlights/welcome03.png';");
        $this->db->query("INSERT INTO cms_highlights SET active='1', sn='1', alias='welcome', method='about/home', module='mid_text', title='\$business->business_name‚ menu is meticulously designed to suit the needs of every customer.' ");
        $this->db->query("INSERT INTO cms_highlights SET active='1', sn='1', alias='welcome', method='about/main', module='our_restaurant', title='OUR RESTAURANT', body='Our dishes are freshly prepared in-house with our special \'Indian Ocean recipe\'&#44; which excludes all artificial colourings and preservatives. And all our dishes are served steaming hot into a special stay fresh packaging&#44; ready to collect or be delivered to your door step.<a href=\'about/us\'> Read More</a>';");
        $this->db->query("INSERT INTO cms_highlights SET active='1', sn='1', alias='welcome', method='about/main', module='our_food', title='OUR FOOD', body='Eating out is more than just food. It is about atmosphere&#44; about ambience&#44; but above all taste!We have installed some of India&#39;s history&#44; culture and beliefs into creating the perfect authentic feel for you. If you want to create your own dish&#44; a little hotter&#44; a little creamier?  <a href=\'about/us\'> Read More</a>';");
        $this->db->query("INSERT INTO cms_highlights SET active='1', sn='1', alias='welcome', method='about/main', module='top_banner', title='Delivered Stright To Your Door'");
        $this->db->query("INSERT INTO cms_highlights SET active='1', sn='1', alias='us', method='about/us', module='side', title='Starter', image_src='/img/default/highlights/about_us_side01.png';");
        $this->db->query("INSERT INTO cms_highlights SET active='1', sn='1', alias='us', method='about/us', module='side', title='Main Dishes', image_src='/img/default/highlights/about_us_side02.png';");
        $this->db->query("INSERT INTO cms_highlights SET active='1', sn='1', alias='us', method='about/us', module='side', title='Side Orders', image_src='/img/default/highlights/about_us_side03.png';");

        // Create cms_blog ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_blog` (
                `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `sn` INT(11)  DEFAULT '1',
                `blog_name` VARCHAR(256) NOT NULL DEFAULT 'New',
                `description` TEXT,
                `image_src`  VARCHAR(2048) DEFAULT '#',
                `image_href`  VARCHAR(2048) DEFAULT '#',
                `thumb_src`  VARCHAR(2048) DEFAULT '#',
                `button`  VARCHAR(2048) DEFAULT '#',
                `button_href`  VARCHAR(2048) DEFAULT '#',
                `page_template` VARCHAR(256) NOT NULL DEFAULT '#',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';"
        );
        // Do not Require Data

        // Create cms_blog_note ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_blog_note` (
                `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `sn` INT(11)  DEFAULT '1',
                `blog_id` INT(11) NULL DEFAULT '1',
                `title` VARCHAR(256) NOT NULL DEFAULT 'New',
                `description` TEXT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';"
        );
        // Do not Require Data..


        // Create cms_nav ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_nav` (
                `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `sn` INT(11)  DEFAULT '1',
                `alias` VARCHAR(256) NULL DEFAULT 'new',
                `nav_name` VARCHAR(512) NOT NULL DEFAULT 'HOME',
                `title` VARCHAR(512),
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );

        $this->db->query("TRUNCATE cms_nav");
        $this->db->query(
            "INSERT INTO `cms_nav` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `nav_name`) VALUES
                (00000000001, 1, '2014-09-16 14:17:34', 1, 1, 'menu_top', 'Menu Top' ),
                (00000000002, 1, '2014-09-16 14:17:14', 1, 1, 'about_top', 'About Top' ),
                (00000000003, 1, '2014-09-16 14:19:25', 1, 1, 'category_footer', 'Category Footer' ),
                (00000000004, 1, '2014-09-16 14:20:06', 1, 1, 'category_addon', 'Category Add On' );"
        );

        // Create cms_nav_url ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS  `cms_nav_url`(
                `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `nav_url_name` VARCHAR(512) NOT NULL DEFAULT 'HOME',
                `sn` INT(11)  DEFAULT '1' ,
                `parent` INT(11) NOT NULL DEFAULT '0',
                `cms_nav_id` INT(11) NOT NULL DEFAULT '1',
                `href`  VARCHAR(1024) NOT NULL DEFAULT 'about/home',
                `image_src` TEXT NULL,
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );

        $this->db->query("TRUNCATE cms_nav_url");
        $this->db->query(
            "INSERT INTO `cms_nav_url` (`id`, `login_id`, `updated`, `active`, `nav_url_name`, `sn`, `parent`, `cms_nav_id`, `href`, `image_src`) VALUES
                (00000000001, 1, '2014-09-16 14:21:52', 1, 'Home', 1, 0, 1, 'about/home', NULL),
                (00000000002, 1, '2014-09-16 14:23:42', 1, 'Menu', 2, 0, 1, 'takeaway/menu', NULL),
                (00000000003, 1, '2014-09-16 14:50:17', 1, 'About', 3, 0, 1, 'about/us', NULL),
                (00000000004, 1, '2014-09-16 14:50:17', 1, 'Gallery', 4, 0, 1, 'about/gallery', NULL),
                (00000000005, 1, '2014-09-16 14:50:17', 1, 'Contact', 5, 0, 1, 'about/contact', NULL),
                (00000000006, 1, '2014-09-16 14:50:17', 1, 'HOME', 1, 0, 2, 'about/home', NULL),
                (00000000007, 1, '2014-09-16 14:50:17', 1, 'ABOUT', 2, 0, 2, 'about/us', NULL),
                (00000000008, 1, '2014-09-16 14:50:17', 1, 'MENU', 3, 0, 2, 'takeaway/menu', NULL),
                (00000000009, 1, '2014-09-16 14:50:17', 1, 'GALLERY', 4, 0, 2, 'about/gallery', NULL),
                (00000000010, 1, '2014-09-16 14:50:17', 1, 'CONTACT', 5, 0, 2, 'about/contact', NULL),
                (00000000011, 1, '2014-09-16 14:50:17', 1, 'Starter', 1, 0, 3, 'takeaway/menu/2', NULL),
                (00000000012, 1, '2014-09-16 14:50:17', 1, 'Tandoori Dishes', 2, 0, 3, 'takeaway/menu/3', NULL),
                (00000000013, 1, '2014-09-16 14:50:17', 1, 'Chef Specials', 3, 0, 3, 'takeaway/menu/2', NULL),
                (00000000014, 1, '2014-09-16 14:50:17', 1, 'Classic Dishes', 4, 0, 3, 'takeaway/menu/2', NULL),
                (00000000015, 1, '2014-09-16 14:50:17', 1, 'Side Orders', 5, 0, 3, 'takeaway/menu/2', NULL),
                (00000000016, 1, '2014-09-16 14:50:17', 1, 'Sundries', 5, 0, 3, 'takeaway/menu/2', NULL),
                (00000000017, 1, '2014-09-18 21:50:32', 1, 'Meal Deals', 1, 0, 4, 'takeaway/menu/2', NULL),
                (00000000018, 1, '2014-09-16 14:50:17', 1, 'Meal Deals', 1, 1, 1, 'takeaway/menu/2', NULL),
                (00000000019, 1, '2014-09-18 23:16:11', 1, 'Starter', 1, 8, 2, 'takeaway/menu/2', NULL),
                (00000000020, 1, '2014-09-18 23:16:25', 1, 'Chef Special', 2, 8, 2, 'takeaway/menu/3', NULL),
                (00000000021, 1, '2014-09-18 23:16:39', 1, 'Side Oders', 3, 8, 2, 'takeaway/menu/4', NULL),
                (00000000022, 1, '2014-09-18 23:19:57', 1, 'Starter', 1, 2, 1, 'takeaway/menu/2', NULL),
                (00000000023, 1, '2014-09-18 23:20:18', 1, 'Chef Special', 2, 2, 1, 'takeaway/menu/3', NULL),
                (00000000024, 1, '2014-09-18 23:24:47', 1, 'Side Orders', 3, 2, 1, 'takeaway/menu/4', NULL);"
        );


        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_nav_site_urls` (
              `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
              `login_id` BIGINT(20) NOT NULL DEFAULT '1',
              `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` TINYINT(1) NOT NULL DEFAULT '0',
              `href` VARCHAR(2048) NOT NULL DEFAULT 'new',
              `title` VARCHAR(2048) NOT NULL DEFAULT 'Official Site | \$business->business_name',
              `description` VARCHAR(2048) NOT NULL DEFAULT '\$system->meta_description',
              `keyword` VARCHAR(2048) NOT NULL DEFAULT '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town',
              `favicon` VARCHAR(2048) NOT NULL DEFAULT 'img/struct/favicon.ico',
              `parent` INT(1) NOT NULL DEFAULT '0' COMMENT 'For SiteMap.html',
              `sitemap_html_active` TINYINT(1) NOT NULL DEFAULT '1' COMMENT 'For SiteMap.html Show or not',
              `changefreq` VARCHAR(32) NOT NULL DEFAULT 'weekly',
              `priority` VARCHAR(32) NOT NULL DEFAULT '0.08',
              `note` TEXT,
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';"
        );
        $this->db->query("TRUNCATE  cms_nav_site_urls");
        $this->db->query(
            "INSERT INTO `cms_nav_site_urls` (`id`, `login_id`, `updated`, `active`, `href`, `title`, `description`, `keyword`, `favicon`, `note`) VALUES
                  (00000000001, 1, '2014-09-18 11:35:38', 1, '', 'Official Site | Welcome To \$business->business_name', '\$system->meta_description', '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL),
                  (00000000002, 1, '2014-09-18 11:35:38', 1, 'index.php', 'Official Site | Welcome To \$business->business_name', '\$system->meta_description', '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL),
                  (00000000003, 1, '2014-09-18 11:35:38', 1, 'about/home', 'Official Site | Welcome To \$business->business_name', '\$system->meta_description', '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL),
                  (00000000004, 1, '2014-09-18 11:35:40', 1, 'takeaway/menu', '\$category->title | Menu | \$business->business_name', '\$system->meta_description', '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL),
                  (00000000005, 1, '2014-09-18 11:35:41', 1, 'about/us', 'About Us | \$business->business_name', '\$system->meta_description', '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL),
                  (00000000006, 1, '2014-09-18 11:35:43', 1, 'about/gallery', 'Our Gallery | \$business->business_name', '\$system->meta_description', '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL),
                  (00000000007, 1, '2014-09-18 11:35:44', 1, 'about/contact', 'Contact Us | \$business->business_name', '\$system->meta_description', '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL),
                  (00000000008, 1, '2014-09-18 11:35:45', 1, 'about/specialoffers', 'Special Offers | \$business->business_name', '\$system->meta_description', '\$system->meta_keywords Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL),
                  (00000000009, 1, '2014-09-18 11:35:53', 1, 'takeaway/menu/2', '\$category->title | Menu | \$business->business_name', '\$system->meta_description', '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL),
                  (00000000010, 1, '2014-09-18 11:37:15', 1, 'takeaway/menu/3', '\$category->title | Menu | \$business->business_name', '\$system->meta_description', '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL),
                  (00000000011, 1, '2014-09-18 11:37:15', 1, 'takeaway/order_details', 'Order Details Input | \$business->business_name', '\$system->meta_description', '\$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, \$business->town', 'img/struct/favicon.ico', NULL);"
        );


        $this->db->query("DROP VIEW IF EXISTS `cms_nav_view`;");
        // Create prod_meat_view ...
        $this->db->query(
            "CREATE VIEW  cms_nav_view AS
            SELECT
                cms_nav.id AS cms_nav_id,
                cms_nav.active AS cms_nav_active,
                cms_nav.sn AS cms_nav_sn,
                cms_nav.alias,
                cms_nav.nav_name,
                cms_nav.title,

                cms_nav_url.id AS cms_nav_url_id,
                cms_nav_url.active AS cms_nav_url_active,
                cms_nav_url.sn AS cms_nav_url_sn,
                cms_nav_url.parent,
                cms_nav_url.nav_url_name,
                cms_nav_url.href,
                cms_nav_url.image_src

            FROM cms_nav
            RIGHT JOIN cms_nav_url ON cms_nav_url.cms_nav_id = cms_nav.id
            WHERE cms_nav_url.active = 1
            ORDER BY cms_nav_url.sn ASC;"
        );


        // Create cms_slider ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_slider` (
                `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `sn` INT(11) DEFAULT '1',
                `alias` VARCHAR(256) NULL DEFAULT NULL,
                `slider_name` VARCHAR(2048) NOT NULL DEFAULT '#',
                `title` VARCHAR(2048) NOT NULL DEFAULT '#',
                `dir` VARCHAR(2048) NOT NULL DEFAULT 'img/default/slides',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );
        $this->db->query("TRUNCATE  cms_slider");
        $this->db->query("INSERT INTO cms_slider SET active='1'");

        // Create cms_slider_content ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS  `cms_slider_content` (
                `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `sn` INT(11) DEFAULT '1',
                `cms_slider_id` INT(11),
                `alias` VARCHAR(256) NOT NULL DEFAULT '#',
                `title` VARCHAR(2048) NOT NULL DEFAULT '#',
                `title2` VARCHAR(2048) NOT NULL DEFAULT '#',
                `title3` VARCHAR(2048) NOT NULL DEFAULT '#',
                `message` TEXT,
                `image_src` VARCHAR(2048) NOT NULL DEFAULT '#',
                `image_href` VARCHAR(2048) NOT NULL DEFAULT '#',
                `thumb_src` VARCHAR(2048) NOT NULL DEFAULT '#',
                `thumb_href` VARCHAR(2048) NOT NULL DEFAULT '#',
                `button` VARCHAR(2048) NOT NULL DEFAULT '#',
                `button_href` VARCHAR(2048) NOT NULL DEFAULT '#',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );


        // Create cms_gallery ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS `cms_gallery` (
                `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `sn` INT(11)  DEFAULT '1',
                `alias` VARCHAR(256) NOT NULL DEFAULT 'new',
                `gallery_name` VARCHAR(2048) NOT NULL DEFAULT 'New',
                `message` TEXT NULL,
                `dir` VARCHAR(2048) NOT NULL DEFAULT 'img/default/gallery',
                `page_template` VARCHAR(256) NULL DEFAULT 'base/gallery01',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';"
        );
        $this->db->query("TRUNCATE  cms_gallery");
        $this->db->query("INSERT INTO cms_gallery SET active='1'");


        // Create cms_gallery_images ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS  `cms_gallery_images` (
                `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
                `login_id` BIGINT(20) NOT NULL DEFAULT '1',
                `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                `active` TINYINT(1) NOT NULL DEFAULT '0',
                `sn` INT(11)  DEFAULT '1',
                `cms_gallery_id` INT(11) NULL DEFAULT NULL,
                `image_src` VARCHAR(2048) NOT NULL DEFAULT '#',
                `image_href` VARCHAR(2048) NOT NULL DEFAULT '#',
                `thumb_src` VARCHAR(2048) NOT NULL DEFAULT '#',
                `thumb_href` VARCHAR(2048) NOT NULL DEFAULT '#',
                `title` VARCHAR(2048) NOT NULL DEFAULT '#',
                `title2` VARCHAR(2048) NOT NULL DEFAULT '#',
                `title3` VARCHAR(2048) NOT NULL DEFAULT '#',
                `message` TEXT,
                `button` VARCHAR(2048) NOT NULL DEFAULT '#',
                `button_href` VARCHAR(2048) NOT NULL DEFAULT '#',
                PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';"
        );


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'added page_contact, cms_article, cms_highlights, cms_blog, cms_blog_note, cms_gallery, cms_gallery_images, cms_nav, cms_nav_url, cms_slider, cms_slider_content',
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

        $this->dbforge->drop_table('cms_page_contact');
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
        $this->dbforge->drop_table('cms_nav_site_urls');


        $this->db->query("DROP VIEW IF EXISTS `cms_nav_view`;");
    }
}

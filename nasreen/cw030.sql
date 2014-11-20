-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.40-0ubuntu0.14.04.1 - (Ubuntu)
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table theroyals.ci_sessions
DROP TABLE IF EXISTS `ci_sessions`;
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table theroyals.ci_sessions: ~0 rows (approximately)
DELETE FROM `ci_sessions`;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_article
DROP TABLE IF EXISTS `cms_article`;
CREATE TABLE IF NOT EXISTS `cms_article` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `alias` varchar(256) NOT NULL,
  `title` varchar(2048) DEFAULT 'Our cooking style is unique',
  `summary` text,
  `body` text,
  `banner_src` varchar(2048) DEFAULT '#',
  `banner_href` varchar(2048) DEFAULT '/takeaway/menu',
  `image_src` varchar(2048) DEFAULT '/img/default/articles/about_us.jpg',
  `image_href` varchar(2048) DEFAULT '/takeaway/menu',
  `button` varchar(2048) DEFAULT 'Order Online',
  `button_href` varchar(2048) DEFAULT '/takeaway/menu',
  `page_template` varchar(256) DEFAULT '#',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='### ';

-- Dumping data for table theroyals.cms_article: ~1 rows (approximately)
DELETE FROM `cms_article`;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
INSERT INTO `cms_article` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `title`, `summary`, `body`, `banner_src`, `banner_href`, `image_src`, `image_href`, `button`, `button_href`, `page_template`) VALUES
	(00000000001, 1, '2014-11-17 08:16:05', 1, 1, 'about_us', 'Our cooking style is unique', 'Our cooking style is unique and our chefs always make sure that your meal ... ', 'Our cooking style is unique and our chefs always make sure that your meal at Indian Ocean ... ', '#', '/takeaway/menu', '/img/defaultm/articles/about_us.jpg', '/takeaway/menu', 'Order Online', '/takeaway/menu', '#');
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_blog
DROP TABLE IF EXISTS `cms_blog`;
CREATE TABLE IF NOT EXISTS `cms_blog` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '1',
  `blog_name` varchar(256) NOT NULL DEFAULT 'New',
  `description` text,
  `image_src` varchar(2048) DEFAULT '#',
  `image_href` varchar(2048) DEFAULT '#',
  `thumb_src` varchar(2048) DEFAULT '#',
  `button` varchar(2048) DEFAULT '#',
  `button_href` varchar(2048) DEFAULT '#',
  `page_template` varchar(256) NOT NULL DEFAULT '#',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_blog: ~0 rows (approximately)
DELETE FROM `cms_blog`;
/*!40000 ALTER TABLE `cms_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blog` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_blog_note
DROP TABLE IF EXISTS `cms_blog_note`;
CREATE TABLE IF NOT EXISTS `cms_blog_note` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '1',
  `blog_id` int(11) DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_blog_note: ~0 rows (approximately)
DELETE FROM `cms_blog_note`;
/*!40000 ALTER TABLE `cms_blog_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blog_note` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_email_template
DROP TABLE IF EXISTS `cms_email_template`;
CREATE TABLE IF NOT EXISTS `cms_email_template` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `alias` varchar(256) NOT NULL,
  `body` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_email_template: ~0 rows (approximately)
DELETE FROM `cms_email_template`;
/*!40000 ALTER TABLE `cms_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_email_template` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_gallery
DROP TABLE IF EXISTS `cms_gallery`;
CREATE TABLE IF NOT EXISTS `cms_gallery` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '1',
  `alias` varchar(256) NOT NULL DEFAULT 'new',
  `gallery_name` varchar(2048) NOT NULL DEFAULT 'New',
  `message` text,
  `dir` varchar(2048) NOT NULL DEFAULT 'img/default/gallery',
  `page_template` varchar(256) DEFAULT 'base/gallery01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_gallery: ~1 rows (approximately)
DELETE FROM `cms_gallery`;
/*!40000 ALTER TABLE `cms_gallery` DISABLE KEYS */;
INSERT INTO `cms_gallery` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `gallery_name`, `message`, `dir`, `page_template`) VALUES
	(00000000001, 1, '2014-11-17 08:16:07', 1, 1, 'new', 'New', NULL, 'img/defaultm/gallery', 'base/gallery01');
/*!40000 ALTER TABLE `cms_gallery` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_gallery_images
DROP TABLE IF EXISTS `cms_gallery_images`;
CREATE TABLE IF NOT EXISTS `cms_gallery_images` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '1',
  `cms_gallery_id` int(11) DEFAULT NULL,
  `image_src` varchar(2048) NOT NULL DEFAULT '#',
  `image_href` varchar(2048) NOT NULL DEFAULT '#',
  `thumb_src` varchar(2048) NOT NULL DEFAULT '#',
  `thumb_href` varchar(2048) NOT NULL DEFAULT '#',
  `title` varchar(2048) NOT NULL DEFAULT '#',
  `title2` varchar(2048) NOT NULL DEFAULT '#',
  `title3` varchar(2048) NOT NULL DEFAULT '#',
  `message` text,
  `button` varchar(2048) NOT NULL DEFAULT '#',
  `button_href` varchar(2048) NOT NULL DEFAULT '#',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_gallery_images: ~0 rows (approximately)
DELETE FROM `cms_gallery_images`;
/*!40000 ALTER TABLE `cms_gallery_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_gallery_images` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_highlights
DROP TABLE IF EXISTS `cms_highlights`;
CREATE TABLE IF NOT EXISTS `cms_highlights` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` bigint(20) NOT NULL DEFAULT '1',
  `alias` varchar(256) NOT NULL DEFAULT 'welcome',
  `method` varchar(256) NOT NULL DEFAULT 'about/home',
  `module` varchar(256) NOT NULL DEFAULT 'special',
  `name` varchar(512) NOT NULL DEFAULT 'Special Offers !!',
  `title` varchar(2048) DEFAULT '#',
  `title2` varchar(2048) DEFAULT '#',
  `title3` varchar(2048) DEFAULT '#',
  `summary` text,
  `body` text,
  `image_src` varchar(2048) DEFAULT '/img/default/highlights/welcome01.png',
  `image_href` varchar(2048) DEFAULT '/takeaway/menu',
  `button` varchar(2048) DEFAULT 'Order Online',
  `button_href` varchar(2048) DEFAULT '/takeaway/menu',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table theroyals.cms_highlights: ~11 rows (approximately)
DELETE FROM `cms_highlights`;
/*!40000 ALTER TABLE `cms_highlights` DISABLE KEYS */;
INSERT INTO `cms_highlights` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `method`, `module`, `name`, `title`, `title2`, `title3`, `summary`, `body`, `image_src`, `image_href`, `button`, `button_href`) VALUES
	(00000000001, 1, '2014-11-17 08:16:05', 1, 1, 'welcome', 'about/home', 'special', 'Special Offers !!', 'Straight To Your Door', '#', '#', NULL, NULL, '/img/defaultm/highlights/welcome01.jpg', '/takeaway/menu', 'Order Online', '/takeaway/menu'),
	(00000000002, 1, '2014-11-17 08:16:05', 1, 1, 'welcome', 'about/home', 'special', 'Special Offers !!', 'Value For Money', '#', '#', NULL, NULL, '/img/defaultm/highlights/welcome02.jpg', '/takeaway/menu', 'Order Online', '/takeaway/menu'),
	(00000000003, 1, '2014-11-17 08:16:05', 1, 1, 'welcome', 'about/home', 'special', 'Special Offers !!', 'Special Offer', '#', '#', NULL, NULL, '/img/defaultm/highlights/welcome03.jpg', '/takeaway/menu', 'Order Online', '/takeaway/menu'),
	(00000000004, 1, '2014-11-17 08:16:05', 1, 1, 'welcome', 'about/home', 'special', 'Special Offers !!', 'Just Call Us', '#', '#', NULL, NULL, '/img/defaultm/highlights/welcome04.jpg', '/takeaway/menu', 'Order Online', '/takeaway/menu'),
	(00000000005, 1, '2014-11-17 08:16:05', 1, 1, 'welcome', 'about/home', 'mid_text', 'Special Offers !!', 'menu is meticulously designed to suit your needs.', '#', '#', NULL, NULL, '/img/default/highlights/welcome01.png', '/takeaway/menu', 'Order Online', '/takeaway/menu'),
	(00000000006, 1, '2014-11-17 08:16:05', 1, 1, 'welcome', 'about/main', 'our_restaurant', 'Special Offers !!', 'OUR RESTAURANT', '#', '#', NULL, 'Our dishes are freshly prepared in-house with our special \'Indian Ocean recipe\'&#44; which excludes all artificial colourings and preservatives. And all our dishes are served steaming hot into a special stay fresh packaging&#44; ready to collect or be delivered to your door step.<a href=\'about/us\'> Read More</a>', '/img/default/highlights/welcome01.png', '/takeaway/menu', 'Order Online', '/takeaway/menu'),
	(00000000007, 1, '2014-11-17 08:16:05', 1, 1, 'welcome', 'about/main', 'our_food', 'Special Offers !!', 'OUR FOOD', '#', '#', NULL, 'Eating out is more than just food. It is about atmosphere&#44; about ambience&#44; but above all taste!We have installed some of India&#39;s history&#44; culture and beliefs into creating the perfect authentic feel for you. If you want to create your own dish&#44; a little hotter&#44; a little creamier?  <a href=\'about/us\'> Read More</a>', '/img/default/highlights/welcome01.png', '/takeaway/menu', 'Order Online', '/takeaway/menu'),
	(00000000008, 1, '2014-11-17 08:16:06', 1, 1, 'welcome', 'about/main', 'top_banner', 'Special Offers !!', 'Delivered Straight To Your Door', '#', '#', NULL, NULL, '/img/default/highlights/welcome01.png', '/takeaway/menu', 'Order Online', '/takeaway/menu'),
	(00000000009, 1, '2014-11-17 08:16:06', 1, 1, 'us', 'about/us', 'side', 'Special Offers !!', 'Starter', '#', '#', NULL, NULL, '/img/defaultm/highlights/about_us_side01.png', '/takeaway/menu', 'Order Online', '/takeaway/menu'),
	(00000000010, 1, '2014-11-17 08:16:06', 1, 1, 'us', 'about/us', 'side', 'Special Offers !!', 'Main Dishes', '#', '#', NULL, NULL, '/img/defaultm/highlights/about_us_side02.png', '/takeaway/menu', 'Order Online', '/takeaway/menu'),
	(00000000011, 1, '2014-11-17 08:16:06', 1, 1, 'us', 'about/us', 'side', 'Special Offers !!', 'Side Orders', '#', '#', NULL, NULL, '/img/defaultm/highlights/about_us_side03.png', '/takeaway/menu', 'Order Online', '/takeaway/menu');
/*!40000 ALTER TABLE `cms_highlights` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_nav
DROP TABLE IF EXISTS `cms_nav`;
CREATE TABLE IF NOT EXISTS `cms_nav` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '1',
  `alias` varchar(256) DEFAULT 'new',
  `nav_name` varchar(512) NOT NULL DEFAULT 'HOME',
  `title` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_nav: ~4 rows (approximately)
DELETE FROM `cms_nav`;
/*!40000 ALTER TABLE `cms_nav` DISABLE KEYS */;
INSERT INTO `cms_nav` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `nav_name`, `title`) VALUES
	(00000000001, 1, '2014-09-16 14:17:34', 1, 1, 'menu_top', 'Menu Top', NULL),
	(00000000002, 1, '2014-09-16 14:17:14', 1, 1, 'about_top', 'About Top', NULL),
	(00000000003, 1, '2014-09-16 14:19:25', 1, 1, 'category_footer', 'Category Footer', NULL),
	(00000000004, 1, '2014-09-16 14:20:06', 1, 1, 'category_addon', 'Category Add On', NULL);
/*!40000 ALTER TABLE `cms_nav` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_nav_site_urls
DROP TABLE IF EXISTS `cms_nav_site_urls`;
CREATE TABLE IF NOT EXISTS `cms_nav_site_urls` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `href` varchar(2048) NOT NULL DEFAULT 'new',
  `title` varchar(2048) NOT NULL DEFAULT 'Official Site | $business->business_name',
  `description` varchar(2048) NOT NULL DEFAULT '$template->meta_description',
  `keyword` varchar(2048) NOT NULL DEFAULT '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town',
  `favicon` varchar(2048) NOT NULL DEFAULT 'img/struct/favicon.ico',
  `parent` int(1) NOT NULL DEFAULT '0' COMMENT 'For SiteMap.html',
  `sitemap_html_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'For SiteMap.html Show or not',
  `changefreq` varchar(32) NOT NULL DEFAULT 'weekly',
  `priority` varchar(32) NOT NULL DEFAULT '0.08',
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_nav_site_urls: ~11 rows (approximately)
DELETE FROM `cms_nav_site_urls`;
/*!40000 ALTER TABLE `cms_nav_site_urls` DISABLE KEYS */;
INSERT INTO `cms_nav_site_urls` (`id`, `login_id`, `updated`, `active`, `href`, `title`, `description`, `keyword`, `favicon`, `parent`, `sitemap_html_active`, `changefreq`, `priority`, `note`) VALUES
	(00000000001, 1, '2014-09-18 11:35:38', 1, '', 'Official Site | Welcome To $business->business_name', '$template->meta_description', '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL),
	(00000000002, 1, '2014-09-18 11:35:38', 1, 'index.php', 'Official Site | Welcome To $business->business_name', '$template->meta_description', '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL),
	(00000000003, 1, '2014-09-18 11:35:38', 1, 'about/home', 'Official Site | Welcome To $business->business_name', '$template->meta_description', '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL),
	(00000000004, 1, '2014-09-18 11:35:40', 1, 'takeaway/menu', '$category->title | Menu | $business->business_name', '$template->meta_description', '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL),
	(00000000005, 1, '2014-09-18 11:35:41', 1, 'about/us', 'About Us | $business->business_name', '$template->meta_description', '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL),
	(00000000006, 1, '2014-09-18 11:35:43', 1, 'about/gallery', 'Our Gallery | $business->business_name', '$template->meta_description', '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL),
	(00000000007, 1, '2014-09-18 11:35:44', 1, 'about/contact', 'Contact Us | $business->business_name', '$template->meta_description', '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL),
	(00000000008, 1, '2014-09-18 11:35:45', 1, 'about/specialoffers', 'Special Offers | $business->business_name', '$template->meta_description', '$template->meta_keywords Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL),
	(00000000009, 1, '2014-09-18 11:35:53', 1, 'takeaway/menu/2', '$category->title | Menu | $business->business_name', '$template->meta_description', '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL),
	(00000000010, 1, '2014-09-18 11:37:15', 1, 'takeaway/menu/3', '$category->title | Menu | $business->business_name', '$template->meta_description', '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL),
	(00000000011, 1, '2014-09-18 11:37:15', 1, 'takeaway/order_details', 'Order Details Input | $business->business_name', '$template->meta_description', '$template->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town', 'img/struct/favicon.ico', 0, 1, 'weekly', '0.08', NULL);
/*!40000 ALTER TABLE `cms_nav_site_urls` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_nav_url
DROP TABLE IF EXISTS `cms_nav_url`;
CREATE TABLE IF NOT EXISTS `cms_nav_url` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `nav_url_name` varchar(512) NOT NULL DEFAULT 'HOME',
  `sn` int(11) DEFAULT '1',
  `parent` int(11) NOT NULL DEFAULT '0',
  `cms_nav_id` int(11) NOT NULL DEFAULT '1',
  `href` varchar(1024) NOT NULL DEFAULT 'about/home',
  `image_src` text,
  `important` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_nav_url: ~24 rows (approximately)
DELETE FROM `cms_nav_url`;
/*!40000 ALTER TABLE `cms_nav_url` DISABLE KEYS */;
INSERT INTO `cms_nav_url` (`id`, `login_id`, `updated`, `active`, `nav_url_name`, `sn`, `parent`, `cms_nav_id`, `href`, `image_src`, `important`) VALUES
	(00000000001, 1, '2014-09-16 14:21:52', 1, 'Home', 1, 0, 1, 'about/home', NULL, 0),
	(00000000002, 1, '2014-09-16 14:23:42', 1, 'Menu', 2, 0, 1, 'takeaway/menu', NULL, 0),
	(00000000003, 1, '2014-09-16 14:50:17', 1, 'About', 3, 0, 1, 'about/us', NULL, 0),
	(00000000004, 1, '2014-09-16 14:50:17', 1, 'Gallery', 4, 0, 1, 'about/gallery', NULL, 0),
	(00000000005, 1, '2014-09-16 14:50:17', 1, 'Contact', 5, 0, 1, 'about/contact', NULL, 0),
	(00000000006, 1, '2014-09-16 14:50:17', 1, 'HOME', 1, 0, 2, 'about/home', NULL, 0),
	(00000000007, 1, '2014-09-16 14:50:17', 1, 'ABOUT', 2, 0, 2, 'about/us', NULL, 0),
	(00000000008, 1, '2014-09-16 14:50:17', 1, 'MENU', 3, 0, 2, 'takeaway/menu', NULL, 0),
	(00000000009, 1, '2014-09-16 14:50:17', 1, 'GALLERY', 4, 0, 2, 'about/gallery', NULL, 0),
	(00000000010, 1, '2014-09-16 14:50:17', 1, 'CONTACT', 5, 0, 2, 'about/contact', NULL, 0),
	(00000000011, 1, '2014-09-16 14:50:17', 1, 'Starter', 1, 0, 3, 'takeaway/menu/2', NULL, 0),
	(00000000012, 1, '2014-09-16 14:50:17', 1, 'Tandoori Dishes', 2, 0, 3, 'takeaway/menu/3', NULL, 0),
	(00000000013, 1, '2014-09-16 14:50:17', 1, 'Chef Specials', 3, 0, 3, 'takeaway/menu/2', NULL, 0),
	(00000000014, 1, '2014-09-16 14:50:17', 1, 'Classic Dishes', 4, 0, 3, 'takeaway/menu/2', NULL, 0),
	(00000000015, 1, '2014-09-16 14:50:17', 1, 'Side Orders', 5, 0, 3, 'takeaway/menu/2', NULL, 0),
	(00000000016, 1, '2014-09-16 14:50:17', 1, 'Sundries', 5, 0, 3, 'takeaway/menu/2', NULL, 0),
	(00000000017, 1, '2014-09-18 21:50:32', 1, 'Meal Deals', 1, 0, 4, 'takeaway/menu/2', NULL, 0),
	(00000000018, 1, '2014-09-16 14:50:17', 1, 'Meal Deals', 1, 1, 1, 'takeaway/menu/2', NULL, 0),
	(00000000019, 1, '2014-09-18 23:16:11', 1, 'Starter', 1, 8, 2, 'takeaway/menu/2', NULL, 0),
	(00000000020, 1, '2014-09-18 23:16:25', 1, 'Chef Special', 2, 8, 2, 'takeaway/menu/3', NULL, 0),
	(00000000021, 1, '2014-09-18 23:16:39', 1, 'Side Oders', 3, 8, 2, 'takeaway/menu/4', NULL, 0),
	(00000000022, 1, '2014-09-18 23:19:57', 1, 'Starter', 1, 2, 1, 'takeaway/menu/2', NULL, 0),
	(00000000023, 1, '2014-09-18 23:20:18', 1, 'Chef Special', 2, 2, 1, 'takeaway/menu/3', NULL, 0),
	(00000000024, 1, '2014-09-18 23:24:47', 1, 'Side Orders', 3, 2, 1, 'takeaway/menu/4', NULL, 0);
/*!40000 ALTER TABLE `cms_nav_url` ENABLE KEYS */;


-- Dumping structure for view theroyals.cms_nav_view
DROP VIEW IF EXISTS `cms_nav_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `cms_nav_view` (
	`cms_nav_id` INT(11) UNSIGNED ZEROFILL NULL,
	`cms_nav_active` TINYINT(1) NULL,
	`cms_nav_sn` INT(11) NULL,
	`alias` VARCHAR(256) NULL COLLATE 'latin1_swedish_ci',
	`nav_name` VARCHAR(512) NULL COLLATE 'latin1_swedish_ci',
	`title` VARCHAR(512) NULL COLLATE 'latin1_swedish_ci',
	`cms_nav_url_id` INT(11) UNSIGNED ZEROFILL NOT NULL,
	`cms_nav_url_active` TINYINT(1) NOT NULL,
	`cms_nav_url_sn` INT(11) NULL,
	`parent` INT(11) NOT NULL,
	`nav_url_name` VARCHAR(512) NOT NULL COLLATE 'latin1_swedish_ci',
	`href` VARCHAR(1024) NOT NULL COLLATE 'latin1_swedish_ci',
	`image_src` TEXT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for table theroyals.cms_page_contact
DROP TABLE IF EXISTS `cms_page_contact`;
CREATE TABLE IF NOT EXISTS `cms_page_contact` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `api` varchar(128) NOT NULL DEFAULT '#',
  `lat` varchar(32) NOT NULL DEFAULT '51.507351',
  `lng` varchar(32) NOT NULL DEFAULT '-0.127758',
  `marker_src` text,
  `marker_visible` tinyint(1) NOT NULL DEFAULT '1',
  `zoom` int(11) DEFAULT '16',
  `width` varchar(32) DEFAULT '100%',
  `height` varchar(32) DEFAULT '300px',
  `page_template` varchar(128) DEFAULT 'about/contact',
  `map_active` tinyint(1) NOT NULL DEFAULT '0',
  `form_active` tinyint(1) NOT NULL DEFAULT '0',
  `address` varchar(256) NOT NULL DEFAULT '#',
  `phone` varchar(256) NOT NULL DEFAULT '#',
  `cc_inquiry` varchar(1024) NOT NULL DEFAULT '#' COMMENT 'Email addresses comma seperated',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table theroyals.cms_page_contact: ~1 rows (approximately)
DELETE FROM `cms_page_contact`;
/*!40000 ALTER TABLE `cms_page_contact` DISABLE KEYS */;
INSERT INTO `cms_page_contact` (`id`, `login_id`, `updated`, `active`, `api`, `lat`, `lng`, `marker_src`, `marker_visible`, `zoom`, `width`, `height`, `page_template`, `map_active`, `form_active`, `address`, `phone`, `cc_inquiry`) VALUES
	(00000000001, 1, '2014-11-17 08:15:51', 0, '#', '51.507351', '-0.127758', '#', 1, 16, '100%', '300px', 'about/contact', 0, 0, '#', '#', '#');
/*!40000 ALTER TABLE `cms_page_contact` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_settings_business
DROP TABLE IF EXISTS `cms_settings_business`;
CREATE TABLE IF NOT EXISTS `cms_settings_business` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `business_code` varchar(256) NOT NULL DEFAULT 'New',
  `business_name` varchar(256) NOT NULL DEFAULT 'New',
  `logo` varchar(2048) NOT NULL DEFAULT '/img/default/logo/logo.png',
  `business_slogan` varchar(1024) NOT NULL DEFAULT 'Best food in town',
  `email_customer_service` varchar(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_operation` varchar(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_billing` varchar(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_order` varchar(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_order_support` varchar(256) DEFAULT 'orders@allinepos.co.uk',
  `phone1` varchar(256) NOT NULL DEFAULT '02031290000',
  `phone2` varchar(256) DEFAULT NULL,
  `phone3` varchar(256) DEFAULT NULL,
  `fax` varchar(256) DEFAULT NULL,
  `house_number` varchar(256) DEFAULT '13',
  `address1` varchar(256) DEFAULT 'Brighton Road',
  `address2` varchar(256) DEFAULT NULL,
  `town` varchar(256) DEFAULT 'Purley',
  `city` varchar(256) DEFAULT 'London',
  `county` varchar(256) DEFAULT 'London',
  `country` varchar(256) DEFAULT 'London',
  `postcode` varchar(256) NOT NULL DEFAULT 'GU22 5AA',
  `direction` text,
  `vat_no` varchar(256) DEFAULT 'New',
  `web_url` varchar(2048) DEFAULT 'http://al-aminrestaurant.co.uk',
  `use_ssl` tinyint(1) NOT NULL DEFAULT '0',
  `manager_fnames` varchar(256) DEFAULT 'Lalita',
  `manager_lname` varchar(256) DEFAULT 'Sahu',
  `manager_phone` varchar(32) DEFAULT '07900642131',
  `established` varchar(256) DEFAULT '1900',
  `pizza_supported` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_settings_business: ~1 rows (approximately)
DELETE FROM `cms_settings_business`;
/*!40000 ALTER TABLE `cms_settings_business` DISABLE KEYS */;
INSERT INTO `cms_settings_business` (`id`, `login_id`, `updated`, `active`, `business_code`, `business_name`, `logo`, `business_slogan`, `email_customer_service`, `email_operation`, `email_billing`, `email_order`, `email_order_support`, `phone1`, `phone2`, `phone3`, `fax`, `house_number`, `address1`, `address2`, `town`, `city`, `county`, `country`, `postcode`, `direction`, `vat_no`, `web_url`, `use_ssl`, `manager_fnames`, `manager_lname`, `manager_phone`, `established`, `pizza_supported`) VALUES
	(00000000001, 1, '2014-11-17 08:16:12', 0, 'New', 'Kush Restaurant', '/img/defaultm/logo/logo.png', 'Best food in town', 'orderstakeaway@gmail.com', 'orderstakeaway@gmail.com', 'orderstakeaway@gmail.com', 'orderstakeaway@gmail.com', 'orderstakeaway@gmail.com', '02031290000', NULL, NULL, NULL, '13', 'Brighton Road', NULL, 'Purley', 'London', 'London', 'London', 'GU22 5AA', NULL, 'New', 'http://al-aminrestaurant.co.uk', 0, 'Lalita', 'Sahu', '07900642131', '1900', 0);
/*!40000 ALTER TABLE `cms_settings_business` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_settings_email
DROP TABLE IF EXISTS `cms_settings_email`;
CREATE TABLE IF NOT EXISTS `cms_settings_email` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `email_from` varchar(256) NOT NULL DEFAULT 'system@takeawayguru.com',
  `smtp_user` varchar(256) NOT NULL DEFAULT 'system+takeawayguru.com',
  `smtp_password` varchar(256) NOT NULL DEFAULT 'system789@!',
  `smtp_host` varchar(256) NOT NULL DEFAULT '109.203.102.20',
  `smtp_port` varchar(256) NOT NULL DEFAULT '25',
  `protocol` varchar(256) NOT NULL DEFAULT 'SMTP',
  `mailtype` varchar(256) NOT NULL DEFAULT 'html',
  `send_from` varchar(256) NOT NULL DEFAULT '#',
  `tracking_email` varchar(256) DEFAULT 'orderstakeaway@gmail.com',
  `debug` tinyint(1) NOT NULL DEFAULT '0',
  `log_active` tinyint(1) NOT NULL DEFAULT '1',
  `log_file_name` varchar(256) DEFAULT 'email.log',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_settings_email: ~1 rows (approximately)
DELETE FROM `cms_settings_email`;
/*!40000 ALTER TABLE `cms_settings_email` DISABLE KEYS */;
INSERT INTO `cms_settings_email` (`id`, `login_id`, `updated`, `active`, `email_from`, `smtp_user`, `smtp_password`, `smtp_host`, `smtp_port`, `protocol`, `mailtype`, `send_from`, `tracking_email`, `debug`, `log_active`, `log_file_name`) VALUES
	(00000000001, 1, '2014-11-17 08:16:12', 1, 'system@takeawayguru.com', 'system+takeawayguru.com', 'system789@!', '109.203.102.20', '25', 'SMTP', 'html', '#', 'allinepostracker@gmail.com', 0, 1, 'email.log');
/*!40000 ALTER TABLE `cms_settings_email` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_settings_files
DROP TABLE IF EXISTS `cms_settings_files`;
CREATE TABLE IF NOT EXISTS `cms_settings_files` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `robots_txt` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Store here all static files';

-- Dumping data for table theroyals.cms_settings_files: ~1 rows (approximately)
DELETE FROM `cms_settings_files`;
/*!40000 ALTER TABLE `cms_settings_files` DISABLE KEYS */;
INSERT INTO `cms_settings_files` (`id`, `login_id`, `updated`, `active`, `robots_txt`) VALUES
	(00000000001, 1, '2014-11-17 08:16:12', 0, 'User-Agent: *\nDisallow: /applicaion\nDisallow: /cono\nDisallow: /includes\nDisallow: /printer\nDisallow: /system\nDisallow: /temp\nDisallow: v.txt\nAllow: index.php\nAllow: index2.php\nAllow: robots.txt\nAllow: sitemap.xml');
/*!40000 ALTER TABLE `cms_settings_files` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_settings_system
DROP TABLE IF EXISTS `cms_settings_system`;
CREATE TABLE IF NOT EXISTS `cms_settings_system` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `currency_code` varchar(32) DEFAULT '826',
  `currency_symbol` varchar(32) DEFAULT '&pound;',
  `time_zone` varchar(32) DEFAULT '0',
  `summer_time` varchar(32) DEFAULT 'BST',
  `site_live` tinyint(1) NOT NULL DEFAULT '0',
  `debug_global` tinyint(1) NOT NULL DEFAULT '1',
  `log_active_global` tinyint(1) NOT NULL DEFAULT '1',
  `sitemap_xml` tinyint(1) NOT NULL DEFAULT '1',
  `sitemap_html` tinyint(1) NOT NULL DEFAULT '1',
  `version_software` varchar(32) DEFAULT '060209',
  `version_database` varchar(32) DEFAULT '023',
  `delete_db` tinyint(1) NOT NULL DEFAULT '0',
  `psk` varchar(64) DEFAULT 'sy123stem@take45awaygfgdfgdfurudfgdfcom',
  `default_load` varchar(256) DEFAULT 'about/home',
  `default_load_login` varchar(256) DEFAULT 'about/home',
  `set_data_active` tinyint(1) NOT NULL DEFAULT '0',
  `set_data` varchar(256) DEFAULT 'thekitchens',
  `notify_email_eng` varchar(256) DEFAULT 'amzadfof@gmail.com',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_settings_system: ~1 rows (approximately)
DELETE FROM `cms_settings_system`;
/*!40000 ALTER TABLE `cms_settings_system` DISABLE KEYS */;
INSERT INTO `cms_settings_system` (`id`, `login_id`, `updated`, `active`, `currency_code`, `currency_symbol`, `time_zone`, `summer_time`, `site_live`, `debug_global`, `log_active_global`, `sitemap_xml`, `sitemap_html`, `version_software`, `version_database`, `delete_db`, `psk`, `default_load`, `default_load_login`, `set_data_active`, `set_data`, `notify_email_eng`) VALUES
	(00000000001, 1, '2014-11-17 08:15:50', 1, '826', '&pound;', '0', 'BST', 0, 1, 1, 1, 1, '060209', '023', 0, 'sy123stem@take45awaygfgdfgdfurudfgdfcom', 'about/home', 'about/home', 0, 'thekitchens', 'amzadfof@gmail.com');
/*!40000 ALTER TABLE `cms_settings_system` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_settings_template
DROP TABLE IF EXISTS `cms_settings_template`;
CREATE TABLE IF NOT EXISTS `cms_settings_template` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `template_id` varchar(256) NOT NULL DEFAULT 'defaultm',
  `template_deploy` tinyint(1) NOT NULL DEFAULT '0',
  `head_title` varchar(512) DEFAULT 'Official Site - Green Chilli Restaurant :: Finest Indian Cuisine',
  `meta_description` varchar(2048) NOT NULL DEFAULT 'If you looking for healthy freshly home made food, this is the right place for you. Please give us an opportunity to serve you your favourate meal.',
  `meta_keywords` varchar(2048) NOT NULL DEFAULT 'Indian Food, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food',
  `favicon` varchar(2048) DEFAULT 'http://conosurtek.co.uk/aj/images/conosurTek/favicon.ico',
  `head_others` text,
  `copy_right` varchar(512) DEFAULT 'All In ePOS',
  `copy_right_url` varchar(512) DEFAULT 'http://allinepos.co.uk',
  `maintenance_note` text,
  `img_copy_active` tinyint(1) NOT NULL DEFAULT '0',
  `img_delete_active` tinyint(1) NOT NULL DEFAULT '0',
  `img_copy_url` varchar(2048) DEFAULT 'http://allinepos.co.uk/clientsImg/',
  `img_copy_url_zip` varchar(2048) DEFAULT 'http://allinepos.co.uk/clientsImg/masterZip/defaultm.zip',
  `img_copy_url_master` varchar(2048) DEFAULT 'http://allinepos.co.uk/clientsImg/master/defaultm',
  `please_wait_img` varchar(2048) DEFAULT '/img/menu/struct/please_wait.gif',
  `main_page` varchar(256) DEFAULT 'main',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_settings_template: ~2 rows (approximately)
DELETE FROM `cms_settings_template`;
/*!40000 ALTER TABLE `cms_settings_template` DISABLE KEYS */;
INSERT INTO `cms_settings_template` (`id`, `login_id`, `updated`, `active`, `template_id`, `template_deploy`, `head_title`, `meta_description`, `meta_keywords`, `favicon`, `head_others`, `copy_right`, `copy_right_url`, `maintenance_note`, `img_copy_active`, `img_delete_active`, `img_copy_url`, `img_copy_url_zip`, `img_copy_url_master`, `please_wait_img`, `main_page`) VALUES
	(00000000001, 1, '2014-11-17 08:15:50', 0, 'defaultm', 0, 'Official Site - Green Chilli Restaurant :: Finest Indian Cuisine', 'If you looking for healthy freshly home made food, this is the right place for you. Please give us an opportunity to serve you your favourate meal.', 'Indian Food, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food', 'http://conosurtek.co.uk/aj/images/conosurTek/favicon.ico', NULL, 'All In ePOS', 'http://allinepos.co.uk', 'This Site Currently Down For Maintenance', 0, 0, 'http://allinepos.co.uk/clientsImg/', 'http://allinepos.co.uk/clientsImg/masterZip/defaultm.zip', 'http://allinepos.co.uk/clientsImg/master/defaultm', '/img/menu/struct/please_wait.gif', 'main'),
	(00000000002, 1, '2014-11-17 08:15:50', 0, 'menu', 0, 'Official Site - Green Chilli Restaurant :: Finest Indian Cuisine', 'If you looking for healthy freshly home made food, this is the right place for you. Please give us an opportunity to serve you your favourate meal.', 'Indian Food, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food', 'http://conosurtek.co.uk/aj/images/conosurTek/favicon.ico', NULL, 'All In ePOS', 'http://allinepos.co.uk', 'This Site Currently Down For Maintenance', 0, 0, 'http://allinepos.co.uk/clientsImg/', 'http://allinepos.co.uk/clientsImg/masterZip/menu.zip', 'http://allinepos.co.uk/clientsImg/master/menu', '/img/menu/struct/please_wait.gif', 'main');
/*!40000 ALTER TABLE `cms_settings_template` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_slider
DROP TABLE IF EXISTS `cms_slider`;
CREATE TABLE IF NOT EXISTS `cms_slider` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '1',
  `alias` varchar(256) DEFAULT NULL,
  `slider_name` varchar(2048) NOT NULL DEFAULT '#',
  `title` varchar(2048) NOT NULL DEFAULT '#',
  `dir` varchar(2048) NOT NULL DEFAULT 'img/default/slides',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_slider: ~1 rows (approximately)
DELETE FROM `cms_slider`;
/*!40000 ALTER TABLE `cms_slider` DISABLE KEYS */;
INSERT INTO `cms_slider` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `slider_name`, `title`, `dir`) VALUES
	(00000000001, 1, '2014-11-17 08:16:07', 1, 1, NULL, '#', '#', 'img/defaultm/slides');
/*!40000 ALTER TABLE `cms_slider` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_slider_content
DROP TABLE IF EXISTS `cms_slider_content`;
CREATE TABLE IF NOT EXISTS `cms_slider_content` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '1',
  `cms_slider_id` int(11) DEFAULT NULL,
  `alias` varchar(256) NOT NULL DEFAULT '#',
  `title` varchar(2048) NOT NULL DEFAULT '#',
  `title2` varchar(2048) NOT NULL DEFAULT '#',
  `title3` varchar(2048) NOT NULL DEFAULT '#',
  `message` text,
  `image_src` varchar(2048) NOT NULL DEFAULT '#',
  `image_href` varchar(2048) NOT NULL DEFAULT '#',
  `thumb_src` varchar(2048) NOT NULL DEFAULT '#',
  `thumb_href` varchar(2048) NOT NULL DEFAULT '#',
  `button` varchar(2048) NOT NULL DEFAULT '#',
  `button_href` varchar(2048) NOT NULL DEFAULT '#',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.cms_slider_content: ~0 rows (approximately)
DELETE FROM `cms_slider_content`;
/*!40000 ALTER TABLE `cms_slider_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_slider_content` ENABLE KEYS */;


-- Dumping structure for table theroyals.cms_tracker
DROP TABLE IF EXISTS `cms_tracker`;
CREATE TABLE IF NOT EXISTS `cms_tracker` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `site_id_tracker` int(11) NOT NULL DEFAULT '3',
  `tracker_domian` varchar(512) NOT NULL DEFAULT 'takeawayguru.com/tracker/',
  `site_domain` varchar(512) NOT NULL DEFAULT 'al-aminrestaurant.co.uk',
  `debug_mode` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.cms_tracker: ~1 rows (approximately)
DELETE FROM `cms_tracker`;
/*!40000 ALTER TABLE `cms_tracker` DISABLE KEYS */;
INSERT INTO `cms_tracker` (`id`, `login_id`, `updated`, `active`, `site_id_tracker`, `tracker_domian`, `site_domain`, `debug_mode`) VALUES
	(1, 1, '2014-11-17 08:15:50', 1, 3, 'takeawayguru.com/tracker/', 'al-aminrestaurant.co.uk', 1);
/*!40000 ALTER TABLE `cms_tracker` ENABLE KEYS */;


-- Dumping structure for table theroyals.cw_billing_config
DROP TABLE IF EXISTS `cw_billing_config`;
CREATE TABLE IF NOT EXISTS `cw_billing_config` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `allinepos_paypal_account` tinyint(1) NOT NULL DEFAULT '1',
  `allinepos_card_account` tinyint(1) NOT NULL DEFAULT '1',
  `cw_commision_takeaway` decimal(7,2) NOT NULL DEFAULT '10.50',
  `cw_commision_reservation` decimal(7,2) NOT NULL DEFAULT '1.50',
  `cw_transaction_fee` decimal(7,2) NOT NULL DEFAULT '10.50' COMMENT 'Added Commision if CW process Payment',
  `statement_date` int(5) NOT NULL DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='Delivery CHarges';

-- Dumping data for table theroyals.cw_billing_config: ~2 rows (approximately)
DELETE FROM `cw_billing_config`;
/*!40000 ALTER TABLE `cw_billing_config` DISABLE KEYS */;
INSERT INTO `cw_billing_config` (`id`, `login_id`, `updated`, `active`, `allinepos_paypal_account`, `allinepos_card_account`, `cw_commision_takeaway`, `cw_commision_reservation`, `cw_transaction_fee`, `statement_date`) VALUES
	(00000000001, 1, '2014-11-17 08:16:11', 1, 1, 1, 10.50, 1.50, 10.50, 5),
	(00000000002, 1, '2014-11-17 08:16:12', 1, 1, 1, 10.50, 1.50, 10.50, 5);
/*!40000 ALTER TABLE `cw_billing_config` ENABLE KEYS */;


-- Dumping structure for view theroyals.cw_billing_view
DROP VIEW IF EXISTS `cw_billing_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `cw_billing_view` (
	`requested_at` DATETIME NULL,
	`order_processed` BIGINT(21) NOT NULL,
	`order_cancelled` BIGINT(21) NOT NULL,
	`order_successful` BIGINT(21) NOT NULL,
	`order_processed_amount` DECIMAL(29,2) NULL,
	`order_cancelled_amount` DECIMAL(29,2) NULL,
	`order_successful_amount` DECIMAL(29,2) NULL,
	`cw_commision` DECIMAL(7,2) NULL,
	`cw_commision_amount` DECIMAL(40,8) NULL,
	`card_sales` DECIMAL(29,2) NULL,
	`paypal_sales` DECIMAL(29,2) NULL,
	`cash_sales` DECIMAL(29,2) NULL,
	`paypal_fee` DECIMAL(29,2) NULL,
	`paypal_commision` DECIMAL(29,2) NULL,
	`paypal_net_earning` DECIMAL(29,2) NULL,
	`total_fee_paid` DECIMAL(29,2) NULL
) ENGINE=MyISAM;


-- Dumping structure for procedure theroyals.dbAddCol
DROP PROCEDURE IF EXISTS `dbAddCol`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `dbAddCol`(
                    IN tableName tinytext,
                    IN fieldName tinytext,
                    IN fieldDef text
                )
BEGIN
                    IF dbExistsCol(tableName, fieldName) = 0 THEN
                        set @ddl=CONCAT('ALTER TABLE ',(SELECT DATABASE()),'.',tableName,
                        ' ADD COLUMN ',fieldName,' ',fieldDef);
                        prepare stmt from @ddl;
                        execute stmt;
                    END IF;
                END//
DELIMITER ;


-- Dumping structure for procedure theroyals.dbAddColAfter
DROP PROCEDURE IF EXISTS `dbAddColAfter`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `dbAddColAfter`(
                    IN tableName tinytext,
                    IN fieldName tinytext,
                    IN fieldDef text,
                    IN fieldAfterName tinytext
                )
BEGIN
                    IF dbExistsCol(tableName, fieldName) = 0 THEN
                    set @ddl=CONCAT('ALTER TABLE ',(SELECT DATABASE()),'.',tableName,
                    ' ADD COLUMN ',fieldName,' ',fieldDef, ' AFTER ', fieldAfterName );
                    prepare stmt from @ddl;
                    execute stmt;
                    END IF;
                END//
DELIMITER ;


-- Dumping structure for procedure theroyals.dbChangeCol
DROP PROCEDURE IF EXISTS `dbChangeCol`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `dbChangeCol`(
                    IN tableName tinytext,
                    IN fieldNameOld tinytext,
                    IN fieldNameNew tinytext,
                    IN fieldDef text
                )
BEGIN
                    # CALL  dbChangeCol('users', 'salt', 'salt', 'VARCHAR(40) NOT NULL DEFAULT 'abc123def' )
                    IF dbExistsCol(tableName, fieldNameOld) = 1 THEN
                        set @ddl=CONCAT('ALTER TABLE ',(SELECT DATABASE()),'.',tableName,
                        ' CHANGE ',fieldNameOld,' ',fieldNameNew,' ',fieldDef );
                        prepare stmt from @ddl;
                        execute stmt;
                    END IF;
                END//
DELIMITER ;


-- Dumping structure for function theroyals.dbExistsCol
DROP FUNCTION IF EXISTS `dbExistsCol`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `dbExistsCol`(ptable TEXT, pcolumn TEXT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
                DECLARE result bool;
                SELECT  COUNT(*) INTO result
                FROM
                    information_schema.columns
                WHERE
                    table_schema = (SELECT DATABASE()) and
                    table_name = ptable and
                    column_name = pcolumn;
                RETURN result;
                END//
DELIMITER ;


-- Dumping structure for function theroyals.dbExistsCons
DROP FUNCTION IF EXISTS `dbExistsCons`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `dbExistsCons`(ptable text, pconstraint text) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
                DECLARE result bool;
                SELECT  count(*) INTO  result
                FROM
                    information_schema.table_constraints
                WHERE
                    constraint_schema = (SELECT DATABASE()) and
                    table_schema = (SELECT DATABASE()) and
                    table_name = ptable and
                    constraint_name = pconstraint;
                RETURN result;
                END//
DELIMITER ;


-- Dumping structure for procedure theroyals.dbRmCol
DROP PROCEDURE IF EXISTS `dbRmCol`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `dbRmCol`(
                    IN tableName tinytext,
                    IN fieldName tinytext
                )
BEGIN
                IF dbExistsCol(tableName, fieldName) = 1 THEN
                    set @ddl=CONCAT('ALTER TABLE ',(SELECT DATABASE()),'.',tableName,
                    ' DROP COLUMN ',fieldName );
                    prepare stmt from @ddl;
                    execute stmt;
                END IF;
            END//
DELIMITER ;


-- Dumping structure for table theroyals.device_cwdp
DROP TABLE IF EXISTS `device_cwdp`;
CREATE TABLE IF NOT EXISTS `device_cwdp` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `psk` varchar(256) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' COMMENT 'Pre Shared Key',
  `notify_email_eng` varchar(256) DEFAULT '#',
  `notify_email_client` varchar(256) DEFAULT '#',
  `debug` tinyint(1) NOT NULL DEFAULT '0',
  `log_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_file_name` varchar(256) DEFAULT 'device_cwdp.log',
  `enforce_secure_connection` tinyint(1) NOT NULL DEFAULT '1',
  `show_menucode` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.device_cwdp: ~1 rows (approximately)
DELETE FROM `device_cwdp`;
/*!40000 ALTER TABLE `device_cwdp` DISABLE KEYS */;
INSERT INTO `device_cwdp` (`id`, `login_id`, `updated`, `active`, `psk`, `notify_email_eng`, `notify_email_client`, `debug`, `log_active`, `log_file_name`, `enforce_secure_connection`, `show_menucode`) VALUES
	(00000000001, 1, '2014-11-17 08:16:03', 0, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890', '#', '#', 0, 0, 'device_cwdp.log', 1, 0);
/*!40000 ALTER TABLE `device_cwdp` ENABLE KEYS */;


-- Dumping structure for table theroyals.device_cwhd
DROP TABLE IF EXISTS `device_cwhd`;
CREATE TABLE IF NOT EXISTS `device_cwhd` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `psk` varchar(256) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' COMMENT 'Pre Shared Key',
  `notify_email_eng` varchar(256) DEFAULT '#',
  `notify_email_client` varchar(256) DEFAULT '#',
  `debug` tinyint(1) NOT NULL DEFAULT '0',
  `log_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_file_name` varchar(256) DEFAULT 'device_cwhd.log',
  `enforce_secure_connection` tinyint(1) NOT NULL DEFAULT '1',
  `order_update_active` tinyint(1) NOT NULL DEFAULT '0',
  `order_update_url` varchar(1024) DEFAULT 'http://takeawayguru.com/order_support/new_order/',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.device_cwhd: ~1 rows (approximately)
DELETE FROM `device_cwhd`;
/*!40000 ALTER TABLE `device_cwhd` DISABLE KEYS */;
INSERT INTO `device_cwhd` (`id`, `login_id`, `updated`, `active`, `psk`, `notify_email_eng`, `notify_email_client`, `debug`, `log_active`, `log_file_name`, `enforce_secure_connection`, `order_update_active`, `order_update_url`) VALUES
	(00000000001, 1, '2014-11-17 08:16:03', 0, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890', '#', '#', 0, 0, 'device_cwhd.log', 1, 0, 'http://takeawayguru.com/order_support/new_order/');
/*!40000 ALTER TABLE `device_cwhd` ENABLE KEYS */;


-- Dumping structure for table theroyals.device_fax
DROP TABLE IF EXISTS `device_fax`;
CREATE TABLE IF NOT EXISTS `device_fax` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `psk` varchar(256) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' COMMENT 'Pre Shared Key',
  `notify_email_eng` varchar(256) DEFAULT '#',
  `notify_email_client` varchar(256) DEFAULT '#',
  `debug` tinyint(1) NOT NULL DEFAULT '0',
  `log_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_file_name` varchar(256) DEFAULT 'device_fax.log',
  `fax_number` varchar(128) DEFAULT '0',
  `domain_full` text COMMENT 'Full domain name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.device_fax: ~1 rows (approximately)
DELETE FROM `device_fax`;
/*!40000 ALTER TABLE `device_fax` DISABLE KEYS */;
INSERT INTO `device_fax` (`id`, `login_id`, `updated`, `active`, `psk`, `notify_email_eng`, `notify_email_client`, `debug`, `log_active`, `log_file_name`, `fax_number`, `domain_full`) VALUES
	(00000000001, 1, '2014-11-17 08:16:03', 0, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890', '#', '#', 0, 0, 'device_fax.log', '0', NULL);
/*!40000 ALTER TABLE `device_fax` ENABLE KEYS */;


-- Dumping structure for table theroyals.device_sms
DROP TABLE IF EXISTS `device_sms`;
CREATE TABLE IF NOT EXISTS `device_sms` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `psk` varchar(256) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' COMMENT 'Pre Shared Key',
  `notify_email_eng` varchar(256) DEFAULT '#',
  `notify_email_client` varchar(256) DEFAULT '#',
  `debug` tinyint(1) NOT NULL DEFAULT '0',
  `log_active` tinyint(1) NOT NULL DEFAULT '1',
  `log_file_name` varchar(256) DEFAULT 'device_sms.log',
  `gateway_url` varchar(1024) NOT NULL DEFAULT '213.104.214.8:9090',
  `gateway_password` varchar(1024) NOT NULL DEFAULT 'test123',
  `mobile_order_client` varchar(32) NOT NULL DEFAULT '#',
  `critical_mobile_client` varchar(32) NOT NULL DEFAULT '00447900642131',
  `order_alert_client` tinyint(1) NOT NULL DEFAULT '1',
  `order_alert_client_full` tinyint(1) NOT NULL DEFAULT '0',
  `order_confirm_customer` tinyint(1) NOT NULL DEFAULT '0',
  `order_accepted_customer` tinyint(1) NOT NULL DEFAULT '0',
  `order_ready_customer` tinyint(1) NOT NULL DEFAULT '0',
  `order_nearby_customer` tinyint(1) NOT NULL DEFAULT '0',
  `booking_confirmed_customer` tinyint(1) NOT NULL DEFAULT '0',
  `order_notification_client` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.device_sms: ~1 rows (approximately)
DELETE FROM `device_sms`;
/*!40000 ALTER TABLE `device_sms` DISABLE KEYS */;
INSERT INTO `device_sms` (`id`, `login_id`, `updated`, `active`, `psk`, `notify_email_eng`, `notify_email_client`, `debug`, `log_active`, `log_file_name`, `gateway_url`, `gateway_password`, `mobile_order_client`, `critical_mobile_client`, `order_alert_client`, `order_alert_client_full`, `order_confirm_customer`, `order_accepted_customer`, `order_ready_customer`, `order_nearby_customer`, `booking_confirmed_customer`, `order_notification_client`) VALUES
	(00000000001, 1, '2014-11-17 08:16:03', 1, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890', '#', '#', 0, 1, 'device_sms.log', '213.104.214.8:9090', 'test123', '#', '00447900642131', 1, 0, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `device_sms` ENABLE KEYS */;


-- Dumping structure for table theroyals.device_smsprinter
DROP TABLE IF EXISTS `device_smsprinter`;
CREATE TABLE IF NOT EXISTS `device_smsprinter` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `psk` varchar(256) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' COMMENT 'Pre Shared Key',
  `notify_email_eng` varchar(256) DEFAULT '#',
  `notify_email_client` varchar(256) DEFAULT '#',
  `debug` tinyint(1) NOT NULL DEFAULT '0',
  `log_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_file_name` varchar(256) DEFAULT 'device_sms.log',
  `mobile_number` varchar(15) DEFAULT '07900642131',
  `iemi` varchar(64) DEFAULT 'NO_IEMI',
  `send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `printer_txt` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.device_smsprinter: ~1 rows (approximately)
DELETE FROM `device_smsprinter`;
/*!40000 ALTER TABLE `device_smsprinter` DISABLE KEYS */;
INSERT INTO `device_smsprinter` (`id`, `login_id`, `updated`, `active`, `psk`, `notify_email_eng`, `notify_email_client`, `debug`, `log_active`, `log_file_name`, `mobile_number`, `iemi`, `send_sms`, `printer_txt`) VALUES
	(00000000001, 1, '2014-11-17 08:16:04', 0, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890', '#', '#', 0, 0, 'device_sms.log', '07900642131', 'NO_IEMI', 0, 0);
/*!40000 ALTER TABLE `device_smsprinter` ENABLE KEYS */;


-- Dumping structure for function theroyals.GetFirstDayOfMonth
DROP FUNCTION IF EXISTS `GetFirstDayOfMonth`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `GetFirstDayOfMonth`(`date` datetime) RETURNS datetime
BEGIN
              RETURN DATE_ADD(DATE_ADD(LAST_DAY(`date`), INTERVAL - 1 MONTH), INTERVAL 1 DAY);
            END//
DELIMITER ;


-- Dumping structure for function theroyals.GetUnID
DROP FUNCTION IF EXISTS `GetUnID`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `GetUnID`(`oldId` VARCHAR(10) ) RETURNS varchar(10) 
BEGIN
    DECLARE charOldValue char(7);
    DECLARE iNumValue INT;
    DECLARE iCharValue char(3);
    DECLARE ch1stLetter char(1);
    DECLARE ch2ndLetter char(1);
    DECLARE ch3rdLetter char(1);


    Set iNumValue = CAST( SUBSTRING(oldId, 4, 4) AS SIGNED );
    Set iCharValue =  SUBSTRING(oldId, 1, 3);
    Set charOldValue = oldId ;

    SET iNumValue = iNumValue + 1;
    IF iNumValue > 9999 Then

      Set iNumValue = 0 ;
      Set ch1stLetter = SUBSTRING(iCharValue, 3, 1);
      Set ch2ndLetter = SUBSTRING(iCharValue, 2, 1);
      Set ch3rdLetter = SUBSTRING(iCharValue, 1, 1);

      IF ch1stLetter = 'Z' Then
        Set ch1stLetter = 'A';
        IF ch2ndLetter = 'Z' Then
          Set ch2ndLetter = 'A';
          Set ch3rdLetter = CHAR(ASCII(ch3rdLetter) + 1);
        ELSE Set ch2ndLetter = CHAR(ASCII(ch2ndLetter) + 1);
        END IF;
      ELSE Set ch1stLetter = CHAR(ASCII(ch1stLetter) + 1);
      END If;

      Set iCharValue = CONCAT(ch3rdLetter , ch2ndLetter, ch1stLetter);
    END IF;

    SET @ret = CONCAT (iCharValue , Right( CONCAT ('0000' , CAST(iNumValue AS char(4))),4) );
    RETURN @ret;

  END//
DELIMITER ;


-- Dumping structure for table theroyals.groups
DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.groups: ~5 rows (approximately)
DELETE FROM `groups`;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` (`id`, `name`, `description`) VALUES
	(1, 'admin', 'Administrator'),
	(2, 'members', 'General User'),
	(3, 'helpdesk', 'Help Desk'),
	(4, 'manager', 'General Manager'),
	(5, 'asstmanager', 'Assistant Manager');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;


-- Dumping structure for table theroyals.login_attempts
DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.login_attempts: ~0 rows (approximately)
DELETE FROM `login_attempts`;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;


-- Dumping structure for table theroyals.logs
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `errno` int(2) NOT NULL,
  `errtype` varchar(32) NOT NULL,
  `errstr` text NOT NULL,
  `errfile` varchar(255) NOT NULL,
  `errline` int(4) NOT NULL,
  `user_agent` varchar(120) NOT NULL,
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`,`ip_address`,`user_agent`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.logs: ~0 rows (approximately)
DELETE FROM `logs`;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Dumping structure for table theroyals.map_latlng
DROP TABLE IF EXISTS `map_latlng`;
CREATE TABLE IF NOT EXISTS `map_latlng` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `search_key` varchar(32) NOT NULL COMMENT 'eg. GU21 5ED, south end, Cherry Tree Walk',
  `search_key_nospace` varchar(32) NOT NULL COMMENT 'eg. GU215ED, SOUTHEND, CHERRYTREEWALK',
  `lat` varchar(32) NOT NULL DEFAULT '0',
  `lng` varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.map_latlng: ~0 rows (approximately)
DELETE FROM `map_latlng`;
/*!40000 ALTER TABLE `map_latlng` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_latlng` ENABLE KEYS */;


-- Dumping structure for table theroyals.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.migrations: ~1 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`version`) VALUES
	(30);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table theroyals.migrations_db_versions
DROP TABLE IF EXISTS `migrations_db_versions`;
CREATE TABLE IF NOT EXISTS `migrations_db_versions` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `version_no` bigint(20) NOT NULL DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT '2014-11-17 08:15:45',
  `release_note_eng` text,
  `release_note_adm` text,
  `migration_by` varchar(512) NOT NULL,
  `migration_ip` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.migrations_db_versions: ~30 rows (approximately)
DELETE FROM `migrations_db_versions`;
/*!40000 ALTER TABLE `migrations_db_versions` DISABLE KEYS */;
INSERT INTO `migrations_db_versions` (`id`, `login_id`, `updated`, `active`, `version_no`, `date_created`, `release_note_eng`, `release_note_adm`, `migration_by`, `migration_ip`) VALUES
	(00000000001, 1, '2014-11-17 08:15:47', 0, 1, '2014-08-25 14:31:06', 'added __sample_db_table, migrations_db_versions,  migrations.note', 'First Release', '0', '127.0.0.1'),
	(00000000002, 1, '2014-11-17 08:15:47', 0, 2, '2014-08-25 14:31:06', 'added ci_sessions', 'First Release', '0', '127.0.0.1'),
	(00000000003, 1, '2014-11-17 08:15:47', 0, 3, '2014-08-25 14:31:06', 'ADDED FUNCTION:: GetUnID', 'First Release', '0', '127.0.0.1'),
	(00000000004, 1, '2014-11-17 08:15:47', 0, 4, '2014-09-01 16:33:06', 'ADDED FUNCTION:: AddColumnUnlessExists', 'Made migration more powerfull', '0', '127.0.0.1'),
	(00000000005, 1, '2014-11-17 08:15:48', 0, 5, '2014-08-25 14:31:06', 'ADDED TABLE users, groups, users_groups, login_attempts; DEFAULT DATA: There is error with default data I have fixed on add_users.php.', 'First Release', '0', '127.0.0.1'),
	(00000000006, 1, '2014-11-17 08:15:50', 0, 6, '2014-08-25 14:31:06', 'ADDED TABLE: user_address; FIXED: Ion_auth data', 'First Release', '0', '127.0.0.1'),
	(00000000007, 1, '2014-11-17 08:15:50', 0, 7, '2014-08-25 14:31:06', 'ADDED TABLE:: cms_tracker', 'First Release', '0', '127.0.0.1'),
	(00000000008, 1, '2014-11-17 08:15:51', 0, 8, '2014-08-25 14:31:06', 'ADDED TABLE:: cms_settings_business, cms_settings_email, cms_email_template, cms_settings_system', 'First Release', '0', '127.0.0.1'),
	(00000000009, 1, '2014-11-17 08:15:51', 0, 9, '2014-08-25 14:31:06', 'ADDED TABLE:: services_opening_hours', 'First Release', '0', '127.0.0.1'),
	(00000000010, 1, '2014-11-17 08:15:54', 0, 10, '2014-08-25 14:31:06', 'added page_contact, cms_article, cms_highlights, cms_blog, cms_blog_note, cms_gallery, cms_gallery_images, cms_nav, cms_nav_url, cms_slider, cms_slider_content', 'First Release', '0', '127.0.0.1'),
	(00000000011, 1, '2014-11-17 08:15:59', 0, 11, '2014-08-25 14:31:06', 'ADDED TABLE::  social_google, social_facebook, social_youtube, social_takeawayguru, social_tripadvisor, social_href', 'First Release', '0', '127.0.0.1'),
	(00000000012, 1, '2014-11-17 08:15:59', 0, 12, '2014-08-25 14:31:06', 'ADDED TABLE:: logs', 'First Release', '0', '127.0.0.1'),
	(00000000013, 1, '2014-11-17 08:16:01', 0, 13, '2014-08-25 14:31:06', 'ADDED TABLE:: prod_list, prod_category, prod_meats, prod_meat_price, prod_options, prod_options_price; ADDED VIEW:: prod_meat_view ', 'First Release', '0', '127.0.0.1'),
	(00000000014, 1, '2014-11-17 08:16:02', 0, 14, '2014-08-25 14:31:06', 'ADDED TABLE:: orders, orders_cwdp, trg_order', 'First Release', '0', '127.0.0.1'),
	(00000000015, 1, '2014-11-17 08:16:02', 0, 15, '2014-08-25 14:31:06', 'ADDED TABLE:: services_collection, services_delivery, services_sit_in, services_reservations, services_reservations_confirms', 'First Release', '0', '127.0.0.1'),
	(00000000016, 1, '2014-11-17 08:16:03', 0, 16, '2014-08-25 14:31:06', 'ADDED TABLE:: offers, offer_time_validity', 'First Release', '0', '127.0.0.1'),
	(00000000017, 1, '2014-11-17 08:16:04', 0, 17, '2014-08-25 14:31:06', 'ADDED TABLE:: device_cwdp, device_cwhd, device_fax, device_sms, device_smsprinter', 'First Release', '0', '127.0.0.1'),
	(00000000018, 1, '2014-11-17 08:16:04', 0, 18, '2014-08-25 14:31:06', 'ADDED TABLE:: pay_paypal', 'First Release', '0', '127.0.0.1'),
	(00000000019, 1, '2014-11-17 08:16:04', 0, 19, '2014-08-25 14:31:06', 'ADDED TABLE:: pay_card', 'First Release', '0', '127.0.0.1'),
	(00000000020, 1, '2014-11-17 08:16:04', 0, 20, '2014-08-25 14:31:06', 'ADDED TABLE:: pay_cash', 'First Release', '0', '127.0.0.1'),
	(00000000021, 1, '2014-11-17 08:16:05', 0, 21, '2014-08-25 14:31:06', 'ADDED TABLE:: map_latlng', 'First Release', '0', '127.0.0.1'),
	(00000000022, 1, '2014-11-17 08:16:05', 0, 22, '2014-08-25 14:31:06', 'ADDED FUNCTION:: GetFirstDayOfMonth', 'Test Functionss', '0', '127.0.0.1'),
	(00000000023, 1, '2014-11-17 08:16:07', 0, 23, '2014-09-01 16:33:06', 'ADDED FUNCTION:: extraColum', 'Made migration more powerfull', '0', '127.0.0.1'),
	(00000000024, 1, '2014-11-17 08:16:07', 0, 24, '2014-12-11 16:33:06', 'ADDED FUNCTION:: dbExistsCol, dbExistsCons, dbRmCol, dbAddCol, dbChangeCol, dbAddColAfter; Removed AddColumnUnlessExists  ', 'Made migration more powerfull', '0', '127.0.0.1'),
	(00000000025, 1, '2014-11-17 08:16:08', 0, 25, '2014-12-12 16:33:06', 'ADDED FUNCTION:: user_create_fun, user_get_code_fun, user_gruops_fun, users_view, users.title', 'Made migration more powerfull', '0', '127.0.0.1'),
	(00000000026, 1, '2014-11-17 08:16:12', 0, 26, '2014-12-12 16:33:06', 'ADDED TABLE ::cw_billing_config, ; ADDED COL:: orders_config.can_cancel_order,  orders_config.cc_orders,  orders_config.default_order_status,\n                           orders_config.closing_massage_order_placed,  orders_received.note, orders.reward_amount, orders.gift_card_amount  ', 'Made migration more powerfull', '0', '127.0.0.1'),
	(00000000027, 1, '2014-11-17 08:16:12', 0, 27, '2014-12-12 16:33:06', 'ADDED FUNCTION:: cms_settings_files, UPDATED :: cms_settings_email.tracking_email, cms_settings_business.email_order_support ', 'Made migration more powerfull', '0', '127.0.0.1'),
	(00000000028, 1, '2014-11-17 08:16:14', 0, 28, '2014-12-12 16:33:06', 'ADDED FUNCTION:: dbExistsCol, dbExistsCons, dbRmCol, dbAddCol, dbChangeCol, dbAddColAfter; Removed AddColumnUnlessExists  ', 'Made migration more powerfull', '0', '127.0.0.1'),
	(00000000029, 1, '2014-11-17 08:16:14', 0, 29, '2014-12-12 16:33:06', 'UPDATED VALUE for API ', 'Change to paypal@allinepos.co.uk API', '0', '127.0.0.1'),
	(00000000030, 1, '2014-11-17 08:16:15', 0, 30, '2014-12-12 16:33:06', 'ADDED FUNCTION:: dbExistsCol, dbExistsCons, dbRmCol, dbAddCol, dbChangeCol, dbAddColAfter; Removed AddColumnUnlessExists  ', 'Made migration more powerfull', '0', '127.0.0.1');
/*!40000 ALTER TABLE `migrations_db_versions` ENABLE KEYS */;


-- Dumping structure for table theroyals.offers
DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '1',
  `offer_code` varchar(128) NOT NULL,
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `summary` varchar(2048) NOT NULL DEFAULT 'New',
  `start_date` datetime NOT NULL DEFAULT '2014-10-01 06:46:49',
  `end_date` datetime NOT NULL DEFAULT '2015-10-01 06:46:49',
  `product_include` varchar(2048) NOT NULL DEFAULT '#' COMMENT '#=All Product Included, enter id comma seperated. Will apply to those troduct only',
  `product_exclude` varchar(2048) NOT NULL DEFAULT '#' COMMENT '#=All Product Included, enter id comma seperated. eg. 50,51,52,55',
  `product_exclude_meal_deal` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Exclude Meal Deal from this offer.',
  `offers_page_show` tinyint(1) NOT NULL DEFAULT '1',
  `offers_page_description` text,
  `offers_page_terms` text,
  `offers_page_button` varchar(1024) DEFAULT 'Order Now',
  `offers_page_button_href` varchar(256) DEFAULT 'takeaway/menu/3',
  `email_template` text,
  `admin_message` text,
  `min_value` float(7,2) DEFAULT '10.00',
  `cw_discount_percentage` float(7,2) DEFAULT '0.00',
  `store_discount_percentage` float(7,2) DEFAULT '0.00',
  `cw_discount_amount` float(7,2) DEFAULT '0.00',
  `store_discount_amount` float(7,2) DEFAULT '0.00',
  `receiving` varchar(32) DEFAULT 'collection_delivery',
  `code_require` tinyint(1) NOT NULL DEFAULT '1',
  `maximum_use` tinyint(3) NOT NULL DEFAULT '-2' COMMENT '-2, for unlimited',
  `time_check` tinyint(1) NOT NULL DEFAULT '1',
  `apply_loyalty_points` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `offer_code` (`offer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.offers: ~1 rows (approximately)
DELETE FROM `offers`;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` (`id`, `login_id`, `updated`, `active`, `sn`, `offer_code`, `title`, `summary`, `start_date`, `end_date`, `product_include`, `product_exclude`, `product_exclude_meal_deal`, `offers_page_show`, `offers_page_description`, `offers_page_terms`, `offers_page_button`, `offers_page_button_href`, `email_template`, `admin_message`, `min_value`, `cw_discount_percentage`, `store_discount_percentage`, `cw_discount_amount`, `store_discount_amount`, `receiving`, `code_require`, `maximum_use`, `time_check`, `apply_loyalty_points`) VALUES
	(00000000001, 1, '2014-11-17 08:16:02', 0, 1, 'ALLINEPOS', 'New', 'New', '2014-11-17 08:16:02', '2014-12-17 08:16:02', '#', '#', 0, 1, NULL, NULL, 'Order Now', 'takeaway/menu/3', NULL, NULL, 10.00, 0.00, 0.00, 0.00, 0.00, 'collection_delivery', 1, -2, 1, 1);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;


-- Dumping structure for table theroyals.offer_time_validity
DROP TABLE IF EXISTS `offer_time_validity`;
CREATE TABLE IF NOT EXISTS `offer_time_validity` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '1',
  `offer_id` int(11) DEFAULT '-2',
  `day` varchar(16) DEFAULT 'Mon',
  `from_` varchar(5) NOT NULL DEFAULT '17:30',
  `to_` varchar(5) NOT NULL DEFAULT '23:59',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.offer_time_validity: ~7 rows (approximately)
DELETE FROM `offer_time_validity`;
/*!40000 ALTER TABLE `offer_time_validity` DISABLE KEYS */;
INSERT INTO `offer_time_validity` (`id`, `login_id`, `updated`, `active`, `sn`, `offer_id`, `day`, `from_`, `to_`) VALUES
	(00000000001, 1, '2014-11-17 08:16:03', 1, 1, 1, 'Mon', '17:30', '23:59'),
	(00000000002, 1, '2014-11-17 08:16:03', 2, 1, 1, 'Tue', '17:30', '23:59'),
	(00000000003, 1, '2014-11-17 08:16:03', 3, 1, 1, 'Wed', '17:30', '23:59'),
	(00000000004, 1, '2014-11-17 08:16:03', 4, 1, 1, 'Thu', '17:30', '23:59'),
	(00000000005, 1, '2014-11-17 08:16:03', 5, 1, 1, 'Fri', '17:30', '23:59'),
	(00000000006, 1, '2014-11-17 08:16:03', 6, 1, 1, 'Sat', '17:30', '23:59'),
	(00000000007, 1, '2014-11-17 08:16:03', 7, 1, 1, 'Sun', '17:30', '23:59');
/*!40000 ALTER TABLE `offer_time_validity` ENABLE KEYS */;


-- Dumping structure for table theroyals.orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `order_code` varchar(7) NOT NULL DEFAULT 'AAA1786',
  `order_id_temp` varchar(32) NOT NULL DEFAULT 'AAA0000',
  `user_code` varchar(7) NOT NULL DEFAULT 'AAA0000',
  `fname` varchar(128) DEFAULT NULL,
  `lname` varchar(128) DEFAULT NULL,
  `email` text,
  `phone` varchar(16) DEFAULT NULL,
  `house` varchar(16) DEFAULT NULL,
  `address1` varchar(256) DEFAULT NULL,
  `address2` varchar(256) DEFAULT NULL,
  `town` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `county` varchar(256) DEFAULT NULL,
  `postcode` varchar(256) DEFAULT NULL,
  `address_direction` text,
  `placed_at` datetime DEFAULT NULL,
  `requested_at` datetime DEFAULT NULL,
  `requested_time` bigint(20) NOT NULL,
  `receiving` varchar(10) NOT NULL DEFAULT 'delivery',
  `discount_code` varchar(128) DEFAULT NULL,
  `pay_method` varchar(128) DEFAULT NULL,
  `pay_status` varchar(128) DEFAULT NULL,
  `items` text,
  `note` text,
  `bag_total` decimal(7,2) DEFAULT '0.00',
  `delivery_charge` decimal(7,2) DEFAULT '0.00',
  `transaction_fee` decimal(7,2) DEFAULT '0.00',
  `base_payable` decimal(7,2) DEFAULT '0.00',
  `vat_value` decimal(7,2) DEFAULT '0.00',
  `discount_price` decimal(7,2) DEFAULT '0.00',
  `checkout_price` decimal(7,2) DEFAULT '0.00',
  `club_point` int(5) DEFAULT NULL,
  `offer` text,
  `transaction_info` text,
  `vip` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'If Customer Loged in',
  `customer_group` varchar(64) NOT NULL DEFAULT 'A' COMMENT 'Which Group This Customer Belongs To',
  `ip_address` varchar(64) DEFAULT NULL,
  `reward_amount` decimal(7,2) DEFAULT NULL,
  `gift_card_amount` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `order_code` (`order_code`),
  UNIQUE KEY `order_id_temp` (`order_id_temp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.orders: ~0 rows (approximately)
DELETE FROM `orders`;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;


-- Dumping structure for table theroyals.orders_config
DROP TABLE IF EXISTS `orders_config`;
CREATE TABLE IF NOT EXISTS `orders_config` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `group_interval` decimal(7,2) DEFAULT '5.00',
  `order_avg` decimal(7,2) DEFAULT '5.00',
  `order_avg_monthly` decimal(7,2) DEFAULT '5.00',
  `guest_can_order` tinyint(1) NOT NULL DEFAULT '1',
  `require_valid_email` tinyint(1) NOT NULL DEFAULT '1',
  `validate_postcode_before_order` tinyint(1) NOT NULL DEFAULT '0',
  `can_view_order_history` tinyint(1) NOT NULL DEFAULT '0',
  `cc_client_email_to_billing` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Orders CC Clents email to billing email',
  `cc_client_email_to_operation` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Orders CC Clents email to billing email',
  `manager_view_orders` tinyint(1) NOT NULL DEFAULT '0',
  `manager_view_hours` tinyint(1) NOT NULL DEFAULT '0',
  `manager_view_statement` tinyint(1) NOT NULL DEFAULT '0',
  `manager_view_customer_details` tinyint(1) NOT NULL DEFAULT '0',
  `headwaiter_view_orders` tinyint(1) NOT NULL DEFAULT '0',
  `headwaiter_cancel_orders` tinyint(1) NOT NULL DEFAULT '0',
  `headwaiter_view_hours` tinyint(1) NOT NULL DEFAULT '0',
  `headwaiter_view_statement` tinyint(1) NOT NULL DEFAULT '0',
  `headwaiter_view_customer_details` tinyint(1) NOT NULL DEFAULT '0',
  `can_cancel_order` tinyint(1) NOT NULL DEFAULT '0',
  `cc_orders` varchar(2048) NOT NULL DEFAULT '#' COMMENT 'Email addresses comma seperated',
  `default_order_status` varchar(1024) NOT NULL DEFAULT 'processing',
  `allow_guest_checkout` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'If Guest Can Checkout',
  `closing_massage_order_placed` varchar(2048) NOT NULL DEFAULT 'This is not an order confirmation. We will confirm your order with in next 15 min',
  `send_sms_status_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'If client Can Send SMS',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.orders_config: ~1 rows (approximately)
DELETE FROM `orders_config`;
/*!40000 ALTER TABLE `orders_config` DISABLE KEYS */;
INSERT INTO `orders_config` (`id`, `login_id`, `updated`, `active`, `group_interval`, `order_avg`, `order_avg_monthly`, `guest_can_order`, `require_valid_email`, `validate_postcode_before_order`, `can_view_order_history`, `cc_client_email_to_billing`, `cc_client_email_to_operation`, `manager_view_orders`, `manager_view_hours`, `manager_view_statement`, `manager_view_customer_details`, `headwaiter_view_orders`, `headwaiter_cancel_orders`, `headwaiter_view_hours`, `headwaiter_view_statement`, `headwaiter_view_customer_details`, `can_cancel_order`, `cc_orders`, `default_order_status`, `allow_guest_checkout`, `closing_massage_order_placed`, `send_sms_status_active`) VALUES
	(00000000001, 1, '2014-11-17 08:16:01', 1, 5.00, 5.00, 5.00, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '#', 'processing', 1, 'This is not an order confirmation. We will confirm your order with in next 15 min', 0);
/*!40000 ALTER TABLE `orders_config` ENABLE KEYS */;


-- Dumping structure for table theroyals.orders_note
DROP TABLE IF EXISTS `orders_note`;
CREATE TABLE IF NOT EXISTS `orders_note` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `order_code` varchar(7) NOT NULL,
  `status` varchar(32) NOT NULL DEFAULT 'processing',
  `note` text,
  `user_code` varchar(7) NOT NULL DEFAULT 'AAA1777' COMMENT 'System user',
  `customer_can_view` tinyint(1) NOT NULL DEFAULT '0',
  `send_email` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'If customer notified',
  `send_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'If customer notified',
  `response_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'If customer needs to response',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.orders_note: ~0 rows (approximately)
DELETE FROM `orders_note`;
/*!40000 ALTER TABLE `orders_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_note` ENABLE KEYS */;


-- Dumping structure for view theroyals.orders_note_view
DROP VIEW IF EXISTS `orders_note_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `orders_note_view` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL,
	`login_id` BIGINT(20) NOT NULL,
	`updated` TIMESTAMP NOT NULL,
	`active` TINYINT(1) NOT NULL,
	`order_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`status` VARCHAR(32) NOT NULL COLLATE 'latin1_swedish_ci',
	`note` TEXT NULL COLLATE 'latin1_swedish_ci',
	`user_code` VARCHAR(7) NOT NULL COMMENT 'System user' COLLATE 'latin1_swedish_ci',
	`customer_can_view` TINYINT(1) NOT NULL,
	`send_email` TINYINT(1) NOT NULL COMMENT 'If customer notified',
	`send_sms` TINYINT(1) NOT NULL COMMENT 'If customer notified',
	`response_required` TINYINT(1) NOT NULL COMMENT 'If customer needs to response',
	`fname` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`lname` VARCHAR(50) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;


-- Dumping structure for table theroyals.orders_received
DROP TABLE IF EXISTS `orders_received`;
CREATE TABLE IF NOT EXISTS `orders_received` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `order_code` varchar(7) NOT NULL,
  `receiving_method` varchar(7) NOT NULL DEFAULT 'sms' COMMENT 'sms, email, cwhd, cwdp, mdm, twp=takeaway_printer',
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `success_time` datetime DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.orders_received: ~0 rows (approximately)
DELETE FROM `orders_received`;
/*!40000 ALTER TABLE `orders_received` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_received` ENABLE KEYS */;


-- Dumping structure for view theroyals.orders_received_cwdp_view
DROP VIEW IF EXISTS `orders_received_cwdp_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `orders_received_cwdp_view` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL,
	`order_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`receiving_method` VARCHAR(7) NOT NULL COMMENT 'sms, email, cwhd, cwdp, mdm, twp=takeaway_printer' COLLATE 'latin1_swedish_ci',
	`success` TINYINT(1) NOT NULL,
	`success_time` DATETIME NULL
) ENGINE=MyISAM;


-- Dumping structure for view theroyals.orders_received_view
DROP VIEW IF EXISTS `orders_received_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `orders_received_view` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL,
	`order_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`receiving_method` VARCHAR(7) NOT NULL COMMENT 'sms, email, cwhd, cwdp, mdm, twp=takeaway_printer' COLLATE 'latin1_swedish_ci',
	`success` TINYINT(1) NOT NULL,
	`success_time` DATETIME NULL
) ENGINE=MyISAM;


-- Dumping structure for procedure theroyals.orders_rec_daily_proc
DROP PROCEDURE IF EXISTS `orders_rec_daily_proc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `orders_rec_daily_proc`(myDay CHAR(32), addedValue int)
BEGIN
                    DECLARE myNewDay CHAR(12);
                    SET myNewDay = (SELECT DATE_ADD(myDay, INTERVAL addedValue DAY));
                    SET myNewDay = (SELECT DATE(myNewDay));
                    SELECT 
                 orders.id AS id,
                 orders.active,
                 orders.order_code,
                 orders.order_id_temp,
                 orders.user_code,
                 orders.fname,
                 orders.lname,
                 orders.email,
                 orders.phone,
                 orders.postcode,
                 orders.placed_at,
                 orders.requested_at,
                 orders.receiving,
                 orders.pay_method,
                 orders.checkout_price,
                 orders.vip,
                 orders.customer_group,
                 order_status_fun(orders.order_code) AS status FROM orders WHERE DATE(requested_at)=myNewDay ORDER BY id;
                END//
DELIMITER ;


-- Dumping structure for procedure theroyals.orders_rec_monthly_proc
DROP PROCEDURE IF EXISTS `orders_rec_monthly_proc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `orders_rec_monthly_proc`(yearmonth int)
BEGIN
                    SELECT 
                 orders.id AS id,
                 orders.active,
                 orders.order_code,
                 orders.order_id_temp,
                 orders.user_code,
                 orders.fname,
                 orders.lname,
                 orders.email,
                 orders.phone,
                 orders.postcode,
                 orders.placed_at,
                 orders.requested_at,
                 orders.receiving,
                 orders.pay_method,
                 orders.checkout_price,
                 orders.vip,
                 orders.customer_group,
                 order_status_fun(orders.order_code) AS status FROM orders WHERE EXTRACT(YEAR_MONTH FROM requested_at)=yearmonth ORDER BY id;
                END//
DELIMITER ;


-- Dumping structure for view theroyals.orders_rec_month_current_view
DROP VIEW IF EXISTS `orders_rec_month_current_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `orders_rec_month_current_view` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL,
	`active` TINYINT(1) NOT NULL,
	`order_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`order_id_temp` VARCHAR(32) NOT NULL COLLATE 'latin1_swedish_ci',
	`user_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`fname` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`lname` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`email` TEXT NULL COLLATE 'latin1_swedish_ci',
	`phone` VARCHAR(16) NULL COLLATE 'latin1_swedish_ci',
	`postcode` VARCHAR(256) NULL COLLATE 'latin1_swedish_ci',
	`placed_at` DATETIME NULL,
	`requested_at` DATETIME NULL,
	`receiving` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`pay_method` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`checkout_price` DECIMAL(7,2) NULL,
	`vip` TINYINT(1) NOT NULL COMMENT 'If Customer Loged in',
	`customer_group` VARCHAR(64) NOT NULL COMMENT 'Which Group This Customer Belongs To' COLLATE 'latin1_swedish_ci',
	`status` CHAR(32) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view theroyals.orders_rec_month_previous_view
DROP VIEW IF EXISTS `orders_rec_month_previous_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `orders_rec_month_previous_view` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL,
	`active` TINYINT(1) NOT NULL,
	`order_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`order_id_temp` VARCHAR(32) NOT NULL COLLATE 'latin1_swedish_ci',
	`user_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`fname` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`lname` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`email` TEXT NULL COLLATE 'latin1_swedish_ci',
	`phone` VARCHAR(16) NULL COLLATE 'latin1_swedish_ci',
	`postcode` VARCHAR(256) NULL COLLATE 'latin1_swedish_ci',
	`placed_at` DATETIME NULL,
	`requested_at` DATETIME NULL,
	`receiving` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`pay_method` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`checkout_price` DECIMAL(7,2) NULL,
	`vip` TINYINT(1) NOT NULL COMMENT 'If Customer Loged in',
	`customer_group` VARCHAR(64) NOT NULL COMMENT 'Which Group This Customer Belongs To' COLLATE 'latin1_swedish_ci',
	`status` CHAR(32) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for view theroyals.orders_rec_today_view
DROP VIEW IF EXISTS `orders_rec_today_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `orders_rec_today_view` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL,
	`active` TINYINT(1) NOT NULL,
	`order_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`order_id_temp` VARCHAR(32) NOT NULL COLLATE 'latin1_swedish_ci',
	`user_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`fname` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`lname` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`email` TEXT NULL COLLATE 'latin1_swedish_ci',
	`phone` VARCHAR(16) NULL COLLATE 'latin1_swedish_ci',
	`postcode` VARCHAR(256) NULL COLLATE 'latin1_swedish_ci',
	`placed_at` DATETIME NULL,
	`requested_at` DATETIME NULL,
	`receiving` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`pay_method` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`checkout_price` DECIMAL(7,2) NULL,
	`vip` TINYINT(1) NOT NULL COMMENT 'If Customer Loged in',
	`customer_group` VARCHAR(64) NOT NULL COMMENT 'Which Group This Customer Belongs To' COLLATE 'latin1_swedish_ci',
	`status` CHAR(32) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for procedure theroyals.orders_rec_weekly_proc
DROP PROCEDURE IF EXISTS `orders_rec_weekly_proc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `orders_rec_weekly_proc`(myWeek CHAR(32), addedValue int)
BEGIN
                    DECLARE myNewWeekNo int;
                    DECLARE myNewWeek CHAR(32);
                    SET myNewWeek = (SELECT DATE_ADD(myWeek, INTERVAL addedValue WEEK));
                    SET myNewWeekNo = (SELECT WEEK(myWeek));
                    SELECT 
                 orders.id AS id,
                 orders.active,
                 orders.order_code,
                 orders.order_id_temp,
                 orders.user_code,
                 orders.fname,
                 orders.lname,
                 orders.email,
                 orders.phone,
                 orders.postcode,
                 orders.placed_at,
                 orders.requested_at,
                 orders.receiving,
                 orders.pay_method,
                 orders.checkout_price,
                 orders.vip,
                 orders.customer_group,
                 order_status_fun(orders.order_code) AS status FROM orders WHERE WEEK(requested_at)=myNewWeekNo ORDER BY id;
                END//
DELIMITER ;


-- Dumping structure for table theroyals.orders_state
DROP TABLE IF EXISTS `orders_state`;
CREATE TABLE IF NOT EXISTS `orders_state` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `sn` int(1) NOT NULL DEFAULT '1',
  `state` varchar(767) NOT NULL DEFAULT 'processing',
  `message` text,
  `customer_can_view` tinyint(1) NOT NULL DEFAULT '1',
  `send_email` tinyint(1) NOT NULL DEFAULT '1',
  `send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `response_required` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.orders_state: ~17 rows (approximately)
DELETE FROM `orders_state`;
/*!40000 ALTER TABLE `orders_state` DISABLE KEYS */;
INSERT INTO `orders_state` (`id`, `login_id`, `updated`, `active`, `sn`, `state`, `message`, `customer_can_view`, `send_email`, `send_sms`, `response_required`) VALUES
	(00000000001, 1, '2014-11-13 10:25:54', 1, 1, 'order_placed', 'Order placed with us', 1, 1, 0, 0),
	(00000000002, 1, '2014-11-13 10:52:59', 1, 2, 'received', 'We have received the order, We will let you know shortly if thre is any issue', 1, 1, 0, 0),
	(00000000003, 1, '2014-11-13 10:53:02', 1, 3, 'accepted', 'We have accepted your order, your order will be ready with us in 20 min', 1, 1, 0, 0),
	(00000000004, 1, '2014-11-13 10:53:08', 1, 4, 'processing', 'We are processing your order now', 1, 1, 0, 0),
	(00000000005, 1, '2014-11-13 12:27:21', 1, 5, 'on_hold', 'Oops… there was a problem with your order. Please contact us as soon as possiable', 1, 1, 0, 1),
	(00000000006, 1, '2014-11-13 12:27:26', 1, 6, 'waiting_on_customer_response', 'We are waiting on your response, Please contact us as soon as possiable', 1, 1, 0, 1),
	(00000000007, 1, '2014-11-13 10:53:16', 1, 7, 'waiting_on_driver', 'Your food is ready. We are waiting for our driver to deliver your food', 1, 1, 0, 0),
	(00000000008, 1, '2014-11-13 10:53:18', 1, 8, 'cooking', 'Now we are cooking your food.', 1, 1, 0, 0),
	(00000000009, 1, '2014-11-13 10:53:20', 1, 9, 'out_for_delivery', 'Your fodd is on its way. You should receive your meal shortly', 1, 1, 0, 0),
	(00000000010, 1, '2014-11-13 10:53:24', 1, 10, 'driver_near_by', 'Driver is very close to your home, please keep an eye ... ', 1, 1, 0, 0),
	(00000000011, 1, '2014-11-13 10:53:27', 1, 11, 'delivered', 'Your food has delivered successfully. Enjoy your meal.', 1, 1, 0, 0),
	(00000000012, 1, '2014-11-13 10:53:29', 1, 12, 'ready_for_pickup', 'We have cooked your meal and its ready for you to collect.', 1, 1, 0, 0),
	(00000000013, 1, '2014-11-13 12:27:39', 1, 13, 'too_far_for_delivery', 'Out of our delivery zone, If you do not mind you can pick from your shop.', 1, 1, 0, 1),
	(00000000014, 1, '2014-11-13 10:53:33', 1, 14, 'escalated_for_cancellation', 'We are cancelling your order, DUE TO ........................', 1, 1, 0, 0),
	(00000000015, 1, '2014-11-13 12:27:44', 1, 15, 'too_busy_to_deliver', 'We are sorry!! We are unable to deliver your food due to high volum of orders. It would be great if you could collect your food.', 1, 1, 0, 1),
	(00000000016, 1, '2014-11-13 12:27:47', 1, 16, 'too_busy', 'We are sorry!! We are unable to cook your food with in your requested time. It would be great if you do not mind waiting a little longer', 1, 1, 0, 1),
	(00000000017, 1, '2014-11-13 12:27:47', 1, 17, 'completed', 'Your order has completed successfuly. Thank you very much for your custom.', 1, 1, 0, 1);
/*!40000 ALTER TABLE `orders_state` ENABLE KEYS */;


-- Dumping structure for view theroyals.orders_view
DROP VIEW IF EXISTS `orders_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `orders_view` (
	`id` INT(11) UNSIGNED ZEROFILL NOT NULL,
	`active` TINYINT(1) NOT NULL,
	`order_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`order_id_temp` VARCHAR(32) NOT NULL COLLATE 'latin1_swedish_ci',
	`user_code` VARCHAR(7) NOT NULL COLLATE 'latin1_swedish_ci',
	`fname` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`lname` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`email` TEXT NULL COLLATE 'latin1_swedish_ci',
	`phone` VARCHAR(16) NULL COLLATE 'latin1_swedish_ci',
	`postcode` VARCHAR(256) NULL COLLATE 'latin1_swedish_ci',
	`placed_at` DATETIME NULL,
	`requested_at` DATETIME NULL,
	`receiving` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`pay_method` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`checkout_price` DECIMAL(7,2) NULL,
	`vip` TINYINT(1) NOT NULL COMMENT 'If Customer Loged in',
	`customer_group` VARCHAR(64) NOT NULL COMMENT 'Which Group This Customer Belongs To' COLLATE 'latin1_swedish_ci',
	`status` CHAR(32) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for function theroyals.order_avg_bus_fun
DROP FUNCTION IF EXISTS `order_avg_bus_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `order_avg_bus_fun`() RETURNS decimal(7,2)
BEGIN
              RETURN (SELECT avg(checkout_price) as orders_avarage_business FROM orders);
            END//
DELIMITER ;


-- Dumping structure for function theroyals.order_avg_monthly_fun
DROP FUNCTION IF EXISTS `order_avg_monthly_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `order_avg_monthly_fun`() RETURNS decimal(7,2)
BEGIN
              RETURN (SELECT avg(order_monthly_avg_user) as order_avg_monthly FROM users_activity);
            END//
DELIMITER ;


-- Dumping structure for function theroyals.order_avg_user_fun
DROP FUNCTION IF EXISTS `order_avg_user_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `order_avg_user_fun`(`user_code_current`  VARCHAR(10) ) RETURNS decimal(7,2)
BEGIN
              RETURN (SELECT avg(checkout_price) as order_avarage_user FROM orders WHERE user_code=user_code_current);
            END//
DELIMITER ;


-- Dumping structure for function theroyals.order_group_interval_fun
DROP FUNCTION IF EXISTS `order_group_interval_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `order_group_interval_fun`() RETURNS decimal(7,2)
BEGIN
                RETURN (SELECT AVG(order_monthly_avg_user)*2/3 AS group_interval FROM users_activity);
            END//
DELIMITER ;


-- Dumping structure for function theroyals.order_monthly_avg_user_fun
DROP FUNCTION IF EXISTS `order_monthly_avg_user_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `order_monthly_avg_user_fun`(`user_code_current`  VARCHAR(10) ) RETURNS decimal(7,2)
BEGIN
                RETURN (
                    SELECT AVG(order_monthly_user) as order_monthly_avg_user
                    FROM (
                        SELECT SUM(checkout_price) as order_monthly_user
                         FROM orders
                         WHERE user_code=user_code_current
                         GROUP BY YEAR(updated), MONTH(updated)
                    ) as total_table
                );
            END//
DELIMITER ;


-- Dumping structure for function theroyals.order_status_fun
DROP FUNCTION IF EXISTS `order_status_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `order_status_fun`(ordercode CHAR(10)) RETURNS char(32) CHARSET latin1
BEGIN
                RETURN ( SELECT status FROM orders_note WHERE order_code = ordercode ORDER BY updated DESC LIMIT 1  );
            END//
DELIMITER ;


-- Dumping structure for function theroyals.order_user_group_fun
DROP FUNCTION IF EXISTS `order_user_group_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `order_user_group_fun`( monthlyAvg decimal(7,2),  intervalVal decimal(7,2)) RETURNS char(1) CHARSET latin1
BEGIN
                  DECLARE returnVal CHAR(1);

                  IF monthlyAvg     <= intervalVal       THEN SET returnVal = 'A';
                  ELSEIF monthlyAvg <= intervalVal*2     THEN SET returnVal = 'B';
                  ELSEIF monthlyAvg <= intervalVal*3     THEN SET returnVal = 'C';
                  ELSEIF monthlyAvg <= intervalVal*4     THEN SET returnVal = 'D';
                  ELSEIF monthlyAvg <= intervalVal*5     THEN SET returnVal = 'E';
                  ELSEIF monthlyAvg <= intervalVal*6     THEN SET returnVal = 'F';
                  ELSEIF monthlyAvg <= intervalVal*7     THEN SET returnVal = 'G';
                  ELSEIF monthlyAvg <= intervalVal*8     THEN SET returnVal = 'H';
                  ELSEIF monthlyAvg <= intervalVal*9     THEN SET returnVal = 'I';
                  ELSEIF monthlyAvg <= intervalVal*10    THEN SET returnVal = 'J';
                  ELSE SET returnVal = 'K';
                  END If;

                  return returnVal;
              END//
DELIMITER ;


-- Dumping structure for table theroyals.pay_cash
DROP TABLE IF EXISTS `pay_cash`;
CREATE TABLE IF NOT EXISTS `pay_cash` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  `captcha` tinyint(4) NOT NULL DEFAULT '0',
  `cache_config_data` tinyint(1) NOT NULL DEFAULT '1',
  `log_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_dir` varchar(512) DEFAULT 'var/log',
  `log_transaction` varchar(512) DEFAULT 'cash.log',
  `log_exception` varchar(512) DEFAULT 'exception.log',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.pay_cash: ~1 rows (approximately)
DELETE FROM `pay_cash`;
/*!40000 ALTER TABLE `pay_cash` DISABLE KEYS */;
INSERT INTO `pay_cash` (`id`, `login_id`, `updated`, `active`, `min_order_value`, `captcha`, `cache_config_data`, `log_active`, `log_dir`, `log_transaction`, `log_exception`) VALUES
	(00000000001, 1, '2014-11-17 08:16:04', 1, 10.00, 0, 1, 0, 'var/log', 'cash.log', 'exception.log');
/*!40000 ALTER TABLE `pay_cash` ENABLE KEYS */;


-- Dumping structure for table theroyals.pay_paypal
DROP TABLE IF EXISTS `pay_paypal`;
CREATE TABLE IF NOT EXISTS `pay_paypal` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sandbox` tinyint(1) NOT NULL DEFAULT '1',
  `transaction_fee` decimal(20,2) DEFAULT '0.20',
  `commision` decimal(20,2) DEFAULT '3.20',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  `flat_fee` decimal(20,2) DEFAULT '0.20',
  `pay_after_transaction` tinyint(1) NOT NULL DEFAULT '0',
  `email_address` varchar(512) DEFAULT 'paypal@allinepos.co.uk',
  `image` text,
  `site_logo` varchar(1024) DEFAULT 'http://al-aminrestaurant.co.uk/img/menu/logo/logoPaypal.png',
  `cart_border_color` varchar(256) DEFAULT '000000',
  `completed_message` varchar(1024) NOT NULL DEFAULT 'Payment Received! Your product will be sent to you very soon!',
  `pending_message` text,
  `currency_code` varchar(256) DEFAULT 'GBP',
  `cache_config_data` tinyint(1) NOT NULL DEFAULT '1',
  `log_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_dir` varchar(512) DEFAULT 'var/log',
  `log_transaction` varchar(512) DEFAULT 'paypal.log',
  `log_exception` varchar(512) DEFAULT 'exception.log',
  `log_query_string_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_http_response_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_http_response_file` varchar(512) NOT NULL DEFAULT 'paypal_http_response.log',
  `api_email` varchar(512) NOT NULL DEFAULT 'paypal@allinepos.co.uk' COMMENT 'Email address used to get api credintial',
  `api_username` varchar(512) NOT NULL DEFAULT 'm82amjad_api1.hotmail.co.uk',
  `api_password` varchar(512) NOT NULL DEFAULT 'W4W9MCXCZ9DL4938',
  `api_signature` varchar(512) NOT NULL DEFAULT 'AamyNj8hYYmtqQkScocIJA2nHc2KAphH9D-oD3aGUcOr8fR.riuDM75B',
  `api_username_sandbox` varchar(512) NOT NULL DEFAULT 'seller_1317255315_biz_api1.gmail.com',
  `api_password_sandbox` varchar(512) NOT NULL DEFAULT '1317255350',
  `api_signature_sandbox` varchar(512) NOT NULL DEFAULT 'AFcWxV21C7fd0v3bYYYRCpSSRl31AsEXo1mfs5m9KpiElKsbTiQR9C2V',
  `action_type` varchar(32) DEFAULT 'integrated' COMMENT 'paynow/integrated/payment_pro',
  `url_index_redirec` varchar(512) DEFAULT 'takeaway/confirm',
  `url_success` varchar(512) DEFAULT 'takeaway/process_order',
  `url_pending` varchar(512) DEFAULT 'takeaway/process_order',
  `url_return` varchar(256) DEFAULT 'paypal/process',
  `url_cancel` varchar(256) DEFAULT 'takeaway/order_details',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.pay_paypal: ~1 rows (approximately)
DELETE FROM `pay_paypal`;
/*!40000 ALTER TABLE `pay_paypal` DISABLE KEYS */;
INSERT INTO `pay_paypal` (`id`, `login_id`, `updated`, `active`, `sandbox`, `transaction_fee`, `commision`, `min_order_value`, `flat_fee`, `pay_after_transaction`, `email_address`, `image`, `site_logo`, `cart_border_color`, `completed_message`, `pending_message`, `currency_code`, `cache_config_data`, `log_active`, `log_dir`, `log_transaction`, `log_exception`, `log_query_string_active`, `log_http_response_active`, `log_http_response_file`, `api_email`, `api_username`, `api_password`, `api_signature`, `api_username_sandbox`, `api_password_sandbox`, `api_signature_sandbox`, `action_type`, `url_index_redirec`, `url_success`, `url_pending`, `url_return`, `url_cancel`) VALUES
	(00000000001, 1, '2014-11-17 08:16:14', 1, 0, 0.20, 3.20, 10.00, 0.20, 0, 'paypal@allinepos.co.uk', NULL, 'http://theroyals.lc/img/defaultm/logo/logoPaypal.png', '000000', 'Payment Received! Your product will be sent to you very soon!', 'Transaction Complete. But payment is still pending! <br /> You need to manually authorize this payment in your <a href=\'http://www.paypal.com\'>Paypal Account</a>', 'GBP', 1, 0, 'var/log', 'paypal.log', 'exception.log', 0, 0, 'paypal_http_response.log', 'paypal@allinepos.co.uk', 'paypal_api1.allinepos.co.uk', 'PV4JEDKYLMR8Y4CB', 'AQ.fqXeamQ8fxag9wQAHRJsswjn4AMVMXnYKGC.H3xTww2HQI5gmNDJ7', 'paypal-facilitator_api1.allinepos.co.uk', 'E9292K72N6WCRS23', 'ADUCUJ0XV9JdDE8xmRxJ5OBXlRwpA94WFsMifW8uchicjVGshjGeWXHS', 'integrated', 'takeaway/confirm', 'takeaway/process_order', 'takeaway/process_order', 'paypal/process', 'takeaway/order_details');
/*!40000 ALTER TABLE `pay_paypal` ENABLE KEYS */;


-- Dumping structure for table theroyals.pay_psense
DROP TABLE IF EXISTS `pay_psense`;
CREATE TABLE IF NOT EXISTS `pay_psense` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `test_mode` tinyint(1) NOT NULL DEFAULT '0',
  `credit_card_fee` decimal(7,2) DEFAULT '0.20',
  `debit_card_fee` decimal(7,2) DEFAULT '2.20',
  `flat_fee` decimal(7,2) DEFAULT '-2.00' COMMENT 'if -2, Apply Calculated Fee ',
  `pay_after_transaction` tinyint(1) NOT NULL DEFAULT '0',
  `min_order_value` decimal(7,2) DEFAULT '10.00',
  `acquirer` varchar(128) DEFAULT NULL,
  `name_customer` varchar(128) NOT NULL DEFAULT 'Card',
  `pre_shared_key` text,
  `merchant_id` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `pre_shared_key_test` text,
  `merchant_id_test` varchar(256) DEFAULT NULL,
  `password_test` varchar(256) DEFAULT NULL,
  `order_description` varchar(256) DEFAULT NULL,
  `transaction_type` varchar(256) DEFAULT 'SALE',
  `fdms_mid` varchar(256) DEFAULT NULL,
  `image` text,
  `cache_config_data` tinyint(1) NOT NULL DEFAULT '1',
  `log_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_dir` varchar(128) NOT NULL DEFAULT 'payment_sense.log',
  `log_file_name` varchar(128) NOT NULL DEFAULT 'payment_sense.log',
  `log_query_string_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_http_response_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_http_response_file` varchar(512) NOT NULL DEFAULT 'paypal_http_response.log',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.pay_psense: ~1 rows (approximately)
DELETE FROM `pay_psense`;
/*!40000 ALTER TABLE `pay_psense` DISABLE KEYS */;
INSERT INTO `pay_psense` (`id`, `login_id`, `updated`, `active`, `test_mode`, `credit_card_fee`, `debit_card_fee`, `flat_fee`, `pay_after_transaction`, `min_order_value`, `acquirer`, `name_customer`, `pre_shared_key`, `merchant_id`, `password`, `pre_shared_key_test`, `merchant_id_test`, `password_test`, `order_description`, `transaction_type`, `fdms_mid`, `image`, `cache_config_data`, `log_active`, `log_dir`, `log_file_name`, `log_query_string_active`, `log_http_response_active`, `log_http_response_file`) VALUES
	(00000000001, 1, '2014-11-17 08:16:04', 0, 0, 0.20, 2.20, -2.00, 0, 10.00, NULL, 'Card', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'SALE', NULL, NULL, 1, 0, 'payment_sense.log', 'payment_sense.log', 0, 0, 'paypal_http_response.log');
/*!40000 ALTER TABLE `pay_psense` ENABLE KEYS */;


-- Dumping structure for table theroyals.prod_category
DROP TABLE IF EXISTS `prod_category`;
CREATE TABLE IF NOT EXISTS `prod_category` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `parent_category_id` int(11) NOT NULL DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `description` text,
  `takeaway_sit_in` varchar(32) NOT NULL DEFAULT 'takeaway',
  `image_src` text,
  `image_href` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.prod_category: ~3 rows (approximately)
DELETE FROM `prod_category`;
/*!40000 ALTER TABLE `prod_category` DISABLE KEYS */;
INSERT INTO `prod_category` (`id`, `login_id`, `updated`, `active`, `sn`, `parent_category_id`, `title`, `description`, `takeaway_sit_in`, `image_src`, `image_href`) VALUES
	(00000000001, 1, '2014-11-17 08:16:00', 1, 1, 0, 'Takeaway Menu', NULL, 'takeaway', NULL, NULL),
	(00000000002, 1, '2014-11-17 08:16:00', 1, 1, 1, 'Starter', NULL, 'takeaway', NULL, NULL),
	(00000000003, 1, '2014-11-17 08:16:00', 1, 1, 1, 'Chef SPecials', NULL, 'takeaway', NULL, NULL);
/*!40000 ALTER TABLE `prod_category` ENABLE KEYS */;


-- Dumping structure for table theroyals.prod_list
DROP TABLE IF EXISTS `prod_list`;
CREATE TABLE IF NOT EXISTS `prod_list` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `short_name` varchar(128) DEFAULT '#',
  `name_kitchen` varchar(128) DEFAULT '#',
  `description` text,
  `price` decimal(7,2) NOT NULL DEFAULT '5.00',
  `prod_category_id` int(11) NOT NULL DEFAULT '2',
  `vat` decimal(7,2) NOT NULL DEFAULT '-2.00',
  `instruction` text,
  `default_note` text,
  `note_must` tinyint(1) NOT NULL DEFAULT '0',
  `note_show` tinyint(1) DEFAULT '0',
  `prod_code` varchar(32) DEFAULT '#',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is it a new product',
  `is_meal_deal` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is it a meal deal',
  `details_page` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'If Customer Can access Details Page',
  `is_gen_offer` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'If general discount will apply',
  `was_price` decimal(7,2) NOT NULL DEFAULT '-2.00' COMMENT 'If it is on discounted price, old price here',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.prod_list: ~10 rows (approximately)
DELETE FROM `prod_list`;
/*!40000 ALTER TABLE `prod_list` DISABLE KEYS */;
INSERT INTO `prod_list` (`id`, `login_id`, `updated`, `active`, `sn`, `title`, `short_name`, `name_kitchen`, `description`, `price`, `prod_category_id`, `vat`, `instruction`, `default_note`, `note_must`, `note_show`, `prod_code`, `is_new`, `is_meal_deal`, `details_page`, `is_gen_offer`, `was_price`) VALUES
	(00000000001, 1, '2014-11-17 08:16:00', 1, 1, 'Chicken Tikka(ST)', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala', 5.00, 2, -2.00, NULL, NULL, 0, 0, '1', 0, 0, 0, 1, -2.00),
	(00000000002, 1, '2014-11-17 08:16:00', 1, 1, 'Lam Tikka (ST)', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala', 5.00, 2, -2.00, NULL, NULL, 0, 0, '2', 0, 0, 0, 1, -2.00),
	(00000000003, 1, '2014-11-17 08:16:00', 1, 1, 'Onion Bhaji', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala', 5.00, 2, -2.00, NULL, NULL, 0, 0, '3', 0, 0, 0, 1, -2.00),
	(00000000004, 1, '2014-11-17 08:16:00', 1, 1, 'Prwan Puri', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala', 5.00, 2, -2.00, NULL, NULL, 0, 0, '4', 0, 0, 0, 1, -2.00),
	(00000000005, 1, '2014-11-17 08:16:00', 1, 1, 'Tandoori Chicken', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala', 5.00, 2, -2.00, NULL, NULL, 0, 0, '5', 0, 0, 0, 1, -2.00),
	(00000000006, 1, '2014-11-17 08:16:00', 1, 1, 'Simla Moris', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala', 5.00, 2, -2.00, NULL, NULL, 0, 0, '6', 0, 0, 0, 1, -2.00),
	(00000000007, 1, '2014-11-17 08:16:00', 1, 1, 'Chicken Tikka Masala', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala', 5.00, 3, -2.00, NULL, NULL, 0, 0, '7', 0, 0, 0, 1, -2.00),
	(00000000008, 1, '2014-11-17 08:16:00', 1, 1, 'Lam Tikka Masala', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala', 5.00, 3, -2.00, NULL, NULL, 0, 0, '8', 0, 0, 0, 1, -2.00),
	(00000000009, 1, '2014-11-17 08:16:00', 1, 1, 'Prwan Tikka Masala', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala', 5.00, 3, -2.00, NULL, NULL, 0, 0, '9', 0, 0, 0, 1, -2.00),
	(00000000010, 1, '2014-11-17 08:16:00', 1, 1, 'Chicken Tikka Razala', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala', 5.00, 3, -2.00, NULL, NULL, 0, 0, '10', 0, 0, 0, 1, -2.00);
/*!40000 ALTER TABLE `prod_list` ENABLE KEYS */;


-- Dumping structure for table theroyals.prod_meats
DROP TABLE IF EXISTS `prod_meats`;
CREATE TABLE IF NOT EXISTS `prod_meats` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `short_name` varchar(128) NOT NULL DEFAULT '#',
  `icon` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.prod_meats: ~8 rows (approximately)
DELETE FROM `prod_meats`;
/*!40000 ALTER TABLE `prod_meats` DISABLE KEYS */;
INSERT INTO `prod_meats` (`id`, `login_id`, `updated`, `active`, `sn`, `title`, `short_name`, `icon`) VALUES
	(00000000001, 1, '2014-04-19 13:14:22', 1, 1, 'Chicken', 'CH', NULL),
	(00000000002, 1, '2014-04-19 13:14:22', 1, 2, 'Lamb', 'LM', NULL),
	(00000000003, 1, '2014-04-19 13:14:22', 1, 3, 'Veg', 'VG', NULL),
	(00000000004, 1, '2014-04-19 13:14:22', 1, 4, 'Prwan', 'PR', NULL),
	(00000000005, 1, '2014-04-19 13:14:22', 1, 5, 'King Prwan', 'KP', NULL),
	(00000000006, 1, '2014-04-19 13:14:22', 1, 6, 'King Prwan Tikka', 'KP', NULL),
	(00000000007, 1, '2014-04-19 13:14:22', 1, 7, 'Chicken Tikka', 'KP', NULL),
	(00000000008, 1, '2014-04-19 13:14:22', 1, 8, 'Lamb Tikka', 'KP', NULL);
/*!40000 ALTER TABLE `prod_meats` ENABLE KEYS */;


-- Dumping structure for table theroyals.prod_meat_price
DROP TABLE IF EXISTS `prod_meat_price`;
CREATE TABLE IF NOT EXISTS `prod_meat_price` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `prod_list_id` int(11) NOT NULL,
  `prod_meats_id` int(11) NOT NULL,
  `price` decimal(7,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.prod_meat_price: ~8 rows (approximately)
DELETE FROM `prod_meat_price`;
/*!40000 ALTER TABLE `prod_meat_price` DISABLE KEYS */;
INSERT INTO `prod_meat_price` (`id`, `login_id`, `updated`, `active`, `sn`, `prod_list_id`, `prod_meats_id`, `price`) VALUES
	(00000000001, 1, '2014-04-19 13:30:20', 1, 1, 1, 2, 12.00),
	(00000000002, 1, '2014-04-19 13:30:20', 1, 1, 1, 1, 4.00),
	(00000000003, 1, '2014-04-19 13:30:20', 1, 1, 1, 3, 5.00),
	(00000000004, 1, '2014-04-19 13:30:20', 1, 1, 2, 4, 6.00),
	(00000000005, 1, '2014-04-19 13:30:20', 1, 1, 2, 5, 3.00),
	(00000000006, 1, '2014-04-19 13:30:20', 1, 1, 3, 6, 6.00),
	(00000000007, 1, '2014-04-19 13:30:20', 1, 1, 3, 7, 7.00),
	(00000000008, 1, '2014-04-19 13:30:20', 1, 1, 3, 8, 3.00);
/*!40000 ALTER TABLE `prod_meat_price` ENABLE KEYS */;


-- Dumping structure for view theroyals.prod_meat_view
DROP VIEW IF EXISTS `prod_meat_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `prod_meat_view` (
	`prod_meat_price_id` INT(11) UNSIGNED ZEROFILL NOT NULL,
	`prod_meat_price_active` TINYINT(1) NOT NULL,
	`prod_meat_price_sn` INT(11) NOT NULL,
	`prod_list_id` INT(11) NOT NULL,
	`price` DECIMAL(7,2) NULL,
	`prod_meats_id` INT(11) UNSIGNED ZEROFILL NULL,
	`prod_meats_active` TINYINT(1) NULL,
	`meats_title` VARCHAR(256) NULL COLLATE 'latin1_swedish_ci',
	`short_name` VARCHAR(128) NULL COLLATE 'latin1_swedish_ci',
	`icon` TEXT NULL COLLATE 'latin1_swedish_ci',
	`prod_category_id` INT(11) NULL,
	`user_view` CHAR(250) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for table theroyals.prod_options
DROP TABLE IF EXISTS `prod_options`;
CREATE TABLE IF NOT EXISTS `prod_options` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name_option` varchar(256) NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.prod_options: ~9 rows (approximately)
DELETE FROM `prod_options`;
/*!40000 ALTER TABLE `prod_options` DISABLE KEYS */;
INSERT INTO `prod_options` (`id`, `login_id`, `updated`, `active`, `name_option`) VALUES
	(00000000001, 1, '2014-10-02 23:59:19', 1, 'Large'),
	(00000000002, 1, '2014-10-02 23:59:19', 1, 'Small'),
	(00000000003, 1, '2014-10-02 23:59:19', 1, 'Chicken Tikka Masalla'),
	(00000000004, 1, '2014-10-04 07:38:09', 1, 'Regular'),
	(00000000005, 1, '2014-10-04 07:38:30', 1, 'Mild'),
	(00000000006, 1, '2014-10-04 07:38:42', 1, 'Spicy'),
	(00000000007, 1, '2014-10-04 07:38:50', 1, 'Hot'),
	(00000000008, 1, '2014-10-04 07:40:32', 1, 'Lamb Dansak'),
	(00000000009, 1, '2014-10-04 07:41:07', 1, 'Veg Bhoona');
/*!40000 ALTER TABLE `prod_options` ENABLE KEYS */;


-- Dumping structure for table theroyals.prod_options_price
DROP TABLE IF EXISTS `prod_options_price`;
CREATE TABLE IF NOT EXISTS `prod_options_price` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `group_no` int(11) NOT NULL DEFAULT '1',
  `prod_list_id` int(11) NOT NULL DEFAULT '1',
  `prod_options_id` int(11) NOT NULL DEFAULT '1',
  `price` decimal(7,2) DEFAULT '1.50',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.prod_options_price: ~23 rows (approximately)
DELETE FROM `prod_options_price`;
/*!40000 ALTER TABLE `prod_options_price` DISABLE KEYS */;
INSERT INTO `prod_options_price` (`id`, `login_id`, `updated`, `active`, `sn`, `group_no`, `prod_list_id`, `prod_options_id`, `price`) VALUES
	(00000000001, 1, '2014-10-04 07:42:32', 1, 1, 1, 7, 5, 1.50),
	(00000000002, 1, '2014-10-04 07:44:10', 1, 1, 3, 7, 11, 1.50),
	(00000000003, 1, '2014-10-04 07:42:38', 1, 1, 1, 7, 7, 1.50),
	(00000000004, 1, '2014-10-04 07:45:04', 1, 1, 2, 9, 3, 2.00),
	(00000000005, 1, '2014-10-04 07:41:59', 1, 1, 0, 9, 4, 1.50),
	(00000000006, 1, '2014-10-04 07:44:38', 1, 1, 2, 8, 8, 1.50),
	(00000000007, 1, '2014-10-04 07:34:51', 1, 1, 0, 7, 2, 1.50),
	(00000000008, 1, '2014-10-04 07:36:31', 1, 1, 3, 10, 2, 1.50),
	(00000000009, 1, '2014-10-04 07:46:38', 1, 2, 0, 7, 1, 1.50),
	(00000000010, 1, '2014-10-04 07:42:35', 1, 1, 1, 7, 6, 1.50),
	(00000000011, 1, '2014-10-04 07:43:35', 1, 1, 2, 7, 9, 1.50),
	(00000000012, 1, '2014-10-04 07:43:31', 1, 1, 2, 7, 8, 2.00),
	(00000000013, 1, '2014-10-04 07:36:17', 1, 1, 2, 8, 3, 1.50),
	(00000000014, 1, '2014-10-04 07:47:59', 1, 2, 1, 8, 1, 1.50),
	(00000000015, 1, '2014-10-04 07:48:03', 1, 1, 1, 8, 4, 1.50),
	(00000000016, 1, '2014-10-04 07:45:06', 1, 1, 2, 9, 8, 1.50),
	(00000000017, 1, '2014-10-04 07:46:45', 1, 3, 0, 7, 4, 1.50),
	(00000000018, 1, '2014-10-04 07:43:28', 1, 1, 2, 7, 3, 1.50),
	(00000000019, 1, '2014-10-04 07:36:54', 1, 1, 0, 9, 1, 1.50),
	(00000000020, 1, '2014-10-04 07:36:57', 1, 1, 3, 10, 1, 1.50),
	(00000000021, 1, '2014-10-04 07:44:12', 1, 1, 3, 7, 12, 1.50),
	(00000000022, 1, '2014-10-04 07:44:16', 1, 1, 3, 7, 13, 1.50),
	(00000000023, 1, '2014-10-04 07:44:07', 1, 1, 3, 7, 10, 1.50);
/*!40000 ALTER TABLE `prod_options_price` ENABLE KEYS */;


-- Dumping structure for view theroyals.prod_options_price_view
DROP VIEW IF EXISTS `prod_options_price_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `prod_options_price_view` (
	`prod_options_price_id` INT(11) UNSIGNED ZEROFILL NULL,
	`prod_options_price_active` TINYINT(1) NULL,
	`prod_options_price_sn` INT(11) NULL,
	`group_no` INT(11) NULL,
	`prod_list_id` INT(11) NULL,
	`price` DECIMAL(7,2) NULL,
	`prod_options_id` INT(11) NULL,
	`prod_options_active` TINYINT(1) NULL,
	`name_option` VARCHAR(256) NULL COLLATE 'latin1_swedish_ci',
	`prod_category_id` INT(11) NOT NULL,
	`user_view` CHAR(250) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for function theroyals.prod_user_view_fun
DROP FUNCTION IF EXISTS `prod_user_view_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `prod_user_view_fun`(option_name CHAR(250), price CHAR(250)) RETURNS char(250) CHARSET latin1
BEGIN
                DECLARE user_view CHAR(250);
                SET user_view=CONCAT(option_name,' &pound', price);
                RETURN user_view;
            END//
DELIMITER ;


-- Dumping structure for table theroyals.services_collection
DROP TABLE IF EXISTS `services_collection`;
CREATE TABLE IF NOT EXISTS `services_collection` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) DEFAULT '1',
  `current_waiting_time` int(5) DEFAULT '15',
  `opening_hours` text,
  `maximum_cover_cash` int(5) DEFAULT '15',
  `mini_order_value` float(7,2) DEFAULT '10.00',
  `start_after` int(5) DEFAULT '10',
  `end_before` int(5) DEFAULT '10',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.services_collection: ~1 rows (approximately)
DELETE FROM `services_collection`;
/*!40000 ALTER TABLE `services_collection` DISABLE KEYS */;
INSERT INTO `services_collection` (`id`, `login_id`, `updated`, `active`, `available`, `current_waiting_time`, `opening_hours`, `maximum_cover_cash`, `mini_order_value`, `start_after`, `end_before`) VALUES
	(00000000001, 1, '2014-11-17 08:16:02', 1, 1, 15, NULL, 15, 10.00, 10, 10);
/*!40000 ALTER TABLE `services_collection` ENABLE KEYS */;


-- Dumping structure for table theroyals.services_delivery
DROP TABLE IF EXISTS `services_delivery`;
CREATE TABLE IF NOT EXISTS `services_delivery` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `available` tinyint(1) DEFAULT '1',
  `current_waiting_time` int(5) DEFAULT '45',
  `opening_hours` text,
  `maximum_cover_cash` int(5) DEFAULT '15',
  `mini_order_value` float(7,2) DEFAULT '10.00',
  `start_after` int(5) DEFAULT '0',
  `end_before` int(5) DEFAULT '0',
  `maximum_cover` float(7,2) DEFAULT '6.00',
  `free_area` float(7,2) DEFAULT '3.00',
  `default_charge` float(7,2) DEFAULT '2.00',
  `post_code_lookup` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.services_delivery: ~1 rows (approximately)
DELETE FROM `services_delivery`;
/*!40000 ALTER TABLE `services_delivery` DISABLE KEYS */;
INSERT INTO `services_delivery` (`id`, `login_id`, `updated`, `active`, `available`, `current_waiting_time`, `opening_hours`, `maximum_cover_cash`, `mini_order_value`, `start_after`, `end_before`, `maximum_cover`, `free_area`, `default_charge`, `post_code_lookup`) VALUES
	(00000000001, 1, '2014-11-17 08:16:02', 1, 1, 45, NULL, 15, 10.00, 0, 0, 6.00, 3.00, 2.00, 0);
/*!40000 ALTER TABLE `services_delivery` ENABLE KEYS */;


-- Dumping structure for table theroyals.services_delivery_charge
DROP TABLE IF EXISTS `services_delivery_charge`;
CREATE TABLE IF NOT EXISTS `services_delivery_charge` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `distance_from` decimal(9,4) DEFAULT NULL,
  `distance_to` decimal(9,4) DEFAULT NULL,
  `charge` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='Delivery CHarges';

-- Dumping data for table theroyals.services_delivery_charge: ~5 rows (approximately)
DELETE FROM `services_delivery_charge`;
/*!40000 ALTER TABLE `services_delivery_charge` DISABLE KEYS */;
INSERT INTO `services_delivery_charge` (`id`, `login_id`, `updated`, `active`, `distance_from`, `distance_to`, `charge`) VALUES
	(00000000001, 1, '2014-11-11 16:00:34', 1, 0.0000, 0.5000, 1.50),
	(00000000002, 1, '2014-11-11 16:11:11', 1, 0.5001, 1.0000, 2.00),
	(00000000003, 1, '2014-11-11 16:11:18', 1, 1.0001, 2.5000, 3.00),
	(00000000004, 1, '2014-11-11 16:02:12', 1, 2.5100, 3.0000, 3.50),
	(00000000005, 1, '2014-11-11 16:02:23', 1, 3.0100, 4.0000, 4.50);
/*!40000 ALTER TABLE `services_delivery_charge` ENABLE KEYS */;


-- Dumping structure for view theroyals.services_delivery_charge_view
DROP VIEW IF EXISTS `services_delivery_charge_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `services_delivery_charge_view` (
	`distance_from` DECIMAL(13,4) NULL,
	`distance_to` DECIMAL(13,4) NULL,
	`charge` DECIMAL(7,2) NULL
) ENGINE=MyISAM;


-- Dumping structure for table theroyals.services_opening_hours
DROP TABLE IF EXISTS `services_opening_hours`;
CREATE TABLE IF NOT EXISTS `services_opening_hours` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '0',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT '1',
  `from_` varchar(5) NOT NULL DEFAULT '17:30',
  `to_` varchar(5) NOT NULL DEFAULT '23:59',
  `day` varchar(3) NOT NULL,
  `collection` tinyint(1) NOT NULL DEFAULT '1',
  `delivery` tinyint(1) NOT NULL DEFAULT '0',
  `sit_in` tinyint(1) NOT NULL DEFAULT '0',
  `waiting_collection` int(5) DEFAULT NULL,
  `waiting_delivery` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.services_opening_hours: ~7 rows (approximately)
DELETE FROM `services_opening_hours`;
/*!40000 ALTER TABLE `services_opening_hours` DISABLE KEYS */;
INSERT INTO `services_opening_hours` (`id`, `login_id`, `updated`, `active`, `sn`, `from_`, `to_`, `day`, `collection`, `delivery`, `sit_in`, `waiting_collection`, `waiting_delivery`) VALUES
	(00000000001, 0, '2014-11-17 08:15:51', 1, 1, '17:30', '23:59', 'Mon', 1, 0, 0, 15, 45),
	(00000000002, 0, '2014-11-17 08:15:51', 1, 1, '17:30', '23:59', 'Tue', 1, 0, 0, 15, 45),
	(00000000003, 0, '2014-11-17 08:15:51', 1, 1, '17:30', '23:59', 'Wed', 1, 0, 0, 15, 45),
	(00000000004, 0, '2014-11-17 08:15:51', 1, 1, '17:30', '23:59', 'Thu', 1, 0, 0, 15, 45),
	(00000000005, 0, '2014-11-17 08:15:51', 1, 1, '17:30', '23:59', 'Fri', 1, 0, 0, 15, 45),
	(00000000006, 0, '2014-11-17 08:15:51', 1, 1, '17:30', '23:59', 'Sat', 1, 0, 0, 15, 45),
	(00000000007, 0, '2014-11-17 08:15:51', 1, 1, '17:30', '23:59', 'Sun', 1, 0, 0, 15, 45);
/*!40000 ALTER TABLE `services_opening_hours` ENABLE KEYS */;


-- Dumping structure for table theroyals.services_reservations
DROP TABLE IF EXISTS `services_reservations`;
CREATE TABLE IF NOT EXISTS `services_reservations` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `user_code` varchar(10) DEFAULT NULL,
  `fname` varchar(256) NOT NULL,
  `lname` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone` varchar(256) NOT NULL,
  `cover` varchar(256) NOT NULL,
  `reservation_time` datetime DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.services_reservations: ~0 rows (approximately)
DELETE FROM `services_reservations`;
/*!40000 ALTER TABLE `services_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_reservations` ENABLE KEYS */;


-- Dumping structure for table theroyals.services_reservations_confirm
DROP TABLE IF EXISTS `services_reservations_confirm`;
CREATE TABLE IF NOT EXISTS `services_reservations_confirm` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `rest_reservations_id` bigint(20) NOT NULL,
  `confirmation_sent` tinyint(1) NOT NULL DEFAULT '0',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `arrived` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.services_reservations_confirm: ~0 rows (approximately)
DELETE FROM `services_reservations_confirm`;
/*!40000 ALTER TABLE `services_reservations_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_reservations_confirm` ENABLE KEYS */;


-- Dumping structure for table theroyals.services_sit_in
DROP TABLE IF EXISTS `services_sit_in`;
CREATE TABLE IF NOT EXISTS `services_sit_in` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `opening_hours` text,
  `start_after` int(11) DEFAULT '0',
  `end_before` int(11) DEFAULT '0',
  `max_sit` int(11) DEFAULT '1',
  `licensed` tinyint(1) NOT NULL DEFAULT '0',
  `air_condition` tinyint(1) NOT NULL DEFAULT '0',
  `wheel_chair` tinyint(1) NOT NULL DEFAULT '0',
  `disable_toilet` tinyint(1) NOT NULL DEFAULT '0',
  `booking_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.services_sit_in: ~1 rows (approximately)
DELETE FROM `services_sit_in`;
/*!40000 ALTER TABLE `services_sit_in` DISABLE KEYS */;
INSERT INTO `services_sit_in` (`id`, `login_id`, `updated`, `active`, `available`, `opening_hours`, `start_after`, `end_before`, `max_sit`, `licensed`, `air_condition`, `wheel_chair`, `disable_toilet`, `booking_accepted`, `admin`) VALUES
	(00000000001, 1, '2014-11-17 08:16:02', 0, 0, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `services_sit_in` ENABLE KEYS */;


-- Dumping structure for table theroyals.social_facebook
DROP TABLE IF EXISTS `social_facebook`;
CREATE TABLE IF NOT EXISTS `social_facebook` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` text,
  `note` text,
  `like_code` text,
  `share` text,
  `application_id` text,
  `access_token` text,
  `page_id` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.social_facebook: ~1 rows (approximately)
DELETE FROM `social_facebook`;
/*!40000 ALTER TABLE `social_facebook` DISABLE KEYS */;
INSERT INTO `social_facebook` (`id`, `login_id`, `updated`, `active`, `url`, `note`, `like_code`, `share`, `application_id`, `access_token`, `page_id`) VALUES
	(00000000001, 1, '2014-11-17 08:15:57', 0, 'https://www.facebook.com/TakeAwayGuru/timeline', NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `social_facebook` ENABLE KEYS */;


-- Dumping structure for table theroyals.social_google
DROP TABLE IF EXISTS `social_google`;
CREATE TABLE IF NOT EXISTS `social_google` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` text,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.social_google: ~1 rows (approximately)
DELETE FROM `social_google`;
/*!40000 ALTER TABLE `social_google` DISABLE KEYS */;
INSERT INTO `social_google` (`id`, `login_id`, `updated`, `active`, `url`, `note`) VALUES
	(00000000001, 1, '2014-11-17 08:15:55', 0, 'https://plus.google.com/u/0/', NULL);
/*!40000 ALTER TABLE `social_google` ENABLE KEYS */;


-- Dumping structure for table theroyals.social_href
DROP TABLE IF EXISTS `social_href`;
CREATE TABLE IF NOT EXISTS `social_href` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` text,
  `note` text,
  `sn` int(11) DEFAULT '1',
  `social_name` varchar(512) DEFAULT '',
  `icon` text,
  `logo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.social_href: ~8 rows (approximately)
DELETE FROM `social_href`;
/*!40000 ALTER TABLE `social_href` DISABLE KEYS */;
INSERT INTO `social_href` (`id`, `login_id`, `updated`, `active`, `url`, `note`, `sn`, `social_name`, `icon`, `logo`) VALUES
	(00000000001, 1, '2014-11-17 08:16:07', 0, 'http://takeawayguru.com', 'takeaway guru', 1, 'takeawayguru', '/img/defaultm/social/icon/takeawayguru.png', 'http://takeawayguru.com/imgCommon/social/takeawayguruLogo.png'),
	(00000000002, 1, '2014-11-17 08:16:07', 0, 'https://www.facebook.com/TakeAwayGuru/timeline', 'Facebook', 2, 'facebook', '/img/defaultm/social/icon/facebook.png', 'http://takeawayguru.com/imgCommon/social/facebookLogo.png'),
	(00000000003, 1, '2014-11-17 08:16:07', 0, 'https://www.youtube.com/channel/UCJENQl-cgkP2ZiiYDhXWXRA', 'youtube', 3, 'youtube', '/img/defaultm/social/icon/youtube.png', 'http://takeawayguru.com/imgCommon/social/youtubeLogo.png'),
	(00000000004, 1, '2014-11-17 08:16:07', 0, 'https://twitter.com/takeawayguru', 'twitter', 4, 'twitter', '/img/defaultm/social/icon/twitter.png', 'http://takeawayguru.com/imgCommon/social/twitterLogo.png'),
	(00000000005, 1, '2014-11-17 08:16:07', 0, 'https://plus.google.com/u/0/', 'Google +', 5, 'google+', '/img/defaultm/social/icon/googleplus.png', 'http://takeawayguru.com/imgCommon/social/googleLogo.png'),
	(00000000006, 1, '2014-11-17 08:15:59', 0, 'http://takeawayguru1.blogspot.co.uk/', 'Blogpost', 6, 'blogpost', 'http://takeawayguru.com/imgCommon/social/blogpost.ico', 'http://takeawayguru.com/imgCommon/social/blogpostLogo.png'),
	(00000000007, 1, '2014-11-17 08:15:59', 0, 'http://www.pinterest.com/lalitasahu73/', 'Pinterest', 7, 'pinterest', 'http://takeawayguru.com/imgCommon/social/pinterest.ico', 'http://takeawayguru.com/imgCommon/social/pinterestLogo.png'),
	(00000000008, 1, '2014-11-17 08:15:59', 0, 'https://www.tumblr.com/blog/takeawayguru', 'Tumblr', 8, 'tumblr', 'http://takeawayguru.com/imgCommon/social/tumblr.ico', 'http://takeawayguru.com/imgCommon/social/tumblrLogo.png');
/*!40000 ALTER TABLE `social_href` ENABLE KEYS */;


-- Dumping structure for table theroyals.social_takeawayguru
DROP TABLE IF EXISTS `social_takeawayguru`;
CREATE TABLE IF NOT EXISTS `social_takeawayguru` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` text,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.social_takeawayguru: ~1 rows (approximately)
DELETE FROM `social_takeawayguru`;
/*!40000 ALTER TABLE `social_takeawayguru` DISABLE KEYS */;
INSERT INTO `social_takeawayguru` (`id`, `login_id`, `updated`, `active`, `url`, `note`) VALUES
	(00000000001, 1, '2014-11-17 08:15:55', 0, 'https://www.youtube.com/channel/UCJENQl-cgkP2ZiiYDhXWXRA', NULL);
/*!40000 ALTER TABLE `social_takeawayguru` ENABLE KEYS */;


-- Dumping structure for table theroyals.social_tripadvisor
DROP TABLE IF EXISTS `social_tripadvisor`;
CREATE TABLE IF NOT EXISTS `social_tripadvisor` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` text,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.social_tripadvisor: ~1 rows (approximately)
DELETE FROM `social_tripadvisor`;
/*!40000 ALTER TABLE `social_tripadvisor` DISABLE KEYS */;
INSERT INTO `social_tripadvisor` (`id`, `login_id`, `updated`, `active`, `url`, `note`) VALUES
	(00000000001, 1, '2014-11-17 08:15:55', 0, 'http://tripadvisor.com', NULL);
/*!40000 ALTER TABLE `social_tripadvisor` ENABLE KEYS */;


-- Dumping structure for table theroyals.social_youtube
DROP TABLE IF EXISTS `social_youtube`;
CREATE TABLE IF NOT EXISTS `social_youtube` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` text,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.social_youtube: ~1 rows (approximately)
DELETE FROM `social_youtube`;
/*!40000 ALTER TABLE `social_youtube` DISABLE KEYS */;
INSERT INTO `social_youtube` (`id`, `login_id`, `updated`, `active`, `url`, `note`) VALUES
	(00000000001, 1, '2014-11-17 08:15:55', 0, 'http://youtube.com', NULL);
/*!40000 ALTER TABLE `social_youtube` ENABLE KEYS */;


-- Dumping structure for table theroyals.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(80) NOT NULL,
  `salt` varchar(40) NOT NULL DEFAULT 'abc123def',
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `user_code` varchar(7) NOT NULL DEFAULT 'AAA1786',
  `title` varchar(32) NOT NULL DEFAULT '#',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_code` (`user_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.users: ~12 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `user_code`, `title`) VALUES
	(1, _binary 0x3132372E302E302E31, 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1268889823, 1, 'Admin', 'istrator', 'ADMIN', '0', 'AAA1786', '#'),
	(2, _binary 0x3132372E302E302E31, 'amzadmojumder', '$2y$08$yzqXoY2gANMLcc/rhyZ8j.r18.0QFLEWTBqXpAJ9..A6zdB0KjsOK', '', 'amzadfof@gmail.com', NULL, NULL, NULL, NULL, 1405554124, 1405554124, 1, 'Amzad', 'Mojumder', 'Conosurtek Ltd', '07900642131', 'AAA1787', '#'),
	(3, _binary 0x3132372E302E302E31, 'lalitasahu', '$2y$08$8DFKvxXz/nErqwtbq92oGe.rxVMvpJpD8PNARjroKit3hOFc.jyxy', '', 'lalita@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405554460, 1405554460, 1, 'Lalita', 'Sahu', 'All In Epos', '07402950926', 'AAA1788', '#'),
	(4, _binary 0x3132372E302E302E31, 'rizwanur', '$2y$08$8DFKvxXz/nErqwtbq92oGe.rxVMvpJpD8PNARjroKit3hOFc.jyxy', '', 'mrr@conosurtek.net', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'Rezwanur', 'Rahman', 'Cwaiter Ltd', '07900642133', 'AAA1789', '#'),
	(5, _binary 0x3132372E302E302E31, 'tanjumkhan', '$2y$08$A/hjiITaafIz.FEx47lZfOECM5mtbQdxSFzSSYWwdArftTsW8eVay', '', 'tanjum@cwaiter.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'Tanjum', 'Khan', 'Cwaiter Ltd', '07900642133', 'AAA1790', '#'),
	(6, _binary 0x3132372E302E302E31, 'guestuser', '$2y$08$A/hjiITaafIz.FEx47lZfOECM5mtbQdxSFzSSYWwdArftTsW8eVay', '', 'guest@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'Guest', 'User', 'Cwaiter Ltd', '07900642144', 'AAA1791', '#'),
	(7, _binary 0x3132372E302E302E31, 'manager', '$2y$08$A/hjiITaafIz.FEx47lZfOECM5mtbQdxSFzSSYWwdArftTsW8eVay', '', 'namager@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'General', 'Manager', 'Cwaiter Ltd', '07900642155', 'AAA1792', '#'),
	(8, _binary 0x3132372E302E302E31, 'asstmanager', '$2y$08$A/hjiITaafIz.FEx47lZfOECM5mtbQdxSFzSSYWwdArftTsW8eVay', '', 'asstmanager@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'Assistant', 'Manager', 'Cwaiter Ltd', '07900642166', 'AAA1793', '#'),
	(9, _binary 0x3132372E302E302E31, 'admin1', '$2y$08$A/hjiITaafIz.FEx47lZfOECM5mtbQdxSFzSSYWwdArftTsW8eVay', '', 'admin1@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'General', 'admin1', 'Cwaiter Ltd', '07900642177', 'AAA1794', '#'),
	(10, _binary 0x3132372E302E302E31, 'admin2', '$2y$08$A/hjiITaafIz.FEx47lZfOECM5mtbQdxSFzSSYWwdArftTsW8eVay', '', 'admin2@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'General', 'admin2', 'Cwaiter Ltd', '07900642188', 'AAA1795', '#'),
	(11, _binary 0x3132372E302E302E31, 'admin3', '$2y$08$A/hjiITaafIz.FEx47lZfOECM5mtbQdxSFzSSYWwdArftTsW8eVay', '', 'admin3@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'General', 'admin3', 'Cwaiter Ltd', '07900642199', 'AAA1796', '#'),
	(12, _binary 0x3132372E302E302E31, 'admin4', '$2y$08$A/hjiITaafIz.FEx47lZfOECM5mtbQdxSFzSSYWwdArftTsW8eVay', '', 'admin4@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'General', 'admin4', 'Cwaiter Ltd', '07900642200', 'AAA1797', '#');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


-- Dumping structure for table theroyals.users_activity
DROP TABLE IF EXISTS `users_activity`;
CREATE TABLE IF NOT EXISTS `users_activity` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `user_code` varchar(32) NOT NULL DEFAULT 'AAA1786',
  `group_code` varchar(32) NOT NULL DEFAULT 'A',
  `order_avg_user` decimal(20,2) DEFAULT '0.00',
  `order_monthly_avg_user` decimal(20,2) DEFAULT '0.00',
  `order_value_last` decimal(20,2) DEFAULT '0.00',
  `order_placed_last` datetime DEFAULT NULL,
  `newsletter_email` tinyint(1) NOT NULL DEFAULT '1',
  `newsletter_sms` tinyint(1) NOT NULL DEFAULT '1',
  `newsletter_letter` tinyint(1) NOT NULL DEFAULT '1',
  `current_newsletter_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Set 0 to all users, if sent successfully set to 1',
  `send_alert_special_offer` tinyint(1) NOT NULL DEFAULT '1',
  `send_alert_new_products` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_code` (`user_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.users_activity: ~12 rows (approximately)
DELETE FROM `users_activity`;
/*!40000 ALTER TABLE `users_activity` DISABLE KEYS */;
INSERT INTO `users_activity` (`id`, `login_id`, `updated`, `active`, `user_code`, `group_code`, `order_avg_user`, `order_monthly_avg_user`, `order_value_last`, `order_placed_last`, `newsletter_email`, `newsletter_sms`, `newsletter_letter`, `current_newsletter_status`, `send_alert_special_offer`, `send_alert_new_products`) VALUES
	(00000000001, 1, '2014-11-17 08:15:49', 1, 'AAA1786', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000002, 1, '2014-11-17 08:15:49', 1, 'AAA1787', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000003, 1, '2014-11-17 08:15:49', 1, 'AAA1788', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000004, 1, '2014-11-17 08:15:49', 1, 'AAA1789', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000005, 1, '2014-11-17 08:15:49', 1, 'AAA1790', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000006, 1, '2014-11-17 08:15:49', 1, 'AAA1791', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000007, 1, '2014-11-17 08:15:49', 1, 'AAA1792', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000008, 1, '2014-11-17 08:15:49', 1, 'AAA1793', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000009, 1, '2014-11-17 08:15:49', 1, 'AAA1794', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000010, 1, '2014-11-17 08:15:49', 1, 'AAA1795', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000011, 1, '2014-11-17 08:15:49', 1, 'AAA1796', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1),
	(00000000012, 1, '2014-11-17 08:15:49', 1, 'AAA1797', 'A', 0.00, 0.00, 0.00, NULL, 1, 1, 1, 0, 1, 1);
/*!40000 ALTER TABLE `users_activity` ENABLE KEYS */;


-- Dumping structure for table theroyals.users_address
DROP TABLE IF EXISTS `users_address`;
CREATE TABLE IF NOT EXISTS `users_address` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `user_code` varchar(32) NOT NULL DEFAULT 'AAA1786',
  `address1` varchar(256) NOT NULL DEFAULT 'Some Street',
  `address2` varchar(256) DEFAULT NULL,
  `town` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `county` varchar(256) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `postcode` varchar(32) NOT NULL DEFAULT 'AB12 3CD',
  `map_latlng_id` int(11) NOT NULL DEFAULT '1',
  `primary_address` tinyint(1) NOT NULL DEFAULT '0',
  `type_address` varchar(32) NOT NULL DEFAULT 'shipping' COMMENT 'shipping / billing ',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.users_address: ~12 rows (approximately)
DELETE FROM `users_address`;
/*!40000 ALTER TABLE `users_address` DISABLE KEYS */;
INSERT INTO `users_address` (`id`, `login_id`, `updated`, `active`, `user_code`, `address1`, `address2`, `town`, `city`, `county`, `country`, `postcode`, `map_latlng_id`, `primary_address`, `type_address`) VALUES
	(00000000001, 1, '2014-11-17 08:15:49', 1, 'AAA1786', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000002, 1, '2014-11-17 08:15:49', 1, 'AAA1787', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000003, 1, '2014-11-17 08:15:49', 1, 'AAA1788', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000004, 1, '2014-11-17 08:15:49', 1, 'AAA1789', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000005, 1, '2014-11-17 08:15:49', 1, 'AAA1790', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000006, 1, '2014-11-17 08:15:49', 1, 'AAA1791', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000007, 1, '2014-11-17 08:15:49', 1, 'AAA1792', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000008, 1, '2014-11-17 08:15:49', 1, 'AAA1793', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000009, 1, '2014-11-17 08:15:49', 1, 'AAA1794', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000010, 1, '2014-11-17 08:15:49', 1, 'AAA1795', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000011, 1, '2014-11-17 08:15:49', 1, 'AAA1796', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping'),
	(00000000012, 1, '2014-11-17 08:15:49', 1, 'AAA1797', 'Some Street', NULL, NULL, NULL, NULL, NULL, 'AB12 3CD', 1, 1, 'shipping');
/*!40000 ALTER TABLE `users_address` ENABLE KEYS */;


-- Dumping structure for table theroyals.users_config
DROP TABLE IF EXISTS `users_config`;
CREATE TABLE IF NOT EXISTS `users_config` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `require_billing_address` tinyint(1) NOT NULL DEFAULT '0',
  `require_shipping_address` tinyint(1) NOT NULL DEFAULT '1',
  `require_phone_number` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.users_config: ~1 rows (approximately)
DELETE FROM `users_config`;
/*!40000 ALTER TABLE `users_config` DISABLE KEYS */;
INSERT INTO `users_config` (`id`, `login_id`, `updated`, `active`, `require_billing_address`, `require_shipping_address`, `require_phone_number`) VALUES
	(00000000001, 1, '2014-11-17 08:15:48', 1, 0, 1, 1);
/*!40000 ALTER TABLE `users_config` ENABLE KEYS */;


-- Dumping structure for table theroyals.users_groups
DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.users_groups: ~25 rows (approximately)
DELETE FROM `users_groups`;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 2, 1),
	(5, 2, 2),
	(6, 2, 3),
	(7, 3, 1),
	(8, 3, 2),
	(9, 3, 3),
	(10, 4, 1),
	(11, 4, 2),
	(12, 4, 3),
	(13, 5, 1),
	(14, 5, 2),
	(15, 5, 3),
	(16, 6, 2),
	(17, 7, 2),
	(18, 7, 4),
	(19, 7, 5),
	(20, 8, 2),
	(21, 8, 5),
	(22, 9, 2),
	(23, 10, 2),
	(24, 11, 2),
	(25, 12, 2);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;


-- Dumping structure for procedure theroyals.users_group_id_proc
DROP PROCEDURE IF EXISTS `users_group_id_proc`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `users_group_id_proc`(userid int)
BEGIN
                    SELECT group_id  FROM users_group WHERE user_id = userid ;
                END//
DELIMITER ;


-- Dumping structure for table theroyals.users_login
DROP TABLE IF EXISTS `users_login`;
CREATE TABLE IF NOT EXISTS `users_login` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `current_session` tinyint(1) NOT NULL DEFAULT '1',
  `user_code` varchar(32) NOT NULL DEFAULT 'AAA1786',
  `ci_sessions_id` varchar(40) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `logout_time` datetime DEFAULT NULL,
  `browser` varchar(256) DEFAULT NULL,
  `device` varchar(256) DEFAULT NULL,
  `os` varchar(256) DEFAULT NULL,
  `referer` text,
  `agent_string` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_code` (`user_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';

-- Dumping data for table theroyals.users_login: ~0 rows (approximately)
DELETE FROM `users_login`;
/*!40000 ALTER TABLE `users_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_login` ENABLE KEYS */;


-- Dumping structure for view theroyals.users_view
DROP VIEW IF EXISTS `users_view`;
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `users_view` (
	`users_id` MEDIUMINT(8) UNSIGNED NOT NULL,
	`user_code` VARCHAR(7) NOT NULL COLLATE 'utf8_general_ci',
	`username` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`email` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`first_name` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`last_name` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`phone` VARCHAR(20) NULL COLLATE 'utf8_general_ci',
	`group_code` VARCHAR(32) NULL COLLATE 'latin1_swedish_ci',
	`users_address_id` INT(11) UNSIGNED ZEROFILL NULL,
	`postcode` VARCHAR(32) NULL COLLATE 'latin1_swedish_ci',
	`in_group` VARCHAR(32) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for function theroyals.user_create_fun
DROP FUNCTION IF EXISTS `user_create_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `user_create_fun`(
                emailIN VARCHAR(255)
                , fname VARCHAR(255)
                , lname VARCHAR(255)
                , phone VARCHAR(255)
            ) RETURNS varchar(10) CHARSET latin1
BEGIN
                #CALL user_create_fun('m82amjad@yahoo.co.uk', 'Amzad', 'Mojumder', '07900642131');
                DECLARE username VARCHAR(512);
                DECLARE usercode VARCHAR(10);
                DECLARE userid INT(11);
                SET username = ( SELECT CONCAT(LOWER(fname), LOWER(lname)));
                INSERT INTO users (ip_address, username, password, salt, email, first_name, last_name, company, phone, created_on)
                    VALUES ('127.0.0.1', username, 'Helloyou', 'salt', emailIN, fname, fname, 'UNKNOWN', phone, 123456789 );
                SET userid = (SELECT id FROM users WHERE email=emailIN);
                INSERT INTO users_groups (user_id, group_id) VALUES (userid, 2);
                SET usercode = (SELECT user_code FROM users WHERE email=emailIN);
                RETURN usercode;
            END//
DELIMITER ;


-- Dumping structure for function theroyals.user_get_code_fun
DROP FUNCTION IF EXISTS `user_get_code_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `user_get_code_fun`(user_codeIN VARCHAR(10), emailIN VARCHAR(255) ) RETURNS varchar(10) CHARSET latin1
BEGIN
IF ( SELECT STRCMP(user_codeIN, 'AAA1791')) = 1 THEN
RETURN user_code;
END IF;
RETURN (SELECT user_code FROM users WHERE email=emailIN);
END//
DELIMITER ;


-- Dumping structure for function theroyals.user_gruops_fun
DROP FUNCTION IF EXISTS `user_gruops_fun`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `user_gruops_fun`(userId INT(5)) RETURNS varchar(32) CHARSET latin1
BEGIN
RETURN (SELECT GROUP_CONCAT( group_id ) FROM users_groups WHERE user_id=userId);
END//
DELIMITER ;


-- Dumping structure for table theroyals.__sample_db_table
DROP TABLE IF EXISTS `__sample_db_table`;
CREATE TABLE IF NOT EXISTS `__sample_db_table` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table theroyals.__sample_db_table: ~0 rows (approximately)
DELETE FROM `__sample_db_table`;
/*!40000 ALTER TABLE `__sample_db_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `__sample_db_table` ENABLE KEYS */;


-- Dumping structure for trigger theroyals.order_trg_ins_after
DROP TRIGGER IF EXISTS `order_trg_ins_after`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_ALL_TABLES';
DELIMITER //
CREATE TRIGGER `order_trg_ins_after` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
                DECLARE orderStatus char(128);
                SET orderStatus = (SELECT default_order_status FROM orders_config WHERE id=1);
                UPDATE users_activity
                    SET
                        order_placed_last       = NOW(),
                        order_value_last        = NEW.checkout_price
                    WHERE user_code=NEW.user_code;

                INSERT INTO orders_received (order_code, receiving_method )
                    VALUES  (NEW.order_code, 'email'),
                            (NEW.order_code, 'cwhd'),
                            (NEW.order_code, 'cwdp'),
                            (NEW.order_code, 'sms'),
                            (NEW.order_code, 'mdm'),
                            (NEW.order_code, 'clients'),
                            (NEW.order_code, 'twp');

                INSERT INTO orders_note (order_code, status, note, user_code, customer_can_view, send_email, send_sms, response_required)
                    VALUES (NEW.order_code, orderStatus, 'Order Placed', NEW.user_code, 1, 1, 0, 0);
            END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger theroyals.order_trg_ins_before
DROP TRIGGER IF EXISTS `order_trg_ins_before`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_ALL_TABLES';
DELIMITER //
CREATE TRIGGER `order_trg_ins_before` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
              # Declarations ...
                DECLARE usercode char(10);
                DECLARE username char(255);
                DECLARE guest_user int;
                DECLARE user_id int;
                DECLARE last_code char(10);

              # Get Order Code ...
                SET last_code =  (SELECT order_code FROM orders ORDER BY id DESC LIMIT 0, 1);
                IF last_code IS NULL THEN
                  SET NEW.order_code = 'AAA1786';
                ELSE
                  SET NEW.order_code = GetUnID(last_code);
                END IF;

            # If customer is guest then register customer and use user code etc.
                SET usercode        = 'AAA1791';
                SET username        = ( SELECT CONCAT(NEW.fname, NEW.lname));
                SET guest_user      = ( SELECT STRCMP(NEW.user_code, usercode));

                IF guest_user = 0  THEN
                    SET usercode = (SELECT user_code FROM users WHERE email=NEW.email);
                    IF usercode IS NULL THEN
                        INSERT INTO users (ip_address, username, password, salt, email, first_name, last_name, company, phone, created_on)
                                VALUES (NEW.ip_address, username, 'Helloyou', 'salt', NEW.email, NEW.fname, NEW.lname, 'UNKNOWN', NEW.phone, NEW.requested_time );
                        SET user_id = (SELECT id FROM users WHERE email=NEW.email);
                        INSERT INTO users_groups (user_id, group_id) VALUES (user_id, 2);
                        SET usercode = (SELECT user_code FROM users WHERE email=NEW.email);
                    END IF;
                END IF;

                SET NEW.user_code = usercode;
                SET NEW.customer_group = (SELECT group_code FROM users_activity WHERE user_code = usercode );
            END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger theroyals.users_activity_trg_upd_before
DROP TRIGGER IF EXISTS `users_activity_trg_upd_before`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_ALL_TABLES';
DELIMITER //
CREATE TRIGGER `users_activity_trg_upd_before` BEFORE UPDATE ON `users_activity` FOR EACH ROW BEGIN
                DECLARE intervalVal decimal(7,2);
                DECLARE monthlyAvg decimal(7,2);
                DECLARE monthlyAvgUser decimal(7,2);
                SET monthlyAvg      = order_avg_monthly_fun();
                SET intervalVal     = (monthlyAvg*2)/3;
                SET monthlyAvgUser  = (SELECT order_monthly_avg_user FROM users_activity WHERE user_code = NEW.user_code);

                SET NEW.group_code              = order_user_group_fun(monthlyAvg, monthlyAvgUser);
                SET NEW.order_avg_user          = order_avg_user_fun(NEW.user_code);
                SET NEW.order_monthly_avg_user  = order_monthly_avg_user_fun(NEW.user_code);

                UPDATE orders_config
                    SET
                        group_interval      = intervalVal,
                        order_avg           = order_avg_bus_fun(),
                        order_avg_monthly   = monthlyAvg
                    WHERE id=1;
            END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger theroyals.users_address_tgr_ins_before
DROP TRIGGER IF EXISTS `users_address_tgr_ins_before`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_ALL_TABLES';
DELIMITER //
CREATE TRIGGER `users_address_tgr_ins_before` BEFORE INSERT ON `users_address` FOR EACH ROW BEGIN
                #UPDATE users_address
                    #SET NEW.primary_address = 0
                    #WHERE user_code = NEW.user_code;

                SET NEW.primary_address = 1;
            END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger theroyals.users_login_tgr_ins_before
DROP TRIGGER IF EXISTS `users_login_tgr_ins_before`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_ALL_TABLES';
DELIMITER //
CREATE TRIGGER `users_login_tgr_ins_before` BEFORE INSERT ON `users_login` FOR EACH ROW BEGIN
                #UPDATE users_login
                    #SET NEW.current_session = 0
                    #WHERE user_code = NEW.user_code;

                SET NEW.current_session = 1;
                SET NEW.login_time=NOW();
            END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for trigger theroyals.users_tgr_ins_before
DROP TRIGGER IF EXISTS `users_tgr_ins_before`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_ALL_TABLES';
DELIMITER //
CREATE TRIGGER `users_tgr_ins_before` BEFORE INSERT ON `users` FOR EACH ROW BEGIN

                DECLARE last_code char(10);
                SET last_code =  (SELECT user_code FROM users ORDER BY id DESC LIMIT 0, 1);

                IF last_code IS NULL THEN
                  SET NEW.user_code = 'AAA1786';
                ELSE
                  SET NEW.user_code = GetUnID(last_code);
                END IF;

                  INSERT INTO users_activity (user_code) VALUES (NEW.user_code);
                  INSERT INTO users_address (user_code, primary_address, active ) VALUES (NEW.user_code, 1, 1);
            END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;


-- Dumping structure for view theroyals.cms_nav_view
DROP VIEW IF EXISTS `cms_nav_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `cms_nav_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cms_nav_view` AS select `cms_nav`.`id` AS `cms_nav_id`,`cms_nav`.`active` AS `cms_nav_active`,`cms_nav`.`sn` AS `cms_nav_sn`,`cms_nav`.`alias` AS `alias`,`cms_nav`.`nav_name` AS `nav_name`,`cms_nav`.`title` AS `title`,`cms_nav_url`.`id` AS `cms_nav_url_id`,`cms_nav_url`.`active` AS `cms_nav_url_active`,`cms_nav_url`.`sn` AS `cms_nav_url_sn`,`cms_nav_url`.`parent` AS `parent`,`cms_nav_url`.`nav_url_name` AS `nav_url_name`,`cms_nav_url`.`href` AS `href`,`cms_nav_url`.`image_src` AS `image_src` from (`cms_nav_url` left join `cms_nav` on((`cms_nav_url`.`cms_nav_id` = `cms_nav`.`id`))) where (`cms_nav_url`.`active` = 1) order by `cms_nav_url`.`sn`;


-- Dumping structure for view theroyals.cw_billing_view
DROP VIEW IF EXISTS `cw_billing_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `cw_billing_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cw_billing_view` AS select `orders`.`requested_at` AS `requested_at`,count(0) AS `order_processed`,count(0) AS `order_cancelled`,count(0) AS `order_successful`,sum(`orders`.`checkout_price`) AS `order_processed_amount`,sum(`orders`.`checkout_price`) AS `order_cancelled_amount`,sum(`orders`.`checkout_price`) AS `order_successful_amount`,(select `cw_billing_config`.`cw_commision_takeaway` from `cw_billing_config` where (`cw_billing_config`.`id` = 1)) AS `cw_commision`,((sum(`orders`.`checkout_price`) * (select `cw_billing_config`.`cw_commision_takeaway` from `cw_billing_config` where (`cw_billing_config`.`id` = 1))) / 100) AS `cw_commision_amount`,sum(`orders`.`checkout_price`) AS `card_sales`,sum(`orders`.`checkout_price`) AS `paypal_sales`,sum(`orders`.`checkout_price`) AS `cash_sales`,sum(`orders`.`checkout_price`) AS `paypal_fee`,sum(`orders`.`checkout_price`) AS `paypal_commision`,sum(`orders`.`checkout_price`) AS `paypal_net_earning`,sum(`orders`.`transaction_fee`) AS `total_fee_paid` from `orders` group by year(`orders`.`requested_at`),month(`orders`.`requested_at`) order by year(`orders`.`requested_at`) desc,month(`orders`.`requested_at`) desc;


-- Dumping structure for view theroyals.orders_note_view
DROP VIEW IF EXISTS `orders_note_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `orders_note_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_note_view` AS select `orders_note`.`id` AS `id`,`orders_note`.`login_id` AS `login_id`,`orders_note`.`updated` AS `updated`,`orders_note`.`active` AS `active`,`orders_note`.`order_code` AS `order_code`,`orders_note`.`status` AS `status`,`orders_note`.`note` AS `note`,`orders_note`.`user_code` AS `user_code`,`orders_note`.`customer_can_view` AS `customer_can_view`,`orders_note`.`send_email` AS `send_email`,`orders_note`.`send_sms` AS `send_sms`,`orders_note`.`response_required` AS `response_required`,`users`.`first_name` AS `fname`,`users`.`last_name` AS `lname` from (`orders_note` left join `users` on((convert(`orders_note`.`user_code` using utf8) = `users`.`user_code`))) where (`orders_note`.`active` = 1) order by `orders_note`.`id`;


-- Dumping structure for view theroyals.orders_received_cwdp_view
DROP VIEW IF EXISTS `orders_received_cwdp_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `orders_received_cwdp_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_received_cwdp_view` AS select `orders_received`.`id` AS `id`,`orders_received`.`order_code` AS `order_code`,`orders_received`.`receiving_method` AS `receiving_method`,`orders_received`.`success` AS `success`,`orders_received`.`success_time` AS `success_time` from `orders_received` where ((`orders_received`.`success` = 0) and (`orders_received`.`receiving_method` = 'cwdp')) order by `orders_received`.`id`;


-- Dumping structure for view theroyals.orders_received_view
DROP VIEW IF EXISTS `orders_received_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `orders_received_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_received_view` AS select `orders_received`.`id` AS `id`,`orders_received`.`order_code` AS `order_code`,`orders_received`.`receiving_method` AS `receiving_method`,`orders_received`.`success` AS `success`,`orders_received`.`success_time` AS `success_time` from `orders_received` where (`orders_received`.`success` = 0) order by `orders_received`.`id`;


-- Dumping structure for view theroyals.orders_rec_month_current_view
DROP VIEW IF EXISTS `orders_rec_month_current_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `orders_rec_month_current_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_rec_month_current_view` AS select `orders`.`id` AS `id`,`orders`.`active` AS `active`,`orders`.`order_code` AS `order_code`,`orders`.`order_id_temp` AS `order_id_temp`,`orders`.`user_code` AS `user_code`,`orders`.`fname` AS `fname`,`orders`.`lname` AS `lname`,`orders`.`email` AS `email`,`orders`.`phone` AS `phone`,`orders`.`postcode` AS `postcode`,`orders`.`placed_at` AS `placed_at`,`orders`.`requested_at` AS `requested_at`,`orders`.`receiving` AS `receiving`,`orders`.`pay_method` AS `pay_method`,`orders`.`checkout_price` AS `checkout_price`,`orders`.`vip` AS `vip`,`orders`.`customer_group` AS `customer_group`,`order_status_fun`(`orders`.`order_code`) AS `status` from `orders` where (extract(year_month from `orders`.`requested_at`) = extract(year_month from now())) order by `orders`.`id`;


-- Dumping structure for view theroyals.orders_rec_month_previous_view
DROP VIEW IF EXISTS `orders_rec_month_previous_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `orders_rec_month_previous_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_rec_month_previous_view` AS select `orders`.`id` AS `id`,`orders`.`active` AS `active`,`orders`.`order_code` AS `order_code`,`orders`.`order_id_temp` AS `order_id_temp`,`orders`.`user_code` AS `user_code`,`orders`.`fname` AS `fname`,`orders`.`lname` AS `lname`,`orders`.`email` AS `email`,`orders`.`phone` AS `phone`,`orders`.`postcode` AS `postcode`,`orders`.`placed_at` AS `placed_at`,`orders`.`requested_at` AS `requested_at`,`orders`.`receiving` AS `receiving`,`orders`.`pay_method` AS `pay_method`,`orders`.`checkout_price` AS `checkout_price`,`orders`.`vip` AS `vip`,`orders`.`customer_group` AS `customer_group`,`order_status_fun`(`orders`.`order_code`) AS `status` from `orders` where (extract(year_month from `orders`.`requested_at`) = extract(year_month from (select (now() + interval -(1) month)))) order by `orders`.`id`;


-- Dumping structure for view theroyals.orders_rec_today_view
DROP VIEW IF EXISTS `orders_rec_today_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `orders_rec_today_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_rec_today_view` AS select `orders`.`id` AS `id`,`orders`.`active` AS `active`,`orders`.`order_code` AS `order_code`,`orders`.`order_id_temp` AS `order_id_temp`,`orders`.`user_code` AS `user_code`,`orders`.`fname` AS `fname`,`orders`.`lname` AS `lname`,`orders`.`email` AS `email`,`orders`.`phone` AS `phone`,`orders`.`postcode` AS `postcode`,`orders`.`placed_at` AS `placed_at`,`orders`.`requested_at` AS `requested_at`,`orders`.`receiving` AS `receiving`,`orders`.`pay_method` AS `pay_method`,`orders`.`checkout_price` AS `checkout_price`,`orders`.`vip` AS `vip`,`orders`.`customer_group` AS `customer_group`,`order_status_fun`(`orders`.`order_code`) AS `status` from `orders` where (cast(`orders`.`requested_at` as date) = curdate()) order by `orders`.`id`;


-- Dumping structure for view theroyals.orders_view
DROP VIEW IF EXISTS `orders_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `orders_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orders_view` AS select `orders`.`id` AS `id`,`orders`.`active` AS `active`,`orders`.`order_code` AS `order_code`,`orders`.`order_id_temp` AS `order_id_temp`,`orders`.`user_code` AS `user_code`,`orders`.`fname` AS `fname`,`orders`.`lname` AS `lname`,`orders`.`email` AS `email`,`orders`.`phone` AS `phone`,`orders`.`postcode` AS `postcode`,`orders`.`placed_at` AS `placed_at`,`orders`.`requested_at` AS `requested_at`,`orders`.`receiving` AS `receiving`,`orders`.`pay_method` AS `pay_method`,`orders`.`checkout_price` AS `checkout_price`,`orders`.`vip` AS `vip`,`orders`.`customer_group` AS `customer_group`,`order_status_fun`(`orders`.`order_code`) AS `status` from `orders` where (`orders`.`active` = 1) order by `orders`.`id`;


-- Dumping structure for view theroyals.prod_meat_view
DROP VIEW IF EXISTS `prod_meat_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `prod_meat_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prod_meat_view` AS select `prod_meat_price`.`id` AS `prod_meat_price_id`,`prod_meat_price`.`active` AS `prod_meat_price_active`,`prod_meat_price`.`sn` AS `prod_meat_price_sn`,`prod_meat_price`.`prod_list_id` AS `prod_list_id`,`prod_meat_price`.`price` AS `price`,`prod_meats`.`id` AS `prod_meats_id`,`prod_meats`.`active` AS `prod_meats_active`,`prod_meats`.`title` AS `meats_title`,`prod_meats`.`short_name` AS `short_name`,`prod_meats`.`icon` AS `icon`,`prod_list`.`prod_category_id` AS `prod_category_id`,`prod_user_view_fun`(`prod_meats`.`title`,`prod_meat_price`.`price`) AS `user_view` from ((`prod_meat_price` left join `prod_meats` on((`prod_meat_price`.`prod_meats_id` = `prod_meats`.`id`))) left join `prod_list` on((`prod_list`.`id` = `prod_meat_price`.`prod_list_id`))) order by `prod_meat_price`.`sn`;


-- Dumping structure for view theroyals.prod_options_price_view
DROP VIEW IF EXISTS `prod_options_price_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `prod_options_price_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prod_options_price_view` AS select `prod_options_price`.`id` AS `prod_options_price_id`,`prod_options_price`.`active` AS `prod_options_price_active`,`prod_options_price`.`sn` AS `prod_options_price_sn`,`prod_options_price`.`group_no` AS `group_no`,`prod_options_price`.`prod_list_id` AS `prod_list_id`,`prod_options_price`.`price` AS `price`,`prod_options_price`.`prod_options_id` AS `prod_options_id`,`prod_options`.`active` AS `prod_options_active`,`prod_options`.`name_option` AS `name_option`,`prod_list`.`prod_category_id` AS `prod_category_id`,`prod_user_view_fun`(`prod_options`.`name_option`,`prod_options_price`.`price`) AS `user_view` from (`prod_list` left join (`prod_options` left join `prod_options_price` on((`prod_options_price`.`prod_options_id` = `prod_options`.`id`))) on((`prod_list`.`id` = `prod_options_price`.`prod_list_id`))) where (`prod_options_price`.`active` = 1) order by `prod_options_price`.`sn`;


-- Dumping structure for view theroyals.services_delivery_charge_view
DROP VIEW IF EXISTS `services_delivery_charge_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `services_delivery_charge_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `services_delivery_charge_view` AS select (`services_delivery_charge`.`distance_from` * 5280) AS `distance_from`,(`services_delivery_charge`.`distance_to` * 5280) AS `distance_to`,`services_delivery_charge`.`charge` AS `charge` from `services_delivery_charge` where (`services_delivery_charge`.`active` = 1) order by (`services_delivery_charge`.`distance_from` * 5280);


-- Dumping structure for view theroyals.users_view
DROP VIEW IF EXISTS `users_view`;
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `users_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `users_view` AS select `users`.`id` AS `users_id`,`users`.`user_code` AS `user_code`,`users`.`username` AS `username`,`users`.`email` AS `email`,`users`.`first_name` AS `first_name`,`users`.`last_name` AS `last_name`,`users`.`phone` AS `phone`,`users_activity`.`group_code` AS `group_code`,`users_address`.`id` AS `users_address_id`,`users_address`.`postcode` AS `postcode`,`user_gruops_fun`(`users`.`id`) AS `in_group` from ((`users` left join `users_activity` on((convert(`users_activity`.`user_code` using utf8) = `users`.`user_code`))) left join `users_address` on((convert(`users_address`.`user_code` using utf8) = `users`.`user_code`))) where (`users_address`.`primary_address` = 1);
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

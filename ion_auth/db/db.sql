-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: theroyals
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.12.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `__sample_db_table`
--

DROP TABLE IF EXISTS `__sample_db_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__sample_db_table` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__sample_db_table`
--

LOCK TABLES `__sample_db_table` WRITE;
/*!40000 ALTER TABLE `__sample_db_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `__sample_db_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ci_sessions`
--

DROP TABLE IF EXISTS `ci_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ci_sessions`
--

LOCK TABLES `ci_sessions` WRITE;
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` VALUES ('ab97b601ddb0d9be2338c4aebe2b2044','127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:32.0) Gecko/20100101 Firefox/32.0',1412145383,'a:5:{s:9:\"user_data\";s:0:\"\";s:9:\"receiving\";s:8:\"delivery\";s:9:\"payMethod\";s:4:\"cash\";s:3:\"day\";i:1412145383;s:4:\"time\";s:3:\"000\";}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
INSERT INTO `cms_article` VALUES (00000000001,1,'2014-10-01 06:36:25',1,1,'about_us','Our cooking style is unique',NULL,'Our cooking style is unique and our chefs always make sure that your meal at Indian Ocean ... ','#','/takeaway/menu','/img/default/articles/about_us.jpg','/takeaway/menu','Order Online','/takeaway/menu','#');
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blog`
--

DROP TABLE IF EXISTS `cms_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blog` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blog`
--

LOCK TABLES `cms_blog` WRITE;
/*!40000 ALTER TABLE `cms_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_blog_note`
--

DROP TABLE IF EXISTS `cms_blog_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_blog_note` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_blog_note`
--

LOCK TABLES `cms_blog_note` WRITE;
/*!40000 ALTER TABLE `cms_blog_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_blog_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_email_template`
--

DROP TABLE IF EXISTS `cms_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_email_template` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `alias` varchar(256) NOT NULL,
  `body` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_email_template`
--

LOCK TABLES `cms_email_template` WRITE;
/*!40000 ALTER TABLE `cms_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_gallery`
--

DROP TABLE IF EXISTS `cms_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_gallery` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_gallery`
--

LOCK TABLES `cms_gallery` WRITE;
/*!40000 ALTER TABLE `cms_gallery` DISABLE KEYS */;
INSERT INTO `cms_gallery` VALUES (00000000001,1,'2014-10-01 06:36:27',1,1,'new','New',NULL,'img/default/gallery','base/gallery01');
/*!40000 ALTER TABLE `cms_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_gallery_images`
--

DROP TABLE IF EXISTS `cms_gallery_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_gallery_images` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_gallery_images`
--

LOCK TABLES `cms_gallery_images` WRITE;
/*!40000 ALTER TABLE `cms_gallery_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_gallery_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_highlights`
--

DROP TABLE IF EXISTS `cms_highlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_highlights` (
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_highlights`
--

LOCK TABLES `cms_highlights` WRITE;
/*!40000 ALTER TABLE `cms_highlights` DISABLE KEYS */;
INSERT INTO `cms_highlights` VALUES (00000000001,1,'2014-10-01 06:36:26',1,1,'welcome','about/home','special','Special Offers !!','#','#','#',NULL,NULL,'/img/default/highlights/welcome01.png','/takeaway/menu','Order Online','/takeaway/menu'),(00000000002,1,'2014-10-01 06:36:26',1,1,'welcome','about/home','special','Special Offers !!','#','#','#',NULL,NULL,'/img/default/highlights/welcome02.png','/takeaway/menu','Order Online','/takeaway/menu'),(00000000003,1,'2014-10-01 06:36:26',1,1,'welcome','about/home','special','Special Offers !!','#','#','#',NULL,NULL,'/img/default/highlights/welcome03.png','/takeaway/menu','Order Online','/takeaway/menu'),(00000000004,1,'2014-10-01 06:36:26',1,1,'welcome','about/home','mid_text','Special Offers !!','$business->business_name‚ menu is meticulously designed to suit the needs of every customer.','#','#',NULL,NULL,'/img/default/highlights/welcome01.png','/takeaway/menu','Order Online','/takeaway/menu'),(00000000005,1,'2014-10-01 06:36:26',1,1,'welcome','about/main','our_restaurant','Special Offers !!','OUR RESTAURANT','#','#',NULL,'Our dishes are freshly prepared in-house with our special \'Indian Ocean recipe\'&#44; which excludes all artificial colourings and preservatives. And all our dishes are served steaming hot into a special stay fresh packaging&#44; ready to collect or be delivered to your door step.<a href=\'about/us\'> Read More</a>','/img/default/highlights/welcome01.png','/takeaway/menu','Order Online','/takeaway/menu'),(00000000006,1,'2014-10-01 06:36:26',1,1,'welcome','about/main','our_food','Special Offers !!','OUR FOOD','#','#',NULL,'Eating out is more than just food. It is about atmosphere&#44; about ambience&#44; but above all taste!We have installed some of India&#39;s history&#44; culture and beliefs into creating the perfect authentic feel for you. If you want to create your own dish&#44; a little hotter&#44; a little creamier?  <a href=\'about/us\'> Read More</a>','/img/default/highlights/welcome01.png','/takeaway/menu','Order Online','/takeaway/menu'),(00000000007,1,'2014-10-01 06:36:26',1,1,'welcome','about/main','top_banner','Special Offers !!','Delivered Stright To Your Door','#','#',NULL,NULL,'/img/default/highlights/welcome01.png','/takeaway/menu','Order Online','/takeaway/menu'),(00000000008,1,'2014-10-01 06:36:26',1,1,'us','about/us','side','Special Offers !!','Starter','#','#',NULL,NULL,'/img/default/highlights/about_us_side01.png','/takeaway/menu','Order Online','/takeaway/menu'),(00000000009,1,'2014-10-01 06:36:26',1,1,'us','about/us','side','Special Offers !!','Main Dishes','#','#',NULL,NULL,'/img/default/highlights/about_us_side02.png','/takeaway/menu','Order Online','/takeaway/menu'),(00000000010,1,'2014-10-01 06:36:26',1,1,'us','about/us','side','Special Offers !!','Side Orders','#','#',NULL,NULL,'/img/default/highlights/about_us_side03.png','/takeaway/menu','Order Online','/takeaway/menu');
/*!40000 ALTER TABLE `cms_highlights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_nav`
--

DROP TABLE IF EXISTS `cms_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_nav` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_nav`
--

LOCK TABLES `cms_nav` WRITE;
/*!40000 ALTER TABLE `cms_nav` DISABLE KEYS */;
INSERT INTO `cms_nav` VALUES (00000000001,1,'2014-09-16 13:17:34',1,1,'menu_top','Menu Top',NULL),(00000000002,1,'2014-09-16 13:17:14',1,1,'about_top','About Top',NULL),(00000000003,1,'2014-09-16 13:19:25',1,1,'category_footer','Category Footer',NULL),(00000000004,1,'2014-09-16 13:20:06',1,1,'category_addon','Category Add On',NULL);
/*!40000 ALTER TABLE `cms_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_nav_site_urls`
--

DROP TABLE IF EXISTS `cms_nav_site_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_nav_site_urls` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `href` varchar(2048) NOT NULL DEFAULT 'new',
  `title` varchar(2048) NOT NULL DEFAULT 'Official Site | $business->business_name',
  `description` varchar(2048) NOT NULL DEFAULT '$system->meta_description',
  `keyword` varchar(2048) NOT NULL DEFAULT '$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town',
  `favicon` varchar(2048) NOT NULL DEFAULT 'img/struct/favicon.ico',
  `parent` int(1) NOT NULL DEFAULT '0' COMMENT 'For SiteMap.html',
  `sitemap_html_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'For SiteMap.html Show or not',
  `changefreq` varchar(32) NOT NULL DEFAULT 'weekly',
  `priority` varchar(32) NOT NULL DEFAULT '0.08',
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_nav_site_urls`
--

LOCK TABLES `cms_nav_site_urls` WRITE;
/*!40000 ALTER TABLE `cms_nav_site_urls` DISABLE KEYS */;
INSERT INTO `cms_nav_site_urls` VALUES (00000000001,1,'2014-09-18 10:35:38',1,'','Official Site | Welcome To $business->business_name','$system->meta_description','$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL),(00000000002,1,'2014-09-18 10:35:38',1,'index.php','Official Site | Welcome To $business->business_name','$system->meta_description','$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL),(00000000003,1,'2014-09-18 10:35:38',1,'about/home','Official Site | Welcome To $business->business_name','$system->meta_description','$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL),(00000000004,1,'2014-09-18 10:35:40',1,'takeaway/menu','$category->title | Menu | $business->business_name','$system->meta_description','$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL),(00000000005,1,'2014-09-18 10:35:41',1,'about/us','About Us | $business->business_name','$system->meta_description','$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL),(00000000006,1,'2014-09-18 10:35:43',1,'about/gallery','Our Gallery | $business->business_name','$system->meta_description','$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL),(00000000007,1,'2014-09-18 10:35:44',1,'about/contact','Contact Us | $business->business_name','$system->meta_description','$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL),(00000000008,1,'2014-09-18 10:35:45',1,'about/specialoffers','Special Offers | $business->business_name','$system->meta_description','$system->meta_keywords Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL),(00000000009,1,'2014-09-18 10:35:53',1,'takeaway/menu/2','$category->title | Menu | $business->business_name','$system->meta_description','$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL),(00000000010,1,'2014-09-18 10:37:15',1,'takeaway/menu/3','$category->title | Menu | $business->business_name','$system->meta_description','$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL),(00000000011,1,'2014-09-18 10:37:15',1,'takeaway/order_details','Order Details Input | $business->business_name','$system->meta_description','$system->meta_keywords, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, $business->town','img/struct/favicon.ico',0,1,'weekly','0.08',NULL);
/*!40000 ALTER TABLE `cms_nav_site_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_nav_url`
--

DROP TABLE IF EXISTS `cms_nav_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_nav_url` (
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_nav_url`
--

LOCK TABLES `cms_nav_url` WRITE;
/*!40000 ALTER TABLE `cms_nav_url` DISABLE KEYS */;
INSERT INTO `cms_nav_url` VALUES (00000000001,1,'2014-09-16 13:21:52',1,'Home',1,0,1,'about/home',NULL),(00000000002,1,'2014-09-16 13:23:42',1,'Menu',2,0,1,'takeaway/menu',NULL),(00000000003,1,'2014-09-16 13:50:17',1,'About',3,0,1,'about/us',NULL),(00000000004,1,'2014-09-16 13:50:17',1,'Gallery',4,0,1,'about/gallery',NULL),(00000000005,1,'2014-09-16 13:50:17',1,'Contact',5,0,1,'about/contact',NULL),(00000000006,1,'2014-09-16 13:50:17',1,'HOME',1,0,2,'about/home',NULL),(00000000007,1,'2014-09-16 13:50:17',1,'ABOUT',2,0,2,'about/us',NULL),(00000000008,1,'2014-09-16 13:50:17',1,'MENU',3,0,2,'takeaway/menu',NULL),(00000000009,1,'2014-09-16 13:50:17',1,'GALLERY',4,0,2,'about/gallery',NULL),(00000000010,1,'2014-09-16 13:50:17',1,'CONTACT',5,0,2,'about/contact',NULL),(00000000011,1,'2014-09-16 13:50:17',1,'Starter',1,0,3,'takeaway/menu/2',NULL),(00000000012,1,'2014-09-16 13:50:17',1,'Tandoori Dishes',2,0,3,'takeaway/menu/3',NULL),(00000000013,1,'2014-09-16 13:50:17',1,'Chef Specials',3,0,3,'takeaway/menu/2',NULL),(00000000014,1,'2014-09-16 13:50:17',1,'Classic Dishes',4,0,3,'takeaway/menu/2',NULL),(00000000015,1,'2014-09-16 13:50:17',1,'Side Orders',5,0,3,'takeaway/menu/2',NULL),(00000000016,1,'2014-09-16 13:50:17',1,'Sundries',5,0,3,'takeaway/menu/2',NULL),(00000000017,1,'2014-09-18 20:50:32',1,'Meal Deals',1,0,4,'takeaway/menu/2',NULL),(00000000018,1,'2014-09-16 13:50:17',1,'Meal Deals',1,1,1,'takeaway/menu/2',NULL),(00000000019,1,'2014-09-18 22:16:11',1,'Starter',1,8,2,'takeaway/menu/2',NULL),(00000000020,1,'2014-09-18 22:16:25',1,'Chef Special',2,8,2,'takeaway/menu/3',NULL),(00000000021,1,'2014-09-18 22:16:39',1,'Side Oders',3,8,2,'takeaway/menu/4',NULL),(00000000022,1,'2014-09-18 22:19:57',1,'Starter',1,2,1,'takeaway/menu/2',NULL),(00000000023,1,'2014-09-18 22:20:18',1,'Chef Special',2,2,1,'takeaway/menu/3',NULL),(00000000024,1,'2014-09-18 22:24:47',1,'Side Orders',3,2,1,'takeaway/menu/4',NULL);
/*!40000 ALTER TABLE `cms_nav_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `cms_nav_view`
--

DROP TABLE IF EXISTS `cms_nav_view`;
/*!50001 DROP VIEW IF EXISTS `cms_nav_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `cms_nav_view` (
  `cms_nav_id` tinyint NOT NULL,
  `cms_nav_active` tinyint NOT NULL,
  `cms_nav_sn` tinyint NOT NULL,
  `alias` tinyint NOT NULL,
  `nav_name` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `cms_nav_url_id` tinyint NOT NULL,
  `cms_nav_url_active` tinyint NOT NULL,
  `cms_nav_url_sn` tinyint NOT NULL,
  `parent` tinyint NOT NULL,
  `nav_url_name` tinyint NOT NULL,
  `href` tinyint NOT NULL,
  `image_src` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `cms_page_contact`
--

DROP TABLE IF EXISTS `cms_page_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_page_contact` (
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_page_contact`
--

LOCK TABLES `cms_page_contact` WRITE;
/*!40000 ALTER TABLE `cms_page_contact` DISABLE KEYS */;
INSERT INTO `cms_page_contact` VALUES (00000000001,1,'2014-10-01 06:36:25',0,'#','51.507351','-0.127758','#',1,16,'100%','300px','about/contact',0,0,'#','#');
/*!40000 ALTER TABLE `cms_page_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_settings_business`
--

DROP TABLE IF EXISTS `cms_settings_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_settings_business` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `business_code` varchar(256) NOT NULL DEFAULT 'New',
  `business_name` varchar(256) NOT NULL DEFAULT 'New',
  `logo` varchar(2048) NOT NULL DEFAULT '/img/default/struct/logo.png',
  `business_slogan` varchar(1024) NOT NULL DEFAULT 'Best food in town',
  `email_customer_service` varchar(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_operation` varchar(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_billing` varchar(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_order` varchar(256) NOT NULL DEFAULT 'orderstakeaway@gmail.com',
  `email_order_support` varchar(256) DEFAULT 'orders@allinepos.co.uk',
  `phone1` varchar(256) NOT NULL DEFAULT '02086600022',
  `phone2` varchar(256) DEFAULT '02086600044',
  `phone3` varchar(256) DEFAULT '02086600066',
  `fax` varchar(256) DEFAULT '02086600088',
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
  `manager_phone` varchar(256) DEFAULT '0123456789',
  `established` varchar(256) DEFAULT '1900',
  `pizza_supported` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_settings_business`
--

LOCK TABLES `cms_settings_business` WRITE;
/*!40000 ALTER TABLE `cms_settings_business` DISABLE KEYS */;
INSERT INTO `cms_settings_business` VALUES (00000000001,1,'2014-10-01 06:36:24',0,'New','New','/img/default/struct/logo.png','Best food in town','orderstakeaway@gmail.com','orderstakeaway@gmail.com','orderstakeaway@gmail.com','orderstakeaway@gmail.com','orders@allinepos.co.uk','02086600022','02086600044','02086600066','02086600088','13','Brighton Road',NULL,'Purley','London','London','London','GU22 5AA',NULL,'New','http://al-aminrestaurant.co.uk',0,'Lalita','Sahu','0123456789','1900',0);
/*!40000 ALTER TABLE `cms_settings_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_settings_email`
--

DROP TABLE IF EXISTS `cms_settings_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_settings_email` (
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
  `send_from` varchar(256) NOT NULL DEFAULT 'All In ePOS',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_settings_email`
--

LOCK TABLES `cms_settings_email` WRITE;
/*!40000 ALTER TABLE `cms_settings_email` DISABLE KEYS */;
INSERT INTO `cms_settings_email` VALUES (00000000001,1,'2014-10-01 06:36:24',1,'system@takeawayguru.com','system+takeawayguru.com','system789@!','109.203.102.20','25','SMTP','html','All In ePOS');
/*!40000 ALTER TABLE `cms_settings_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_settings_system`
--

DROP TABLE IF EXISTS `cms_settings_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_settings_system` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `head_title` varchar(512) DEFAULT 'Official Site - Green Chilli Restaurant :: Finest Indian Cuisine',
  `meta_description` varchar(2048) NOT NULL DEFAULT 'If you looking for healthy freshly home made food, this is the right place for you. Please give us an opportunity to serve you your favourate meal.',
  `meta_keywords` varchar(2048) NOT NULL DEFAULT 'Indian Food, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food',
  `favicon` varchar(2048) DEFAULT 'http://conosurtek.co.uk/aj/images/conosurTek/favicon.ico',
  `head_others` text,
  `copy_right` varchar(512) DEFAULT 'All In ePOS',
  `copy_right_url` varchar(512) DEFAULT 'http://allinepos.co.uk',
  `currency_code` varchar(32) DEFAULT '826',
  `currency_symbol` varchar(32) DEFAULT '&pound;',
  `time_zone` varchar(32) DEFAULT '0',
  `summer_time` varchar(32) DEFAULT 'BST',
  `site_live` tinyint(1) NOT NULL DEFAULT '0',
  `maintenance_note` text,
  `default_load` varchar(256) DEFAULT 'about/home',
  `default_load_login` varchar(256) DEFAULT 'about/home',
  `debug` int(1) NOT NULL DEFAULT '1',
  `debug_global` int(1) NOT NULL DEFAULT '1',
  `sitemap_xml` tinyint(1) NOT NULL DEFAULT '1',
  `sitemap_html` tinyint(1) NOT NULL DEFAULT '1',
  `img_copy_url` varchar(2048) DEFAULT 'http://allinepos.co.uk/clientsImg/',
  `robots_content` text,
  `version_software` varchar(32) DEFAULT '060209',
  `version_database` varchar(32) DEFAULT '023',
  `template_id` varchar(32) DEFAULT 'default',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_settings_system`
--

LOCK TABLES `cms_settings_system` WRITE;
/*!40000 ALTER TABLE `cms_settings_system` DISABLE KEYS */;
INSERT INTO `cms_settings_system` VALUES (00000000001,1,'2014-10-01 06:36:24',0,'Official Site - Green Chilli Restaurant :: Finest Indian Cuisine','If you looking for healthy freshly home made food, this is the right place for you. Please give us an opportunity to serve you your favourate meal.','Indian Food, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food','http://conosurtek.co.uk/aj/images/conosurTek/favicon.ico',NULL,'All In ePOS','http://allinepos.co.uk','826','&pound;','0','BST',0,'This Site Currently Down For Maintenance','about/home','about/home',1,1,1,1,'http://allinepos.co.uk/clientsImg/',NULL,'060209','023','default');
/*!40000 ALTER TABLE `cms_settings_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_slider`
--

DROP TABLE IF EXISTS `cms_slider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_slider` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_slider`
--

LOCK TABLES `cms_slider` WRITE;
/*!40000 ALTER TABLE `cms_slider` DISABLE KEYS */;
INSERT INTO `cms_slider` VALUES (00000000001,1,'2014-10-01 06:36:27',1,1,NULL,'#','#','img/default/slides');
/*!40000 ALTER TABLE `cms_slider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_slider_content`
--

DROP TABLE IF EXISTS `cms_slider_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_slider_content` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_slider_content`
--

LOCK TABLES `cms_slider_content` WRITE;
/*!40000 ALTER TABLE `cms_slider_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_slider_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_tracker`
--

DROP TABLE IF EXISTS `cms_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tracker` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_tracker`
--

LOCK TABLES `cms_tracker` WRITE;
/*!40000 ALTER TABLE `cms_tracker` DISABLE KEYS */;
INSERT INTO `cms_tracker` VALUES (1,1,'2014-10-01 06:36:24',1,3,'takeawayguru.com/tracker/','al-aminrestaurant.co.uk',1);
/*!40000 ALTER TABLE `cms_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_cwdp`
--

DROP TABLE IF EXISTS `device_cwdp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_cwdp` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `psk` varchar(256) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' COMMENT 'Pre Shared Key',
  `enforce_secure_connection` tinyint(1) NOT NULL DEFAULT '1',
  `show_menucode` tinyint(1) NOT NULL DEFAULT '0',
  `log_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_file_name` varchar(256) DEFAULT 'cwdp.log',
  `notify_email_eng` varchar(256) DEFAULT 'm82amjad@gmail.com',
  `notify_email_client` varchar(256) DEFAULT 'm82amjad@gmail.com',
  `debug` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_cwdp`
--

LOCK TABLES `device_cwdp` WRITE;
/*!40000 ALTER TABLE `device_cwdp` DISABLE KEYS */;
INSERT INTO `device_cwdp` VALUES (00000000001,1,'2014-10-01 06:36:36',0,'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',1,0,0,'cwdp.log','m82amjad@gmail.com','m82amjad@gmail.com',0);
/*!40000 ALTER TABLE `device_cwdp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_cwhd`
--

DROP TABLE IF EXISTS `device_cwhd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_cwhd` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `psk` varchar(256) DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' COMMENT 'Pre Shared Key',
  `enforce_secure_connection` tinyint(1) NOT NULL DEFAULT '0',
  `log_active` tinyint(1) NOT NULL DEFAULT '0',
  `log_file_name` varchar(256) DEFAULT 'cwhd.log',
  `send_data` tinyint(1) NOT NULL DEFAULT '0',
  `order_support` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_cwhd`
--

LOCK TABLES `device_cwhd` WRITE;
/*!40000 ALTER TABLE `device_cwhd` DISABLE KEYS */;
INSERT INTO `device_cwhd` VALUES (00000000001,1,'2014-10-01 06:36:37',0,'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',0,0,'cwhd.log',0,0);
/*!40000 ALTER TABLE `device_cwhd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_fax`
--

DROP TABLE IF EXISTS `device_fax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_fax` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `fax_number` varchar(128) DEFAULT '0',
  `domain_full` text COMMENT 'Full domain name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_fax`
--

LOCK TABLES `device_fax` WRITE;
/*!40000 ALTER TABLE `device_fax` DISABLE KEYS */;
INSERT INTO `device_fax` VALUES (00000000001,1,'2014-10-01 06:36:37',0,'0',NULL);
/*!40000 ALTER TABLE `device_fax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_sms_gateway`
--

DROP TABLE IF EXISTS `device_sms_gateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_sms_gateway` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `gateway_url` text,
  `gateway_password` text,
  `mobile_order_client` varchar(15) DEFAULT NULL,
  `critical_mobile_client` varchar(15) DEFAULT NULL,
  `order_confirm_customer` varchar(1) DEFAULT NULL,
  `order_accepted_customer` varchar(1) DEFAULT NULL,
  `order_ready_customer` varchar(1) DEFAULT NULL,
  `order_nearby_customer` varchar(1) DEFAULT NULL,
  `booking_confirmed_customer` varchar(1) DEFAULT NULL,
  `order_notification_client` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_sms_gateway`
--

LOCK TABLES `device_sms_gateway` WRITE;
/*!40000 ALTER TABLE `device_sms_gateway` DISABLE KEYS */;
INSERT INTO `device_sms_gateway` VALUES (00000000001,1,'2014-10-01 06:36:37',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `device_sms_gateway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_sms_printer`
--

DROP TABLE IF EXISTS `device_sms_printer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_sms_printer` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `mobile_number` varchar(15) DEFAULT '07900642131',
  `iemi` varchar(64) DEFAULT 'NO_IEMI',
  `send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `save_log` tinyint(1) NOT NULL DEFAULT '0',
  `printer_txt` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_sms_printer`
--

LOCK TABLES `device_sms_printer` WRITE;
/*!40000 ALTER TABLE `device_sms_printer` DISABLE KEYS */;
INSERT INTO `device_sms_printer` VALUES (00000000001,1,'2014-10-01 06:36:37',0,'07900642131','NO_IEMI',0,0,0);
/*!40000 ALTER TABLE `device_sms_printer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admin','Administrator'),(2,'members','General User'),(3,'allinepos','All Admin user from All In Epos');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_latlng`
--

DROP TABLE IF EXISTS `map_latlng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_latlng` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_latlng`
--

LOCK TABLES `map_latlng` WRITE;
/*!40000 ALTER TABLE `map_latlng` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_latlng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (23);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations_db_versions`
--

DROP TABLE IF EXISTS `migrations_db_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations_db_versions` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `version_no` bigint(20) NOT NULL DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT '2014-08-25 13:31:06',
  `release_note_eng` text,
  `release_note_adm` text,
  `migration_by` varchar(512) NOT NULL,
  `migration_ip` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations_db_versions`
--

LOCK TABLES `migrations_db_versions` WRITE;
/*!40000 ALTER TABLE `migrations_db_versions` DISABLE KEYS */;
INSERT INTO `migrations_db_versions` VALUES (00000000001,1,'2014-10-01 06:36:22',0,1,'2014-08-25 13:31:06','added __sample_db_table, migrations_db_versions,  migrations.note','First Release','0','127.0.0.1'),(00000000002,1,'2014-10-01 06:36:22',0,2,'2014-08-25 13:31:06','added ci_sessions','First Release','0','127.0.0.1'),(00000000003,1,'2014-10-01 06:36:22',0,3,'2014-08-25 13:31:06','ADDED FUNCTION:: GetUnID','First Release','0','127.0.0.1'),(00000000004,1,'2014-10-01 06:36:22',0,4,'2014-09-01 15:33:06','ADDED FUNCTION:: AddColumnUnlessExists','Made migration more powerfull','0','127.0.0.1'),(00000000005,1,'2014-10-01 06:36:23',0,5,'2014-08-25 13:31:06','ADDED TABLE users, groups, users_groups, login_attempts; DEFAULT DATA: There is error with default data I have fixed on add_users.php.','First Release','0','127.0.0.1'),(00000000006,1,'2014-10-01 06:36:24',0,6,'2014-08-25 13:31:06','ADDED TABLE: user_address; FIXED: Ion_auth data','First Release','0','127.0.0.1'),(00000000007,1,'2014-10-01 06:36:24',0,7,'2014-08-25 13:31:06','ADDED TABLE:: cms_tracker','First Release','0','127.0.0.1'),(00000000008,1,'2014-10-01 06:36:24',0,8,'2014-08-25 13:31:06','ADDED TABLE:: cms_settings_business, cms_settings_email, cms_email_template, cms_settings_system','First Release','0','127.0.0.1'),(00000000009,1,'2014-10-01 06:36:25',0,9,'2014-08-25 13:31:06','ADDED TABLE:: services_opening_hours','First Release','0','127.0.0.1'),(00000000010,1,'2014-10-01 06:36:28',0,10,'2014-08-25 13:31:06','added page_contact, cms_article, cms_highlights, cms_blog, cms_blog_note, cms_gallery, cms_gallery_images, cms_nav, cms_nav_url, cms_slider, cms_slider_content','First Release','0','127.0.0.1'),(00000000011,1,'2014-10-01 06:36:32',0,11,'2014-08-25 13:31:06','ADDED TABLE::  social_google, social_facebook, social_youtube, social_takeawayguru, social_tripadvisor, social_href','First Release','0','127.0.0.1'),(00000000012,1,'2014-10-01 06:36:32',0,12,'2014-08-25 13:31:06','ADDED TABLE:: logs','First Release','0','127.0.0.1'),(00000000013,1,'2014-10-01 06:36:34',0,13,'2014-08-25 13:31:06','ADDED TABLE:: prod_list, prod_category, prod_meats, prod_meat_price, prod_options, prod_options_price; ADDED VIEW:: prod_meat_view ','First Release','0','127.0.0.1'),(00000000014,1,'2014-10-01 06:36:35',0,14,'2014-08-25 13:31:06','ADDED TABLE:: orders, orders_cwdp, trg_order','First Release','0','127.0.0.1'),(00000000015,1,'2014-10-01 06:36:36',0,15,'2014-08-25 13:31:06','ADDED TABLE:: services_collection, services_delivery, services_sit_in, services_reservations, services_reservations_confirms','First Release','0','127.0.0.1'),(00000000016,1,'2014-10-01 06:36:36',0,16,'2014-08-25 13:31:06','ADDED TABLE:: offers, offer_time_validity','First Release','0','127.0.0.1'),(00000000017,1,'2014-10-01 06:36:37',0,17,'2014-08-25 13:31:06','ADDED TABLE:: device_cwdp, device_cwhd, device_fax, device_sms_gateway, device_sms_printer','First Release','0','127.0.0.1'),(00000000018,1,'2014-10-01 06:36:37',0,18,'2014-08-25 13:31:06','ADDED TABLE:: pay_paypal','First Release','0','127.0.0.1'),(00000000019,1,'2014-10-01 06:36:38',0,19,'2014-08-25 13:31:06','ADDED TABLE:: pay_card','First Release','0','127.0.0.1'),(00000000020,1,'2014-10-01 06:36:38',0,20,'2014-08-25 13:31:06','ADDED TABLE:: pay_cash','First Release','0','127.0.0.1'),(00000000021,1,'2014-10-01 06:36:38',0,21,'2014-08-25 13:31:06','ADDED TABLE:: map_latlng','First Release','0','127.0.0.1'),(00000000022,1,'2014-10-01 06:36:38',0,22,'2014-08-25 13:31:06','ADDED FUNCTION:: GetFirstDayOfMonth','Test Functionss','0','127.0.0.1'),(00000000023,1,'2014-10-01 06:36:38',0,23,'2014-09-01 15:33:06','ADDED FUNCTION:: extraColum','Made migration more powerfull','0','127.0.0.1');
/*!40000 ALTER TABLE `migrations_db_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_time_validity`
--

DROP TABLE IF EXISTS `offer_time_validity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer_time_validity` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `offer_id` int(11) DEFAULT '-2',
  `day` varchar(16) DEFAULT 'mon',
  `from_` varchar(5) NOT NULL DEFAULT '17:30',
  `to_` varchar(5) NOT NULL DEFAULT '23:59',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_time_validity`
--

LOCK TABLES `offer_time_validity` WRITE;
/*!40000 ALTER TABLE `offer_time_validity` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_time_validity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
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
  `offers_page_readmore_link` varchar(256) DEFAULT 'takeaway/menu/6',
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
  `time_check` tinyint(1) NOT NULL DEFAULT '0',
  `apply_loyalty_points` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `offer_code` (`offer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
INSERT INTO `offers` VALUES (00000000001,1,'2014-10-01 06:36:36',0,1,'ALLINEPOS','New','New','2014-10-02 07:36:36','2014-10-31 07:36:36','#','#',0,1,NULL,NULL,'takeaway/menu/6',NULL,NULL,10.00,0.00,0.00,0.00,0.00,'collection_delivery',1,-2,0,1);
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
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
  `requested_time` bigint(20) NOT NULL,
  `receiving` varchar(10) NOT NULL DEFAULT 'delivery',
  `discount_code` varchar(128) DEFAULT NULL,
  `pay_method` varchar(128) DEFAULT NULL,
  `pay_status` varchar(128) DEFAULT NULL,
  `items` text,
  `note` text,
  `bag_total` decimal(20,2) DEFAULT '0.00',
  `delivery_charge` decimal(20,2) DEFAULT '0.00',
  `transaction_fee` decimal(20,2) DEFAULT '0.00',
  `base_payable` decimal(20,2) DEFAULT '0.00',
  `vat_value` decimal(20,2) DEFAULT '0.00',
  `discount_price` decimal(20,2) DEFAULT '0.00',
  `checkout_price` decimal(20,2) DEFAULT '0.00',
  `club_point` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `order_code` (`order_code`),
  UNIQUE KEY `order_id_temp` (`order_id_temp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trg_order BEFORE INSERT ON orders
            FOR each ROW
              BEGIN

                DECLARE last_code char(10);
                SET last_code =  (SELECT order_code FROM orders ORDER BY id DESC LIMIT 0, 1);

                IF last_code IS NULL THEN
                  SET NEW.order_code = 'AAA1786';
                  INSERT INTO orders_cwdp (order_code) VALUES ('AAA1786');
                ELSE
                  SET NEW.order_code = GetUnID(last_code);
                  INSERT INTO orders_cwdp (order_code) VALUES (NEW.order_code);
                END IF;
            END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `orders_cwdp`
--

DROP TABLE IF EXISTS `orders_cwdp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_cwdp` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `order_code` varchar(7) NOT NULL,
  `printed` tinyint(1) NOT NULL DEFAULT '0',
  `print_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `order_code` (`order_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_cwdp`
--

LOCK TABLES `orders_cwdp` WRITE;
/*!40000 ALTER TABLE `orders_cwdp` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_cwdp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_cash`
--

DROP TABLE IF EXISTS `pay_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_cash` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_cash`
--

LOCK TABLES `pay_cash` WRITE;
/*!40000 ALTER TABLE `pay_cash` DISABLE KEYS */;
INSERT INTO `pay_cash` VALUES (00000000001,1,'2014-10-01 06:36:38',1,10.00,0,1,0,'var/log','cash.log','exception.log');
/*!40000 ALTER TABLE `pay_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_paypal`
--

DROP TABLE IF EXISTS `pay_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_paypal` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_paypal`
--

LOCK TABLES `pay_paypal` WRITE;
/*!40000 ALTER TABLE `pay_paypal` DISABLE KEYS */;
INSERT INTO `pay_paypal` VALUES (00000000001,1,'2014-10-01 06:36:37',0,1,0.20,3.20,10.00,0.20,0,'paypal@allinepos.co.uk',NULL,'http://al-aminrestaurant.co.uk/img/menu/logo/logoPaypal.png','000000','Payment Received! Your product will be sent to you very soon!','Transaction Complete. But payment is still pending! <br /> You need to manually authorize this payment in your <a href=\'http://www.paypal.com\'>Paypal Account</a>','GBP',1,0,'var/log','paypal.log','exception.log',0,0,'paypal_http_response.log','m82amjad_api1.hotmail.co.uk','W4W9MCXCZ9DL4938','AamyNj8hYYmtqQkScocIJA2nHc2KAphH9D-oD3aGUcOr8fR.riuDM75B','seller_1317255315_biz_api1.gmail.com','1317255350','AFcWxV21C7fd0v3bYYYRCpSSRl31AsEXo1mfs5m9KpiElKsbTiQR9C2V','integrated','takeaway/confirm','takeaway/process_order','takeaway/process_order','paypal/process','takeaway/order_details');
/*!40000 ALTER TABLE `pay_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_psense`
--

DROP TABLE IF EXISTS `pay_psense`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_psense` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_psense`
--

LOCK TABLES `pay_psense` WRITE;
/*!40000 ALTER TABLE `pay_psense` DISABLE KEYS */;
INSERT INTO `pay_psense` VALUES (00000000001,1,'2014-10-01 06:36:37',0,0,0.20,2.20,-2.00,0,10.00,NULL,'Card',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'SALE',NULL,NULL,1,0,'payment_sense.log','payment_sense.log',0,0,'paypal_http_response.log');
/*!40000 ALTER TABLE `pay_psense` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_category`
--

DROP TABLE IF EXISTS `prod_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_category` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_category`
--

LOCK TABLES `prod_category` WRITE;
/*!40000 ALTER TABLE `prod_category` DISABLE KEYS */;
INSERT INTO `prod_category` VALUES (00000000001,1,'2014-10-01 06:36:33',1,1,0,'Takeaway Menu',NULL,'takeaway',NULL,NULL),(00000000002,1,'2014-10-01 06:36:33',1,1,1,'Starter',NULL,'takeaway',NULL,NULL),(00000000003,1,'2014-10-01 06:36:33',1,1,1,'Chef SPecials',NULL,'takeaway',NULL,NULL);
/*!40000 ALTER TABLE `prod_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_list`
--

DROP TABLE IF EXISTS `prod_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_list` (
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
  `now_price` decimal(7,2) NOT NULL DEFAULT '-2.00' COMMENT 'If it is on discounted price, new price here',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_list`
--

LOCK TABLES `prod_list` WRITE;
/*!40000 ALTER TABLE `prod_list` DISABLE KEYS */;
INSERT INTO `prod_list` VALUES (00000000001,1,'2014-10-01 06:36:33',1,1,'Chicken Tikka(ST)','#','#','Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala',5.00,2,-2.00,NULL,NULL,0,0,'1',0,0,0,1,-2.00),(00000000002,1,'2014-10-01 06:36:33',1,1,'Lam Tikka (ST)','#','#','Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala',5.00,2,-2.00,NULL,NULL,0,0,'2',0,0,0,1,-2.00),(00000000003,1,'2014-10-01 06:36:33',1,1,'Onion Bhaji','#','#','Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala',5.00,2,-2.00,NULL,NULL,0,0,'3',0,0,0,1,-2.00),(00000000004,1,'2014-10-01 06:36:33',1,1,'Prwan Puri','#','#','Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala',5.00,2,-2.00,NULL,NULL,0,0,'4',0,0,0,1,-2.00),(00000000005,1,'2014-10-01 06:36:33',1,1,'Tandoori Chicken','#','#','Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala',5.00,2,-2.00,NULL,NULL,0,0,'5',0,0,0,1,-2.00),(00000000006,1,'2014-10-01 06:36:33',1,1,'Simla Moris','#','#','Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala',5.00,2,-2.00,NULL,NULL,0,0,'6',0,0,0,1,-2.00),(00000000007,1,'2014-10-01 06:36:33',1,1,'Chicken Tikka Masala','#','#','Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala',5.00,3,-2.00,NULL,NULL,0,0,'7',0,0,0,1,-2.00),(00000000008,1,'2014-10-01 06:36:33',1,1,'Lam Tikka Masala','#','#','Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala',5.00,3,-2.00,NULL,NULL,0,0,'8',0,0,0,1,-2.00),(00000000009,1,'2014-10-01 06:36:33',1,1,'Prwan Tikka Masala','#','#','Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala',5.00,3,-2.00,NULL,NULL,0,0,'9',0,0,0,1,-2.00),(00000000010,1,'2014-10-01 06:36:33',1,1,'Chicken Tikka Razala','#','#','Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44; tamarind sauce and chat masala',5.00,3,-2.00,NULL,NULL,0,0,'10',0,0,0,1,-2.00);
/*!40000 ALTER TABLE `prod_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_meat_price`
--

DROP TABLE IF EXISTS `prod_meat_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_meat_price` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_meat_price`
--

LOCK TABLES `prod_meat_price` WRITE;
/*!40000 ALTER TABLE `prod_meat_price` DISABLE KEYS */;
INSERT INTO `prod_meat_price` VALUES (00000000001,1,'2014-04-19 12:30:20',1,1,1,2,9.00),(00000000002,1,'2014-04-19 12:30:20',1,1,1,1,4.00),(00000000003,1,'2014-04-19 12:30:20',1,1,1,3,5.00),(00000000004,1,'2014-04-19 12:30:20',1,1,2,4,6.00),(00000000005,1,'2014-04-19 12:30:20',1,1,2,5,3.00),(00000000006,1,'2014-04-19 12:30:20',1,1,3,6,6.00),(00000000007,1,'2014-04-19 12:30:20',1,1,3,7,7.00),(00000000008,1,'2014-04-19 12:30:20',1,1,3,8,3.00);
/*!40000 ALTER TABLE `prod_meat_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `prod_meat_view`
--

DROP TABLE IF EXISTS `prod_meat_view`;
/*!50001 DROP VIEW IF EXISTS `prod_meat_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `prod_meat_view` (
  `price_id` tinyint NOT NULL,
  `price_active` tinyint NOT NULL,
  `price_sn` tinyint NOT NULL,
  `prod_list_id` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `meats_id` tinyint NOT NULL,
  `meats_active` tinyint NOT NULL,
  `meats_title` tinyint NOT NULL,
  `short_name` tinyint NOT NULL,
  `icon` tinyint NOT NULL,
  `prod_category_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `prod_meats`
--

DROP TABLE IF EXISTS `prod_meats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_meats` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_meats`
--

LOCK TABLES `prod_meats` WRITE;
/*!40000 ALTER TABLE `prod_meats` DISABLE KEYS */;
INSERT INTO `prod_meats` VALUES (00000000001,1,'2014-04-19 12:14:22',1,1,'Chicken','CH',NULL),(00000000002,1,'2014-04-19 12:14:22',1,2,'Lamb','LM',NULL),(00000000003,1,'2014-04-19 12:14:22',1,3,'Veg','VG',NULL),(00000000004,1,'2014-04-19 12:14:22',1,4,'Prwan','PR',NULL),(00000000005,1,'2014-04-19 12:14:22',1,5,'King Prwan','KP',NULL),(00000000006,1,'2014-04-19 12:14:22',1,6,'King Prwan Tikka','KP',NULL),(00000000007,1,'2014-04-19 12:14:22',1,7,'Chicken Tikka','KP',NULL),(00000000008,1,'2014-04-19 12:14:22',1,8,'Lamb Tikka','KP',NULL);
/*!40000 ALTER TABLE `prod_meats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_options`
--

DROP TABLE IF EXISTS `prod_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_options` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `name_option` varchar(256) NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_options`
--

LOCK TABLES `prod_options` WRITE;
/*!40000 ALTER TABLE `prod_options` DISABLE KEYS */;
INSERT INTO `prod_options` VALUES (00000000001,1,'2014-10-01 06:36:34',1,'Large'),(00000000002,1,'2014-10-01 06:36:34',1,'Small'),(00000000003,1,'2014-10-01 06:36:34',1,'Chicken Tikka Masalla');
/*!40000 ALTER TABLE `prod_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_options_price`
--

DROP TABLE IF EXISTS `prod_options_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_options_price` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `group_no` int(11) NOT NULL DEFAULT '1',
  `prod_list_id` int(11) NOT NULL DEFAULT '1',
  `prod_options_id` int(11) NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_options_price`
--

LOCK TABLES `prod_options_price` WRITE;
/*!40000 ALTER TABLE `prod_options_price` DISABLE KEYS */;
INSERT INTO `prod_options_price` VALUES (00000000001,1,'2014-10-01 06:36:34',1,1,1,1,1,2),(00000000002,1,'2014-10-01 06:36:34',1,1,1,1,1,2),(00000000003,1,'2014-10-01 06:36:34',1,1,1,1,1,2);
/*!40000 ALTER TABLE `prod_options_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `prod_options_price_view`
--

DROP TABLE IF EXISTS `prod_options_price_view`;
/*!50001 DROP VIEW IF EXISTS `prod_options_price_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `prod_options_price_view` (
  `prod_options_price_id` tinyint NOT NULL,
  `options_price_active` tinyint NOT NULL,
  `options_price_sn` tinyint NOT NULL,
  `group_no` tinyint NOT NULL,
  `prod_list_id` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `prod_options_id` tinyint NOT NULL,
  `prod_options_active` tinyint NOT NULL,
  `name_option` tinyint NOT NULL,
  `prod_category_id` tinyint NOT NULL,
  `user_view` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `services_collection`
--

DROP TABLE IF EXISTS `services_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_collection` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_collection`
--

LOCK TABLES `services_collection` WRITE;
/*!40000 ALTER TABLE `services_collection` DISABLE KEYS */;
INSERT INTO `services_collection` VALUES (00000000001,1,'2014-10-01 06:36:35',1,1,15,NULL,15,10.00,10,10);
/*!40000 ALTER TABLE `services_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_delivery`
--

DROP TABLE IF EXISTS `services_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_delivery` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_delivery`
--

LOCK TABLES `services_delivery` WRITE;
/*!40000 ALTER TABLE `services_delivery` DISABLE KEYS */;
INSERT INTO `services_delivery` VALUES (00000000001,1,'2014-10-01 06:36:35',1,1,45,NULL,15,10.00,0,0,6.00,3.00,2.00,0);
/*!40000 ALTER TABLE `services_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_opening_hours`
--

DROP TABLE IF EXISTS `services_opening_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_opening_hours` (
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
  `waiting_collection` tinyint(1) DEFAULT '15',
  `waiting_delivery` tinyint(1) DEFAULT '45',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_opening_hours`
--

LOCK TABLES `services_opening_hours` WRITE;
/*!40000 ALTER TABLE `services_opening_hours` DISABLE KEYS */;
INSERT INTO `services_opening_hours` VALUES (00000000001,0,'2014-10-01 06:36:25',1,1,'17:30','23:59','Mon',1,0,0,15,45),(00000000002,0,'2014-10-01 06:36:25',1,1,'17:30','23:59','Tue',1,0,0,15,45),(00000000003,0,'2014-10-01 06:36:25',1,1,'17:30','23:59','Wed',1,0,0,15,45),(00000000004,0,'2014-10-01 06:36:25',1,1,'17:30','23:59','Thu',1,0,0,15,45),(00000000005,0,'2014-10-01 06:36:25',1,1,'17:30','23:59','Fri',1,0,0,15,45),(00000000006,0,'2014-10-01 06:36:25',1,1,'17:30','23:59','Sat',1,0,0,15,45),(00000000007,0,'2014-10-01 06:36:25',1,1,'17:30','23:59','Sun',1,0,0,15,45);
/*!40000 ALTER TABLE `services_opening_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_reservations`
--

DROP TABLE IF EXISTS `services_reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_reservations` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `user_code` varchar(10) DEFAULT NULL,
  `fnames` varchar(256) NOT NULL,
  `lname` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `phone` varchar(256) NOT NULL,
  `cover` varchar(256) NOT NULL,
  `reservation_time` bigint(20) NOT NULL DEFAULT '1',
  `note` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_reservations`
--

LOCK TABLES `services_reservations` WRITE;
/*!40000 ALTER TABLE `services_reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_reservations_confirm`
--

DROP TABLE IF EXISTS `services_reservations_confirm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_reservations_confirm` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_reservations_confirm`
--

LOCK TABLES `services_reservations_confirm` WRITE;
/*!40000 ALTER TABLE `services_reservations_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_reservations_confirm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_sit_in`
--

DROP TABLE IF EXISTS `services_sit_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_sit_in` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_sit_in`
--

LOCK TABLES `services_sit_in` WRITE;
/*!40000 ALTER TABLE `services_sit_in` DISABLE KEYS */;
INSERT INTO `services_sit_in` VALUES (00000000001,1,'2014-10-01 06:36:35',0,0,NULL,0,0,1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `services_sit_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_facebook`
--

DROP TABLE IF EXISTS `social_facebook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_facebook` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_facebook`
--

LOCK TABLES `social_facebook` WRITE;
/*!40000 ALTER TABLE `social_facebook` DISABLE KEYS */;
INSERT INTO `social_facebook` VALUES (00000000001,1,'2014-10-01 06:36:31',0,'https://www.facebook.com/TakeAwayGuru/timeline',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `social_facebook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_google`
--

DROP TABLE IF EXISTS `social_google`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_google` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` text,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_google`
--

LOCK TABLES `social_google` WRITE;
/*!40000 ALTER TABLE `social_google` DISABLE KEYS */;
INSERT INTO `social_google` VALUES (00000000001,1,'2014-10-01 06:36:29',0,'https://plus.google.com/u/0/',NULL);
/*!40000 ALTER TABLE `social_google` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_href`
--

DROP TABLE IF EXISTS `social_href`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_href` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_href`
--

LOCK TABLES `social_href` WRITE;
/*!40000 ALTER TABLE `social_href` DISABLE KEYS */;
INSERT INTO `social_href` VALUES (00000000001,1,'2014-10-01 06:36:32',0,'http://takeawayguru.com','takeaway guru',1,'takeawayguru','http://takeawayguru.com/imgCommon/social/takeawayguru.ico','http://takeawayguru.com/imgCommon/social/takeawayguruLogo.png'),(00000000002,1,'2014-10-01 06:36:32',0,'https://www.facebook.com/TakeAwayGuru/timeline','Facebook',2,'facebook','http://takeawayguru.com/imgCommon/social/facebook.ico','http://takeawayguru.com/imgCommon/social/facebookLogo.png'),(00000000003,1,'2014-10-01 06:36:32',0,'https://www.youtube.com/channel/UCJENQl-cgkP2ZiiYDhXWXRA','youtube',3,'youtube','http://takeawayguru.com/imgCommon/social/youtube.ico','http://takeawayguru.com/imgCommon/social/youtubeLogo.png'),(00000000004,1,'2014-10-01 06:36:32',0,'https://twitter.com/takeawayguru','twitter',4,'twitter','http://takeawayguru.com/imgCommon/social/twitter.ico','http://takeawayguru.com/imgCommon/social/twitterLogo.png'),(00000000005,1,'2014-10-01 06:36:32',0,'https://plus.google.com/u/0/','Google +',5,'google+','http://takeawayguru.com/imgCommon/social/google.ico','http://takeawayguru.com/imgCommon/social/googleLogo.png'),(00000000006,1,'2014-10-01 06:36:32',0,'http://takeawayguru1.blogspot.co.uk/','Blogpost',6,'blogpost','http://takeawayguru.com/imgCommon/social/blogpost.ico','http://takeawayguru.com/imgCommon/social/blogpostLogo.png'),(00000000007,1,'2014-10-01 06:36:32',0,'http://www.pinterest.com/lalitasahu73/','Pinterest',7,'pinterest','http://takeawayguru.com/imgCommon/social/pinterest.ico','http://takeawayguru.com/imgCommon/social/pinterestLogo.png'),(00000000008,1,'2014-10-01 06:36:32',0,'https://www.tumblr.com/blog/takeawayguru','Tumblr',8,'tumblr','http://takeawayguru.com/imgCommon/social/tumblr.ico','http://takeawayguru.com/imgCommon/social/tumblrLogo.png');
/*!40000 ALTER TABLE `social_href` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_takeawayguru`
--

DROP TABLE IF EXISTS `social_takeawayguru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_takeawayguru` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` text,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_takeawayguru`
--

LOCK TABLES `social_takeawayguru` WRITE;
/*!40000 ALTER TABLE `social_takeawayguru` DISABLE KEYS */;
INSERT INTO `social_takeawayguru` VALUES (00000000001,1,'2014-10-01 06:36:29',0,'https://www.youtube.com/channel/UCJENQl-cgkP2ZiiYDhXWXRA',NULL);
/*!40000 ALTER TABLE `social_takeawayguru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_tripadvisor`
--

DROP TABLE IF EXISTS `social_tripadvisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_tripadvisor` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` text,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_tripadvisor`
--

LOCK TABLES `social_tripadvisor` WRITE;
/*!40000 ALTER TABLE `social_tripadvisor` DISABLE KEYS */;
INSERT INTO `social_tripadvisor` VALUES (00000000001,1,'2014-10-01 06:36:29',0,'http://tripadvisor.com',NULL);
/*!40000 ALTER TABLE `social_tripadvisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_youtube`
--

DROP TABLE IF EXISTS `social_youtube`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_youtube` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `url` text,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_youtube`
--

LOCK TABLES `social_youtube` WRITE;
/*!40000 ALTER TABLE `social_youtube` DISABLE KEYS */;
INSERT INTO `social_youtube` VALUES (00000000001,1,'2014-10-01 06:36:29',0,'http://youtube.com',NULL);
/*!40000 ALTER TABLE `social_youtube` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(80) NOT NULL,
  `salt` varchar(40) NOT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'127.0.0.1','administrator','$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36','','admin@admin.com','',NULL,NULL,NULL,1268889823,1268889823,1,'Admin','istrator','ADMIN','0'),(2,'127.0.0.1','amzadmojumder','$2y$08$yzqXoY2gANMLcc/rhyZ8j.r18.0QFLEWTBqXpAJ9..A6zdB0KjsOK','','amzadfof@gmail.com',NULL,NULL,NULL,NULL,1405554124,1405554124,1,'Amzad','Mojumder','Conosurtek Ltd','07900642131'),(3,'127.0.0.1','lalitasahu','$2y$08$8DFKvxXz/nErqwtbq92oGe.rxVMvpJpD8PNARjroKit3hOFc.jyxy','','lalita@allinepos.co.uk',NULL,NULL,NULL,NULL,1405554460,1405554460,1,'Lalita','Sahu','All In Epos','07402950926'),(4,'127.0.0.1','tanjumkhan','$2y$08$8DFKvxXz/nErqwtbq92oGe.rxVMvpJpD8PNARjroKit3hOFc.jyxy','','mr@conosurtek.net',NULL,NULL,NULL,NULL,1405555520,1405555520,1,'Rezwanur','Rahman','Cwaiter Ltd','07900642133'),(5,'127.0.0.1','tanjumkhan','$2y$08$A/hjiITaafIz.FEx47lZfOECM5mtbQdxSFzSSYWwdArftTsW8eVay','','tanjum@cwaiter.co.uk',NULL,NULL,NULL,NULL,1405555520,1405555520,1,'Tanjum','Khan','Cwaiter Ltd','07900642133');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_address`
--

DROP TABLE IF EXISTS `users_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_address` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `users_id` bigint(20) NOT NULL,
  `user_code` varchar(32) NOT NULL,
  `address1` varchar(256) NOT NULL,
  `address2` varchar(256) DEFAULT NULL,
  `town` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `county` varchar(256) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `postcode` varchar(32) NOT NULL,
  `map_latlng_id` int(11) NOT NULL,
  `primary_address` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_address`
--

LOCK TABLES `users_address` WRITE;
/*!40000 ALTER TABLE `users_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,2),(6,2,3),(7,3,1),(8,3,2),(9,3,3),(10,4,1),(11,4,2),(12,4,3),(13,5,1),(14,5,2),(15,5,3);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `cms_nav_view`
--

/*!50001 DROP TABLE IF EXISTS `cms_nav_view`*/;
/*!50001 DROP VIEW IF EXISTS `cms_nav_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cms_nav_view` AS select `cms_nav`.`id` AS `cms_nav_id`,`cms_nav`.`active` AS `cms_nav_active`,`cms_nav`.`sn` AS `cms_nav_sn`,`cms_nav`.`alias` AS `alias`,`cms_nav`.`nav_name` AS `nav_name`,`cms_nav`.`title` AS `title`,`cms_nav_url`.`id` AS `cms_nav_url_id`,`cms_nav_url`.`active` AS `cms_nav_url_active`,`cms_nav_url`.`sn` AS `cms_nav_url_sn`,`cms_nav_url`.`parent` AS `parent`,`cms_nav_url`.`nav_url_name` AS `nav_url_name`,`cms_nav_url`.`href` AS `href`,`cms_nav_url`.`image_src` AS `image_src` from (`cms_nav_url` left join `cms_nav` on((`cms_nav_url`.`cms_nav_id` = `cms_nav`.`id`))) where (`cms_nav_url`.`active` = 1) order by `cms_nav_url`.`sn` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prod_meat_view`
--

/*!50001 DROP TABLE IF EXISTS `prod_meat_view`*/;
/*!50001 DROP VIEW IF EXISTS `prod_meat_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prod_meat_view` AS select `prod_meat_price`.`id` AS `price_id`,`prod_meat_price`.`active` AS `price_active`,`prod_meat_price`.`sn` AS `price_sn`,`prod_meat_price`.`prod_list_id` AS `prod_list_id`,`prod_meat_price`.`price` AS `price`,`prod_meats`.`id` AS `meats_id`,`prod_meats`.`active` AS `meats_active`,`prod_meats`.`title` AS `meats_title`,`prod_meats`.`short_name` AS `short_name`,`prod_meats`.`icon` AS `icon`,`prod_list`.`prod_category_id` AS `prod_category_id` from ((`prod_meat_price` left join `prod_meats` on((`prod_meat_price`.`prod_meats_id` = `prod_meats`.`id`))) left join `prod_list` on((`prod_list`.`id` = `prod_meat_price`.`prod_list_id`))) order by `prod_meat_price`.`sn` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `prod_options_price_view`
--

/*!50001 DROP TABLE IF EXISTS `prod_options_price_view`*/;
/*!50001 DROP VIEW IF EXISTS `prod_options_price_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `prod_options_price_view` AS select `prod_options_price`.`id` AS `prod_options_price_id`,`prod_options_price`.`active` AS `options_price_active`,`prod_options_price`.`sn` AS `options_price_sn`,`prod_options_price`.`group_no` AS `group_no`,`prod_options_price`.`prod_list_id` AS `prod_list_id`,`prod_options_price`.`price` AS `price`,`prod_options_price`.`prod_options_id` AS `prod_options_id`,`prod_options`.`active` AS `prod_options_active`,`prod_options`.`name_option` AS `name_option`,`prod_list`.`prod_category_id` AS `prod_category_id`,`prod_option_user_view`(`prod_options`.`name_option`,`prod_options_price`.`price`) AS `user_view` from (`prod_list` left join (`prod_options` left join `prod_options_price` on((`prod_options_price`.`prod_options_id` = `prod_options`.`id`))) on((`prod_list`.`id` = `prod_options_price`.`prod_list_id`))) where (`prod_options_price`.`active` = 1) order by `prod_options_price`.`sn` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-01 13:57:13

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
INSERT INTO `ci_sessions` VALUES ('1bc5c115a0e77522bb7e051817688891','127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0',1406573554,'a:6:{s:9:\"user_data\";s:0:\"\";s:9:\"receiving\";s:10:\"collection\";s:9:\"payMethod\";s:6:\"paypal\";s:3:\"day\";i:1406573554;s:4:\"time\";s:3:\"000\";s:9:\"errorUser\";s:61:\"Your cart is empty!! Please add some food in your cart.<br />\";}'),('43d1d8e027b9dc358294f7430da94c57','192.168.0.8','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0',1406637038,''),('5efc6dec7ac4a1341172bc5281c36db3','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36',1407013343,'a:20:{s:9:\"user_data\";s:0:\"\";s:9:\"receiving\";s:10:\"collection\";s:9:\"payMethod\";s:4:\"cash\";s:3:\"day\";s:10:\"1408489200\";s:4:\"time\";s:5:\"44100\";s:8:\"discount\";s:0:\"\";s:9:\"orderNote\";s:0:\"\";s:5:\"email\";s:18:\"amzadfof@gmail.com\";s:5:\"fname\";s:5:\"Amzad\";s:5:\"lname\";s:8:\"Mojumder\";s:5:\"phone\";s:11:\"07900642131\";s:7:\"houseNo\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:8:\"address1\";s:0:\"\";s:8:\"address2\";s:0:\"\";s:4:\"town\";s:0:\"\";s:4:\"city\";s:0:\"\";s:6:\"county\";s:0:\"\";s:18:\"addressInstruction\";s:0:\"\";s:13:\"order_id_temp\";s:22:\"07900642131_1407667906\";}'),('6301991d77ce638215fbcbf15e72f95e','127.0.0.1','Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/1.8.2 Safari/5',1407152562,'a:5:{s:9:\"user_data\";s:0:\"\";s:9:\"receiving\";s:10:\"collection\";s:9:\"payMethod\";s:6:\"paypal\";s:3:\"day\";i:1407152563;s:4:\"time\";s:3:\"000\";}'),('ce9c75890e07ca9678eebbbaf6579e9d','127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0',1407084947,'a:21:{s:9:\"user_data\";s:0:\"\";s:9:\"receiving\";s:10:\"collection\";s:9:\"payMethod\";s:6:\"paypal\";s:3:\"day\";s:10:\"1407020400\";s:4:\"time\";s:5:\"44100\";s:8:\"discount\";s:0:\"\";s:9:\"orderNote\";s:0:\"\";s:5:\"email\";s:18:\"amjadfof@gmail.com\";s:5:\"fname\";s:5:\"Amzad\";s:5:\"lname\";s:8:\"Mojumder\";s:5:\"phone\";s:11:\"07900642131\";s:7:\"houseNo\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:8:\"address1\";s:0:\"\";s:8:\"address2\";s:0:\"\";s:4:\"town\";s:0:\"\";s:4:\"city\";s:0:\"\";s:6:\"county\";s:0:\"\";s:18:\"addressInstruction\";s:0:\"\";s:13:\"order_id_temp\";s:22:\"07900642131_1407085118\";s:5:\"items\";a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}}}'),('fe3297da25e05be8928673b570de7a58','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36',1408272834,'a:22:{s:9:\"user_data\";s:0:\"\";s:9:\"receiving\";s:8:\"delivery\";s:9:\"payMethod\";s:6:\"paypal\";s:3:\"day\";s:10:\"1409353200\";s:4:\"time\";s:5:\"45900\";s:8:\"discount\";s:0:\"\";s:9:\"orderNote\";s:0:\"\";s:5:\"email\";s:18:\"amzadfof@gmail.com\";s:5:\"fname\";s:5:\"amzad\";s:5:\"lname\";s:8:\"Mojumder\";s:5:\"phone\";s:11:\"07900642131\";s:7:\"houseNo\";s:2:\"48\";s:8:\"postcode\";s:7:\"GU215ED\";s:8:\"address1\";s:12:\"Walton Court\";s:8:\"address2\";s:0:\"\";s:4:\"town\";s:6:\"Woking\";s:4:\"city\";s:8:\"Guilford\";s:6:\"county\";s:6:\"Surrey\";s:18:\"addressInstruction\";s:0:\"\";s:13:\"order_id_temp\";s:22:\"07900642131_1408293118\";s:5:\"items\";a:11:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:5;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"5\";i:1;s:4:\"3.00\";i:2;s:10:\"King Prwan\";}}i:6;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.00\";s:4:\"meat\";a:3:{i:0;s:1:\"7\";i:1;s:4:\"7.00\";i:2;s:13:\"Chicken Tikka\";}}i:7;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:8;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:9;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:10;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}s:15:\"transactionInfo\";a:10:{s:14:\"ItemTotalPrice\";d:75.640000000000001;s:14:\"TotalTaxAmount\";d:0;s:13:\"HandalingCost\";d:0;s:13:\"InsuranceCost\";d:0;s:15:\"ShippinDiscount\";d:0;s:11:\"ShippinCost\";b:0;s:8:\"bagTotal\";d:75.640000000000001;s:8:\"vatValue\";d:0;s:11:\"basePayable\";d:75.640000000000001;s:13:\"checkoutPrice\";d:75.640000000000001;}}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT NULL,
  `alias` varchar(256) DEFAULT NULL,
  `title` text NOT NULL,
  `summary` text,
  `body` text NOT NULL,
  `banner_src` text,
  `banner_href` text,
  `image_src` text,
  `image_href` text,
  `button_href` text,
  `button` text,
  `page_template` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='### ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
INSERT INTO `cms_article` VALUES (1,1,'2014-07-05 20:55:31',1,1,'about_us','About The Royals',NULL,'<p>The Royals has been established since 2000 and is still one of North London’s most popular Indian restaurants. </p> <br />\r\n\r\n                <p>The Royals was founded in 2000 by Mr Mostak Ahmed, who not only has sixteen years’ experience in the food industry but has a strong business sense. The Royals is a family run business which adopts a philosophy of wholesomeness, well-being and creates a strong traditional ambience. As a result, this has created a more family orientated restaurant for all to enjoy. </p> <br />\r\n\r\n                <p>Supporting The Royals is a chef with supreme talents. Experience of thirty-two years goes a long way in this industry. The Royals’ menu is meticulously designed to suit the needs of every customer. It is constantly being improved with excellent feedback from their valued customers. </p> ',NULL,'/takeaway/menu','/img/articles/about_us.jpg','/takeaway/menu','/takeaway/menu','Order Online','#');
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_highlights`
--

DROP TABLE IF EXISTS `cms_highlights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_highlights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_highlights`
--

LOCK TABLES `cms_highlights` WRITE;
/*!40000 ALTER TABLE `cms_highlights` DISABLE KEYS */;
INSERT INTO `cms_highlights` VALUES (1,515,'2014-07-05 09:36:13',1,1,'welcome','about/home','special','Special Offers !!','#','#','#','/takeaway/menu','http://allinepos.co.uk/clients/images/ukb1830/Highlights/off_20.jpg','','and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use.','/takeaway/menu','Order Online'),(2,515,'2014-07-05 09:35:55',1,2,'welcome','about/home','special','Freshly Cooked !!','#','','','/takeaway/menu','http://allinepos.co.uk/clients/images/ukb1830/Highlights/drink_free.jpg','','and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use.','/takeaway/menu','Complementary Drink'),(3,7,'2014-07-05 09:35:44',1,3,'welcome','about/home','special','Dine @ Home !!','#','','','/takeaway/menu','http://allinepos.co.uk/templates/1800/images/highlights/FreeDelivery.jpg','','and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use.','/takeaway/menu','Order Online'),(4,11,'2014-07-05 11:31:26',1,4,'welcome','about/home','mid_text','Meal for 2','The Royals’ menu is meticulously designed to suit the needs of every customer.','#','','/takeaway/menu','http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg','','and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use.','/takeaway/menu','View Set Meals'),(5,11,'2014-07-05 11:47:06',1,4,'welcome','about/main','our_restaurant','Meal for 2','OUR RESTAURANT','#','','/takeaway/menu','http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg','','and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use link','/takeaway/menu','View Set Meals'),(6,11,'2014-07-05 11:47:06',1,4,'welcome','about/main','our_food','Meal for 2','OUR RESTAURANT','#','','/takeaway/menu','http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg','','and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use link','/takeaway/menu','View Set Meals'),(7,11,'2014-07-05 11:47:06',1,4,'welcome','about/main','top_banner','Meal for 2','Delivered Stright To Your Door.','#','','/takeaway/menu','http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg','','and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use link','/takeaway/menu','Order Online Now'),(8,11,'2014-07-05 17:16:12',1,4,'us','about/us','side','about us side starter','Starter','#','','/takeaway/menu','/img/highlights/starters.jpg','#','#','/takeaway/menu','Order Online Now'),(9,11,'2014-07-05 17:17:48',1,4,'us','about/us','side','about Us, side , Main Dishes','Main Dishes','#','','/takeaway/menu','/img/highlights/main.jpg','','#','/takeaway/menu','Order Online Now'),(10,11,'2014-07-05 17:19:21',1,4,'us','about/us','side','About Us, Side, Side Orders','Side Orders','#','','/takeaway/menu','/img/highlights/side.jpg','','#','/takeaway/menu','Order Online Now');
/*!40000 ALTER TABLE `cms_highlights` ENABLE KEYS */;
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
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `order_code` varchar(7) NOT NULL,
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
  UNIQUE KEY `order_id_temp` (`order_id_temp`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2014-07-26 17:18:13',1,'AAA1786','07900642131_1406395054','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407582900,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(2,1,'2014-07-26 17:23:22',1,'AAA1787','07900642131_1406395366','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407755700,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(3,1,'2014-07-26 17:27:18',1,'AAA1788','07900642131_1406395584','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407755700,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(4,1,'2014-07-26 17:29:22',1,'AAA1789','07900642131_1406395727','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407842100,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(5,1,'2014-07-26 17:32:58',1,'AAA1790','07900642131_1406395899','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407669300,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(6,1,'2014-07-26 17:34:15',1,'AAA1791','07900642131_1406396019','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407150900,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(7,1,'2014-07-26 17:38:32',1,'AAA1792','07900642131_1406396251','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407150900,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',6.00,0.00,0.00,6.00,0.00,0.00,6.00,0),(8,1,'2014-07-26 17:39:31',1,'AAA1793','07900642131_1406396335','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407669300,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(9,1,'2014-07-26 17:47:12',1,'AAA1794','07900642131_1406396797','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407582900,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(10,1,'2014-07-26 17:51:12',1,'AAA1795','07900642131_1406397033','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407410100,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(11,1,'2014-07-26 17:52:29',1,'AAA1796','07900642131_1406397109','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407669300,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(12,1,'2014-07-26 17:54:10',1,'AAA1797','07900642131_1406397214','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407582900,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(13,1,'2014-07-26 18:25:17',1,'AAA1798','07900642131_1406399048','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guilford','Surrey','GU21 5ED','',1406896200,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(14,1,'2014-07-26 18:37:11',1,'AAA1799','07900642131_1406399789','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guildford','Surrey','GU21 5ED','teset',1406805300,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(15,1,'2014-07-26 18:39:37',1,'AAA1800','07900642131_1406399919','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guildford','Surrey','GU21 5ED','teset',1407582900,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(16,1,'2014-07-26 18:45:25',1,'AAA1801','07900642131_1406400280','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guildford','Surrey','GU21 5ED','teset',1406891700,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',7.95,0.00,0.00,7.95,0.00,0.00,7.95,0),(17,1,'2014-07-26 18:47:15',1,'AAA1802','07900642131_1406400371','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guildford','Surrey','GU21 5ED','teset',1406891700,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(18,1,'2014-07-26 18:52:36',1,'AAA1803','07900642131_1406400720','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guildford','Surrey','GU21 5ED','teset',1406805300,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(19,1,'2014-07-26 19:00:20',1,'AAA1804','07900642131_1406401167','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guildford','Surrey','GU21 5ED','teset',1407237300,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,0.00,0.00,3.00,0),(20,1,'2014-07-26 19:21:41',1,'AAA1805','07900642131_1406402470','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guildford','Surrey','GU21 5ED','teset',1407064500,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,3.00,0.00,3.00,0),(21,1,'2014-07-26 19:34:39',1,'AAA1806','07900642131_1406403237','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guildford','Surrey','GU21 5ED','teset',1407496500,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,3.00,0.00,3.00,0),(22,1,'2014-07-26 19:36:47',1,'AAA1807','07900642131_1406403392','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guildford','Surrey','GU21 5ED','teset',1406463300,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,3.00,0.00,3.00,0),(23,1,'2014-07-27 03:32:40',1,'AAA1808','07900642131_1406431915','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407323700,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',8.95,0.00,0.00,8.95,8.95,0.00,8.95,0),(24,1,'2014-07-27 03:34:42',1,'AAA1809','07900642131_1406432080','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406459700,'collection','','cash',NULL,'a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}}','',4.00,0.00,0.00,4.00,4.00,0.00,4.00,0),(25,1,'2014-07-27 03:35:18',1,'AAA1810','07900642131_1406432115','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407842100,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,3.00,0.00,3.00,0),(26,1,'2014-07-27 03:37:28',1,'AAA1811','07900642131_1406432242','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406548800,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,3.00,0.00,3.00,0),(27,1,'2014-07-27 03:48:08',1,'AAA1812','07900642131_1406432886','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406459700,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}}','',1.00,0.00,0.00,1.00,1.00,0.00,1.00,0),(28,1,'2014-07-27 03:49:30',1,'AAA1813','07900642131_1406432962','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406459700,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}}','',1.00,0.00,0.00,1.00,1.00,0.00,1.00,0),(29,1,'2014-07-27 09:11:45',1,'AAA1814','07900642131_1406452301','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407410100,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,3.00,0.00,3.00,0),(30,1,'2014-07-27 09:33:05',1,'AAA1815','07900642131_1406453539','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guilford','Surrey','GU21 5ED','cffsd',1406461500,'delivery','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',5.99,0.00,0.00,5.99,5.99,0.00,5.99,0),(31,1,'2014-07-27 10:17:15',1,'AAA1816','07900642131_1406456021','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guilford','Surrey','GU21 5ED','cffsd',1406461500,'delivery','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,3.00,0.00,3.00,0),(32,1,'2014-07-27 10:19:14',1,'AAA1817','07900642131_1406456306','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guilford','Surrey','GU21 5ED','cffsd',1406461500,'delivery','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,3.00,0.00,3.00,0),(33,1,'2014-07-27 10:30:21',1,'AAA1818','07900642131_1406456988','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406459700,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',8.95,0.00,0.00,8.95,8.95,0.00,8.95,0),(34,1,'2014-07-27 10:49:45',1,'AAA1819','07900642131_1406458141','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406459700,'collection','','paypal','Pending','a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',9.00,0.00,0.00,9.00,9.00,0.00,9.00,0),(35,1,'2014-07-27 16:29:38',1,'AAA1820','07900642131_1406478515','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407410100,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',6.00,0.00,0.00,6.00,6.00,0.00,6.00,0),(36,1,'2014-07-27 16:31:27',1,'AAA1821','07900642131_1406478648','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407496500,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}}','',4.00,0.00,0.00,4.00,4.00,0.00,4.00,0),(37,1,'2014-07-27 16:33:03',1,'AAA1822','07900642131_1406478722','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407842100,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',7.95,0.00,0.00,7.95,7.95,0.00,7.95,0),(38,1,'2014-07-27 16:46:02',1,'AAA1823','07900642131_1406479176','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407064500,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',10.95,0.00,0.00,10.95,10.95,0.00,10.95,0),(39,1,'2014-07-27 19:22:02',1,'AAA1824','07900642131_1406488878','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','48','Walton Court','','Woking','Surrey','surrey','GU21 5ED','sczdf',1407671100,'delivery','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,3.00,0.00,3.00,0),(40,1,'2014-07-27 21:12:13',1,'AAA1825','07900642131_1406495471','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407669300,'collection','','paypal','Pending','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',3.00,0.00,0.00,3.00,3.00,0.00,3.00,0),(41,1,'2014-07-27 22:35:35',1,'AAA1826','07900642131_1406500494','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406546100,'collection','','paypal','Pending','a:4:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:9:\"sdfghjkl;\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}}','',17.95,0.00,0.00,17.95,17.95,0.00,17.95,0),(42,1,'2014-07-27 22:37:48',1,'AAA1827','07900642131_1406500618','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406546100,'collection','','paypal','Pending','a:7:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"6\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Shashlik\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:5;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:6;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"6\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Shashlik\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',53.69,0.00,0.00,53.69,53.69,0.00,53.69,0),(43,1,'2014-07-27 22:42:14',1,'AAA1828','07900642131_1406500887','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406546100,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',9.95,0.00,0.00,9.95,9.95,0.00,9.95,0),(44,1,'2014-07-27 22:45:52',1,'AAA1829','07900642131_1406501097','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406546100,'collection','','paypal','Pending','a:5:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',40.75,0.00,0.00,40.75,40.75,0.00,40.75,0),(45,1,'2014-07-27 22:47:47',1,'AAA1830','07900642131_1406501179','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406546100,'collection','','paypal','Pending','a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"6\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Shashlik\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"5\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',24.85,0.00,0.00,24.85,24.85,0.00,24.85,0),(46,1,'2014-07-27 22:49:17',1,'AAA1831','07900642131_1406501295','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406546100,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',16.90,0.00,0.00,16.90,16.90,0.00,16.90,0),(47,1,'2014-07-27 22:54:21',1,'AAA1832','07900642131_1406501577','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406546100,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',16.90,0.00,0.00,16.90,16.90,0.00,16.90,0),(48,1,'2014-07-27 23:03:05',1,'AAA1833','07900642131_1406502122','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406546100,'collection','','paypal','Pending','a:4:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.00\";s:4:\"meat\";a:3:{i:0;s:1:\"7\";i:1;s:4:\"7.00\";i:2;s:13:\"Chicken Tikka\";}}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',30.85,0.00,0.00,30.85,30.85,0.00,30.85,0),(49,1,'2014-07-27 23:05:53',1,'AAA1834','07900642131_1406502275','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406546100,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',15.90,0.00,0.00,15.90,15.90,0.00,15.90,0),(50,1,'2014-07-31 04:32:04',1,'AAA1835','07900642131_1406781059','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1406805300,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',10.95,0.00,0.00,10.95,10.95,0.00,10.95,0),(51,1,'2014-08-02 21:04:19',1,'AAA1836','07900642131_1407013455','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408274100,'collection','','cash',NULL,'a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',10.95,0.00,0.00,10.95,10.95,0.00,10.95,0),(52,1,'2014-08-02 21:07:21',1,'AAA1837','07900642131_1407013639','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','','','','','','','','',1408533300,'collection','','cash',NULL,'a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',9.95,0.00,0.00,9.95,9.95,0.00,9.95,0),(53,1,'2014-08-03 09:54:11',1,'AAA1838','07900642131_1407059199','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','','','','','','','','',1407064500,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"5\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',24.85,0.00,0.00,24.85,24.85,0.00,24.85,0),(54,1,'2014-08-03 09:54:49',1,'AAA1839','07900642131_1407059686','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','','','','','','','','',1408014900,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"8\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Tandoori King Prawn\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',19.90,0.00,0.00,19.90,19.90,0.00,19.90,0),(55,1,'2014-08-03 16:58:09',1,'AAA1840','07900642131_1407085025','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','','','','','','','','',1407928500,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}}','',11.94,0.00,0.00,11.94,11.94,0.00,11.94,0),(56,1,'2014-08-03 16:59:49',1,'AAA1841','07900642131_1407085118','AAA1786','Amzad','Mojumder','amjadfof@gmail.com','07900642131','','','','','','','','',1408360500,'collection','','paypal','Pending','a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}}','',10.94,0.00,0.00,10.94,10.94,0.00,10.94,0),(57,1,'2014-08-03 18:15:26',1,'AAA1842','07900642131_1407089722','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407842100,'collection','','cash',NULL,'a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',15.90,0.00,0.00,15.90,15.90,0.00,15.90,0),(58,1,'2014-08-03 18:16:21',1,'AAA1843','07900642131_1407089770','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408274100,'collection','','cash',NULL,'a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',15.90,0.00,0.00,15.90,15.90,0.00,15.90,0),(59,1,'2014-08-03 18:20:57',1,'AAA1844','07900642131_1407090049','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407928500,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',7.95,0.00,0.00,7.95,7.95,0.00,7.95,0),(60,1,'2014-08-03 18:47:11',1,'AAA1845','07900642131_1407091625','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408014900,'collection','','cash',NULL,'a:36:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"9\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:12:\"Tava Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:5;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:6;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:7;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"12\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"King Prawn Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:8;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:9;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"8\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Tandoori King Prawn\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:10;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"5\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:11;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}i:12;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.00\";s:4:\"meat\";a:3:{i:0;s:1:\"7\";i:1;s:4:\"7.00\";i:2;s:13:\"Chicken Tikka\";}}i:13;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:14;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:15;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:16;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"5\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:17;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"6\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Shashlik\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:18;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"8\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Tandoori King Prawn\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:19;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"9\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:12:\"Tava Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:20;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:21;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:22;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"12\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"King Prawn Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:23;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:24;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"13\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Chicken Tikka Pathia\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:25;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"16\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:24:\"Chicken & Mushroom Curry\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:26;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"12\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"King Prawn Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:27;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:28;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"6\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Shashlik\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:29;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:30;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"8\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Tandoori King Prawn\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:31;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"12\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"King Prawn Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:32;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:33;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:34;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:35;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',288.38,0.00,0.00,288.38,288.38,0.00,288.38,0),(61,1,'2014-08-03 19:21:48',1,'AAA1846','07900642131_1407093704','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408020300,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',19.89,0.00,0.00,19.89,19.89,0.00,19.89,0),(62,1,'2014-08-03 19:22:26',1,'AAA1847','07900642131_1407093743','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408101300,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',19.89,0.00,0.00,19.89,19.89,0.00,19.89,0),(63,1,'2014-08-03 19:31:50',1,'AAA1848','07900642131_1407093996','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408101300,'collection','','cash',NULL,'a:6:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:5;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',49.70,0.00,0.00,49.70,49.70,0.00,49.70,0),(64,1,'2014-08-03 20:35:53',1,'AAA1849','07900642131_1407094613','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407755700,'collection','','cash',NULL,'a:5:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"6\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Shashlik\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"8\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Tandoori King Prawn\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',34.80,0.00,0.00,34.80,34.80,0.00,34.80,0),(65,1,'2014-08-03 20:38:36',1,'AAA1850','07900642131_1407098313','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408533300,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',8.95,0.00,0.00,8.95,8.95,0.00,8.95,0),(66,1,'2014-08-03 20:39:27',1,'AAA1851','07900642131_1407098362','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408274100,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',25.85,0.00,0.00,25.85,25.85,0.00,25.85,0),(67,1,'2014-08-03 20:39:55',1,'AAA1852','07900642131_1407098392','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407842100,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',7.95,0.00,0.00,7.95,7.95,0.00,7.95,0),(68,1,'2014-08-03 20:40:31',1,'AAA1853','07900642131_1407098427','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407582900,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',24.85,0.00,0.00,24.85,24.85,0.00,24.85,0),(69,1,'2014-08-03 20:41:07',1,'AAA1854','07900642131_1407098464','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408446900,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',8.95,0.00,0.00,8.95,8.95,0.00,8.95,0),(70,1,'2014-08-03 20:41:50',1,'AAA1855','07900642131_1407098508','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407842100,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',25.85,0.00,0.00,25.85,25.85,0.00,25.85,0),(71,1,'2014-08-03 20:42:18',1,'AAA1856','07900642131_1407098536','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408101300,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',25.85,0.00,0.00,25.85,25.85,0.00,25.85,0),(72,1,'2014-08-03 20:42:58',1,'AAA1857','07900642131_1407098575','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408446900,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',18.89,0.00,0.00,18.89,18.89,0.00,18.89,0),(73,1,'2014-08-03 20:54:02',1,'AAA1858','07900642131_1407099239','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407669300,'collection','','cash',NULL,'a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',16.90,0.00,0.00,16.90,16.90,0.00,16.90,0),(74,1,'2014-08-03 20:56:26',1,'AAA1859','07900642131_1407099383','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1407842100,'collection','','cash',NULL,'a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}}','',4.00,0.00,0.00,4.00,4.00,0.00,4.00,0),(75,1,'2014-08-03 20:56:54',1,'AAA1860','07900642131_1407099411','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408014900,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',25.85,0.00,0.00,25.85,25.85,0.00,25.85,0),(76,1,'2014-08-03 20:57:23',1,'AAA1861','07900642131_1407099440','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408101300,'collection','','cash',NULL,'a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',16.90,0.00,0.00,16.90,16.90,0.00,16.90,0),(77,1,'2014-08-09 14:07:26',1,'AAA1862','07900642131_1407593242','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408274100,'collection','','cash',NULL,'a:3:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"6\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Shashlik\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',19.90,0.00,0.00,19.90,19.90,0.00,19.90,0),(78,1,'2014-08-09 14:07:45',1,'AAA1863','07900642131_1407593262','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408274100,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}}','',1.00,0.00,0.00,1.00,1.00,0.00,1.00,0),(79,1,'2014-08-09 14:08:26',1,'AAA1864','07900642131_1407593303','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408360500,'collection','','cash',NULL,'a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',7.95,0.00,0.00,7.95,7.95,0.00,7.95,0),(80,1,'2014-08-10 10:44:56',1,'AAA1865','07900642131_1407667490','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408792500,'collection','','cash',NULL,'a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"15\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:18:\"Chicken Rogan Josh\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"16\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:24:\"Chicken & Mushroom Curry\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',16.90,0.00,0.00,16.90,16.90,0.00,16.90,0),(81,1,'2014-08-10 10:45:41',1,'AAA1866','07900642131_1407667519','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1409051700,'collection','','cash',NULL,'a:2:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',16.90,0.00,0.00,16.90,16.90,0.00,16.90,0),(82,1,'2014-08-10 10:46:58',1,'AAA1867','07900642131_1407667608','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408792500,'collection','','cash',NULL,'a:10:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"5\";i:1;s:4:\"3.00\";i:2;s:10:\"King Prwan\";}}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.00\";s:4:\"meat\";a:3:{i:0;s:1:\"7\";i:1;s:4:\"7.00\";i:2;s:13:\"Chicken Tikka\";}}i:5;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:6;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"6\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Shashlik\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:7;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"5\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:8;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:9;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"8\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Tandoori King Prawn\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',65.68,0.00,0.00,65.68,65.68,0.00,65.68,0),(83,1,'2014-08-10 10:51:58',1,'AAA1868','07900642131_1407667906','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1408533300,'collection','','cash',NULL,'a:14:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"14\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Chicken Tikka Bhuna\";s:4:\"note\";s:4:\"Test\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"15\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:18:\"Chicken Rogan Josh\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"16\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:24:\"Chicken & Mushroom Curry\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"15\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:18:\"Chicken Rogan Josh\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"14\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Chicken Tikka Bhuna\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:5;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"5\";i:1;s:4:\"3.00\";i:2;s:10:\"King Prwan\";}}i:6;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.00\";s:4:\"meat\";a:3:{i:0;s:1:\"7\";i:1;s:4:\"7.00\";i:2;s:13:\"Chicken Tikka\";}}i:7;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:8;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"9\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:12:\"Tava Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:9;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.00\";s:4:\"meat\";a:3:{i:0;s:1:\"7\";i:1;s:4:\"7.00\";i:2;s:13:\"Chicken Tikka\";}}i:10;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"5\";i:1;s:4:\"3.00\";i:2;s:10:\"King Prwan\";}}i:11;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"14\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Chicken Tikka Bhuna\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:12;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"15\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:18:\"Chicken Rogan Josh\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:13;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"16\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:24:\"Chicken & Mushroom Curry\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',105.50,0.00,0.00,105.50,105.50,0.00,105.50,0),(84,1,'2014-08-17 16:18:10',1,'AAA1869','07900642131_1408292287','AAA1786','amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1409310900,'collection','','cash',NULL,'a:6:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"13\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Chicken Tikka Pathia\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"14\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Chicken Tikka Bhuna\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:5;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"16\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:24:\"Chicken & Mushroom Curry\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',50.70,0.00,0.00,50.70,50.70,0.00,50.70,0),(85,1,'2014-08-17 16:20:12',1,'AAA1870','07900642131_1408292400','AAA1786','amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1409138100,'collection','','cash',NULL,'a:4:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.00\";s:4:\"meat\";a:3:{i:0;s:1:\"7\";i:1;s:4:\"7.00\";i:2;s:13:\"Chicken Tikka\";}}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}}','',24.90,0.00,0.00,24.90,24.90,0.00,24.90,0),(86,1,'2014-08-17 16:24:40',1,'AAA1871','07900642131_1408292622','AAA1786','amzad','Mojumder','amzadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guilford','Surrey','GU215ED','',1409483700,'delivery','','cash',NULL,'a:27:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:5;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"12\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"King Prawn Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:6;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"12\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"King Prawn Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:7;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"5\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:8;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"6\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Shashlik\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:9;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:10;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"8\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Tandoori King Prawn\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:11;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"8\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Tandoori King Prawn\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:12;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:13;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"14\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Chicken Tikka Bhuna\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:14;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"16\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:24:\"Chicken & Mushroom Curry\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:15;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"13\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Chicken Tikka Pathia\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:16;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"14\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Chicken Tikka Bhuna\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:17;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"15\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:18:\"Chicken Rogan Josh\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:18;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:19;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:20;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:21;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"12\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"King Prawn Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:22;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:23;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"9\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:12:\"Tava Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:24;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:25;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:26;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"12\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"King Prawn Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',229.65,0.00,0.00,229.65,229.65,0.00,229.65,0),(87,1,'2014-08-17 16:30:47',1,'AAA1872','07900642131_1408292947','AAA1786','amzad','Mojumder','amzadfof@gmail.com','07900642131','48','Walton Court','','Woking','Guilford','Surrey','GU215ED','',1409053500,'delivery','','paypal','Pending','a:33:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:1;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"18\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Tandoori Chicken 1/4\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"2.99\";s:4:\"meat\";b:0;}i:2;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}i:3;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.00\";s:4:\"meat\";a:3:{i:0;s:1:\"7\";i:1;s:4:\"7.00\";i:2;s:13:\"Chicken Tikka\";}}i:4;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:5;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:6;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"2\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"1.00\";s:4:\"meat\";a:3:{i:0;s:1:\"4\";i:1;s:4:\"1.00\";i:2;s:5:\"Prwan\";}}i:7;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:8;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:9;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"4\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:10:\"Lamb Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:10;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"17\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Sheek Kebab\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:11;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"1\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:11:\"Onion Bhaji\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"3.00\";s:4:\"meat\";a:3:{i:0;s:1:\"1\";i:1;s:4:\"3.00\";i:2;s:4:\"Lamb\";}}i:12;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:13;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:14;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"9\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:12:\"Tava Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:15;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:16;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"10\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:14:\"Karahi Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:17;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"9\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:12:\"Tava Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:18;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"11\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Chicken Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:19;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"12\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"King Prawn Jalfrezi\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:20;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"13\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Chicken Tikka Pathia\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:21;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"14\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Chicken Tikka Bhuna\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:22;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"16\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:24:\"Chicken & Mushroom Curry\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:23;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"13\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Chicken Tikka Pathia\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:24;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"14\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Chicken Tikka Bhuna\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:25;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"15\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:18:\"Chicken Rogan Josh\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:26;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"16\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:24:\"Chicken & Mushroom Curry\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:27;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"5\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:28;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"7\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:16:\"Tandoori Chicken\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:29;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"15\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:18:\"Chicken Rogan Josh\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:30;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"13\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:20:\"Chicken Tikka Pathia\";s:4:\"note\";s:4:\"test\";s:5:\"price\";s:4:\"7.95\";s:4:\"meat\";b:0;}i:31;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"14\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:19:\"Chicken Tikka Bhuna\";s:4:\"note\";s:4:\"test\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}i:32;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:2:\"16\";s:2:\"sn\";s:1:\"1\";s:5:\"title\";s:24:\"Chicken & Mushroom Curry\";s:4:\"note\";s:4:\"test\";s:5:\"price\";s:4:\"8.95\";s:4:\"meat\";b:0;}}','',250.59,0.00,0.00,250.59,250.59,0.00,250.59,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `order_code` varchar(7) NOT NULL,
  `printed` tinyint(4) NOT NULL DEFAULT '0',
  `print_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_code` (`order_code`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_cwdp`
--

LOCK TABLES `orders_cwdp` WRITE;
/*!40000 ALTER TABLE `orders_cwdp` DISABLE KEYS */;
INSERT INTO `orders_cwdp` VALUES (1,1,'2014-07-26 17:18:13',1,'AAA1786',0,NULL),(2,1,'2014-07-26 17:23:22',1,'AAA1787',0,NULL),(3,1,'2014-08-16 11:25:15',1,'AAA1788',1,1408191914),(4,1,'2014-07-26 17:29:22',1,'AAA1789',0,NULL),(5,1,'2014-07-26 17:32:58',1,'AAA1790',0,NULL),(6,1,'2014-07-26 17:34:15',1,'AAA1791',0,NULL),(7,1,'2014-07-26 17:38:32',1,'AAA1792',0,NULL),(8,1,'2014-07-26 17:39:31',1,'AAA1793',0,NULL),(9,1,'2014-07-26 17:47:12',1,'AAA1794',0,NULL),(10,1,'2014-07-26 17:51:12',1,'AAA1795',0,NULL),(11,1,'2014-07-26 17:52:29',1,'AAA1796',0,NULL),(12,1,'2014-07-26 17:54:10',1,'AAA1797',0,NULL),(13,1,'2014-07-26 18:25:17',1,'AAA1798',0,NULL),(14,1,'2014-07-26 18:37:11',1,'AAA1799',0,NULL),(15,1,'2014-07-26 18:39:37',1,'AAA1800',0,NULL),(16,1,'2014-07-26 18:45:25',1,'AAA1801',0,NULL),(17,1,'2014-07-26 18:47:15',1,'AAA1802',0,NULL),(18,1,'2014-07-26 18:52:36',1,'AAA1803',0,NULL),(19,1,'2014-07-26 19:00:20',1,'AAA1804',0,NULL),(20,1,'2014-07-26 19:21:41',1,'AAA1805',0,NULL),(21,1,'2014-07-26 19:34:39',1,'AAA1806',0,NULL),(22,1,'2014-07-26 19:36:47',1,'AAA1807',0,NULL),(23,1,'2014-07-27 03:32:40',1,'AAA1808',0,NULL),(24,1,'2014-07-27 03:34:42',1,'AAA1809',0,NULL),(25,1,'2014-07-27 03:35:18',1,'AAA1810',0,NULL),(26,1,'2014-07-27 03:37:28',1,'AAA1811',0,NULL),(27,1,'2014-07-27 03:48:08',1,'AAA1812',0,NULL),(28,1,'2014-07-27 03:49:30',1,'AAA1813',0,NULL),(29,1,'2014-07-27 09:11:45',1,'AAA1814',0,NULL),(30,1,'2014-07-27 09:33:05',1,'AAA1815',0,NULL),(31,1,'2014-07-27 10:17:15',1,'AAA1816',0,NULL),(32,1,'2014-07-27 10:19:14',1,'AAA1817',0,NULL),(33,1,'2014-07-27 10:30:21',1,'AAA1818',0,NULL),(34,1,'2014-07-27 10:49:45',1,'AAA1819',0,NULL),(35,1,'2014-07-27 16:29:38',1,'AAA1820',0,NULL),(36,1,'2014-07-27 16:31:27',1,'AAA1821',0,NULL),(37,1,'2014-07-27 16:33:03',1,'AAA1822',0,NULL),(38,1,'2014-07-27 16:46:02',1,'AAA1823',0,NULL),(39,1,'2014-07-27 19:22:02',1,'AAA1824',0,NULL),(40,1,'2014-07-27 21:12:13',1,'AAA1825',0,NULL),(41,1,'2014-07-27 22:35:35',1,'AAA1826',0,NULL),(42,1,'2014-07-27 22:37:48',1,'AAA1827',0,NULL),(43,1,'2014-07-27 22:42:14',1,'AAA1828',0,NULL),(44,1,'2014-07-27 22:45:52',1,'AAA1829',0,NULL),(45,1,'2014-07-27 22:47:47',1,'AAA1830',0,NULL),(46,1,'2014-07-27 22:49:17',1,'AAA1831',0,NULL),(47,1,'2014-07-27 22:54:21',1,'AAA1832',0,NULL),(48,1,'2014-07-27 23:03:05',1,'AAA1833',0,NULL),(49,1,'2014-07-27 23:05:53',1,'AAA1834',0,NULL),(50,1,'2014-07-31 04:32:04',1,'AAA1835',0,NULL),(51,1,'2014-08-02 21:04:19',1,'AAA1836',0,NULL),(52,1,'2014-08-02 21:07:21',1,'AAA1837',0,NULL),(53,1,'2014-08-03 09:54:11',1,'AAA1838',0,NULL),(54,1,'2014-08-03 09:54:49',1,'AAA1839',0,NULL),(55,1,'2014-08-03 16:58:09',1,'AAA1840',0,NULL),(56,1,'2014-08-03 16:59:49',1,'AAA1841',0,NULL),(57,1,'2014-08-03 18:15:26',1,'AAA1842',0,NULL),(58,1,'2014-08-03 18:16:21',1,'AAA1843',0,NULL),(59,1,'2014-08-03 18:20:57',1,'AAA1844',0,NULL),(60,1,'2014-08-03 18:47:11',1,'AAA1845',0,NULL),(61,1,'2014-08-03 19:21:48',1,'AAA1846',0,NULL),(62,1,'2014-08-03 19:22:26',1,'AAA1847',0,NULL),(63,1,'2014-08-03 19:31:50',1,'AAA1848',0,NULL),(64,1,'2014-08-03 20:35:53',1,'AAA1849',0,NULL),(65,1,'2014-08-03 20:38:36',1,'AAA1850',0,NULL),(66,1,'2014-08-03 20:39:27',1,'AAA1851',0,NULL),(67,1,'2014-08-03 20:39:55',1,'AAA1852',0,NULL),(68,1,'2014-08-03 20:40:31',1,'AAA1853',0,NULL),(69,1,'2014-08-03 20:41:07',1,'AAA1854',0,NULL),(70,1,'2014-08-03 20:41:50',1,'AAA1855',0,NULL),(71,1,'2014-08-03 20:42:18',1,'AAA1856',0,NULL),(72,1,'2014-08-03 20:42:58',1,'AAA1857',0,NULL),(73,1,'2014-08-03 20:54:02',1,'AAA1858',0,NULL),(74,1,'2014-08-03 20:56:26',1,'AAA1859',0,NULL),(75,1,'2014-08-03 20:56:54',1,'AAA1860',0,NULL),(76,1,'2014-08-03 20:57:23',1,'AAA1861',0,NULL),(77,1,'2014-08-09 14:07:26',1,'AAA1862',0,NULL),(78,1,'2014-08-09 14:07:45',1,'AAA1863',0,NULL),(79,1,'2014-08-09 14:08:26',1,'AAA1864',0,NULL),(80,1,'2014-08-10 10:44:56',1,'AAA1865',0,NULL),(81,1,'2014-08-10 10:45:41',1,'AAA1866',0,NULL),(82,1,'2014-08-10 10:46:58',1,'AAA1867',0,NULL),(83,1,'2014-08-10 10:51:58',1,'AAA1868',0,NULL),(84,1,'2014-08-17 16:18:10',1,'AAA1869',0,NULL),(85,1,'2014-08-17 16:20:12',1,'AAA1870',0,NULL),(86,1,'2014-08-17 16:24:40',1,'AAA1871',0,NULL),(87,1,'2014-08-17 16:30:47',1,'AAA1872',0,NULL);
/*!40000 ALTER TABLE `orders_cwdp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_contact`
--

DROP TABLE IF EXISTS `page_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `api` varchar(128) DEFAULT NULL,
  `lat` varchar(32) DEFAULT NULL,
  `lng` varchar(32) DEFAULT NULL,
  `marker_src` text,
  `marker_visible` tinyint(4) DEFAULT NULL,
  `zoom` int(11) DEFAULT '16',
  `width` varchar(32) DEFAULT '100%',
  `height` varchar(32) DEFAULT '300px',
  `page_template` varchar(128) DEFAULT 'about/contact',
  `map_active` int(4) DEFAULT NULL,
  `contact_form` int(4) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `phone` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_contact`
--

LOCK TABLES `page_contact` WRITE;
/*!40000 ALTER TABLE `page_contact` DISABLE KEYS */;
INSERT INTO `page_contact` VALUES (1,1,'2014-06-29 23:33:13',1,NULL,'51.330343','-0.547510','#',1,16,'100%','400px','/about/contact',1,1,'#','#');
/*!40000 ALTER TABLE `page_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_card`
--

DROP TABLE IF EXISTS `pay_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `acquirer` varchar(128) DEFAULT NULL,
  `pre_shared_key` text,
  `merchant_id` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `pre_shared_key_test` text,
  `merchant_id_test` varchar(256) DEFAULT NULL,
  `password_test` varchar(256) DEFAULT NULL,
  `order_description` varchar(256) DEFAULT NULL,
  `transaction_type` varchar(256) DEFAULT 'SALE',
  `fdms_mid` varchar(256) DEFAULT NULL,
  `test_node` tinyint(4) NOT NULL DEFAULT '0',
  `image` text,
  `credit_card_fee` decimal(20,2) DEFAULT '0.20',
  `debit_card_fee` decimal(20,2) DEFAULT '2.20',
  `flat_fee` decimal(20,2) DEFAULT '-2.00' COMMENT 'if -2, Apply Calculated Fee ',
  `pay_after_transaction` tinyint(4) NOT NULL DEFAULT '0',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='### ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_card`
--

LOCK TABLES `pay_card` WRITE;
/*!40000 ALTER TABLE `pay_card` DISABLE KEYS */;
INSERT INTO `pay_card` VALUES (1,1,'2014-07-04 09:52:17',1,'payment_sense','test','test','test','test','test','test','test','SALE','test',0,'img',0.20,2.20,-2.00,0,10.00);
/*!40000 ALTER TABLE `pay_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_cash`
--

DROP TABLE IF EXISTS `pay_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  `captcha` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###Not updateable with form. Has to update via software / db process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_cash`
--

LOCK TABLES `pay_cash` WRITE;
/*!40000 ALTER TABLE `pay_cash` DISABLE KEYS */;
INSERT INTO `pay_cash` VALUES (1,1,'2014-07-04 09:06:58',1,10.00,1);
/*!40000 ALTER TABLE `pay_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_paypal`
--

DROP TABLE IF EXISTS `pay_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_paypal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `api_username` text,
  `api_password` text,
  `api_signature` text,
  `test_api_username` text,
  `test_api_password` text,
  `test_api_signature` text,
  `image` text,
  `transaction_fee` decimal(20,2) DEFAULT '0.20',
  `commision` decimal(20,2) DEFAULT '3.20',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  `email_address` varchar(512) DEFAULT 'paypal@allinepos.co.uk',
  `action_type` varchar(32) DEFAULT 'integrated' COMMENT 'paynow/integrated/payment_pro',
  `sandbox` tinyint(4) NOT NULL DEFAULT '0',
  `flat_fee` decimal(20,2) DEFAULT '0.20',
  `pay_after_transaction` tinyint(4) NOT NULL DEFAULT '0',
  `index_redirect_url` varchar(512) DEFAULT NULL,
  `log_dir` varchar(512) DEFAULT NULL,
  `transaction_log` varchar(512) DEFAULT NULL,
  `exception_log` varchar(512) DEFAULT NULL,
  `log_file_active` tinyint(4) NOT NULL DEFAULT '1',
  `http_response_log` varchar(512) NOT NULL DEFAULT '1',
  `http_response_log_active` tinyint(4) NOT NULL DEFAULT '1',
  `log_query_string_active` tinyint(4) NOT NULL DEFAULT '1',
  `completed_message` text,
  `pending_message` text,
  `success_url` varchar(512) DEFAULT NULL,
  `pending_url` varchar(512) DEFAULT NULL,
  `site_logo` varchar(512) DEFAULT NULL,
  `cart_border_color` varchar(256) DEFAULT NULL,
  `currency_code` varchar(256) DEFAULT NULL,
  `return_url` varchar(256) DEFAULT NULL,
  `cancel_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###Not updateable with form. Has to update via software / db process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_paypal`
--

LOCK TABLES `pay_paypal` WRITE;
/*!40000 ALTER TABLE `pay_paypal` DISABLE KEYS */;
INSERT INTO `pay_paypal` VALUES (1,230,'2014-07-21 03:24:22',1,'m82amjad_api1.hotmail.co.uk','W4W9MCXCZ9DL4938','AamyNj8hYYmtqQkScocIJA2nHc2KAphH9D-oD3aGUcOr8fR.riuDM75B','seller_1317255315_biz_api1.gmail.com','1317255350','AFcWxV21C7fd0v3bYYYRCpSSRl31AsEXo1mfs5m9KpiElKsbTiQR9C2V','#',0.20,3.40,5.00,'m82amjad@gmail.com','integrated',1,-2.00,0,'takeaway/confirm','var/log','paypal.log','exception.log',1,'paypal_http_response.log',1,1,'Payment Received! Your product will be sent to you very soon!','Transaction Complete. But payment is still pending! <br /> You need to manually authorize this payment in your <a href=\'http://www.paypal.com\'>Paypal Account</a>','takeaway/process_order','takeaway/process_order','http://al-aminrestaurant.co.uk/img/menu/logoPaypal.png','000000','GBP','paypal/process','takeaway/order_details');
/*!40000 ALTER TABLE `pay_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_category`
--

DROP TABLE IF EXISTS `prod_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL,
  `sn` int(11) NOT NULL DEFAULT '1',
  `parent_category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `description` text,
  `takeaway_sit_in` varchar(32) NOT NULL DEFAULT 'takeaway',
  `image_src` text,
  `image_href` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_category`
--

LOCK TABLES `prod_category` WRITE;
/*!40000 ALTER TABLE `prod_category` DISABLE KEYS */;
INSERT INTO `prod_category` VALUES (1,1,'2014-04-13 09:21:36',1,1,0,'Takeaway Menu','All starter served with salad, mint sauce and a plain naan.','takeaway','http://neilhennessyvass.com/wp-content/uploads/2013/07/Potato-pre-starter.jpg',NULL),(2,1,'2014-04-13 09:21:36',1,1,1,'Starter','All starter served with salad, mint sauce and a plain naan.','takeaway','http://neilhennessyvass.com/wp-content/uploads/2013/07/Potato-pre-starter.jpg',NULL),(3,1,'2014-04-13 09:21:36',1,1,1,'Tandoori Dishes','All tandoori dishes served with salad, mint sauce and a plain naan.','takeaway','http://neilhennessyvass.com/wp-content/uploads/2013/07/Potato-pre-starter.jpg',NULL),(4,1,'2014-04-13 09:21:36',1,1,1,'Chef Special Dishes','All tandoori dishes served with salad, mint sauce and a plain naan.','takeaway','http://neilhennessyvass.com/wp-content/uploads/2013/07/Potato-pre-starter.jpg',NULL),(5,1,'2014-04-13 09:21:36',1,1,1,'Traditional Dishes','All tandoori dishes served with salad, mint sauce and a plain naan.','takeaway','http://neilhennessyvass.com/wp-content/uploads/2013/07/Potato-pre-starter.jpg',NULL);
/*!40000 ALTER TABLE `prod_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_list`
--

DROP TABLE IF EXISTS `prod_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL,
  `sn` int(11) NOT NULL DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `short_name` varchar(128) DEFAULT '#',
  `name_kitchen` varchar(128) DEFAULT '#',
  `description` text,
  `price` decimal(20,2) DEFAULT '0.00',
  `prod_category_id` int(11) NOT NULL DEFAULT '1',
  `vat` decimal(20,2) NOT NULL DEFAULT '-2.00',
  `instruction` text,
  `default_note` text,
  `note_must` tinyint(4) NOT NULL DEFAULT '0',
  `note_show` tinyint(4) DEFAULT '0',
  `prod_code` varchar(32) DEFAULT '#',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_list`
--

LOCK TABLES `prod_list` WRITE;
/*!40000 ALTER TABLE `prod_list` DISABLE KEYS */;
INSERT INTO `prod_list` VALUES (1,1,'2014-07-22 19:01:29',1,1,'Onion Bhaji','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',7.95,2,-0.99,'fsdf','dfsd',0,0,'#'),(2,1,'2014-07-22 19:01:29',1,1,'Samosa','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',8.95,2,-0.99,'fsdf','dfsd',0,0,'#'),(3,1,'2014-07-22 19:01:29',1,1,'Chicken Tikka','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',7.95,2,-0.99,'fsdf','dfsd',0,0,'#'),(4,1,'2014-07-22 19:01:29',1,1,'Lamb Tikka','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',8.95,2,-0.99,'fsdf','dfsd',0,0,'#'),(5,1,'2014-07-22 19:01:29',1,1,'Chicken Tikka','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',7.95,3,-0.99,'fsdf','dfsd',0,0,'#'),(6,1,'2014-07-22 19:01:29',1,1,'Chicken Shashlik','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',8.95,3,-0.99,'fsdf','dfsd',0,0,'#'),(7,1,'2014-07-22 19:01:29',1,1,'Tandoori Chicken','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',7.95,3,-0.99,'fsdf','dfsd',0,0,'#'),(8,1,'2014-07-22 19:01:29',1,1,'Tandoori King Prawn','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',8.95,3,-0.99,'fsdf','dfsd',0,0,'#'),(9,1,'2014-07-22 19:01:29',1,1,'Tava Chicken','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',7.95,4,-0.99,'fsdf','dfsd',0,0,'#'),(10,1,'2014-07-22 19:01:29',1,1,'Karahi Chicken','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',8.95,4,-0.99,'fsdf','dfsd',0,0,'#'),(11,1,'2014-07-22 19:01:29',1,1,'Chicken Jalfrezi','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',7.95,4,-0.99,'fsdf','dfsd',0,0,'#'),(12,1,'2014-07-22 19:01:29',1,1,'King Prawn Jalfrezi','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',8.95,4,-0.99,'fsdf','dfsd',0,0,'#'),(13,1,'2014-07-22 19:01:29',1,1,'Chicken Tikka Pathia','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',7.95,5,-0.99,'fsdf','dfsd',0,0,'#'),(14,1,'2014-07-22 19:01:29',1,1,'Chicken Tikka Bhuna','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',8.95,5,-0.99,'fsdf','dfsd',0,0,'#'),(15,1,'2014-07-22 19:01:29',1,1,'Chicken Rogan Josh','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',7.95,5,-0.99,'fsdf','dfsd',0,0,'#'),(16,1,'2014-07-22 19:01:29',1,1,'Chicken & Mushroom Curry','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',8.95,5,-0.99,'fsdf','dfsd',0,0,'#'),(17,1,'2014-07-22 19:01:29',1,1,'Sheek Kebab','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',7.95,2,-0.99,'fsdf','dfsd',0,0,'#'),(18,1,'2014-07-22 19:01:29',1,1,'Tandoori Chicken 1/4','#','#','Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree',2.99,2,-0.99,'fsdf','dfsd',0,0,'#');
/*!40000 ALTER TABLE `prod_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_meat_price`
--

DROP TABLE IF EXISTS `prod_meat_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prod_meat_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `prod_list_id` int(11) NOT NULL,
  `prod_meats_id` int(11) NOT NULL,
  `price` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_meat_price`
--

LOCK TABLES `prod_meat_price` WRITE;
/*!40000 ALTER TABLE `prod_meat_price` DISABLE KEYS */;
INSERT INTO `prod_meat_price` VALUES (1,1,'2014-04-19 12:30:20',1,1,1,2,3.00),(2,1,'2014-04-19 12:30:20',1,1,1,1,4.00),(3,1,'2014-04-19 12:30:20',1,1,1,3,5.00),(4,1,'2014-04-19 12:30:20',1,1,2,4,1.00),(5,1,'2014-04-19 12:30:20',1,1,2,5,3.00),(6,1,'2014-04-19 12:30:20',1,1,1,6,6.00),(7,1,'2014-04-19 12:30:20',1,1,1,7,7.00),(8,1,'2014-04-19 12:30:20',1,1,1,8,3.00);
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `short_name` varchar(128) NOT NULL DEFAULT '#',
  `icon` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_meats`
--

LOCK TABLES `prod_meats` WRITE;
/*!40000 ALTER TABLE `prod_meats` DISABLE KEYS */;
INSERT INTO `prod_meats` VALUES (1,1,'2014-04-19 12:14:22',1,1,'Chicken','CH',NULL),(2,1,'2014-04-19 12:14:22',1,2,'Lamb','LM',NULL),(3,1,'2014-04-19 12:14:22',1,3,'Veg','VG',NULL),(4,1,'2014-04-19 12:14:22',1,4,'Prwan','PR',NULL),(5,1,'2014-04-19 12:14:22',1,5,'King Prwan','KP',NULL),(6,1,'2014-04-19 12:14:22',1,6,'King Prwan Tikka','KP',NULL),(7,1,'2014-04-19 12:14:22',1,7,'Chicken Tikka','KP',NULL),(8,1,'2014-04-19 12:14:22',1,8,'Lamb Tikka','KP',NULL);
/*!40000 ALTER TABLE `prod_meats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_opening_hours`
--

DROP TABLE IF EXISTS `services_opening_hours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_opening_hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` bigint(20) DEFAULT NULL,
  `from_` bigint(20) DEFAULT NULL,
  `to_` bigint(20) DEFAULT NULL,
  `day` varchar(3) DEFAULT NULL,
  `collection` varchar(1) DEFAULT 'Y',
  `delivery` varchar(1) DEFAULT 'Y',
  `sit_in` varchar(1) DEFAULT 'Y',
  `waiting_collection` bigint(20) DEFAULT '15',
  `waiting_delivery` bigint(20) DEFAULT '45',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_opening_hours`
--

LOCK TABLES `services_opening_hours` WRITE;
/*!40000 ALTER TABLE `services_opening_hours` DISABLE KEYS */;
INSERT INTO `services_opening_hours` VALUES (1,7,'2014-04-19 12:30:20',1,1,1050,1380,'Mon','N','Y','N',15,45),(2,7,'2014-04-19 12:30:20',1,2,1050,1380,'Tue','N','Y','N',15,45),(3,7,'2014-04-19 12:30:20',1,3,1050,1380,'Wed','N','Y','N',15,45),(4,7,'2014-04-19 12:30:20',1,4,1050,1380,'Thu','N','Y','N',15,45),(5,7,'2014-04-19 12:30:20',1,5,1050,1380,'Fri','N','Y','N',15,45),(6,7,'2014-04-19 12:30:20',1,6,1050,1380,'Sat','N','Y','N',15,45),(7,7,'2014-04-19 12:30:20',1,7,1050,1380,'Sun','N','Y','N',15,45),(8,1,'2014-04-19 12:30:20',1,8,720,840,'Mon','Y','N','N',15,45),(9,1,'2014-04-19 12:30:20',1,9,720,840,'Tue','Y','N','N',15,45),(10,1,'2014-04-19 12:30:20',1,10,720,840,'Wed','Y','N','N',15,45),(11,1,'2014-04-19 12:30:20',1,11,720,840,'Thu','Y','N','N',15,45),(12,1,'2014-04-19 12:30:20',1,12,720,840,'Fri','Y','N','N',15,45),(13,1,'2014-04-19 12:30:20',1,13,720,840,'Sat','Y','N','N',15,45),(14,1,'2014-04-19 12:30:20',1,14,720,840,'Sun','Y','N','N',15,45);
/*!40000 ALTER TABLE `services_opening_hours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings_business`
--

DROP TABLE IF EXISTS `settings_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `business_code` varchar(256) NOT NULL DEFAULT 'New',
  `business_name` varchar(256) NOT NULL DEFAULT 'New',
  `logo` text NOT NULL,
  `business_slogan` text NOT NULL,
  `email_customer_service` varchar(256) NOT NULL,
  `email_operation` varchar(256) NOT NULL,
  `email_billing` varchar(256) NOT NULL,
  `email_order` varchar(256) NOT NULL,
  `email_order_support` varchar(256) DEFAULT 'orders@allinepos.co.uk',
  `phone1` varchar(32) NOT NULL,
  `phone2` varchar(32) DEFAULT NULL,
  `phone3` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `house_number` varchar(128) DEFAULT NULL,
  `address1` varchar(256) DEFAULT NULL,
  `address2` varchar(256) DEFAULT NULL,
  `town` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `county` varchar(256) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `postcode` varchar(256) NOT NULL,
  `direction` text,
  `vat_no` varchar(16) DEFAULT NULL,
  `web_url` text NOT NULL,
  `use_ssl` tinyint(4) NOT NULL DEFAULT '0',
  `manager_fnames` varchar(128) NOT NULL,
  `manager_lname` varchar(128) NOT NULL,
  `manager_phone` varchar(128) NOT NULL,
  `established` varchar(128) DEFAULT NULL,
  `pizza_supported` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings_business`
--

LOCK TABLES `settings_business` WRITE;
/*!40000 ALTER TABLE `settings_business` DISABLE KEYS */;
INSERT INTO `settings_business` VALUES (1,1,'2014-07-26 17:50:06',1,'New','Indian Ocean','/img/struct/logo.png','Best food in town','m82amjad@gmail.com','m82amjad@gmail.com','m82amjad@gmail.com','m82amjad@gmail.com','m82amjad@gmail.com','02086600022','02086600044','','','13','Brighton Road','','','Purley','London','UK','CR8 4DA','','12345677','http://indianoceanpurley.com',0,'Amzad','Mojudmer','07900642131','2014','N');
/*!40000 ALTER TABLE `settings_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'127.0.0.1','amzadmojumder','$2y$08$vIfmHwcC6nP.UBIPtiCCSecavSKJZWFrYR6kH5kVJPi5nj.Z0Rq8C',NULL,'amzadfof@gmail.com',NULL,NULL,NULL,NULL,1405554124,1406781025,1,'Amzad','Mojumder','Conosurtek Ltd','07900642131'),(2,'127.0.0.1','administrator','$2y$08$8QTHU1aiZEgzos6tcIe8VuNSB39T2SsG9N9bKB.YZeizpfhIQ5FkO','','mr@conosurtek.net','',NULL,NULL,'bS14eFoGrrswcWLXHnNnFu',1268889823,1405553968,1,'Muhammad Rezwanur',' Rahman','Conosurtek Ltd','07900642131'),(3,'127.0.0.1','lalitasahu','$2y$08$HTRaaXBuUGAueqNQA8IUMe9unSWhgmsXjvvKHRJtR9khA32/G7ywi',NULL,'lalita@allinepos.co.uk',NULL,NULL,NULL,NULL,1405554460,1405554460,1,'Lalita','Sahu','All In Epos','07402950926'),(4,'127.0.0.1','tanjumkhan','$2y$08$7pdZA8Xlun82RHQ8ING6rOAF80bGKElz3Rp8y0tkhodpTeQR/95xa',NULL,'tanjum@cwaiter.co.uk',NULL,NULL,NULL,NULL,1405555520,1405555520,1,'Tanjum','Khan','Cwaiter Ltd','07900642133');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
INSERT INTO `users_groups` VALUES (25,1,1),(26,1,2),(27,1,3),(11,2,1),(12,2,2),(13,2,3),(19,3,1),(20,3,2),(21,3,3),(22,4,1),(23,4,2),(24,4,3);
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!50001 VIEW `prod_meat_view` AS select `prod_meat_price`.`id` AS `price_id`,`prod_meat_price`.`active` AS `price_active`,`prod_meat_price`.`sn` AS `price_sn`,`prod_meat_price`.`prod_list_id` AS `prod_list_id`,`prod_meat_price`.`price` AS `price`,`prod_meats`.`id` AS `meats_id`,`prod_meats`.`active` AS `meats_active`,`prod_meats`.`title` AS `meats_title`,`prod_meats`.`short_name` AS `short_name`,`prod_meats`.`icon` AS `icon`,`prod_list`.`prod_category_id` AS `prod_category_id` from (`prod_list` left join (`prod_meat_price` left join `prod_meats` on((`prod_meat_price`.`prod_meats_id` = `prod_meats`.`id`))) on((`prod_list`.`id` = `prod_meat_price`.`prod_list_id`))) order by `prod_meat_price`.`sn` */;
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

-- Dump completed on 2014-08-21 15:10:34

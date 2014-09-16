-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: theroyals
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.12.04.1

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
INSERT INTO `ci_sessions` VALUES ('0fe5845b8e0799e8937d9bd789a7e430','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36',1405585833,''),('fee0e5d3acb2b015c75c7c2acf148232','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36',1405585834,'a:27:{s:9:\"user_data\";s:0:\"\";s:13:\"discountPrice\";d:0;s:14:\"delivertCharge\";d:0;s:9:\"receiving\";s:10:\"collection\";s:8:\"discount\";s:0:\"\";s:9:\"payMethod\";s:6:\"paypal\";s:3:\"day\";s:10:\"1405551600\";s:4:\"time\";s:5:\"62100\";s:5:\"email\";s:18:\"amzadfof@gmail.com\";s:5:\"fname\";s:5:\"Amzad\";s:5:\"lname\";s:8:\"Mojumder\";s:5:\"phone\";s:11:\"07900642131\";s:7:\"houseNo\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:8:\"address1\";s:0:\"\";s:4:\"town\";s:0:\"\";s:14:\"transactionFee\";d:0;s:8:\"identity\";s:18:\"amzadfof@gmail.com\";s:8:\"username\";s:13:\"amzadmojumder\";s:7:\"user_id\";s:1:\"1\";s:14:\"old_last_login\";s:10:\"1405554124\";s:9:\"orderNote\";s:0:\"\";s:8:\"address2\";s:0:\"\";s:4:\"city\";s:0:\"\";s:6:\"county\";s:0:\"\";s:18:\"addressInstruction\";s:0:\"\";s:13:\"order_id_temp\";s:22:\"07900642131_1405591235\";}');
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
INSERT INTO `cms_article` VALUES (1,1,'2014-07-17 09:25:12',1,1,'about_us','About Indian Ocean','','<p>Our cooking style is unique and our chefs always make sure that your meal at Indian Ocean is nothing less than perfect&#44; being one of the most established Indian restaurant in Purley. Our customer loyalty yet again proves our constant attention to customer satisfaction. So if you are looking a good night out or a great meal at home like thousands of others make Indian ocean your first choice.If you want to create your own dish&#44; a little hotter&#44; a little creamier? No problem. We allow our customers the option to customize to their suitable needs. Just ask us and we will cook it to order at no extra cost.Our ethos&#44; at Indian Ocean&#44; is to provide sumptuous Indian cuisine enclosed in complete authentic Indian ambiance. Make your takeaway or experience with us a special occasion. </p> <br />','','/takeaway/menu','/img/articles/about_us.jpg','/takeaway/menu','/takeaway/menu','Order Online ','');
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
INSERT INTO `cms_highlights` VALUES (1,515,'0000-00-00 00:00:00',1,1,'welcome','about/home','special','Special Offers !!','#','#','#','/takeaway/menu','/img/highlights/Special.jpg','#','Our special early bird offer only available 5PM to 8 PM (Mon-Thu)','/takeaway/menu','Order Online'),(2,515,'0000-00-00 00:00:00',1,2,'welcome','about/home','special','10% Discount','#','#','#','/takeaway/menu','/img/highlights/FHRS.png','#','Save 10%<br /> order on collection <br />','/takeaway/menu','View Menu'),(3,7,'0000-00-00 00:00:00',1,3,'welcome','about/home','special','Free Delivery','#','#','#','/takeaway/menu','/img/highlights/DownLoadMenu.png','#','Within 3 Mile Radius <br /> Order Over &Pound10<br />','/takeaway/menu','Order Online'),(4,11,'0000-00-00 00:00:00',1,4,'welcome','about/home','mid_text','Mid Text','The Indian Ocean’ menu is meticulously designed to suit the needs of every customer.','#','#','#','#','#','#','/takeaway/menu','View Set Meals'),(5,11,'0000-00-00 00:00:00',1,4,'welcome','about/main','our_restaurant','','OUR RESTAURANT','#','#','/takeaway/menu','http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg','#','Our dishes are freshly prepared in-house with our special \'Indian Ocean recipe\'&#44; which excludes all artificial colourings and preservatives. And all our dishes are served steaming hot into a special stay fresh packaging&#44; ready to collect or be delivered to your door step.','/takeaway/menu','View Set Meals'),(6,11,'0000-00-00 00:00:00',1,4,'welcome','about/main','our_food','Meal for 2','OUR FOOD','#','#','/takeaway/menu','http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg','#','Eating out is more than just food. It is about atmosphere&#44; about ambience&#44; but above all taste!We have installed some of India\'s history&#44; culture and beliefs into creating the perfect authentic feel for you. If you want to create your own dish&#44; a little hotter&#44; a little creamier? No problem. We allow our customers the option to customize to their suitable needs. Just ask us and we will cook it to order at no extra cost','/takeaway/menu','View Set Meals'),(7,11,'0000-00-00 00:00:00',1,4,'welcome','about/main','top_banner','Order Online Now','Delivered Stright To Your Door.','#','#','#','#','#','#','/takeaway/menu','Order Online Now'),(8,11,'0000-00-00 00:00:00',1,4,'us','about/us','side','about us side starter','Starter','#','#','/takeaway/menu','/img/highlights/starters.jpg','#','#','/takeaway/menu','Order Online Now'),(9,11,'0000-00-00 00:00:00',1,4,'us','about/us','side','about Us&#44; side &#44; Main Dishes','Main Dishes','#','#','/takeaway/menu','/img/highlights/main.jpg','#','#','/takeaway/menu','Order Online Now'),(10,11,'0000-00-00 00:00:00',1,4,'us','about/us','side','About Us&#44; Side&#44; Side Orders','Side Orders','#','#','/takeaway/menu','/img/highlights/side.jpg','#','#','/takeaway/menu','Order Online Now');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2014-07-17 10:00:40',1,'AAA1786','07900642131_1405591235','AAA1786','Amzad','Mojumder','amzadfof@gmail.com','07900642131','','','','','','','','',1405613700,'collection','','paypal','a:1:{i:0;a:7:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:2:\"sn\";s:1:\"3\";s:5:\"title\";s:12:\"PANEER TIKKA\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"4.95\";s:4:\"meat\";b:0;}}','',4.95,0.00,0.00,4.95,0.00,0.00,4.95,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_cwdp`
--

LOCK TABLES `orders_cwdp` WRITE;
/*!40000 ALTER TABLE `orders_cwdp` DISABLE KEYS */;
INSERT INTO `orders_cwdp` VALUES (1,1,'2014-07-17 10:00:40',1,'AAA1786',0,NULL);
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
INSERT INTO `page_contact` VALUES (1,1,'2014-06-29 23:33:13',1,'','51.330343','-0.547510','#',1,16,'100%','400px','/about/contact',1,1,'#','#');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###Not updateable with form. Has to update via software / db process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_paypal`
--

LOCK TABLES `pay_paypal` WRITE;
/*!40000 ALTER TABLE `pay_paypal` DISABLE KEYS */;
INSERT INTO `pay_paypal` VALUES (1,230,'0000-00-00 00:00:00',1,'m82amjad_api1.hotmail.co.uk','W4W9MCXCZ9DL4938','AamyNj8hYYmtqQkScocIJA2nHc2KAphH9D-oD3aGUcOr8fR.riuDM75B','seller_1317255315_biz_api1.gmail.com','1317255350','AFcWxV21C7fd0v3bYYYRCpSSRl31AsEXo1mfs5m9KpiElKsbTiQR9C2V','#',0.20,3.40,5.00,'m82amjad@gmail.com','integrated',0,-2.00,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_category`
--

LOCK TABLES `prod_category` WRITE;
/*!40000 ALTER TABLE `prod_category` DISABLE KEYS */;
INSERT INTO `prod_category` VALUES (1,1,'0000-00-00 00:00:00',1,1,0,'Takeaway Menu','','','',''),(2,1,'0000-00-00 00:00:00',1,1,1,'STARTER','','','',''),(3,1,'0000-00-00 00:00:00',1,1,1,'TANDOORI SPECIALITIES','','','',''),(4,1,'0000-00-00 00:00:00',1,1,1,'CHEF\'S SPECIALITIES','','','',''),(5,1,'0000-00-00 00:00:00',1,1,1,'VEGETABLES','','','',''),(6,1,'0000-00-00 00:00:00',1,1,1,'LAMB CURRIES','','','',''),(7,1,'0000-00-00 00:00:00',1,1,1,'CHICKEN CURRIES','','','',''),(8,1,'0000-00-00 00:00:00',1,1,1,'SEAFOOD CURRIES','','','',''),(9,1,'0000-00-00 00:00:00',1,1,1,'BREADS','','','',''),(10,1,'0000-00-00 00:00:00',1,1,1,'DRINKS','','','',''),(11,1,'0000-00-00 00:00:00',1,1,1,'DESSERT','','','',''),(12,1,'0000-00-00 00:00:00',1,1,1,'BIRYANIS','All Biryani\'s are mixed and cooked with basmati rice&#44; medium spiced and gamished with coriander&#44; served with vegetable curry.','','',''),(13,1,'0000-00-00 00:00:00',1,1,1,'SUNDRIES','','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_list`
--

LOCK TABLES `prod_list` WRITE;
/*!40000 ALTER TABLE `prod_list` DISABLE KEYS */;
INSERT INTO `prod_list` VALUES (1,1,'0000-00-00 00:00:00',1,1,'MIXED STARTER','#','#','Selection of chicken tikka&#44; sheek kebab&#44;meat samosa.',3.95,2,-0.99,'fsdf','dfsd',0,0,'1'),(2,1,'0000-00-00 00:00:00',1,2,'KEBAB ROLL','#','#','Sheek kebab rolled in chapati then cooked in clay oven.',3.95,2,-0.99,'fsdf','dfsd',0,0,'2'),(3,1,'0000-00-00 00:00:00',1,3,'PANEER TIKKA','#','#','Cubes of cheese marinated in medium spiced yougurt sauce grilled in clay oven.',4.95,2,-0.99,'fsdf','dfsd',0,0,'3'),(4,1,'0000-00-00 00:00:00',1,4,'CHILLI  PANEER','#','#','Curd cheese with onions&#44; greeb chillies & green peppers(fairly hot)',4.10,2,-0.99,'fsdf','dfsd',0,0,'4'),(5,1,'0000-00-00 00:00:00',1,5,'ONION BHAJI','#','#','Chopped onion mixed with spices & gram flour&#44; deep fried in oil.',2.10,2,-0.99,'fsdf','dfsd',0,0,'5'),(6,1,'0000-00-00 00:00:00',1,6,'SAMOSA\'S','#','#','(2 pieces) Meat or vegetable&#44; stuffed in pastry .',2.10,2,-0.99,'fsdf','dfsd',0,0,'6'),(7,1,'0000-00-00 00:00:00',1,7,'CHICKEN CHAT','#','#','Small pieces of chicken served with cucumber in sour sauce.',2.95,2,-0.99,'fsdf','dfsd',0,0,'7'),(8,1,'0000-00-00 00:00:00',1,8,'GARLIC MUSHROOM ON PUREE','#','#','Cooked dry with mushroom#44; garlic & onions&#44; served on puffed bread.',3.95,2,-0.99,'fsdf','dfsd',0,0,'8'),(9,1,'0000-00-00 00:00:00',1,9,'CHICKEN ON PUREE','#','#','Medium spiced chicken cooked dry and served on puffed bread.',3.50,2,-0.99,'fsdf','dfsd',0,0,'9'),(10,1,'0000-00-00 00:00:00',1,10,'PRAWN ON PUREE','#','#','Medium spiced prawns cooked dry and served on puffed bread.',3.50,2,-0.99,'fsdf','dfsd',0,0,'10'),(11,1,'0000-00-00 00:00:00',1,11,'KING PRAWN ON PUREE','#','#','Medium spiced&#44; king prawns cooked dry & served on puffed bread.',3.50,2,-0.99,'fsdf','dfsd',0,0,'11'),(12,1,'0000-00-00 00:00:00',1,12,'SALMON TIKKA','#','#','Pieces of salmon marinated in medium spiced yogurt sauce grilled in clay oven.',5.95,2,-0.99,'fsdf','dfsd',0,0,'12'),(13,1,'0000-00-00 00:00:00',1,13,'TANDOORI CHICKEN','#','#','Tender chicken&#44;medium spiced&#44; marinated in medium spiced yogurt&#44; served in the bone&#44; grilled in clay oven.',3.10,2,-0.99,'fsdf','dfsd',0,0,'13'),(14,1,'0000-00-00 00:00:00',1,14,'CHICKEN TIKKA','#','#','Pieces of chicken or lamb marinated in medium spiced yogurt sauce grilled in clay oven.',2.95,2,-0.99,'fsdf','dfsd',0,0,'14'),(15,1,'0000-00-00 00:00:00',1,15,'LAMB TIKKA','#','#','Pieces of chicken or lamb marinated in medium spiced yogurt sauce grilled in clay oven.',2.95,2,-0.99,'fsdf','dfsd',0,0,'15'),(16,1,'0000-00-00 00:00:00',1,16,'SHEEK KEBAB','#','#','Finely minced lamb&#44; medium spiced skewered and grilled in clay oven.',3.10,2,-0.99,'fsdf','dfsd',0,0,'16'),(17,1,'0000-00-00 00:00:00',1,17,'SHAMI KEBAB','#','#','Finely minced lamb&#44; medium spiced',0.00,3,2.00,'-0.99','fsdf',0,0,'0'),(18,1,'0000-00-00 00:00:00',1,18,'TANDOORI MIXED GRILL','#','#','Pieces of chicken tikka&#44; lamb tikka&#44; sheek kebab&#44;lamb chop and tandoori chicken.',8.95,3,-0.99,'fsdf','dfsd',0,0,'18'),(19,0,'0000-00-00 00:00:00',1,19,'CHICKEN SHASHLIK','#','#','Pieces of chicken marinated in medium spiced yogurt sauce&#44; grilled in clay oven with tomatoes&#44; onions and capsicums.',6.95,3,0.00,'','',0,0,'19'),(20,0,'0000-00-00 00:00:00',1,20,'CHICKEN TIKKA','#','#','Pieces of chicken marinated in medium spiced yogurt sauce#44; grilled in clay oven.',5.95,3,0.00,'','',0,0,'20'),(21,0,'0000-00-00 00:00:00',1,21,'TANDOORI CHICKEN','#','#','Tender half chicken&#44; medium spiced&#44; marinated in yogurt&#44; served on the bone&#44;grilled in clay oven.',5.95,3,0.00,'','',0,0,'21'),(22,0,'0000-00-00 00:00:00',1,22,'SHEEK KEBAB','#','#','Finely minced lamb#44; medium spiced#44; grilled in clay oven.',5.95,3,0.00,'','',0,0,'22'),(23,0,'0000-00-00 00:00:00',1,23,'TANDOORI LAMB CHOPS','#','#','Lamb chops&#44; marinated in special cashew nut&#44;mustard and yogurt sauce&#44; grilled in clay oven.',5.95,3,0.00,'','',0,0,'23'),(24,0,'0000-00-00 00:00:00',1,24,'LAMB TIKKA KASHMIRI','#','#','Cooked in clay oven and fried with onions&#44;green peppers & tomatoes.',5.95,3,0.00,'','',0,0,'24'),(25,0,'0000-00-00 00:00:00',1,25,'TANDOORI KING PRAWNS','#','#','Marinted in medium spiced yogurt sauce&#44;grilled in clay oven.',10.95,3,0.00,'','',0,0,'25'),(26,0,'0000-00-00 00:00:00',1,26,'BUTTER CHICKEN (Off the bone)','#','#','Half tandoori chicken&#44;cooked in buttery creamy masala sauce.',6.95,4,0.00,'','',0,0,'26'),(27,0,'0000-00-00 00:00:00',1,27,'CHICKIN TIKKA MASALA','#','#','Pieces of grilled chicken&#44;cooked in tomato andf butter creamy masala sauce (mild)',6.50,4,0.00,'','',0,0,'27'),(28,0,'0000-00-00 00:00:00',1,28,'METHI CHICKEN TIKKA MASALA','#','#','Small pieces of grilled chicken&#44; cooked in tomato&#44; butter sauce with fenugreek leaves.',6.95,4,0.00,'','',0,0,'28'),(29,0,'0000-00-00 00:00:00',1,29,'JALFRAZI','#','#','Pieces of chicken or lamb&#44;cooked with onions&#44; green chillies and green peppers&#44; served fairly hot.',6.50,4,0.00,'','',0,0,'29'),(30,0,'0000-00-00 00:00:00',1,30,'METHI KEEMA','#','#','finely &#44;minced lamb&#44; cooked in medium spices with fenugreek leaves.',6.95,4,0.00,'','',0,0,'30'),(31,0,'0000-00-00 00:00:00',1,31,'MEAT THALI','#','#','Chicken tikka masala#44;bhuna gosth#44;sag bhaji#44; tandoori chicken#44; sheek kebab#44; pilau rice ans nan.',14.50,4,0.00,'','',0,0,'31'),(32,0,'0000-00-00 00:00:00',1,32,'VEGETARIN THALI','#','#','Onion bhaji#44;niramish#44; dall#44; matter paneer#44; raitha',0.00,12,4.00,'','',0,0,''),(33,0,'0000-00-00 00:00:00',1,33,'METHI FISH MASALA','#','#','Pieces of codf fish#44;cooked in tomato#44; butter sauce with fenugreek leaves.',7.50,4,0.00,'','',0,0,'33'),(34,0,'0000-00-00 00:00:00',1,34,'METHI PANEER MASALA','#','#','Pieces of curd cheese#44;cooked in tomato#44; butter sauce with fenugreek leaves.',4.95,4,0.00,'','',0,0,'34'),(35,0,'0000-00-00 00:00:00',1,35,'NIRAMISH CURRY','#','#','Mixed vegetables#44; cooked fairly dry or saucy medium spices.',3.25,5,0.00,'','',0,0,'35'),(36,0,'0000-00-00 00:00:00',1,36,'VEGETARIN CURRY','#','#','Mixed vegetables#44; cooked fairly dry or saucy medium spices.',3.25,5,0.00,'','',0,0,'36'),(37,0,'0000-00-00 00:00:00',1,37,'VEGETARIN KORMA','#','#','Mixed vegetables#44; cooked in a very mild creamy sauce.',3.95,5,0.00,'','',0,0,'37'),(38,0,'0000-00-00 00:00:00',1,38,'MASHROOM BHAJI','#','#','Chopped mushrooms#44;medium spiced#44; fried with herbs.',3.25,5,0.00,'','',0,0,'38'),(39,0,'0000-00-00 00:00:00',1,39,'BHINDI BHAJI','#','#','Okra fried with onions#44; medium spiced',3.25,5,0.00,'','',0,0,'39'),(40,0,'0000-00-00 00:00:00',1,40,'BEGUN BHAJI','#','#','Aubergines fried with onions#44; medium spiced.',3.25,5,0.00,'','',0,0,'40'),(41,0,'0000-00-00 00:00:00',1,41,'CHANA MASALA','#','#','Chick peas#44; cooked in medium spiced dry sauce.',3.25,5,0.00,'','',0,0,'41'),(42,0,'0000-00-00 00:00:00',1,42,'TARKA DALL','#','#','Massor lentils#44; cooked with butter.',3.25,5,0.00,'','',0,0,'42'),(43,0,'0000-00-00 00:00:00',1,43,'BOMBAY ALOO','#','#','Potatoes#44;highly flavoured in spices#44; medium.',3.25,5,0.00,'','',0,0,'43'),(44,0,'0000-00-00 00:00:00',1,44,'ALOO GOBI','#','#','Potatoes and cauliflower#44; cooked with medium spices.',3.25,5,0.00,'','',0,0,'44'),(45,0,'0000-00-00 00:00:00',1,45,'SAG BHAJI','#','#','Fresh leaf spinach#44; fried with onions and herbs.',3.25,5,0.00,'','',0,0,'45'),(46,0,'0000-00-00 00:00:00',1,46,'SAG ALOO','#','#','Spinach cooked with potatoes#44; medium spiced.',3.25,5,0.00,'','',0,0,'46'),(47,0,'0000-00-00 00:00:00',1,47,'SAG PANEER','#','#','Curd cheese and spinach#44; cooked in medium spiced sauce.',3.95,5,0.00,'','',0,0,'47'),(48,0,'0000-00-00 00:00:00',1,48,'MATTAR PANEER','#','#','Curd cheese and peas#44;cooked in medium spiced masala sauce.',3.95,5,0.00,'','',0,0,'48'),(49,0,'0000-00-00 00:00:00',1,49,'PANEER MASALA','#','#','Curd cheese#44;cooked in medium spiced masala sauce.',4.50,5,0.00,'','',0,0,'49'),(50,0,'0000-00-00 00:00:00',1,50,'METHI CORN MASALA','#','#','Sweetcom cooked in tomatoes#44; butter sauce with fenugreek leaves.',4.95,5,0.00,'','',0,0,'50'),(51,0,'0000-00-00 00:00:00',1,51,'BALTI VEGETABLE','#','#','Mixed Vegetables cooked in a special Balti sauce.',4.95,5,0.00,'','',0,0,'51'),(52,0,'0000-00-00 00:00:00',1,52,'LAMB CURRY','#','#','Cooked in medium sauce.',5.10,6,0.00,'','',0,0,'52'),(53,0,'0000-00-00 00:00:00',1,53,'BHUNA GOSHT','#','#','Pieces of lamb#44;cooked in highly flavoured dry sauce#44; medium spiced.',5.10,6,0.00,'','',0,0,'53'),(54,0,'0000-00-00 00:00:00',1,54,'METHI GOSHT','#','#','Pieces of lamb#44;cooked with fenugreek leaves#44;medium spiced#44; highly flavoured.',5.10,6,0.00,'','',0,0,'54'),(55,0,'0000-00-00 00:00:00',1,55,'LAMB MADRAS','#','#','Pieces of lamb#44; cooked in fairly hot of very hot sauce.',5.10,6,0.00,'','',0,0,'55'),(56,0,'0000-00-00 00:00:00',1,56,'LAMB VINDALOO','#','#','Pieces of lamb#44; cooked in fairly hot of very hot sauce.',5.10,6,0.00,'','',0,0,'56'),(57,0,'0000-00-00 00:00:00',1,57,'LAMB KORMA','#','#','Pieces of lamb#44; cooked in a very mild creamy sauce.',5.10,6,0.00,'','',0,0,'57'),(58,0,'0000-00-00 00:00:00',1,58,'BALTI GOSHT','#','#','Pieces of lamb cooked with onions#44; green peppers & tomatoes in special balti sauce.',5.95,6,0.00,'','',0,0,'58'),(59,0,'0000-00-00 00:00:00',1,59,'KARAHI GOSHT','#','#','Tender pieces of  lamb#44; cooked in medium spiced sauce with green pepper#44;onions & tomatoes.',5.95,6,0.00,'','',0,0,'59'),(60,0,'0000-00-00 00:00:00',1,60,'ROGON GOSHT','#','#','Pieces of lamb cooked with  tomatoes and green herbs in medium sauce.',5.95,6,0.00,'','',0,0,'60'),(61,0,'0000-00-00 00:00:00',1,61,'SAG GOSHT','#','#',' Pieces of lamb cooked with fresh leaf spinach in medium sauce.',5.95,6,0.00,'','',0,0,'61'),(62,0,'0000-00-00 00:00:00',1,62,'LAMB DHANSAK','#','#','Pieces of lamb cooked with lentils#44;sweet#44; sour & hot sauce.',5.95,6,0.00,'','',0,0,'62'),(63,0,'0000-00-00 00:00:00',1,63,'LAMB DOPIAZA','#','#','Pieces of lamb#44; cooked with ring onions.',5.95,6,0.00,'','',0,0,'63'),(64,0,'0000-00-00 00:00:00',1,64,'KEEMA CURRA','#','#','Finely minced lamb cooked medium spices.',5.95,6,0.00,'','',0,0,'A64'),(65,0,'0000-00-00 00:00:00',1,65,'KEEMA BHUNA','#','#','Finely minced lamb cooked medium spices.',5.95,6,0.00,'','',0,0,'65'),(66,0,'0000-00-00 00:00:00',1,66,'LAMB PASSANDA','#','#','Pieces of lamb#44; cooked in mildly spiced sauce.',6.50,6,0.00,'','',0,0,'66'),(67,0,'0000-00-00 00:00:00',1,67,'CHICKEN CURRY','#','#','Cooked in a medium sauce.',5.10,7,0.00,'','',0,0,'67'),(68,0,'0000-00-00 00:00:00',1,68,'BHUNA CHICKEN','#','#','Pieces of chicken&#44;cooked in highly dry sauce&#44; medium spiced.',5.10,7,0.00,'','',0,0,'68'),(69,0,'0000-00-00 00:00:00',1,69,'METHI CHICKEN','#','#','Pieces of chicken&#44;cooked with fenugreek leaves&#44;highly flavoured&#44;medium spiced.',5.10,7,0.00,'','',0,0,'69'),(70,0,'0000-00-00 00:00:00',1,70,'CHICKEN MADRAS','#','#','Pieces of chicken&#44;cooked in fairly hot or very hot sauce.',5.10,7,0.00,'','',0,0,'70'),(71,0,'0000-00-00 00:00:00',1,71,'CHICKEN VINDALOO','#','#','Pieces of chicken&#44; cooked in fairly hot or very hot sauce.',5.10,7,0.00,'','',0,0,'71'),(72,0,'0000-00-00 00:00:00',1,72,'CHICKEN KORMA','#','#','Pieces of chicken cooked  mild creamy sauce.',5.10,7,0.00,'','',0,0,'72'),(73,0,'0000-00-00 00:00:00',1,73,'BALTI CHICKEN','#','#','Pieces of chicken&#44;cooked with onions&#44; green peppers&#44; tomatoes in a special Balti sauce.',5.95,7,0.00,'','',0,0,'73'),(74,0,'0000-00-00 00:00:00',1,74,'KARAHI CHICKEN','#','#','Pieces of chicken&#44; cooked in medium spiced sauce with green pepper&#44; onions & tomatoes.',5.95,7,0.00,'','',0,0,'74'),(75,0,'0000-00-00 00:00:00',1,75,'CHICKEN ROGAN','#','#','Pieces of chicken&#44;cooked with tomatoes and green herbs in medium sauce.',5.95,7,0.00,'','',0,0,'75'),(76,0,'0000-00-00 00:00:00',1,76,'SAG CHICKEN','#','#','Pieces of chicken&#44;cooked with fresh leaf spinach in medium spices.',5.95,7,0.00,'','',0,0,'76'),(77,0,'0000-00-00 00:00:00',1,77,'CHICKEN DHANSAK','#','#','Pieces of chicken&#44;cooked with lentils in sweet&#44; sour & hot sauce.',5.95,7,0.00,'','',0,0,'77'),(78,0,'0000-00-00 00:00:00',1,78,'CHICKEN DOPIAZA','#','#','Pieces of chicken&#44;cooked with ring onions.',5.95,7,0.00,'','',0,0,'78'),(79,0,'0000-00-00 00:00:00',1,79,'CHICKEN CHILLI MASSALA','#','#','Pieces of chicken tikka cooked with green chillies and medium spiced masala sauce.',6.50,7,0.00,'','',0,0,'79'),(80,0,'0000-00-00 00:00:00',1,80,'CHICKEN PASSANDA','#','#','Pieces of chicken&#44; cooked in mildly spiced sauce.',6.50,7,0.00,'','',0,0,'80'),(81,0,'0000-00-00 00:00:00',1,81,'PRAWN CURRY','#','#','Small prawns&#44; cooked in medium spicy gravy sauce.',5.95,8,0.00,'','',0,0,'81'),(82,0,'0000-00-00 00:00:00',1,82,'BHUNA PRAWN','#','#','Small prawns#44; cooked in highly flavoured spices#44; in a dry sauce.',5.95,8,0.00,'','',0,0,'82'),(83,0,'0000-00-00 00:00:00',1,83,'KARAHI PRAWN','#','#','Pieces of prawn#44; cooked in  medium spiced sauce with green pepper#44;onions & tomatoes.',6.95,8,0.00,'','',0,0,'83'),(84,0,'0000-00-00 00:00:00',1,84,'SAG PRAWN','#','#','Small prawns#44; cooked with fresh leaf spinach#44; medium spiced.',6.10,8,0.00,'','',0,0,'84'),(85,0,'0000-00-00 00:00:00',1,85,'KING PRAWN MASALA','#','#','King prawns#44; shallow fried',0.00,10,8.00,'','',0,0,''),(86,0,'0000-00-00 00:00:00',1,86,'KING PRAWN BHUNA','#','#','King prawns#44;cooked in highly flavoured spices#44;fairly dry ( medium).',9.95,8,0.00,'','',0,0,'86'),(87,0,'0000-00-00 00:00:00',1,87,'KING PRAWN DHANSAK','#','#','King prawns#44;cooked with lentils#44; sweet#44; sour & hot sauce.',9.95,8,0.00,'','',0,0,'87'),(88,0,'0000-00-00 00:00:00',1,88,'FISH MASALA','#','#','Pieces of cod fish cooked in medium spiced masala sauce.',6.95,8,0.00,'','',0,0,'88'),(89,0,'0000-00-00 00:00:00',1,89,'FISH MADRAS','#','#','Pieces of cod fish cooked in fairly hot or very hot sauce.',6.50,8,0.00,'','',0,0,'89'),(90,0,'0000-00-00 00:00:00',1,90,'FISH VINDALOO','#','#','Pieces of cod fish cooked in fairly hot or very hot sauce.',6.50,8,0.00,'','',0,0,'90'),(91,0,'0000-00-00 00:00:00',1,91,'NAN BREAD','#','#','Unleavedad bread#44;baked in clay oven.',1.60,9,0.00,'','',0,0,'91'),(92,0,'0000-00-00 00:00:00',1,92,'PESHWARI NAN','#','#','Stuffed with almonds#44; cocount#44;cashew nuts and sultanas (sweets).',2.10,9,0.00,'','',0,0,'92'),(93,0,'0000-00-00 00:00:00',1,93,'KEEMA NAN','#','#','Stuffed with spiced minced lamb.',2.10,9,0.00,'','',0,0,'93'),(94,0,'0000-00-00 00:00:00',1,94,'GARLIC NAN','#','#','Nan bread stuffed with garlic',2.10,9,0.00,'','',0,0,'94'),(95,0,'0000-00-00 00:00:00',1,95,'CHEESE NAN','#','#','Stuffed with cheese and onions',2.10,9,0.00,'','',0,0,'95'),(96,0,'0000-00-00 00:00:00',1,96,'CHILLI NAN','#','#','Stuffed with green chillies.',1.95,9,0.00,'','',0,0,'96'),(97,0,'0000-00-00 00:00:00',1,97,'PARTHA','#','#','Whole wheat flour bread fried with butter.',2.20,9,0.00,'','',0,0,'97'),(98,0,'0000-00-00 00:00:00',1,98,'STUFFED PARATHA','#','#','Stuffed with vegetables.',2.50,9,0.00,'','',0,0,'98'),(99,0,'0000-00-00 00:00:00',1,99,'TANDOORI ROTI','#','#','Wheat flour bread&#44;baked in clay oven.',1.50,9,0.00,'','',0,0,'99'),(100,0,'0000-00-00 00:00:00',1,100,'CHAPATI','#','#','Thin wheat flour bread .',1.00,9,0.00,'','',0,0,'100'),(101,0,'0000-00-00 00:00:00',1,101,'PUREE','#','#','Thin wheat flour bread deep fried.',1.00,9,0.00,'','',0,0,'101'),(102,0,'0000-00-00 00:00:00',1,102,'BOTTLE OF COKE','#','#','',2.50,10,0.00,'','',0,0,'102'),(103,0,'0000-00-00 00:00:00',1,103,'BOTTLE DIET COKE','#','#','',2.50,10,0.00,'','',0,0,'103'),(104,0,'0000-00-00 00:00:00',1,104,'BOTTLE OF LEMONDE','#','#','',2.50,10,0.00,'','',0,0,'104'),(105,0,'0000-00-00 00:00:00',1,105,'CAN OF COKE','#','#','',0.85,10,0.00,'','',0,0,'105'),(106,0,'0000-00-00 00:00:00',1,106,'CAN DIET COKE','#','#','',0.85,10,0.00,'','',0,0,'106'),(107,0,'0000-00-00 00:00:00',1,107,'CAN OF LEMONDE','#','#','',0.85,10,0.00,'','',0,0,'107'),(108,0,'0000-00-00 00:00:00',1,108,'BOTTLE OF STILL','#','#','',2.50,10,0.00,'','',0,0,'108'),(109,0,'0000-00-00 00:00:00',1,109,'SPARKLING WATER','#','#','',2.50,10,0.00,'','',0,0,'109'),(110,0,'0000-00-00 00:00:00',1,110,'1 LITER ORANGE JUICE','#','#','',2.50,10,0.00,'','',0,0,'110'),(111,0,'0000-00-00 00:00:00',1,111,'1 LITER PINEAPPLE JUICE','#','#','',2.50,10,0.00,'','',0,0,'111'),(112,0,'0000-00-00 00:00:00',1,112,'1 LITER MANGO JUICE','#','#','',2.50,10,0.00,'','',0,0,'112'),(113,0,'0000-00-00 00:00:00',1,113,'KULFI','#','#','Indian ice cream&#44; pistachio&#44; mango or almond.',2.50,11,0.00,'','',0,0,'113'),(114,0,'0000-00-00 00:00:00',1,114,'COCOUNAT SUPREME','#','#','Cocount ice cream packed into  real half cocount shell.',2.95,11,0.00,'','',0,0,'114'),(115,0,'0000-00-00 00:00:00',1,115,'ORANGE SURPRISE','#','#','Orange lemon scooped and refilled with tangy sorbet.',2.95,11,0.00,'','',0,0,'115'),(116,0,'0000-00-00 00:00:00',1,116,'LEMON SURPRISE','#','#','Orange lemon scooped and refilled with tangy sorbet.',2.95,11,0.00,'','',0,0,'116'),(117,0,'0000-00-00 00:00:00',1,117,'HAZELNUT DELIGHT','#','#','Real Hazelnut ice cream covered in thick chocolate sauce.',2.95,11,0.00,'','',0,0,'117'),(118,0,'0000-00-00 00:00:00',1,118,'VANILLA FUDGE','#','#','Vanilla & toffee ice cream rolled strips fudge.',2.95,11,0.00,'','',0,0,'118'),(119,0,'0000-00-00 00:00:00',1,119,'FUNKY PIE','#','#','Biscuits#44; vanilla ice cream & hazelnut.',2.95,11,0.00,'','',0,0,'119'),(120,0,'0000-00-00 00:00:00',1,120,'CHICKEN TIKKA BIRYANI','#','#','',7.95,12,0.00,'','',0,0,'120'),(121,0,'0000-00-00 00:00:00',1,121,'CHICKEN BIRYANI','#','#','',7.50,12,0.00,'','',0,0,'121'),(122,0,'0000-00-00 00:00:00',1,122,'LAMB BIRYANI','#','#','',7.50,12,0.00,'','',0,0,'122'),(123,0,'0000-00-00 00:00:00',1,123,'PRAWN BIRYANI','#','#','',7.95,12,0.00,'','',0,0,'123'),(124,0,'0000-00-00 00:00:00',1,124,'KING PRAWN BIRYANI','#','#','',10.95,12,0.00,'','',0,0,'124'),(125,0,'0000-00-00 00:00:00',1,125,'VEGETABLE BIRYANI','#','#','',6.95,12,0.00,'','',0,0,'125'),(126,0,'0000-00-00 00:00:00',1,126,'MIXED BIRYANI','#','#','Chicken&#44; lamb & mixed vegetable.',8.95,12,0.00,'','',0,0,'126'),(127,0,'0000-00-00 00:00:00',1,127,'PILAU RICE','#','#','Fried basmati rice.',2.10,13,0.00,'','',0,0,'127'),(128,0,'0000-00-00 00:00:00',1,128,'BOILED RICE','#','#','',1.95,13,0.00,'','',0,0,'128'),(129,0,'0000-00-00 00:00:00',1,129,'KEEMA RICE','#','#','Basmati rice&#44; cooked with finely minced lamb.',4.95,13,0.00,'','',0,0,'129'),(130,0,'0000-00-00 00:00:00',1,130,'SPECIAL FRIED RICE','#','#','Basmati rice&#44; fried with egg & onions.',3.20,13,0.00,'','',0,0,'130'),(131,0,'0000-00-00 00:00:00',1,131,'ZEERA RICE','#','#','Basmati rice&#44; fried with cumin.',3.20,13,0.00,'','',0,0,'131'),(132,0,'0000-00-00 00:00:00',1,132,'MUSHROOM PILAU','#','#','Basmati rice&#44; fried with mushrooms & onions.',3.20,13,0.00,'','',0,0,'132'),(133,0,'0000-00-00 00:00:00',1,133,'VEGETABLE PILAU','#','#','Basmati rice&#44; fried with mix vegetables & onions.',3.20,13,0.00,'','',0,0,'133'),(134,0,'0000-00-00 00:00:00',1,134,'PEAS PILUE','#','#','Basmati rice&#44; fried with green peas & spices.',3.20,13,0.00,'','',0,0,'134'),(135,0,'0000-00-00 00:00:00',1,135,'MIXED RAITHA','#','#','Natural yogurt or mixed with cucumber & spices.',1.95,13,0.00,'','',0,0,'135'),(136,0,'0000-00-00 00:00:00',1,136,'PLAIN YOUGURT','#','#','Natural yogurt or mixed with cucumber & spices.',1.95,13,0.00,'','',0,0,'136'),(137,0,'0000-00-00 00:00:00',1,137,'CHIPS','#','#','',1.95,13,0.00,'','',0,0,'137'),(138,0,'0000-00-00 00:00:00',1,138,'GREEN SALAD','#','#','Mixture of tomatoes&#44; cucumber&#44; lettuce&#44; onions and lemon.',1.50,13,0.00,'','',0,0,'138'),(139,0,'0000-00-00 00:00:00',1,139,'KUCHUMBER SALAD','#','#','Cubes of tomatoes&#44;cucumber&#44; red onions and green  chilli (hot).',1.95,13,0.00,'','',0,0,'139'),(140,0,'0000-00-00 00:00:00',1,140,'POPADOMS','#','#','Plain or Masala',0.50,13,0.00,'','',0,0,'140'),(141,0,'0000-00-00 00:00:00',1,141,'CHUTNEY','#','#','(Each) Choice of mint sauce&#44;mango chutney&#44; lime pickle or onion salad.',0.50,13,0.00,'','',0,0,'141'),(142,0,'0000-00-00 00:00:00',1,142,'PILAU RICE','#','#','Fried basmati rice.',4.70,13,0.00,'','',0,0,'142'),(143,0,'0000-00-00 00:00:00',1,143,'BOILED RICE','#','#','',4.70,13,0.00,'','',0,0,'143'),(144,0,'0000-00-00 00:00:00',1,144,'KEEMA RICE','#','#','Basmati rice&#44; cooked with finely minced lamb.',4.70,13,0.00,'','',0,0,'144'),(145,0,'0000-00-00 00:00:00',1,145,'SPECIAL FRIED RICE','#','#','Basmati rice&#44; fried with egg & onions.',4.70,13,0.00,'','',0,0,'145'),(146,0,'0000-00-00 00:00:00',1,146,'ZEERA RICE','#','#','Basmati rice&#44; fried with cumin.',4.70,13,0.00,'','',0,0,'146'),(147,0,'0000-00-00 00:00:00',1,147,'MUSHROOM PILAU','#','#','Basmati rice&#44; fried with mushrooms & onions.',4.70,13,0.00,'','',0,0,'147'),(148,0,'0000-00-00 00:00:00',1,148,'VEGETABLE PILAU','#','#','Basmati rice&#44;fried with mix vegetables & onions.',4.70,13,0.00,'','',0,0,'148'),(149,0,'0000-00-00 00:00:00',1,149,'PEAS PILUE','#','#','Basmati rice&#44; fried with green peas & spices.',4.70,13,0.00,'','',0,0,'149'),(150,0,'0000-00-00 00:00:00',1,150,'CHIPS','#','#','',2.95,13,0.00,'','',0,0,'150'),(151,0,'0000-00-00 00:00:00',1,151,'CHUTNEY','#','#','(Each) Choice of mint sauce&#44;mango chutney&#44; lime pickle or onion salad.',1.25,13,0.00,'','',0,0,'151');
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
INSERT INTO `prod_meat_price` VALUES (1,1,'2014-07-17 09:52:30',0,1,1,2,3.00),(2,1,'2014-07-17 09:52:30',0,1,1,1,4.00),(3,1,'2014-07-17 09:52:30',0,1,1,3,5.00),(4,1,'2014-07-17 09:52:30',0,1,2,4,1.00),(5,1,'2014-07-17 09:52:30',0,1,2,5,3.00),(6,1,'2014-07-17 09:52:30',0,1,1,6,6.00),(7,1,'2014-07-17 09:52:30',0,1,1,7,7.00),(8,1,'2014-07-17 09:52:30',0,1,1,8,3.00);
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
INSERT INTO `prod_meats` VALUES (1,1,'2014-04-19 07:14:22',1,1,'Chicken','CH',''),(2,1,'2014-04-19 07:14:22',1,2,'Lamb','LM',''),(3,1,'2014-04-19 07:14:22',1,3,'Veg','VG',''),(4,1,'2014-04-19 07:14:22',1,4,'Prwan','PR',''),(5,1,'2014-04-19 07:14:22',1,5,'King Prwan','KP',''),(6,1,'2014-04-19 07:14:22',1,6,'King Prwan Tikka','KP',''),(7,1,'2014-04-19 07:14:22',1,7,'Chicken Tikka','KP',''),(8,1,'2014-04-19 07:14:22',1,8,'Lamb Tikka','KP','');
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
INSERT INTO `services_opening_hours` VALUES (1,7,'0000-00-00 00:00:00',1,1,1020,1380,'Mon','Y','Y','Y',15,45),(2,7,'0000-00-00 00:00:00',1,2,1020,1380,'Tue','Y','Y','Y',15,45),(3,7,'0000-00-00 00:00:00',1,3,1020,1380,'Wed','Y','Y','Y',15,45),(4,7,'0000-00-00 00:00:00',1,4,1020,1380,'Thu','Y','Y','Y',15,45),(5,7,'0000-00-00 00:00:00',1,5,1020,1380,'Fri','Y','Y','Y',15,45),(6,7,'0000-00-00 00:00:00',1,6,1020,1380,'Sat','Y','Y','Y',15,45),(7,7,'0000-00-00 00:00:00',1,7,1020,1380,'Sun','Y','Y','Y',15,45),(8,1,'0000-00-00 00:00:00',1,8,0,0,'Mon','N','N','N',15,45),(9,1,'0000-00-00 00:00:00',1,9,0,0,'Tue','N','N','N',15,45),(10,1,'0000-00-00 00:00:00',1,10,0,0,'Wed','N','N','N',15,45),(11,1,'0000-00-00 00:00:00',1,11,0,0,'Thu','N','N','N',15,45),(12,1,'0000-00-00 00:00:00',1,12,0,0,'Fri','N','N','N',15,45),(13,1,'0000-00-00 00:00:00',1,13,0,0,'Sat','N','N','N',15,45),(14,1,'0000-00-00 00:00:00',1,14,0,0,'Sun','N','N','N',15,45);
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
INSERT INTO `settings_business` VALUES (1,1,'2014-07-17 08:43:43',1,'New','Indian Ocean','/img/struct/logo.png','Best food in town','eating@indianoceanpurley.com','indianoceanpurley@gmail.com','indianoceanpurley@gmail.com','indianoceanpurley@gmail.com','orders@allinepos.co.uk','02086600022','02086600044','','','13','Brighton Road','','','Purley','London','UK','CR8 4DA','','12345677','http://indianoceanpurley.com',0,'Amzad','Mojudmer','07900642131','2014','N');
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
INSERT INTO `users` VALUES (1,'127.0.0.1','amzadmojumder','$2y$08$vIfmHwcC6nP.UBIPtiCCSecavSKJZWFrYR6kH5kVJPi5nj.Z0Rq8C',NULL,'amzadfof@gmail.com',NULL,NULL,NULL,NULL,1405554124,1405587938,1,'Amzad','Mojumder','Conosurtek Ltd','07900642131'),(2,'127.0.0.1','administrator','$2y$08$8QTHU1aiZEgzos6tcIe8VuNSB39T2SsG9N9bKB.YZeizpfhIQ5FkO','','mr@conosurtek.net','',NULL,NULL,'bS14eFoGrrswcWLXHnNnFu',1268889823,1405553968,1,'Muhammad Rezwanur',' Rahman','Conosurtek Ltd','07900642131'),(3,'127.0.0.1','lalitasahu','$2y$08$HTRaaXBuUGAueqNQA8IUMe9unSWhgmsXjvvKHRJtR9khA32/G7ywi',NULL,'lalita@allinepos.co.uk',NULL,NULL,NULL,NULL,1405554460,1405554460,1,'Lalita','Sahu','All In Epos','07402950926'),(4,'127.0.0.1','tanjumkhan','$2y$08$7pdZA8Xlun82RHQ8ING6rOAF80bGKElz3Rp8y0tkhodpTeQR/95xa',NULL,'tanjum@cwaiter.co.uk',NULL,NULL,NULL,NULL,1405555520,1405555520,1,'Tanjum','Khan','Cwaiter Ltd','07900642133');
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
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
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

-- Dump completed on 2014-07-17 11:03:35

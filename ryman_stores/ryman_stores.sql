-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 01, 2014 at 02:47 PM
-- Server version: 5.1.50
-- PHP Version: 5.3.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ryman_stores`
--

-- --------------------------------------------------------

--
-- Table structure for table `markers`
--

CREATE TABLE IF NOT EXISTS `markers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `markers`
--

INSERT INTO `markers` (`id`, `name`, `address`, `lat`, `lng`, `type`) VALUES
(1, 'Pan Africa Market', '1521 1st Ave, Seattle, WA', 47.608940, -122.340141, 'restaurant'),
(2, 'Buddha Thai & Bar', '2222 2nd Ave, Seattle, WA', 47.613590, -122.344391, 'bar'),
(3, 'Ipanema Grill', '1225 1st Ave, Seattle, WA', 47.606365, -122.337654, 'restaurant'),
(4, 'Sake House', '2230 1st Ave, Seattle, WA', 47.612823, -122.345673, 'bar'),
(5, 'Crab Pot', '1301 Alaskan Way, Seattle, WA', 47.605961, -122.340363, 'restaurant'),
(6, 'Mama''s Mexican Kitchen', '2234 2nd Ave, Seattle, WA', 47.613976, -122.345467, 'bar'),
(7, 'Wingdome', '1416 E Olive Way, Seattle, WA', 47.617214, -122.326584, 'bar'),
(8, 'Piroshky Piroshky', '1908 Pike pl, Seattle, WA', 47.610126, -122.342834, 'restaurant');

-- --------------------------------------------------------

--
-- Table structure for table `storelocator_about`
--

CREATE TABLE IF NOT EXISTS `storelocator_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `banner` text,
  `branch_title` varchar(256) DEFAULT NULL,
  `branch_description` text,
  `location_title` varchar(256) DEFAULT NULL,
  `location_description` text,
  `near_us_title` varchar(256) DEFAULT NULL,
  `near_us_description` text,
  `aside_img` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branch_id` (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `storelocator_about`
--

INSERT INTO `storelocator_about` (`id`, `updated`, `active`, `branch_id`, `banner`, `branch_title`, `branch_description`, `location_title`, `location_description`, `near_us_title`, `near_us_description`, `aside_img`) VALUES
(1, '2014-06-30 13:24:32', 1, 1, 'http://85.113.84.102/stores/images/large/1018.jpg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What''s Near Us', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg'),
(2, '2014-06-27 16:50:03', 1, 2, 'http://www.swindontowncentre.co.uk/images/content/shop_units/Ryman/img_0500.jpg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What''s Near Us', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg'),
(3, '2014-06-30 13:25:38', 1, 3, 'http://gb.fotolibra.com/images/previews/936340-ryman-stationery-shop.jpeg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What''s Near Us', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg'),
(7, '2014-06-30 13:26:00', 1, 4, 'http://2.bp.blogspot.com/-A-Cb1aRM7i8/T0Kp8ffcKMI/AAAAAAAAD2c/ZEaX8iBvTes/s1600/P1130437.JPG', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What''s Near Us', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `storelocator_branches`
--

CREATE TABLE IF NOT EXISTS `storelocator_branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `store_code` varchar(256) NOT NULL DEFAULT '1',
  `branch_code` varchar(256) NOT NULL,
  `branch_name` varchar(256) NOT NULL DEFAULT 'New Store',
  `unique_name` varchar(256) NOT NULL,
  `email1` varchar(256) NOT NULL,
  `telephone1` varchar(32) NOT NULL,
  `telephone2` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `address1` varchar(256) NOT NULL,
  `address2` varchar(256) DEFAULT NULL,
  `town` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `county` varchar(256) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `postcode` varchar(256) NOT NULL,
  `direction` text,
  `web_url` text NOT NULL,
  `lat` varchar(256) NOT NULL,
  `lng` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `branch_code` (`branch_code`),
  UNIQUE KEY `unique_name` (`unique_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `storelocator_branches`
--

INSERT INTO `storelocator_branches` (`id`, `updated`, `active`, `store_code`, `branch_code`, `branch_name`, `unique_name`, `email1`, `telephone1`, `telephone2`, `fax`, `address1`, `address2`, `town`, `city`, `county`, `country`, `postcode`, `direction`, `web_url`, `lat`, `lng`) VALUES
(1, '2014-06-27 16:31:15', 0, '1', 'AAA1786', 'Amersham', 'Amersham', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '', '51.677', '-0.606'),
(2, '2014-06-30 13:21:33', 0, '1', 'AAA1787', 'Amersham2', 'Amersham2', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '', '51.679792', '-0.602283'),
(3, '2014-06-30 13:21:55', 0, '1', 'AAA1788', 'Amersham', 'Amersham3', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '', '51.678036', '-0.612947'),
(4, '2014-06-30 13:22:11', 0, '1', 'AAA1789', 'Amersham2', 'Amersham4', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '', '51.678036', '-0.612947');

-- --------------------------------------------------------

--
-- Stand-in structure for view `storelocator_branch_details`
--
CREATE TABLE IF NOT EXISTS `storelocator_branch_details` (
`id` int(11)
,`updated` timestamp
,`active` tinyint(4)
,`store_code` varchar(256)
,`branch_code` varchar(256)
,`branch_name` varchar(256)
,`unique_name` varchar(256)
,`email1` varchar(256)
,`telephone1` varchar(32)
,`telephone2` varchar(32)
,`fax` varchar(32)
,`address1` varchar(256)
,`address2` varchar(256)
,`town` varchar(256)
,`city` varchar(256)
,`county` varchar(256)
,`country` varchar(256)
,`postcode` varchar(256)
,`direction` text
,`web_url` text
,`lat` varchar(256)
,`lng` varchar(256)
,`banner` text
,`branch_title` varchar(256)
,`branch_description` text
,`location_title` varchar(256)
,`location_description` text
,`near_us_title` varchar(256)
,`near_us_description` text
,`aside_img` text
);
-- --------------------------------------------------------

--
-- Table structure for table `storelocator_hours_holiday`
--

CREATE TABLE IF NOT EXISTS `storelocator_hours_holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `from_` bigint(20) DEFAULT NULL,
  `to_` bigint(20) DEFAULT NULL,
  `holiday_date` date DEFAULT NULL,
  `holiday_name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `storelocator_hours_holiday`
--

INSERT INTO `storelocator_hours_holiday` (`id`, `updated`, `active`, `branch_id`, `from_`, `to_`, `holiday_date`, `holiday_name`) VALUES
(1, '2014-06-30 11:43:40', 1, 1, 400, 1200, '2014-07-09', 'Ryman Open Day'),
(2, '2014-06-30 11:44:31', 1, 1, 400, 1200, '2014-07-17', 'Robert Dyas Open Day');

-- --------------------------------------------------------

--
-- Table structure for table `storelocator_near_by`
--

CREATE TABLE IF NOT EXISTS `storelocator_near_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` bigint(20) DEFAULT '1',
  `branch_id` int(11) DEFAULT NULL,
  `branch_id_near_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `storelocator_near_by`
--

INSERT INTO `storelocator_near_by` (`id`, `updated`, `active`, `sn`, `branch_id`, `branch_id_near_by`) VALUES
(1, '2014-06-30 12:29:50', 1, 1, 1, 2),
(2, '2014-06-30 12:29:55', 1, 1, 1, 3),
(3, '2014-06-30 12:30:00', 1, 1, 1, 4),
(4, '2014-06-30 12:46:08', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `storelocator_near_by_details`
--
CREATE TABLE IF NOT EXISTS `storelocator_near_by_details` (
`id` int(11)
,`updated` timestamp
,`active` tinyint(4)
,`sn` bigint(20)
,`branch_id` int(11)
,`branch_id_near_by` int(11)
,`branch_name` varchar(256)
,`unique_name` varchar(256)
);
-- --------------------------------------------------------

--
-- Table structure for table `storelocator_opening_hours`
--

CREATE TABLE IF NOT EXISTS `storelocator_opening_hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `sn` bigint(20) DEFAULT NULL,
  `from_` bigint(20) DEFAULT NULL,
  `to_` bigint(20) DEFAULT NULL,
  `day` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `storelocator_opening_hours`
--

INSERT INTO `storelocator_opening_hours` (`id`, `updated`, `active`, `branch_id`, `sn`, `from_`, `to_`, `day`) VALUES
(1, '2014-06-30 11:27:10', 1, 1, 1, 750, 650, 'Mon'),
(2, '2014-06-30 11:26:17', 1, 1, 2, 750, 650, 'Wed'),
(3, '2014-06-30 11:26:35', 1, 1, 4, 750, 650, 'Thu'),
(4, '2014-06-30 11:26:43', 1, 1, 5, 750, 650, 'Fri'),
(5, '2014-06-30 11:26:52', 1, 1, 6, 750, 650, 'Sat'),
(6, '2014-06-30 11:27:01', 1, 1, 7, 750, 650, 'Sun');

-- --------------------------------------------------------

--
-- Table structure for table `storelocator_services`
--

CREATE TABLE IF NOT EXISTS `storelocator_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `service_name` varchar(256) DEFAULT NULL,
  `service_description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `storelocator_services`
--

INSERT INTO `storelocator_services` (`id`, `updated`, `active`, `service_name`, `service_description`) VALUES
(1, '2014-06-30 10:16:32', 1, 'DHL', 'Some Description'),
(2, '2014-06-30 10:16:53', 1, 'Photocopy', 'Some Description'),
(3, '2014-06-30 10:17:58', 1, 'Print', 'Some Description'),
(4, '2014-06-30 10:18:04', 1, 'Bind', 'Some Description'),
(5, '2014-06-30 10:18:11', 1, 'Finish', 'Some Description');

-- --------------------------------------------------------

--
-- Table structure for table `storelocator_services_store`
--

CREATE TABLE IF NOT EXISTS `storelocator_services_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `branch_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `storelocator_services_store`
--

INSERT INTO `storelocator_services_store` (`id`, `updated`, `active`, `branch_id`, `service_id`) VALUES
(1, '2014-06-30 10:30:36', 1, 1, 1),
(2, '2014-06-30 10:30:36', 1, 1, 2),
(3, '2014-06-30 10:30:36', 1, 1, 3),
(4, '2014-06-30 10:30:36', 1, 1, 4),
(5, '2014-06-30 10:30:36', 1, 1, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `storelocator_services_store_details`
--
CREATE TABLE IF NOT EXISTS `storelocator_services_store_details` (
`id` int(11)
,`updated` timestamp
,`active` tinyint(4)
,`branch_id` int(11)
,`service_id` int(11)
,`service_name` varchar(256)
,`service_description` text
);
-- --------------------------------------------------------

--
-- Structure for view `storelocator_branch_details`
--
DROP TABLE IF EXISTS `storelocator_branch_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `storelocator_branch_details` AS select `storelocator_branches`.`id` AS `id`,`storelocator_branches`.`updated` AS `updated`,`storelocator_branches`.`active` AS `active`,`storelocator_branches`.`store_code` AS `store_code`,`storelocator_branches`.`branch_code` AS `branch_code`,`storelocator_branches`.`branch_name` AS `branch_name`,`storelocator_branches`.`unique_name` AS `unique_name`,`storelocator_branches`.`email1` AS `email1`,`storelocator_branches`.`telephone1` AS `telephone1`,`storelocator_branches`.`telephone2` AS `telephone2`,`storelocator_branches`.`fax` AS `fax`,`storelocator_branches`.`address1` AS `address1`,`storelocator_branches`.`address2` AS `address2`,`storelocator_branches`.`town` AS `town`,`storelocator_branches`.`city` AS `city`,`storelocator_branches`.`county` AS `county`,`storelocator_branches`.`country` AS `country`,`storelocator_branches`.`postcode` AS `postcode`,`storelocator_branches`.`direction` AS `direction`,`storelocator_branches`.`web_url` AS `web_url`,`storelocator_branches`.`lat` AS `lat`,`storelocator_branches`.`lng` AS `lng`,`storelocator_about`.`banner` AS `banner`,`storelocator_about`.`branch_title` AS `branch_title`,`storelocator_about`.`branch_description` AS `branch_description`,`storelocator_about`.`location_title` AS `location_title`,`storelocator_about`.`location_description` AS `location_description`,`storelocator_about`.`near_us_title` AS `near_us_title`,`storelocator_about`.`near_us_description` AS `near_us_description`,`storelocator_about`.`aside_img` AS `aside_img` from (`storelocator_about` left join `storelocator_branches` on((`storelocator_branches`.`id` = `storelocator_about`.`branch_id`))) order by `storelocator_branches`.`id`;

-- --------------------------------------------------------

--
-- Structure for view `storelocator_near_by_details`
--
DROP TABLE IF EXISTS `storelocator_near_by_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `storelocator_near_by_details` AS select `storelocator_near_by`.`id` AS `id`,`storelocator_near_by`.`updated` AS `updated`,`storelocator_near_by`.`active` AS `active`,`storelocator_near_by`.`sn` AS `sn`,`storelocator_near_by`.`branch_id` AS `branch_id`,`storelocator_near_by`.`branch_id_near_by` AS `branch_id_near_by`,`storelocator_branches`.`branch_name` AS `branch_name`,`storelocator_branches`.`unique_name` AS `unique_name` from (`storelocator_branches` left join `storelocator_near_by` on((`storelocator_branches`.`id` = `storelocator_near_by`.`branch_id_near_by`))) where (`storelocator_near_by`.`active` = 1) order by `storelocator_near_by`.`sn`;

-- --------------------------------------------------------

--
-- Structure for view `storelocator_services_store_details`
--
DROP TABLE IF EXISTS `storelocator_services_store_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `storelocator_services_store_details` AS select `storelocator_services_store`.`id` AS `id`,`storelocator_services_store`.`updated` AS `updated`,`storelocator_services_store`.`active` AS `active`,`storelocator_services_store`.`branch_id` AS `branch_id`,`storelocator_services_store`.`service_id` AS `service_id`,`storelocator_services`.`service_name` AS `service_name`,`storelocator_services`.`service_description` AS `service_description` from (`storelocator_services` left join `storelocator_services_store` on((`storelocator_services`.`id` = `storelocator_services_store`.`service_id`))) where (`storelocator_services`.`active` = 1) order by `storelocator_services_store`.`id`;

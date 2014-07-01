

DROP TABLE IF EXISTS `storelocator_branches`;
CREATE TABLE `storelocator_branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `store_code` varchar(256) NOT NULL DEFAULT '1',
  `branch_code` varchar(256) NOT NULL UNIQUE,
  `branch_name` varchar(256) NOT NULL DEFAULT 'New Store',
  `unique_name` varchar(256) NOT NULL UNIQUE,
  `email1`varchar(256) NOT NULL,
  `telephone1` varchar(32) NOT NULL,
  `telephone2` varchar(32) ,
  `fax` varchar(32) ,
  `address1`varchar(256) NOT NULL ,
  `address2`varchar(256) ,
  `town`varchar(256) ,
  `city`varchar(256) ,
  `county`varchar(256) ,
  `country`varchar(256) ,
  `postcode`varchar(256) NOT NULL,
  `direction` text,
  `web_url` text NOT NULL ,
  `lat`varchar(256) NOT NULL,
  `lng`varchar(256) NOT NULL,
  `map_zoom` int(11),
  `map_branch_img`varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


DROP VIEW IF EXISTS `storelocator_branch_details`;
CREATE VIEW storelocator_branch_details AS
 SELECT
 storelocator_branches.*,
 storelocator_about.banner,
 storelocator_about.branch_title,
 storelocator_about.branch_description,
 storelocator_about.location_title,
 storelocator_about.location_description,
 storelocator_about.near_us_title,
 storelocator_about.near_us_description,
 storelocator_about.aside_img
 FROM storelocator_branches
RIGHT JOIN storelocator_about  ON storelocator_branches.id  =  storelocator_about.branch_id
ORDER BY  storelocator_branches.id ASC;


DROP TABLE IF EXISTS `storelocator_about`;
CREATE TABLE`storelocator_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL UNIQUE,
  `banner` text,
  `branch_title`varchar(256) ,
  `branch_description` text,
  `location_title`varchar(256) ,
  `location_description` text,
  `near_us_title`varchar(256) ,
  `near_us_description` text,
  `aside_img` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;



DROP TABLE IF EXISTS `storelocator_hours_opening`;
CREATE TABLE `storelocator_opening_hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT UNIQUE ,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `sn` bigint(20) DEFAULT '1',
  `from_` bigint(20),
  `to_` bigint(20),
  `day` varchar(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `storelocator_holiday_hours`;
CREATE TABLE `storelocator_hours_holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT UNIQUE ,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `branch_id` int(11) NOT NULL,
  `from_` bigint(20),
  `to_` bigint(20),
  `holiday_date` DATE,
  `holiday_name` varchar(256),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `storelocator_services`;
CREATE TABLE `storelocator_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT UNIQUE ,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `service_name` varchar(256),
  `service_description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `storelocator_services_store`;
CREATE TABLE `storelocator_services_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT UNIQUE ,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `branch_id` int(11),
  `service_id` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


DROP VIEW IF EXISTS `storelocator_services_store_details`;
CREATE VIEW `storelocator_services_store_details` AS
 SELECT
 storelocator_services_store.*,
 storelocator_services.service_name,
 storelocator_services.service_description
 FROM storelocator_services_store
RIGHT JOIN storelocator_services  ON storelocator_services.id  =  storelocator_services_store.service_id
WHERE storelocator_services.active=1
ORDER BY  storelocator_services_store.id ASC;



DROP TABLE IF EXISTS `storelocator_near_by`;
CREATE TABLE `storelocator_near_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT UNIQUE ,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` bigint(20) DEFAULT '1',
  `branch_id` int(11),
  `branch_id_near_by` int(11),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;



DROP VIEW IF EXISTS `storelocator_near_by_details`;
CREATE VIEW `storelocator_near_by_details` AS
 SELECT
 storelocator_near_by.*,
 storelocator_branches.branch_name,
 storelocator_branches.unique_name
 FROM storelocator_near_by
RIGHT JOIN  storelocator_branches  ON  storelocator_branches.id  =  storelocator_near_by.branch_id_near_by
WHERE storelocator_near_by.active=1
ORDER BY  storelocator_near_by.sn ASC;











INSERT INTO `storelocator_branches` (`id`, `updated`, `active`, `store_code`, `branch_code`, `branch_name`, `unique_name`, `email1`, `telephone1`, `telephone2`, `fax`, `address1`, `address2`, `town`, `city`, `county`, `country`, `postcode`, `direction`, `web_url`, `lat`, `lng`) VALUES
(1, '2014-06-27 16:31:15', 0, '1', 'AAA1786', 'Amersham', 'Amersham', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '', '51.677', '-0.606'),
(2, '2014-06-27 16:31:15', 0, '1', 'AAA1787', 'Amersham2', 'Amersham2', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '', '51.677', '-0.606'),
(3, '2014-06-27 16:31:15', 0, '1', 'AAA1788', 'Amersham', 'Amersham3', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '', '51.677', '-0.606'),
(4, '2014-06-27 16:31:15', 0, '1', 'AAA1789', 'Amersham2', 'Amersham4', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '', '51.677', '-0.606');



INSERT INTO `storelocator_about` (`id`, `updated`, `active`, `branch_id`, `banner`, `branch_title`, `branch_description`, `location_title`, `location_description`, `near_us_title`, `near_us_description`, `aside_img`) VALUES
(1, '2014-06-27 16:50:03', 1, 1, 'http://www.swindontowncentre.co.uk/images/content/shop_units/Ryman/img_0500.jpg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What''s Near Us', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg'),
(2, '2014-06-27 16:50:03', 1, 2, 'http://www.swindontowncentre.co.uk/images/content/shop_units/Ryman/img_0500.jpg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What''s Near Us', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg'),
(3, '2014-06-27 16:50:03', 1, 3, 'http://www.swindontowncentre.co.uk/images/content/shop_units/Ryman/img_0500.jpg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What''s Near Us', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg'),
(7, '2014-06-27 16:50:03', 1, 4, 'http://www.swindontowncentre.co.uk/images/content/shop_units/Ryman/img_0500.jpg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What''s Near Us', '                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg');

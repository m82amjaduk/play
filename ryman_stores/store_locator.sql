

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
  `lat`varchar(256) NOT NULL,
  `lng`varchar(256) NOT NULL,
  `map_zoom_list_page` int(11) DEFAULT '16',
  `map_zoom_branch_page` int(11) DEFAULT '16',
  `map_branch_img`varchar(256) ,

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


DROP VIEW IF EXISTS `storelocator_branch_list`;
CREATE VIEW storelocator_branch_list AS
  SELECT
    storelocator_branches.id,
    storelocator_branches.branch_name,
    storelocator_branches.unique_name,
    storelocator_branches.address1,
    storelocator_branches.address2,
    storelocator_branches.town,
    storelocator_branches.city,
    storelocator_branches.county,
    storelocator_branches.lat,
    storelocator_branches.lng,
    storelocator_branches.map_zoom_list_page,
    storelocator_branches.map_branch_img
  FROM storelocator_branches
    WHERE storelocator_branches.active = 1
  ORDER BY  storelocator_branches.id ASC;



DROP TABLE IF EXISTS `storelocator_hours_opening`;
CREATE TABLE `storelocator_hours_opening` (
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

DROP TABLE IF EXISTS `storelocator_hours_holiday`;
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





INSERT INTO `storelocator_services_store` (`id`, `updated`, `active`, `branch_id`, `service_id`) VALUES
  (1, '2014-06-30 10:30:36', 1, 1, 1),
  (2, '2014-06-30 10:30:36', 1, 1, 2),
  (3, '2014-06-30 10:30:36', 1, 1, 3),
  (4, '2014-06-30 10:30:36', 1, 1, 4),
  (5, '2014-06-30 10:30:36', 1, 1, 5);


INSERT INTO `storelocator_services` (`id`, `updated`, `active`, `service_name`, `service_description`) VALUES
  (1, '2014-06-30 10:16:32', 1, 'DHL', 'Some Description'),
  (2, '2014-06-30 10:16:53', 1, 'Photocopy', 'Some Description'),
  (3, '2014-06-30 10:17:58', 1, 'Print', 'Some Description'),
  (4, '2014-06-30 10:18:04', 1, 'Bind', 'Some Description'),
  (5, '2014-06-30 10:18:11', 1, 'Finish', 'Some Description');



INSERT INTO `storelocator_hours_opening` (`id`, `updated`, `active`, `branch_id`, `sn`, `from_`, `to_`, `day`) VALUES
  (1, '2014-06-30 11:27:10', 1, 1, 1, 750, 650, 'Mon'),
  (2, '2014-06-30 11:26:17', 1, 1, 2, 750, 650, 'Wed'),
  (3, '2014-06-30 11:26:35', 1, 1, 4, 750, 650, 'Thu'),
  (4, '2014-06-30 11:26:43', 1, 1, 5, 750, 650, 'Fri'),
  (5, '2014-06-30 11:26:52', 1, 1, 6, 750, 650, 'Sat'),
  (6, '2014-06-30 11:27:01', 1, 1, 7, 750, 650, 'Sun');




INSERT INTO `storelocator_near_by` (`id`, `updated`, `active`, `sn`, `branch_id`, `branch_id_near_by`) VALUES
  (1, '2014-06-30 12:29:50', 1, 1, 1, 2),
  (2, '2014-06-30 12:29:55', 1, 1, 1, 3),
  (3, '2014-06-30 12:30:00', 1, 1, 1, 4),
  (4, '2014-06-30 12:46:08', 1, 1, 1, 1);


INSERT INTO `storelocator_hours_holiday` (`id`, `updated`, `active`, `branch_id`, `from_`, `to_`, `holiday_date`, `holiday_name`) VALUES
  (1, '2014-06-30 11:43:40', 1, 1, 400, 1200, '2014-07-09', 'Ryman Open Day'),
  (2, '2014-06-30 11:44:31', 1, 1, 400, 1200, '2014-07-17', 'Robert Dyas Open Day');




INSERT INTO `storelocator_branches` (`id`, `updated`, `active`, `store_code`, `branch_code`, `branch_name`, `unique_name`, `email1`, `telephone1`, `telephone2`, `fax`, `address1`, `address2`, `town`, `city`, `county`, `country`, `postcode`, `direction`, `lat`, `lng`, `map_zoom_list_page`, `map_zoom_branch_page`, `map_branch_img`, `banner`, `branch_title`, `branch_description`, `location_title`, `location_description`, `near_us_title`, `near_us_description`, `aside_img`) VALUES
  (NULL, '2014-07-02 11:11:43', 1, '1', 'AAA1786', 'Amersham', 'Amersham', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '51.677', '-0.606', 16, 16, NULL, 'http://www.swindontowncentre.co.uk/images/content/shop_units/Ryman/img_0500.jpg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                       <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What`s Near Us ?', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                       <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg'),
  (NULL, '2014-07-02 11:11:43', 1, '1', 'AAA1787', 'Amersham2', 'Amersham2', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '51.677', '-0.606', 16, 16, NULL, 'http://www.swindontowncentre.co.uk/images/content/shop_units/Ryman/img_0500.jpg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                       <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What`s Near Us ?', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                       <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg'),
  (NULL, '2014-07-02 11:11:43', 1, '1', 'AAA1788', 'Amersham', 'Amersham3', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '51.677', '-0.606', 16, 16, NULL, 'http://www.swindontowncentre.co.uk/images/content/shop_units/Ryman/img_0500.jpg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                       <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What`s Near Us ?', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                       <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg'),
  (NULL, '2014-07-02 11:11:43', 1, '1', 'AAA1789', 'Amersham2', 'Amersham4', '114@store.robertdyas.co.uk', '02031292066', NULL, NULL, '82-86 Sycamore Road', NULL, NULL, 'Amersham', 'Buckinghamshire', NULL, 'HP6 5DR', NULL, '51.677', '-0.606', 16, 16, NULL, 'http://www.swindontowncentre.co.uk/images/content/shop_units/Ryman/img_0500.jpg', 'About Robert Dyas Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'About  Amersham', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                       <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'What`s Near Us ?', '<p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n                       <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>\r\n', 'http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg');
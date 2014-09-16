--
-- DROP TABLE IF EXISTS `settings_business`;
-- CREATE TABLE settings_business (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL,
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '1',
--   `business_code` varchar(256) NOT NULL DEFAULT 'New',
--   `business_name` varchar(256) NOT NULL DEFAULT 'New',
--   `logo` text NOT NULL,
--   `business_slogan` text NOT NULL,
--   `email_customer_service`varchar(256) NOT NULL,
--   `email_operation`varchar(256) NOT NULL,
--   `email_billing`varchar(256) NOT NULL,
--   `email_order`varchar(256) NOT NULL,49 tables 49 tables
--   `email_order_support`varchar(256) DEFAULT 'orders@allinepos.co.uk',
--   `phone1` varchar(32) NOT NULL,
--   `phone2` varchar(32) ,
--   `phone3` varchar(32) ,
--   `fax` varchar(32) ,
--   `house_number`varchar(128) ,
--   `address1`varchar(256) ,
--   `address2`varchar(256) ,
--   `town`varchar(256) ,
--   `city`varchar(256) ,
--   `county`varchar(256) ,
--   `country`varchar(256) ,
--   `postcode`varchar(256) NOT NULL,
--   `direction` text,
--   `vat_no`varchar(16),
--   `web_url` text NOT NULL,
--   `use_ssl`  tinyint(4) NOT NULL DEFAULT '0',
--   `manager_fnames`varchar(128) NOT NULL,
--   `manager_lname`varchar(128) NOT NULL,
--   `manager_phone`varchar(128) NOT NULL,
--   `established`varchar(128) ,
--   `pizza_supported`varchar(1) NOT NULL DEFAULT 'N',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;49 tables



-- DROP TABLE IF EXISTS `services_opening_hours`;
-- CREATE TABLE `services_opening_hours` (
--   `id` int(11) NOT NULL AUTO_INCREMENT UNIQUE ,
--   `login_id` bigint(20) NOT NULL,
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '0',
--   `sn` bigint(20),
--   `from_` bigint(20),
--   `to_` bigint(20),
--   `day` varchar(3),
--   `collection` varchar(1)DEFAULT 'Y',
--   `delivery` varchar(1) DEFAULT 'Y',
--   `sit_in` varchar(1) DEFAULT 'Y',
--   `waiting_collection` bigint(20) DEFAULT 15,
--   `waiting_delivery` bigint(20) DEFAULT 45,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


-- DROP TABLE IF EXISTS `cms_article`;
-- CREATE TABLE cms_article (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL DEFAULT '1',
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '0',
--   sn integer,
--   alias VARCHAR(256),
--   title text NOT NULL,
--   summary text,
--   body text NOT NULL,
--   banner_src text,
--   banner_href text,
--   image_src text,
--   image_href text,
--   button_href text,
--   button text,
--   page_template  VARCHAR(256),
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='### ' AUTO_INCREMENT=1;



-- DROP TABLE IF EXISTS `cms_highlights`;
-- CREATE TABLE IF NOT EXISTS `cms_highlights` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL DEFAULT '1',
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '1',
--   `sn` bigint(20) NOT NULL DEFAULT '1',
--   `alias` varchar(256) DEFAULT NULL,
--   `method` varchar(256) NOT NULL,
--   `module` varchar(256) NOT NULL,
--   `name` text NOT NULL,
--   `title` text,
--   `title2` text,
--   `title3` text,
--   `image_href` text,
--   `image_src` text,
--   `summary` text,
--   `body` text,
--   `button_href` text,
--   `button` text,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8;


-- DROP TABLE IF EXISTS `page_contact`;
-- CREATE TABLE `page_contact` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL DEFAULT '1',
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '0',
--   `api` varchar(128),
--   `lat` varchar(32),
--  `lng` varchar(32),
--   `marker_src` text,
--   `marker_visible` tinyint(4),
--   `zoom` int(11) DEFAULT '16',
--   `width` VARCHAR(32) DEFAULT '100%',
--   `height` VARCHAR(32) DEFAULT '300px',
--   `page_template` varchar(128) DEFAULT 'about/contact',
--   `map_active` int(4),
--   `contact_form` int(4),
--   `address` varchar(256),
--   `phone` varchar(256),
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


--
-- INSERT INTO services_opening_hours VALUES (13, 1, '2014-04-19 13:30:20' , 1, 13, 720, 840, 'Sat', 'Y', 'N', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (14, 1, '2014-04-19 13:30:20' , 1, 14, 720, 840, 'Sun', 'Y', 'N', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (12, 1, '2014-04-19 13:30:20' , 1, 12, 720, 840, 'Fri', 'Y', 'N', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (11, 1, '2014-04-19 13:30:20' , 1, 11, 720, 840, 'Thu', 'Y', 'N', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (10, 1, '2014-04-19 13:30:20' , 1, 10, 720, 840, 'Wed', 'Y', 'N', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (9, 1, '2014-04-19 13:30:20' , 1, 9, 720, 840, 'Tue', 'Y', 'N', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (8, 1, '2014-04-19 13:30:20' , 1, 8, 720, 840, 'Mon', 'Y', 'N', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (1, 7, '2014-04-19 13:30:20' , 1, 1, 1050, 1380, 'Mon', 'N', 'Y', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (2, 7, '2014-04-19 13:30:20' , 1, 2, 1050, 1380, 'Tue', 'N', 'Y', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (3, 7, '2014-04-19 13:30:20' , 1, 3, 1050, 1380, 'Wed', 'N', 'Y', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (4, 7, '2014-04-19 13:30:20' , 1, 4, 1050, 1380, 'Thu', 'N', 'Y', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (5, 7, '2014-04-19 13:30:20' , 1, 5, 1050, 1380, 'Fri', 'N', 'Y', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (6, 7, '2014-04-19 13:30:20' , 1, 6, 1050, 1380, 'Sat', 'N', 'Y', 'N', 15, 45);
-- INSERT INTO services_opening_hours VALUES (7, 7, '2014-04-19 13:30:20' , 1, 7, 1050, 1380, 'Sun', 'N', 'Y', 'N', 15, 45);



TRUNCATE `cms_highlights`;
INSERT INTO `cms_highlights` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `method`, `module`, `name`, `title`, `title2`, `title3`, `image_href`, `image_src`, `summary`, `body`, `button_href`, `button`) VALUES
  (1, 515, '2014-07-05 10:36:13', 1, 1, 'welcome', 'about/home', 'special', 'Special Offers !!', '#', '#', '#', '/takeaway/menu', 'http://allinepos.co.uk/clients/images/ukb1830/Highlights/off_20.jpg', '', 'and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use.', '/takeaway/menu', 'Order Online'),
  (2, 515, '2014-07-05 10:35:55', 1, 2, 'welcome', 'about/home', 'special', 'Freshly Cooked !!', '#', '', '', '/takeaway/menu', 'http://allinepos.co.uk/clients/images/ukb1830/Highlights/drink_free.jpg', '', 'and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use.', '/takeaway/menu', 'Complementary Drink'),
  (3, 7, '2014-07-05 10:35:44', 1, 3, 'welcome', 'about/home', 'special', 'Dine @ Home !!', '#', '', '', '/takeaway/menu', 'http://allinepos.co.uk/templates/1800/images/highlights/FreeDelivery.jpg', '', 'and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use.', '/takeaway/menu', 'Order Online'),
  (4, 11, '2014-07-05 12:31:26', 1, 4, 'welcome', 'about/home', 'mid_text', 'Meal for 2', 'The Royals’ menu is meticulously designed to suit the needs of every customer.', '#', '', '/takeaway/menu', 'http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg', '', 'and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use.', '/takeaway/menu', 'View Set Meals'),
  (5, 11, '2014-07-05 12:47:06', 1, 4, 'welcome', 'about/main', 'our_restaurant', 'Meal for 2', 'OUR RESTAURANT', '#', '', '/takeaway/menu', 'http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg', '', 'and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use link', '/takeaway/menu', 'View Set Meals'),
  (6, 11, '2014-07-05 12:47:06', 1, 4, 'welcome', 'about/main', 'our_food', 'Meal for 2', 'OUR RESTAURANT', '#', '', '/takeaway/menu', 'http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg', '', 'and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use link', '/takeaway/menu', 'View Set Meals'),
  (7, 11, '2014-07-05 12:47:06', 1, 4, 'welcome', 'about/main', 'top_banner', 'Meal for 2', 'Delivered Stright To Your Door.', '#', '', '/takeaway/menu', 'http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg', '', 'and text boxes in the most creative way. Some PDF to Txt Converter tries to extract as much text as possible from those PDF files and to present it in a way that you can read and re-use link', '/takeaway/menu', 'Order Online Now'),
  (8, 11, '2014-07-05 18:16:12', 1, 4, 'us', 'about/us', 'side', 'about us side starter', 'Starter', '#', '', '/takeaway/menu', '/img/highlights/starters.jpg', '#', '#', '/takeaway/menu', 'Order Online Now'),
  (9, 11, '2014-07-05 18:17:48', 1, 4, 'us', 'about/us', 'side', 'about Us, side , Main Dishes', 'Main Dishes', '#', '', '/takeaway/menu', '/img/highlights/main.jpg', '', '#', '/takeaway/menu', 'Order Online Now'),
  (10, 11, '2014-07-05 18:19:21', 1, 4, 'us', 'about/us', 'side', 'About Us, Side, Side Orders', 'Side Orders', '#', '', '/takeaway/menu', '/img/highlights/side.jpg', '', '#', '/takeaway/menu', 'Order Online Now');

TRUNCATE `cms_article`;
INSERT INTO `cms_article` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `title`, `summary`, `body`, `banner_src`, `banner_href`, `image_src`, `image_href`, `button_href`, `button`, `page_template`) VALUES
  (1, 1, '2014-07-05 21:55:31', 1, 1, 'about_us', 'About The Royals', NULL, '<p>The Royals has been established since 2000 and is still one of North London’s most popular Indian restaurants. </p> <br />\r\n\r\n                <p>The Royals was founded in 2000 by Mr Mostak Ahmed, who not only has sixteen years’ experience in the food industry but has a strong business sense. The Royals is a family run business which adopts a philosophy of wholesomeness, well-being and creates a strong traditional ambience. As a result, this has created a more family orientated restaurant for all to enjoy. </p> <br />\r\n\r\n                <p>Supporting The Royals is a chef with supreme talents. Experience of thirty-two years goes a long way in this industry. The Royals’ menu is meticulously designed to suit the needs of every customer. It is constantly being improved with excellent feedback from their valued customers. </p> ', NULL, '/takeaway/menu', '/img/articles/about_us.jpg', '/takeaway/menu', '/takeaway/menu', 'Order Online', '#');

INSERT INTO `page_contact` (`id`, `login_id`, `updated`, `active`, `api`, `lat`, `lng`, `marker_src`, `marker_visible`, `zoom`, `width`, `height`, `page_template`, `map_active`, `contact_form`, `address`, `phone`) VALUES
  (1, 1, '2014-06-30 00:33:13', 1, NULL, '51.330343', '-0.547510', '#', 1, 16, '100%', '400px', '/about/contact', 1, 1, '#', '#');


INSERT INTO `settings_business` (`id`, `login_id`, `updated`, `active`, `business_code`, `business_name`, `logo`, `business_slogan`, `email_customer_service`, `email_operation`, `email_billing`, `email_order`, `email_order_support`, `phone1`, `phone2`, `phone3`, `fax`, `house_number`, `address1`, `address2`, `town`, `city`, `county`, `country`, `postcode`, `direction`, `vat_no`, `web_url`, `use_ssl`, `manager_fnames`, `manager_lname`, `manager_phone`, `established`, `pizza_supported`) VALUES
(1, 1, '2014-07-17 09:43:43', 1, 'New', 'Indian Ocean', '/img/struct/logo.png', 'Best food in town', 'eating@indianoceanpurley.com', 'indianoceanpurley@gmail.com', 'indianoceanpurley@gmail.com', 'indianoceanpurley@gmail.com', 'orders@allinepos.co.uk', '02086600022', '02086600044', '', '', '13', 'Brighton Road', '', '', 'Purley', 'London', 'UK', 'CR8 4DA', '', '12345677', 'http://indianoceanpurley.com', 0, 'Amzad', 'Mojudmer', '07900642131', '2014', 'N');
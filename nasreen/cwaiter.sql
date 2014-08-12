

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) ZEROFILL NOT NULL AUTO_INCREMENT,
  `errno` int(2) NOT NULL,
  `errtype` varchar(32) NOT NULL,
  `errstr` text NOT NULL,
  `errfile` varchar(255) NOT NULL,
  `errline` int(4) NOT NULL,
  `user_agent` varchar(120) NOT NULL,
  `ip_address` varchar(45) DEFAULT '0' NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`, `ip_address`, `user_agent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `map_latlng`;
CREATE TABLE `map_latlng` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `search_key`  varchar(32) NOT NULL COMMENT 'eg. GU21 5ED, south end, Cherry Tree Walk',
  `search_key_nospace`  varchar(32) NOT NULL COMMENT 'eg. GU215ED, SOUTHEND, CHERRYTREEWALK',
  `lat`  varchar(32) NOT NULL DEFAULT '0',
  `lng`  varchar(32) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###Not updateable with form. Has to update via software / db process';


DROP TABLE IF EXISTS `users_address`;
CREATE TABLE `users_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `users_id`   bigint(20) NOT NULL ,
  `user_code`  varchar(32) NOT NULL,
  `address1`  varchar(256) NOT NULL,
  `address2`  varchar(256),
  `town`  varchar(256),
  `city`  varchar(256),
  `county`  varchar(256),
  `country`  varchar(256),
  `postcode`  varchar(32) NOT NULL,
  `map_latlng_id` int(11) NOT NULL,
  `primary_address` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';


DROP TABLE IF EXISTS `settings_system`;
CREATE TABLE `settings_system` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`doctype` TEXT NULL,
	`head_title` TEXT NULL,
	`meta_description` TEXT NULL,
	`meta_key` TEXT NULL,
	`favicon` TEXT NULL,
	`head_others` TEXT NULL,
	`copy_right` TEXT NULL,
	`copy_right_url` TEXT NULL,
	`currency_code` VARCHAR(32) NULL DEFAULT '826',
	`currency_symbol` VARCHAR(32) NULL DEFAULT '&pound;',
	`time_zone` VARCHAR(32) NULL DEFAULT '0',
	`summer_time` VARCHAR(32) NULL DEFAULT 'BST',
	`site_live` TINYINT(4) NOT NULL DEFAULT '0',
	`maintenance_note` TEXT NULL,
	`default_load` VARCHAR(256) NULL DEFAULT 'about/home',
	`default_load_login` VARCHAR(256) NULL DEFAULT 'about/home',
	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';







-----------------------------------------------




DROP TABLE IF EXISTS `rest_reservations`;
CREATE TABLE `rest_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `user_code`  varchar(10),
  `fnames`  varchar(256) NOT NULL,
  `lname`  varchar(256) NOT NULL,
  `email`  varchar(256) NOT NULL,
  `phone`  varchar(256) NOT NULL,
  `cover`  varchar(256) NOT NULL,
  `reservation_time`  bigint(20) NOT NULL DEFAULT '1',
  `note`  text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';


DROP TABLE IF EXISTS `rest_reservations_confirm`;
CREATE TABLE `rest_reservations_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `rest_reservations_id`   bigint(20) NOT NULL ,
  `confirmation_sent` tinyint(4) NOT NULL DEFAULT '0',
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `arrived` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';



DROP TABLE IF EXISTS `prod_options`;
CREATE TABLE `prod_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `name_option`  varchar NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';


DROP TABLE IF EXISTS `prod_options_price`;
CREATE TABLE `prod_options_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn`  int(11) NOT NULL ,
  `group_no`  int(11) NOT NULL ,
  `prod_id`  int(11) NOT NULL ,
  `prod_options_id` int(11) NOT NULL ,
  `price` int(11) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';





----------------------------------------------


DROP TABLE IF EXISTS `services_collection`;
CREATE TABLE `services_collection` (
	`id` INT(11) ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`available` VARCHAR(1) NULL DEFAULT NULL,
	`current_waiting_time` INT(11) NULL DEFAULT NULL,
	`opening_hours` TEXT NULL,
	`maximum_cover_cash` INT(11) NULL DEFAULT '15',
	`mini_order_value` FLOAT(10,2) NULL DEFAULT NULL,
	`start_after` INT(11) NULL DEFAULT '0',
	`end_before` INT(11) NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)COMMENT='###' COLLATE='latin1_swedish_ci' ENGINE=InnoDB AUTO_INCREMENT=2;



DROP TABLE IF EXISTS `services_delivery`;
CREATE TABLE `services_delivery` (
	`id` INT(11) ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`available` VARCHAR(1) NULL DEFAULT NULL,
	`current_waiting_time` INT(11) NULL DEFAULT NULL,
	`opening_hours` TEXT NULL,
	`maximum_cover_cash` INT(11) NULL DEFAULT '15',
	`mini_order_value` FLOAT(10,2) NULL DEFAULT NULL,
	`start_after` INT(11) NULL DEFAULT '0',
	`end_before` INT(11) NULL DEFAULT '0',
	`maximum_cover` FLOAT(10,2) DEFAULT '6',
	`free_area`  FLOAT(10,2) DEFAULT '3',
	`default_charge`  FLOAT(10,2) DEFAULT '2.00',
	`post_code_lookup` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)COMMENT='###' COLLATE='latin1_swedish_ci' ENGINE=InnoDB AUTO_INCREMENT=2;



DROP TABLE IF EXISTS `services_sit_in`;
CREATE TABLE `services_sit_in` (
	`id` INT(11) ZEROFILL NOT NULL AUTO_INCREMENT,
	`login_id` BIGINT(20) NOT NULL DEFAULT '1',
	`updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	`active` TINYINT(4) NOT NULL DEFAULT '0',
	`available` VARCHAR(1) NULL DEFAULT NULL,
	`opening_hours` TEXT NULL,
	`start_after` INT(11) NULL DEFAULT '0',
	`end_before` INT(11) NULL DEFAULT '0',
	`max_sit` INT(11) NULL DEFAULT '1',
	`licensed` TINYINT(4) NOT NULL DEFAULT '0',
	`air_condition` TINYINT(4) NOT NULL DEFAULT '0',
	`wheel_chair` TINYINT(4) NOT NULL DEFAULT '0',
	`disable_toilet` TINYINT(4) NOT NULL DEFAULT '0',
	`booking_accepted` TINYINT(4) NOT NULL DEFAULT '0',
	`admin` TINYINT(4) NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`)
)COMMENT='###' COLLATE='latin1_swedish_ci' ENGINE=InnoDB AUTO_INCREMENT=2;



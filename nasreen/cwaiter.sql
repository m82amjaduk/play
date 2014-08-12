

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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


DROP TABLE IF EXISTS `map_lat_lng`;
CREATE TABLE `map_lat_lng` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `search_key`  varchar(32) NOT NULL,
  `search_key_no_space`  varchar(32) NOT NULL,
  `lat`  varchar(32) NOT NULL,
  `lng`  varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###Not updateable with form. Has to update via software / db process';


DROP TABLE IF EXISTS `users_address`;
CREATE TABLE `rest_reservations_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `users_id`   bigint(20) NOT NULL ,
  `user_code`  varchar(32) NOT NULL,
  `address1`  varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

CREATE TABLE settings_system (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    doctype text,
    head_title text,
    meta_description text,
    meta_key text,
    favicon text,
    head_others text,
    copy_right text,
    copy_right_url text,
    currency_code character varying(32) DEFAULT '826'::character varying,
    currency_symbol character varying(32) DEFAULT '&pound;'::character varying,
    time_zone character varying(32) DEFAULT '0'::character varying,
    summer_time character varying(32) DEFAULT 'BST'::character varying,
    site_live character varying(1) DEFAULT 'N'::character varying,
    maintenance_note text DEFAULT 'This Site is currently underconstruction.'::text,
    default_load character varying(256) DEFAULT 'base/welcome'::character varying,
    default_load_login character varying(256) DEFAULT 'base/menu/1/1'::character varying
);



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






----------------------------------------------

----------------------------------------------------

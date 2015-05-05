<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 05/05/2015
 * Time: 10:40
 */


$action = "CREATE TABLE IF NOT EXISTS `employee_houses`";
$this->db->query(
    " $action (
`id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
`login_id` bigint(20) NOT NULL DEFAULT '1',
`updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`active` tinyint(1) NOT NULL DEFAULT '0',
`house_code` VARCHAR(7) NOT NULL DEFAULT 'AAA1786',
`address1` VARCHAR(256) NOT NULL DEFAULT 'Some Street',
`address2` VARCHAR(256),
`town` VARCHAR(256),
`city` VARCHAR(256),
`county` VARCHAR(256),
`country` VARCHAR(256),
`postcode` VARCHAR(32) NOT NULL DEFAULT 'AB12 3CD',
`lat` varchar(32) NOT NULL DEFAULT '51.507351',
`lng` varchar(32) NOT NULL DEFAULT '-0.127758',
PRIMARY KEY (`id`),
UNIQUE INDEX `employee_houses_house_code` (`house_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
);
$this->mig->log($action, __FILE__, __LINE__);


$action = "CREATE TABLE IF NOT EXISTS `employee_houses_bed`";
$this->db->query(
    " $action (
`id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
`login_id` bigint(20) NOT NULL DEFAULT '1',
`updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`active` tinyint(1) NOT NULL DEFAULT '0',
`bed_code` VARCHAR(7) NOT NULL DEFAULT 'AAA1786',
`house_code` VARCHAR(7) NOT NULL DEFAULT 'AAA1786',
`description` TEXT,
`pay_date` DATE NULL DEFAULT NULL,
`rent` DECIMAL(7,2) DEFAULT '0.00',
PRIMARY KEY (`id`),
UNIQUE INDEX `employee_houses_bed_code` (`bed_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
);
$this->mig->log($action, __FILE__, __LINE__);

$action = "CREATE TABLE IF NOT EXISTS `employee_houses_utility`";
$this->db->query(
    " $action (
`id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
`login_id` bigint(20) NOT NULL DEFAULT '1',
`updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`active` tinyint(1) NOT NULL DEFAULT '0',
`house_code` VARCHAR(7) NOT NULL DEFAULT 'AAA1786',
`pay_date` DATE NULL DEFAULT NULL,
`gas` DECIMAL(7,2) DEFAULT '0.00',
`electricity` DECIMAL(7,2) DEFAULT '0.00',
`water` DECIMAL(7,2) DEFAULT '0.00',
`tax` DECIMAL(7,2) DEFAULT '0.00',
`share` INT(7) DEFAULT '5' COMMENT 'How many share to davide the utility',
PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
);
$this->mig->log($action, __FILE__, __LINE__);


$action = "CREATE TABLE IF NOT EXISTS `employee_accommodation`";
$this->db->query(
    " $action (
`id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
`login_id` bigint(20) NOT NULL DEFAULT '1',
`updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`active` tinyint(1) NOT NULL DEFAULT '0',
`bed_code` VARCHAR(7) NOT NULL DEFAULT 'AAA1786',
`user_code` VARCHAR(7) NOT NULL DEFAULT 'AAA1786',
PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
);
$this->mig->log($action, __FILE__, __LINE__);


$action = "CREATE TABLE IF NOT EXISTS `employee_employment`";
$this->db->query(
    " $action (
`id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT UNIQUE,
`login_id` bigint(20) NOT NULL DEFAULT '1',
`updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`active` tinyint(1) NOT NULL DEFAULT '0',
`business_code` VARCHAR(7) NOT NULL DEFAULT 'AAA1786',
`user_code` VARCHAR(7) NOT NULL DEFAULT 'AAA1786',
`pay_date` DATE NULL DEFAULT NULL,
`salary_net` DECIMAL(7,2) DEFAULT '0.00',
`salary_gross` DECIMAL(7,2) DEFAULT '0.00',
PRIMARY KEY (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
);
$this->mig->log($action, __FILE__, __LINE__);
DROP TABLE IF EXISTS `groups`;

#
# Table structure for table 'groups'
#

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table 'groups'
#


DROP TABLE IF EXISTS `users`;

#
# Table structure for table 'users'
#

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Dumping data for table 'users'
#


DROP TABLE IF EXISTS `users_groups`;

#
# Table structure for table 'users_groups'
#

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `uc_users_groups` UNIQUE (`user_id`, `group_id`),
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `login_attempts`;

#
# Table structure for table 'login_attempts'
#

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




######
INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'allinepos', 'All Admin user from All In Epos');


INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'amzadmojumder', '$2y$08$vIfmHwcC6nP.UBIPtiCCSecavSKJZWFrYR6kH5kVJPi5nj.Z0Rq8C', NULL, 'amzadfof@gmail.com', NULL, NULL, NULL, NULL, 1405554124, 1405554124, 1, 'Amzad', 'Mojumder', 'Conosurtek Ltd', '07900642131'),
(2, '127.0.0.1', 'administrator', '$2y$08$8QTHU1aiZEgzos6tcIe8VuNSB39T2SsG9N9bKB.YZeizpfhIQ5FkO', '', 'mr@conosurtek.net', '', NULL, NULL, 'bS14eFoGrrswcWLXHnNnFu', 1268889823, 1405553968, 1, 'Muhammad Rezwanur', ' Rahman', 'Conosurtek Ltd', '07900642131'),
(3, '127.0.0.1', 'lalitasahu', '$2y$08$HTRaaXBuUGAueqNQA8IUMe9unSWhgmsXjvvKHRJtR9khA32/G7ywi', NULL, 'lalita@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405554460, 1405554460, 1, 'Lalita', 'Sahu', 'All In Epos', '07402950926'),
(4, '127.0.0.1', 'tanjumkhan', '$2y$08$7pdZA8Xlun82RHQ8ING6rOAF80bGKElz3Rp8y0tkhodpTeQR/95xa', NULL, 'tanjum@cwaiter.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1405555520, 1, 'Tanjum', 'Khan', 'Cwaiter Ltd', '07900642133');


INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(25, 1, 1),
(26, 1, 2),
(27, 1, 3),
(11, 2, 1),
(12, 2, 2),
(13, 2, 3),
(19, 3, 1),
(20, 3, 2),
(21, 3, 3),
(22, 4, 1),
(23, 4, 2),
(24, 4, 3);
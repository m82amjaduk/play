
DROP TABLE IF EXISTS `loyalty_history`;
CREATE TABLE IF NOT EXISTS `loyalty_history` (
  `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` BIGINT(20) NOT NULL DEFAULT '1',
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` TINYINT(1) NOT NULL DEFAULT '0',
  `user_code` VARCHAR(7) NOT NULL,
  `description` VARCHAR(512) NOT NULL DEFAULT 'Order Placed' COMMENT 'Recurring',
  `point` INT(11) NOT NULL DEFAULT '1',
  `transaction_type` VARCHAR(512) NOT NULL DEFAULT 'earned' COMMENT 'spent/refund',
  `user_code_guest` VARCHAR(7) DEFAULT NULL COMMENT 'If Point Earned From An Invitation',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';


DROP TABLE IF EXISTS `loyalty_settings`;
CREATE TABLE IF NOT EXISTS `loyalty_settings` (
  `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` BIGINT(20) NOT NULL DEFAULT '1',
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` TINYINT(1) NOT NULL DEFAULT '0',

  `view_history` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Customers May See Reward Points History',
  `view_invitations_history` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Customers May See Invitations History',

  `purchase_earn` TINYINT(1) NOT NULL DEFAULT '0',
  `purchase_point` INT(11) NOT NULL DEFAULT '4' COMMENT 'For each pounds spent.',

  `user_reg_guset_earn` TINYINT(1) NOT NULL DEFAULT '0',
  `user_reg_guset_point` INT(11) NOT NULL DEFAULT '10',
  `user_reg_reffered_earn` TINYINT(1) NOT NULL DEFAULT '0',
  `user_reg_referred_point` INT(11) NOT NULL DEFAULT '50',

  `newsletter_earn` TINYINT(1) NOT NULL DEFAULT '0',
  `newsletter_point` INT(11) NOT NULL DEFAULT '10',

  `blog_comment_earn` TINYINT(1) NOT NULL DEFAULT '0',
  `blog_comment_point` INT(11) NOT NULL DEFAULT '50',
  `blog_comment_max_month` INT(11) NOT NULL DEFAULT '3' COMMENT 'Maximum Comment Post Each Month. For Comments, Point Will Not Be Earned If Limit Exit.',

  `referral_earn` TINYINT(1) NOT NULL DEFAULT '0',
  `referral_point` INT(11) NOT NULL DEFAULT '10',

  `referral_purchase_first_earn` TINYINT(1) NOT NULL DEFAULT '0'  COMMENT 'Referer Get Points On FIRST order Only',
  `referral_purchase_fisrt_point` INT(11) NOT NULL DEFAULT '5' COMMENT 'For each pounds spent.',
  `referral_purchase_each_earn` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Referer Get Points On EACH order',
  `referral_purchase_each_point` INT(11) NOT NULL DEFAULT '2' COMMENT 'For each pounds spent.',
  `referral_purchase_name_history` TINYINT(1) NOT NULL DEFAULT '1' COMMENT 'Show Friends Name On History',
  

  `cash_order_earn` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Earn Points On Cash Orders',
  `auto_checked_use_reward` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'On Check Out Use Point Will Be Automatically Checked',
  `point_worth_of` DECIMAL(7,2) NOT NULL DEFAULT '0.02' COMMENT 'Point Worth Of, In Cash Value',
  `minimum_redeem` INT(11) NOT NULL DEFAULT '200' COMMENT 'Minimum Reward Points Balance to Be Able To Redeem',
  `point_expire_days` INT(11) NOT NULL DEFAULT '180' COMMENT 'Reward Points Expire in (days)',

  `email_point_update` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Inform user about point update',
  `email_point_expiry` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Inform user about point expiry',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';


DROP TABLE IF EXISTS `loyalty_referral`;
CREATE TABLE IF NOT EXISTS `loyalty_referral` (
  `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` BIGINT(20) NOT NULL DEFAULT '1',
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` TINYINT(1) NOT NULL DEFAULT '0',

  `user_code_referrer` VARCHAR(7) NOT NULL DEFAULT 'AAA1786',
  `user_code_reffered` VARCHAR(7) DEFAULT NULL,
  `email` VARCHAR(1024) NOT NULL DEFAULT 'm82amjad@yahoo.co.uk',
  `email_valid` TINYINT(1) NOT NULL DEFAULT '0',
  `registered` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Customer Registered',
  `customer` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Invitation Converted To Customer',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';



CREATE VIEW cms_nav_view AS
  SELECT
    cms_nav.id AS cms_nav_id,
    cms_nav.active AS cms_nav_active,
    cms_nav.sn AS cms_nav_sn,
    cms_nav.alias,
    cms_nav.nav_name AS cms_nav_name,
    cms_nav.title,

    cms_nav_url.id AS cms_nav_url_id,
    cms_nav_url.active AS cms_nav_url_active,
    cms_nav_url.sn AS cms_nav_url_sn,
    cms_nav_url.nav_name AS cms_nav_url_name,
    cms_nav_url.href,
    cms_nav_url.image_src

  FROM cms_nav
    RIGHT JOIN cms_nav_url  ON cms_nav_url.cms_nav_id = cms_nav.id
    WHERE cms_nav_url.active = 1
  ORDER BY  cms_nav_url.sn ASC;


INSERT INTO `cms_nav` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `nav_name`, `title`) VALUES
  (00000000001, 1, '2014-09-16 14:17:34', 1, 1, 'menu_top', 'Menu Top', NULL),
  (00000000002, 1, '2014-09-16 14:17:14', 1, 1, 'about_top', 'About Top', NULL),
  (00000000003, 1, '2014-09-16 14:19:25', 1, 1, 'category_footer', 'Category Footer', NULL),
  (00000000004, 1, '2014-09-16 14:20:06', 1, 1, 'category_addon', 'Category Add On', NULL);

INSERT INTO `cms_nav_url` (`id`, `login_id`, `updated`, `active`, `sn`, `parent`, `nav_name`, `cms_nav_id`, `href`, `image_src`) VALUES
  (00000000001, 1, '2014-09-16 14:21:52', 1, 1, 0, 'Home', 1, 'abount/home', NULL),
  (00000000002, 1, '2014-09-16 14:23:42', 1, 2, 0, 'Menu', 1, 'takeaway/menu', NULL),
  (00000000003, 1, '2014-09-16 14:50:17', 1, 3, 0, 'About Us', 1, 'about/us', NULL),
  (00000000004, 1, '2014-09-16 14:50:17', 1, 4, 0, 'Gallery', 1, 'about/gallery', NULL),
  (00000000005, 1, '2014-09-16 14:50:17', 1, 5, 0, 'Contact', 1, 'about/contact', NULL),
  (00000000006, 1, '2014-09-16 14:50:17', 1, 1, 0, 'Home', 2, 'about/home', NULL),
  (00000000007, 1, '2014-09-16 14:50:17', 1, 2, 0, 'About Us', 2, 'about/us', NULL),
  (00000000008, 1, '2014-09-16 14:50:17', 1, 3, 0, 'Menu', 2, 'takeaway/menu', NULL),
  (00000000009, 1, '2014-09-16 14:50:17', 1, 4, 0, 'Gallery', 2, 'about/gallery', NULL),
  (00000000010, 1, '2014-09-16 14:50:17', 1, 5, 0, 'Contact', 2, 'about/contact', NULL),
  (00000000011, 1, '2014-09-16 14:50:17', 1, 1, 0, 'Starter', 3, 'takeaway/menu/2', NULL),
  (00000000012, 1, '2014-09-16 14:50:17', 1, 2, 0, 'Tandoori Dishes', 3, 'takeaway/menu/3', NULL),
  (00000000013, 1, '2014-09-16 14:50:17', 1, 3, 0, 'Chef Specials', 3, 'takeaway/menu/2', NULL),
  (00000000014, 1, '2014-09-16 14:50:17', 1, 4, 0, 'Classic Dishes', 3, 'takeaway/menu/2', NULL),
  (00000000015, 1, '2014-09-16 14:50:17', 1, 5, 0, 'Side Orders', 3, 'takeaway/menu/2', NULL),
  (00000000016, 1, '2014-09-16 14:50:17', 1, 5, 0, 'Sundries', 3, 'takeaway/menu/2', NULL),
  (00000000017, 1, '2014-09-16 14:50:17', 1, 1, 0, 'Meal Deals', 4, 'takeaway/menu/2', NULL);


DROP TABLE IF EXISTS `cms_nav_site_urls`;
CREATE TABLE IF NOT EXISTS `cms_nav_site_urls` (
  `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` BIGINT(20) NOT NULL DEFAULT '1',
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` TINYINT(1) NOT NULL DEFAULT '0',

  `href` VARCHAR(2048) NOT NULL DEFAULT 'new',
  `title` VARCHAR(2048) NOT NULL DEFAULT 'Official Site | <?=$businessName?>',
  `description` VARCHAR(2048) NOT NULL DEFAULT '<?=$description?>',
  `keyword` VARCHAR(2048) NOT NULL DEFAULT '<?=$keyword?>, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, <?=$town?>',
  `favicon` VARCHAR(2048) NOT NULL DEFAULT 'img/struct/favicon.ico',
  `note` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';

INSERT INTO `cms_nav_site_urls` (`id`, `login_id`, `updated`, `active`, `href`, `title`, `description`, `keyword`, `favicon`, `note`) VALUES
  (00000000001, 1, '2014-09-18 11:35:38', 1, 'about/home', 'Official Site | Welcome To <?=$businessName?>', '<?=$description?>', '<?=$keyword?>, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, <?=$town?>', 'img/struct/favicon.ico', NULL),
  (00000000002, 1, '2014-09-18 11:35:40', 1, 'takeaway/menu', '<?=$categoryName?> | Menu | <?=$businessName?>', '<?=$description?>', '<?=$keyword?>, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, <?=$town?>', 'img/struct/favicon.ico', NULL),
  (00000000003, 1, '2014-09-18 11:35:41', 1, 'about/us', 'About Us | <?=$businessName?>', '<?=$description?>', '<?=$keyword?>, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, <?=$town?>', 'img/struct/favicon.ico', NULL),
  (00000000004, 1, '2014-09-18 11:35:43', 1, 'about/gallery', 'Our Gallery | <?=$businessName?>', '<?=$description?>', '<?=$keyword?>, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, <?=$town?>', 'img/struct/favicon.ico', NULL),
  (00000000005, 1, '2014-09-18 11:35:44', 1, 'about/contact', 'Contact Us | <?=$businessName?>', '<?=$description?>', '<?=$keyword?>, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, <?=$town?>', 'img/struct/favicon.ico', NULL),
  (00000000006, 1, '2014-09-18 11:35:45', 1, 'about/specialoffers', 'Special Offers | <?=$businessName?>', '<?=$description?>', '<?=$keyword?>, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, <?=$town?>', 'img/struct/favicon.ico', NULL),
  (00000000007, 1, '2014-09-18 11:35:53', 1, 'takeaway/menu/2', '<?=$categoryName?> | Menu | <?=$businessName?>', '<?=$description?>', '<?=$keyword?>, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, <?=$town?>', 'img/struct/favicon.ico', NULL),
  (00000000008, 1, '2014-09-18 11:37:15', 1, 'takeaway/menu/3', '<?=$categoryName?> | Menu | <?=$businessName?>', '<?=$description?>', '<?=$keyword?>, Chicken Tikka Masala, Lamb Dansak, Spicy, Hot,  Indian, Food, <?=$town?>', 'img/struct/favicon.ico', NULL);

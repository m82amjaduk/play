
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
  `balance` INT(11) NOT NULL DEFAULT '0',
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



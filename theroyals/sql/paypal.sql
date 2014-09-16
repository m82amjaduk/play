/*
DROP TRIGGER IF EXISTS `orders_cwdp_new_order`;
CREATE TRIGGER `orders_cwdp_new_order` AFTER INSERT ON `orders` FOR EACH ROW insert into `orders_cwdp` (`order_code`) values (`NEW`.`order_code`);
*/
DROP TABLE IF EXISTS `pay_paypal`;
CREATE TABLE `pay_paypal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `api_username` text,
  `api_password` text,
  `api_signature` text,
  `test_api_username` text,
  `test_api_password` text,
  `test_api_signature` text,
  `image` text,
  `transaction_fee` decimal(20,2) DEFAULT '0.20',
  `commision` decimal(20,2) DEFAULT '3.20',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  `email_address` varchar(512) DEFAULT 'paypal@allinepos.co.uk',
  `action_type` varchar(32) DEFAULT 'integrated' COMMENT 'paynow/integrated/payment_pro',
  `sandbox` tinyint(4) NOT NULL DEFAULT '0',
  `flat_fee` decimal(20,2) DEFAULT '0.20',
  `pay_after_transaction` tinyint(4) NOT NULL DEFAULT '0',
  `index_redirect_url` varchar(512) DEFAULT NULL,
  `log_dir` varchar(512) DEFAULT NULL,
  `transaction_log` varchar(512) DEFAULT NULL,
  `exception_log` varchar(512) DEFAULT NULL,
  `log_file_active` tinyint(4) NOT NULL DEFAULT '1',
  `http_response_log` varchar(512) NOT NULL DEFAULT '1',
  `http_response_log_active` tinyint(4) NOT NULL DEFAULT '1',
  `log_query_string_active` tinyint(4) NOT NULL DEFAULT '1',
  `completed_message` text,
  `pending_message` text,
  `success_url` varchar(512) DEFAULT NULL,
  `pending_url` varchar(512) DEFAULT NULL,
  `site_logo` varchar(512) DEFAULT NULL,
  `cart_border_color` varchar(256) DEFAULT NULL,
  `currency_code` varchar(256) DEFAULT NULL,
  `return_url` varchar(256) DEFAULT NULL,
  `cancel_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###Not updateable with form. Has to update via software / db process';



INSERT INTO `pay_paypal` VALUES (1,230,'2014-07-21 04:24:22',1,'m82amjad_api1.hotmail.co.uk','W4W9MCXCZ9DL4938','AamyNj8hYYmtqQkScocIJA2nHc2KAphH9D-oD3aGUcOr8fR.riuDM75B','seller_1317255315_biz_api1.gmail.com','1317255350','AFcWxV21C7fd0v3bYYYRCpSSRl31AsEXo1mfs5m9KpiElKsbTiQR9C2V','#',0.20,3.40,5.00,'m82amjad@gmail.com','integrated',1,-2.00,0,'takeaway/confirm','var/log','paypal.log','exception.log',1,'paypal_http_response.log',1,1,'Payment Received! Your product will be sent to you very soon!','Transaction Complete. But payment is still pending! <br /> You need to manually authorize this payment in your <a href=\'http://www.paypal.com\'>Paypal Account</a>','takeaway/process_order','takeaway/process_order','http://al-aminrestaurant.co.uk/img/menu/logoPaypal.png','000000','GBP','paypal/process','takeaway/order_details');

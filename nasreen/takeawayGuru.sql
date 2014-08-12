
DROP TABLE IF EXISTS `order_api_config`;
CREATE TABLE `order_api_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `business_code`  varchar(256) NOT NULL UNIQUE,
  `business_name`  varchar(1024) NOT NULL DEFAULT 'NewBusiness' ,

  `order_api_domain`  varchar(1024) NOT NULL DEFAULT 'http://al-aminrestaurant.com',
  `order_api_new_order`  varchar(1024) NOT NULL DEFAULT '/cwdp/order_new/$time/$hash',
  `order_api_order_data`  varchar(1024) NOT NULL DEFAULT '/cwdp/order/$orderCode/$time/$hash',
  `order_api_print_success_url`  varchar(1024) NOT NULL DEFAULT '/cwdp/order_printed/$orderCode/$time/$hash',
  `order_api_psk` varchar(128) NOT NULL  DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890' COMMENT 'Pre shared key, to access order api',
  `order_api_check_interval`  int(11) DEFAULT '180' COMMENT  'How often will it check for new order (in second)?',
  `order_api_log_file`  tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Save connection log to a file (Yes/No)?',

  `config_api_check_interval`  int(11) DEFAULT '86400' COMMENT 'How often Config will update(in second)?',
  `config_api_pin` varchar(128) NOT NULL  DEFAULT 'ABC123' COMMENT 'Pin to access config api',
  `config_api_log_file`  tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Save connection log to a file (Yes/No)?',

  `receipt_print_printing_time`  tinyint(4) NOT NULL DEFAULT '1',
  `receipt_auto_print`  tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Print an order as it received.',
  `receipt_prints_copy`  tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Number of copies for each order',
  `receipt_play_voice`  tinyint(4) NOT NULL DEFAULT '3' COMMENT '-1 for Manual stop, number of time voice alert played',
  `receipt_line_char` varchar(4) NOT NULL DEFAULT '-',
  `receipt_currency_symbol` varchar(128) NOT NULL  DEFAULT '£' COMMENT '£ / $',
  `receipt_pdf_html_output` varchar(128) NOT NULL  DEFAULT 'html' COMMENT 'html / prf / text',


  `printer_isp` varchar(128) NOT NULL  DEFAULT 'virgin_media' COMMENT 'virgin_media / bt / o2 / talktalk',
  `printer_connection` varchar(128) NOT NULL  DEFAULT 'ip' COMMENT 'ip / usb / serial_port',
  `printer_ip` varchar(128) NOT NULL  DEFAULT '192.168.0.105',

  `app_test_print_at`  int(11) NOT NULL  DEFAULT '61200' COMMENT 'Time when it will print welcome message automatically.(in Sec)',
  `app_test_print_content`  text COMMENT 'Printer Check Succeeded.  Please contact us on support@allinepos.co.uk, 0203129 2061 if you require any asst.',
  `app_environment`  varchar(128) NOT NULL DEFAULT 'live' COMMENT 'live / test / dev',
  `app_close_pin`  varchar(128) NOT NULL   DEFAULT 'ABC123' COMMENT 'PIN to close the application.',
  `app_current_version`  varchar(128) NOT NULL  DEFAULT '010010',
  `app_expire_date`  bigint(20) DEFAULT '1455268287' COMMENT 'Time when application will require license renew.',

  `support_by` varchar(128) NOT NULL  DEFAULT 'All_In_ePOS' COMMENT 'Company name with no space, letter only',
  `support_phone` varchar(128) NOT NULL  DEFAULT '02031292061',
  `support_website` varchar(128) NOT NULL  DEFAULT 'http://allinepos.co.uk',
  `support_email` varchar(128) NOT NULL  DEFAULT 'support@allinepos.co.uk',
  `support_invoice_overdue` varchar(128) NOT NULL  DEFAULT 'no' COMMENT 'no / license_renewal / overdue / license_expired / shutdown ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';

INSERT INTO order_api_config SET business_code='AAA1786', business_name='Al-amin Restaurant', order_api_domain='http://al-aminrestaurant.com';
INSERT INTO order_api_config SET business_code='AAA1787', business_name='Indian Oceans', order_api_domain='http://indianoceanpurley.com';
INSERT INTO order_api_config SET business_code='AAA1788', business_name='Bithika Tandoori', order_api_domain='http://bithika.co.uk';
INSERT INTO order_api_config SET business_code='AAA1789', business_name='The Royals Restaurant', order_api_domain='http://theroyalsrestaurant.co.uk';
INSERT INTO order_api_config SET business_code='AAA1790';
INSERT INTO order_api_config SET business_code='AAA1791';
INSERT INTO order_api_config SET business_code='AAA1792';


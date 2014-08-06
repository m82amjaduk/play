
DROP TABLE IF EXISTS `order_api_config`;
CREATE TABLE `order_api_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `business_code`  varchar(256) NOT NULL DEFAULT 'AAA1787',
  `business_name`  varchar(1024) NOT NULL DEFAULT 'NewBusiness' ,

  `order_api_url`  varchar(1024) NOT NULL DEFAULT 'API_URL',
  `order_api_psk` varchar(128) NOT NULL  DEFAULT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
  `order_api_print_success_url`  varchar(1024) NOT NULL DEFAULT 'success',
  `order_api_check_interval`  int(11) DEFAULT '180' ,
  `order_api_log_file`  tinyint(4) NOT NULL DEFAULT '1',

  `config_api_check_interval`  int(11) DEFAULT '1430',
  `config_api_pin` varchar(128) NOT NULL  DEFAULT 'ABC123',
  `config_api_log_file`  tinyint(4) NOT NULL DEFAULT '1',

  `receipt_print_printing_time`  tinyint(4) NOT NULL DEFAULT '1',
  `receipt_auto_print`  tinyint(4) NOT NULL DEFAULT '1',
  `receipt_prints_copy`  tinyint(4) NOT NULL DEFAULT '2',
  `receipt_play_voice`  tinyint(4) NOT NULL DEFAULT '3',
  `receipt_line_char` varchar(4) NOT NULL DEFAULT '-',
  `receipt_currency_symbol` varchar(128) NOT NULL  DEFAULT '£',
  `receipt_pdf_html_output` varchar(128) NOT NULL  DEFAULT 'html',

  `app_test_print_at`  int(11) NOT NULL  DEFAULT '1000',
  `app_test_print_content`  text  ,
  `app_environment`  varchar(128) NOT NULL DEFAULT 'live',
  `app_close_pin`  varchar(128) NOT NULL   DEFAULT 'ABC123',
  `app_current_version`  varchar(128) NOT NULL  DEFAULT '010010',

  `support_by` varchar(128) NOT NULL  DEFAULT 'All_In_ePOS',
  `support_phone` varchar(128) NOT NULL  DEFAULT '02031292061',
  `support_website` varchar(128) NOT NULL  DEFAULT 'http://allinepos.co.uk',
  `support_email` varchar(128) NOT NULL  DEFAULT 'support@allinepos.co.uk',
  `support_invoice_overdue` varchar(128) NOT NULL  DEFAULT 'no',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='### ';

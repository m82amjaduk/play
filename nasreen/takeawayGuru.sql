
DROP TABLE IF EXISTS `order_api_config`;
CREATE TABLE `order_api_config` (
  `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
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
  `support_invoice_overdue` varchar(128) NOT NULL  DEFAULT 'no' COMMENT 'no / license_renewal / overdue / license_expired / shutdown',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';

INSERT INTO order_api_config SET business_code='AAA1786', business_name='Al-amin Restaurant', order_api_domain='http://al-aminrestaurant.co.uk';
INSERT INTO order_api_config SET business_code='AAA1787', business_name='Indian Oceans', order_api_domain='http://indianoceanpurley.com';
INSERT INTO order_api_config SET business_code='AAA1788', business_name='Bithika Tandoori', order_api_domain='http://bithika.co.uk';
INSERT INTO order_api_config SET business_code='AAA1789', business_name='The Royals Restaurant', order_api_domain='http://theroyalsrestaurant.co.uk';
INSERT INTO order_api_config SET business_code='AAA1790';
INSERT INTO order_api_config SET business_code='AAA1791';
INSERT INTO order_api_config SET business_code='AAA1792';


DROP TABLE IF EXISTS `sites`;
CREATE TABLE `sites` (
  `id` INT(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `login_id` BIGINT(20) NOT NULL DEFAULT '1',
  `updated` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` TINYINT(4) NOT NULL DEFAULT '0',
  `business_code` VARCHAR(10) NOT NULL,
  `business_unique_name` VARCHAR(256) UNIQUE,
  `business_name` VARCHAR(256) NOT NULL DEFAULT 'New',
  `logo` TEXT NULL,
  `business_slogan` TEXT NULL,
  `web_url1` TEXT NULL,
  `web_url2` TEXT NULL,
  `web_url3` TEXT NULL,
  `menu_url` TEXT NULL,
  `contact_url` TEXT NULL,
  `email_billing` VARCHAR(512) NULL DEFAULT NULL,
  `email_manager` VARCHAR(512) NULL DEFAULT NULL,
  `email_headwaiter` VARCHAR(512) NULL DEFAULT NULL,
  `telephone1` VARCHAR(32) NOT NULL,
  `telephone2` VARCHAR(32) NULL DEFAULT NULL,
  `telephone3` VARCHAR(32) NULL DEFAULT NULL,
  `fax1` VARCHAR(32) NULL DEFAULT NULL,
  `fax2` VARCHAR(32) NULL DEFAULT NULL,
  `house_no` VARCHAR(32) NULL DEFAULT NULL,
  `address1` VARCHAR(256) NOT NULL,
  `address2` VARCHAR(256) NULL DEFAULT NULL,
  `town` VARCHAR(256) NULL DEFAULT NULL,
  `city` VARCHAR(256) NULL DEFAULT NULL,
  `county` VARCHAR(256) NULL DEFAULT NULL,
  `country` VARCHAR(256) NULL DEFAULT NULL,
  `postcode` VARCHAR(32) NULL DEFAULT NULL,
  `postcode_no_space` VARCHAR(32) NULL DEFAULT NULL,
  `address_note` TEXT NULL,
  `lat` VARCHAR(16) DEFAULT '51.507200001',
  `lng` VARCHAR(16) DEFAULT '0.1275000001',
  `map_zoom` int(2) DEFAULT '14',
  `vat_no` VARCHAR(32) NULL DEFAULT '-2',
  `established` VARCHAR(32) NULL DEFAULT '-2',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `business_code` (`business_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COMMENT='###';






--  Function To get the next order_code
delimiter //

DROP FUNCTION IF EXISTS GetUnID//

CREATE  FUNCTION `GetUnID`(`oldId` VARCHAR(10) )
  RETURNS varchar(10) CHARSET latin1 COLLATE latin1_general_ci
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
  SQL SECURITY DEFINER
  COMMENT ''
  BEGIN
    DECLARE charOldValue char(6);
    DECLARE iNumValue INT;
    DECLARE iCharValue char(3);
    DECLARE ch1stLetter char(1);
    DECLARE ch2ndLetter char(1);
    DECLARE ch3rdLetter char(1);


    Set iNumValue = CAST( SUBSTRING(oldId, 4, 4) AS SIGNED );
    Set iCharValue =  SUBSTRING(oldId, 1, 3);
    Set charOldValue = oldId ;

    SET iNumValue = iNumValue + 1;
    IF iNumValue > 9999 Then

      Set iNumValue = 0 ;
      Set ch1stLetter = SUBSTRING(iCharValue, 3, 1);
      Set ch2ndLetter = SUBSTRING(iCharValue, 2, 1);
      Set ch3rdLetter = SUBSTRING(iCharValue, 1, 1);

      IF ch1stLetter = 'Z' Then
        Set ch1stLetter = 'A';
        IF ch2ndLetter = 'Z' Then
          Set ch2ndLetter = 'A';
          Set ch3rdLetter = CHAR(ASCII(ch3rdLetter) + 1);
        ELSE Set ch2ndLetter = CHAR(ASCII(ch2ndLetter) + 1);
        END IF;
      ELSE Set ch1stLetter = CHAR(ASCII(ch1stLetter) + 1);
      END If;

      Set iCharValue = CONCAT(ch3rdLetter , ch2ndLetter, ch1stLetter);
    END IF;

    SET @ret = CONCAT (iCharValue , Right( CONCAT ('0000' , CAST(iNumValue AS char(4))),4) );
    RETURN @ret;

  END//

delimiter ;

-- Trigger to get next order Code and  and isert into orders_cwdp
delimiter //

DROP TRIGGER IF EXISTS trg_sites//

CREATE TRIGGER trg_sites BEFORE INSERT ON sites
FOR each ROW
  BEGIN

    DECLARE last_code char(10);
    SET last_code =  (SELECT business_code FROM sites ORDER BY id DESC LIMIT 0, 1);

    IF last_code IS NULL THEN
      SET NEW.business_code = 'AAA1786';
    ELSE
      SET NEW.business_code = GetUnID(last_code);
    END IF;
    INSERT INTO order_api_config (business_code) VALUES (NEW.business_code);

  END//

delimiter ;
# End of trigger






/*CREATE TABLE sites (
    id integer DEFAULT nextval('sites_id_seq'::regclass) NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1) DEFAULT 'N'::character varying,
    business_code character varying(7),
    business_name character varying(256) DEFAULT 'New'::character varying,
    logo text DEFAULT '#'::text,
    business_slogan text DEFAULT '#'::text,
    web_url1 text DEFAULT '#'::text,
    web_url2 text DEFAULT '#'::text,
    web_url3 text DEFAULT '#'::text,
    menu_url text DEFAULT '#'::text,
    contact_url text DEFAULT '#'::text,
    email_billing text DEFAULT '#'::text,
    email_manager text DEFAULT '#'::text,
    email_headwaiter text DEFAULT '#'::text,
    telephone1 character varying(32) DEFAULT '#'::character varying NOT NULL,
    telephone2 character varying(32) DEFAULT '#'::character varying,
    telephone3 character varying(32) DEFAULT '#'::character varying,
    fax1 character varying(32) DEFAULT '#'::character varying,
    fax2 character varying(32) DEFAULT '#'::character varying,
    house_number character varying(128) DEFAULT '#'::character varying,
    street1 text DEFAULT '#'::text,
    street2 text DEFAULT '#'::text,
    town character varying(128) DEFAULT '#'::character varying,
    city character varying(128) DEFAULT '#'::character varying,
    county character varying(128) DEFAULT '#'::character varying,
    country character varying(128) DEFAULT '#'::character varying,
    postcode character varying(16) DEFAULT '#'::character varying,
    postcode_no_space character varying(16) DEFAULT '#'::character varying,
    direction text DEFAULT '#'::text,
    vat_no character varying(16) DEFAULT '#'::character varying,
    established bigint DEFAULT (- (2)::bigint)
);
*/
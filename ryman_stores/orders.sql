
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

==================================================================
delimiter //

DROP TRIGGER IF EXISTS trg_order//

CREATE TRIGGER trg_order BEFORE INSERT ON orders
FOR each ROW
BEGIN

   DECLARE last_code char(10);
   SET last_code =  (SELECT order_code FROM orders ORDER BY id DESC LIMIT 0, 1);

    IF last_code IS NULL THEN
        SET NEW.order_code = 'AAA1786';
	INSERT INTO order_cwdp (order_code) VALUES ('AAA1786');
    ELSE
        SET NEW.order_code = GetUnID(last_code);
	INSERT INTO order_cwdp (order_code) VALUES (order_code);
    END IF;

END//

delimiter ;





################################################################################
DROP TABLE IF EXISTS `settings_paypal`;
CREATE TABLE IF NOT EXISTS `settings_paypal` (
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
  `action_type` varchar(32) DEFAULT 'integrated' ,
  `sandbox` tinyint(4) NOT NULL DEFAULT '0',
  `flat_fee` decimal(20,2) DEFAULT '0.20',
  `pay_after_transaction` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='### ' AUTO_INCREMENT=1 ;


DROP TABLE IF EXISTS `settings_cash`;
CREATE TABLE IF NOT EXISTS `settings_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='### ' AUTO_INCREMENT=1 ;

INSERT INTO `settings_paypal` (`id`, `login_id`, `updated`, `active`, `api_username`, `api_password`, `api_signature`, `test_api_username`, `test_api_password`, `test_api_signature`, `image`, `transaction_fee`, `commision`, `min_order_value`, `email_address`, `action_type`, `sandbox`, `flat_fee`, `pay_after_transaction`) VALUES
  (1, 230, '0000-00-00 00:00:00', 1, 'm82amjad_api1.hotmail.co.uk', 'W4W9MCXCZ9DL4938', 'AamyNj8hYYmtqQkScocIJA2nHc2KAphH9D-oD3aGUcOr8fR.riuDM75B', 'seller_1317255315_biz_api1.gmail.com', '1317255350', 'AFcWxV21C7fd0v3bYYYRCpSSRl31AsEXo1mfs5m9KpiElKsbTiQR9C2V', '#', 0.20, 3.40, 5.00, 'm82amjad@gmail.com', 'integrated', 0, -2.00, 0);


DROP TABLE IF EXISTS `settings_ecom`;
CREATE TABLE settings_ecom (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
    acquirer VARCHAR(128),
    pre_shared_key text,
    merchant_id VARCHAR(256),
    password VARCHAR(256),
    pre_shared_key_test text,
    merchant_id_test VARCHAR(256),
    password_test VARCHAR(256),
    order_description VARCHAR(256),
    transaction_type VARCHAR(256) DEFAULT 'SALE',
    fdms_mid VARCHAR(256),
    test_node  tinyint(4) NOT NULL DEFAULT '0',
    image text,
    credit_card_fee decimal(20,2) DEFAULT '0.20',
    debit_card_fee decimal(20,2) DEFAULT '2.20',
    flat_fee  decimal(20,2) DEFAULT '-2.00' COMMENT 'if -2, Apply Calculated Fee ',

    pay_after_transaction tinyint(4) NOT NULL DEFAULT '0',
    min_order_value decimal(20,2) DEFAULT '10.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='### ' AUTO_INCREMENT=1 ;

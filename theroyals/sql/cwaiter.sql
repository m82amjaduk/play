-- DROP TABLE IF EXISTS `prod_list`;
--
-- CREATE TABLE `prod_list` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL,
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL,
--   `sn` int(11) NOT NULL DEFAULT '1',
--   `title` varchar(256) NOT NULL DEFAULT 'New',
--   `short_name` varchar(128) DEFAULT '#',
--   `name_kitchen` varchar(128) DEFAULT '#',
--   `description` text,
--   `price` decimal(20,2) DEFAULT '0.00',
--   `prod_category_id` int(11) NOT NULL DEFAULT '1',
--   `vat` decimal(20,2) NOT NULL DEFAULT '-2',
--   `instruction` text,
--   `default_note` text,
--   `note_must` tinyint(4) NOT NULL DEFAULT '0',
--   `note_show` tinyint(4) DEFAULT '0',
--   `prod_code` varchar(32) DEFAULT '#',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;
--

--
-- DROP TABLE IF EXISTS `prod_category`;
--
-- CREATE TABLE `prod_category` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL,
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL,
--   `sn` int(11) NOT NULL DEFAULT '1',
--   `parent_category_id` int(11) NOT NULL DEFAULT '0',
--   `title` varchar(256) NOT NULL DEFAULT 'New',
--   `description` text,
--   `takeaway_sit_in` varchar(32) NOT NULL DEFAULT 'takeaway',
--   `image_src` text,
--   `image_href` text,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

-- DROP TABLE IF EXISTS `ci_sessions`;
-- CREATE TABLE `ci_sessions` (
--   `session_id` varchar(40) NOT NULL DEFAULT '0',
--   `ip_address` varchar(45) NOT NULL DEFAULT '0',
--   `user_agent` varchar(120) NOT NULL,
--   `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
--   `user_data` text NOT NULL,
--   PRIMARY KEY (`session_id`),
--   KEY `last_activity_idx` (`last_activity`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- DROP TABLE IF EXISTS `prod_meats`;
-- CREATE TABLE `prod_meats` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL,
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '0',
--   `sn` int(11) NOT NULL DEFAULT '1',
--   `title` varchar(256) NOT NULL DEFAULT 'New',
--   `short_name` varchar(128) NOT NULL DEFAULT '#',
--   `icon` text,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;



-- DROP TABLE IF EXISTS `prod_meat_price`;
-- CREATE TABLE `prod_meat_price` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL,
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '0',
--   `sn` int(11) NOT NULL DEFAULT '1',
--   `prod_list_id` int(11) NOT NULL,
--   `prod_meats_id` int(11) NOT NULL,
--   `price` decimal(20,2) DEFAULT '0.00',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

--
-- DROP VIEW IF EXISTS `prod_meat_view`;
-- CREATE VIEW prod_meat_view AS
--  SELECT
--  prod_meat_price.id AS price_id,
--  prod_meat_price.active AS price_active,
--  prod_meat_price.sn AS price_sn,
--  prod_meat_price.prod_list_id,
--  prod_meat_price.price,
--
--  prod_meats.id AS meats_id,
--  prod_meats.active AS meats_active,
--  prod_meats.title AS meats_title,
--  prod_meats.short_name,
--  prod_meats.icon,
--
--  prod_list.prod_category_id
--
--  FROM prod_meats
-- RIGHT JOIN prod_meat_price  ON prod_meat_price.prod_meats_id = prod_meats.id
-- RIGHT JOIN prod_list ON prod_list.id =  prod_meat_price.prod_list_id
-- ORDER BY  prod_meat_price.sn ASC;



-- DROP TABLE IF EXISTS `orders`;
-- CREATE TABLE `orders` (
--   `id` int(11) NOT NULL AUTO_INCREMENT UNIQUE ,
--   `login_id` bigint(20) NOT NULL,
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '1',
--   `order_code` varchar(7) NOT NULL,
--   `order_id_temp` varchar(32) NOT NULL UNIQUE DEFAULT 'AAA0000',
--   `user_code` varchar(7) NOT NULL DEFAULT 'AAA0000',
--   `fname` varchar(128),
--   `lname` varchar(128),
--   `email` text ,
--   `phone` varchar(16) ,
--   `house` varchar(16) ,
--   `address1` varchar(256) ,
--   `address2` varchar(256) ,
--   `town` varchar(256) ,
--   `city` varchar(256) ,
--   `county` varchar(256) ,
--   `postcode` varchar(256) ,
--   `address_direction` text,
--   `requested_time` bigint(20) NOT NULL,
--   `receiving` varchar(10) NOT NULL DEFAULT 'delivery',
--   `discount_code` varchar(128) ,
--   `pay_method` varchar(128) ,
--   `pay_status` varchar(128) ,
--   `items` text,
--   `note` text,
--   `bag_total` decimal(20,2) DEFAULT '0.00',
--   `delivery_charge` decimal(20,2) DEFAULT '0.00',
--   `transaction_fee` decimal(20,2) DEFAULT '0.00',
--   `base_payable` decimal(20,2) DEFAULT '0.00',
--   `vat_value` decimal(20,2) DEFAULT '0.00',
--   `discount_price` decimal(20,2) DEFAULT '0.00',
--   `checkout_price` decimal(20,2) DEFAULT '0.00',
--   `club_point` bigint(20) NOT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


--  Function GetUnID  To get the next order_code
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
-- End of GetUnID

-- Trigger to get next order Code and  and isert into orders_cwdp
delimiter //

DROP TRIGGER IF EXISTS trg_order//

CREATE TRIGGER trg_order BEFORE INSERT ON orders
FOR each ROW
  BEGIN

    DECLARE last_code char(10);
    SET last_code =  (SELECT order_code FROM orders ORDER BY id DESC LIMIT 0, 1);

    IF last_code IS NULL THEN
      SET NEW.order_code = 'AAA1786';
      INSERT INTO orders_cwdp (order_code) VALUES ('AAA1786');
    ELSE
      SET NEW.order_code = GetUnID(last_code);
      INSERT INTO orders_cwdp (order_code) VALUES (NEW.order_code);
    END IF;

  END//

    delimiter ;
--  End of trigger


-- DROP TABLE IF EXISTS `orders_cwdp`;
-- CREATE TABLE `orders_cwdp` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL DEFAULT '1',
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '1',
--   `order_code` varchar(7) NOT NULL UNIQUE ,
--   `printed` tinyint(4) NOT NULL DEFAULT '0',
--   `print_time` bigint(20),
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;


-- DROP TABLE IF EXISTS `pay_cash`;
-- CREATE TABLE IF NOT EXISTS `pay_cash` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL DEFAULT '1',
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '0',
--   `min_order_value` decimal(20,2) DEFAULT '10.00',
--   `captcha` tinyint(4) NOT NULL DEFAULT '0',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='###Not updateable with form. Has to update via software / db process' AUTO_INCREMENT=1 ;



-- DROP TABLE IF EXISTS `pay_card`;
-- CREATE TABLE pay_card (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `login_id` bigint(20) NOT NULL DEFAULT '1',
--   `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   `active` tinyint(4) NOT NULL DEFAULT '0',
--   acquirer VARCHAR(128),
--   pre_shared_key text,
--   merchant_id VARCHAR(256),
--   password VARCHAR(256),
--   pre_shared_key_test text,
--   merchant_id_test VARCHAR(256),
--   password_test VARCHAR(256),
--   order_description VARCHAR(256),
--   transaction_type VARCHAR(256) DEFAULT 'SALE',
--   fdms_mid VARCHAR(256),
--   test_node  tinyint(4) NOT NULL DEFAULT '0',
--   image text,
--   credit_card_fee decimal(20,2) DEFAULT '0.20',
--   debit_card_fee decimal(20,2) DEFAULT '2.20',
--   flat_fee  decimal(20,2) DEFAULT '-2.00' COMMENT 'if -2, Apply Calculated Fee ',
--   pay_after_transaction tinyint(4) NOT NULL DEFAULT '0',
--   min_order_value decimal(20,2) DEFAULT '10.00',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='### ' AUTO_INCREMENT=1 ;



--  CREATE VIEW prd_meats AS
--     SELECT product_meat_join.id AS product_meat_join_id, product_meat_join.sn, product_meat_join.product_id, product_meat_join.product_meats_id, product_meat_join.price, product_meat_join.active, product_meats.name AS meat_name, product_meats.short_name AS meat_short_name, product_meats.icon, product_meats.active AS meat_active, products.product_category_id, products.name AS product_name, products.price AS product_price FROM ((product_meat_join LEFT JOIN product_meats ON (((product_meat_join.product_meats_id)::text = (product_meats.id)::text))) LEFT JOIN products ON (((product_meat_join.product_id)::text = (products.id)::text)));

-- LOCK TABLES `ci_sessions` WRITE;
-- INSERT INTO `ci_sessions`
-- VALUES ('495c546165941aa0999686670c5f2fd6','127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0',1397839582,''),
-- ('7eacd9623de64b2e84f4aaafcba93a1c','127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36',1397839383,'a:2:{s:9:\"user_data\";s:0:\"\";s:9:\"foodArray\";a:2:{i:0;a:5:{s:8:\"quantity\";i:5;s:10:\"product_id\";s:1:\"2\";s:5:\"title\";s:6:\"Samosa\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"8.95\";}i:1;a:5:{s:8:\"quantity\";i:1;s:10:\"product_id\";s:1:\"3\";s:5:\"title\";s:13:\"Chicken Tikka\";s:4:\"note\";s:0:\"\";s:5:\"price\";s:4:\"7.95\";}}}'),
-- ('b792d946e5a7e76f6a1da146ac2a3b3f','127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0',1397841894,''),('c17d0551ffbc9204df0650862df95941','127.0.0.1','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0',1397839582,'');
-- UNLOCK TABLES;

-- ## Default Data ........................


LOCK TABLES `prod_list` WRITE;
INSERT INTO `prod_list`
  VALUES (1,1,'2014-04-13 01:24:57',1,1,'Onion Bhaji','#','#','ddwsw',7.95,2,-0.99,'fsdf','dfsd',0,0,'#'),
  (2,1,'2014-04-13 00:24:57',1,1,'Samosa','#','#','ddwsw',8.95,2,-0.99,'fsdf','dfsd',0,0,'#'),
  (3,1,'2014-04-13 00:24:57',1,1,'Chicken Tikka','#','#','ddwsw',7.95,2,-0.99,'fsdf','dfsd',0,0,'#'),
  (4,1,'2014-04-13 00:24:57',1,1,'Lamb Tikka','#','#','ddwsw',8.95,2,-0.99,'fsdf','dfsd',0,0,'#'),
  (5,1,'2014-04-13 00:24:57',1,1,'Chicken Tikka','#','#','ddwsw',7.95,3,-0.99,'fsdf','dfsd',0,0,'#'),
  (6,1,'2014-04-13 00:24:57',1,1,'Chicken Shashlik','#','#','ddwsw',8.95,3,-0.99,'fsdf','dfsd',0,0,'#'),
  (7,1,'2014-04-13 00:24:57',1,1,'Tandoori Chicken','#','#','ddwsw',7.95,3,-0.99,'fsdf','dfsd',0,0,'#'),
  (8,1,'2014-04-13 00:24:57',1,1,'Tandoori King Prawn','#','#','ddwsw',8.95,3,-0.99,'fsdf','dfsd',0,0,'#'),
  (9,1,'2014-04-13 00:24:57',1,1,'Tava Chicken','#','#','ddwsw',7.95,4,-0.99,'fsdf','dfsd',0,0,'#'),
  (10,1,'2014-04-13 00:24:57',1,1,'Karahi Chicken','#','#','ddwsw',8.95,4,-0.99,'fsdf','dfsd',0,0,'#'),
  (11,1,'2014-04-13 00:24:57',1,1,'Chicken Jalfrezi','#','#','ddwsw',7.95,4,-0.99,'fsdf','dfsd',0,0,'#'),
  (12,1,'2014-04-13 00:24:57',1,1,'King Prawn Jalfrezi','#','#','ddwsw',8.95,4,-0.99,'fsdf','dfsd',0,0,'#'),
  (13,1,'2014-04-13 00:24:57',1,1,'Chicken Tikka Pathia','#','#','ddwsw',7.95,5,-0.99,'fsdf','dfsd',0,0,'#'),
  (14,1,'2014-04-13 00:24:57',1,1,'Chicken Tikka Bhuna','#','#','ddwsw',8.95,5,-0.99,'fsdf','dfsd',0,0,'#'),
  (15,1,'2014-04-13 00:24:57',1,1,'Chicken Rogan Josh','#','#','ddwsw',7.95,5,-0.99,'fsdf','dfsd',0,0,'#'),
  (16,1,'2014-04-13 00:24:57',1,1,'Chicken & Mushroom Curry','#','#','ddwsw',8.95,5,-0.99,'fsdf','dfsd',0,0,'#'),
  (17,1,'2014-04-13 00:24:57',1,1,'Sheek Kebab','#','#','ddwsw',7.95,2,-0.99,'fsdf','dfsd',0,0,'#'),
  (18,1,'2014-04-13 00:24:57',1,1,'Tandoori Chicken 1/4','#','#','ddwsw',2.99,2,-0.99,'fsdf','dfsd',0,0,'#');
# UPDATE prod_list SET description="Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, and served in a masala (spice mix) sauce.[2] A tomato and coriander sauce is common, but there is no standard recipe for chicken tikka masala; a survey found that of 48 different recipes, the only common ingredient was chicken[citation needed]. The sauce usually includes tomatoes, frequently as puree";
  UPDATE prod_list SET description="Chicken tikka masala is chicken tikka, chunks of chicken marinated in spices and yogurt, that is then baked in a tandoor oven, " ; -- WHERE id =2;
UNLOCK TABLES;

LOCK TABLES `prod_category` WRITE;
INSERT INTO `prod_category`
  VALUES (1,1,'2014-04-13 10:21:36',1,1,0, 'Takeaway Menu','All starter served with salad, mint sauce and a plain naan.','takeaway','http://neilhennessyvass.com/wp-content/uploads/2013/07/Potato-pre-starter.jpg',NULL),
  (2,1,'2014-04-13 10:21:36',1,1,1, 'Starter','All starter served with salad, mint sauce and a plain naan.','takeaway','http://neilhennessyvass.com/wp-content/uploads/2013/07/Potato-pre-starter.jpg',NULL),
  (3,1,'2014-04-13 10:21:36',1,1,1,'Tandoori Dishes','All tandoori dishes served with salad, mint sauce and a plain naan.','takeaway','http://neilhennessyvass.com/wp-content/uploads/2013/07/Potato-pre-starter.jpg',NULL),
  (4,1,'2014-04-13 10:21:36',1,1,1,'Chef Special Dishes','All tandoori dishes served with salad, mint sauce and a plain naan.','takeaway','http://neilhennessyvass.com/wp-content/uploads/2013/07/Potato-pre-starter.jpg',NULL),
  (5,1,'2014-04-13 10:21:36',1,1,1,'Traditional Dishes','All tandoori dishes served with salad, mint sauce and a plain naan.','takeaway','http://neilhennessyvass.com/wp-content/uploads/2013/07/Potato-pre-starter.jpg',NULL);
UNLOCK TABLES;

LOCK TABLES `prod_meats` WRITE;
INSERT INTO `prod_meats`
  VALUES (1,1,'2014-04-19 13:14:22',1,1,'Chicken','CH',NULL),
  (2,1,'2014-04-19 13:14:22',1,2,'Lamb','LM',NULL),
  (3,1,'2014-04-19 13:14:22',1,3,'Veg','VG',NULL),
  (4,1,'2014-04-19 13:14:22',1,4,'Prwan','PR',NULL),
  (5,1,'2014-04-19 13:14:22',1,5,'King Prwan','KP',NULL),
  (6,1,'2014-04-19 13:14:22',1,6,'King Prwan Tikka','KP',NULL),
  (7,1,'2014-04-19 13:14:22',1,7,'Chicken Tikka','KP',NULL),
  (8,1,'2014-04-19 13:14:22',1,8,'Lamb Tikka','KP',NULL) ;
UNLOCK TABLES;


LOCK TABLES `prod_meat_price` WRITE;
INSERT INTO `prod_meat_price`
    VALUES (1,1,'2014-04-19 13:30:20',1,1,1,2,3.00),
    (2,1,'2014-04-19 13:30:20',1,1,1,1,4.00),
    (3,1,'2014-04-19 13:30:20',1,1,1,3,5.00),
    (4,1,'2014-04-19 13:30:20',1,1,2,4,1.00),
    (5,1,'2014-04-19 13:30:20',1,1,2,5,3.00),
    (6,1,'2014-04-19 13:30:20',1,1,1,6,6.00),
    (7,1,'2014-04-19 13:30:20',1,1,1,7,7.00),
    (8,1,'2014-04-19 13:30:20',1,1,1,8,3.00);
UNLOCK TABLES;


--   Settings Data #############################################


INSERT INTO `pay_cash` (`id`, `login_id`, `updated`, `active`, `min_order_value`, `captcha`) VALUES (1, 1, '2014-07-04 10:06:58', 1, '10.00', 1 );
INSERT INTO `pay_card` (`id`, `login_id`, `updated`, `active`, `acquirer`, `pre_shared_key`, `merchant_id`, `password`, `pre_shared_key_test`, `merchant_id_test`, `password_test`, `order_description`, `transaction_type`, `fdms_mid`, `test_node`, `image`, `credit_card_fee`, `debit_card_fee`, `flat_fee`, `pay_after_transaction`, `min_order_value`) VALUES
  (1, 1, '2014-07-04 10:52:17', 1, 'payment_sense', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'SALE', 'test', 0, 'img', '0.20', '2.20', '-2.00', 0, '10.00');

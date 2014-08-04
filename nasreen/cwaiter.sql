
DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errno` int(2) NOT NULL,
  `errtype` varchar(32) NOT NULL,
  `errstr` text NOT NULL,
  `errfile` varchar(255) NOT NULL,
  `errline` int(4) NOT NULL,
  `user_agent` varchar(120) NOT NULL,
  `ip_address` varchar(45) DEFAULT '0' NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`, `ip_address`, `user_agent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `map_lat_lng`;
CREATE TABLE `map_lat_lng` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `search_key`  varchar(32) NOT NULL,
  `search_key_no_space`  varchar(32) NOT NULL,
  `lat`  varchar(32) NOT NULL,
  `lng`  varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###Not updateable with form. Has to update via software / db process';


DROP TABLE IF EXISTS `cms_email_config`;
CREATE TABLE `cms_email_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `email_from`  varchar(256) NOT NULL,
  `smtp_user`  varchar(256) NOT NULL,
  `smtp_password`  varchar(256) NOT NULL,
  `smtp_host`  varchar(256) NOT NULL,
  `smtp_port`  varchar(256) NOT NULL,
  `protocol`  varchar(256) NOT NULL,
  `mailtype`  varchar(256) NOT NULL,
  `send_from`  varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';


DROP TABLE IF EXISTS `cms_email_template`;
CREATE TABLE `cms_email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `alias`  varchar(256) NOT NULL,
  `body`  varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';


DROP TABLE IF EXISTS `rest_reservations`;
CREATE TABLE `rest_reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `user_code`  varchar(10),
  `fnames`  varchar(256) NOT NULL,
  `lname`  varchar(256) NOT NULL,
  `email`  varchar(256) NOT NULL,
  `phone`  varchar(256) NOT NULL,
  `cover`  varchar(256) NOT NULL,
  `reservation_time`  bigint(20) NOT NULL DEFAULT '1',
  `note`  text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';


DROP TABLE IF EXISTS `rest_reservations_confirm`;
CREATE TABLE `rest_reservations_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `rest_reservations_id`   bigint(20) NOT NULL ,
  `confirmation_sent` tinyint(4) NOT NULL DEFAULT '0',
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `arrived` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';


DROP TABLE IF EXISTS `users_address`;
CREATE TABLE `rest_reservations_confirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `users_id`   bigint(20) NOT NULL ,
  `user_code`  varchar(32) NOT NULL,
  `address1`  varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';




-----------------------------------------------------------------------

CREATE TABLE offer_time_validity (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    sn integer,
    offer_id integer DEFAULT (-2),
    day character varying(16) DEFAULT 'mon'::character varying,
    time_from bigint DEFAULT (- (2)::bigint),
    time_to bigint DEFAULT (- (2)::bigint)
);



CREATE TABLE offers (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1) DEFAULT 'N'::character varying,
    sn integer,
    offer_code character varying(128) NOT NULL,
    title character varying(256) DEFAULT 'New'::character varying,
    start_date bigint,
    end_date bigint,
    user_message text,
    description text,
    email_template text,
    min_value double precision DEFAULT (10)::double precision,
    cw_discount double precision DEFAULT (0)::double precision,
    store_discount double precision DEFAULT (0)::double precision,
    cw_discount_amount double precision DEFAULT (0)::double precision,
    store_discount_amount double precision DEFAULT (0)::double precision,
    receiving character varying(32) DEFAULT 'collection_delivery'::character varying,
    code_require character varying(1) DEFAULT 'Y'::character varying,
    maximum_use integer DEFAULT 1,
    time_check character varying(1) DEFAULT 'N'::character varying,
    user_check character varying(1) DEFAULT 'N'::character varying,
    product_check character varying(1) DEFAULT 'N'::character varying
);


CREATE TABLE offers_product (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    offer_id integer,
    product_id integer
);

CREATE TABLE offers_user (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    offer_id integer,
    user_code character varying(7)
);



----------------------------------------------

CREATE TABLE social_facebook (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    like_ text,
    url text,
    share text,
    application_id text,
    access_token text,
    page_id text,
    note text
);


CREATE TABLE social_google (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    url text,
    note text
);




CREATE TABLE social_href (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1) DEFAULT 'N'::character varying,
    sn integer DEFAULT 1,
    name character varying(256) DEFAULT 'New'::character varying,
    icon text,
    logo text,
    url text
);



CREATE TABLE social_takeawayguru (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    url text,
    note text
);


CREATE TABLE social_tripadvisor (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    url text,
    note text
);



CREATE TABLE social_twitter (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    url text,
    user_name character varying(256),
    note text
);


CREATE TABLE social_youtube (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    url text,
    note text
);


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



DROP TABLE IF EXISTS `prod_options`;
CREATE TABLE `prod_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `name_option`  varchar NOT NULL DEFAULT 'New',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='###';


DROP TABLE IF EXISTS `prod_options_price`;
CREATE TABLE `prod_options_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn`   bigint(20) NOT NULL ,
  `group_no`   bigint(20) NOT NULL ,
  `prod_id` bigint(20) NOT NULL ,
  `prod_options_id`   bigint(20) NOT NULL ,
  `price`   bigint(20) NOT NULL ,
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

CREATE TABLE services_collection (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    available character varying(1),
    current_waiting_time bigint,
    opening_hours text,
    maximum_cover_cash integer DEFAULT 15,
    mini_order_value double precision,
    start_after bigint DEFAULT (0)::bigint,
    end_before bigint DEFAULT (0)::bigint
);


CREATE TABLE services_delivery (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    available character varying(1),
    maximum_cover integer DEFAULT 10,
    current_waiting_time bigint,
    free_area integer DEFAULT 3,
    mini_order_value double precision,
    default_charge double precision,
    covered_post_codes text,
    opening_hours text,
    post_code_lookup character varying(1) DEFAULT 'N'::character varying,
    start_after bigint DEFAULT (0)::bigint,
    end_before bigint DEFAULT (0)::bigint
);


CREATE TABLE services_sit_in (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    available character varying(1),
    max_sit integer DEFAULT 1,
    licensed character varying(1),
    air_condition character varying(1),
    wheel_chair character varying(1),
    disable_toilet character varying(1),
    booking_accepted character varying(1),
    opening_hours text,
    admin character varying(32) DEFAULT 'N'::character varying,
    reservation_page_template character varying(256) DEFAULT 'base/reservation01'::character varying,
    menu_page_template character varying(256) DEFAULT 'base/menu_sit_in01'::character varying,
    start_after bigint DEFAULT (0)::bigint,
    end_before bigint DEFAULT (0)::bigint
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


----------------------------------------------------
CREATE TABLE settings_system (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    doctype text,
    head_title text,
    meta_description text,
    meta_key text,
    favicon text,
    head_others text,
    copy_right text,
    copy_right_url text,
    currency_code character varying(32) DEFAULT '826'::character varying,
    currency_symbol character varying(32) DEFAULT '&pound;'::character varying,
    time_zone character varying(32) DEFAULT '0'::character varying,
    summer_time character varying(32) DEFAULT 'BST'::character varying,
    site_live character varying(1) DEFAULT 'N'::character varying,
    maintenance_note text DEFAULT 'This Site is currently underconstruction.'::text,
    default_load character varying(256) DEFAULT 'base/welcome'::character varying,
    default_load_login character varying(256) DEFAULT 'base/menu/1/1'::character varying
);



CREATE TABLE cms_blog (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1) DEFAULT 'Y'::character varying,
    sn integer,
    name character varying(128) DEFAULT 'New'::character varying,
    description text DEFAULT '#'::text,
    image_src text,
    image_href text,
    thumb_src text,
    button text DEFAULT '#'::text,
    button_href text DEFAULT '#'::text,
    page_template character varying(256) DEFAULT 'base/details01'::character varying
);

CREATE TABLE cms_blog_note (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1) DEFAULT 'Y'::character varying,
    sn integer,
    blog_id integer,
    title character varying(128) DEFAULT 'New'::character varying,
    description text DEFAULT '#'::text
);



CREATE TABLE cms_gallery (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    sn integer,
    alias character varying(256),
    name text,
    message text,
    folder_href text,
    page_template character varying(256) DEFAULT 'base/gallery01'::character varying
);



CREATE TABLE cms_gallery_images (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    sn integer,
    cms_gallery_id integer,
    image_src text,
    image_href text,
    thumb_src text,
    thumb_href text,
    title text,
    title2 text,
    title3 text,
    message text,
    button text,
    button_href text
);


CREATE TABLE cms_menu (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    sn integer,
    alias character varying(256),
    menu_name text NOT NULL,
    title text
);


CREATE TABLE cms_menu_url (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    sn integer,
    parent integer NOT NULL,
    name text NOT NULL,
    cms_menu_id integer NOT NULL,
    cms_article_id integer,
    href text,
    image_src text
);



CREATE TABLE cms_slider (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    sn integer,
    alias character varying(256),
    slider_name text NOT NULL,
    title text
);



CREATE TABLE cms_slider_content (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    sn integer,
    cms_slider_id integer,
    alias character varying(256),
    title text,
    title2 text,
    title3 text,
    message text,
    image_src text,
    image_href text,
    thumb_src text,
    thumb_href text,
    button text,
    button_href text
);


CREATE TABLE device_cwdp (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    show_menucode character varying(1) DEFAULT 'Y'::character varying,
    save_log character varying(1) DEFAULT 'N'::character varying
);



CREATE TABLE device_cwhd (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    send_data character varying(1) DEFAULT 'Y'::character varying,
    save_log character varying(1) DEFAULT 'N'::character varying,
    order_support character varying(1) DEFAULT 'N'::character varying
);



CREATE TABLE device_fax (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    fax_number character varying(15),
    domain text
);



CREATE TABLE device_sms_gateway (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    gateway_url text,
    gateway_password text,
    mobile_order_client character varying(15),
    critical_mobile_client character varying(15),
    order_confirm_customer character varying(1),
    order_accepted_customer character varying(1),
    order_ready_customer character varying(1),
    order_nearby_customer character varying(1),
    booking_confirmed_customer character varying(1),
    order_notification_client character varying(1) DEFAULT 'N'::character varying
);



CREATE TABLE device_sms_printer (
    id integer NOT NULL,
    loggin_id bigint DEFAULT (- (2)::bigint),
    "time" bigint DEFAULT (- (2)::bigint),
    active character varying(1),
    mobile_number character varying(15),
    iemi character varying(32),
    send_sms character varying(1),
    save_log character varying(1),
    printer_txt character varying(1) DEFAULT 'N'::character varying
);


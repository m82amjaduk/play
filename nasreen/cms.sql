
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

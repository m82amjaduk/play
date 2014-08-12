
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


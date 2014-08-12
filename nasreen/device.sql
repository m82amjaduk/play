



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

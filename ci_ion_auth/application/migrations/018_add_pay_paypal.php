<?php  defined('BASEPATH') OR exit('No direct script access allowed');

class Migration_Add_pay_paypal extends CI_Migration {

    public function up()
    {
        // Create prod_options ...
        $this->db->query(
            "CREATE TABLE IF NOT EXISTS  `pay_paypal` (
              `id` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT  UNIQUE,
              `login_id` bigint(20) NOT NULL DEFAULT '1',
              `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
              `active` tinyint(1) NOT NULL DEFAULT '0',
              `sandbox` tinyint(1) NOT NULL DEFAULT '1',
              `transaction_fee` decimal(20,2) DEFAULT '0.20',
              `commision` decimal(20,2) DEFAULT '3.20',
              `min_order_value` decimal(20,2) DEFAULT '10.00',
              `flat_fee` decimal(20,2) DEFAULT '0.20',
              `pay_after_transaction` tinyint(1) NOT NULL DEFAULT '0',
              `email_address` varchar(512) DEFAULT 'paypal@allinepos.co.uk',
              `image` text,
              `site_logo` varchar(1024) DEFAULT  'http://al-aminrestaurant.co.uk/img/menu/logo/logoPaypal.png',
              `cart_border_color` varchar(256) DEFAULT  '000000',
              `completed_message` VARCHAR(1024) NOT NULL DEFAULT 'Payment Received! Your product will be sent to you very soon!',
              `pending_message` text ,
              `currency_code` varchar(256) DEFAULT  'GBP',
              `cache_config_data` tinyint(1) NOT NULL DEFAULT '1',
              `log_active` tinyint(1) NOT NULL DEFAULT '0',
              `log_dir`  VARCHAR(512) DEFAULT 'var/log',
              `log_transaction` VARCHAR(512) DEFAULT 'paypal.log',
              `log_exception` VARCHAR(512) DEFAULT 'exception.log',
              `log_query_string_active` tinyint(1) NOT NULL DEFAULT '0',
              `log_http_response_active` tinyint(1) NOT NULL DEFAULT '0',
              `log_http_response_file` VARCHAR(512) NOT NULL DEFAULT 'paypal_http_response.log',
              `api_username` VARCHAR(512) NOT NULL DEFAULT 'm82amjad_api1.hotmail.co.uk',
              `api_password` VARCHAR(512) NOT NULL DEFAULT 'W4W9MCXCZ9DL4938',
              `api_signature`  VARCHAR(512) NOT NULL DEFAULT 'AamyNj8hYYmtqQkScocIJA2nHc2KAphH9D-oD3aGUcOr8fR.riuDM75B',
              `api_username_sandbox`  VARCHAR(512) NOT NULL DEFAULT 'seller_1317255315_biz_api1.gmail.com',
              `api_password_sandbox`  VARCHAR(512) NOT NULL DEFAULT '1317255350',
              `api_signature_sandbox`  VARCHAR(512) NOT NULL DEFAULT 'AFcWxV21C7fd0v3bYYYRCpSSRl31AsEXo1mfs5m9KpiElKsbTiQR9C2V',
              `action_type` varchar(32) DEFAULT 'integrated' COMMENT 'paynow/integrated/payment_pro',
              `url_index_redirec` VARCHAR(512) DEFAULT 'takeaway/confirm',
              `url_success` varchar(512) DEFAULT 'takeaway/process_order',
              `url_pending` varchar(512) DEFAULT  'takeaway/process_order',
              `url_return` varchar(256) DEFAULT  'paypal/process',
              `url_cancel` varchar(256) DEFAULT  'takeaway/order_details',
              PRIMARY KEY (`id`)
            ) ENGINE=InnoDB AUTO_INCREMENT=1 COLLATE='latin1_swedish_ci' COMMENT='###';"
        );

        // Insert Data  prod_options ...
        $data = array(
            array(
                'pending_message' => "Transaction Complete. But payment is still pending! <br /> You need to manually authorize this payment in your <a href='http://www.paypal.com'>Paypal Account</a>"
            )
        );
        $this->db->insert_batch('pay_paypal', $data);


        ########################################  DB Version Note ...
        $data = array(
            array(
                'version_no'    => substr(basename(__FILE__), 0, 3),
                'date_created'  => '2014-08-25 14:31:06',
                'release_note_eng'  => 'ADDED TABLE:: pay_paypal',
                'release_note_adm'  => "First Release",
                'migration_by'      => '1',
                'migration_ip'      => $_SERVER['REMOTE_ADDR']
            )
        );
        $this->db->insert_batch('migrations_db_versions', $data);
    }

    public function down()
    {
//        $versionNo = substr(basename(__FILE__), 0, 3);
//        $this->db->query("DELETE FROM migrations_db_versions WHERE version_no='$versionNo'");

        $this->dbforge->drop_table('pay_paypal');
    }
}

<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

$config['rootDir']      = 'test';
$config['incDirMenu']   = $inc = base_url().'menu/';
$config['cssMenu']      = $inc.'/css';
$config['imgDirSysMenu'] = $inc.'images/system/';



$config['day']      = 86400;
$config['week']     = 604800;
$config['month']    = 86400;

# Folders
$config['folderMust']['var']        = array( '/var', 0775);
$config['folderMust']['cache']        = array( '/var/cache', 0775);
$config['folderMust']['cacheCustom']  = array( '/var/cache/custom', 0600);
$config['folderMust']['cacheDB']      = array( '/var/cache/db', 0600);
$config['folderMust']['cacheHTML']    = array( '/var/cache/html', 0600);
$config['folderMust']['img']          = array( '/img', 0755);
$config['folderMust']['upload']       = array( '/var/upload', 0755);



## Menu
$config['menuViewDir']  = 'menu/';
$config['menuMainPage'] = $config['menuViewDir'].'main';
$config['menuResource'] = base_url().'resources/menu/';
$config['menuCSS']      = $config['menuResource'].'css/';
$config['menuJS']       = $config['menuResource'].'js/';
$config['menuIMG']      = $config['menuResource'].'images/';

## Site
$config['aboutViewDir']  = 'about01/';
$config['aboutMainPage'] = $config['aboutViewDir'].'main';
$config['aboutResource'] = $config['aboutViewDir'].'resource/';
$config['aboutCSS']      = $config['aboutResource'].'css/';
$config['aboutJS']       = $config['aboutResource'].'js/';
$config['aboutIMG']      = $config['aboutResource'].'images/';


## Admin
$config['adminViewDir']  = 'admin/';
$config['adminMainPage'] = $config['adminViewDir'].'main';
$config['adminResource'] = $config['adminViewDir'].'resource/';
$config['adminCSS']      = $config['adminResource'].'css/';
$config['adminJS']       = $config['adminResource'].'js/';
$config['adminImages']   = $config['adminResource'].'images/';



/*
## User Info
$config['userInfo']   = array(
    'userCode',
    'loginId',
    'discount',
    'payMethod',
    'day',
    'time',
    'orderNote',
    'email',
    'fname',
    'lname',
    'phone',
    'receiving',
    'items',
    'transactionFee',
    'discount',

    'houseNo',
    'postcode',
    'address1',
    'address2',
    'town',
    'city',
    'county',
    'addressInstruction',
    'deliveryCharge',

    'order_id_temp',
    'errorUser'
);
*/
## transaction  Info
$config['transactionInfo']   = array(
    'transactionID',
    'transactionMessage',
    'transactionStatus',
    'ACK',
    'token',
    'payerID',
    'GrandTotal',
    'ShippinCost',
    'ShippinDiscount',
    'InsuranceCost',
    'HandalingCost',
    'TotalTaxAmount',
    'ItemTotalPrice'
);


## User Info Must Fileds
$config['collectionMustFileds']   = array(
    'payMethod' => "PAYMENT METHOD cannot be empty <br />",
    'day' => "DAY cannot be empty <br/>",
    'time' => "TIME  cannot be empty <br/>",
    'fname' => "FIRST NAME Cannot be empty <br />",
    'lname' => "LAST NAME Cannot be empty <br />",
    'phone' => "PHONE Cannot be empty <br />",
    'receiving' => "FIRST NAME Cannot be empty <br />"
);

## User Info Must Fileds
$config['addressMustFileds']   = array(
    'houseNo' => "HOUSE NO Cannot be empty <br />",
    'postcode' => "POSTCODE Cannot be empty <br />",
    'address1' => "ADDRESS LINE 1 Cannot be empty <br />",
    'town' => "TOWN Cannot be empty <br />",
);








?>
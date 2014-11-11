<?php
/**
 * Created by PhpStorm.
 * User: amojumder
 * Date: 24/09/2014
 * Time: 12:34
 */



// 5073717
// 5360591
// 5029232
// 5090562

//192.168.140.119 uat-webservices

//ini_set('display_errors', 1);
//ini_set('memory_limit', '512M');
ini_set('error_log','errorPhp.log');
//Mage::setIsDeveloperMode(true);


$xml = "<post>
  <requesttype>200</requesttype>
  <requestdescription>Unknown type</requestdescription>
  <currentuser>steven.galvin</currentuser>
  <terminalid>MO1</terminalid>
  <branchid>5600</branchid>
  <data>
	<customerno>5090562</customerno>
  </data>
</post>";
$xmlLine = "<body><post> <requesttype>200</requesttype> <requestdescription>Unknown type</requestdescription> <currentuser>steven.galvin</currentuser> <terminalid>MO1</terminalid> <branchid>5600</branchid> <data> <customerno>5090562</customerno> </data> </post> </body>";



//    $server = 'http://uat-webservices:8123/?wsdl';
$api_url_v1 = 'http://uat-webservices.bouxavenue.lan:8124/?wsdl';
$returnString = array();


############################################################# URL
//  http://inchoo.net/magento/magento-v2-soap-demystified/


//$api_url_v1 = "http://magento.local/api/soap/?wsdl=1";

//$username = 'mobile';
//$password = 'mobile123';

$proxy= new SoapClient($api_url_v1);

//retreive session id from login
//$session_id = $cli->login($username, $password);

//call customer.list method
//$result = $cli->call($session_id, 'customer.list', array(array()));


$result = $proxy->ReturnNavDataAsXml($xmlLine, $returnString );
echo '<pre>'; print_r($result); echo '</pre>';

























/*<post>
  <requesttype>200</requesttype>
  <requestdescription>Unknown type</requestdescription>
  <currentuser>steven.galvin</currentuser>
  <terminalid>MO1</terminalid>
  <branchid>5600</branchid>
  <data>
	<customerno>5090562</customerno>
  </data>
</post>*/

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
$xmlLine = "<post> <requesttype>200</requesttype> <requestdescription>Unknown type</requestdescription> <currentuser>steven.galvin</currentuser> <terminalid>MO1</terminalid> <branchid>5600</branchid> <data> <customerno>5090562</customerno> </data> </post>";



//    $server = 'http://uat-webservices:8123/?wsdl';
$api_url_v1 = 'http://uat-webservices.bouxavenue.lan:8124/?wsdl';
echo $api_url_v1;
echo '<pre>'.$xmlLine;


$proxy= new SoapClient($api_url_v1);


$result = $proxy->ReturnNavDataAsXml($xmlLine );
echo '<pre>'; print_r($result); echo '</pre>';


$client = new SoapClient($api_url_v1);
//var_dump($client->__getFunctions());
//var_dump($client->__getTypes());
echo '<pre>'; print_r($client->__getFunctions()); echo '</pre>';


$response = $client->__soapCall("ReturnNavDataAsXml", array($xmlLine));

echo '<pre>'; print_r($response); echo '</pre>';


echo  '<br /> $proxy->ReturnNavDataAsXml($xmlLine )->ReturnNavDataAsXmlResult '. $proxy->ReturnNavDataAsXml($xmlLine )->ReturnNavDataAsXmlResult;

echo '<br /> $client->__getLastRequest()';
$proxy->ReturnNavDataAsXml($xmlLine );
echo "<p>Response :".htmlspecialchars($client->__getLastResponse()) ."</p>";
echo "<p>Request  :".htmlspecialchars($client->__getLastRequest()) ."</p>";




$result = $proxy->ReturnNavDataAsXml( );
echo 'No pram'; print_r($result);























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

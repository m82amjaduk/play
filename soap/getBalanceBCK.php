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


//    $server = 'http://uat-webservices:8123/?wsdl';
$server = 'http://uat-webservices.bouxavenue.lan:8124/?wsdl';

$client = new SoapClient($server, array('cache_wsdl' => WSDL_CACHE_NONE));

$customerNo = 5090562;

echo '<h1> URL : ' . $server . '</h1>';
echo '<h1> Customer ID : ' . $customerNo . '</h1>';
echo '<pre>'; print_r($client); echo '</pre>';

$request =
    "<post>
              <requesttype>200</requesttype>
              <requestdescription>Unknown type</requestdescription>
              <currentuser>steven.galvin</currentuser>
              <terminalid>MO1</terminalid>
              <branchid>5600</branchid>
              <data>
                <customerno>5090562</customerno>
              </data>
        </post>";

$result = $client->ReturnNavDataAsXml($request);
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

/*
<post> <requesttype>200</requesttype> <requestdescription>Unknown type</requestdescription> <currentuser>steven.galvin</currentuser> <terminalid>MO1</terminalid> <branchid>5600</branchid> <data> <customerno>5090562</customerno> </data> </post>
*/

//
//URL : http://UAT-webservices.bouxavenue.lan:8124/?wsdl
//Cuntomer ID : 5090562
//
//stdClass Object
//(
//    [ReturnNavDataAsXmlResult] =>
//    [xmlResult] =>
//)
//


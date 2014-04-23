<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 22/04/14
 * Time: 10:38
 */


$proxy = new SoapClient('http://magento-rd.localhost/api/v2_soap/?wsdl'); // TODO : change url
$sessionId = $proxy->login('amzad', 'amzad123'); // TODO : change login and pwd if necessary

$result = $proxy->salesOrderInfo($sessionId, '100000044');
echo '<pre>';
print_r($result);

?>
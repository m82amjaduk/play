<?php
/**
 * Created by PhpStorm.
 * User: amojumder
 * Date: 24/09/2014
 * Time: 12:34
 */

    $server = 'http://uat-webservices:8123/?wsdl';

    $client = new SoapClient($server, array('cache_wsdl' => WSDL_CACHE_NONE));

    $request =
        "<post>
              <requesttype>200</requesttype>
              <requestdescription>Unknown type</requestdescription>
              <currentuser>steven.galvin</currentuser>
              <terminalid>MO1</terminalid>
              <branchid>5600</branchid>
              <data>
                <customerno>5360591</customerno>
              </data>
        </post>";

    $result = $client->ReturnNavDataAsXml($request);
        echo '<h1>' . $server . '</h1>';
        echo '<pre>'; print_r($result); echo '</pre>';

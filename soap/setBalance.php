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
            <requesttype>201</requesttype>
            <currentuser>Kevin.Howard</currentuser>
            <terminalid>MO1</terminalid>
            <branchid>5600</branchid>
            <data>
                <loyaltypoints>
                    <storeno>5001</storeno>
                    <posno>BW5</posno>
                    <transno>228</transno>
                    <receiptno>BW50000227</receiptno>
                    <entrytype>Payment</entrytype>
                    <points>-2,975</points>
                    <issuedate>07/07/2011</issuedate>
                    <cardno>5000332</cardno>
                    <sequenceno>0</sequenceno>
                    <contactno>5000332</contactno>
                    <expirationdate>31/12/3999</expirationdate>
                    <loyaltyscheme>VIP</loyaltyscheme>
                    <viptransaction>No</viptransaction>
                </loyaltypoints>
            </data>
        </post>";

    $result = $client->ReturnNavDataAsXml($request);
        echo '<h1>' . $server . '</h1>';
        echo '<pre>'; print_r($result); echo '</pre>';

echo '<pre>';
    echo $request;
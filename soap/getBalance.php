<?

//    $server = 'http://uat-webservices:8123/?wsdl';
$server = 'http://uat-webservices.bouxavenue.lan:8124/?wsdl';

$client = new SoapClient($server, array('cache_wsdl' => WSDL_CACHE_NONE));

$customerNo = 5073717; // 5090562;

$orderNo = 'BW50000229';

echo '<h1> URL : ' . $server . '</h1>';
echo '<h1> Customer ID : ' . $customerNo . '</h1>';
echo '<pre>'; print_r($client); echo '</pre>';

$request = array (
    'xmlString' =>
        "<request>
            <post>
                <requesttype>200</requesttype>
                <requestdescription>Unknown type</requestdescription>
                <currentuser>steven.galvin</currentuser>
                <terminalid>MO1</terminalid>
                <branchid>5600</branchid>
                <data>
                    <customerno>$customerNo</customerno>
                </data>
            </post>
        </request>"
);
$result = $client->ReturnNavDataAsXml($request);
$reply = simplexml_load_string($result->xmlResult);
echo "<h1> Points ". $reply->data->row->points ." </h1>";
echo '<pre>'; print_r($result); echo '</pre>';


exit;

$request = array(
    'xmlString' =>
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
                    <receiptno>$orderNo</receiptno>
                    <entrytype>Payment</entrytype>
                    <points>-15</points>
                    <issuedate>07/07/2011</issuedate>
                    <cardno>5000332</cardno>
                    <sequenceno>0</sequenceno>
                    <contactno>$customerNo</contactno>
                    <expirationdate>31/12/3999</expirationdate>
                    <loyaltyscheme>VIP</loyaltyscheme>
                    <viptransaction>No</viptransaction>
                </loyaltypoints>
            </data>
        </post>"
);

$result = $client->ReturnNavDataAsXml($request);
echo '<pre>'; print_r($result); echo '</pre>';


$request = array (
    'xmlString' =>
        "<request>
            <post>
                <requesttype>200</requesttype>
                <requestdescription>Unknown type</requestdescription>
                <currentuser>steven.galvin</currentuser>
                <terminalid>MO1</terminalid>
                <branchid>5600</branchid>
                <data>
                    <customerno>$customerNo</customerno>
                </data>
            </post>
        </request>"
);
$result = $client->ReturnNavDataAsXml($request);
echo '<pre>'; print_r($result); echo '</pre>';



$request = array(
    'xmlString' =>
        "<request> <post>
  <requesttype>1801</requesttype>
  <requestdescription>Points Payment Entry</requestdescription>
  <currentuser>vinee.ly</currentuser>
  <terminalid>MO01</terminalid>
  <branchid>5600</branchid>
  <data>
    <action>ADD</action>
    <orderNo>$orderNo</orderNo>
    <customerNo>$customerNo</customerNo>
    <vipAmount>5.25</vipAmount>
    <vipPoints>105</vipPoints>
    <vipExchangeRate>0.05</vipExchangeRate>
  </data>
</post> </request>"
);

$result = $client->ReturnNavDataAsXml($request);
echo '<pre>'; print_r($result); echo '</pre>';

$request = array (
    'xmlString' =>
        "<request>
            <post>
                <requesttype>200</requesttype>
                <requestdescription>Unknown type</requestdescription>
                <currentuser>steven.galvin</currentuser>
                <terminalid>MO1</terminalid>
                <branchid>5600</branchid>
                <data>
                    <customerno>$customerNo</customerno>
                </data>
            </post>
        </request>"
);
$result = $client->ReturnNavDataAsXml($request);
echo '<pre>'; print_r($result); echo '</pre>';


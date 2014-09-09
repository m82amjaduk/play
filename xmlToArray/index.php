<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 03/09/14
 * Time: 10:28
 *
 */

//$xmlstring = '<aaaa Version="1.0">
//   <bbb>
//     <cccc>
//       <dddd Id="id:pass" />
//       <eeee name="hearaman" age="24" />
//     </cccc>
//   </bbb>
//</aaaa>';
//
//$xml = simplexml_load_string($xmlstring);
//echo $json = json_encode($xml);
//$array = json_decode($json,TRUE);



$xml=simplexml_load_file("note.xml");

echo '<pre>';
print_r($xml);

echo $xml->amzad->faysal->tim->rich->cash;

//
//echo '<pre>';
//print_r($array);
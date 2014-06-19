<?php
/*if  '&' found in the string, xml stop printing char there.
need to scape char. and print the full line
*/
//http://stackoverflow.com/questions/1091945/where-can-i-get-a-list-of-the-xml-document-escape-characters

echo "test";


$xml = new SimpleXMLElement('<root/>');


//$name = str_replace('&', '&amp;', 'test & dsfsdfs' );
$name = "dsdcfsd & sdfsd > dsfsdfds < dsfdsfsd ' dsfsdfsd ";


echo $name = filterName($name);

$xml->addChild('timeDiff', $name);
file_put_contents('test.xml', $xml->asXML());


/////////////////////////////////////////////////


function filterName($name){
    $name = str_replace("&", '&#38;', $name );
    $name = str_replace('"', '&#34;', $name );
    $name = str_replace("'", '&#39;', $name );
    $name = str_replace('<', '&#60;', $name );
    $name = str_replace('>', '&#62;', $name );
    return $name;
}
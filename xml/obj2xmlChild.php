<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 23/04/14
 * Time: 11:31
 */

/*
 *  Covert from Obj to xml
 *  Prints value with &gt; & &lt; 
 */
ini_set('display_errors', 1);
ini_set('memory_limit', '512M');
ini_set('error_log','var/log/errorPhp.log');

class ObjectAndXML {
    private static $xml;

    // Constructor
    public function __construct() {
        $this->xml =  new SimpleXMLElement('<root/>');
//        $this->xml->startDocument('1.0');
    }

    // Method to convert Object into XML string
    public function objToXML($data, $xml, $newDoc=TRUE) {
        if ($newDoc==TRUE){
            $xml = new SimpleXMLElement("<root />");
        }
        $xml = $this->getArray2XML($data, $xml);
        return ($newDoc==TRUE) ? $xml->asXML() : $xml ;
    }

    // Method to convert Object into XML string
    public function getObject2XML($data, $xml) {
        foreach($data as $key => $value){
            if(is_object($value)){
                $xml->startElement($key);
                $xml->addChild(get_class($key));
                $this->getObject2XML($value, $xml);
                $xml->endElement();
            }
            else if (is_array($value)){
                $this->getArray2XML($value, $xml);
            }
            else
                $xml->addChild($key, $value);
        }
        return $xml;
    }

    // Method to convert Object into XML string
    public function getArray2XML($data, $xml) {
        foreach($data as $key => $value){

            if(is_object($value)){
                $this->getObject2XML($value, $xml);
            }
            else if (is_array($value)){
                $this->getArray2XML($value, $xml->addChild($key));
            }
            else
                $xml->addChild($key, $value);
        }
        return $xml;
    }
}



$obj = new ObjectAndXML();
$objData1 = new stdClass;


$sweet1 = array('a' => 'apple', 'b' => 'banana');
$sweet = array('a' => 'apple', 'b' => 'banana', 'newSweet' => $sweet1 );
$fruits = array('sweet' => $sweet, 'sour' => 'lemon');
$friend = array(  'age' => 23,  'name' => 'John',  'gender' => 'Male', 'eats' => $fruits );

$objData1->records->person[0]->name = 'XYZ';
$objData1->records->person[0]->age = '28';
$objData1->records->person[0]->gender = 'Male';

$objData1->records->person[1]->name = 'ABC';
$objData1->records->person[1]->age =  '28';
$objData1->records->person[1]->gender = 'Male';

$objData1->records->person[1]->name = 'ABC';
$objData1->records->person[1]->age =  '28';
$objData1->records->person[1]->gender = 'Male';
$objData1->records->person[1]->eats = $fruits;
$objData1->records->person[1]->friend = $friend;


$xml = "<root/>";

$recordsXML = $obj->objToXML($objData1, $xml, TRUE);
$dir = 'C:\Zend\Apache2\htdocs\play\xml\test\child.xml';
file_put_contents($dir, $recordsXML);

echo json_encode ($objData1);
<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 23/04/14
 * Time: 11:31
 */

class ObjectAndXML {
    private static $xml;

    // Constructor
    public function __construct() {
        $this->xml = new XmlWriter();
        $this->xml->openMemory();
//        $this->xml->startDocument('1.0');
        $this->xml->setIndent(true);
    }

    // Method to convert Object into XML string
    public function objToXML($obj) {
        $this->getObject2XML($this->xml, $obj);

        $this->xml->endElement();

        return $this->xml->outputMemory(true);
    }

    // Method to convert XML string into Object
    public function xmlToObj($xmlString) {
        return simplexml_load_string($xmlString);
    }

    private function getObject2XML(XMLWriter $xml, $data) {
        foreach($data as $key => $value) {
            if(is_object($value)) {
                $xml->startElement($key);
                $this->getObject2XML($xml, $value);
                $xml->endElement();
                continue;
            }
            else if(is_array($value)) {
                $this->getArray2XML($xml, $key, $value);
            }

            if (is_string($value)) {
                $xml->writeElement($key, $value);
            }
        }
    }

    private function getArray2XML(XMLWriter $xml, $keyParent, $data) {
        foreach($data as $key => $value) {
            if (is_string($value)) {
                $xml->writeElement($keyParent, $value);
                continue;
            }

            if (is_numeric($key)) {
                $xml->startElement($keyParent);
            }

            if(is_object($value)) {
                $this->getObject2XML($xml, $value);
            }
            else if(is_array($value)) {
                $this->getArray2XML($xml, $key, $value);
                continue;
            }

            if (is_numeric($key)) {
                $xml->endElement();
            }
        }
    }
}



$obj = new ObjectAndXML();
$objData1 = new stdClass;

$objData1->records->person[0]->name = 'XYZ';
$objData1->records->person[0]->age = '28';
$objData1->records->person[0]->gender = 'Male';

$objData1->records->person[1]->name = 'ABC';
$objData1->records->person[1]->age = '25';
$objData1->records->person[1]->gender = 'Male';




echo $recordsXML = $obj->objToXML($objData1);
$dir = 'C:\Zend\Apache2\htdocs\play\xml\test\test.xml';
file_put_contents($dir, $recordsXML);
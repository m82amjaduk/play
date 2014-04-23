<?php
///**
// * Created by PhpStorm.
// * User: AMojumder
// * Date: 23/04/14
// * Time: 10:16
// */
//
//$array = array(
//    'item_id' => 60,
//    'order_id' => 44,
//    'quote_item_id' => 83,
//    'product_id' => 19442 );
////print_r($array);
//
//  function generateValidXmlFromMix_iedObj($obj){
//     $xml = '';
////     if($add_header)
////         $xml .= self::generateHeader($header_params);
////     if($wrapper!=null) $xml .= '<' . $wrapper . '>';
//     if(is_object($obj))
//     {
//         $node_block = strtolower(get_class($obj));
//         if(isset($replacements[$node_block])) $node_block = $replacements[$node_block];
//         $xml .= '<' . $node_block . '>';
//         $vars = get_object_vars($obj);
//         if(!empty($vars))
//         {
//             foreach($vars as $var_id => $var)
//             {
//                 if(isset($replacements[$var_id])) $var_id = $replacements[$var_id];
//                 $xml .= '<' . $var_id . '>';
//                 $xml .= self::generateValidXmlFromMixiedObj($var, null, $replacements,  false, null, $node_name);
//                 $xml .= '</' . $var_id . '>';
//             }
//         }
//         $xml .= '</' . $node_block . '>';
//     }
//     else if(is_array($obj))
//     {
//         foreach($obj as $var_id => $var)
//         {
//             if(!is_object($var))
//             {
//                 if (is_numeric($var_id))
//                     $var_id = $node_name;
//                 if(isset($replacements[$var_id])) $var_id = $replacements[$var_id];
//                 $xml .= '<' . $var_id . '>';
//             }
//             $xml .= self::generateValidXmlFromMixiedObj($var, null, $replacements,  false, null, $node_name);
//             if(!is_object($var))
//                 $xml .= '</' . $var_id . '>';
//         }
//     }
//     else
//     {
//         $xml .= htmlspecialchars($obj, ENT_QUOTES);
//     }
//
////     if($wrapper!=null) $xml .= '</' . $wrapper . '>';
//
//     return $xml ;
//}
//
//
//
////$obj = new ObjectAndXML();
//
//$objData1 = new stdClass;
//
//$objData1->records->person[0]->name = 'XYZ';
//$objData1->records->person[0]->age = '28';
//$objData1->records->person[0]->gender = 'Male';
//
//$objData1->records->person[1]->name = 'ABC';
//$objData1->records->person[1]->age = '25';
//$objData1->records->person[1]->gender = 'Male';
//
//
////echo '<pre>';
////var_dump($objData1);
//
//echo $recordsXML = generateValidXmlFromMix_iedObj($objData1);
<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 25/04/14
 * Time: 16:41
 */
//   http://learning7.lc/helps/OrderXml.php?c=test

$c = ($_GET['c']) ? $_GET['c'] : 'id' ;

$m = str_replace('_', ' ',$c);
$m = ucwords  ($m);
$m = str_replace(' ', '',$m );


echo '$thisXML->addChild("'. $c. '", ' . '$data->get'.$m.'());';
echo '<br />';


$var = strtolower($c);
echo  '$'.$var. ' = $row["'.$c.'"];';
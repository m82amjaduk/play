<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 25/04/14
 * Time: 16:41
 */

$c = ($_GET['c']) ? $_GET['c'] : 'id' ;

$m = str_replace('_', ' ',$c);
$m = ucwords  ($m);
$m = str_replace(' ', '',$m );


echo '$thisXML->addChild("'. $c. '", ' . '$data->get'.$m.'());';
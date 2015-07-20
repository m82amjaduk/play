<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 12/06/2015
 * Time: 09:34
 */

//        echo $systemTimeZone = system('date +%Z');
echo date('l dS \of F Y h:i:s A');
echo "<br />".date_default_timezone_get();
echo "<br />";






echo MySqlTime('now');
function MySqlTime($str='now', $zone='Europe/London'){
    $theTime = strtotime($str);
    $tz = new DateTimeZone($zone);
    $transition = $tz->getTransitions($theTime, $theTime);   // echo  '<pre>'; print_r($transition); // exit;
    $tr = $transition[0]['ts'];
    return date('Y-m-d H:i:s', $tr);
}
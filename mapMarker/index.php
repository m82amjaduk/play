<?php
/**
 * Created by PhpStorm.
 * User: amojumder
 * Date: 19/12/2014
 * Time: 10:59
 */


$i =10;
$ma = "https://chart.googleapis.com/chart?chst=d_map_pin_letter_withshadow&chld=$i|000|FDFDFD";
?>


<html>
<body bgcolor="#fff">
<?=$ma?>
</body>
</html>

<?


// test //
$store = 2;
$color = ($store == 1) ? '004252' : 'B72613';
$img = ($store == 1) ? 'rd/RobertDyasStores' : 'ry/RymanStores';
for($i=0; $i<250; $i++){
    $content = file_get_contents("https://chart.googleapis.com/chart?chst=d_map_pin_letter_withshadow&chld=$i|$color|FDFDFD");
    $fp = fopen($img."$i.png","wb");
    fwrite($fp,$content);
    fclose($fp);
}


?>
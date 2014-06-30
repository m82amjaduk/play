<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 27/06/14
 * Time: 10:51
 */ ?>
<!--http://stackoverflow.com/questions/7075912/how-to-convert-postcode-to-geolocationlatitude-longitutde-using-google-maps-->
<? $store_id = $_REQUEST['store'] ;

require("dbCon.php");

try{
    $result = mysqli_query($con,"SELECT * FROM storelocator_branch_details WHERE id=$store_id");
}catch(Exception $e) {
    echo 'Message: ' .$e->getMessage();
}
$store_details = mysqli_fetch_array($result);


function get_rows($con, $SQL){
    try{
        $query = mysqli_query($con, $SQL);
    }catch(Exception $e) {
        echo 'Message: ' .$e->getMessage();
    }
    $result=array();
    while($row = mysqli_fetch_array($query)) {
        $result[]=$row;
    }
    return $result;
}
$hours = get_rows( $con, "SELECT day, from_, to_ FROM  storelocator_opening_hours WHERE (branch_id= $store_id AND active=1) ORDER BY  sn ASC");
$services = get_rows( $con, "SELECT id, service_name FROM  storelocator_services_store_details WHERE (branch_id= $store_id AND active=1)");
$holiday = get_rows( $con, "SELECT holiday_date, holiday_name, from_, to_ FROM  storelocator_hours_holiday WHERE (branch_id= $store_id AND active=1)");
$near_by = get_rows( $con, "SELECT branch_name, unique_name FROM   storelocator_near_by_details WHERE (branch_id= $store_id AND active=1)");

//echo $store_details['banner'];
//echo '<pre>'; print_r($near_by); exit;
?>
<head>
    <script src="http://maps.google.com/maps/api/js?sensor=false"
            type="text/javascript"></script>
</head>
<style>
    .clear{
        clear : both;
    }
    body{
        background-color: #D2E0E6;
    }
    #store_details{
        width: 950px;
        margin-left: auto;
        margin-right: auto;
        padding-left: 20px;
        background-color: #fff;
        /*height: 1800px;*/
    }
    #banner_map{
        width: 100%;
        height: 300px;
    }
    #banner{
        float: left;
        width: 67%;
        height: 100%;
        margin: 10px;
    }
    #banner img{
        width: 100%;
        height: 100%;
    }
    #map-canvas{
        float: right;
        width: 28%;
        height: 100%;
        margin: 10px;
    }
    #map-canvas:hover{
        float: right;
        width: 100%;
        height: 100%;
        margin: 10px;
    }
    #body_main{
        width: 100%;
        height: 1800px;
    }
    #content{
        float: left;
        width: 67%;
        height: 100%;
        padding: 10px;
        border-right: 2px solid #000000;
    }
    #aside{
        float: right;
        width: 28%;
        height: 100%;
        padding: 10px;
    }
    #aside div{
        margin: 10px 0;
    }
    #location{

    }
    #action{

    }
    #our_colleagues img{
        width: 100%;
        height:200px;
    }
    #near_by_stores{

    }
    #opening{}


</style>
<script>
    var map;
    function initialize() {
        var mapOptions = {
            zoom: 16,
            center: new google.maps.LatLng(<?=$store_details['lat']?>, <?=$store_details['lng']?>)
        };
        map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>

<div id="store_details" >
    <div id="banner_map">
        <div id="map-canvas"> </div>
        <div id="banner">
            <img src="<?=$store_details['banner']?>"/>
        </div>
    </div>
    <div class="clear"></div>
    <div id="body_main">
        <div id="content">
            <div id="about_store">
                <h1> <?=$store_details['branch_title']?>  </h1>
                <?=$store_details['branch_description']?>
            </div>
            <hr>
            <div id="about_location">
                <h1> <?=$store_details['location_title']?>  </h1>
                <?=$store_details['location_description']?>
            </div>
            <hr>
            <div id="near_us">
                <h1><?=$store_details['near_us_title']?>  </h1>
                <?=$store_details['near_us_description']?>
            </div>
        </div>
        <div id="aside">
            <div id="location">
                <h2> Location </h2>
                <?=$store_details['address1']?> <br />
                <? echo ($store_details['town']) ? $store_details['town'].'<br />' : NULL ; ?>
                <? echo ($store_details['city']) ? $store_details['city'].'<br />' : NULL ; ?>
                <? echo ($store_details['county']) ? $store_details['county'].'<br />' : NULL ; ?>
                <? echo ($store_details['postcode']) ? $store_details['postcode'].'<br />' : NULL ; ?>
            </div>
            <br /><br />
            <div id="action">
                Print This Informaion <br />
                <? echo ($store_details['telephone1']) ? $store_details['telephone1'].'<br />' : NULL ; ?>
                Email This Store
            </div>
            <? if ($services) {?>
            <div id="services">
                <h2> Services Available </h2>
                <? foreach ($services as $row){
                    echo $row['service_name'].'<br />';
                }?>
            </div> <?}?>
            <div id="our_colleagues">
                <img src="<?=$store_details['aside_img']?>"/>
            </div>
            <? if ($near_by) {?> <br />
            <div id="near_by_stores">
                <h2> Near By Stores </h2>
                <? foreach ($near_by as $row){
                    echo $row['branch_name'].' '.'<br />';
                }?>
            </div><?}?>
            <? if ($hours) {?> <br />
            <div id="opening">
                <h2> Opening Times </h2>
                <? foreach ($holiday as $row){
                    echo date( 'l dS M', strtotime($row['holiday_date'])).' :  '.num_to_min($row['from_']).' '.num_to_min($row['to_']).' '.'<br />';
                }?> <br />

                <? foreach ($hours as $row){
                    echo $row['day'].'  '.num_to_min($row['from_']).' '.num_to_min($row['to_']).' '.'<br />';
                }?>
            </div> <?}?>
        </div>
    </div>
    <div class="clear"></div>
    window.scrollTo(x-coord, y-coord);
</div>

<?
function num_to_min($min){
    $mn = $min%60;
    $hour   = ($min - $mn )/60;
    $ampm   = ($hour < 12 )? 'AM' : 'PM';
    $hour   = ($hour < 12 )? $hour : $hour-12;
    $hour   = ($hour < 10 ) ? '0'.$hour : $hour;
    $mn     = ($mn < 10 ) ? '0'.$mn : $mn;
    return $hour.':'.$mn.$ampm;
}
?>

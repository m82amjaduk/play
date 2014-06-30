<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 27/06/14
 * Time: 10:51
 */ ?>

<? $store_id = $_REQUEST['store'] ;

require("dbCon.php");

try{
    $result = mysqli_query($con,"SELECT * FROM markers WHERE id= $store_id");
}catch(Exception $e) {
    echo 'Message: ' .$e->getMessage();
}
$store_details = mysqli_fetch_array($result);
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
    #body_main{
        width: 100%;
        height: 1200px;
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
            center: new google.maps.LatLng(51.421547, -0.207814)
        };
        map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>

<div id="store_details" >
    <div id="banner_map">
        <div id="banner">
            <img src="http://www.swindontowncentre.co.uk/images/content/shop_units/Ryman/img_0500.jpgstore_details.php"/>
        </div>
        <div id="map-canvas"> </div>
    </div>
    <div class="clear"></div>
    <div id="body_main">
        <div id="content">
            <div id="about_store">
                <h1> About <?=$store_details['name']?> Canary Wharf </h1>
                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>
                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>
                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>
                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>
            </div>
            <hr>
            <div id="about_location">
                <h1> About Canary Wharf </h1>
                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>
                <p> To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon.To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>
                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>
            </div>
            <hr>
            <div id="near_us">
                <h1> What's Near Us </h1>
                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>
                <p>To find your nearest Ryman Store enter either a postcode or location name, such as a suburb, town or city. Your nearest stores will be displayed on an interactive map. To find out more information simply click the Store icon. </p>
            </div>
        </div>
        <div id="aside">
            <div id="location">
                <h2> Location </h2>
                16-19 Canada Square <br />
                Cannery Warf <br />
                London <br />
                E14 5EQ
            </div>
            <div id="action">
                Print This Informaion <br />
                020 7513 0722 <br />
                Email This Store
            </div>
            <div id="services">
                <h2> Services Available </h2>
                DHL <br />
                Scan<br />
                Photocopy
            </div>
            <div id="our_colleagues">
                <img src="http://www.parikiaki.com/wp-content/uploads/theo-paphitis4.jpg"/>
            </div>
            <div id="near_by_stores">
                <h2> Near By Stores </h2>
                Gracehurch Street <br />
                Queen Street <br />
                Fleet Street <br />
            </div>
            <div id="opening">
                <h2> Opening Times </h2>
                Gracehurch Street <br />
                Queen Street <br />
                Fleet Street <br />
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>

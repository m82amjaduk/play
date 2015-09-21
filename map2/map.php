<?php
/**
 * Created by PhpStorm.
 * User: amojumder
 * Date: 21/01/2015
 * Time: 09:31
 */
?>



<!DOCTYPE html>
<html>
<head>
    <title>Asynchronous Loading</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
        html, body{
            height: 100%;
            margin: 0px;
            padding: 0px
        }
        #map-canvas {
            height:400px;
            width:600px;
        }
    </style>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js?sensor=false&v=3.16"></script>
    <script>
        var marker;
        var mapProp;
        var map;
        var lat = 1;
        var lng = 1;

/*        var button = document.getElementById("panButton");
        button.addEventListener("click", pan);*/

        function initialize() {
            var myCenter = new google.maps.LatLng(lat,lng);

            mapProp = {
                center: myCenter,
                zoom: 5,
                mapTypeId: google.maps.MapTypeId.TERRAIN
            };

            map = new google.maps.Map(document.getElementById("map-canvas"), mapProp);

            marker = new google.maps.Marker({
                position: myCenter
            });

            marker.setMap(map);
        }

    </script>
</head>
<body>
<div id="map-canvas"></div>
<input id="latitude" type="text" value="50" />
<input id="longitude" type="text" value="130" />
<button id="panButton" onclick="initialize();">pan</button>
</body>
</html>

<script>
    setTimeout(function(){
        $( "#panButton" ).click();
    }, 2000);
</script>


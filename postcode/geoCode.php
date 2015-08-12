<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 12/08/2015
 * Time: 13:04
 */ ?>


<!DOCTYPE html>
<html>
<head>
    <title>Geocoding service</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <script src="http://ashleyhomeware.com/resources/menu/js/jquery.min.js"></script>
    <meta charset="utf-8">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        #map {
            height: 100%;
        }
        #panel {
            position: absolute;
            top: 10px;
            left: 25%;
            z-index: 5;
            background-color: #fff;
            padding: 5px;
            border: 1px solid #999;
            text-align: center;
        }

        /**
         * Provide the following styles for both ID and class, where ID represents an
         * actual existing "panel" with JS bound to its name, and the class is just
         * non-map content that may already have a different ID with JS bound to its
         * name.
         */

        #panel, .panel {
            font-family: 'Roboto','sans-serif';
            line-height: 30px;
            padding-left: 10px;
        }

        #panel select, #panel input, .panel select, .panel input {
            font-size: 15px;
        }

        #panel select, .panel select {
            width: 100%;
        }

        #panel i, .panel i {
            font-size: 12px;
        }

    </style>
</head>
<body>
<div id="panel">
    <input id="address" type="textbox" value="london, sw194dd">
    <input id="submit" type="button" value="Geocode">
    <div id="latLng"></div>
</div>
<div id="map"></div>
<script>
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 16,
            center: {lat: -34.397, lng: 150.644}
        });
        var geocoder = new google.maps.Geocoder();

        document.getElementById('submit').addEventListener('click', function() {
            geocodeAddress(geocoder, map);
        });
    }

    function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
        geocoder.geocode({'address': address}, function(results, status) {
            if (status === google.maps.GeocoderStatus.OK) {
                resultsMap.setCenter(results[0].geometry.location);
//                $('#latLng').html("your value");
                $('#latLng').html("Lat: " + results[0].geometry.location.lat() + ", " + results[0].geometry.location.lng());
                var marker = new google.maps.Marker({
                    map: resultsMap,
                    position: results[0].geometry.location
                });
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }

</script>
<script src="https://maps.googleapis.com/maps/api/js?signed_in=true&callback=initMap"
        async defer></script>
</body>
</html>


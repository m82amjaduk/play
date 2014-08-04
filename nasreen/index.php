<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 04/08/14
 * Time: 11:51
 */?>



<!DOCTYPE html>
<html>
  <head>
    <title>Asynchronous Loading</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px
      }
    </style>
    <script>
function initialize() {
    var mapOptions = {
        zoom: 16,
    center: new google.maps.LatLng(23.862697, 90.435972)
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
            mapOptions);
}

function loadScript() {
    var script = document.createElement('script');
    script.type = 'text/javascript';
    script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
        'callback=initialize';
    document.body.appendChild(script);
}

window.onload = loadScript;

    </script>
  </head>
  <body>
    <div id="map-canvas"></div>
  </body>
</html>
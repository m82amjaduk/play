<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 01/07/14
 * Time: 12:09
 */ ?>
<script type="text/javascript">
    //<![CDATA[

    var customIcons = {
        restaurant: {
            icon: 'http://labs.google.com/ridefinder/images/mm_20_blue.png',
            shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
        },
        bar: {
            icon: 'http://labs.google.com/ridefinder/images/mm_20_red.png',
            shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
        }
    };

    function load() {
        var map = new google.maps.Map(document.getElementById("map"), {
            center: new google.maps.LatLng(51.677, -0.606),
            zoom: 13,
            mapTypeId: 'roadmap'
        });
        var infoWindow = new google.maps.InfoWindow;

        // Change this depending on the name of your PHP file
        downloadUrl("phpsqlajax_genxml.php", function(data) {
            var xml = data.responseXML;
            var markers = xml.documentElement.getElementsByTagName("marker");
            for (var i = 0; i < markers.length; i++) {
                var id = markers[i].getAttribute("id");
                var name = markers[i].getAttribute("name");
                var address = markers[i].getAttribute("address");
                var type = markers[i].getAttribute("type");
                var point = new google.maps.LatLng(
                    parseFloat(markers[i].getAttribute("lat")),
                    parseFloat(markers[i].getAttribute("lng")));
                var html = "<b>" + name + "</b> <br/>" + address + "<a href='store_details.php?store=" + id +"'> View Details </a>";
                var icon = customIcons[type] || {};
                var marker = new google.maps.Marker({
                    map: map,
                    position: point,
                    icon: icon.icon,
                    shadow: icon.shadow
                });
                bindInfoWindow(marker, map, infoWindow, html);
            }
        });
    }

    function bindInfoWindow(marker, map, infoWindow, html) {
        google.maps.event.addListener(marker, 'click', function() {
            infoWindow.setContent(html);
            infoWindow.open(map, marker);
        });
    }

    function downloadUrl(url, callback) {
        var request = window.ActiveXObject ?
            new ActiveXObject('Microsoft.XMLHTTP') :
            new XMLHttpRequest;

        request.onreadystatechange = function() {
            if (request.readyState == 4) {
                request.onreadystatechange = doNothing;
                callback(request, request.status);
            }
        };

        request.open('GET', url, true);
        request.send(null);
    }

    function doNothing() {}
    //]]>
</script>

<div id="map" style="width: 900px; height: 500px"></div>
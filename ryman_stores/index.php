<style>
    .viewOnMap{
        background-color: #000000;
        color: #D2E0E6;
    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Ryman Store Locator</title>
    <script src="http://maps.google.com/maps/api/js?sensor=false"
            type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
</head>

<body onload="load()">
<div id="map" style="width: 900px; height: 500px"></div>

<?
require("dbCon.php");
try{
    $result = mysqli_query($con,"SELECT * FROM storelocator_branches");
}catch(Exception $e) {
    echo 'Message: ' .$e->getMessage();
}

while($row = mysqli_fetch_array($result)) { $store_id = $row['id'];
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    //// Delete From here
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    //Upto here
}
?>
</body>
</html>


<script>
    $( ".viewOnMap" ).click(function() {
        var store_id = $(this).attr("store_id");
        alert( "Handler for .click() called." + store_id );
        $("html, body").animate({ scrollTop: 0 }, "slow");
        ///


//        var map = new google.maps.Map(document.getElementById("map"), {
//            center: new google.maps.LatLng(51.677, -0.606),
//            zoom: 13,
//            mapTypeId: 'roadmap'
//        });
//        var infoWindow = new google.maps.InfoWindow;
//        var point = new google.maps.LatLng(
//            parseFloat(51.677),
//            parseFloat( -0.606);
//        var html = "<b>" + name + "</b> <br/>"  + "<a href='store_details.php?store=" +"'> View Details </a>";
////        var icon = customIcons[type] || {};
//        var marker = new google.maps.Marker({
//            map: map,
//            position: point,
//            icon: 'http://labs.google.com/ridefinder/images/mm_20_red.png',
//            shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
//        });
//        bindInfoWindow(marker, map, infoWindow, html);
    });
</script>

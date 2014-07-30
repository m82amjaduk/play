<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 28/07/14
 * Time: 11:16
 * http://learning7.lc/ryman_stores/LoadMapOnPopUp/
 */
?>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script src="jquery.bpopup.min.js"></script>

<style>
    #element_to_pop_up {
        background-color:#fff;
        border-radius:15px;
        color:#000;
        display:none;
        padding:20px;
        min-width:900px;
        min-height: 90%;
    }
    .b-close{
        cursor:pointer;
        position:absolute;
        right:10px;
        top:5px;
    }
    #map-content{
         width:980px;
         height:500px;
    }
    .CollectFromHere{
        background: #0dffe6;
    }
</style>


<!-- Button that triggers the popup -->
<button id="my-button">POP IT UP</button>
<div id="content">  Address to show here </div>
<!-- Element to pop up -->
<div id="element_to_pop_up">
    <a class="b-close">close<a/>
        <div id="searchInput">
            <input type="text" name="address" class="searchBox"  placeholder="Enter Town Or Postcode"><select name="options">
                <option value="10">10mi</option>
                <option value="20">20mi</option>
                <option value="30">30mi</option>
                <option value="50">50mi</option>
                <option value="100">100mi</option>
            </select>
            <input type="submit" class="searchButton" value="SEARCH" onclick="fetchPlaces();">
            <button id="my-button">Reset</button>
        </div>


        <div id="map-content">
            <img src="https://www.ryman.co.uk/media/wysiwyg/ryman/misc/ryman_store_photo.jpg" width="100%"/>
        </div>
</div>
<img src="https://www.ryman.co.uk/media/wysiwyg/ryman/misc/ryman_store_photo.jpg" width="100%"/>

<script>
    var markers = [];

    var infowindow =  new google.maps.InfoWindow({
        content: ''
    });
    function myFunction() {
        console.log("I am in myFunction");
        fetchPlaces();
        return false;
    }
    function  fetchPlaces() {
        console.log("I am in fetchPlaces");

        var mapOptions = {
            center: new google.maps.LatLng(37.421995, -122.083702),
            zoom: 11,
            mapTypeId: 'roadmap'
        };
        console.log("MapOption init Succeeded");
        var map = new google.maps.Map(document.getElementById("map-content"), mapOptions);
        console.log("map init Succeeded");

        jQuery.ajax({
            url : 'http://www.learning1.lc/api',
            dataType : 'json',
            success : function(response) {
                console.log("Success " + response.status );
                if (response.status == 'OK') {
                    places = response.places;
                    // loop through places and add markers
                    for (p in places) {
                        console.log("Place  " +  places[p].name );
                        //create gmap latlng obj
                        tmpLatLng = new google.maps.LatLng( places[p].geo[0], places[p].geo[1]);
                        // make and place map maker.
                        var marker = new google.maps.Marker({
                            map: map,
                            position: tmpLatLng
                        });
<!--                        --><?// $collect = '<div  onclick=\"myFunction(\'amjad\')\" class=\"clickHere\"> click here</div>'; ?>

                        bindInfoWindow(marker, map, infowindow, '<div   onclick="loadAddress( \'' + places[p].name  + '\');"> Collect From ' + places[p].name  + '</div>');
                        // not currently used but good to keep track of markers
                        markers.push(marker);
                    }
                }
            }
        })
    };

    // binds a map marker and infoWindow together on click
    var bindInfoWindow = function(marker, map, infowindow, html) {
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.setContent(html);
            infowindow.open(map, marker);
        });
    }

    function loadAddress(name){
        console.log("popUpclosed; I'm in loadAddress");
        $( "#element_to_pop_up" ).bPopup().close();
        $('#content').html('This is the new address ... ' + name );
    }

</script>


<script>
    // Semicolon (;) to ensure closing of earlier scripting
    // Encapsulation
    // $ is assigned to jQuery ;
    ; (function($) {
        // DOM Ready
        $(function() {

            // Binding a click event
            // From jQuery v.1.7.0 use .on() instead of .bind()
            $('#my-button').bind('click', function(e) {

                // Prevents the default action to be triggered.
                e.preventDefault();

                // Triggering bPopup when click event is fired
                $('#element_to_pop_up').bPopup();

            });

        });

    })(jQuery);
</script>



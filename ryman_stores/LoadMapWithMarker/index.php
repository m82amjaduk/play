<!--http://blog.codebusters.pl/demo/hidden_map_solution2.html-->
<!--http://blog.codebusters.pl/en/google-maps-in-hidden-div-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<style>
    #map-content{
        width: 100%;
        height:100%;
    }
</style>
<div  onclick="myFunction()"> click here</div>
<div id="map-content"></div>
<script>
    var map;
    var markers = [];
    function myFunction() {
        console.log("I am in myFunction");
        initialize();
    }

    function initialize() {
        var mapOptions = {
            center: new google.maps.LatLng(37.421995, -122.083702), // ;o)
            zoom: 15,
            mapTypeId: google.maps.MapTypeId.SATELLITE
        };

        var map = new google.maps.Map(document.getElementById("map-content"),mapOptions);
        var point = new google.maps.LatLng(  parseFloat(37.421995), parseFloat(-122.083702));
        var marker = new google.maps.Marker({
            map: map,
            position: point
        });
        fetchPlaces();
    }

    var fetchPlaces = function () {
        console.log("I am in fetchPlaces");

        var infowindow =  new google.maps.InfoWindow({
            content: ''
        });

        jQuery.ajax({
            url : 'data.php',
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
                            position: point
                        });

                        console.log(marker );
//                        bindInfoWindow(marker, map, infowindow, '<b>'+places[p].name + "</b><br>" + places[p].geo_name);

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

</script>
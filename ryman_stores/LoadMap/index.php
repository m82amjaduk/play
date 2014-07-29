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
<div  onclick="myFunction('amjad')"> click here</div>
<div id="map-content"></div>
<script>
    function initialize() {
        var mapOptions = {
            center: new google.maps.LatLng(37.421995, -122.083702), // ;o)
            zoom: 18,
            mapTypeId: google.maps.MapTypeId.SATELLITE
        };
        var map = new google.maps.Map(document.getElementById("map-content"),mapOptions);
    }
    function myFunction() {
        initialize();
    }

</script>
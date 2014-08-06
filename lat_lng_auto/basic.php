<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 05/08/14
 * Time: 11:47
 */ ?>

<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>
    navigator.geolocation.getCurrentPosition(GetLocation);
    function GetLocation(location) {
        alert(location.coords.latitude);
        alert(location.coords.longitude);
        alert(location.coords.accuracy);
    }
</script>
<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 12/08/2015
 * Time: 12:55
 */ ?>

<input id="address" type="textbox" value="">
<script type="text/javascript">
    var lat;
    var lng;
    function addressurls(address) {
        var address = document.getElementById("address").value;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({'address': address}, function postcodesearch(results, status)
        {
            if (status == google.maps.GeocoderStatus.OK)
            {
                var lat = results[0].geometry.location.lat();
                var lng = results[0].geometry.location.lng();
                var laturl = "&lat=";
                var lonurl = "&lon=";
                var postcode = document.getElementById("address").value;
                var addressurl = "/distributors-search?address=" + postcode + laturl + lat+ lonurl + lng;
                parent.location=addressurl;
            }
            else {
                alert("Error");
            }
        });

    }
</script>
<input type="button" value="Encode" onclick="addressurls('address'), parent.location=addressurl">
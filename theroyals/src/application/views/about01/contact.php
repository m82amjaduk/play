<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 23/06/14
 * Time: 00:15
 */ ?>

<style>
    #map-canvas {
        width: <?=$contact->width?>;
        height: <?=$contact->height?>;
        margin: 0px 0px 50px 0px;
        padding: 0px;
        border: 2px solid #fff;
    }
</style>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script>
    // This example displays a marker at the center of Australia.
    // When the user clicks the marker, an info window opens.

    function initialize() {
        var myLatlng = new google.maps.LatLng(<?=$contact->lat?>, <?=$contact->lng?>);
        var mapOptions = {
            zoom: <?=$contact->zoom?>,
            center: myLatlng
        };

        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

       var contentString = '<img src="<?=$business->logo?>" /> <br /> <?=$business->business_name?>';
 /*       var contentString = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
            '<div id="bodyContent">'+
            '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
            'sandstone rock formation in the southern part of the '+
            'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
            'south west of the nearest large town, Alice Springs; 450&#160;km '+
            '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
            'features of the Uluru - Kata Tjuta National Park. Uluru is '+
            'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
            'Aboriginal people of the area. It has many springs, waterholes, '+
            'rock caves and ancient paintings. Uluru is listed as a World '+
            'Heritage Site.</p>'+
            '<p>Attribution: Uluru, <a href="http://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
            'http://en.wikipedia.org/w/index.php?title=Uluru</a> '+
            '(last visited June 22, 2009).</p>'+
            '</div>'+
            '</div>';*/

        var infowindow = new google.maps.InfoWindow({
            content: contentString
        });

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'Uluru (Ayers Rock)'
        });
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map,marker);
        });
    }

    google.maps.event.addDomListener(window, 'load', initialize);

</script>

<div class="page-content">

    <!-- entry-content -->
    <div class="entry-content cf">

        <h2 class="heading">CONTACT US</h2>
        <div id="map-canvas"></div>

        <p>
            <strong>Address Info</strong><br>
            <?=$address?>
            <br />
            <br />
            <strong>Telephone</strong><br>
            <?=$phone?><br>
        </p>

        <div class="block-divider"></div>

        <h3>Get in touch using this form</h3>
        <!-- form -->
        <form id="contactForm" action="<?=base_url()?>about/contact_process" method="post">
            <fieldset>

                <p>
                    <label for="name">First Name</label>
                    <input name="fname" id="name" type="text"  title="Enter your full name">
                </p>

                <p>
                    <label for="name">Last Name</label>
                    <input name="lname" id="name" type="text"  title="Enter your full name">
                </p>

                <p>
                    <label for="email">Email</label>
                    <input name="email" id="email" type="text" class="form-poshytip" title="Enter your email address">
                </p>

                <p>
                    <label for="phone">Phone</label>
                    <input name="phone" id="phone" type="text"  title="Enter your phone number">
                </p>

                <p>
                    <label for="name">Title</label>
                    <input name="title" id="title" type="text"  title="Enter your full name">
                </p>

                <p>
                    <label for="comments">Message</label>
                    <textarea name="comments" id="comments" rows="5" cols="20" class="form-poshytip" title="Enter your comments"></textarea>
                </p>

                <!-- send mail configuration -->
                <input type="hidden" value="ENTER SUBJECT HERE" name="subject" id="subject">
<!--                <input type="hidden" value="send-mail.php" name="sendMailUrl" id="sendMailUrl">-->
                <!-- ENDS send mail configuration -->

                <p><input type="submit" value="Send" name="submit" id="submit">
            </fieldset>

        </form>
        <!-- ENDS form -->

    </div>
    <!-- ENDS entry-content -->

</div>

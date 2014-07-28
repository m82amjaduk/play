<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 28/07/14
 * Time: 14:51
 */
//https://developers.google.com/maps/documentation/javascript/examples/map-simple-async
?>


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>jQuery.post demo</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <style>
        #map-canvas{
            width:100%;
            height: 600px;
            background-color: #556;
        }

        #map { height: 100%; width:100%; }
    </style>
</head>
<body>
<form action="/" id="searchForm">
    <input type="text" name="s" placeholder="Search...">
    <input type="submit" value="Search" id="submit">
</form>

<!-- the result of the search will be rendered inside this div -->

<div id="map-canvas">
</div>

<script>

    $( "#searchForm" ).submit(function( event ) {
       $( "script" ).load( "test2.php" );
        return false;
    });

/*
    $( "#searchForm" ).submit(function( event ) {
        event.preventDefault();
        var $form = $( this ),
            term = $form.find( "input[name='s']" ).val(),
            url = $form.attr( "action" );

        var form_data = {
            name: term,
            ajax: '1'
        };

        $.ajax({
            url: "test.php",
            type: 'GET',
            data: form_data,
            success: function(msg) {

                var data=$(msg).filter('div#result');
                $('#result').html(data);
            }
        });
        return false;
    });*/

</script>

</body>
</html>
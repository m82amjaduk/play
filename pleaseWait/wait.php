<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 23/04/14
 * Time: 16:53
 */ ?>

<!DOCTYPE html>
<html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js">
    </script>
    <script>
        $(document).ready(function(){
            $(document).ajaxStart(function(){
                $("#wait").css("display","block");
            });
            $(document).ajaxComplete(function(){
                $("#wait").css("display","none");
            });
            $("button").click(function(){
                $("#txt").load("load.php");
            });
        });
    </script>
</head>
<body>

<div id="txt"><h2>Let AJAX change this text</h2></div>
<button>Change Content</button>
<div id="wait" style="display:none;width:69px;height:89px;border:1px solid black;position:absolute;top:50%;left:50%;padding:2px;">
    <img src='http://sina16.book.cnhintl.com/images/wait.gif' width="64" height="64" /><br>Loading..</div>

</body>
</html>

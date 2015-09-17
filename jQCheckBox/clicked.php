<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 16/09/2015
 * Time: 14:27
 */
//  http://play.lc/jQCheckBox/clicked.php
?>
<!DOCTYPE html>
<html>
<head>
    <title>setCheck Example</title>
</head>
<body>
<label>Reflection: <input id="checkbox" type="checkbox" /></label>
</body>
</html>

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.0.min.js"></script>


<script>
    $('#checkbox').attr('checked', true);
    $('#checkbox').change(function() {
        if ($(this).is(':checked')) {
            alertThis(1);
        } else {
            alertThis(0);
        }
    });

    function alertThis(state){
        var printText = (state) ? 'Checked' : 'Unchecked';
        console.log(printText);
    }

//    function alertThis(state){
//        var printText = (state) ? 'Checked' : 'Unchecked';
</script>
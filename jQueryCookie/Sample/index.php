<?
/**
* Created by PhpStorm.
* User: AMojumder
* Date: 17/04/14
* Time: 16:20
*/
?>

<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title>jQuery Cookie Test</title>
    <link rel="icon" type="image/gif" href="http://conosurtek.co.uk/aj/images/conosurTek/favicon.ico"/>
    <link rel="stylesheet" href="http://code.jquery.com/qunit/qunit-1.10.0.css">
    <script src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
    <script src="http://code.jquery.com/qunit/qunit-1.10.0.js"></script>

    <script src="js/jquery.cookie.js"></script>


    <style>
    </style>
    <script>
        var people = [
            { 'name' : 'Abel', 'age' : 1 },
            { 'name' : 'Bella', 'age' : 2 },
            { 'name' : 'Chad', 'age' : 3 },
        ];
    </script>
</head>
<body>

<div id="myResults">  </div>



<script>
    $.cookie('website', document.URL, { expires: 7, path: '/' });

    $.cookie("people", JSON.stringify(people));
    // later on...
    var people = $.cookie("people");
    console.log(people);
    var people = JSON.parse(people);
    people.push(
        { 'name' : 'Daniel', 'age' : 4 }
    );
    $.cookie("people", JSON.stringify(people));
    var newPeople = $.cookie("people") ;
    $("body").html( newPeople);
    console.log(newPeople);
</script>
</body>
</html>



<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Demo</title>
    <link rel="icon" type="image/gif" href="http://conosurtek.co.uk/aj/images/conosurTek/favicon.ico"/>
    <link rel="stylesheet" href="http://code.jquery.com/qunit/qunit-1.10.0.css">
    <script src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
    <script src="http://code.jquery.com/qunit/qunit-1.10.0.js"></script>

    <script src="jquery_cookie/jquery.cookie.js"></script>


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
    var people = [
        { 'name' : 'Abel', 'age' : 1 },
        { 'name' : 'Bella', 'age' : 2 },
        { 'name' : 'Chad', 'age' : 3 },
    ];
    $.cookie("people", JSON.stringify(people));
    // later on...
//    var people = $.parseJSON($.cookie("people");)
    people.push(
        { 'name' : 'Daniel', 'age' : 4 }
    );
    $.cookie("people", JSON.stringify(people));
    var newPeople = $.cookie("people") ; //
    $("body").html( newPeople);
</script>
</body>
</html>

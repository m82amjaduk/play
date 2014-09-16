<?php

echo 'Hello test connection  <br />';

error_reporting(E_ALL);
//ini_set('display_errors', 'on');

$database       =   'cwaiter_aaa1780';
$username       =   'cwaiter_aj';
echo $password       =   '*NOJZ?5HUA@I';


$link = mysql_connect('localhost', $username, $password);
if (!$link) {
    die('Could not connect: ' . mysql_error());
}

echo '<br /> Connected successfully';
mysql_close($link);

/*
$con=mysqli_connect("localhost",$username,$password ,$database);

// Check connection
if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}*/


//
//$con = pg_connect("host=localhost dbname=$database user=$username password=$password port=5432");
//$con=mysqli_connect("example.com","peter","abc123","my_db");
//echo "After connection is created";
//if (!$con) {
//    die('Could not connect: ' . mysql_error());
//}
//else
//  echo 'Connected Successfully !! ';

echo '<br />After Connection';


?>
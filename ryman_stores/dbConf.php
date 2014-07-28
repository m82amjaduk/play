<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 27/06/14
 * Time: 09:49
 */

$username = "root";
$password = "";
$database = "ryman_stores";

$con=mysqli_connect("localhost",$username,$password,$database);
// Check connection
if (mysqli_connect_errno()) {
    echo "Failed to connect to MySQL: " . mysqli_connect_error();
}

?>
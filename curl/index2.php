<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 09/06/15
 * Time: 19:30
 */
$email = $_GET['email'];
$pass = $_GET['pass'];
echo $actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
?>

<form action="action_page.php" method="get">
    First name:<br>
    <input type="text" name="email" value="<?=$email?>">
    <br>
    Last name:<br>
    <input type="text" name="pass" value="<?=$pass?>">
    <br><br>
    <input type="submit" name="login" value="Login">
</form>
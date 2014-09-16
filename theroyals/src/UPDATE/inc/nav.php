<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 03/09/14
 * Time: 11:31
 */
?>

<a href='/index.php'>HOME(Site)</a> |
<a href='/UPDATE'> UPDATE </a> |
<a href='/UPDATE/deleteFiles.php'> Delete Files </a>  |
<a href='/index.php/migration'> Migrate Database </a>
<hr>

<?
include 'functions.php';
define('SITECODE', substr($_SERVER['DOCUMENT_ROOT'], 6, 7));
if(SITECODE == 'amzad/d')
    die('I must Die, Else I will spoil everthing ... !!! <br /> Push it to ukb1781::bccwl.com <br />/home/amzad/dev/theroyals/ServerConf/deployLiveBccwl.sh');
?>

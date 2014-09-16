<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 28/08/14
 * Time: 21:20
 */
include 'inc/nav.php';

$versionList = 'http://allinepos.co.uk/clientsRemoteUpdate/cwaiter/menu/';

#######################################################
# Please edit this file in   /home/amzad/dev/theroyals/src/UPDATE/dirList.php
#######################################################

$curlSession = curl_init();
curl_setopt($curlSession, CURLOPT_URL, $versionList );
curl_setopt($curlSession, CURLOPT_BINARYTRANSFER, true);
curl_setopt($curlSession, CURLOPT_RETURNTRANSFER, true);


echo '<h3> Please Wait While Getting The List </h3>';
$jsonData = curl_exec($curlSession);
echo '<h1> Copied File Accross </h1>';
$dataArray = json_decode($jsonData);
curl_close($curlSession);
?>


<form action="copyFile.php" id="carform">
    Email Address:<input type="text" name="e">
    <select name="v">
        <option value="060000005">060000005***</option>
        <? foreach ($dataArray as $row){?>
            <option value="<?=$row?>"><?=$row?></option>
        <?}?>
    </select>
    <input type="submit">
</form>
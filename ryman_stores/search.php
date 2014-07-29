<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 17/07/14
 * Time: 11:18
 */

require("dbConf.php");
$withIn = 125;
$mile = TRUE;
$radius = ($mile) ? 3959 : 6371;

$centerLat = 47.608940;
$centerLng = -122.340141;

$query = "SELECT *, ( $radius * acos(
cos( radians($centerLat) )
* cos( radians( lat ) )
* cos( radians( lng ) - radians($centerLng) )
+ sin( radians($centerLat) )
* sin( radians( lat ) ) ) ) AS distance FROM
markers HAVING distance < $withIn ORDER BY distance LIMIT 0 , 10";

//$query  = "SELECT * FROM storelocator_branches";

try{
    $result = mysqli_query($con, $query );
}catch(Exception $e) {
    echo 'Message: ' .$e->getMessage();
}
//var_dump($result);



$array =NULL;
while($row = mysqli_fetch_array($result)) { $store_id = $row['id'];
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";

    $array[] = $row;

//
    //// Delete From here
//    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
//        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
//    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
//        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
//    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
//        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
//    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
//        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
//    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
//        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
//    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
//        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
//    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
//        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
//    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
//        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
//    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
//        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    //Upto here
}

//echo '<pre>'; print_r($array);

echo serialize($array);
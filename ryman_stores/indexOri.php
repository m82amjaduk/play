<style>
    .viewOnMap{
        background-color: #000000;
        color: #D2E0E6;
    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <title>Ryman Store Locator</title>
    <script src="http://maps.google.com/maps/api/js?sensor=false"
            type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

</head>

<body onload="load()">
<div >
    <? require("map.php"); ?>
</div>

<?
require("dbCon.php");
try{
    $result = mysqli_query($con,"SELECT * FROM storelocator_branches");
}catch(Exception $e) {
    echo 'Message: ' .$e->getMessage();
}

while($row = mysqli_fetch_array($result)) { $store_id = $row['id'];
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    //// Delete From here
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    echo $row['branch_name']."<a href='store_details.php?store=".$store_id."'> View Details </a> ".
        " <a href='#' store_id='$store_id' class='viewOnMap' > View On Map </a>"."<hr>";
    //Upto here
}
?>
</body>
</html>


<script>
    $( ".viewOnMap" ).click(function() {
        var store_id = $(this).attr("store_id");
//        alert( "Handler for .click() called." + store_id );
        $("html, body").animate({ scrollTop: 0 }, "slow");

//        google.maps.event.trigger(markers[2], 'click');
    });
</script>

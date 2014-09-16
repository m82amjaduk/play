<?
include '../inc/functions.php'; 
access();   

$data = $_REQUEST['domain'];  
 
$myquery = "UPDATE settings_business SET web_url1 = '$data' WHERE id = 1";
pg_query($return_conn, $myquery);


header('Refresh: 3; url=http://'.$_SERVER['HTTP_HOST']);
//echo $data."** <br />"; 
//echo $cwaiter."-->".$cw_site."--->".$cw_admin."--->".$cw_db ."--->".$cw_helpdesk;

echo '<h1> Domain Successfully </h1> web_url1: '.$data;





?>
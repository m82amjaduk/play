<?
include '../inc/functions.php'; 
access();   

$data = $_REQUEST['data'];  

$cwaiter = substr($data, 0, 6);
$cw_site = substr($data, 7, 6);
$cw_admin = substr($data, 14, 6);
$cw_db = substr($data, 21, 6);
$cw_helpdesk = substr($data, 28, 6);

$myquery = "UPDATE settings_version SET cwaiter = '$cwaiter', cw_site = '$cw_site', cw_admin = '$cw_admin' WHERE id = 1";
pg_query($return_conn, $myquery);


header('Refresh: 3; url=http://'.$_SERVER['HTTP_HOST']);
//echo $data."** <br />"; 
//echo $cwaiter."-->".$cw_site."--->".$cw_admin."--->".$cw_db ."--->".$cw_helpdesk;

echo '<h1> Update Successfully </h1> cwaiter: '.$cwaiter.' <br /> cw Site : '.$cw_site.' <br /> cw Admin : '.$cw_admin;



?>

<?php 
$http_host = $_SERVER['HTTP_HOST'];
$client_id = substr($_SERVER['DOCUMENT_ROOT'],6,7);

$var = ($client_id == 'ukb1781') ? "U" : 'A';
//$var = 'U';

//Please DO NOT Change this settings. If you need to modify Please set $var = 'U', Change it in custom setting area.
$database = 'cwaiter_'.$client_id;
$username =  'cwaiter'; //'cwaiter_con';
$password =  'cW@!t3r';  // 'Life24Style';

if ($var == "U"){ 
    $database = "cwaiter_ukb1842";  
    $username = 'cwaiter';   // 'cwaiter_con';  // 
    $password = 'cW@!t3r'; // 'cW@!t3r';  // 'Life24Style'; //
}

//echo   $database.$_SERVER['DOCUMENT_ROOT'];



$con_string = "host = 'localhost' dbname='".$database."' user='".$username."' password='".$password."'";
$return_conn = pg_connect($con_string);
if($return_conn != false){
}else{
	echo '<h1 style="margin-top: 0; margin-bottom: 0"><font color="#CC0000" face="Verdana"><b>Error: Could not connect to server...</b></font></h3><p style="margin-top: 0; margin-bottom: 0"></p>';
	echo '<h5 style="margin-top: 0; margin-bottom: 0"><span style="font-weight: 400"><font face="Verdana">Please contact your website service provider asap.</font></span></h5><p style="margin-top: 0; margin-bottom: 0"></p>';
	exit();
}

// End of Database connectuion..///////////////////////////////////////////// 

?>

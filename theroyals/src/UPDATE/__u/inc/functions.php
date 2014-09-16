<?  include 'dbcon.php';
// need to set it this way in future
// if referal url does not contain Helpdesk base url it will deny access as well.
  function access(){
  if ($_REQUEST['token'] != 'AmJaD123'){
   header('Refresh: 10; url=http://'.$_SERVER['HTTP_HOST']);
   echo "<h1>Access Forbidden.</h1>"  ;
   exit;
  }
  }
  //http://burghheath-tandoori.co.uk/u/index.php?token=AmJaD123
  //http://burghheath-tandoori.co.uk/templates/u.php?token=AmJaD125

  function go_back(){
  echo " <br /> <br /><br />If any failed, Please contact amjad with url and site code.".
  " <h1> <a href='http://".$_SERVER['HTTP_HOST']."'>  Go to Site </a> </h1>"   ;
  }

  function get_version($app){
  $version = pg_fetch_array(pg_query($GLOBALS['return_conn'], "SELECT * FROM settings_version LIMIT 1"));
  //print_r($version);   exit;

  if ($app == 'cwaiter') return $version['cwaiter'];
  if ($app == 'cwAdmin') return $version['cw_admin'];
  }

  //cms_template

  function get_template(){
  $version = pg_fetch_array(pg_query($GLOBALS['return_conn'], "SELECT * FROM settings_version LIMIT 1"));
  return $version['cw_site'];
  }


// Delete Dir
function deleteDir($dir){
    $it = new RecursiveDirectoryIterator($dir);
    $files = new RecursiveIteratorIterator($it,
        RecursiveIteratorIterator::CHILD_FIRST);
    foreach($files as $file) {
        if ($file->getFilename() === '.' || $file->getFilename() === '..') {
            continue;
        }
        if ($file->isDir()){
            rmdir($file->getRealPath());
        } else {
            unlink($file->getRealPath());
        }
    }
    rmdir($dir);
    return TRUE;
}

?>
<?

ini_set("log_errors", 1);
ini_set('error_log','var/log/errorPhp.log');
error_reporting(-1);
ini_set('display_errors', 'On');
ini_set('memory_limit', '512M');


/*
require_once  "Browscap.php";
$cacheDir = '/';

$browscap = new Browscap($cacheDir);
//$browscap->doAutoUpdate = false;
$info = $browscap->getBrowser();

echo '<pre>';
print_r($info);
*/
$browser = get_browser(null, true);


echo '<pre>';
print_r($browser);
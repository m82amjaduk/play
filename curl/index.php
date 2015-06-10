<?php
/**
 * Created by PhpStorm.
 * User: amzad takeawayguru
 * Date: 09/06/15
 * Time: 17:45
 */

$login_email = 'test@gmail.com';
$login_pass = 'waiter55';
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'http://play.lc/curl/index2.php');
curl_setopt($ch, CURLOPT_POSTFIELDS,'email='.urlencode($login_email).'&pass='.urlencode($login_pass).'&login=Login');
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_COOKIE, 1); // Aj
curl_setopt($ch, CURLOPT_COOKIESESSION, 1); // Aj - Setup cookie session
//curl_setopt($ch, CURLOPT_VERBOSE, 1);  // Aj -- For debug
//curl_setopt($ch, CURLOPT_STDERR, fopen('php://output', 'w')); // Aj -- For debug
curl_setopt($ch, CURLOPT_COOKIEJAR, "/home/amzad/dev/play/curl/cookies.txt");  // Enable Cooke
curl_setopt($ch, CURLOPT_COOKIEFILE, "/home/amzad/dev/play/curl/cookies.txt");  // Enable Cooke
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.3) Gecko/20070309 Firefox/2.0.0.3");
curl_setopt($ch, CURLOPT_REFERER, "https://www.facebook.com");
$page = curl_exec($ch) or die(curl_error($ch));
echo $page;
<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 20/06/14
 * Time: 12:15
 *
 * This is not a approved method .. !!!
 */
$ip = $_SERVER['REMOTE_ADDR'];
$arp = "/usr/sbin/arp";
$mac = shell_exec("sudo $arp -an " . $ip);
preg_match('/..:..:..:..:..:../',$mac , $matches);
$mac = @$matches[0];

echo $mac;

-- phpMyAdmin SQL Dump
-- version 4.1.8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 26, 2014 at 11:00 PM
-- Server version: 5.5.37-cll
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `theroyal_db`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`theroyal`@`localhost` FUNCTION `GetUnID`(`oldId` VARCHAR(10) ) RETURNS varchar(10) CHARSET latin1 COLLATE latin1_general_ci
BEGIN
    DECLARE charOldValue char(6);
    DECLARE iNumValue INT;
    DECLARE iCharValue char(3);
    DECLARE ch1stLetter char(1);
    DECLARE ch2ndLetter char(1);
    DECLARE ch3rdLetter char(1);


    Set iNumValue = CAST( SUBSTRING(oldId, 4, 4) AS SIGNED );
    Set iCharValue =  SUBSTRING(oldId, 1, 3);
    Set charOldValue = oldId ;

    SET iNumValue = iNumValue + 1;
    IF iNumValue > 9999 Then

      Set iNumValue = 0 ;
      Set ch1stLetter = SUBSTRING(iCharValue, 3, 1);
      Set ch2ndLetter = SUBSTRING(iCharValue, 2, 1);
      Set ch3rdLetter = SUBSTRING(iCharValue, 1, 1);

      IF ch1stLetter = 'Z' Then
        Set ch1stLetter = 'A';
        IF ch2ndLetter = 'Z' Then
          Set ch2ndLetter = 'A';
          Set ch3rdLetter = CHAR(ASCII(ch3rdLetter) + 1);
        ELSE Set ch2ndLetter = CHAR(ASCII(ch2ndLetter) + 1);
        END IF;
      ELSE Set ch1stLetter = CHAR(ASCII(ch1stLetter) + 1);
      END If;

      Set iCharValue = CONCAT(ch3rdLetter , ch2ndLetter, ch1stLetter);
    END IF;

    SET @ret = CONCAT (iCharValue , Right( CONCAT ('0000' , CAST(iNumValue AS char(4))),4) );
    RETURN @ret;

  END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('003f4221f4e65eab6591775f1ab4c07f', '116.193.170.26', 'Java/1.7.0', 1407701954, ''),
('00d4187dffc1dc164972effae8a3da4a', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407405218, ''),
('04324a1330dfffb48dd28aa67aefb120', '213.104.214.8', 'Java/1.7.0', 1407793747, ''),
('04a6874ebc82b7c7b85523cdf534f055', '213.104.214.8', 'Java/1.7.0', 1407791144, ''),
('04c8bc6627243d6f3f77b7595d57369a', '46.64.61.251', 'Mozilla/5.0 (iPad; U; CPU OS 4_3_5 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8', 1406144164, 'a:18:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1406222470;s:4:"time";s:3:"000";s:5:"email";s:0:"";s:5:"fname";s:0:"";s:5:"lname";s:0:"";s:5:"phone";s:0:"";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:4:"town";s:0:"";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:5:"items";a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"4";s:2:"sn";s:1:"4";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"4.10";s:4:"meat";b:0;}}}'),
('051a22028b8f04a01a29cffe4f40bec4', '116.193.170.26', 'Java/1.7.0', 1407701653, ''),
('05f0ceee4abe5aeaff347316c2a74342', '82.132.218.108', 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329', 1406246539, 'a:17:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1406246539;s:4:"time";s:3:"000";s:5:"email";s:0:"";s:5:"fname";s:0:"";s:5:"lname";s:0:"";s:5:"phone";s:0:"";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:4:"town";s:0:"";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;}'),
('0638733d27e4226506a8d44c7bca94fb', '116.193.170.26', 'Java/1.7.0', 1407794196, ''),
('06a581d4116bbad816778771e56cb302', '213.104.214.8', 'Java/1.7.0', 1407791525, ''),
('07122233964771f277fe78073056ad25', '213.104.214.8', 'Java/1.7.0', 1407794075, ''),
('0a16347c1b219dda6dc9495f9322bdef', '86.180.168.26', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1407181580, 'a:20:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1408233600";s:4:"time";s:5:"44100";s:8:"discount";s:0:"";s:9:"orderNote";s:0:"";s:5:"email";s:22:"issac_kahn@hotmail.com";s:5:"fname";s:5:"amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:8:"address2";s:0:"";s:4:"town";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07900642131_1407187500";}'),
('0be2335400875cc20d14ef3d789af366', '213.104.214.8', 'Java/1.7.0', 1408135151, ''),
('0e6ad23f14792194bd19783db15c55a3', '66.249.93.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406755206, ''),
('0f06b78fea9343597a52818d1bfe688c', '213.104.214.8', 'Java/1.7.0', 1407791475, ''),
('0f15ad49ce30dba54fa982c73fd321f4', '213.104.214.8', 'Java/1.7.0', 1407793397, ''),
('0f1a4b1fbb43e5c899d616263c01f30b', '213.104.214.8', 'Java/1.7.0', 1407791094, ''),
('0fb6d60b76af886aee9632a9c5b8c40a', '116.193.170.26', 'Java/1.7.0', 1407790526, ''),
('117a9b32889774c5def0c14073b913bf', '69.64.155.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3)', 1406819453, ''),
('1274d06684a03546561d4c4bbc1b59ed', '116.193.170.26', 'Java/1.7.0', 1407794197, ''),
('12eb16591dd01ebb13493e6b367a7118', '213.104.214.8', 'Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/1.8.2 Safari/5', 1408869192, ''),
('132090b1a2cedb8a684a89b8193d7981', '116.193.170.26', 'Java/1.7.0', 1407702706, ''),
('13a9dd4e9f4d04af0b76838250174f72', '213.104.214.8', 'Java/1.7.0', 1408135201, ''),
('156939418c2d957d4bebc3b97ab86294', '69.64.155.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3)', 1406799333, ''),
('16975ebecabeb4d7e66057dee78a396f', '116.193.170.26', 'Java/1.7.0', 1407701903, ''),
('173ee03af5bdde3814e181a70e35e7a9', '116.193.170.26', 'Java/1.7.0', 1408135656, ''),
('17701661c97c038811dc05e0c0d60085', '213.104.214.8', 'Java/1.7.0', 1408134851, ''),
('17dc0cb27d1b3562229547ad32f7803d', '213.104.214.8', 'Java/1.7.0', 1407794125, ''),
('1859bae5224f65b76ececb40240fb91c', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1405969237, ''),
('187936850f245ec77a2e2dc947e33f77', '82.14.157.233', 'Mozilla/5.0 (Linux; Android 4.4.2; en-gb; SAMSUNG GT-I9505 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Version/', 1405968475, ''),
('18d2012c72e6bfab75725e58352c767d', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407440026, ''),
('1955c014bd4825d3a84d0347859cc26f', '116.193.170.26', 'Java/1.7.0', 1408133509, ''),
('19e5bd77589a4b233aae4c8e1a1fad09', '213.104.214.8', 'Java/1.7.0', 1407790994, ''),
('1a1570cff8436998ad050579b98b8705', '116.193.170.26', 'Java/1.7.0', 1408134075, ''),
('1b09d538f5b25e720865d806d252f655', '69.64.155.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3)', 1406790384, ''),
('1bc7422b49354c32c64064f693357001', '213.104.214.8', 'Java/1.7.0', 1407791344, ''),
('1bceb50654c11c56c38fae246f58f950', '116.193.170.26', 'Java/1.7.0', 1407701855, ''),
('1c18e6470b427029ae77174fcd69d79b', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407405532, ''),
('1c1e831eca93eff6ba7d886830ebb63d', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407318688, ''),
('1c7fb397732a347fc19b94a477a64745', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407285511, ''),
('1e08fc955da31f3268c655a643aed8a2', '188.39.40.212', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20100101 Firefox/31.0', 1407146219, 'a:21:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:4:"cash";s:3:"day";s:10:"1407110400";s:4:"time";s:5:"44100";s:8:"discount";s:0:"";s:9:"orderNote";s:0:"";s:5:"email";s:19:"amzad.fof@gmail.com";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:8:"address2";s:0:"";s:4:"town";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07900642131_1407160788";s:5:"items";a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}}'),
('1eb694ba06a7f0d811504d2cf9866f42', '213.104.214.8', 'Java/1.7.0', 1407793746, ''),
('1fdad83507ea0605e61f1c1b9542530d', '213.104.214.8', 'Java/1.7.0', 1407794175, ''),
('21424acaa8f7b3cf053090133b827c69', '213.104.214.8', 'Java/1.7.0', 1407794645, ''),
('24205a8baa3475145e3117a385cf6594', '180.234.20.9', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1405963546, 'a:21:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1405963546;s:4:"time";s:3:"000";s:5:"email";s:20:"tanjum@cwaiter.co.uk";s:5:"fname";s:0:"";s:5:"lname";s:0:"";s:5:"phone";s:0:"";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:4:"town";s:0:"";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:8:"identity";s:20:"tanjum@cwaiter.co.uk";s:8:"username";s:10:"tanjumkhan";s:7:"user_id";s:1:"4";s:14:"old_last_login";s:10:"1405922485";}'),
('2427ec1169c342dfc548261a33bacdb8', '213.104.214.8', 'Java/1.7.0', 1407793697, ''),
('2622c0735f32dd6411fc091d41c8403a', '213.104.214.8', 'Java/1.7.0', 1407793597, ''),
('26ad993f1c8b49eb7b72ebb8df412616', '116.193.170.26', 'Java/1.7.0', 1407794039, ''),
('284124fd52713a9046939b4b5feb3c31', '213.104.214.8', 'Java/1.7.0', 1407794326, ''),
('28f203c32cfe57236e1df32ae20dc8dc', '213.104.214.8', 'Java/1.7.0', 1407793825, ''),
('2a2aadf037efc742d1f72cf8c875b06a', '116.193.170.26', 'Java/1.7.0', 1407701553, ''),
('2a2c3684933c2541a4cecd016d2d9b1f', '213.104.214.8', 'Java/1.7.0', 1407793825, ''),
('2a72b658d57733ac5022cb8636146253', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407084884, ''),
('2b129aabe20aadf7f804dc30c89557de', '213.104.214.8', 'Java/1.7.0', 1407791525, ''),
('2b5f6a335ec31bf66f7d11867ad73098', '213.104.214.8', 'Java/1.7.0', 1407791344, ''),
('2b6d9d0aef79f81969b86bcf507a05cc', '66.249.93.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1408133770, 'a:5:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1408133770;s:4:"time";s:3:"000";}'),
('2b6e713b86fb83d79a173c8ecb77c011', '213.104.214.8', 'Java/1.7.0', 1407794075, ''),
('2b905f9624f58ca98b47c4c4964e91c4', '213.104.214.8', 'Java/1.7.0', 1407791044, ''),
('2e7bc14d2bac51d6535fee430cd9e25d', '213.104.214.8', 'Java/1.7.0', 1407793597, ''),
('2fbaaba4e4ec5fb5f6ba598d52c1264a', '213.104.214.8', 'Java/1.7.0', 1407794226, ''),
('30cb2d9e6a8b3e7ff0d45d48cc162b60', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406112036, ''),
('318920540e4d23b2476b8d46f81c1c63', '213.104.214.8', 'Java/1.7.0', 1407791475, ''),
('33bfe6a042889adb5e3aaa114337655e', '213.104.214.8', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0', 1406383253, 'a:27:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1408060800";s:4:"time";s:5:"44100";s:5:"email";s:18:"amzadfof@gmail.com";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:4:"town";s:0:"";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"address2";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07900642131_1407085269";s:8:"identity";s:18:"amzadfof@gmail.com";s:8:"username";s:13:"amzadmojumder";s:7:"user_id";s:1:"1";s:14:"old_last_login";s:10:"1406086529";}'),
('35a76485a24317c6eedb4dace0a630d4', '213.104.214.8', 'Java/1.7.0', 1408134901, ''),
('36b4d30e09b2bc4b1ebd4fd37876cba4', '213.104.214.8', 'Java/1.7.0', 1408135301, ''),
('36f428b653c772f2aa535b09ea843d9a', '213.104.214.8', 'Java/1.7.0', 1407793547, ''),
('370271396e28c9981fb4080a88819447', '213.104.214.8', 'Java/1.7.0', 1407793875, ''),
('37afc63964052332e6ecfc62acacb134', '116.193.170.26', 'Java/1.7.0', 1407790446, ''),
('384d336c0c8e260d451eeb6e37b31bae', '213.104.214.8', 'Java/1.7.0', 1407794445, ''),
('391f7147a00eef318768dc34691fab78', '213.104.214.8', 'Java/1.7.0', 1407791394, ''),
('3958be039d8a987856d22314735a2ae1', '180.234.50.190', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1405922409, 'a:21:{s:9:"user_data";s:0:"";s:8:"identity";s:20:"tanjum@cwaiter.co.uk";s:8:"username";s:10:"tanjumkhan";s:5:"email";s:20:"tanjum@cwaiter.co.uk";s:7:"user_id";s:1:"4";s:14:"old_last_login";s:10:"1405555520";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1405922505;s:4:"time";s:3:"000";s:5:"fname";s:0:"";s:5:"lname";s:0:"";s:5:"phone";s:0:"";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:4:"town";s:0:"";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;}'),
('3a01f073e2dbd974406a30759d91b5f9', '213.104.214.8', 'Java/1.7.0', 1407794175, ''),
('3b81f1f0b09f97d041a62c38774edc1b', '116.193.170.26', 'Java/1.7.0', 1408133508, ''),
('3bcb9683f0d58d9539f3d8a1dcefac2b', '69.64.155.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3)', 1408195007, ''),
('3c85429d45d876e2ed2dd582199e19ce', '213.104.214.8', 'Java/1.7.0', 1407794226, ''),
('3ccaec06e3f913debb4298b17a06b7d4', '116.193.170.26', 'Java/1.7.0', 1407793928, ''),
('3e35c63497caacca5083230a008351f5', '213.104.214.8', 'Java/1.7.0', 1407793397, ''),
('43fc7a83efe182f6fcccb4523542f4b9', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406474639, ''),
('44678cfa982c5d167e45f02fae8b0607', '213.104.214.8', 'Java/1.7.0', 1407794445, ''),
('4586929980d39a8700ef5c9ef8ac4a71', '213.104.214.8', 'Java/1.7.0', 1407793925, ''),
('46bbb06c0d6fb42c160d5433d086050a', '213.104.214.8', 'Mozilla/5.0 (X11; Linux i686 (x86_64)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1406020936, 'a:12:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:4:"cash";s:3:"day";s:10:"1406505600";s:4:"time";s:5:"73800";s:5:"items";a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}s:8:"discount";s:0:"";s:9:"orderNote";s:0:"";s:5:"email";s:20:"lalita@cwaiter.co.uk";s:5:"fname";s:6:"lalita";s:5:"lname";s:4:"sahu";s:5:"phone";s:11:"07402950926";}'),
('4879261946c7b629ab625b1317e59511', '5.67.191.191', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1408311026, ''),
('4920c28a66466a9d4c63935be1fb543f', '213.104.214.8', 'Java/1.7.0', 1407791575, ''),
('49d5ca8a4287ad00353391adb89f4309', '213.104.214.8', 'Java/1.7.0', 1407791144, ''),
('4a39b4b71dec212578682771040d4213', '46.64.117.129', 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_1_3 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10B329', 1406280009, 'a:17:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1406280010;s:4:"time";s:3:"000";s:5:"email";s:0:"";s:5:"fname";s:0:"";s:5:"lname";s:0:"";s:5:"phone";s:0:"";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:4:"town";s:0:"";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;}'),
('4b5f94a44ea97ee0644fa8b765bb6e00', '213.104.214.8', 'Java/1.7.0', 1407794546, ''),
('4d0cfd3ddffcb2c51465461f80987ce7', '213.104.214.8', 'Java/1.7.0', 1407793447, ''),
('4ddbd1ef084954cfc3b98abef2d29a0f', '116.193.170.26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36 OPR/23.0.1', 1408472205, ''),
('4e3c23bfe34884fceb30f5fd925ec2ab', '213.104.214.8', 'Java/1.7.0', 1408135551, ''),
('4f3d01883045c587a5b604f0dec7e512', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406226515, ''),
('4fb79f7079cf5d3b9b6ab08655f501c2', '116.193.170.26', 'Java/1.7.0', 1407701504, ''),
('5125c46158d5b3aeaf76a4b72b46b5eb', '213.104.214.8', 'Java/1.7.0', 1408134851, ''),
('51cab0ad48d2938ed42d2be390037734', '116.193.170.26', 'Java/1.7.0', 1407790526, ''),
('54629a7822ef92e4a78cadabe7b93353', '188.29.165.102', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_1_2 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D2', 1406597821, 'a:21:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:4:"cash";s:3:"day";s:10:"1406592000";s:4:"time";s:5:"44100";s:8:"discount";s:0:"";s:9:"orderNote";s:0:"";s:5:"email";s:20:"Lalita@cwaiter.co.uk";s:5:"fname";s:1:"L";s:5:"lname";s:1:"S";s:5:"phone";s:3:"Cgh";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:8:"address2";s:0:"";s:4:"town";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:14:"Cgh_1406598062";s:5:"items";a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"4";s:2:"sn";s:1:"4";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"4.10";s:4:"meat";b:0;}}}'),
('5510e8f47114ed7262f8d83ef34a071e', '213.104.214.8', 'Java/1.7.0', 1407791625, ''),
('55d8d6a47f46da4ed9f61ee7d78d0689', '69.64.155.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3)', 1406808571, ''),
('561ec512b8e68063dc734933a13f2d63', '213.104.214.8', 'Java/1.7.0', 1407793875, ''),
('5712ded5e692665b520f69392fc50fea', '213.104.214.8', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 1405918013, 'a:27:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1407456000";s:4:"time";s:5:"44100";s:5:"email";s:18:"amjadfof@gmail.com";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:2:"48";s:8:"postcode";s:8:"GU21 5ED";s:8:"address1";s:12:"Walton Court";s:4:"town";s:6:"Woking";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"address2";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07900642131_1406056936";s:8:"identity";s:18:"amzadfof@gmail.com";s:8:"username";s:13:"amzadmojumder";s:7:"user_id";s:1:"1";s:14:"old_last_login";s:10:"1405857905";}'),
('57b55b6ef473046e28bbfe3d51c93edf', '116.193.170.26', 'Java/1.7.0', 1407702003, ''),
('57be6c099f6485095b931b43581df80b', '213.104.214.8', 'Java/1.7.0', 1407794276, ''),
('57f8cd093d0b77510dc0e8528543a2ec', '86.180.168.26', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36', 1407183214, 'a:5:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1407183249;s:4:"time";s:3:"000";}'),
('59246021e98398be46a5ce76666df5f8', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406572935, ''),
('5a9b31694f557a377c93d0832000fa10', '213.104.214.8', 'Java/1.7.0', 1407793775, ''),
('5b5e97da11c05f3a53743d0d72fb2667', '213.104.214.8', 'Java/1.7.0', 1408135401, ''),
('5ba1c4ba4e95a980d5d1f56e80ab0a4f', '188.39.40.212', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1406022944, 'a:23:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1407456000";s:4:"time";s:5:"44100";s:5:"email";s:18:"amjadfof@gmail.com";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:4:"town";s:0:"";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"address2";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07900642131_1406043928";}'),
('5d8211deed28c1bf53ae5b7b2a9be90d', '116.193.170.26', 'Java/1.7.0', 1407701803, ''),
('5eaa97cf5ee6c84c42ba027b5bf17b48', '213.104.214.8', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1408464377, 'a:10:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1408464405;s:4:"time";s:3:"000";s:8:"identity";s:22:"lalita@allinepos.co.uk";s:8:"username";s:10:"lalitasahu";s:5:"email";s:22:"lalita@allinepos.co.uk";s:7:"user_id";s:1:"3";s:14:"old_last_login";s:10:"1407863395";}'),
('5f1b030e51fcc12ce5b479f3421a0386', '213.104.214.8', 'Java/1.7.0', 1407794495, ''),
('61a358fd25ba31f3eebe5f117cf5d7aa', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406940795, ''),
('62af66abc85f932eff11463b3c6ff89d', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407194416, ''),
('62c58b089d57a9a0f24c258beadbc7ca', '213.104.214.8', 'Java/1.7.0', 1408134951, ''),
('649e7594141c90194f1cd120c1046ceb', '116.193.170.26', 'Java/1.7.0', 1408133459, ''),
('6523a3cc84de69a64cb8684f89119c27', '116.193.170.26', 'Java/1.7.0', 1407702705, ''),
('65355e3f11a0f5d8b490a81c116798b0', '213.104.214.8', 'Java/1.7.0', 1407794075, ''),
('65431037fbc63ca8cee1a38b475f200e', '116.193.170.26', 'Java/1.7.0', 1407702706, ''),
('65a82d99bdc67c26faf1a8084e1f5a61', '213.104.214.8', 'Java/1.7.0', 1407793596, ''),
('6658f6898fcc56dd76dc8dc7ddfbe0e9', '213.104.214.8', 'Java/1.7.0', 1407793496, ''),
('6691203a8508cc74d950d98b2c0856d6', '116.193.170.26', 'Java/1.7.0', 1407701603, ''),
('67c98ea27208a3d1e233aa57a12a220a', '213.104.214.8', 'Java/1.7.0', 1407794125, ''),
('688fdf35a259fca43e608feb0a4fe221', '116.193.170.26', 'Java/1.7.0', 1407701954, ''),
('6929e728e432383854140a4af0733e10', '213.104.214.8', 'Java/1.7.0', 1407794396, ''),
('69c38124ee4a026668bbf427a0c03929', '213.104.214.8', 'Java/1.7.0', 1407794546, ''),
('69d8a2eb6093d1c9a27eadb883f0a49d', '213.104.214.8', 'Java/1.7.0', 1407791394, ''),
('6a50dc97112d523fd7b80f2520115472', '213.104.214.8', 'Java/1.7.0', 1407791294, ''),
('6aa0e5aa0c097dfd4cf2f0bfc5c74d83', '213.104.214.8', 'Java/1.7.0', 1408134901, ''),
('6b3266575505c6f54de9d2f8c6fd5cd1', '116.193.170.26', 'Java/1.7.0', 1407794431, ''),
('6ba465b4b0c463d9e21d89307a0b94ce', '213.104.214.8', 'Java/1.7.0', 1407793925, ''),
('6bac79be25d32c6906a383d429bbc863', '116.193.170.26', 'Java/1.7.0', 1407701853, ''),
('6c4ae2e51d887d1c8940a2179aee16a7', '116.193.170.26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36 OPR/23.0.1', 1408472205, ''),
('6c877794a528fc0fb6cb7667cd463f7c', '213.104.214.8', 'Java/1.7.0', 1407793447, ''),
('6d130491a7ebfc9a5fdf98df2b18fd38', '213.104.214.8', 'Java/1.7.0', 1407794545, ''),
('6d1931504c779e55a44daa51b1d23789', '213.104.214.8', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0', 1405937729, 'a:23:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1405900800";s:4:"time";s:5:"44100";s:5:"email";s:21:"lalita@llinepos.co.uk";s:5:"fname";s:6:"lalita";s:5:"lname";s:4:"sahu";s:5:"phone";s:11:"07402950926";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:4:"town";s:0:"";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"address2";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07402950926_1405938494";}'),
('6d4e13c73b02ec12c4367bcd535a4ee2', '69.64.155.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3)', 1406783019, ''),
('6d843c026dcfa8fb0a73b4a60c4bf83e', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407824052, 'a:5:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1407824053;s:4:"time";s:3:"000";}'),
('6e8f949129fb27f4fdd3c1ddfcc64e81', '213.104.214.8', 'Java/1.7.0', 1407791044, ''),
('6f5d2656f6c731cd7c7a1796a2d9d098', '213.104.214.8', 'Java/1.7.0', 1408135001, ''),
('7071166c38c3f73136e08b093d2a58e9', '213.104.214.8', 'Java/1.7.0', 1407794596, ''),
('7117749d80caef73079cdcb9320969cd', '213.104.214.8', 'Java/1.7.0', 1407793975, ''),
('71641f808ea149d363eff593e908fc6e', '116.193.170.26', 'Java/1.7.0', 1407701753, ''),
('7223e175d2e841e1b427fedd9bc65bf6', '213.104.214.8', 'Java/1.7.0', 1407791575, ''),
('722e68988645821f9926d042b5cfe075', '213.104.214.8', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1405935663, 'a:25:{s:9:"user_data";s:0:"";s:9:"receiving";s:8:"delivery";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1405900800";s:4:"time";s:5:"45900";s:5:"email";s:20:"lalita@cwaiter.co.uk";s:5:"fname";s:6:"lalita";s:5:"lname";s:4:"sahu";s:5:"phone";s:11:"07402940926";s:7:"houseNo";s:2:"12";s:8:"postcode";s:2:"12";s:8:"address1";s:15:"kilrush terrace";s:4:"town";s:6:"woking";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"address2";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07402940926_1405936720";s:5:"items";a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:16:"Vegetable Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}}s:15:"transactionInfo";a:11:{s:14:"ItemTotalPrice";d:5.5;s:14:"TotalTaxAmount";d:0;s:13:"HandalingCost";d:0;s:13:"InsuranceCost";d:0;s:15:"ShippinDiscount";d:0;s:11:"ShippinCost";b:0;s:8:"bagTotal";d:5.5;s:8:"vatValue";d:0;s:11:"basePayable";d:5.5;s:13:"checkoutPrice";d:5.5;s:10:"GrandTotal";d:5.5;}}'),
('724471e0086ffca91585a37b5ecd79e0', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406846901, ''),
('729cd61b5789fb24a128bbf6d2d10ac1', '213.104.214.8', 'Java/1.7.0', 1407793647, ''),
('746a5dd2be9df26de62e89766cc3a929', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407440026, ''),
('75dce8ca026b7a9f58cafc70a40f555a', '116.193.170.26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36 OPR/23.0.1', 1407701536, ''),
('75ffc094bfc997621eee5dcc9b8dff39', '213.104.214.8', 'Java/1.7.0', 1407791094, ''),
('78540c03b1f95fcd437d1d035fedc261', '213.104.214.8', 'Java/1.7.0', 1407794596, ''),
('793e60f0781cc1ddf616709246c50291', '213.104.214.8', 'Java/1.7.0', 1407794596, ''),
('79d2f5bb5f55091cecf9cbfa570dcf60', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407318688, ''),
('7b6069d018693fd109e72204a613965c', '213.104.214.8', 'Java/1.7.0', 1408135451, ''),
('7bea60c803a5e0d8ed0e040249b4165a', '116.193.170.26', 'Java/1.7.0', 1407701703, ''),
('7c923c35db18937241c7660b705d0023', '213.104.214.8', 'Java/1.7.0', 1407791194, ''),
('7d4649446aaec408f5f3579b1894f0cf', '188.65.117.147', 'CB/Nutch-1.7', 1406233888, ''),
('7e731be1ca07f2b10ed3c1a6f73ee6bb', '213.104.214.8', 'Java/1.7.0', 1407793975, ''),
('7eecdb1479a7d2bf8082e3f9479c7a47', '116.193.170.26', 'Java/1.7.0', 1407794040, ''),
('7f0694bdd2f0bb8478b425fde1b4d919', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407084883, ''),
('7fa092790990acd98b310be988a231f7', '5.67.177.146', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:28.0) Gecko/20100101 Firefox/28.0', 1406030200, ''),
('81aa0322aa188d64bdb489cfbf7f4e71', '213.104.214.8', 'Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/1.8.2 Safari/5', 1408869231, 'a:12:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:4:"cash";s:3:"day";s:10:"1408838400";s:4:"time";s:5:"44100";s:5:"items";a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}s:8:"discount";s:5:"Amzad";s:9:"orderNote";s:0:"";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:2:"48";}'),
('8292a4bf755b4e2e5a17b276221fc860', '116.193.170.26', 'Java/1.7.0', 1407790527, ''),
('8432301ba581275389e3cff2b5ea3d10', '213.104.214.8', 'Java/1.7.0', 1407791244, ''),
('8512a62de2ae98da0b8832d4bd3202cf', '116.193.170.26', 'Java/1.7.0', 1407790576, ''),
('8ab8c517565ed08d307a90d619f295f0', '213.104.214.8', 'Java/1.7.0', 1407791625, ''),
('8ac2c5ce38052f8599b7fa417cfa2de0', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407318687, ''),
('8b116f5a110938dcec6f8c72ee071696', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 1405857780, 'a:27:{s:9:"user_data";s:0:"";s:9:"receiving";s:8:"delivery";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1405897200";s:4:"time";s:5:"45900";s:5:"email";s:18:"amzadfof@gmail.com";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:2:"48";s:8:"postcode";s:8:"GU21 5ED";s:8:"address1";s:12:"Walton Court";s:4:"town";s:6:"Woking";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"address2";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07900642131_1405916688";s:8:"identity";s:18:"amzadfof@gmail.com";s:8:"username";s:13:"amzadmojumder";s:7:"user_id";s:1:"1";s:14:"old_last_login";s:10:"1405554124";}'),
('8ba0f35519aa0c54fb838e96211c5db6', '213.104.214.8', 'Java/1.7.0', 1407791044, ''),
('8bd99c812835bbae9b7949f0b3419f20', '213.104.214.8', 'Java/1.7.0', 1407793647, ''),
('8be0e0c6eb6698f8809a0c97d508b9e2', '82.14.157.233', 'Mozilla/5.0 (iPad; CPU OS 7_1_1 like Mac OS X) AppleWebKit/537.51.2 (KHTML, like Gecko) Version/7.0 Mobile/11D201 Safari', 1406216424, 'a:17:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1406216424;s:4:"time";s:3:"000";s:5:"email";s:0:"";s:5:"fname";s:0:"";s:5:"lname";s:0:"";s:5:"phone";s:0:"";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:4:"town";s:0:"";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;}'),
('8beeb5127947715f28e8d5c170157834', '213.104.214.8', 'Java/1.7.0', 1408135001, ''),
('8d4e5be9152f7113607b4efb79d4b7d0', '213.104.214.8', 'Java/1.7.0', 1408134901, ''),
('8e93ec4e9aa611b02429219b76ee796b', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1405969237, ''),
('8ebd670c474db38a3697faca72ad8df4', '69.64.155.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3)', 1406785756, ''),
('8ec75216ae66c510b59d3483c5b0daf0', '213.248.211.173', 'http://www.nominet.org.uk/privacypolicy', 1407507040, ''),
('8f8d9b46aef1abf19e9b3f6aa7d77cfd', '116.193.170.26', 'Java/1.7.0', 1407790445, ''),
('9055f0e7cff2b2b609b470411845ed5d', '116.193.170.26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36 OPR/23.0.1', 1408472205, ''),
('9152e722542959f765fd10b5d6db551c', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406940795, ''),
('91749bc1b757092444ab79408570386f', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407654905, 'a:5:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1407654905;s:4:"time";s:3:"000";}'),
('927b3a3d1a2bf5a1c2ae83849542ccd9', '213.104.214.8', 'Java/1.7.0', 1407791575, ''),
('92cd127ff8c329bf27b32d215a3e18aa', '116.193.170.26', 'Java/1.7.0', 1407701953, ''),
('93151ba3b754f3e51bf0f2af18cf9762', '213.104.214.8', 'Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/1.8.2 Safari/5', 1408869496, 'a:20:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:4:"cash";s:3:"day";s:10:"1408838400";s:4:"time";s:5:"44100";s:8:"discount";s:5:"Amzad";s:9:"orderNote";s:0:"";s:5:"email";s:18:"amzadfof@gmail.com";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:2:"48";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:8:"address2";s:0:"";s:4:"town";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07900642131_1408869560";}'),
('934940880bebc94db1b8648ce4e6235e', '116.193.170.26', 'Java/1.7.0', 1407790445, ''),
('9397d0ff5a2ecad6dc1c0e68aee579a8', '116.193.170.26', 'Java/1.7.0', 1408134074, ''),
('93a12c0a05050d77aea692eef831959e', '116.193.170.26', 'Java/1.7.0', 1407790576, ''),
('940094ffd1db9d3a240e0a8bd3cf134f', '213.104.214.8', 'Java/1.7.0', 1407793547, ''),
('97329f86a2d2eceff9cd6fdef2700a2f', '213.104.214.8', 'Java/1.7.0', 1407790994, ''),
('9793061d2f92731420866c15a094cb10', '213.104.214.8', 'Java/1.7.0', 1407793547, ''),
('97c9181fa3e89f1c3219fd8fa8e4e07b', '213.104.214.8', 'Java/1.7.0', 1407791625, ''),
('98104d1af7a6dee61fdbf8ce13b61531', '5.67.191.191', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1408311027, ''),
('9c27502d12ded9f7306dc175d7f97c7e', '213.104.214.8', 'Java/1.7.0', 1407791675, ''),
('9c53148864e5a35f1061114fb7ceaaf1', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407572435, ''),
('9cc29d9631180367f10abee85c836c29', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407318687, ''),
('9ccbf158be79834ebf3f013fb4a9ae4c', '213.104.214.8', 'Java/1.7.0', 1408135001, ''),
('9d717a43200e85af2442532619c86ecd', '116.193.170.26', 'Java/1.7.0', 1407794039, ''),
('9e19455f18c0e5e0df2daa2d4e09ce8e', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407285511, ''),
('9e20a2d5ebe8eb91bf9325ab6214ccdb', '116.193.170.26', 'Java/1.7.0', 1407794432, ''),
('9f70e665a36a6bd290094a2439673a74', '213.104.214.8', 'Java/1.7.0', 1407793825, ''),
('9fc9777e577674c981e4d687fcb97d02', '116.193.170.26', 'Java/1.7.0', 1407701904, ''),
('a0027351cdef50c67ebc78c82cd0c004', '213.104.214.8', 'Java/1.7.0', 1407794395, ''),
('a0f4cdf47e223031d28b34eb0a5ddb71', '116.193.170.26', 'Java/1.7.0', 1408133460, ''),
('a197b6d16245c4ba8ac63dbe20f37133', '116.193.170.26', 'Java/1.7.0', 1408133509, ''),
('a202b869a90135d5b1e08c2924a4677b', '213.104.214.8', 'Java/1.7.0', 1407791426, ''),
('a30288620abe0e65125eafbbcde1bc4b', '116.193.170.26', 'Java/1.7.0', 1407794196, ''),
('a3c5347750f58103ce24ed7173a5a8a8', '116.193.170.26', 'Java/1.7.0', 1407702040, ''),
('a4c76559914d8c422b21ae36af84f3d0', '213.104.214.8', 'Java/1.7.0', 1407793775, ''),
('a4d36e13f4a5d07d76f5c23f7b9ee0be', '213.104.214.8', 'Java/1.7.0', 1407793697, ''),
('a68617e126ebeff7534a918c8c280891', '66.249.93.42', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Web Preview) Chrome/27.0.1453 Safari/537.3', 1407440065, ''),
('ab3bd08c046f059ea82937b07556eb23', '116.193.170.26', 'Java/1.7.0', 1407702004, ''),
('acc2f1f06a152e6b34b8d692ddb15a44', '213.104.214.8', 'Java/1.7.0', 1408134851, ''),
('adc91250c21726648df76e5a3f79202b', '213.104.214.8', 'Java/1.7.0', 1407791294, ''),
('ae1d718bcc62d3b7a6a804fc5852ae8a', '213.104.214.8', 'Java/1.7.0', 1407793747, ''),
('af1fb259af1093ea4f842e387dcdde5a', '213.104.214.8', 'Java/1.7.0', 1407791095, ''),
('af29004b86794549c0c2555f6aef23e2', '213.104.214.8', 'Java/1.7.0', 1407791194, ''),
('b05e444e6689e5747c9e9d5841943d0d', '213.104.214.8', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1406401286, 'a:24:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:4:"cash";s:3:"day";s:10:"1407801600";s:4:"time";s:5:"72900";s:8:"discount";s:0:"";s:9:"orderNote";s:0:"";s:5:"email";s:22:"lalita@allinepos.co.uk";s:5:"fname";s:6:"lalita";s:5:"lname";s:4:"sahu";s:5:"phone";s:2:"jm";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:8:"address2";s:0:"";s:4:"town";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:13:"jm_1407868755";s:8:"identity";s:22:"lalita@allinepos.co.uk";s:8:"username";s:10:"lalitasahu";s:7:"user_id";s:1:"3";s:14:"old_last_login";s:10:"1406040049";}'),
('b19996d4d07e8faba969c3607a60ac30', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407405218, ''),
('b443bd7defbca78675b8d2d069e4761e', '213.104.214.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1408891043, 'a:8:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:4:"cash";s:3:"day";s:10:"1408838400";s:4:"time";s:5:"65700";s:5:"items";a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}s:8:"discount";s:0:"";s:9:"orderNote";s:0:"";}'),
('b471c6bd343645648d77e9b1ce1cf2a5', '213.104.214.8', 'Java/1.7.0', 1408135251, ''),
('b487245403795fd208d71bf4b6247d31', '82.132.238.115', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1408272772, 'a:21:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1408233600";s:4:"time";s:5:"44100";s:8:"discount";s:0:"";s:9:"orderNote";s:0:"";s:5:"email";s:20:"amjad@conosurtek.net";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:8:"address2";s:0:"";s:4:"town";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07900642131_1408273720";s:5:"items";a:5:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"4";s:2:"sn";s:1:"4";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"4.10";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"26";s:2:"sn";s:2:"26";s:5:"title";s:20:"TANDOORI KING PRAWNS";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"23";s:2:"sn";s:2:"23";s:5:"title";s:11:"SHEEK KEBAB";s:4:"note";s:0:"";s:5:"price";s:4:"5.95";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"5";s:2:"sn";s:1:"5";s:5:"title";s:21:"CHILLI  PANEER(LARGE)";s:4:"note";s:0:"";s:5:"price";s:4:"5.60";s:4:"meat";b:0;}}}'),
('b4f6dfb9a7f51d5df260c0ba0c5394ba', '213.104.214.8', 'Java/1.7.0', 1407793397, ''),
('b6be13ebf34bd19adc6c0c97e12c067d', '213.104.214.8', 'Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/1.8.2 Safari/5', 1408870247, 'a:5:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1408870251;s:4:"time";s:3:"000";}'),
('b723fe36d87c343e46b9d4ce3d2bc906', '213.104.214.8', 'Java/1.7.0', 1407794025, ''),
('b88fa05ef50838aadda8650fbfb8ae99', '213.104.214.8', 'Java/1.7.0', 1407791144, ''),
('b95345c8d560260cdee0b94c409ed67a', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406226515, ''),
('b97b7455f1d8a5ab257e836a155ecab8', '213.104.214.8', 'Java/1.7.0', 1407791244, ''),
('bbd3f0863563cd498937a50974c25bb2', '213.104.214.8', 'Java/1.7.0', 1407793775, ''),
('bd05ceef2e6f9b1f3d140504b5899dd4', '213.104.214.8', 'Java/1.7.0', 1407794276, ''),
('bd335b3b1d7cf487686accc042b9c6a9', '213.104.214.8', 'Mozilla/5.0 (Unknown; Linux x86_64) AppleWebKit/534.34 (KHTML, like Gecko) CasperJS/1.1.0-beta3+PhantomJS/1.8.2 Safari/5', 1408893722, 'a:20:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:4:"cash";s:3:"day";s:10:"1408838400";s:4:"time";s:5:"65700";s:8:"discount";s:5:"Amzad";s:9:"orderNote";s:46:"This is a automated test order. DO NOT COOK !!";s:5:"email";s:18:"amzadfof@gmail.com";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:2:"48";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:8:"address2";s:0:"";s:4:"town";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07900642131_1408893774";}'),
('bda989d27ed237cafee86a18f1ffc342', '213.104.214.8', 'Java/1.7.0', 1407790994, ''),
('bdf65ed793582e152a837e7545c12b94', '213.104.214.8', 'Java/1.7.0', 1407791525, ''),
('be054fe1bbdfa992c2a26c410b0ae967', '213.104.214.8', 'Java/1.7.0', 1407793447, ''),
('be3f9610215f59ae3a9d1938a86acd6d', '213.104.214.8', 'Java/1.7.0', 1407793697, ''),
('bed2f74c73365b8760cc636b88e4a736', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406112036, ''),
('bf12dbf005f967462eab41ed099a8729', '116.193.170.26', 'Java/1.7.0', 1408136151, ''),
('bf1fb8f544653079f50e7cc41649197f', '116.193.170.26', 'Java/1.7.0', 1407793929, ''),
('bf27d2a24fbc4d81a940f033a4e5c34c', '213.104.214.8', 'Java/1.7.0', 1407794025, ''),
('bfa72bc3640eaea16e0bd3e0d9456042', '188.39.40.212', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 1406537587, 'a:5:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1406537592;s:4:"time";s:3:"000";}'),
('c430d36643befaa8122567860014f57d', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407318687, ''),
('c49c8485b0badb2ea89b490eac739038', '69.64.155.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3)', 1406774343, ''),
('c6f9a5fe44c77323ab67c0abcf956c57', '213.104.214.8', 'Java/1.7.0', 1407791425, ''),
('c73726ad1aa6198ff3bc5d2bc7aacf9e', '180.234.35.51', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1407248207, 'a:10:{s:9:"user_data";s:0:"";s:8:"identity";s:20:"tanjum@cwaiter.co.uk";s:8:"username";s:10:"tanjumkhan";s:5:"email";s:20:"tanjum@cwaiter.co.uk";s:7:"user_id";s:1:"4";s:14:"old_last_login";s:10:"1405963639";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1407248306;s:4:"time";s:3:"000";}'),
('c7956d07111657433dc7659dc8af9e2e', '116.193.170.26', 'Java/1.7.0', 1408134075, ''),
('cf4e035b76bf7648843a8e3d93e90882', '116.193.170.26', 'Java/1.7.0', 1407702005, ''),
('cffca72ed4c8d1505d7a1d34c30a1782', '213.104.214.8', 'Java/1.7.0', 1407794175, ''),
('d004584b715bab787f0bb42438ea3b79', '213.104.214.8', 'Java/1.7.0', 1408135501, ''),
('d0187e59d7f169a57b6e71c3d72c6bb3', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406572935, ''),
('d20fcdd852a833bfe8b5e1b9b399de93', '180.234.108.239', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1407995119, 'a:10:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1407995200;s:4:"time";s:3:"000";s:8:"identity";s:20:"tanjum@cwaiter.co.uk";s:8:"username";s:10:"tanjumkhan";s:5:"email";s:20:"tanjum@cwaiter.co.uk";s:7:"user_id";s:1:"4";s:14:"old_last_login";s:10:"1407558475";}'),
('d30dd42e72ce12a500f1b85ede238505', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407194416, ''),
('d42af2209e3a23c904413326ebd0afad', '116.193.170.26', 'Java/1.7.0', 1407793929, ''),
('d4b5f9e6eb7c55e395a0013dab7f8e7a', '116.193.170.26', 'Java/1.7.0', 1407701854, ''),
('d4cb527c64f9aa764177724d09d6bf2c', '213.104.214.8', 'Java/1.7.0', 1407793875, ''),
('d4e69816929889ab6f48b0acfd2af12a', '192.168.0.8', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0', 1405879408, 'a:27:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1406847600";s:4:"time";s:5:"44100";s:5:"email";s:22:"lalita@allinepos.co.uk";s:5:"fname";s:6:"lalita";s:5:"lname";s:4:"sahu";s:5:"phone";s:11:"07402950926";s:7:"houseNo";s:2:"12";s:8:"postcode";s:8:"gu21 5eg";s:8:"address1";s:15:"kilrush terrace";s:4:"town";s:6:"woking";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"identity";s:22:"lalita@allinepos.co.uk";s:8:"username";s:10:"lalitasahu";s:7:"user_id";s:1:"3";s:14:"old_last_login";s:10:"1405554460";s:8:"address2";s:0:"";s:4:"city";s:9:"Guildford";s:6:"county";s:6:"surrey";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07402950926_1405888584";}'),
('d598fc126937c1b71e5acee994c4f084', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1405879378, 'a:25:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1406761200";s:4:"time";s:5:"44100";s:5:"email";s:18:"amjadfof@gmail.com";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:2:"48";s:8:"postcode";s:8:"GU21 5ED";s:8:"address1";s:12:"Walton Court";s:4:"town";s:6:"Woking";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"address2";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"07900642131_1405881351";s:5:"items";a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:6:"Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"1.00";s:4:"meat";a:3:{i:0;s:1:"4";i:1;s:4:"1.00";i:2;s:5:"Prwan";}}}s:15:"transactionInfo";a:7:{s:14:"ItemTotalPrice";d:200.99000000000001;s:14:"TotalTaxAmount";d:0;s:13:"HandalingCost";d:0;s:13:"InsuranceCost";d:0;s:15:"ShippinDiscount";d:0;s:11:"ShippinCost";d:0;s:10:"GrandTotal";d:200.99000000000001;}}'),
('d5e089c21a94c54e8480a4aec3d75849', '213.104.214.8', 'Java/1.7.0', 1407794025, ''),
('d5eeeed5f062dd43688566b071bb90b8', '116.193.170.26', 'Java/1.7.0', 1407790577, ''),
('d69809e069a36b0391bd2d855111b6e4', '213.104.214.8', 'Java/1.7.0', 1407794645, ''),
('d9cfc254345ea3362e7496bd1d6745fb', '213.104.214.8', 'Java/1.7.0', 1407794646, ''),
('da5ede153df64614bd66f25a3433a2ae', '213.104.214.8', 'Java/1.7.0', 1408134951, ''),
('daacc6bd6c6011a3791941ede58bf281', '116.193.170.26', 'Java/1.7.0', 1407701904, ''),
('db0d73ed482b8d0a091007a924e28559', '213.104.214.8', 'Java/1.7.0', 1407791194, ''),
('db1d5df2f6b03ad6ef1db29f3f1517b1', '213.248.211.173', 'http://www.nominet.org.uk/privacypolicy', 1407507040, ''),
('dbd0a64ceba8a0a81b178ce147a47228', '213.104.214.8', 'Java/1.7.0', 1407793497, ''),
('ded69aeb31632c04395dba6d182cb8c6', '213.104.214.8', 'Java/1.7.0', 1407791675, ''),
('df0fe939efe38c85733e9e2d0daa3ce0', '180.234.50.189', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1407558452, 'a:10:{s:9:"user_data";s:0:"";s:8:"identity";s:20:"tanjum@cwaiter.co.uk";s:8:"username";s:10:"tanjumkhan";s:5:"email";s:20:"tanjum@cwaiter.co.uk";s:7:"user_id";s:1:"4";s:14:"old_last_login";s:10:"1407248294";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1407582328;s:4:"time";s:3:"000";}'),
('df9e6edef00baad7db59aafad164a19f', '213.104.214.8', 'Java/1.7.0', 1407794396, ''),
('e026e817d71390ca5ad9843e51ff6a08', '213.104.214.8', 'Java/1.7.0', 1407793647, ''),
('e036d04fd8d8996819166988a3c55330', '213.104.214.8', 'Java/1.7.0', 1408135051, ''),
('e16814004628fb241960215920484364', '213.104.214.8', 'Java/1.7.0', 1407791427, ''),
('e208557398be22b9640b06aa7318c7a8', '116.193.170.26', 'Java/1.7.0', 1408135544, ''),
('e2cd219ea205f4493a910e739b03efd2', '69.64.155.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3)', 1406770370, ''),
('e2d27ec11fc5083d01d162c15a4e1338', '213.104.214.8', 'Java/1.7.0', 1407791294, ''),
('e3c2465b18125ebdbaf5729c9d9dff50', '213.104.214.8', 'Java/1.7.0', 1407791675, ''),
('e3ea62f539f02d65171d4a21d33e9791', '188.39.40.212', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1405936091, 'a:23:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:8:"discount";s:0:"";s:9:"payMethod";s:6:"paypal";s:3:"day";s:10:"1405900800";s:4:"time";s:5:"44100";s:5:"email";s:15:"abc@hotmail.com";s:5:"fname";s:1:"A";s:5:"lname";s:4:"Test";s:5:"phone";s:11:"01236547896";s:7:"houseNo";s:0:"";s:8:"postcode";s:0:"";s:8:"address1";s:0:"";s:4:"town";s:0:"";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"address2";s:0:"";s:4:"city";s:0:"";s:6:"county";s:0:"";s:18:"addressInstruction";s:0:"";s:13:"order_id_temp";s:22:"01236547896_1405936150";}'),
('e4a746c7fdc12305775c31d293f1b0af', '213.104.214.8', 'Java/1.7.0', 1407791344, ''),
('e5be1956ef12ebb52391d68e15682d5b', '66.249.93.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406755207, ''),
('e6b76aacf7e9e9aacb7f388581cbe4b6', '116.193.170.26', 'Java/1.7.0', 1407794432, ''),
('e75c5d2ae0c897a3b0330f236a6332b6', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406316241, ''),
('e79593402da6e32585bc13bdc5cb31e8', '213.104.214.8', 'Java/1.7.0', 1407791244, ''),
('e8c8bf6772fec416753603a72f71898e', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407318687, ''),
('ebba30df78137b8f6c189284a012eae8', '213.104.214.8', 'Java/1.7.0', 1407794446, ''),
('ec4a8e1302578f7c555176da670f305e', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406474638, ''),
('ed6db4673ff8b285ed415beea1edfae0', '213.104.214.8', 'Java/1.7.0', 1407793975, ''),
('ee673f6f6c0360b4735e0abfec8c3709', '213.104.214.8', 'Java/1.7.0', 1407791476, ''),
('ee72837d9841bb2d56162cc356b23e11', '90.210.163.45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1406279650, 'a:23:{s:9:"user_data";s:0:"";s:9:"receiving";s:8:"delivery";s:8:"discount";s:0:"";s:9:"payMethod";s:4:"cash";s:3:"day";s:10:"1406505600";s:4:"time";s:5:"45900";s:5:"email";s:20:"lalita@cwaiter.co.uk";s:5:"fname";s:6:"lalita";s:5:"lname";s:4:"sahu";s:5:"phone";s:11:"07402950926";s:7:"houseNo";s:2:"12";s:8:"postcode";s:7:"u21 5eg";s:8:"address1";s:15:"kilrush terrace";s:4:"town";s:6:"woking";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"address2";s:0:"";s:4:"city";s:9:"guildford";s:6:"county";s:6:"surrey";s:18:"addressInstruction";s:11:"taste order";s:13:"order_id_temp";s:22:"07402950926_1406512153";}'),
('f015c85e6b5e88a552daebe7d84ef9b2', '213.104.214.8', 'Java/1.7.0', 1407794326, '');
INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('f1824537ebeb0b4a088ab0f63f824ebd', '213.104.214.8', 'Java/1.7.0', 1407794125, ''),
('f211d4659788000e3cf707e160930305', '188.39.40.212', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1408631901, 'a:5:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1408631901;s:4:"time";s:3:"000";}'),
('f338f3b88d1d66d20917b019e6d49845', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407405218, ''),
('f3b9fd8d5076486768b30c8ccf8f828b', '213.104.214.8', 'Java/1.7.0', 1407793925, ''),
('f3d54f650417855e62c9bfd21257b0a0', '66.249.84.59', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407326923, 'a:5:{s:9:"user_data";s:0:"";s:9:"receiving";s:10:"collection";s:9:"payMethod";s:6:"paypal";s:3:"day";i:1407326923;s:4:"time";s:3:"000";}'),
('f5064b025994c2659524884aa2b2871a', '213.248.211.173', 'http://www.nominet.org.uk/privacypolicy', 1407507041, ''),
('f51626c0567c013e463b618f67342a29', '213.104.214.8', 'Java/1.7.0', 1407794495, ''),
('f6741d5f4485dc9fa35a9f2b1939070d', '213.104.214.8', 'Java/1.7.0', 1407794276, ''),
('f723aab634fe0f10950f21616abe7ce6', '116.193.170.26', 'Java/1.7.0', 1408133459, ''),
('f80bd9768f54246dfd93cf95c52cdc4e', '213.104.214.8', 'Java/1.7.0', 1408134951, ''),
('f8345f1bd5f1bc6fb57a90d81937ff02', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406846901, ''),
('f866a73d3572a37057e7564094444717', '213.104.214.8', 'Java/1.7.0', 1408135101, ''),
('f99fa47449d8dc4890205bebaaa8f125', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1407572435, ''),
('fbdfd1bae9f9143e98ac02dcf506bfdb', '213.104.214.8', 'Java/1.7.0', 1407794226, ''),
('fd02d095bec8be22f240976b292d4ea7', '66.249.81.42', 'Mozilla/5.0 (Windows NT 6.1; rv:6.0) Gecko/20110814 Firefox/6.0 Google favicon', 1406383153, ''),
('fd442505aaca028a3b526aeadeb25798', '213.248.211.173', 'http://www.nominet.org.uk/privacypolicy', 1407507040, ''),
('fdde5df54a5479b9610fbb5153a1c585', '213.104.214.8', 'Java/1.7.0', 1407794496, ''),
('fe32735d8c5c7c0d65aa02899dd0b72f', '82.132.213.86', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1405970762, 'a:27:{s:9:"user_data";s:0:"";s:9:"receiving";s:8:"delivery";s:8:"discount";s:0:"";s:9:"payMethod";s:4:"cash";s:3:"day";s:10:"1407974400";s:4:"time";s:5:"45900";s:5:"email";s:18:"amzadfof@gmail.com";s:5:"fname";s:5:"Amzad";s:5:"lname";s:8:"Mojumder";s:5:"phone";s:11:"07900642131";s:7:"houseNo";s:2:"48";s:8:"postcode";s:8:"GU21 5ED";s:8:"address1";s:12:"Walton Court";s:4:"town";s:6:"Woking";s:14:"transactionFee";d:0;s:13:"discountPrice";d:0;s:14:"delivertCharge";d:0;s:9:"orderNote";s:0:"";s:8:"address2";s:0:"";s:4:"city";s:8:"Guilford";s:6:"county";s:6:"Surrey";s:18:"addressInstruction";s:4:"Test";s:13:"order_id_temp";s:22:"07900642131_1407081462";s:8:"identity";s:18:"amzadfof@gmail.com";s:8:"username";s:13:"amzadmojumder";s:7:"user_id";s:1:"1";s:14:"old_last_login";s:10:"1406056861";}'),
('fe4b6dea91ce48593c336f3b81215e0e', '213.104.214.8', 'Java/1.7.0', 1408135351, ''),
('fe68097e02a92b5679bd817a210094be', '213.104.214.8', 'Java/1.7.0', 1407791394, ''),
('fefea6e6fc036fab9d07fcc7af02dd5a', '213.104.214.8', 'Java/1.7.0', 1407793497, ''),
('ff92a29460a9ae47ca0957a3e96b5eae', '213.104.214.8', 'Java/1.7.0', 1407794326, '');

-- --------------------------------------------------------

--
-- Table structure for table `cms_article`
--

CREATE TABLE IF NOT EXISTS `cms_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` int(11) DEFAULT NULL,
  `alias` varchar(256) DEFAULT NULL,
  `title` text NOT NULL,
  `summary` text,
  `body` text NOT NULL,
  `banner_src` text,
  `banner_href` text,
  `image_src` text,
  `image_href` text,
  `button_href` text,
  `button` text,
  `page_template` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='### ' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cms_article`
--

INSERT INTO `cms_article` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `title`, `summary`, `body`, `banner_src`, `banner_href`, `image_src`, `image_href`, `button_href`, `button`, `page_template`) VALUES
(1, 1, '0000-00-00 00:00:00', 1, 1, 'about_us', 'About The Royals', 'The Royals', 'The Royals has been established since 2000 and is still one of North London?s most popular Indian restaurants. The Royals founded in 2000 by Mr Mostak Ahmed&#44; who not only has sixteen years’ experience in the food industry but has a strong business sense. The Royals is a family run business which adopts a philosophy of wholesomeness&#44; well-being and creates a strong traditional ambience. As a result&#44; this has created a more family orientated restaurant for all to enjoy.<br /> Supporting The Royals is a chef with supreme talents. Experience of thirty-two years goes a long way in this industry. The Royals’ menu is meticulously designed to suit the needs of every customer. It is constantly being improved with excellent feedback from their valued customers. </p> ', '', '/takeaway/menu', '/img/articles/about_us.jpg', '/takeaway/menu', '/takeaway/menu', 'Order Online', '#');

-- --------------------------------------------------------

--
-- Table structure for table `cms_highlights`
--

CREATE TABLE IF NOT EXISTS `cms_highlights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `sn` bigint(20) NOT NULL DEFAULT '1',
  `alias` varchar(256) DEFAULT NULL,
  `method` varchar(256) NOT NULL,
  `module` varchar(256) NOT NULL,
  `name` text NOT NULL,
  `title` text,
  `title2` text,
  `title3` text,
  `image_href` text,
  `image_src` text,
  `summary` text,
  `body` text,
  `button_href` text,
  `button` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `cms_highlights`
--

INSERT INTO `cms_highlights` (`id`, `login_id`, `updated`, `active`, `sn`, `alias`, `method`, `module`, `name`, `title`, `title2`, `title3`, `image_href`, `image_src`, `summary`, `body`, `button_href`, `button`) VALUES
(1, 515, '0000-00-00 00:00:00', 1, 1, 'welcome', 'about/home', 'special', 'Hygine', '#', '#', '#', '/takeaway/menu', 'http://allinepos.co.uk/clients/images/ukb1826/Highlights/Scores300x200.png', '#', 'We committed to maintain the high standards of quality and hygine.', '/takeaway/menu', 'Order Online'),
(2, 515, '0000-00-00 00:00:00', 1, 2, 'welcome', 'about/home', 'special', 'Opening Hours', '#', '#', '#', '/takeaway/menu', 'http://allinepos.co.uk/clients/images/ukb1826/Highlights/open_7.jpg', '#', 'Open 7 days a Week<br /> 12 pm to 2:30 pm 6pm to Midnight <br />', '/takeaway/menu', 'View Menu'),
(3, 7, '0000-00-00 00:00:00', 1, 3, 'welcome', 'about/home', 'special', 'Free Delivery', '#', '#', '#', '/takeaway/menu', 'http://allinepos.co.uk/clients/images/ukb1826/Highlights/delivery.png', '#', 'Within 4 Mile Radius <br /> Order Over Pound10<br />', '/takeaway/menu', 'Order Online'),
(4, 11, '0000-00-00 00:00:00', 1, 4, 'welcome', 'about/home', 'mid_text', 'Mid Text', 'The Royals’ menu is meticulously designed to suit the needs of every customer.', '#', '#', '#', '#', '#', '#', '/takeaway/menu', 'View Set Meals'),
(5, 11, '0000-00-00 00:00:00', 1, 5, 'welcome', 'about/main', 'our_restaurant', '', 'OUR RESTAURANT', '#', '#', '/takeaway/menu', 'http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg', '#', 'The Royals is a fully licensed and fully air conditioned restaurant that serves authentic indian cuisine. Our attractive and quietly intimate restaurant ensures that the guest remains of paramount importance. We will do our atmost to serve you the kind of high quality traditional yet refined authentic yet contemporary cooking which we have come to be known for. The royals authentic indian restaurant serving high quality food in Harrow. our menu is concise and filled with dishes which are subtle flavoursome and distinctive. Our service staffs are courteous and attentive yet never overbearing.', '/takeaway/menu', 'View Set Meals'),
(6, 11, '0000-00-00 00:00:00', 1, 6, 'welcome', 'about/main', 'our_food', 'Meal for 2', 'OUR FOOD', '#', '#', '/takeaway/menu', 'http://allinepos.co.uk/templates/basic01/highlights/set_menal_for_2.jpg', '#', 'At The Royals high quality Indian food produced in-house are inventive as well as creative.The Menu is thoughtfully devised by our acclaimed Mustaq chef. Using specialist ingredients and authentic spices. In keeping the traditional dishes and old favourites we have introduced some of the most innovative dishes from across the Indian sub-continent. The Royals has become the destination for seekers of quality Indian food served by friendly and attentive staff in a light and airy atmosphere. Our philosophy is to provide our guests with a complete package of great food excellent service value for money and a full dining experience. We also offer a takeaway and free home delivery service.There is no more sincere love than the love of The Royals food.', '/takeaway/menu', 'View Set Meals'),
(7, 11, '0000-00-00 00:00:00', 1, 7, 'welcome', 'about/main', 'top_banner', 'Order Online Now', 'Delivered Straight To Your Door.', '#', '#', '#', '#', '#', '#', '/takeaway/menu', 'Order Online Now'),
(8, 11, '0000-00-00 00:00:00', 1, 1, 'us', 'about/us', 'side', 'about us side starter', 'Starter', '#', '#', '/takeaway/menu', '/img/highlights/starters.jpg', '#', '#', '/takeaway/menu', 'Order Online Now'),
(9, 11, '0000-00-00 00:00:00', 1, 2, 'us', 'about/us', 'side', 'about Us&#44; side &#44; Main Dishes', 'Main Dishes', '#', '#', '/takeaway/menu', '/img/highlights/main.jpg', '#', '#', '/takeaway/menu', 'Order Online Now'),
(10, 11, '0000-00-00 00:00:00', 1, 3, 'us', 'about/us', 'side', 'About Us&#44; Side&#44; Side Orders', 'Side Orders', '#', '#', '/takeaway/menu', '/img/highlights/side.jpg', '#', '#', '/takeaway/menu', 'Order Online Now');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'allinepos', 'All Admin user from All In Epos');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `version` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `order_code` varchar(7) NOT NULL,
  `order_id_temp` varchar(32) NOT NULL DEFAULT 'AAA0000',
  `user_code` varchar(7) NOT NULL DEFAULT 'AAA0000',
  `fname` varchar(128) DEFAULT NULL,
  `lname` varchar(128) DEFAULT NULL,
  `email` text,
  `phone` varchar(16) DEFAULT NULL,
  `house` varchar(16) DEFAULT NULL,
  `address1` varchar(256) DEFAULT NULL,
  `address2` varchar(256) DEFAULT NULL,
  `town` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `county` varchar(256) DEFAULT NULL,
  `postcode` varchar(256) DEFAULT NULL,
  `address_direction` text,
  `requested_time` bigint(20) NOT NULL,
  `receiving` varchar(10) NOT NULL DEFAULT 'delivery',
  `discount_code` varchar(128) DEFAULT NULL,
  `pay_method` varchar(128) DEFAULT NULL,
  `pay_status` varchar(128) DEFAULT NULL,
  `items` text,
  `note` text,
  `bag_total` decimal(20,2) DEFAULT '0.00',
  `delivery_charge` decimal(20,2) DEFAULT '0.00',
  `transaction_fee` decimal(20,2) DEFAULT '0.00',
  `base_payable` decimal(20,2) DEFAULT '0.00',
  `vat_value` decimal(20,2) DEFAULT '0.00',
  `discount_price` decimal(20,2) DEFAULT '0.00',
  `checkout_price` decimal(20,2) DEFAULT '0.00',
  `club_point` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `order_id_temp` (`order_id_temp`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=135 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `login_id`, `updated`, `active`, `order_code`, `order_id_temp`, `user_code`, `fname`, `lname`, `email`, `phone`, `house`, `address1`, `address2`, `town`, `city`, `county`, `postcode`, `address_direction`, `requested_time`, `receiving`, `discount_code`, `pay_method`, `pay_status`, `items`, `note`, `bag_total`, `delivery_charge`, `transaction_fee`, `base_payable`, `vat_value`, `discount_price`, `checkout_price`, `club_point`) VALUES
(1, 1, '2014-07-20 12:04:14', 1, 'AAA1786', '07900642131_1405857823', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407410100, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:6:"Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"1.00";s:4:"meat";a:3:{i:0;s:1:"4";i:1;s:4:"1.00";i:2;s:5:"Prwan";}}}', '', '1.00', '0.00', '0.00', '1.00', '0.00', '0.00', '1.00', 0),
(2, 1, '2014-07-20 12:06:01', 1, 'AAA1787', '07900642131_1405857922', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406632500, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(3, 1, '2014-07-20 13:10:25', 1, 'AAA1788', '07900642131_1405861765', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406978100, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"1";s:5:"title";s:13:"Chicken Tikka";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}}', '', '10.95', '0.00', '0.00', '10.95', '0.00', '0.00', '10.95', 0),
(4, 1, '2014-07-20 13:12:36', 1, 'AAA1789', '07900642131_1405861908', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407237300, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"1";s:5:"title";s:13:"Chicken Tikka";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}}', '', '7.95', '0.00', '0.00', '7.95', '0.00', '0.00', '7.95', 0),
(5, 1, '2014-07-20 13:35:06', 1, 'AAA1790', '07900642131_1405862753', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406891700, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(6, 1, '2014-07-20 13:36:03', 1, 'AAA1791', '07900642131_1405863328', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406459700, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(7, 1, '2014-07-20 13:40:43', 1, 'AAA1792', '07900642131_1405863602', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407410100, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(8, 1, '2014-07-20 13:41:35', 1, 'AAA1793', '07900642131_1405863664', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406978100, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(9, 1, '2014-07-20 13:45:14', 1, 'AAA1794', '07900642131_1405863854', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406978100, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(10, 1, '2014-07-20 13:47:42', 1, 'AAA1795', '07900642131_1405864022', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406978100, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:6:"Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"1.00";s:4:"meat";a:3:{i:0;s:1:"4";i:1;s:4:"1.00";i:2;s:5:"Prwan";}}}', '', '1.00', '0.00', '0.00', '1.00', '0.00', '0.00', '1.00', 0),
(11, 1, '2014-07-20 13:51:10', 1, 'AAA1796', '07900642131_1405864233', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406546100, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:6:"Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"1.00";s:4:"meat";a:3:{i:0;s:1:"4";i:1;s:4:"1.00";i:2;s:5:"Prwan";}}}', '', '4.00', '0.00', '0.00', '4.00', '0.00', '0.00', '4.00', 0),
(12, 1, '2014-07-20 14:21:48', 1, 'AAA1797', '07900642131_1405866060', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407496500, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(13, 1, '2014-07-20 14:24:16', 1, 'AAA1798', '07900642131_1405866218', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407064500, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(14, 1, '2014-07-20 14:26:52', 1, 'AAA1799', '07900642131_1405866366', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406810700, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(15, 1, '2014-07-20 14:28:29', 1, 'AAA1800', '07900642131_1405866464', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406805300, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(16, 1, '2014-07-20 14:31:08', 1, 'AAA1801', '07900642131_1405866577', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407150900, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:6:"Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"1.00";s:4:"meat";a:3:{i:0;s:1:"4";i:1;s:4:"1.00";i:2;s:5:"Prwan";}}}', '', '1.00', '0.00', '0.00', '1.00', '0.00', '0.00', '1.00', 0),
(17, 1, '2014-07-20 14:32:30', 1, 'AAA1802', '07900642131_1405866691', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406718900, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(18, 1, '2014-07-20 14:34:10', 1, 'AAA1803', '07900642131_1405866810', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407150900, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(19, 1, '2014-07-20 14:35:42', 1, 'AAA1804', '07900642131_1405866905', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407496500, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(20, 1, '2014-07-20 14:40:51', 1, 'AAA1805', '07900642131_1405867190', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407323700, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(21, 1, '2014-07-20 14:41:54', 1, 'AAA1806', '07900642131_1405867274', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406459700, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(22, 1, '2014-07-20 14:43:39', 1, 'AAA1807', '07900642131_1405867380', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406718900, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(23, 1, '2014-07-20 14:58:55', 1, 'AAA1808', '07900642131_1405868296', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406632500, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(24, 1, '2014-07-20 15:00:44', 1, 'AAA1809', '07900642131_1405868409', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406805300, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(25, 1, '2014-07-20 15:03:09', 1, 'AAA1810', '07900642131_1405868514', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407237300, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(26, 1, '2014-07-20 15:12:53', 1, 'AAA1811', '07900642131_1405869133', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1407239100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(27, 1, '2014-07-20 15:15:26', 1, 'AAA1812', '07900642131_1405869291', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406634300, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(28, 1, '2014-07-20 18:04:44', 1, 'AAA1813', '07900642131_1405879429', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406027700, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(29, 1, '2014-07-20 18:16:36', 1, 'AAA1814', '07900642131_1405880125', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406979900, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:6:"Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"1.00";s:4:"meat";a:3:{i:0;s:1:"4";i:1;s:4:"1.00";i:2;s:5:"Prwan";}}}', '', '1.00', '0.00', '0.00', '1.00', '0.00', '0.00', '1.00', 0),
(30, 1, '2014-07-20 18:21:15', 1, 'AAA1815', '07900642131_1405880440', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406375100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(31, 1, '2014-07-20 18:22:33', 1, 'AAA1816', '07900642131_1405880515', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406893500, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(32, 1, '2014-07-20 18:27:45', 1, 'AAA1817', '07900642131_1405880822', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406805300, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(33, 1, '2014-07-20 18:29:10', 1, 'AAA1818', '07900642131_1405880913', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1407237300, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(34, 1, '2014-07-20 18:35:17', 1, 'AAA1819', '07900642131_1405881169', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406893500, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:6:"Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"1.00";s:4:"meat";a:3:{i:0;s:1:"4";i:1;s:4:"1.00";i:2;s:5:"Prwan";}}}', '', '1.00', '0.00', '0.00', '1.00', '0.00', '0.00', '1.00', 0),
(35, 1, '2014-07-20 18:44:32', 1, 'AAA1820', '07900642131_1405881637', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406979900, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(36, 1, '2014-07-20 19:17:37', 1, 'AAA1821', '07900642131_1405883786', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406634300, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(37, 1, '2014-07-20 19:20:33', 1, 'AAA1822', '07900642131_1405883989', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1407325500, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(38, 1, '2014-07-20 19:24:23', 1, 'AAA1823', '07900642131_1405884222', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1407411900, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(39, 1, '2014-07-20 19:31:20', 1, 'AAA1824', '07900642131_1405884616', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1407239100, 'delivery', '', 'paypal', 'Pending', 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:6:"Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"1.00";s:4:"meat";a:3:{i:0;s:1:"4";i:1;s:4:"1.00";i:2;s:5:"Prwan";}}}', '', '7.00', '0.00', '0.00', '7.00', '0.00', '0.00', '7.00', 0),
(40, 1, '2014-07-20 19:34:32', 1, 'AAA1825', '07900642131_1405884732', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406720700, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(41, 1, '2014-07-20 19:35:59', 1, 'AAA1826', '07900642131_1405884928', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406547900, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(42, 1, '2014-07-20 19:37:22', 1, 'AAA1827', '07900642131_1405885002', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406547900, 'delivery', '', 'paypal', 'Pending', 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:6:"Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"1.00";s:4:"meat";a:3:{i:0;s:1:"4";i:1;s:4:"1.00";i:2;s:5:"Prwan";}}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"17";s:2:"sn";s:1:"1";s:5:"title";s:11:"Sheek Kebab";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}}', '', '11.95', '0.00', '0.00', '11.95', '0.00', '0.00', '11.95', 0),
(43, 1, '2014-07-20 20:11:52', 1, 'AAA1828', '07402950926_1405887068', 'AAA1786', 'lalita', 'sahu', 'lalita@allinepos.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1407323700, 'collection', '', 'paypal', 'Pending', 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"1";s:5:"title";s:13:"Chicken Tikka";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}}', '', '13.95', '0.00', '0.00', '13.95', '0.00', '0.00', '13.95', 0),
(44, 1, '2014-07-20 20:23:53', 1, 'AAA1829', '07402950926_1405887781', 'AAA1786', 'lalita', 'sahu', 'lalita@allinepos.co.uk', '07402950926', '12', 'kilrush terrace', '', 'woking', 'Guildford', 'surrey', 'gu21 5eg', '', 1406286900, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(45, 1, '2014-07-20 20:26:00', 1, 'AAA1830', '07402950926_1405887908', 'AAA1786', 'lalita', 'sahu', 'lalita@allinepos.co.uk', '07402950926', '12', 'kilrush terrace', '', 'woking', 'Guildford', 'surrey', 'gu21 5eg', '', 1406202300, 'collection', '', 'paypal', 'Pending', 'a:4:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:6:"Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"5";i:1;s:4:"3.00";i:2;s:10:"King Prwan";}}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"1";s:5:"title";s:13:"Chicken Tikka";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"18";s:2:"sn";s:1:"1";s:5:"title";s:20:"Tandoori Chicken 1/4";s:4:"note";s:0:"";s:5:"price";s:4:"2.99";s:4:"meat";b:0;}}', '', '16.94', '0.00', '0.00', '16.94', '0.00', '0.00', '16.94', 0),
(46, 1, '2014-07-20 20:29:54', 1, 'AAA1831', '07402950926_1405888066', 'AAA1786', 'lalita', 'sahu', 'lalita@allinepos.co.uk', '07402950926', '12', 'kilrush terrace', '', 'woking', 'Guildford', 'surrey', 'gu21 5eg', '', 1406027700, 'collection', '', 'paypal', 'Pending', 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"6.00";s:4:"meat";a:3:{i:0;s:1:"6";i:1;s:4:"6.00";i:2;s:16:"King Prwan Tikka";}}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"4";s:2:"sn";s:1:"1";s:5:"title";s:10:"Lamb Tikka";s:4:"note";s:0:"";s:5:"price";s:4:"8.95";s:4:"meat";b:0;}}', '', '17.95', '0.00', '0.00', '17.95', '0.00', '0.00', '17.95', 0),
(47, 1, '2014-07-20 20:37:29', 1, 'AAA1832', '07402950926_1405888584', 'AAA1786', 'lalita', 'sahu', 'lalita@allinepos.co.uk', '07402950926', '12', 'kilrush terrace', '', 'woking', 'Guildford', 'surrey', 'gu21 5eg', '', 1406891700, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(48, 1, '2014-07-21 03:36:11', 1, 'AAA1833', '07900642131_1405913730', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406375100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(49, 1, '2014-07-21 03:38:19', 1, 'AAA1834', '07900642131_1405913858', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1406893500, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(50, 1, '2014-07-21 03:39:29', 1, 'AAA1835', '07900642131_1405913929', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(51, 1, '2014-07-21 03:42:11', 1, 'AAA1836', '07900642131_1405914093', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1407325500, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(52, 1, '2014-07-21 03:49:54', 1, 'AAA1837', '07900642131_1405914450', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(53, 1, '2014-07-21 03:51:22', 1, 'AAA1838', '07900642131_1405914651', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"1";s:5:"title";s:13:"Chicken Tikka";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"4";s:2:"sn";s:1:"1";s:5:"title";s:10:"Lamb Tikka";s:4:"note";s:0:"";s:5:"price";s:4:"8.95";s:4:"meat";b:0;}}', '', '19.90', '0.00', '0.00', '19.90', '0.00', '0.00', '19.90', 0),
(54, 1, '2014-07-21 03:57:20', 1, 'AAA1839', '07900642131_1405914998', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(55, 1, '2014-07-21 03:59:15', 1, 'AAA1840', '07900642131_1405915114', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(56, 1, '2014-07-21 04:05:13', 1, 'AAA1841', '07900642131_1405915472', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"1";s:5:"title";s:13:"Chicken Tikka";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}}', '', '10.95', '0.00', '0.00', '10.95', '0.00', '0.00', '10.95', 0),
(57, 1, '2014-07-21 04:14:29', 1, 'AAA1842', '07900642131_1405916022', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(58, 1, '2014-07-21 04:18:31', 1, 'AAA1843', '07900642131_1405916269', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(59, 1, '2014-07-21 04:21:28', 1, 'AAA1844', '07900642131_1405916433', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(60, 1, '2014-07-21 04:24:13', 1, 'AAA1845', '07900642131_1405916611', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(61, 1, '2014-07-21 04:25:31', 1, 'AAA1846', '07900642131_1405916688', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405943100, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '3.00', '0.00', '0.00', '3.00', '0.00', '0.00', '3.00', 0),
(62, 1, '2014-07-21 04:48:00', 1, 'AAA1847', '07900642131_1405918041', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405962900, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"3.00";s:4:"meat";a:3:{i:0;s:1:"1";i:1;s:4:"3.00";i:2;s:4:"Lamb";}}}', '', '6.00', '0.00', '0.00', '6.00', '0.00', '0.00', '6.00', 0),
(63, 1, '2014-07-21 07:57:59', 1, 'AAA1848', '07900642131_1405929442', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1405944900, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:16:"Vegetable Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}}', '', '5.50', '0.00', '0.00', '5.50', '0.00', '0.00', '5.50', 0),
(64, 1, '2014-07-21 09:44:10', 1, 'AAA1849', '07402940926_1405935755', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402940926', '', '', '', '', '', '', '', '', 1405946700, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}}', '', '2.75', '0.00', '0.00', '2.75', '0.00', '0.00', '2.75', 0),
(65, 1, '2014-07-21 09:46:24', 1, 'AAA1850', '07402940926_1405935943', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402940926', '', '', '', '', '', '', '', '', 1405944900, 'collection', '', 'paypal', 'Pending', 'a:5:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:16:"Vegetable Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"5";s:2:"sn";s:1:"1";s:5:"title";s:16:"Aloo Chana Chaat";s:4:"note";s:0:"";s:5:"price";s:4:"3.50";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"26";s:2:"sn";s:1:"1";s:5:"title";s:13:"Karahi Paneer";s:4:"note";s:0:"";s:5:"price";s:4:"5.95";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"27";s:2:"sn";s:1:"1";s:5:"title";s:14:"Paneer Makhani";s:4:"note";s:0:"";s:5:"price";s:4:"6.50";s:4:"meat";b:0;}}', '', '21.45', '0.00', '0.00', '21.45', '0.00', '0.00', '21.45', 0),
(66, 1, '2014-07-21 09:53:30', 1, 'AAA1851', '07402940926_1405936402', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402940926', '', '', '', '', '', '', '', '', 1405944900, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"6";s:2:"sn";s:1:"1";s:5:"title";s:21:"Khatta Mitha Mushroom";s:4:"note";s:0:"";s:5:"price";s:4:"3.50";s:4:"meat";b:0;}}', '', '3.50', '0.00', '0.00', '3.50', '0.00', '0.00', '3.50', 0),
(67, 1, '2014-07-21 09:55:09', 1, 'AAA1852', '01236547896_1405936150', 'AAA1786', 'A', 'Test', 'abc@hotmail.com', '01236547896', '', '', '', '', '', '', '', '', 1405944900, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}}', '', '2.75', '0.00', '0.00', '2.75', '0.00', '0.00', '2.75', 0),
(68, 1, '2014-07-21 09:55:25', 1, 'AAA1853', '07402940926_1405936512', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402940926', '12', 'kilrush terrace', '', 'woking', '', '', '12', '', 1405946700, 'delivery', '', 'cash', NULL, 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"6";s:2:"sn";s:1:"1";s:5:"title";s:21:"Khatta Mitha Mushroom";s:4:"note";s:0:"";s:5:"price";s:4:"3.50";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:16:"Vegetable Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}}', '', '6.25', '0.00', '0.00', '6.25', '0.00', '0.00', '6.25', 0),
(69, 1, '2014-07-21 10:19:10', 1, 'AAA1854', '07402950926_1405937802', 'AAA1786', 'lalita', 'sahu', 'lalita@llinepos.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1405944900, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:16:"Vegetable Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}}', '', '5.50', '0.00', '0.00', '5.50', '0.00', '0.00', '5.50', 0),
(70, 1, '2014-07-21 10:25:22', 1, 'AAA1855', '07402950926_1405938159', 'AAA1786', 'lalita', 'sahu', 'lalita@llinepos.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1405944900, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"1";s:5:"title";s:14:"Paneer Shaslik";s:4:"note";s:0:"";s:5:"price";s:4:"3.50";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"1";s:5:"title";s:14:"Paneer Shaslik";s:4:"note";s:0:"";s:5:"price";s:4:"3.50";s:4:"meat";b:0;}}', '', '7.00', '0.00', '0.00', '7.00', '0.00', '0.00', '7.00', 0),
(71, 1, '2014-07-21 10:27:37', 1, 'AAA1856', '07402950926_1405938369', 'AAA1786', 'lalita', 'sahu', 'lalita@llinepos.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1405944900, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:11:"Onion Bhaji";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"40";s:2:"sn";s:1:"1";s:5:"title";s:22:"Sea Bass Kerala Masala";s:4:"note";s:0:"";s:5:"price";s:4:"8.95";s:4:"meat";b:0;}}', '', '11.70', '0.00', '0.00', '11.70', '0.00', '0.00', '11.70', 0),
(72, 1, '2014-07-21 10:37:44', 1, 'AAA1857', '07402950926_1405938494', 'AAA1786', 'lalita', 'sahu', 'lalita@llinepos.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1405944900, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"1";s:5:"title";s:14:"Paneer Shaslik";s:4:"note";s:0:"";s:5:"price";s:4:"3.50";s:4:"meat";b:0;}}', '', '3.50', '0.00', '0.00', '3.50', '0.00', '0.00', '3.50', 0),
(73, 1, '2014-07-22 15:46:11', 1, 'AAA1858', '07900642131_1406043928', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407500100, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"1";s:5:"title";s:16:"Vegetable Samosa";s:4:"note";s:0:"";s:5:"price";s:4:"2.75";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"1";s:5:"title";s:14:"Paneer Shaslik";s:4:"note";s:0:"";s:5:"price";s:4:"3.50";s:4:"meat";b:0;}}', '', '6.25', '0.00', '0.00', '6.25', '0.00', '0.00', '6.25', 0),
(74, 1, '2014-07-22 18:34:58', 1, 'AAA1859', '07402950926_1406054047', 'AAA1786', 'lalita', 'sahu', 'lalita@allinepos.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1406059200, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '0.00', '0.00', '3.95', 0),
(75, 1, '2014-07-22 19:21:43', 1, 'AAA1860', '07402950926_1406056847', 'AAA1786', 'lalita', 'sahu', 'lalita@allinepos.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1406060100, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}', '', '4.95', '0.00', '0.00', '4.95', '0.00', '0.00', '4.95', 0),
(76, 1, '2014-07-22 19:22:29', 1, 'AAA1861', '07900642131_1406056936', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', '', '', 'GU21 5ED', '', 1407500100, 'collection', '', 'paypal', 'Pending', 'a:4:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"4";s:2:"sn";s:1:"4";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"4.10";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '15.95', '0.00', '0.00', '15.95', '0.00', '0.00', '15.95', 0),
(77, 1, '2014-07-23 03:28:32', 1, 'AAA1862', '07900642131_1406086066', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1406117700, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}', '', '8.90', '0.00', '0.00', '8.90', '0.00', '0.00', '8.90', 0),
(78, 1, '2014-07-23 03:29:49', 1, 'AAA1863', '07900642131_1406086185', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406119500, 'delivery', '', 'cash', NULL, 'a:5:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"123";s:2:"sn";s:3:"123";s:5:"title";s:15:"CHICKEN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"124";s:2:"sn";s:3:"124";s:5:"title";s:12:"LAMB BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"71";s:2:"sn";s:2:"71";s:5:"title";s:13:"METHI CHICKEN";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"72";s:2:"sn";s:2:"72";s:5:"title";s:14:"CHICKEN MADRAS";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}}', '', '29.15', '0.00', '0.00', '29.15', '0.00', '0.00', '29.15', 0),
(79, 1, '2014-07-23 03:33:51', 1, 'AAA1864', '07900642131_1406086429', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406119500, 'delivery', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '0.00', '0.00', '3.95', 0),
(80, 1, '2014-07-23 03:34:44', 1, 'AAA1865', '07900642131_1406086481', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406119500, 'delivery', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '0.00', '0.00', '3.95', 0),
(81, 1, '2014-07-23 03:36:33', 1, 'AAA1866', '07900642131_1406086577', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406119500, 'delivery', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '0.00', '0.00', '3.95', 0),
(82, 1, '2014-07-25 10:08:01', 1, 'AAA1867', '07402950926_1406282754', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1406290500, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '0.00', '0.00', '3.95', 0),
(83, 1, '2014-07-26 19:04:07', 1, 'AAA1868', '07402950926_1406401386', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1406406600, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '0.00', '0.00', '3.95', 0),
(84, 1, '2014-07-26 19:10:03', 1, 'AAA1869', '07402950926_1406401759', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1406406600, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '7.90', '0.00', '0.00', '7.90', '0.00', '0.00', '7.90', 0),
(85, 1, '2014-07-27 19:19:42', 1, 'AAA1870', '07900642131_1406488732', 'AAA1786', 'Amzad', 'Mojumder', 'amjadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407759300, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(86, 1, '2014-07-27 19:37:09', 1, 'AAA1871', '07900642131_1406489737', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407845700, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}', '', '4.95', '0.00', '0.00', '4.95', '4.95', '0.00', '4.95', 0);
INSERT INTO `orders` (`id`, `login_id`, `updated`, `active`, `order_code`, `order_id_temp`, `user_code`, `fname`, `lname`, `email`, `phone`, `house`, `address1`, `address2`, `town`, `city`, `county`, `postcode`, `address_direction`, `requested_time`, `receiving`, `discount_code`, `pay_method`, `pay_status`, `items`, `note`, `bag_total`, `delivery_charge`, `transaction_fee`, `base_payable`, `vat_value`, `discount_price`, `checkout_price`, `club_point`) VALUES
(87, 1, '2014-07-27 21:00:18', 1, 'AAA1872', '07900642131_1406494746', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407413700, 'collection', '', 'paypal', 'Pending', 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '11.85', '0.00', '0.00', '11.85', '11.85', '0.00', '11.85', 0),
(88, 1, '2014-07-27 22:31:35', 1, 'AAA1873', '07402950926_1406500240', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1406636100, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '7.90', '0.00', '0.00', '7.90', '7.90', '0.00', '7.90', 0),
(89, 1, '2014-07-27 22:32:50', 1, 'AAA1874', '07402950926_1406500366', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402950926', '', '', '', '', '', '', '', '', 1406549700, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"38";s:2:"sn";s:2:"38";s:5:"title";s:16:"VEGETARIAN CURRY";s:4:"note";s:0:"";s:5:"price";s:4:"3.25";s:4:"meat";b:0;}}', '', '3.25', '0.00', '0.00', '3.25', '3.25', '0.00', '3.25', 0),
(90, 1, '2014-07-27 22:36:07', 1, 'AAA1875', '07402950926_1406500559', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402950926', '12', 'kilrush terrace', '', 'woking', 'guildford', 'surrey', 'u21 5eg', 'taste order', 1406551500, 'delivery', '', 'cash', NULL, 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '7.90', '0.00', '0.00', '7.90', '7.90', '0.00', '7.90', 0),
(91, 1, '2014-07-27 22:37:59', 1, 'AAA1876', 'nbvxxxvb_1406500672', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', 'nbvxxxvb', '12', 'kilrush terrace', '', 'woking', 'guildford', 'surrey', 'u21 5eg', 'taste order', 1406895300, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(92, 1, '2014-07-27 22:38:55', 1, 'AAA1877', 'nbvxxxvb_1406500727', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', 'nbvxxxvb', '12', 'kilrush terrace', '', 'woking', 'guildford', 'surrey', 'u21 5eg', 'taste order', 1407759300, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}', '', '4.95', '0.00', '0.00', '4.95', '4.95', '0.00', '4.95', 0),
(93, 1, '2014-07-27 22:40:44', 1, 'AAA1878', 'nbvxxxvb_1406500782', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', 'nbvxxxvb', '12', 'kilrush terrace', '', 'woking', 'guildford', 'surrey', 'u21 5eg', 'taste order', 1407672900, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}', '', '4.95', '0.00', '0.00', '4.95', '4.95', '0.00', '4.95', 0),
(94, 1, '2014-07-27 22:42:53', 1, 'AAA1879', 'nbvxxxvb_1406500920', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', 'nbvxxxvb', '12', 'kilrush terrace', '', 'woking', 'guildford', 'surrey', 'u21 5eg', 'taste order', 1407501900, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"10";s:2:"sn";s:2:"10";s:5:"title";s:16:"CHICKEN ON PUREE";s:4:"note";s:0:"";s:5:"price";s:4:"3.50";s:4:"meat";b:0;}}', '', '3.50', '0.00', '0.00', '3.50', '3.50', '0.00', '3.50', 0),
(95, 1, '2014-07-27 22:44:38', 1, 'AAA1880', 'nbvxxxvb_1406501012', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', 'nbvxxxvb', '12', 'kilrush terrace', '', 'woking', 'guildford', 'surrey', 'u21 5eg', 'taste order', 1407847500, 'delivery', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(96, 1, '2014-07-27 23:07:24', 1, 'AAA1881', '07900642131_1406502441', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1407415500, 'delivery', '', 'cash', NULL, 'a:5:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"5";s:2:"sn";s:1:"5";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"5.60";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"39";s:2:"sn";s:2:"39";s:5:"title";s:16:"VEGETARIAN KORMA";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"71";s:2:"sn";s:2:"71";s:5:"title";s:13:"METHI CHICKEN";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"72";s:2:"sn";s:2:"72";s:5:"title";s:14:"CHICKEN MADRAS";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}}', '', '23.70', '0.00', '0.00', '23.70', '23.70', '0.00', '23.70', 0),
(97, 1, '2014-07-27 23:09:19', 1, 'AAA1882', '07900642131_1406502544', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:10:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"95";s:2:"sn";s:2:"95";s:5:"title";s:9:"KEEMA NAN";s:4:"note";s:0:"";s:5:"price";s:4:"2.10";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"71";s:2:"sn";s:2:"71";s:5:"title";s:13:"METHI CHICKEN";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"72";s:2:"sn";s:2:"72";s:5:"title";s:14:"CHICKEN MADRAS";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:5;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"74";s:2:"sn";s:2:"74";s:5:"title";s:13:"CHICKEN KORMA";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:6;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"71";s:2:"sn";s:2:"71";s:5:"title";s:13:"METHI CHICKEN";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:7;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"72";s:2:"sn";s:2:"72";s:5:"title";s:14:"CHICKEN MADRAS";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:8;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"76";s:2:"sn";s:2:"76";s:5:"title";s:14:"KARAHI CHICKEN";s:4:"note";s:0:"";s:5:"price";s:4:"5.95";s:4:"meat";b:0;}i:9;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"76";s:2:"sn";s:2:"76";s:5:"title";s:14:"KARAHI CHICKEN";s:4:"note";s:0:"";s:5:"price";s:4:"5.95";s:4:"meat";b:0;}}', '', '48.40', '0.00', '0.00', '48.40', '48.40', '0.00', '48.40', 0),
(98, 1, '2014-07-27 23:11:13', 1, 'AAA1883', '07900642131_1406502670', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:6:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"95";s:2:"sn";s:2:"95";s:5:"title";s:9:"KEEMA NAN";s:4:"note";s:0:"";s:5:"price";s:4:"2.10";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"122";s:2:"sn";s:3:"122";s:5:"title";s:21:"CHICKEN TIKKA BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"124";s:2:"sn";s:3:"124";s:5:"title";s:12:"LAMB BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"124";s:2:"sn";s:3:"124";s:5:"title";s:12:"LAMB BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:5;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"127";s:2:"sn";s:3:"127";s:5:"title";s:17:"VEGETABLE BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"6.95";s:4:"meat";b:0;}}', '', '42.95', '0.00', '0.00', '42.95', '42.95', '0.00', '42.95', 0),
(99, 1, '2014-07-27 23:12:17', 1, 'AAA1884', '07900642131_1406502731', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:4:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"127";s:2:"sn";s:3:"127";s:5:"title";s:17:"VEGETABLE BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"6.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"127";s:2:"sn";s:3:"127";s:5:"title";s:17:"VEGETABLE BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"6.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"123";s:2:"sn";s:3:"123";s:5:"title";s:15:"CHICKEN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}}', '', '32.35', '0.00', '0.00', '32.35', '32.35', '0.00', '32.35', 0),
(100, 1, '2014-07-27 23:13:00', 1, 'AAA1885', '07900642131_1406502769', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"124";s:2:"sn";s:3:"124";s:5:"title";s:12:"LAMB BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"125";s:2:"sn";s:3:"125";s:5:"title";s:13:"PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}}', '', '26.40', '0.00', '0.00', '26.40', '26.40', '0.00', '26.40', 0),
(101, 1, '2014-07-27 23:14:44', 1, 'AAA1886', '07900642131_1406502880', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:7:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"7";s:2:"sn";s:1:"7";s:5:"title";s:6:"SAMOSA";s:4:"note";s:0:"";s:5:"price";s:4:"2.10";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"6";s:2:"sn";s:1:"6";s:5:"title";s:11:"ONION BHAJI";s:4:"note";s:0:"";s:5:"price";s:4:"2.10";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"138";s:2:"sn";s:3:"138";s:5:"title";s:13:"PLAIN YOUGURT";s:4:"note";s:0:"";s:5:"price";s:4:"1.95";s:4:"meat";b:0;}i:5;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:6;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"127";s:2:"sn";s:3:"127";s:5:"title";s:17:"VEGETABLE BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"6.95";s:4:"meat";b:0;}}', '', '38.95', '0.00', '0.00', '38.95', '38.95', '0.00', '38.95', 0),
(102, 1, '2014-07-27 23:25:38', 1, 'AAA1887', '07900642131_1406503489', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"124";s:2:"sn";s:3:"124";s:5:"title";s:12:"LAMB BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"128";s:2:"sn";s:3:"128";s:5:"title";s:13:"MIXED BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"8.95";s:4:"meat";b:0;}}', '', '27.40', '0.00', '0.00', '27.40', '27.40', '0.00', '27.40', 0),
(103, 1, '2014-07-27 23:26:20', 1, 'AAA1888', '07900642131_1406503577', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:6:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"6";s:2:"sn";s:1:"6";s:5:"title";s:11:"ONION BHAJI";s:4:"note";s:0:"";s:5:"price";s:4:"2.10";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"124";s:2:"sn";s:3:"124";s:5:"title";s:12:"LAMB BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"125";s:2:"sn";s:3:"125";s:5:"title";s:13:"PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"131";s:2:"sn";s:3:"131";s:5:"title";s:10:"KEEMA RICE";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:5;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"132";s:2:"sn";s:3:"132";s:5:"title";s:18:"SPECIAL FRIED RICE";s:4:"note";s:0:"";s:5:"price";s:4:"3.20";s:4:"meat";b:0;}}', '', '36.65', '0.00', '0.00', '36.65', '36.65', '0.00', '36.65', 0),
(104, 1, '2014-07-27 23:28:12', 1, 'AAA1889', '07900642131_1406503654', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:12:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"7";s:2:"sn";s:1:"7";s:5:"title";s:6:"SAMOSA";s:4:"note";s:0:"";s:5:"price";s:4:"2.10";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"71";s:2:"sn";s:2:"71";s:5:"title";s:13:"METHI CHICKEN";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"118";s:2:"sn";s:3:"118";s:5:"title";s:14:"LEMON SURPRISE";s:4:"note";s:0:"";s:5:"price";s:4:"2.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"131";s:2:"sn";s:3:"131";s:5:"title";s:10:"KEEMA RICE";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"107";s:2:"sn";s:3:"107";s:5:"title";s:11:"CAN OF COKE";s:4:"note";s:0:"";s:5:"price";s:4:"0.85";s:4:"meat";b:0;}i:5;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"56";s:2:"sn";s:2:"56";s:5:"title";s:11:"METHI GOSHT";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:6;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"123";s:2:"sn";s:3:"123";s:5:"title";s:15:"CHICKEN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:7;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"124";s:2:"sn";s:3:"124";s:5:"title";s:12:"LAMB BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:8;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"125";s:2:"sn";s:3:"125";s:5:"title";s:13:"PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}i:9;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:10;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"127";s:2:"sn";s:3:"127";s:5:"title";s:17:"VEGETABLE BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"6.95";s:4:"meat";b:0;}i:11;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"128";s:2:"sn";s:3:"128";s:5:"title";s:13:"MIXED BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"8.95";s:4:"meat";b:0;}}', '', '70.85', '0.00', '0.00', '70.85', '70.85', '0.00', '70.85', 0),
(105, 1, '2014-07-27 23:30:29', 1, 'AAA1890', '07900642131_1406503796', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:8:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"123";s:2:"sn";s:3:"123";s:5:"title";s:15:"CHICKEN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"125";s:2:"sn";s:3:"125";s:5:"title";s:13:"PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"124";s:2:"sn";s:3:"124";s:5:"title";s:12:"LAMB BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"125";s:2:"sn";s:3:"125";s:5:"title";s:13:"PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}i:5;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"124";s:2:"sn";s:3:"124";s:5:"title";s:12:"LAMB BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:6;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:7;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}}', '', '71.25', '0.00', '0.00', '71.25', '71.25', '0.00', '71.25', 0),
(106, 1, '2014-07-27 23:31:25', 1, 'AAA1891', '07900642131_1406503883', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:8:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"127";s:2:"sn";s:3:"127";s:5:"title";s:17:"VEGETABLE BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"6.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"122";s:2:"sn";s:3:"122";s:5:"title";s:21:"CHICKEN TIKKA BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:5;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"29";s:2:"sn";s:2:"29";s:5:"title";s:26:"METHI CHICKEN TIKKA MASALA";s:4:"note";s:0:"";s:5:"price";s:4:"6.95";s:4:"meat";b:0;}i:6;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"30";s:2:"sn";s:2:"30";s:5:"title";s:8:"JALFRAZI";s:4:"note";s:0:"";s:5:"price";s:4:"6.50";s:4:"meat";a:3:{i:0;s:1:"2";i:1;s:4:"6.50";i:2;s:4:"Lamb";}}i:7;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"32";s:2:"sn";s:2:"32";s:5:"title";s:10:"MEAT THALI";s:4:"note";s:0:"";s:5:"price";s:5:"14.50";s:4:"meat";b:0;}}', '', '61.70', '0.00', '0.00', '61.70', '61.70', '0.00', '61.70', 0),
(107, 1, '2014-07-27 23:51:19', 1, 'AAA1892', '07900642131_1406504312', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1406551500, 'delivery', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"126";s:2:"sn";s:3:"126";s:5:"title";s:18:"KING PRAWN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:5:"10.95";s:4:"meat";b:0;}}', '', '10.95', '0.00', '0.00', '10.95', '10.95', '0.00', '10.95', 0),
(108, 1, '2014-07-28 01:49:23', 1, 'AAA1893', '07402950926_1406512153', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', '07402950926', '12', 'kilrush terrace', '', 'woking', 'guildford', 'surrey', 'u21 5eg', 'taste order', 1406551500, 'delivery', '', 'cash', NULL, 'a:5:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"123";s:2:"sn";s:3:"123";s:5:"title";s:15:"CHICKEN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:3:"123";s:2:"sn";s:3:"123";s:5:"title";s:15:"CHICKEN BIRYANI";s:4:"note";s:0:"";s:5:"price";s:4:"7.50";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"21";s:2:"sn";s:2:"21";s:5:"title";s:13:"CHICKEN TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"5.95";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '29.85', '0.00', '0.00', '29.85', '29.85', '0.00', '29.85', 0),
(109, 1, '2014-07-28 18:53:58', 1, 'AAA1894', 'jm_1406573633', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', 'jm', '', '', '', '', '', '', '', '', 1406578500, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(110, 1, '2014-07-28 18:54:41', 1, 'AAA1895', 'jm_1406573676', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.com', 'jm', '', '', '', '', '', '', '', '', 1406577600, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(111, 1, '2014-07-28 18:56:05', 1, 'AAA1896', 'jm_1406573760', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co', 'jm', '', '', '', '', '', '', '', '', 1406579400, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(112, 1, '2014-07-28 18:58:52', 1, 'AAA1897', 'jm_1406573924', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', 'jm', '', '', '', '', '', '', '', '', 1406579400, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(113, 1, '2014-07-28 19:02:01', 1, 'AAA1898', 'jm_1406574116', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', 'jm', '', '', '', '', '', '', '', '', 1406579400, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(114, 1, '2014-07-29 01:41:10', 1, 'AAA1899', 'Cgh_1406598062', 'AAA1786', 'L', 'S', 'lalita@cwaiter.co.uk', 'Cgh', '', '', '', '', '', '', '', '', 1406636100, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(115, 1, '2014-07-30 23:42:36', 1, 'AAA1900', 'jm_1406763706', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', 'jm', '', '', '', '', '', '', '', '', 1406808900, 'collection', '', 'cash', NULL, 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"84";s:2:"sn";s:2:"84";s:5:"title";s:11:"BHUNA PRAWN";s:4:"note";s:0:"";s:5:"price";s:4:"5.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"83";s:2:"sn";s:2:"83";s:5:"title";s:11:"PRAWN CURRY";s:4:"note";s:0:"";s:5:"price";s:4:"5.95";s:4:"meat";b:0;}}', '', '15.85', '0.00', '0.00', '15.85', '15.85', '0.00', '15.85', 0),
(116, 1, '2014-07-31 01:05:45', 1, 'AAA1901', 'jm_1406768731', 'AAA1786', 'lalita', 'sahu', 'lalita@cwaiter.co.uk', 'jm', '', '', '', '', '', '', '', '', 1406808900, 'collection', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"6";s:2:"sn";s:1:"6";s:5:"title";s:11:"ONION BHAJI";s:4:"note";s:0:"";s:5:"price";s:4:"2.10";s:4:"meat";b:0;}}', '', '2.10', '0.00', '0.00', '2.10', '2.10', '0.00', '2.10', 0),
(117, 1, '2014-08-03 15:57:47', 1, 'AAA1902', '07900642131_1407081462', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', 'Walton Court', '', 'Woking', 'Guilford', 'Surrey', 'GU21 5ED', 'Test', 1408020300, 'delivery', '', 'cash', NULL, 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(118, 1, '2014-08-03 17:01:44', 1, 'AAA1903', '07900642131_1407085269', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1408104900, 'collection', '', 'paypal', 'Pending', 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"5";s:2:"sn";s:1:"5";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"5.60";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"5";s:2:"sn";s:1:"5";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"5.60";s:4:"meat";b:0;}}', '', '16.15', '0.00', '0.00', '16.15', '16.15', '0.00', '16.15', 0),
(119, 1, '2014-08-04 11:22:00', 1, 'AAA1904', '07900642131_1407151254', 'AAA1786', 'Amzad', 'Mojumder', 'amzad.fof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1408191300, 'collection', '', 'paypal', 'Pending', 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}', '', '13.85', '0.00', '0.00', '13.85', '13.85', '0.00', '13.85', 0),
(120, 1, '2014-08-04 11:23:10', 1, 'AAA1905', '07900642131_1407151348', 'AAA1786', 'Amzad', 'Mojumder', 'amzad.fof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407932100, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"12";s:2:"sn";s:2:"12";s:5:"title";s:19:"KING PRAWN ON PUREE";s:4:"note";s:0:"";s:5:"price";s:4:"5.50";s:4:"meat";b:0;}}', '', '9.45', '0.00', '0.00', '9.45', '9.45', '0.00', '9.45', 0),
(121, 1, '2014-08-04 11:24:14', 1, 'AAA1906', '07900642131_1407151408', 'AAA1786', 'Amzad', 'Mojumder', 'amzad.fof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407759300, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"6";s:2:"sn";s:1:"6";s:5:"title";s:11:"ONION BHAJI";s:4:"note";s:0:"";s:5:"price";s:4:"2.10";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '6.05', '0.00', '0.00', '6.05', '6.05', '0.00', '6.05', 0),
(122, 1, '2014-08-04 11:25:30', 1, 'AAA1907', '07900642131_1407151475', 'AAA1786', 'Amzad', 'Mojumder', 'amzad.fof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1408536900, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"8";s:2:"sn";s:1:"8";s:5:"title";s:12:"CHICKEN CHAT";s:4:"note";s:0:"";s:5:"price";s:4:"2.95";s:4:"meat";b:0;}}', '', '2.95', '0.00', '0.00', '2.95', '2.95', '0.00', '2.95', 0),
(123, 1, '2014-08-04 11:26:20', 1, 'AAA1908', '07900642131_1407151550', 'AAA1786', 'Amzad', 'Mojumder', 'amzad.fof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1408364100, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"5";s:2:"sn";s:1:"5";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"5.60";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}', '', '10.55', '0.00', '0.00', '10.55', '10.55', '0.00', '10.55', 0),
(124, 1, '2014-08-04 13:34:29', 1, 'AAA1909', '07900642131_1407159232', 'AAA1786', 'Amzad', 'Mojumder', 'amzad.fof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1408277700, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(125, 1, '2014-08-04 13:59:25', 1, 'AAA1910', '07900642131_1407160763', 'AAA1786', 'Amzad', 'Mojumder', 'amzad.fof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407759300, 'collection', '', 'cash', NULL, 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"6";s:2:"sn";s:1:"6";s:5:"title";s:11:"ONION BHAJI";s:4:"note";s:0:"";s:5:"price";s:4:"2.10";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"22";s:2:"sn";s:2:"22";s:5:"title";s:16:"TANDOORI CHICKEN";s:4:"note";s:0:"";s:5:"price";s:4:"5.95";s:4:"meat";b:0;}}', '', '13.00', '0.00', '0.00', '13.00', '13.00', '0.00', '13.00', 0),
(126, 1, '2014-08-04 13:59:50', 1, 'AAA1911', '07900642131_1407160788', 'AAA1786', 'Amzad', 'Mojumder', 'amzad.fof@gmail.com', '07900642131', '', '', '', '', '', '', '', '', 1408018500, 'collection', '', 'cash', NULL, 'a:3:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"5";s:2:"sn";s:1:"5";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"5.60";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '13.50', '0.00', '0.00', '13.50', '13.50', '0.00', '13.50', 0),
(127, 1, '2014-08-04 20:03:50', 1, 'AAA1912', '07900642131_1407182507', 'AAA1786', 'amzad', 'Mojumder', 'issac_kahn@hotmail.com', '07900642131', '', '', '', '', '', '', '', '', 1407845700, 'collection', '', 'paypal', 'Pending', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '7.90', '0.00', '0.00', '7.90', '7.90', '0.00', '7.90', 0),
(128, 1, '2014-08-04 20:10:05', 1, 'AAA1913', '07900642131_1407182926', 'AAA1786', 'amzad', 'Mojumder', 'issac_kahn@hotmail.com', '07900642131', '', '', '', '', '', '', '', '', 1408450500, 'collection', '', 'paypal', 'Pending', 'a:1:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '3.95', '0.00', '0.00', '3.95', '3.95', '0.00', '3.95', 0),
(129, 1, '2014-08-04 21:26:14', 1, 'AAA1914', '07900642131_1407187500', 'AAA1786', 'amzad', 'Mojumder', 'issac_kahn@hotmail.com', '07900642131', '', '', '', '', '', '', '', '', 1408277700, 'collection', '', 'paypal', 'Pending', 'a:4:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"28";s:2:"sn";s:2:"28";s:5:"title";s:20:"CHICKEN TIKKA MASALA";s:4:"note";s:0:"";s:5:"price";s:4:"6.50";s:4:"meat";b:0;}}', '', '19.35', '0.00', '0.00', '19.35', '19.35', '0.00', '19.35', 0),
(130, 1, '2014-08-12 18:39:27', 1, 'AAA1915', 'jm_1407868755', 'AAA1786', 'lalita', 'sahu', 'lalita@allinepos.co.uk', 'jm', '', '', '', '', '', '', '', '', 1407874500, 'collection', '', 'cash', NULL, 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}}', '', '7.90', '0.00', '0.00', '7.90', '7.90', '0.00', '7.90', 0),
(131, 1, '2014-08-17 11:07:55', 1, 'AAA1916', '07900642131_1408273514', 'AAA1786', 'Amzad', 'Mojumder', 'amjad@conosurtek.net', '07900642131', '', '', '', '', '', '', '', '', 1408968900, 'collection', '', 'paypal', 'Pending', 'a:11:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"2";s:2:"sn";s:1:"2";s:5:"title";s:10:"KEBAB ROLL";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:5;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:6;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"4";s:2:"sn";s:1:"4";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"4.10";s:4:"meat";b:0;}i:7;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:8;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:9;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}i:10;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}', '', '47.60', '0.00', '0.00', '47.60', '47.60', '0.00', '47.60', 0),
(132, 1, '2014-08-17 11:09:22', 1, 'AAA1917', '07900642131_1408273720', 'AAA1786', 'Amzad', 'Mojumder', 'amjad@conosurtek.net', '07900642131', '', '', '', '', '', '', '', '', 1408277700, 'collection', '', 'paypal', 'Pending', 'a:7:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"4";s:2:"sn";s:1:"4";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"4.10";s:4:"meat";b:0;}i:2;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"6";s:2:"sn";s:1:"6";s:5:"title";s:11:"ONION BHAJI";s:4:"note";s:0:"";s:5:"price";s:4:"2.10";s:4:"meat";b:0;}i:3;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"4";s:2:"sn";s:1:"4";s:5:"title";s:14:"CHILLI  PANEER";s:4:"note";s:0:"";s:5:"price";s:4:"4.10";s:4:"meat";b:0;}i:4;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"62";s:2:"sn";s:2:"62";s:5:"title";s:11:"BHUNA GOSHT";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:5;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"63";s:2:"sn";s:2:"63";s:5:"title";s:11:"METHI GOSHT";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}i:6;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:2:"65";s:2:"sn";s:2:"65";s:5:"title";s:13:"LAMB VINDALOO";s:4:"note";s:0:"";s:5:"price";s:4:"5.10";s:4:"meat";b:0;}}', '', '29.55', '0.00', '0.00', '29.55', '29.55', '0.00', '29.55', 0),
(133, 1, '2014-08-24 08:42:31', 1, 'AAA1918', '07900642131_1408869560', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', '', '', '', '', '', '', '', 1408882500, 'collection', 'Amzad', 'cash', 'NotConfirmed', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}', '', '8.90', '0.00', '0.00', '8.90', '8.90', '0.00', '8.90', 0),
(134, 1, '2014-08-24 15:24:30', 1, 'AAA1919', '07900642131_1408893774', 'AAA1786', 'Amzad', 'Mojumder', 'amzadfof@gmail.com', '07900642131', '48', '', '', '', '', '', '', '', 1408904100, 'collection', 'Amzad', 'cash', 'NotConfirmed', 'a:2:{i:0;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"1";s:2:"sn";s:1:"1";s:5:"title";s:13:"MIXED STARTER";s:4:"note";s:0:"";s:5:"price";s:4:"3.95";s:4:"meat";b:0;}i:1;a:7:{s:8:"quantity";i:1;s:10:"product_id";s:1:"3";s:2:"sn";s:1:"3";s:5:"title";s:12:"PANEER TIKKA";s:4:"note";s:0:"";s:5:"price";s:4:"4.95";s:4:"meat";b:0;}}', 'This is a automated test order. DO NOT COOK !!', '8.90', '0.00', '0.00', '8.90', '8.90', '0.00', '8.90', 0);

--
-- Triggers `orders`
--
DROP TRIGGER IF EXISTS `trg_order`;
DELIMITER //
CREATE TRIGGER `trg_order` BEFORE INSERT ON `orders`
 FOR EACH ROW BEGIN

    DECLARE last_code char(10);
    SET last_code =  (SELECT order_code FROM orders ORDER BY id DESC LIMIT 0, 1);

    IF last_code IS NULL THEN
      SET NEW.order_code = 'AAA1786';
      INSERT INTO orders_cwdp (order_code) VALUES ('AAA1786');
    ELSE
      SET NEW.order_code = GetUnID(last_code);
      INSERT INTO orders_cwdp (order_code) VALUES (NEW.order_code);
    END IF;

  END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_cwdp`
--

CREATE TABLE IF NOT EXISTS `orders_cwdp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `order_code` varchar(7) NOT NULL,
  `printed` tinyint(4) NOT NULL DEFAULT '0',
  `print_time` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_code` (`order_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=135 ;

--
-- Dumping data for table `orders_cwdp`
--

INSERT INTO `orders_cwdp` (`id`, `login_id`, `updated`, `active`, `order_code`, `printed`, `print_time`) VALUES
(1, 1, '2014-08-10 20:17:35', 1, 'AAA1786', 1, 1407701817),
(2, 1, '2014-08-10 20:18:24', 1, 'AAA1787', 1, 1407701866),
(3, 1, '2014-08-10 20:19:14', 1, 'AAA1788', 1, 1407701916),
(4, 1, '2014-08-10 20:20:05', 1, 'AAA1789', 1, 1407701967),
(5, 1, '2014-08-10 20:31:46', 1, 'AAA1790', 1, 1407702668),
(6, 1, '2014-08-11 20:54:06', 1, 'AAA1791', 1, 1407790402),
(7, 1, '2014-08-11 20:55:27', 1, 'AAA1792', 1, 1407790483),
(8, 1, '2014-08-11 20:56:17', 1, 'AAA1793', 1, 1407790533),
(9, 1, '2014-08-11 21:03:14', 1, 'AAA1794', 1, 1407848588),
(10, 1, '2014-08-11 21:04:04', 1, 'AAA1795', 1, 1407848638),
(11, 1, '2014-08-11 21:04:55', 1, 'AAA1796', 1, 1407848689),
(12, 1, '2014-08-11 21:05:44', 1, 'AAA1797', 1, 1407848738),
(13, 1, '2014-08-11 21:06:34', 1, 'AAA1798', 1, 1407848788),
(14, 1, '2014-08-11 21:07:24', 1, 'AAA1799', 1, 1407848838),
(15, 1, '2014-08-11 21:08:14', 1, 'AAA1800', 1, 1407848888),
(16, 1, '2014-08-11 21:09:04', 1, 'AAA1801', 1, 1407848938),
(17, 1, '2014-08-11 21:09:54', 1, 'AAA1802', 1, 1407848988),
(18, 1, '2014-08-11 21:10:27', 1, 'AAA1803', 1, 1407849021),
(19, 1, '2014-08-11 21:11:16', 1, 'AAA1804', 1, 1407849070),
(20, 1, '2014-08-11 21:12:05', 1, 'AAA1805', 1, 1407849119),
(21, 1, '2014-08-11 21:12:55', 1, 'AAA1806', 1, 1407849170),
(22, 1, '2014-08-11 21:13:45', 1, 'AAA1807', 1, 1407849220),
(23, 1, '2014-08-11 21:14:35', 1, 'AAA1808', 1, 1407849269),
(24, 1, '2014-08-11 21:43:17', 1, 'AAA1809', 1, 1407850991),
(25, 1, '2014-08-11 21:44:07', 1, 'AAA1810', 1, 1407851041),
(26, 1, '2014-08-11 21:44:57', 1, 'AAA1811', 1, 1407851091),
(27, 1, '2014-08-11 21:45:47', 1, 'AAA1812', 1, 1407851141),
(28, 1, '2014-08-11 21:46:37', 1, 'AAA1813', 1, 1407851191),
(29, 1, '2014-08-11 21:47:27', 1, 'AAA1814', 1, 1407851241),
(30, 1, '2014-08-11 21:48:17', 1, 'AAA1815', 1, 1407851291),
(31, 1, '2014-08-11 21:49:07', 1, 'AAA1816', 1, 1407851341),
(32, 1, '2014-08-11 21:49:35', 1, 'AAA1817', 1, 1407851369),
(33, 1, '2014-08-11 21:50:25', 1, 'AAA1818', 1, 1407851419),
(34, 1, '2014-08-11 21:51:15', 1, 'AAA1819', 1, 1407851469),
(35, 1, '2014-08-11 21:52:05', 1, 'AAA1820', 1, 1407851519),
(36, 1, '2014-08-11 21:52:09', 1, 'AAA1821', 1, 1407793880),
(37, 1, '2014-08-11 21:52:55', 1, 'AAA1822', 1, 1407851569),
(38, 1, '2014-08-11 21:53:45', 1, 'AAA1823', 1, 1407851619),
(39, 1, '2014-08-11 21:54:00', 1, 'AAA1824', 1, 1407793990),
(40, 1, '2014-08-11 21:54:35', 1, 'AAA1825', 1, 1407851669),
(41, 1, '2014-08-11 21:55:25', 1, 'AAA1826', 1, 1407851719),
(42, 1, '2014-08-11 21:56:15', 1, 'AAA1827', 1, 1407851769),
(43, 1, '2014-08-11 21:56:37', 1, 'AAA1828', 1, 1407794146),
(44, 1, '2014-08-11 21:57:06', 1, 'AAA1829', 1, 1407851820),
(45, 1, '2014-08-11 21:57:56', 1, 'AAA1830', 1, 1407851870),
(46, 1, '2014-08-11 21:58:46', 1, 'AAA1831', 1, 1407851920),
(47, 1, '2014-08-11 21:59:56', 1, 'AAA1832', 1, 1407851990),
(48, 1, '2014-08-11 22:00:33', 1, 'AAA1833', 1, 1407794382),
(49, 1, '2014-08-11 22:00:46', 1, 'AAA1834', 1, 1407852040),
(50, 1, '2014-08-11 22:01:36', 1, 'AAA1835', 1, 1407852090),
(51, 1, '2014-08-11 22:02:26', 1, 'AAA1836', 1, 1407852140),
(52, 1, '2014-08-11 22:03:16', 1, 'AAA1837', 1, 1407852190),
(53, 1, '2014-08-11 22:04:06', 1, 'AAA1838', 1, 1407852240),
(54, 1, '2014-08-15 20:11:00', 1, 'AAA1839', 1, 1408133416),
(55, 1, '2014-08-15 20:11:49', 1, 'AAA1840', 1, 1408133466),
(56, 1, '2014-08-15 20:21:15', 1, 'AAA1841', 1, 1408134032),
(57, 1, '2014-08-15 20:34:11', 1, 'AAA1842', 1, 1408192442),
(58, 1, '2014-08-15 20:35:01', 1, 'AAA1843', 1, 1408192491),
(59, 1, '2014-08-15 20:35:51', 1, 'AAA1844', 1, 1408192541),
(60, 1, '2014-08-15 20:36:41', 1, 'AAA1845', 1, 1408192591),
(61, 1, '2014-07-21 04:25:31', 1, 'AAA1846', 0, NULL),
(62, 1, '2014-07-21 04:48:00', 1, 'AAA1847', 0, NULL),
(63, 1, '2014-07-21 07:57:59', 1, 'AAA1848', 0, NULL),
(64, 1, '2014-07-21 09:44:10', 1, 'AAA1849', 0, NULL),
(65, 1, '2014-07-21 09:46:24', 1, 'AAA1850', 0, NULL),
(66, 1, '2014-07-21 09:53:30', 1, 'AAA1851', 0, NULL),
(67, 1, '2014-07-21 09:55:09', 1, 'AAA1852', 0, NULL),
(68, 1, '2014-07-21 09:55:25', 1, 'AAA1853', 0, NULL),
(69, 1, '2014-07-21 10:19:10', 1, 'AAA1854', 0, NULL),
(70, 1, '2014-07-21 10:25:22', 1, 'AAA1855', 0, NULL),
(71, 1, '2014-07-21 10:27:37', 1, 'AAA1856', 0, NULL),
(72, 1, '2014-07-21 10:37:44', 1, 'AAA1857', 0, NULL),
(73, 1, '2014-07-22 15:46:11', 1, 'AAA1858', 0, NULL),
(74, 1, '2014-07-22 18:34:58', 1, 'AAA1859', 0, NULL),
(75, 1, '2014-07-22 19:21:43', 1, 'AAA1860', 0, NULL),
(76, 1, '2014-07-22 19:22:29', 1, 'AAA1861', 0, NULL),
(77, 1, '2014-07-23 03:28:32', 1, 'AAA1862', 0, NULL),
(78, 1, '2014-07-23 03:29:49', 1, 'AAA1863', 0, NULL),
(79, 1, '2014-07-23 03:33:51', 1, 'AAA1864', 0, NULL),
(80, 1, '2014-07-23 03:34:44', 1, 'AAA1865', 0, NULL),
(81, 1, '2014-07-23 03:36:33', 1, 'AAA1866', 0, NULL),
(82, 1, '2014-07-25 10:08:01', 1, 'AAA1867', 0, NULL),
(83, 1, '2014-07-26 19:04:07', 1, 'AAA1868', 0, NULL),
(84, 1, '2014-07-26 19:10:03', 1, 'AAA1869', 0, NULL),
(85, 1, '2014-07-27 19:19:42', 1, 'AAA1870', 0, NULL),
(86, 1, '2014-07-27 19:37:09', 1, 'AAA1871', 0, NULL),
(87, 1, '2014-07-27 21:00:18', 1, 'AAA1872', 0, NULL),
(88, 1, '2014-07-27 22:31:35', 1, 'AAA1873', 0, NULL),
(89, 1, '2014-07-27 22:32:50', 1, 'AAA1874', 0, NULL),
(90, 1, '2014-07-27 22:36:07', 1, 'AAA1875', 0, NULL),
(91, 1, '2014-07-27 22:37:59', 1, 'AAA1876', 0, NULL),
(92, 1, '2014-07-27 22:38:55', 1, 'AAA1877', 0, NULL),
(93, 1, '2014-07-27 22:40:44', 1, 'AAA1878', 0, NULL),
(94, 1, '2014-07-27 22:42:53', 1, 'AAA1879', 0, NULL),
(95, 1, '2014-07-27 22:44:38', 1, 'AAA1880', 0, NULL),
(96, 1, '2014-07-27 23:07:24', 1, 'AAA1881', 0, NULL),
(97, 1, '2014-07-27 23:09:19', 1, 'AAA1882', 0, NULL),
(98, 1, '2014-07-27 23:11:13', 1, 'AAA1883', 0, NULL),
(99, 1, '2014-07-27 23:12:17', 1, 'AAA1884', 0, NULL),
(100, 1, '2014-07-27 23:13:00', 1, 'AAA1885', 0, NULL),
(101, 1, '2014-07-27 23:14:44', 1, 'AAA1886', 0, NULL),
(102, 1, '2014-07-27 23:25:38', 1, 'AAA1887', 0, NULL),
(103, 1, '2014-07-27 23:26:20', 1, 'AAA1888', 0, NULL),
(104, 1, '2014-07-27 23:28:12', 1, 'AAA1889', 0, NULL),
(105, 1, '2014-07-27 23:30:29', 1, 'AAA1890', 0, NULL),
(106, 1, '2014-07-27 23:31:25', 1, 'AAA1891', 0, NULL),
(107, 1, '2014-07-27 23:51:19', 1, 'AAA1892', 0, NULL),
(108, 1, '2014-07-28 01:49:23', 1, 'AAA1893', 0, NULL),
(109, 1, '2014-07-28 18:53:58', 1, 'AAA1894', 0, NULL),
(110, 1, '2014-07-28 18:54:41', 1, 'AAA1895', 0, NULL),
(111, 1, '2014-07-28 18:56:05', 1, 'AAA1896', 0, NULL),
(112, 1, '2014-07-28 18:58:52', 1, 'AAA1897', 0, NULL),
(113, 1, '2014-07-28 19:02:01', 1, 'AAA1898', 0, NULL),
(114, 1, '2014-07-29 01:41:10', 1, 'AAA1899', 0, NULL),
(115, 1, '2014-07-30 23:42:36', 1, 'AAA1900', 0, NULL),
(116, 1, '2014-07-31 01:05:45', 1, 'AAA1901', 0, NULL),
(117, 1, '2014-08-03 15:57:47', 1, 'AAA1902', 0, NULL),
(118, 1, '2014-08-03 17:01:44', 1, 'AAA1903', 0, NULL),
(119, 1, '2014-08-04 11:22:00', 1, 'AAA1904', 0, NULL),
(120, 1, '2014-08-04 11:23:10', 1, 'AAA1905', 0, NULL),
(121, 1, '2014-08-04 11:24:14', 1, 'AAA1906', 0, NULL),
(122, 1, '2014-08-04 11:25:30', 1, 'AAA1907', 0, NULL),
(123, 1, '2014-08-04 11:26:20', 1, 'AAA1908', 0, NULL),
(124, 1, '2014-08-04 13:34:29', 1, 'AAA1909', 0, NULL),
(125, 1, '2014-08-04 13:59:25', 1, 'AAA1910', 0, NULL),
(126, 1, '2014-08-04 13:59:50', 1, 'AAA1911', 0, NULL),
(127, 1, '2014-08-04 20:03:50', 1, 'AAA1912', 0, NULL),
(128, 1, '2014-08-04 20:10:05', 1, 'AAA1913', 0, NULL),
(129, 1, '2014-08-04 21:26:14', 1, 'AAA1914', 0, NULL),
(130, 1, '2014-08-12 18:39:27', 1, 'AAA1915', 0, NULL),
(131, 1, '2014-08-17 11:07:55', 1, 'AAA1916', 0, NULL),
(132, 1, '2014-08-17 11:09:22', 1, 'AAA1917', 0, NULL),
(133, 1, '2014-08-24 08:42:31', 1, 'AAA1918', 0, NULL),
(134, 1, '2014-08-24 15:24:30', 1, 'AAA1919', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_contact`
--

CREATE TABLE IF NOT EXISTS `page_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `api` varchar(128) DEFAULT NULL,
  `lat` varchar(32) DEFAULT NULL,
  `lng` varchar(32) DEFAULT NULL,
  `marker_src` text,
  `marker_visible` tinyint(4) DEFAULT NULL,
  `zoom` int(11) DEFAULT '16',
  `width` varchar(32) DEFAULT '100%',
  `height` varchar(32) DEFAULT '300px',
  `page_template` varchar(128) DEFAULT 'about/contact',
  `map_active` int(4) DEFAULT NULL,
  `contact_form` int(4) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `phone` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `page_contact`
--

INSERT INTO `page_contact` (`id`, `login_id`, `updated`, `active`, `api`, `lat`, `lng`, `marker_src`, `marker_visible`, `zoom`, `width`, `height`, `page_template`, `map_active`, `contact_form`, `address`, `phone`) VALUES
(1, 1, '0000-00-00 00:00:00', 1, '', '51.554998', '-0.315994', '#', 1, 16, '100%', '400px', '/about/contact', 1, 1, '#', '#');

-- --------------------------------------------------------

--
-- Table structure for table `pay_card`
--

CREATE TABLE IF NOT EXISTS `pay_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `acquirer` varchar(128) DEFAULT NULL,
  `pre_shared_key` text,
  `merchant_id` varchar(256) DEFAULT NULL,
  `password` varchar(256) DEFAULT NULL,
  `pre_shared_key_test` text,
  `merchant_id_test` varchar(256) DEFAULT NULL,
  `password_test` varchar(256) DEFAULT NULL,
  `order_description` varchar(256) DEFAULT NULL,
  `transaction_type` varchar(256) DEFAULT 'SALE',
  `fdms_mid` varchar(256) DEFAULT NULL,
  `test_node` tinyint(4) NOT NULL DEFAULT '0',
  `image` text,
  `credit_card_fee` decimal(20,2) DEFAULT '0.20',
  `debit_card_fee` decimal(20,2) DEFAULT '2.20',
  `flat_fee` decimal(20,2) DEFAULT '-2.00' COMMENT 'if -2, Apply Calculated Fee ',
  `pay_after_transaction` tinyint(4) NOT NULL DEFAULT '0',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='### ' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pay_card`
--

INSERT INTO `pay_card` (`id`, `login_id`, `updated`, `active`, `acquirer`, `pre_shared_key`, `merchant_id`, `password`, `pre_shared_key_test`, `merchant_id_test`, `password_test`, `order_description`, `transaction_type`, `fdms_mid`, `test_node`, `image`, `credit_card_fee`, `debit_card_fee`, `flat_fee`, `pay_after_transaction`, `min_order_value`) VALUES
(1, 1, '2014-07-04 09:52:17', 1, 'payment_sense', 'test', 'test', 'test', 'test', 'test', 'test', 'test', 'SALE', 'test', 0, 'img', '0.20', '2.20', '-2.00', 0, '10.00');

-- --------------------------------------------------------

--
-- Table structure for table `pay_cash`
--

CREATE TABLE IF NOT EXISTS `pay_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  `captcha` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='###Not updateable with form. Has to update via software / db process' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pay_cash`
--

INSERT INTO `pay_cash` (`id`, `login_id`, `updated`, `active`, `min_order_value`, `captcha`) VALUES
(1, 1, '2014-07-04 09:06:58', 1, '10.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pay_paypal`
--

CREATE TABLE IF NOT EXISTS `pay_paypal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL DEFAULT '1',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `api_username` text,
  `api_password` text,
  `api_signature` text,
  `test_api_username` text,
  `test_api_password` text,
  `test_api_signature` text,
  `image` text,
  `transaction_fee` decimal(20,2) DEFAULT '0.20',
  `commision` decimal(20,2) DEFAULT '3.20',
  `min_order_value` decimal(20,2) DEFAULT '10.00',
  `email_address` varchar(512) DEFAULT 'paypal@allinepos.co.uk',
  `action_type` varchar(32) DEFAULT 'integrated' COMMENT 'paynow/integrated/payment_pro',
  `sandbox` tinyint(4) NOT NULL DEFAULT '0',
  `flat_fee` decimal(20,2) DEFAULT '0.20',
  `pay_after_transaction` tinyint(4) NOT NULL DEFAULT '0',
  `index_redirect_url` varchar(512) DEFAULT NULL,
  `log_dir` varchar(512) DEFAULT NULL,
  `transaction_log` varchar(512) DEFAULT NULL,
  `exception_log` varchar(512) DEFAULT NULL,
  `log_file_active` tinyint(4) NOT NULL DEFAULT '1',
  `http_response_log` varchar(512) NOT NULL DEFAULT '1',
  `http_response_log_active` tinyint(4) NOT NULL DEFAULT '1',
  `log_query_string_active` tinyint(4) NOT NULL DEFAULT '1',
  `completed_message` text,
  `pending_message` text,
  `success_url` varchar(512) DEFAULT NULL,
  `pending_url` varchar(512) DEFAULT NULL,
  `site_logo` varchar(512) DEFAULT NULL,
  `cart_border_color` varchar(256) DEFAULT NULL,
  `currency_code` varchar(256) DEFAULT NULL,
  `return_url` varchar(256) DEFAULT NULL,
  `cancel_url` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='###Not updateable with form. Has to update via software / db process' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `pay_paypal`
--

INSERT INTO `pay_paypal` (`id`, `login_id`, `updated`, `active`, `api_username`, `api_password`, `api_signature`, `test_api_username`, `test_api_password`, `test_api_signature`, `image`, `transaction_fee`, `commision`, `min_order_value`, `email_address`, `action_type`, `sandbox`, `flat_fee`, `pay_after_transaction`, `index_redirect_url`, `log_dir`, `transaction_log`, `exception_log`, `log_file_active`, `http_response_log`, `http_response_log_active`, `log_query_string_active`, `completed_message`, `pending_message`, `success_url`, `pending_url`, `site_logo`, `cart_border_color`, `currency_code`, `return_url`, `cancel_url`) VALUES
(1, 230, '2014-07-21 03:24:22', 1, 'm82amjad_api1.hotmail.co.uk', 'W4W9MCXCZ9DL4938', 'AamyNj8hYYmtqQkScocIJA2nHc2KAphH9D-oD3aGUcOr8fR.riuDM75B', 'seller_1317255315_biz_api1.gmail.com', '1317255350', 'AFcWxV21C7fd0v3bYYYRCpSSRl31AsEXo1mfs5m9KpiElKsbTiQR9C2V', '#', '0.20', '3.40', '5.00', 'm82amjad@gmail.com', 'integrated', 1, '-2.00', 0, 'takeaway/confirm', 'var/log', 'paypal.log', 'exception.log', 1, 'paypal_http_response.log', 1, 1, 'Payment Received! Your product will be sent to you very soon!', 'Transaction Complete. But payment is still pending! <br /> You need to manually authorize this payment in your <a href=''http://www.paypal.com''>Paypal Account</a>', 'takeaway/process_order', 'takeaway/process_order', 'http://al-aminrestaurant.co.uk/img/menu/logoPaypal.png', '000000', 'GBP', 'paypal/process', 'takeaway/order_details');

-- --------------------------------------------------------

--
-- Table structure for table `prod_category`
--

CREATE TABLE IF NOT EXISTS `prod_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL,
  `sn` int(11) NOT NULL DEFAULT '1',
  `parent_category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `description` text,
  `takeaway_sit_in` varchar(32) NOT NULL DEFAULT 'takeaway',
  `image_src` text,
  `image_href` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `prod_category`
--

INSERT INTO `prod_category` (`id`, `login_id`, `updated`, `active`, `sn`, `parent_category_id`, `title`, `description`, `takeaway_sit_in`, `image_src`, `image_href`) VALUES
(1, 1, '0000-00-00 00:00:00', 1, 1, 0, 'Takeaway Menu', '', '', '', ''),
(2, 1, '0000-00-00 00:00:00', 1, 2, 1, 'STARTERS', '', '', '', ''),
(3, 1, '0000-00-00 00:00:00', 1, 3, 1, 'TANDOORI DISHES', '', '', '', ''),
(4, 1, '0000-00-00 00:00:00', 1, 4, 1, 'BALTI DISHES', 'Served with Nan Bread', '', '', ''),
(5, 1, '0000-00-00 00:00:00', 1, 5, 1, 'HOUSE SPECIALITIES', '', '', '', ''),
(6, 1, '0000-00-00 00:00:00', 1, 6, 1, 'PERSIAN DISHES', 'Served with pilau rice', '', '', ''),
(7, 1, '0000-00-00 00:00:00', 1, 7, 1, 'TRADITIONAL FAVORITES', '', '', '', ''),
(8, 1, '0000-00-00 00:00:00', 1, 8, 1, 'BIRYANI DISHES', 'All biriyani dishes cooked with saffron flavoured basmati rice and served with vegetable curry', '', '', ''),
(9, 1, '0000-00-00 00:00:00', 1, 9, 1, 'MIXED DISHES', '', '', '', ''),
(10, 1, '0000-00-00 00:00:00', 1, 10, 1, 'VEGETABLE SIDE DISHES', '', '', '', ''),
(11, 1, '0000-00-00 00:00:00', 1, 11, 1, 'INDIAN BREADS & SUNDRIES', '', '', '', ''),
(12, 1, '0000-00-00 00:00:00', 1, 12, 1, 'RICE DISHES', '', '', '', ''),
(13, 1, '0000-00-00 00:00:00', 1, 13, 1, 'ENGLISH DISHES', '', '', '', ''),
(14, 1, '0000-00-00 00:00:00', 1, 14, 1, 'SWEETS', '', '', '', ''),
(15, 1, '0000-00-00 00:00:00', 1, 15, 1, 'FRUITS', '', '', '', ''),
(16, 1, '0000-00-00 00:00:00', 1, 16, 1, 'DRINKS', '', '', '', ''),
(17, 1, '0000-00-00 00:00:00', 1, 17, 1, 'CURRY SAUCE', '', '', '', ''),
(18, 1, '0000-00-00 00:00:00', 1, 18, 1, 'SET MEAL', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `prod_list`
--

CREATE TABLE IF NOT EXISTS `prod_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL,
  `sn` int(11) NOT NULL DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `short_name` varchar(128) DEFAULT '#',
  `name_kitchen` varchar(128) DEFAULT '#',
  `description` text,
  `price` decimal(20,2) DEFAULT '0.00',
  `prod_category_id` int(11) NOT NULL DEFAULT '1',
  `vat` decimal(20,2) NOT NULL DEFAULT '-2.00',
  `instruction` text,
  `default_note` text,
  `note_must` tinyint(4) NOT NULL DEFAULT '0',
  `note_show` tinyint(4) DEFAULT '0',
  `prod_code` varchar(32) DEFAULT '#',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=188 ;

--
-- Dumping data for table `prod_list`
--

INSERT INTO `prod_list` (`id`, `login_id`, `updated`, `active`, `sn`, `title`, `short_name`, `name_kitchen`, `description`, `price`, `prod_category_id`, `vat`, `instruction`, `default_note`, `note_must`, `note_show`, `prod_code`) VALUES
(1, 1, '0000-00-00 00:00:00', 1, 1, 'DALL SOUP', '#', '#', 'A soup made with lentils to our own recipe', '2.75', 2, '0.00', '#', '#', 0, 0, '1'),
(2, 1, '0000-00-00 00:00:00', 1, 2, 'MULLIGATAWNY SOUP', '#', '#', 'A traditional soup with mixed spices', '2.75', 2, '0.00', '#', '#', 0, 0, '2'),
(3, 1, '0000-00-00 00:00:00', 1, 3, 'ONION BHAJI', '#', '#', '', '2.60', 2, '0.00', '#', '#', 0, 0, '3'),
(4, 1, '0000-00-00 00:00:00', 1, 4, 'SAMOSA', '#', '#', 'Spiced mixed vegetables or minced mear fried in crispy light pastry', '2.60', 2, '0.00', '#', '#', 0, 0, '4'),
(5, 1, '0000-00-00 00:00:00', 1, 5, 'ALOO CHAT', '#', '#', 'Diced boiled potatoes mixed with fresh coriander&#44; green chillies&#44;tamarind sauce and chat masala', '2.70', 2, '0.00', '#', '#', 0, 0, '5'),
(6, 1, '0000-00-00 00:00:00', 1, 6, 'PRAWN COCKTAIL', '#', '#', '', '2.75', 2, '0.00', '#', '#', 0, 0, '6'),
(7, 1, '0000-00-00 00:00:00', 1, 7, 'CHICKEN CHAT', '#', '#', 'Cubes of chicken&#44; capsicum&#44; tomatoes mixed with special chat masala', '2.95', 2, '0.00', '#', '#', 0, 0, '7'),
(8, 1, '0000-00-00 00:00:00', 1, 8, 'KING PRAWN BUTTERFLY', '#', '#', 'Mildly spiced king prawns fried in butter', '4.75', 2, '0.00', '#', '#', 0, 0, '8'),
(9, 1, '0000-00-00 00:00:00', 1, 9, 'PRAWN PUREE', '#', '#', 'Spicy prawns&#44; served on fried unleavened bread', '4.00', 2, '0.00', '#', '#', 0, 0, '9'),
(10, 1, '0000-00-00 00:00:00', 1, 10, 'KING PRAWN PUREE', '#', '#', 'Spicy king prawns&#44; served on fried unleavened bread', '4.95', 2, '0.00', '#', '#', 0, 0, '10'),
(11, 1, '0000-00-00 00:00:00', 1, 11, 'TIKKA', '#', '#', 'Boneless pieces of marinated chicken/lamb&#44; cooked over charcoal on skewers', '3.50', 2, '0.00', '#', '#', 0, 0, '11'),
(12, 1, '0000-00-00 00:00:00', 1, 12, 'SHEEK KEBAB', '#', '#', 'Spiced minced lamb cooked over charcoal on skewers', '3.30', 2, '0.00', '#', '#', 0, 0, '12'),
(13, 1, '0000-00-00 00:00:00', 1, 13, 'SHAMI KEBAB', '#', '#', 'A blend of minced lamb spiced with fresh herbs&#44; shallow fried', '3.30', 2, '0.00', '#', '#', 0, 0, '13'),
(14, 1, '0000-00-00 00:00:00', 1, 14, 'RESHMI KEBAB', '#', '#', 'Lamb minced with herbs and spices', '3.30', 2, '0.00', '#', '#', 0, 0, '14'),
(15, 1, '0000-00-00 00:00:00', 1, 15, 'TANDOORI CHICKEN', '#', '#', '1/4 Spring chicken marinated in spices', '3.20', 2, '0.00', '#', '#', 0, 0, '15'),
(16, 1, '0000-00-00 00:00:00', 1, 16, 'TANDOORI KING PRAWN', '#', '#', 'King prawns marinted in spices', '5.65', 2, '0.00', '#', '#', 0, 0, '16'),
(17, 1, '0000-00-00 00:00:00', 1, 17, 'CHICKEN PAKURA', '#', '#', '', '3.75', 2, '0.00', '#', '#', 0, 0, '17'),
(18, 1, '0000-00-00 00:00:00', 1, 18, 'TANDOORI CHICKEN (Half)', '#', '#', 'Spring chicken&#44; marinted in spices and yoghurt', '5.95', 3, '0.00', '#', '#', 0, 0, '18'),
(19, 0, '0000-00-00 00:00:00', 0, 19, 'TANDOORI CHICKEN (Whole)', '#', '#', 'Spring chicken&#44; marinted in spices and yoghurt', '11.20', 3, '0.00', '', '', 0, 0, '19'),
(20, 1, '0000-00-00 00:00:00', 1, 20, 'TIKKA', '#', '#', 'Diced marinated chicken/lamb&#44; cooked over charcoal on skewers', '5.95', 3, '0.00', '#', '#', 0, 0, '20'),
(21, 1, '0000-00-00 00:00:00', 1, 21, 'CHICKEN SHASHLIC', '#', '#', 'Boneless pieces of marinated chicken cooked on skewers with onions&#44; capsicums and tomatoes', '6.95', 3, '0.00', '#', '#', 0, 0, '21'),
(22, 1, '0000-00-00 00:00:00', 1, 22, 'KING PRAWN SHASHLIC', '#', '#', '', '11.45', 3, '0.00', '#', '#', 0, 0, '22'),
(23, 1, '0000-00-00 00:00:00', 1, 23, 'HASINA-E-KEBAB', '#', '#', 'Diced marinated lamb cooked on skewers with onions&#44;capsicums and tomatoes', '7.10', 3, '0.00', '#', '#', 0, 0, '23'),
(24, 1, '0000-00-00 00:00:00', 1, 24, 'TANDOORI KING PRAWN', '#', '#', 'King prawns marinated special spices cooked over charcoal on skewers .', '10.45', 3, '0.00', '#', '#', 0, 0, '24'),
(25, 1, '0000-00-00 00:00:00', 1, 25, ' TANDOORI MIX GRILL', '#', '#', 'Marinated lamb&#44; chicken&#44; kebab and pieces of tandoori chicken&#44; served with Nan', '9.50', 3, '0.00', '#', '#', 0, 0, '25'),
(26, 1, '0000-00-00 00:00:00', 1, 26, 'PANEER SHASHLIC', '#', '#', 'Cheese cooked on skewers with onion&#44; tomato&#44; capsicum', '5.75', 3, '0.00', '#', '#', 0, 0, '26'),
(27, 0, '0000-00-00 00:00:00', 0, 27, 'BALTI BURGH  HEATH SPECIAL', '#', '#', 'Chicken&#44; lamb&#44; prawn & vegetable', '8.90', 4, '0.00', '', '', 0, 0, '27'),
(28, 1, '0000-00-00 00:00:00', 1, 28, 'SOUTH INDIAN GARLIC BALTI', '#', '#', '', '8.95', 4, '0.00', '#', '#', 0, 0, '28'),
(29, 1, '0000-00-00 00:00:00', 1, 29, 'BALTI CHICKEN BHUNA', '#', '#', '', '7.75', 4, '0.00', '#', '#', 0, 0, '29'),
(30, 1, '0000-00-00 00:00:00', 1, 30, 'BALTI LAMB BHUNA', '#', '#', '', '7.95', 4, '0.00', '#', '#', 0, 0, '30'),
(31, 1, '0000-00-00 00:00:00', 1, 31, 'BALTI PRAWN BHUNA', '#', '#', '', '8.90', 4, '0.00', '#', '#', 0, 0, '31'),
(32, 1, '0000-00-00 00:00:00', 1, 32, 'BALTI KING PRAWN BHUNA', '#', '#', '', '11.50', 4, '0.00', '#', '#', 0, 0, '32'),
(33, 1, '0000-00-00 00:00:00', 1, 33, 'BALTI TIKKA BHUNA', '#', '#', '', '8.75', 4, '0.00', '#', '#', 0, 0, '33'),
(34, 1, '0000-00-00 00:00:00', 1, 34, 'BALTI DANSAK', '#', '#', '', '8.75', 4, '0.00', '#', '#', 0, 0, '34'),
(35, 1, '0000-00-00 00:00:00', 1, 35, 'BALTI TANDOORI KING PRAWN BHUNA', '#', '#', '', '11.95', 4, '0.00', '#', '#', 0, 0, '35'),
(36, 1, '0000-00-00 00:00:00', 1, 36, 'BALTI TIKKA MASALA', '#', '#', '', '8.75', 4, '0.00', '#', '#', 0, 0, '36'),
(37, 1, '0000-00-00 00:00:00', 1, 37, 'BALTI CHILLI MASALA', '#', '#', '', '8.80', 4, '0.00', '#', '#', 0, 0, '37'),
(38, 1, '0000-00-00 00:00:00', 1, 38, 'BALTI REZALLA', '#', '#', 'Fairly hot with green chilli .', '6.70', 4, '0.00', '#', '#', 0, 0, '38'),
(39, 1, '0000-00-00 00:00:00', 1, 39, 'BALTI MIXED VEGETABLE', '#', '#', '', '6.70', 4, '0.00', '#', '#', 0, 0, '39'),
(40, 1, '0000-00-00 00:00:00', 1, 40, 'BALTI CAULIFLOWER', '#', '#', '', '6.70', 4, '0.00', '#', '#', 0, 0, '40'),
(41, 1, '0000-00-00 00:00:00', 1, 41, 'BALTI BHINDI', '#', '#', '', '6.70', 4, '0.00', '#', '#', 0, 0, '41'),
(42, 1, '0000-00-00 00:00:00', 1, 42, 'BALTI MUSHROOM', '#', '#', '', '6.70', 4, '0.00', '#', '#', 0, 0, '42'),
(43, 1, '0000-00-00 00:00:00', 1, 43, 'BALTI BRINJAL', '#', '#', '', '6.70', 4, '0.00', '#', '#', 0, 0, '43'),
(44, 1, '0000-00-00 00:00:00', 1, 44, 'BALTI POTATO', '#', '#', '', '6.70', 4, '0.00', '#', '#', 0, 0, '44'),
(45, 1, '0000-00-00 00:00:00', 1, 45, 'BALTI CHANA', '#', '#', '', '6.70', 4, '0.00', '#', '#', 0, 0, '45'),
(46, 1, '0000-00-00 00:00:00', 1, 46, 'BALTI SAG', '#', '#', '', '6.70', 4, '0.00', '#', '#', 0, 0, '46'),
(47, 1, '0000-00-00 00:00:00', 1, 47, 'MASALA', '#', '#', 'Charcoal grilled chicken or lamb cooked in spices with cream to our own recipe.', '6.90', 5, '0.00', '#', '#', 0, 0, '47'),
(48, 1, '0000-00-00 00:00:00', 1, 48, 'TANDOORI CHICKEN MASALA', '#', '#', 'Spring tnadoori chicken on the bone&#44; cooked in a special creamy sauce&#44; which is highly flavoured with delicate indian spices', '7.50', 5, '0.00', '#', '#', 0, 0, '48'),
(49, 1, '0000-00-00 00:00:00', 1, 49, 'TANDOORI KING PRAWN MASALA', '#', '#', 'King prawns grilled over charcoal&#44; then cooked in cream sauce with delicate spices.', '10.95', 5, '0.00', '#', '#', 0, 0, '49'),
(50, 1, '0000-00-00 00:00:00', 1, 50, 'JALFREZI', '#', '#', 'Charcoal grilled spices of chicken/lamb cooked in chopped onions&#44; ginger&#44; capsicum&#44; tomato&#44; green chillies and special sauce.', '6.90', 5, '0.00', '#', '#', 0, 0, '50'),
(51, 1, '0000-00-00 00:00:00', 1, 51, 'KEBAB COCKTAIL MASALA', '#', '#', 'Consisting of lamb tikka&#44; chicken tikka&#44; sheek kebab grilled in tandoori and cooked in a special rich sauce', '8.90', 5, '0.00', '#', '#', 0, 0, '51'),
(52, 1, '0000-00-00 00:00:00', 1, 52, 'BUTTER CHICKEN', '#', '#', 'Chicken tikka cooked in butter flavoured creamy sauce', '6.95', 5, '0.00', '#', '#', 0, 0, '52'),
(53, 1, '0000-00-00 00:00:00', 1, 53, 'DUPIAZA', '#', '#', 'Chicken lamb tikka cooked with diced onion in a spicy sauce', '6.90', 5, '0.00', '#', '#', 0, 0, '53'),
(54, 1, '0000-00-00 00:00:00', 1, 54, 'CHILLI MASALA', '#', '#', '', '6.95', 5, '0.00', '#', '#', 0, 0, '54'),
(55, 1, '0000-00-00 00:00:00', 1, 55, 'SHAHI KORMA', '#', '#', 'Meat chicken cooked with nuts and sultanas in creamy sauce.', '6.50', 5, '0.00', '#', '#', 0, 0, '55'),
(56, 1, '0000-00-00 00:00:00', 1, 56, 'KING PRAWN DELIGHT', '#', '#', '(Mild)', '10.50', 5, '0.00', '#', '#', 0, 0, '56'),
(57, 1, '0000-00-00 00:00:00', 1, 57, 'SPECIAL', '#', '#', '(Mild)', '6.80', 5, '0.00', '#', '#', 0, 0, '57'),
(58, 1, '0000-00-00 00:00:00', 1, 58, 'CHICKEN REZALLA', '#', '#', '(Mild)', '7.75', 5, '0.00', '#', '#', 0, 0, '58'),
(59, 1, '0000-00-00 00:00:00', 1, 59, 'MURGH - E- MASALA', '#', '#', 'Two quarters of tandoori chicken cooked in a medium curry with mincemeat and salad trimming.', '9.95', 5, '0.00', '#', '#', 0, 0, '59'),
(60, 1, '0000-00-00 00:00:00', 1, 60, 'PASSANDA', '#', '#', 'Sliced lamb or chicken&#44; cooked in fresh cream with ground cashew nuts and mild spices.', '6.95', 5, '0.00', '#', '#', 0, 0, '60'),
(61, 1, '0000-00-00 00:00:00', 1, 61, 'KORAI KOFTA', '#', '#', 'Minced meatballs cooked with spices chopped tomatoes&#44; onions and capsicums', '6.60', 5, '0.00', '#', '#', 0, 0, '61'),
(62, 1, '0000-00-00 00:00:00', 1, 62, 'MUGLAI', '#', '#', 'lamb chicken cooked with almonds cashew nuts&#44; egg and fresh cream', '6.95', 5, '0.00', '#', '#', 0, 0, '62'),
(63, 1, '0000-00-00 00:00:00', 1, 63, 'BHUNA', '#', '#', 'Chicken/lamb cooked with spices&#44; onion&#44; green peppers', '6.90', 5, '0.00', '#', '#', 0, 0, '63'),
(64, 1, '0000-00-00 00:00:00', 1, 64, 'KORAI', '#', '#', 'Chicken lamb cooked with spices&#44; onion&#44; green peppers', '6.90', 5, '0.00', '#', '#', 0, 0, '64'),
(65, 1, '0000-00-00 00:00:00', 1, 65, 'KING PRAWN KORAI', '#', '#', '', '10.80', 5, '0.00', '#', '#', 0, 0, '65'),
(66, 1, '0000-00-00 00:00:00', 1, 66, 'ACHAR', '#', '#', 'A fiery dish of chicken in hot and sour sauce made of dry red chillies and vinegar', '6.75', 5, '0.00', '#', '#', 0, 0, '66'),
(67, 1, '0000-00-00 00:00:00', 1, 67, 'FISH BHUNA', '#', '#', 'Medium cooked with onion&#44; green peppers & tomato.', '6.95', 5, '0.00', '#', '#', 0, 0, '67'),
(68, 1, '0000-00-00 00:00:00', 1, 68, 'FISH TIKKA MASALA', '#', '#', 'cooked with spices&#44; onion&#44; green peppers', '7.75', 5, '0.00', '#', '#', 0, 0, '68'),
(69, 1, '0000-00-00 00:00:00', 1, 69, 'FISH JALFREZI', '#', '#', 'Charcoal grilled pieces of fish cooked in chopped onion&#44; ginger&#44; capsicum&#44; tomatoes&#44; green chillies and special sauce.', '7.75', 5, '0.00', '#', '#', 0, 0, '69'),
(70, 1, '0000-00-00 00:00:00', 1, 70, 'CHICKEN TIKKA SAMBHA', '#', '#', 'Chicken tikka with mixed vegetables and green chillies', '6.20', 5, '0.00', '#', '#', 0, 0, '70'),
(71, 1, '0000-00-00 00:00:00', 1, 71, 'SATKORA BHUNA', '#', '#', 'Chicken lamb cooked with Bangladeshi citrus fruit.', '7.50', 5, '0.00', '#', '#', 0, 0, '71'),
(72, 1, '0000-00-00 00:00:00', 1, 72, 'DANSAK', '#', '#', 'cooked with lentils in our exotic&#44; hot&#44; sweet and sour sauce', '7.90', 6, '0.00', '#', '#', 0, 0, '72'),
(73, 1, '0000-00-00 00:00:00', 1, 73, 'DANSAK', '#', '#', 'Chicken lamb tikka cooked with lentils in our exotic&#44; hot&#44; sweet and sour sauce', '8.90', 6, '0.00', '#', '#', 0, 0, '73'),
(74, 1, '0000-00-00 00:00:00', 1, 74, 'PRAWN DANSAK', '#', '#', 'Prawns cooked with lentils in our exotic hot&#44; sweet and sour sauce', '8.50', 6, '0.00', '#', '#', 0, 0, '74'),
(75, 1, '0000-00-00 00:00:00', 1, 75, 'KING PRAWN DANSAK', '#', '#', 'King prawns cooked with lentils in our exotic hot&#44; sweet and sour sauce', '10.50', 6, '0.00', '#', '#', 0, 0, '75'),
(76, 1, '0000-00-00 00:00:00', 1, 76, 'VEGETABLE DANSAK', '#', '#', 'Vegetable cooked with herbs in hot&#44; sweet & sour flavoured sauce', '6.50', 6, '0.00', '#', '#', 0, 0, '76'),
(77, 0, '0000-00-00 00:00:00', 0, 77, 'PATHIA', '#', '#', 'Cooked with herbs in hot&#44; sweet & sour flavoured sauce.', '7.90', 6, '0.00', '', '', 0, 0, '77'),
(78, 1, '0000-00-00 00:00:00', 1, 78, 'KING PRAWN PATHIA', '#', '#', 'King prawns cooked with herbs in hot&#44; sweet  sour flavoured sauce', '10.50', 6, '0.00', '#', '#', 0, 0, '78'),
(79, 1, '0000-00-00 00:00:00', 1, 79, 'PRAWN PATHIA', '#', '#', 'Prawns cooked with herbs in hot&#44; sweet and sour flavoured sauce', '8.50', 6, '0.00', '#', '#', 0, 0, '79'),
(80, 1, '0000-00-00 00:00:00', 1, 80, 'CURRY DISHES', '#', '#', '(Medium Hot)', '4.95', 7, '0.00', '#', '#', 0, 0, '80'),
(81, 1, '0000-00-00 00:00:00', 1, 81, 'MADRAS DISHES', '#', '#', '(Fairly hot)', '5.10', 7, '0.00', '#', '#', 0, 0, '81'),
(82, 1, '0000-00-00 00:00:00', 1, 82, 'VINDALOO DISHES', '#', '#', '(very hot)', '5.10', 7, '0.00', '#', '#', 0, 0, '82'),
(83, 1, '0000-00-00 00:00:00', 1, 83, 'PHALL DISHES', '#', '#', '(Extremely Hot)', '5.20', 7, '0.00', '#', '#', 0, 0, '83'),
(84, 1, '0000-00-00 00:00:00', 1, 84, 'SAG DISHES', '#', '#', 'A fairly dry dish with spinach&#44; garlic and onions', '5.50', 7, '0.00', '#', '#', 0, 0, '84'),
(85, 1, '0000-00-00 00:00:00', 1, 85, 'DUPIAZA DISHES', '#', '#', 'Cooked with onions in a medium spriced sauce.', '5.90', 7, '0.00', '#', '#', 0, 0, '85'),
(86, 1, '0000-00-00 00:00:00', 1, 86, 'BHUNA DISHES', '#', '#', 'Medium with onions and coriander in thick sauce', '5.80', 7, '0.00', '#', '#', 0, 0, '86'),
(87, 1, '0000-00-00 00:00:00', 1, 87, 'BOMBAY DISHES', '#', '#', 'Medium spice with egg and potato', '5.75', 7, '0.00', '#', '#', 0, 0, '87'),
(88, 1, '0000-00-00 00:00:00', 1, 88, 'KORMA DISHES', '#', '#', 'Very mild dish with ground coconut', '5.80', 7, '0.00', '#', '#', 0, 0, '88'),
(89, 1, '0000-00-00 00:00:00', 1, 89, 'ROGON DISHES', '#', '#', 'Cooked in a hot&#44; spicy&#44; garnished with fresh tomatoes  peppers', '5.80', 7, '0.00', '#', '#', 0, 0, '89'),
(90, 1, '0000-00-00 00:00:00', 1, 90, 'KASHMIRI DISHES', '#', '#', 'Cooked with banana & spiced sauce.', '5.95', 7, '0.00', '#', '#', 0, 0, '90'),
(91, 1, '0000-00-00 00:00:00', 1, 91, 'MALAYA DISHES', '#', '#', 'Cooked with pineapple&#44; medium sauce.', '6.00', 7, '0.00', '#', '#', 0, 0, '91'),
(92, 1, '0000-00-00 00:00:00', 1, 92, 'CEYLON DISHES', '#', '#', 'A fairly hot with coconut.', '5.80', 7, '0.00', '#', '#', 0, 0, '92'),
(93, 1, '0000-00-00 00:00:00', 1, 93, 'MASALA DISHES', '#', '#', 'medium&#44; cooked in a creamy sauce', '5.75', 7, '0.00', '#', '#', 0, 0, '93'),
(94, 1, '0000-00-00 00:00:00', 1, 94, 'BIRYANI', '#', '#', '', '7.60', 8, '0.00', '#', '#', 0, 0, '94'),
(95, 1, '0000-00-00 00:00:00', 1, 95, 'BIRYANI', '#', '#', '', '7.95', 8, '0.00', '#', '#', 0, 0, '95'),
(96, 1, '0000-00-00 00:00:00', 1, 96, 'PRAWN BIRYANI', '#', '#', '', '8.50', 8, '0.00', '#', '#', 0, 0, '96'),
(97, 1, '0000-00-00 00:00:00', 1, 97, 'KING PRAWN BIRYANI', '#', '#', '', '9.95', 8, '0.00', '#', '#', 0, 0, '97'),
(98, 1, '0000-00-00 00:00:00', 1, 98, 'SHABZI BIRYANI (VEGETABLE)', '#', '#', '', '5.80', 8, '0.00', '#', '#', 0, 0, '98'),
(99, 1, '0000-00-00 00:00:00', 1, 99, 'PERSIAN BIRYANI', '#', '#', '', '7.80', 8, '0.00', '#', '#', 0, 0, '99'),
(100, 1, '0000-00-00 00:00:00', 1, 100, 'CHICKEN & PRAWN BIRYANI', '#', '#', '', '7.80', 8, '0.00', '#', '#', 0, 0, '100'),
(101, 1, '0000-00-00 00:00:00', 1, 101, 'TANDOORI KING PRAWN BIRYANI', '#', '#', '', '10.50', 8, '0.00', '#', '#', 0, 0, '101'),
(102, 1, '0000-00-00 00:00:00', 1, 102, 'MUSHROOM BIRYANI', '#', '#', '', '5.80', 8, '0.00', '#', '#', 0, 0, '102'),
(103, 1, '0000-00-00 00:00:00', 1, 103, 'CHICKEN BIRYANI', '#', '#', '', '7.80', 8, '0.00', '#', '#', 0, 0, '103'),
(104, 1, '0000-00-00 00:00:00', 1, 104, 'MUSHROOM BIRYANI', '#', '#', '', '7.80', 8, '0.00', '#', '#', 0, 0, '104'),
(105, 1, '0000-00-00 00:00:00', 1, 105, 'SPECIAL MIXED BIRYANI', '#', '#', 'Mixed chicken&#44; meat&#44; prawn biryani.', '9.50', 8, '0.00', '#', '#', 0, 0, '105'),
(106, 1, '0000-00-00 00:00:00', 1, 106, 'ALOO GOSHT', '#', '#', '(Lamb and potatoes)', '5.80', 9, '0.00', '#', '#', 0, 0, '106'),
(107, 1, '0000-00-00 00:00:00', 1, 107, 'CHANA MEAT', '#', '#', '(Lamb and chick peas)', '5.80', 9, '0.00', '#', '#', 0, 0, '107'),
(108, 1, '0000-00-00 00:00:00', 1, 108, 'MEAT AND MUSHROOM', '#', '#', '', '5.80', 9, '0.00', '#', '#', 0, 0, '108'),
(109, 1, '0000-00-00 00:00:00', 1, 109, 'BHINDI GOSHT', '#', '#', '(Lamb and okra)', '5.80', 9, '0.00', '#', '#', 0, 0, '109'),
(110, 1, '0000-00-00 00:00:00', 1, 110, 'MATHI GOSHT', '#', '#', '(Lamb and fenugreek)', '5.80', 9, '0.00', '#', '#', 0, 0, '110'),
(111, 1, '0000-00-00 00:00:00', 1, 111, 'KEEMA PEAS', '#', '#', '(Minced lamb cooked with peas)', '5.80', 9, '0.00', '#', '#', 0, 0, '111'),
(112, 1, '0000-00-00 00:00:00', 1, 112, 'KEEMA ALOO', '#', '#', '(Minced lamb and potato)', '5.80', 9, '0.00', '#', '#', 0, 0, '112'),
(113, 1, '0000-00-00 00:00:00', 1, 113, 'CHICKEN AND MUSHROOM CURRY', '#', '#', '', '5.80', 9, '0.00', '#', '#', 0, 0, '113'),
(114, 1, '0000-00-00 00:00:00', 1, 114, 'CHICKEN AND PRAWN CURRY', '#', '#', '', '6.90', 9, '0.00', '#', '#', 0, 0, '114'),
(115, 1, '0000-00-00 00:00:00', 1, 115, 'PRAWN AND MUSHROOM', '#', '#', '', '6.90', 9, '0.00', '#', '#', 0, 0, '115'),
(116, 1, '0000-00-00 00:00:00', 1, 116, 'MIXED VEGETABLE CURRY', '#', '#', '', '3.00', 10, '0.00', '#', '#', 0, 0, '116'),
(117, 1, '0000-00-00 00:00:00', 1, 117, 'ALOO GHOBI', '#', '#', 'Potatoes and cauliflower.', '3.00', 10, '0.00', '#', '#', 0, 0, '117'),
(118, 1, '0000-00-00 00:00:00', 1, 118, 'BOMBAY ALOO', '#', '#', 'Medium spiced potatoes with fresh herbs.', '3.00', 10, '0.00', '#', '#', 0, 0, '118'),
(119, 1, '0000-00-00 00:00:00', 1, 119, 'GHOBI BHAJI', '#', '#', 'Cauliflower with medium spices.', '3.00', 10, '0.00', '#', '#', 0, 0, '119'),
(120, 1, '0000-00-00 00:00:00', 1, 120, 'MUSHROOM BHAJI', '#', '#', 'Mushroom with fresh herbs & spices.', '3.00', 10, '0.00', '#', '#', 0, 0, '120'),
(121, 1, '0000-00-00 00:00:00', 1, 121, 'CHANA ALOO', '#', '#', 'Chick peas cooked with potatoes and spices.', '3.00', 10, '0.00', '#', '#', 0, 0, '121'),
(122, 1, '0000-00-00 00:00:00', 1, 122, 'BRINJAL BHAJI', '#', '#', 'Aubergine Cooked with mixed spices.', '3.00', 10, '0.00', '#', '#', 0, 0, '122'),
(123, 1, '0000-00-00 00:00:00', 1, 123, 'SAGH PANEER', '#', '#', 'spinach with indian cottage cheese.', '3.50', 10, '0.00', '#', '#', 0, 0, '123'),
(124, 1, '0000-00-00 00:00:00', 1, 124, 'BHINDI BHAJI', '#', '#', 'Okra with medium spices.', '3.00', 10, '0.00', '#', '#', 0, 0, '124'),
(125, 1, '0000-00-00 00:00:00', 1, 125, 'SAG BHAJI', '#', '#', 'spinach with Indian herbs and spices.', '3.00', 10, '0.00', '#', '#', 0, 0, '125'),
(126, 1, '0000-00-00 00:00:00', 1, 126, 'KHUMB MUTTER', '#', '#', 'Mushroom and peas cooked in coriander&#44; cumin&#44; and mildly flavoured.', '3.00', 10, '0.00', '#', '#', 0, 0, '133'),
(127, 1, '0000-00-00 00:00:00', 1, 127, 'DALL SHAMBER', '#', '#', 'Lentils with vegetables', '3.20', 10, '0.00', '#', '#', 0, 0, '126'),
(128, 1, '0000-00-00 00:00:00', 1, 128, 'DALL TARKA', '#', '#', 'Garlic flavoured lentils.', '3.00', 10, '0.00', '#', '#', 0, 0, '127'),
(129, 1, '0000-00-00 00:00:00', 1, 129, 'CHANA MASALA', '#', '#', 'Chick peas with medium spices.', '3.50', 10, '0.00', '#', '#', 0, 0, '128'),
(130, 1, '0000-00-00 00:00:00', 1, 130, 'MOTTER PONEER', '#', '#', 'Peas and home-made indian cheese.', '3.00', 10, '0.00', '#', '#', 0, 0, '129'),
(131, 1, '0000-00-00 00:00:00', 1, 131, 'DALL', '#', '#', 'Plain Lentils.', '3.00', 10, '0.00', '#', '#', 0, 0, '130'),
(132, 1, '0000-00-00 00:00:00', 1, 132, 'SAG ALOO', '#', '#', 'Spinach  and  Potato cooked with herbs & spices.', '3.20', 10, '0.00', '#', '#', 0, 0, '131'),
(133, 1, '0000-00-00 00:00:00', 1, 133, 'BEANS BHAJI', '#', '#', 'Green beans cooked with herbs and spices.', '3.00', 10, '0.00', '#', '#', 0, 0, '132'),
(134, 1, '0000-00-00 00:00:00', 1, 134, 'RAITHA', '#', '#', 'Onion and cucumber.', '1.50', 11, '0.00', '#', '#', 0, 0, '134'),
(135, 1, '0000-00-00 00:00:00', 1, 135, 'NAN', '#', '#', 'Leavened tandoori bread.', '2.20', 11, '0.00', '#', '#', 0, 0, '135'),
(136, 1, '0000-00-00 00:00:00', 1, 136, 'KEEMA NAN', '#', '#', 'Stuffed with mincemeat.', '2.40', 11, '0.00', '#', '#', 0, 0, '136'),
(137, 1, '0000-00-00 00:00:00', 1, 137, 'STUFFED NAN', '#', '#', 'Stuffed with vegetables.', '2.40', 11, '0.00', '#', '#', 0, 0, '137'),
(138, 1, '0000-00-00 00:00:00', 1, 138, 'PESHWARI NAN', '#', '#', 'Stuffed Nan with sultanas and mixed nuts', '2.40', 11, '0.00', '#', '#', 0, 0, '138'),
(139, 1, '0000-00-00 00:00:00', 1, 139, 'CHILLI NAN', '#', '#', 'with fresh green chilli.', '2.40', 11, '0.00', '#', '#', 0, 0, '139'),
(140, 1, '0000-00-00 00:00:00', 1, 140, 'GARLIC NAN', '#', '#', 'with fresh garlic and coriander.', '2.40', 11, '0.00', '#', '#', 0, 0, '140'),
(141, 1, '0000-00-00 00:00:00', 1, 141, 'TANDOORI ROTI', '#', '#', 'Wheat flour bread cooked in the tandoori.', '2.20', 11, '0.00', '#', '#', 0, 0, '141'),
(142, 1, '0000-00-00 00:00:00', 1, 142, 'PARATHA', '#', '#', 'Buttered and layered whole wheat bread.', '2.30', 11, '0.00', '#', '#', 0, 0, '142'),
(143, 1, '0000-00-00 00:00:00', 1, 143, 'SHAHI PARATHA', '#', '#', 'Layered whole wheat bread with spiced vegetable.', '2.50', 11, '0.00', '#', '#', 0, 0, '143'),
(144, 1, '0000-00-00 00:00:00', 1, 144, 'CHAPATI', '#', '#', 'Basic Indian bread made from wheat flour.', '1.20', 11, '0.00', '#', '#', 0, 0, '144'),
(145, 1, '0000-00-00 00:00:00', 1, 145, 'PUREE', '#', '#', '', '1.40', 11, '0.00', '#', '#', 0, 0, '145'),
(146, 1, '0000-00-00 00:00:00', 1, 146, 'POPPADOM', '#', '#', '', '0.60', 11, '0.00', '#', '#', 0, 0, '146'),
(147, 1, '0000-00-00 00:00:00', 1, 147, 'SPICED POPPADOM', '#', '#', '', '0.60', 11, '0.00', '#', '#', 0, 0, '147'),
(148, 1, '0000-00-00 00:00:00', 1, 148, 'MIX PICKLE', '#', '#', '', '0.60', 11, '0.00', '#', '#', 0, 0, '148'),
(149, 1, '0000-00-00 00:00:00', 1, 149, 'MANGO CHUTNEY', '#', '#', '', '0.60', 11, '0.00', '#', '#', 0, 0, '149'),
(150, 1, '0000-00-00 00:00:00', 1, 150, 'ONION SALAD', '#', '#', '', '0.60', 11, '0.00', '#', '#', 0, 0, '150'),
(151, 1, '0000-00-00 00:00:00', 1, 151, 'MINT SAUCE', '#', '#', '', '0.60', 11, '0.00', '#', '#', 0, 0, '151'),
(152, 1, '0000-00-00 00:00:00', 1, 152, 'PLAIN RICE', '#', '#', 'Boiled rice', '2.20', 12, '0.00', '#', '#', 0, 0, '152'),
(153, 1, '0000-00-00 00:00:00', 1, 153, 'PILAU RICE', '#', '#', 'Saffron flavoured rice', '2.40', 12, '0.00', '#', '#', 0, 0, '153'),
(154, 1, '0000-00-00 00:00:00', 1, 154, 'SPECIAL FRIED RICE', '#', '#', 'Pilau rice with egg', '3.20', 12, '0.00', '#', '#', 0, 0, '154'),
(155, 1, '0000-00-00 00:00:00', 1, 155, 'MUSHROOM RICE', '#', '#', '', '3.10', 12, '0.00', '#', '#', 0, 0, '155'),
(156, 1, '0000-00-00 00:00:00', 1, 156, 'PEAS PILAU', '#', '#', '', '3.10', 12, '0.00', '#', '#', 0, 0, '156'),
(157, 1, '0000-00-00 00:00:00', 1, 157, 'KEEMA RICE', '#', '#', 'Basmoti rice with Minced meat.', '3.50', 12, '0.00', '#', '#', 0, 0, '157'),
(158, 1, '0000-00-00 00:00:00', 1, 158, 'PRAWN RICE', '#', '#', '', '3.70', 12, '0.00', '#', '#', 0, 0, '158'),
(159, 1, '0000-00-00 00:00:00', 1, 159, 'GARLIC RICE', '#', '#', '', '3.10', 12, '0.00', '#', '#', 0, 0, '159'),
(160, 1, '0000-00-00 00:00:00', 1, 160, 'COCONUT RICE', '#', '#', '', '3.40', 12, '0.00', '#', '#', 0, 0, '160'),
(161, 1, '0000-00-00 00:00:00', 1, 161, 'ONION RICE', '#', '#', '', '3.10', 12, '0.00', '#', '#', 0, 0, '161'),
(162, 1, '0000-00-00 00:00:00', 1, 162, 'VEGETABLE RICE', '#', '#', '', '3.10', 12, '0.00', '#', '#', 0, 0, '162'),
(163, 1, '0000-00-00 00:00:00', 1, 163, 'EGG RICE', '#', '#', '', '3.10', 12, '0.00', '#', '#', 0, 0, '163'),
(164, 1, '0000-00-00 00:00:00', 1, 164, 'CHIPS', '#', '#', '', '1.70', 13, '0.00', '#', '#', 0, 0, '164'),
(165, 1, '0000-00-00 00:00:00', 1, 165, 'FRIED CHICKEN WITH CHIPS', '#', '#', '', '5.10', 13, '0.00', '#', '#', 0, 0, '165'),
(166, 1, '0000-00-00 00:00:00', 1, 166, 'CHICKEN OMELETTE', '#', '#', '', '5.10', 13, '0.00', '#', '#', 0, 0, '166'),
(167, 1, '0000-00-00 00:00:00', 1, 167, 'PRAWN OMELETTE', '#', '#', '', '5.50', 13, '0.00', '#', '#', 0, 0, '167'),
(168, 1, '0000-00-00 00:00:00', 1, 168, 'MUSHROOM OMELETTE', '#', '#', '', '5.00', 13, '0.00', '#', '#', 0, 0, '168'),
(169, 1, '0000-00-00 00:00:00', 1, 169, 'PLAIN OMELETTE', '#', '#', '', '4.50', 13, '0.00', '#', '#', 0, 0, '169'),
(170, 1, '0000-00-00 00:00:00', 1, 170, 'MIXED SALAD', '#', '#', '', '2.00', 13, '0.00', '#', '#', 0, 0, '170'),
(171, 1, '0000-00-00 00:00:00', 1, 171, 'PRAWN SALAD', '#', '#', '', '4.50', 13, '0.00', '#', '#', 0, 0, '171'),
(172, 1, '0000-00-00 00:00:00', 1, 172, 'CHICKEN SALAD', '#', '#', '', '4.50', 13, '0.00', '#', '#', 0, 0, '172'),
(173, 1, '0000-00-00 00:00:00', 1, 173, 'BANANA FRITTER', '#', '#', '', '2.50', 14, '0.00', '#', '#', 0, 0, '173'),
(174, 1, '0000-00-00 00:00:00', 1, 174, 'PINEAPPLE FRITTER', '#', '#', '', '2.50', 14, '0.00', '#', '#', 0, 0, '174'),
(175, 1, '0000-00-00 00:00:00', 1, 175, 'MANGO', '#', '#', '', '2.30', 15, '0.00', '#', '#', 0, 0, '175'),
(176, 1, '0000-00-00 00:00:00', 1, 176, 'LYCHEE', '#', '#', '', '2.30', 15, '0.00', '#', '#', 0, 0, '176'),
(177, 1, '0000-00-00 00:00:00', 1, 177, 'PINEAPPLE', '#', '#', '', '2.30', 15, '0.00', '#', '#', 0, 0, '177'),
(178, 1, '0000-00-00 00:00:00', 1, 178, 'COKE', '#', '#', '', '0.90', 16, '0.00', '#', '#', 0, 0, '178'),
(179, 1, '0000-00-00 00:00:00', 1, 179, 'DIET COKE', '#', '#', '', '0.90', 16, '0.00', '#', '#', 0, 0, '179'),
(180, 1, '0000-00-00 00:00:00', 1, 180, 'ORANGE TANGO', '#', '#', '', '0.90', 16, '0.00', '#', '#', 0, 0, '180'),
(181, 1, '0000-00-00 00:00:00', 1, 181, 'NOMRAL(LARGE)', '#', '#', '', '3.95', 17, '0.00', '#', '#', 0, 0, '181'),
(182, 1, '0000-00-00 00:00:00', 1, 182, 'OTHERS(LARGE)', '#', '#', '', '4.50', 17, '0.00', '#', '#', 0, 0, '182'),
(183, 1, '0000-00-00 00:00:00', 1, 183, 'NOMRAL(SMALL)', '#', '#', '', '2.95', 17, '0.00', '#', '#', 0, 0, '183'),
(184, 1, '0000-00-00 00:00:00', 1, 184, 'OTHERS(SMALL)', '#', '#', '', '3.95', 17, '0.00', '#', '#', 0, 0, '184'),
(185, 1, '0000-00-00 00:00:00', 1, 185, 'For 1 person', '#', '#', '1 Onion Bhaji&#44; 1 Meat Rogan&#44;1 Pilau rice&#44; 1 Nan&#44; 3 Poppadum&#44;1 Onion Salad&#44; Mango Chutney&#44; Mint sauce.', '15.00', 18, '0.00', '#', '#', 0, 0, '185'),
(186, 1, '0000-00-00 00:00:00', 1, 186, 'For 2 person', '#', '#', '1 Onion Bhaji&#44; 1 Chicken Special&#44;1 Meat Rogan&#44; 2 Pilau rice&#44; 1 Nan&#44; 4 Poppadum&#44;1 Mushroom Bhaji 1 Onion Salad&#44; Mint sauce', '25.50', 18, '0.00', '#', '#', 0, 0, '186'),
(187, 1, '0000-00-00 00:00:00', 1, 187, 'Vegetarian For 2 person', '#', '#', '1 Vegetable Samosa&#44; 1 Vegetable Biryani&#44; 1 Dall&#44; 1 Chana Masala&#44; 1 Aloo Sag&#44; 1 Rice&#44; 1 Stuffed Nan&#44;', '22.00', 18, '0.00', '#', '#', 0, 0, '187');

-- --------------------------------------------------------

--
-- Table structure for table `prod_meats`
--

CREATE TABLE IF NOT EXISTS `prod_meats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `title` varchar(256) NOT NULL DEFAULT 'New',
  `short_name` varchar(128) NOT NULL DEFAULT '#',
  `icon` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `prod_meats`
--

INSERT INTO `prod_meats` (`id`, `login_id`, `updated`, `active`, `sn`, `title`, `short_name`, `icon`) VALUES
(1, 1, '2014-04-19 12:14:22', 1, 1, 'Chicken', 'CH', NULL),
(2, 1, '2014-04-19 12:14:22', 1, 2, 'Lamb', 'LM', NULL),
(3, 1, '2014-04-19 12:14:22', 1, 3, 'Veg', 'VG', NULL),
(4, 1, '2014-04-19 12:14:22', 1, 4, 'Prwan', 'PR', NULL),
(5, 1, '2014-04-19 12:14:22', 1, 5, 'King Prwan', 'KP', NULL),
(6, 1, '2014-04-19 12:14:22', 1, 6, 'King Prwan Tikka', 'KP', NULL),
(7, 1, '2014-04-19 12:14:22', 1, 7, 'Chicken Tikka', 'KP', NULL),
(8, 1, '2014-04-19 12:14:22', 1, 8, 'Lamb Tikka', 'KP', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prod_meat_price`
--

CREATE TABLE IF NOT EXISTS `prod_meat_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` int(11) NOT NULL DEFAULT '1',
  `prod_list_id` int(11) NOT NULL,
  `prod_meats_id` int(11) NOT NULL,
  `price` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=157 ;

--
-- Dumping data for table `prod_meat_price`
--

INSERT INTO `prod_meat_price` (`id`, `login_id`, `updated`, `active`, `sn`, `prod_list_id`, `prod_meats_id`, `price`) VALUES
(1, 1, '0000-00-00 00:00:00', 1, 1, 4, 3, '2.60'),
(2, 1, '0000-00-00 00:00:00', 1, 1, 4, 0, '2.60'),
(3, 1, '0000-00-00 00:00:00', 1, 1, 11, 1, '3.20'),
(4, 1, '0000-00-00 00:00:00', 1, 1, 11, 2, '3.50'),
(5, 1, '0000-00-00 00:00:00', 1, 1, 20, 1, '5.95'),
(6, 1, '0000-00-00 00:00:00', 1, 1, 20, 2, '6.20'),
(7, 1, '0000-00-00 00:00:00', 1, 1, 33, 1, '8.60'),
(8, 1, '0000-00-00 00:00:00', 1, 1, 33, 2, '8.75'),
(9, 1, '0000-00-00 00:00:00', 1, 1, 34, 1, '8.60'),
(10, 1, '0000-00-00 00:00:00', 1, 1, 34, 2, '8.60'),
(11, 1, '0000-00-00 00:00:00', 1, 1, 34, 3, '8.75'),
(12, 1, '0000-00-00 00:00:00', 1, 1, 34, 4, '8.75'),
(13, 1, '0000-00-00 00:00:00', 1, 1, 36, 1, '8.60'),
(14, 1, '0000-00-00 00:00:00', 1, 1, 36, 2, '8.75'),
(15, 1, '0000-00-00 00:00:00', 1, 1, 37, 1, '8.60'),
(16, 1, '0000-00-00 00:00:00', 1, 1, 37, 2, '8.80'),
(17, 1, '0000-00-00 00:00:00', 1, 1, 38, 1, '8.60'),
(18, 1, '0000-00-00 00:00:00', 1, 1, 38, 2, '8.80'),
(19, 1, '0000-00-00 00:00:00', 1, 1, 47, 7, '6.75'),
(20, 1, '0000-00-00 00:00:00', 1, 1, 47, 8, '6.90'),
(21, 1, '0000-00-00 00:00:00', 1, 1, 50, 7, '6.75'),
(22, 1, '0000-00-00 00:00:00', 1, 1, 50, 8, '6.90'),
(23, 1, '0000-00-00 00:00:00', 1, 1, 53, 7, '6.50'),
(24, 1, '0000-00-00 00:00:00', 1, 1, 53, 8, '6.90'),
(25, 1, '0000-00-00 00:00:00', 1, 1, 54, 1, '6.50'),
(26, 1, '0000-00-00 00:00:00', 1, 1, 54, 2, '6.95'),
(27, 1, '0000-00-00 00:00:00', 1, 1, 57, 1, '6.50'),
(28, 1, '0000-00-00 00:00:00', 1, 1, 57, 0, '6.80'),
(29, 1, '0000-00-00 00:00:00', 1, 1, 60, 1, '6.60'),
(30, 1, '0000-00-00 00:00:00', 1, 1, 60, 2, '6.95'),
(31, 1, '0000-00-00 00:00:00', 1, 1, 62, 1, '6.60'),
(32, 1, '0000-00-00 00:00:00', 1, 1, 62, 2, '6.95'),
(33, 1, '0000-00-00 00:00:00', 1, 1, 63, 7, '6.50'),
(34, 1, '0000-00-00 00:00:00', 1, 1, 63, 8, '6.90'),
(35, 1, '0000-00-00 00:00:00', 1, 1, 64, 1, '6.55'),
(36, 1, '0000-00-00 00:00:00', 1, 1, 64, 2, '6.90'),
(37, 1, '0000-00-00 00:00:00', 1, 1, 66, 1, '6.10'),
(38, 1, '0000-00-00 00:00:00', 1, 1, 66, 2, '6.75'),
(39, 1, '0000-00-00 00:00:00', 1, 1, 71, 1, '7.10'),
(40, 1, '0000-00-00 00:00:00', 1, 1, 71, 2, '7.50'),
(41, 1, '0000-00-00 00:00:00', 1, 1, 77, 1, '7.80'),
(42, 1, '0000-00-00 00:00:00', 1, 1, 77, 2, '7.90'),
(43, 1, '0000-00-00 00:00:00', 1, 1, 80, 1, '4.80'),
(44, 1, '0000-00-00 00:00:00', 1, 1, 80, 0, '4.95'),
(45, 1, '0000-00-00 00:00:00', 1, 1, 80, 4, '5.75'),
(46, 1, '0000-00-00 00:00:00', 1, 1, 80, 5, '7.50'),
(47, 1, '0000-00-00 00:00:00', 1, 1, 80, 0, '5.20'),
(48, 1, '0000-00-00 00:00:00', 1, 1, 80, 3, '4.60'),
(49, 1, '0000-00-00 00:00:00', 1, 1, 81, 1, '4.95'),
(50, 1, '0000-00-00 00:00:00', 1, 1, 81, 0, '5.10'),
(51, 1, '0000-00-00 00:00:00', 1, 1, 81, 4, '5.95'),
(52, 1, '0000-00-00 00:00:00', 1, 1, 81, 5, '7.80'),
(53, 1, '0000-00-00 00:00:00', 1, 1, 81, 0, '5.50'),
(54, 1, '0000-00-00 00:00:00', 1, 1, 81, 3, '4.80'),
(55, 1, '0000-00-00 00:00:00', 1, 1, 82, 1, '4.95'),
(56, 1, '0000-00-00 00:00:00', 1, 1, 82, 0, '5.10'),
(57, 1, '0000-00-00 00:00:00', 1, 1, 82, 4, '5.95'),
(58, 1, '0000-00-00 00:00:00', 1, 1, 82, 5, '7.80'),
(59, 1, '0000-00-00 00:00:00', 1, 1, 82, 0, '5.50'),
(60, 1, '0000-00-00 00:00:00', 1, 1, 82, 3, '4.80'),
(61, 1, '0000-00-00 00:00:00', 1, 1, 83, 1, '5.00'),
(62, 1, '0000-00-00 00:00:00', 1, 1, 83, 0, '5.20'),
(63, 1, '0000-00-00 00:00:00', 1, 1, 83, 4, '5.95'),
(64, 1, '0000-00-00 00:00:00', 1, 1, 83, 5, '7.80'),
(65, 1, '0000-00-00 00:00:00', 1, 1, 83, 0, '5.50'),
(66, 1, '0000-00-00 00:00:00', 1, 1, 83, 3, '4.80'),
(67, 1, '0000-00-00 00:00:00', 1, 1, 84, 1, '5.70'),
(68, 1, '0000-00-00 00:00:00', 1, 1, 84, 0, '5.90'),
(69, 2, '0000-00-00 00:00:00', 1, 1, 84, 4, '7.00'),
(70, 3, '0000-00-00 00:00:00', 1, 1, 84, 5, '8.60'),
(73, 6, '0000-00-00 00:00:00', 1, 1, 85, 1, '5.50'),
(74, 7, '0000-00-00 00:00:00', 1, 1, 85, 0, '5.80'),
(75, 8, '0000-00-00 00:00:00', 1, 1, 85, 4, '6.50'),
(76, 9, '0000-00-00 00:00:00', 1, 1, 85, 5, '8.50'),
(77, 10, '0000-00-00 00:00:00', 1, 1, 85, 0, '5.50'),
(78, 11, '0000-00-00 00:00:00', 1, 1, 85, 3, '4.95'),
(79, 12, '0000-00-00 00:00:00', 1, 1, 86, 1, '5.30'),
(80, 13, '0000-00-00 00:00:00', 1, 1, 86, 0, '5.50'),
(81, 14, '0000-00-00 00:00:00', 1, 1, 86, 4, '6.95'),
(82, 15, '0000-00-00 00:00:00', 1, 1, 86, 5, '8.10'),
(83, 16, '0000-00-00 00:00:00', 1, 1, 86, 0, '5.50'),
(84, 17, '0000-00-00 00:00:00', 1, 1, 86, 3, '4.95'),
(85, 18, '0000-00-00 00:00:00', 1, 1, 87, 1, '5.60'),
(86, 19, '0000-00-00 00:00:00', 1, 1, 87, 0, '5.80'),
(87, 20, '0000-00-00 00:00:00', 1, 1, 87, 4, '7.50'),
(88, 21, '0000-00-00 00:00:00', 1, 1, 87, 5, '8.50'),
(89, 22, '0000-00-00 00:00:00', 1, 1, 87, 0, '5.50'),
(90, 23, '0000-00-00 00:00:00', 1, 1, 87, 3, '5.00'),
(91, 24, '0000-00-00 00:00:00', 1, 1, 88, 1, '5.60'),
(92, 25, '0000-00-00 00:00:00', 1, 1, 88, 0, '5.80'),
(93, 26, '0000-00-00 00:00:00', 1, 1, 88, 4, '7.20'),
(94, 27, '0000-00-00 00:00:00', 1, 1, 88, 5, '8.50'),
(96, 29, '0000-00-00 00:00:00', 1, 1, 88, 3, '5.10'),
(97, 30, '0000-00-00 00:00:00', 1, 1, 89, 1, '5.60'),
(98, 31, '0000-00-00 00:00:00', 1, 1, 89, 0, '5.95'),
(99, 32, '0000-00-00 00:00:00', 1, 1, 89, 4, '7.20'),
(100, 33, '0000-00-00 00:00:00', 1, 1, 89, 5, '8.60'),
(103, 36, '0000-00-00 00:00:00', 1, 1, 90, 1, '5.80'),
(104, 37, '0000-00-00 00:00:00', 1, 1, 90, 0, '6.00'),
(105, 38, '0000-00-00 00:00:00', 1, 1, 90, 4, '7.50'),
(106, 39, '0000-00-00 00:00:00', 1, 1, 90, 5, '8.60'),
(107, 40, '0000-00-00 00:00:00', 1, 1, 90, 0, '5.50'),
(108, 41, '0000-00-00 00:00:00', 1, 1, 90, 3, '5.10'),
(109, 42, '0000-00-00 00:00:00', 1, 1, 91, 1, '5.60'),
(110, 43, '0000-00-00 00:00:00', 1, 1, 91, 0, '5.80'),
(111, 44, '0000-00-00 00:00:00', 1, 1, 91, 4, '7.30'),
(112, 45, '0000-00-00 00:00:00', 1, 1, 91, 5, '8.60'),
(113, 46, '0000-00-00 00:00:00', 1, 1, 91, 0, '5.50'),
(114, 47, '0000-00-00 00:00:00', 1, 1, 91, 3, '5.10'),
(115, 48, '0000-00-00 00:00:00', 1, 1, 92, 1, '5.60'),
(116, 49, '0000-00-00 00:00:00', 1, 1, 92, 0, '5.75'),
(117, 50, '0000-00-00 00:00:00', 1, 1, 92, 4, '7.50'),
(118, 51, '0000-00-00 00:00:00', 1, 1, 92, 5, '8.50'),
(119, 52, '0000-00-00 00:00:00', 1, 1, 92, 0, '5.50'),
(120, 53, '0000-00-00 00:00:00', 1, 1, 92, 3, '5.00'),
(121, 54, '0000-00-00 00:00:00', 1, 1, 93, 1, '5.65'),
(122, 55, '0000-00-00 00:00:00', 1, 1, 93, 0, '5.75'),
(123, 56, '0000-00-00 00:00:00', 1, 1, 93, 4, '7.30'),
(124, 57, '0000-00-00 00:00:00', 1, 1, 93, 5, '8.50'),
(125, 58, '0000-00-00 00:00:00', 1, 1, 93, 3, '5.10'),
(126, 59, '0000-00-00 00:00:00', 1, 1, 94, 1, '7.30'),
(127, 60, '0000-00-00 00:00:00', 1, 1, 94, 2, '7.60'),
(128, 61, '0000-00-00 00:00:00', 1, 1, 95, 7, '7.60'),
(129, 62, '0000-00-00 00:00:00', 1, 1, 95, 8, '7.95'),
(130, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(131, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(132, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(133, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(134, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(135, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(136, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(137, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(138, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(139, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(140, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(141, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(142, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(143, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(144, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(145, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(146, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(147, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(148, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(149, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(150, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(151, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(152, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(153, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(154, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(155, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00'),
(156, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, '0.00');

-- --------------------------------------------------------

--
-- Stand-in structure for view `prod_meat_view`
--
CREATE TABLE IF NOT EXISTS `prod_meat_view` (
`price_id` int(11)
,`price_active` tinyint(4)
,`price_sn` int(11)
,`prod_list_id` int(11)
,`price` decimal(20,2)
,`meats_id` int(11)
,`meats_active` tinyint(4)
,`meats_title` varchar(256)
,`short_name` varchar(128)
,`icon` text
,`prod_category_id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `services_opening_hours`
--

CREATE TABLE IF NOT EXISTS `services_opening_hours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `sn` bigint(20) DEFAULT NULL,
  `from_` bigint(20) DEFAULT NULL,
  `to_` bigint(20) DEFAULT NULL,
  `day` varchar(3) DEFAULT NULL,
  `collection` varchar(1) DEFAULT 'Y',
  `delivery` varchar(1) DEFAULT 'Y',
  `sit_in` varchar(1) DEFAULT 'Y',
  `waiting_collection` bigint(20) DEFAULT '15',
  `waiting_delivery` bigint(20) DEFAULT '45',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `services_opening_hours`
--

INSERT INTO `services_opening_hours` (`id`, `login_id`, `updated`, `active`, `sn`, `from_`, `to_`, `day`, `collection`, `delivery`, `sit_in`, `waiting_collection`, `waiting_delivery`) VALUES
(1, 7, '0000-00-00 00:00:00', 1, 1, 1080, 1440, 'Mon', 'Y', 'Y', 'Y', 15, 45),
(2, 7, '0000-00-00 00:00:00', 1, 2, 1080, 1440, 'Tue', 'Y', 'Y', 'Y', 15, 45),
(3, 7, '0000-00-00 00:00:00', 1, 3, 1080, 1440, 'Wed', 'Y', 'Y', 'Y', 15, 45),
(4, 7, '0000-00-00 00:00:00', 1, 4, 1080, 1440, 'Thu', 'Y', 'Y', 'Y', 15, 45),
(5, 7, '0000-00-00 00:00:00', 1, 5, 1080, 1440, 'Fri', 'Y', 'Y', 'Y', 15, 45),
(6, 7, '0000-00-00 00:00:00', 1, 6, 1080, 1440, 'Sat', 'Y', 'Y', 'Y', 15, 45),
(7, 7, '0000-00-00 00:00:00', 1, 7, 1080, 1440, 'Sun', 'Y', 'Y', 'y', 15, 45),
(8, 1, '0000-00-00 00:00:00', 1, 8, 720, 870, 'Mon', 'Y', 'Y', 'Y', 15, 45),
(9, 1, '0000-00-00 00:00:00', 1, 9, 720, 870, 'Tue', 'Y', 'Y', 'Y', 15, 45),
(10, 1, '0000-00-00 00:00:00', 1, 10, 720, 870, 'Wed', 'Y', 'Y', 'Y', 15, 45),
(11, 1, '0000-00-00 00:00:00', 1, 11, 720, 870, 'Thu', 'Y', 'Y', 'Y', 15, 45),
(12, 1, '0000-00-00 00:00:00', 1, 12, 720, 870, 'Fri', 'Y', 'Y', 'Y', 15, 45),
(13, 1, '0000-00-00 00:00:00', 1, 13, 720, 870, 'Sat', 'Y', 'Y', 'Y', 15, 45),
(14, 1, '0000-00-00 00:00:00', 1, 14, 720, 870, 'Sun', 'Y', 'Y', 'Y', 15, 45);

-- --------------------------------------------------------

--
-- Table structure for table `settings_business`
--

CREATE TABLE IF NOT EXISTS `settings_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` bigint(20) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `business_code` varchar(256) NOT NULL DEFAULT 'New',
  `business_name` varchar(256) NOT NULL DEFAULT 'New',
  `logo` text NOT NULL,
  `business_slogan` text NOT NULL,
  `email_customer_service` varchar(256) NOT NULL,
  `email_operation` varchar(256) NOT NULL,
  `email_billing` varchar(256) NOT NULL,
  `email_order` varchar(256) NOT NULL,
  `email_order_support` varchar(256) DEFAULT 'orders@allinepos.co.uk',
  `phone1` varchar(32) NOT NULL,
  `phone2` varchar(32) DEFAULT NULL,
  `phone3` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `house_number` varchar(128) DEFAULT NULL,
  `address1` varchar(256) DEFAULT NULL,
  `address2` varchar(256) DEFAULT NULL,
  `town` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `county` varchar(256) DEFAULT NULL,
  `country` varchar(256) DEFAULT NULL,
  `postcode` varchar(256) NOT NULL,
  `direction` text,
  `vat_no` varchar(16) DEFAULT NULL,
  `web_url` text NOT NULL,
  `use_ssl` tinyint(4) NOT NULL DEFAULT '0',
  `manager_fnames` varchar(128) NOT NULL,
  `manager_lname` varchar(128) NOT NULL,
  `manager_phone` varchar(128) NOT NULL,
  `established` varchar(128) DEFAULT NULL,
  `pizza_supported` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings_business`
--

INSERT INTO `settings_business` (`id`, `login_id`, `updated`, `active`, `business_code`, `business_name`, `logo`, `business_slogan`, `email_customer_service`, `email_operation`, `email_billing`, `email_order`, `email_order_support`, `phone1`, `phone2`, `phone3`, `fax`, `house_number`, `address1`, `address2`, `town`, `city`, `county`, `country`, `postcode`, `direction`, `vat_no`, `web_url`, `use_ssl`, `manager_fnames`, `manager_lname`, `manager_phone`, `established`, `pizza_supported`) VALUES
(1, 1, '0000-00-00 00:00:00', 1, 'ukb1826', 'The Royals TEST', 'http://allinepos.co.uk/clients/logo/ukb1826/logo300x130.png', 'Best Indian food in town', 'info@theroyalsrestaurants.co.uk', 'ukb1826@cwaiter.co.uk', 'info@theroyalsrestaurants.co.uk', 'ukb1826@cwaiter.net', 'orders@allinepos.co.uk', '2089040011', '2089085306', '', '', '769', 'Harrow Road', '', 'Sudbury', 'Middlesex', 'london', 'UK', 'HA0 2LW', '', '12345677', 'http://theroyals.lc', 0, 'Mustaq', '', '7956321898', '2000', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'amzadmojumder', '$2y$08$vIfmHwcC6nP.UBIPtiCCSecavSKJZWFrYR6kH5kVJPi5nj.Z0Rq8C', NULL, 'amzadfof@gmail.com', NULL, NULL, NULL, NULL, 1405554124, 1406489704, 1, 'Amzad', 'Mojumder', 'Conosurtek Ltd', '07900642131'),
(2, '127.0.0.1', 'administrator', '$2y$08$8QTHU1aiZEgzos6tcIe8VuNSB39T2SsG9N9bKB.YZeizpfhIQ5FkO', '', 'mr@conosurtek.net', '', NULL, NULL, 'bS14eFoGrrswcWLXHnNnFu', 1268889823, 1405553968, 1, 'Muhammad Rezwanur', ' Rahman', 'Conosurtek Ltd', '07900642131'),
(3, '127.0.0.1', 'lalitasahu', '$2y$08$HTRaaXBuUGAueqNQA8IUMe9unSWhgmsXjvvKHRJtR9khA32/G7ywi', NULL, 'lalita@allinepos.co.uk', NULL, NULL, NULL, NULL, 1405554460, 1408891171, 1, 'Lalita', 'Sahu', 'All In Epos', '07402950926'),
(4, '127.0.0.1', 'tanjumkhan', '$2y$08$7pdZA8Xlun82RHQ8ING6rOAF80bGKElz3Rp8y0tkhodpTeQR/95xa', NULL, 'tanjum@cwaiter.co.uk', NULL, NULL, NULL, NULL, 1405555520, 1409052344, 1, 'Tanjum', 'Khan', 'Cwaiter Ltd', '07900642133');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(25, 1, 1),
(26, 1, 2),
(27, 1, 3),
(11, 2, 1),
(12, 2, 2),
(13, 2, 3),
(19, 3, 1),
(20, 3, 2),
(21, 3, 3),
(22, 4, 1),
(23, 4, 2),
(24, 4, 3);

-- --------------------------------------------------------

--
-- Structure for view `prod_meat_view`
--
DROP TABLE IF EXISTS `prod_meat_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `prod_meat_view` AS select `prod_meat_price`.`id` AS `price_id`,`prod_meat_price`.`active` AS `price_active`,`prod_meat_price`.`sn` AS `price_sn`,`prod_meat_price`.`prod_list_id` AS `prod_list_id`,`prod_meat_price`.`price` AS `price`,`prod_meats`.`id` AS `meats_id`,`prod_meats`.`active` AS `meats_active`,`prod_meats`.`title` AS `meats_title`,`prod_meats`.`short_name` AS `short_name`,`prod_meats`.`icon` AS `icon`,`prod_list`.`prod_category_id` AS `prod_category_id` from (`prod_list` left join (`prod_meat_price` left join `prod_meats` on((`prod_meat_price`.`prod_meats_id` = `prod_meats`.`id`))) on((`prod_list`.`id` = `prod_meat_price`.`prod_list_id`))) order by `prod_meat_price`.`sn`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<?php

/*
| 	NetPay Integration Library
|
| 	Copyright 2013, NetPay Merchant Service Ltd
| 	
| 	http://www.netpay.co.uk
|
| 	For Merchant use only. Distribution is not allowed.
*/

class Integration {

	/*	MCRYPT ENCRYPTION
	*	MODE CBC
	*/
	public static function mcrypt_encrypt_cbc($input, $key, $iv) {
		$size = mcrypt_get_block_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC); 
		$input = integration::add_pkcs5_padding($input, $size); 
		$td = mcrypt_module_open(MCRYPT_RIJNDAEL_128, '', MCRYPT_MODE_CBC, ''); 

		mcrypt_generic_init($td, pack('H*',$key), pack('H*', $iv)); 
		$data = mcrypt_generic($td, $input); 
		mcrypt_generic_deinit($td); 
		mcrypt_module_close($td); 
		$data = bin2hex($data);

		return $data; 
	}

	/*	MCRYPT DECRYPTION
	*	MODE CBC
	*/
	public static function mcrypt_decrypt_cbc($input, $key, $iv) {
		$decrypted= mcrypt_decrypt(MCRYPT_RIJNDAEL_128, pack('H*', $key), pack('H*', $input), MCRYPT_MODE_CBC, pack('H*', $iv));
		
		return integration::remove_pkcs5_padding($decrypted);
	}

	/*	OPENSSL ENCRYPTION
	*	MODE CBC
	*/
	public static function openssl_encrypt_cbc($input, $key, $iv, $method) {
		$encrypted = openssl_encrypt($input, $method, pack('H*',$key), TRUE, pack('H*',$iv));

		$encrypted_hex = bin2hex($encrypted);

		return $encrypted_hex;
	}

	/*	OPENSSL DECRYPTION
	*	MODE CBC
	*/
	public static function openssl_decrypt_cbc($input, $key, $iv, $method) {
		$decrypted = openssl_decrypt(pack('H*', $input), $method, pack('H*',$key), true, pack('H*',$iv));

		return $decrypted;
	}

	/*
	*	ADD PKCS5 PADDING
	*/
	private static function add_pkcs5_padding($text, $blocksize) { 
		$pad = $blocksize - (strlen($text) % $blocksize); 
		return $text . str_repeat(chr($pad), $pad); 
	} 

	/*
	*	REMOVE PKCS5 PADDING
	*/
	private static function remove_pkcs5_padding($decrypted) { 
		$dec_s = strlen($decrypted); 
		$padding = ord($decrypted[$dec_s-1]); 
		$decrypted = substr($decrypted, 0, -$padding);

		return $decrypted;
	}

	/*
	*	Add timestamp to transaction id
	*/
	public static function create_unique_transaction_id($transaction_id) {
		return strtolower($transaction_id) . time();
	}

	/*
	*	Create token with combination of merchant_id, timestamp and transaction_id
	*/
	public static function create_unique_session_token($merchant_id, $transaction_id) {
		return strtolower($merchant_id) . time() . strtolower($transaction_id);
	}

	public static function parse_response_url($response) {
		preg_match_all('/\{([^}]*)\}/', $response, $matches);

		$parsed_url = array();
		foreach($matches[1] as $match) {
		    list($key, $value) = explode('|', $match);
		    $parsed_url[$key] = $value;
		}

		return $parsed_url;
	}
}

	$method = 'AES-128-CBC'; // Encryption method, IT SHOULD NOT BE CHANGED
	$key = "e143001b009c0f133c9f1be678b850f4"; // Sample Encryption Key. Contact NetPay to get your own Encryption Key. Must be stored in safe place e.g. Database etc
	$iv = "9fa1fe272a4147786583fc5a18894831"; // Sample Encryption Initialisation Vector (IV). Contact NetPay to get your own IV. Must be stored in safe place e.g. Database etc

	$merchant_id = "TEST999"; // Sample merchant account id
	$transaction_id = "TRANS001"; // Sample transaction id		
	$input = "example"; # Sample string for encryption test

	# Sample response url string
	$response_url_str = 'f98092d03f2e862967620af5d9b7bffa254cb9e2c207f18b4f6c7495ac8fbcd0d4948e78b1f6ad07b92c0c5b804308d22954a488f0ed320efffa6ab377bf792e9d589923e511ce18e36c63b690cfde32a69c3ca214dae9e7941371e72c5371ad58b577ea02c7e96fb1d5c814e02563ebd8cec250049ace87ddf5b66ac99c397bf200e4b1375d6bef685f7fccc20304668eb9964549b96c9acceabaed7957b81359adc9c432f72019e4f27eaf0e832d03b7ae987c3ddd60e422215e32ec9994871dfdaa11c8ab1d7c8bde22e15e04ac428b5b110a4a60932d81899f5b81d2585e';

	$encrypted_str = integration::mcrypt_encrypt_cbc($input, $key, $iv);
	$decrypted_str = integration::mcrypt_decrypt_cbc($encrypted_str, $key, $iv);

	echo "-------------------- MCRYPT AES_CBC ---------------------------" . "\n";
	echo "Encrypted_cbc: " . $encrypted_str . "\n";
	echo "Decrypted_cbc: " . $decrypted_str . "\n";

	$encrypted_str = integration::openssl_encrypt_cbc($input, $key, $iv, $method);
	$decrypted_str = integration::openssl_decrypt_cbc($encrypted_str, $key, $iv, $method);

	echo "-------------------- OPENSSL AES_CBC -------------------------" . "\n";
	echo "Encrypted_cbc: " . $encrypted_str . "\n";
	echo "Decrypted_cbc: " . $decrypted_str . "\n";


	$unique_transaction_id = integration::create_unique_transaction_id($transaction_id);
	$unique_session_token = integration::create_unique_session_token($merchant_id, $transaction_id);

	echo "Unique Transaction Id : " . $unique_transaction_id . "\n";
	echo "Unique Session Token : " . $unique_session_token . "\n";

	$decrypted_response_url_str = integration::mcrypt_decrypt_cbc($response_url_str, $key, $iv);

	$response_array = integration::parse_response_url($decrypted_response_url_str);

	echo "-------------------- PARSED URL ---------------------------\n";
	print_r($response_array);
?>
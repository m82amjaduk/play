<?php

function unset_empty_fields(&$array)
{
    foreach ($array as $key => &$value)
    {
        if(is_array($value))
        {
            unset_empty_fields($value);
        }
        elseif($value === "")
        {
            unset($array[$key]);
        }
        if(is_array($value) && count($value) === 0)
        {
            unset($array[$key]);
        }
    }
}

if($_POST)
{
    include_once 'config.php';
    
    $version = $_POST['version'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $accept = $_POST['accept_type'];
    $content_type = $_POST['content_type'];
    $uses_token = (isset($_POST['uses_token'])?$_POST['uses_token']:'no');
    $uses_scheduled = (isset($_POST['uses_scheduled'])?$_POST['uses_scheduled']:'no');
    
    unset($_POST['version']);
    unset($_POST['username']);
    unset($_POST['password']);
    unset($_POST['accept_type']);
    unset($_POST['content_type']);
    unset($_POST['uses_token']);
    unset($_POST['uses_scheduled']);
    
    if($uses_token == 'yes') {
        $api_method = 'gateway/token';
    } elseif($uses_scheduled == 'yes') {
        $api_method = 'gateway/scheduled_payment';
    } else {
        $api_method = 'gateway/transaction';
    }

    include_once("Connection.php");

    $header = array(
        'username' => $username,
        'password' => $password,
        'accept' => $accept,
        'content_type' => $content_type
        );
    $rest = new Connection($gateway_url, $header, $ssl_path);
    
    unset_empty_fields($_POST);
    
    $response = $rest->put($api_method, $_POST);
    $error_message='';
    if(!$response){
        $error_message = $rest->get_error_message();
    }
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>NetPay API Example Code - Results</title>
    <link rel="stylesheet" type="text/css" href="./assets/style.css" />
</head>
<body>
    <header class="container-fluid">
        <div class="row-fluid">
            <div class="container">
                <div class="row">
                    <h1><span id="main-logo">NetPay</span> API PHP REST Example</h1>
                </div>
            </div>                       
        </div>
    </header>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="container">
                <div class="row">
                    <h3>Receipt Page</h3>
                </div>
            </div>                       
        </div>
    </div>
	<div class="container">
		<div class="row">
			<p><a href="index.html">Return to the Home Page</a></p>
		</div>
	</div>
    <div class="container">
        <div id="content" class="row">
			<form id="form1">
				<div>
					<table cellpadding="5" border="0">
						<tbody>
							<tr class="header">
								<td colspan="2"><p><span>Request URL</span></p></td>
							</tr>
							<tr>
								<td class="text-center">
									<?php echo $rest->get_full_url(); ?>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="60%" cellpadding="5" border="0">
						<tbody>
							<tr class="header">
								<td colspan="2"><p><span>Response Code</span></p></td>
							</tr>
							<tr>
								<td class="text-center">
									<?php echo $rest->get_response_code(); ?>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="60%" cellpadding="5" border="0">
						<tbody>
							<tr class="header">
								<td colspan="2"><p><span>Http Accept</span></p></td>
							</tr>
							<tr>
								<td class="text-center">
									<?php echo $rest->get_accept_type(); ?>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="60%" cellpadding="5" border="0">
						<tbody>
							<tr class="header">
								<td colspan="2"><p><span>Http Content Type</span></p></td>
							</tr>
							<tr>
								<td class="text-center">
									<?php echo $rest->get_content_type(); ?>
								</td>
							</tr>
						</tbody>
					</table>
                     <?php
                    if($error_message!=''){
                    ?>
                    <table width="60%" cellpadding="5" border="0">
                                <tbody>
                                        <tr class="header">
                                                <td colspan="2"><p><span>Error Message</span></p></td>
                                        </tr>
                                        <tr>
                                                <td>
                                        <?php echo $error_message; ?>

                                                </td>
                                        </tr>
                                </tbody>
                        </table>
                    <?php
                    }
                    ?>
					<table width="60%" cellpadding="5" border="0">
						<tbody>
							<tr class="header">
								<td colspan="2"><p><span>Response Body</span></p></td>
							</tr>
							<tr>
								<td>
									<xmp>
<?php echo $rest->format_get_last_response(); ?>
									</xmp>
								</td>
							</tr>
						</tbody>
					</table>
					<table width="60%" cellpadding="5" border="0">
						<tbody>
							<tr class="header">
								<td colspan="2"><p><span>Request Body</span></p></td>
							</tr>
							<tr>
								<td>
									<xmp>
<?php echo $rest->format_get_last_request(); ?>
									</xmp>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div> 
</body>
</html>
<?php
}
else
{
    echo 'No data sent.';
}

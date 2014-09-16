<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 20/04/14
 * Time: 09:58
 */

$cb = '<div class="clearBoth"></div>';
?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" <!--"http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd"-->
<!--Website template by conosurTek.co.uk -->
<html lang="en">
<head>
    <!--        site info  -->
    <title>Official Site - <?=$business->business_name?>:: About :: <?=$business->business_slogan?> </title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <link rel="icon" type="image/gif" href="http://conosurtek.co.uk/aj/images/conosurTek/favicon.ico"/>
    <meta http-equiv="Content-Language" content="en-us"/>
    <meta name="keywords" content="<?=$business->business_name?> :: Indian, Food, Takeaway, Collection, Delivery, Chicken, Lamb, vegetable, Curry, Madras, Jalfrizi, Tikka, Masala, Dopiaza." />
    <meta name="description" content="<?=$business->business_name?> :: If you looking for healthy freshly home made food, this is the right place for you. Please give us an opportunity to serve you your favourate meal." />
    <meta name="author" content="Amjad Mojumder, ConosurTek Ltd, UK" />
    <meta name="developer" content="Amjad Mojumder, ConosurTek Ltd, UK" />
    <meta name="owner" content="All In ePOS, UK" />
    <!--        site info ends -->

    <link rel="stylesheet" href="<?=$menuCSS?>main.css" type="text/css" media="all">
    <link rel="stylesheet" href="<?=$menuCSS?>navTop.css" type="text/css" media="all">
    <link rel="stylesheet" href="<?=$menuCSS?>navSide.css" type="text/css" media="all">
    <link rel="stylesheet" href="<?=$menuCSS?>products.css" type="text/css" media="all">
    <link rel="stylesheet" href="<?=$menuCSS?>form.css" type="text/css" media="all">
    <link rel="stylesheet" href="<?=$menuCSS?>alertify.core.css" type="text/css" media="all">
    <link rel="stylesheet" href="<?=$menuCSS?>alertify.default.css" type="text/css" media="all"  id="toggleCSS" >


    <!-- For product Note :: C0014 -->
    <script  type="text/javascript" src="<?=$menuJS?>jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="<?=$menuJS?>jquery.min.js"></script>
    <script type="text/javascript" src="<?=$menuJS?>alertify.min.js"></script>
    <script type="text/javascript" src="<?=$menuJS?>jquery.bpopup.min.js"></script>

    <!--[if lt IE 9]>
    <script type="text/javascript" src="http://thekitchensonline.lc/cono/main02/js/html5.js"></script>
    <style type="text/css">
        #menu a, .bg, .bg2, #ContactForm a {behavior:url(js/PIE.htc)}
    </style>
    <![endif]-->
    <!--[if lt IE 7]>
    <div style='clear:both;text-align:center;position:relative'>
        <a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg" border="0" alt="" /></a>
    </div>
    <![endif]-->

    <style>
        #logo{
            background: url(<?=$business->logo?>) 0 0 no-repeat;
        }

        html {
            background: url(<?=base_url()?>/img/struct/bg.jpg) /*no-repeat*/ center center fixed;
        }
    </style>
</head>

<body>
        <!-- Fixed Header -->
        <? if ($this->session->userdata('errorUser')) { ?>
            <script>  alertify.alert('<?=$this->session->userdata('errorUser');?>');  </script>
            <?   $this->session->unset_userdata('errorUser');
        }?>
    <div class="header-cont">
        <div class="header">
            <a href="<?=base_url()?>" id="logo"  class="pleaseWait"> <?=$business->business_name?></a>
            <!--div class="userMenu">
                order | login | logout | user
            </div-->
            <div id="containerMenu">
                <ul id="menu">
                    <li><a href="<?=base_url()?>"  class="pleaseWait" >Home</a></li>
                    <li>
                        <a href="/takeaway/menu"  class="pleaseWait" >Menu</a>
                        <ul>
<!--                            <li><a href="/takeaway/order_details">Order Details</a></li>-->
<!--                            <li><a href="/takeaway/user_details">User Details</a></li>-->
<!--                            <li><a href="/takeaway/confirm">Confirm</a></li>-->
<!--                            <li><a href="/takeaway/menu/2">Starter</a></li>-->
<!--                            <li><a href="/takeaway/menu/3">Tandoori Dishes</a></li>-->
<!--                            <li><a href="/takeaway/menu/4">Chef Special Dishes</a></li>-->
<!--                            <li><a href="/takeaway/menu/4">Classic Dishes</a></li>-->
<!--                            <li><a href="/takeaway/menu/5">Side Dishes</a></li>-->
<!--                            <li><a href="/takeaway/menu/6">Side Orders</a></li>-->
                        </ul>
                    </li>
                    <li><a href="/about/gallery"  class="pleaseWait">Gallery</a></li>
                    <li><a href="/about/us"  class="pleaseWait">About</a></li>
                    <li><a href="/about/contact"  class="pleaseWait">Contact</a></li>
                </ul>
            </div>
        </div>
    </div>
        <!-- Please wait -->
        <div id="wait" style="display:none;width:300px; border:1px solid black;position:absolute;
        top:40%;left:40%;padding:2px; background:#fff; text-align: center; z-index: 1;">
            <img src='/img/menu/struct/please_wait.gif' width="300"/> <br /> <?=$business->business_name?>
        </div>
        <!-- Please wait -->

        <!-- Main Body -->
<!--    <div class="content">-->
        <div id="pageChange">
            <? require_once $page.".php"?>
        </div>
<!--    </div>-->

        <!---->
<!--    <div class="footer">-->
<!--        This is footer-->
<!--    </div>-->
        <!-- Fixed Footer -->
    <div class="fixFooterCont">
        <div class="fixFooter" id="footer">   </div>
    </div>
</body>
<script type="text/javascript" src="<?=$menuJS?>cart.js"></script>


<script type="text/javascript">
    $(document).ready(function() {
        $("#pageChange").css("display", "none");
        $("#pageChange").fadeIn(1500);
        $(".errorMessage").fadeOut(8000);
    });
    $(".pleaseWait").click(function(event){
        event.preventDefault();
        linkLocation = this.href;
        $("#wait").css("display","block");
        window.location = linkLocation;
    });
</script>



<!-- Tracker -->
<? if($tracker->active == 1){?>
<script>
    var siteID          = '<?=$tracker->site_id_tracker?>';
    var trackerLocation = '<?=$tracker->tracker_domian?>';
    var siteDomain      = '<?=$tracker->site_domain?>';
    var debugMode       = '<?=$tracker->debug_mode?>';
</script>
<? $this->load->view( "common/tracker.php"); }?>
<!--End Tracker-->

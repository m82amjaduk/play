<?
$host = "http://".$_SERVER['HTTP_HOST'];
$aboutCSS = $host.'/resources/about01/css';
$aboutJS = $host.'/resources/about01/js';
$aboutIMG = $host.'/resources/about01/img';


$mod = $this->aboutm->process_highlights ($highlights_main, array('our_restaurant',  'our_food', 'top_banner')  );
$top_banner = $mod['top_banner'][0];
$our_restaurant = $mod['our_restaurant'][0];
$our_food = $mod['our_food'][0];
?>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" > <!--<![endif]-->
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

		<meta name="viewport" content="width=device-width">
		
		<!-- CSS -->
		<link href='http://fonts.googleapis.com/css?family=Arvo:400' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="<?=$aboutCSS?>/style.css">
		<link rel="stylesheet" href="<?=$aboutCSS?>/responsive.css">

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

<!--        <script  type="text/javascript" src="--><?//=$menuJS?><!--jquery-1.11.0.min.js"></script>-->
<!--        <script type="text/javascript" src="--><?//=$menuJS?><!--jquery.min.js"></script>-->
		<script src="<?=$aboutJS?>/modernizr.js"></script>
	</head>
	<body>
	
		
		<!-- WRAPPER -->
		<div class="wrapper"
		
			<!-- HEADER -->
			<header class="cf">
				<div id="logo"><a href="/about" class="pleaseWait" ><img src="<?=$business->logo?>" alt="<?=$business->business_name?> Logo" /></a></div>
				
				<!-- social-bar -->
				<ul id="social-bar" class="cf desktop_only">
                    <? foreach ($socialHerf as $row){?>
					<li style="background-image: url('<?=$row->icon?>');"><a href="<?=$row->url?>"  title="<?=$row->social_name?>" target="_blank" ></a></li> <?}?>
				</ul>
				<!-- ENDS social-bar -->
                <div class="order_online desktop_only">
                    <?=$top_banner->title?> <a href=" <?=$top_banner->button_href?>"  class="pleaseWait"><button class="button_sp"> <?=$top_banner->button?> </button></a>
                </div>
				
			</header>
			<!-- ENDS HEADER -->
			
			<!-- NAV -->
			<nav class="cf">
				<ul id="nav" class="sf-menu">
					<li class="current-menu-item"><a href="/about" class="pleaseWait">HOME</a></li>
                    <li><a href="/about/us">ABOUT US</a>
					<li class="important"><a href="/takeaway/menu" class="pleaseWait" id="cj_menu">MENU</a></li>
<!--						<ul>-->
<!--							<li><a href="page.html">Columns</a></li>-->
<!--							<li><a href="page-typography.html">Typography</a></li>-->
<!--							<li><a href="page-elements.html">Elements</a></li>-->
<!--							-->
<!--						</ul>	-->
					</li>
					<li><a href="/about/gallery" class="pleaseWait">GALLERY</a></li>
					<li><a href="/about/contact" class="pleaseWait">CONTACT</a></li>
					
				</ul>
			</nav>
			<!-- ENDS NAV -->


            <!-- Please wait -->
            <div id="wait" style="display:none;width:300px; border:1px solid black;position:absolute;top:40%;
            left:40%;padding:2px; background:#fff; text-align: center;  z-index: 1;">
                <img src='/img/menu/struct/please_wait.gif' width="300"/> <br /> <?=$business->business_name?>
            </div>
            <!-- Please wait -->

            <div id="pageChange">
                <? require_once $page.".php"?>
            </div>
			<!-- WIDGETS -->
			<ul  class="widget-cols cf">
				<li class="first-col">

					<div class="widget-block">
						<h4><?=$our_restaurant->title?></h4>
						<p><?=$our_restaurant->body?></p>
		     		</div>
				</li>

				<li class="second-col">

					<div class="widget-block">
						<h4>LATEST TWEETS</h4>
						<script src="<?=$aboutJS?>/chirp.js"></script>
						<script>Chirp({user:'ansimuz',max:2})</script>
		     		</div>

				</li>

				<li class="third-col">
					<div class="widget-block">
						<h4><?=$our_food->title?></h4>
						<p><?=$our_food->body?></p>
		     		</div>
				</li>

				<li class="fourth-col">

					<div class="widget-block">
						<h4>CATEGORIES</h4>
						<ul>
							<li class="cat-item"><a href="#" >Startes</a></li>
							<li class="cat-item"><a href="#" >Tandoori Dishes</a></li>
							<li class="cat-item"><a href="#" >Chef Specials</a></li>
							<li class="cat-item"><a href="#" >Classic Dishes</a></li>
							<li class="cat-item"><a href="#" >Side Orders</a></li>
							<li class="cat-item"><a href="#" >Sundries</a></li>
						</ul>
					</div>

				</li>
				<li class="scroll"></li>
			</ul>
			<!-- ENDS WIDGETS -->

			
			<!-- FOOTER -->
			<div class="footer-divider" id="cj_footer"></div>
			<footer class="cf">
				Supported by <a href="http://www.allinepos.co.uk" >http://www.allinepos.co.uk</a>
			</footer>
			<!-- ENDS FOOTER -->
		
		</div>
		<!-- ENDS WRAPPER -->
		
		<!-- JS -->
<!--		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>-->
		<script>window.jQuery || document.write('<script src="<?=$aboutJS?>/jquery.js"><\/script>')</script>
		<script src="<?=$aboutJS?>/custom.js"></script>
		
		<!-- superfish -->
		<script  src="<?=$aboutJS?>/superfish-1.4.8/js/hoverIntent.js"></script>
		<script  src="<?=$aboutJS?>/superfish-1.4.8/js/superfish.js"></script>
		<script  src="<?=$aboutJS?>/superfish-1.4.8/js/supersubs.js"></script>
		<!-- ENDS superfish -->
		
		<script src="<?=$aboutJS?>/css3-mediaqueries.js"></script>
		
		<script src="<?=$aboutJS?>/nivoslider.js"></script>
		<script src="<?=$aboutJS?>/tabs.js"></script>
		
	
		<!-- ENDS JS -->
	</body>
</html>

<script type="text/javascript">
    $(document).ready(function() {
        $("#pageChange").css("display", "none");
        $("#pageChange").fadeIn(1500);
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



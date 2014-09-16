
<?
$inc=$this->_ci->config->item('incDirMenu');
$domain=base_url();

?>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Elita - HTML/CSS Template - Łukasz Wakuła</title>

    <!-- Framework CSS -->
    <link rel="stylesheet" href="<?=$inc?>css/screen.css" type="text/css" media="screen, projection">
    <link rel="stylesheet" href="<?=$inc?>css/print.css" type="text/css" media="print">
    <link rel="stylesheet" href="<?=$inc?>css/stylesheet.css" type="text/css" media="screen, projection">
    <!--[if lt IE 8]><link rel="<?=$inc?>stylesheet" href="<?=$inc?>css/ie.css" type="text/css" media="screen, projection"><![endif]-->
    <!--[if IE]>
    <style>

        .footer {background: url(<?=$inc?>images/ieFooterBg.png) repeat-x; color: #eee;}
        span.twitterBubble {background: url(<?=$inc?>images/ieFooterBg.png) repeat-x;  color: #eee;}
        .navi ul.menu li a.hover, .navi ul.menu li a:hover.under, .navi ul.menu li ul.sub li {background: url(<?=$inc?>images/whiteRGBA.png) repeat;}
        .navi ul.menu li a {color: white;}
        .navi ul.menu li a:hover, .navi ul.menu li ul.sub li a:hover {color: #333;}
    </style>
    <![endif]-->
    <!-- For product Note :: C0014 -->
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.0.min.js"></script>
    <!-- jQuery lib -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <!-- nivo slider -->
    <script type="text/javascript" src="<?=$inc?>js/jquery.nivo.slider.js"></script>
    <link rel="stylesheet" href="<?=$inc?>css/nivo.css" type="text/css" media="screen, projection">
    <!-- tabs -->
    <script src="<?=$inc?>js/tabs.js" type="text/javascript"></script>
    <!-- custom tooltip -->
    <script type="text/javascript" src="<?=$inc?>js/tooltip.js"></script>
    <style>
        .topBackground{
            background: #324;
            width: 100%;
            height: 250px;
            margin: -10px -2px;
        }

    </style>
</head>
<body>
<img src='http://www.asiahotelscheap.com/hotel_images/Sri_Lanka/Colombo/Galadari_Hotel_Flavors_Indian_Restaurant31.jpg' id='bg' alt='background'>
<div class="topBackground">  </div>
<div class="container">
<hr class='space'>
<div class="span-7">
    <div class='box noBg'>
        <a href='<?=$domain?>'><img src='<?=$inc?>images/logo.png' alt='logo'></a>
    </div>
</div>
<div class="span-15 navi">
    <ul class='menu'>
        <li><a href='../index.html'>Home page</a></li>
        <li><a href='shortcodes.html' class='under'>Shortcodes</a>
            <ul class='sub'>
                <li><a href='shortcodes.html'>Headings</a></li>
                <li><a href='shortcodes.html'>Dialog boxes</a></li>
                <li class='last'><a href='shortcodes.html'>Layouts</a></li>
            </ul>
        </li>
        <li><a href='gallery.html'>Gallery</a></li>
        <li><a href='blog.html' class='under'>Blog</a>
            <ul class='sub'>
                <li><a href='blogpost.html'>Blog post</a></li>
                <li class='last'><a href='blog.html'>Archive</a></li>
            </ul>
        </li>
        <!-- Some jQuery to create slick animation -->
        <script type="text/javascript">
            (function(){
                var submenu = $('ul.sub'), // Set the class of the submenu
                    linkHover = submenu.prev('a.under'); // Set the link to show submenu after hovering it

                submenu.on('mouseenter',function(){
                    $(this).prev('a.under').addClass('hover');
                });
                submenu.on('mouseleave',function(){
                    linkHover.removeClass('hover');
                });
                linkHover.on('mouseleave',function(){
                    linkHover.removeClass('hover');
                });
            })();
        </script>
        <li><a href='contact.html' class='last'>Contact</a></li>
    </ul>
</div>
<hr class='space'>
    <? /*
<div class='span-24 slider'>
    <div class='bevel'></div>
    <div class="slider-wrapper theme-nivo">
        <div id="slider" class="nivoSlider">
            <img src="blog/pictures/2.jpg" alt="2">
            <img src="blog/pictures/3.jpg" alt="3">
            <img src="blog/pictures/4.jpg" alt="4">
            <img src="blog/pictures/5.jpg" alt="5">
        </div>
    </div>
    <script type="text/javascript">
        jQuery(window).load(function(){
            jQuery("#slider").nivoSlider({
                effect:"random",
                slices:15,
                boxCols:8,
                boxRows:4,
                animSpeed:500,
                pauseTime:3000,
                startSlide:0,
                directionNav:false,
                directionNavHide:false,
                controlNav:true,
                controlNavThumbs:false,
                controlNavThumbsFromRel:true,
                keyboardNav:true,
                pauseOnHover:true,
                manualAdvance:false,
                borderRadius: 5
            });
        });
    </script>
    <div class='arrowUp'></div>
</div>
<div class='span-24'>
    <div class='bigImgCaption'>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.</p>
    </div>
</div>
<hr class='space'>
<h1 class='white'>Blog</h1>  */ ?>
<div class='span-24 maincontent'><!-- MAIN CONTENT STARTS HERE -->
<!-- MIDDLE CONTENT STARTS HERE -->
<?  include_once "$page.php";?>
</div><!-- end of main content -->
<?
/*  twitter
<div class='span-24 twitter'>

    <div class="span-8">
        <div class='newestTweet box'>
            <span class='avatarHolder'>
              <span class='twitterAvatar'><img src='https://twimg0-a.akamaihd.net/profile_images/418846897/5291_1197674386174_1357936058_1780743_3612525_n_normal.jpg' alt='User avatar'></span>
              <span class='twitterAuthor'>lukwakula</span>
            </span>
            <span class='twitterBubble'>Systemy operacyjne.  <a href='#'>#fb</a></span>
        </div>
    </div>

    <div class="span-8">
        <div class='olderTweet box'>
            <span class='avatarHolder'>
              <span class='twitterAvatar'><img src='https://twimg0-a.akamaihd.net/profile_images/418846897/5291_1197674386174_1357936058_1780743_3612525_n_normal.jpg' alt='User avatar'></span>
              <span class='twitterAuthor'>lukwakula</span>
            </span>
            <span class='twitterBubble'>Lorem massa vel tellus pede pretium.  <a href='#'>#fb</a></span>
        </div>
    </div>

    <div class="span-8 last">
        <div class='oldestTweet box'>
            <span class='avatarHolder'>
              <span class='twitterAvatar'><img src='https://twimg0-a.akamaihd.net/profile_images/418846897/5291_1197674386174_1357936058_1780743_3612525_n_normal.jpg' alt='User avatar'></span>
              <span class='twitterAuthor'>lukwakula</span>
            </span>
            <span class='twitterBubble'>Systemy operacyjne. <a href='#'>#fb</a></span>
        </div>
    </div>

</div><!-- end of twits -->
*/
    ?>
<hr class='space'>
<div class='span-24 footer'>
    <span class='copyrights'>
        &copy; Copyright <?= date('Y'); ?> -
        All Rights Reserved - <a href="<? //$load['copy_right_url'] ?>" >The Royals<? //$load['copy_right'] ?></a></span><span class="right">

       </span>
        <span class='socialFooter'>
          <a href='#' class='tooltip' data-tip='Twitter'><img src='<?=$inc?>images/social/twitter.png' alt='Twitter'></a>
          <a href='#' class='tooltip' data-tip='Tumblr'><img src='<?=$inc?>images/social/tumblr.png' alt='Tubmlr'></a>
          <a href='#' class='tooltip' data-tip='Facebook'><img src='<?=$inc?>images/social/facebook.png' alt='Facebook'></a>
          <a href='#' class='tooltip' data-tip='Vimeo'><img src='<?=$inc?>images/social/vimeo.png' alt='Vimeo'></a>
          <a href='#' class='tooltip' data-tip='Google+'><img src='<?=$inc?>images/social/google_plus_alt.png' alt='Google+'></a>
          <script type="text/javascript">
              $('.socialFooter').tooltip();
          </script>   
        </span>
</div>

    Managed by <a href="http://allinepos.co.uk" target="_blank"  >All In ePOS, UK</a>  |
    Powered by  <a href="http://www.conosurtek.co.uk" target='_blank' >conosurTek Ltd, UK.</a>
<hr class='space'>
<script type="text/javascript">

    var _gaq = _gaq || [];
    _gaq.push(['_setAccount', 'UA-29418712-1']);
    _gaq.push(['_trackPageview']);

    (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
    })();

</script>
</div><!-- end of containter -->
</body>
</html>

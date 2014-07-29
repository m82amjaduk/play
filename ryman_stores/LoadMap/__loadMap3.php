<style>
    .btn {
        display: inline-block;
        padding: 0.5em 1em;
        background: #808080;
        color: #fff;
        margin: 1em;
    &:hover, &:focus {
        color: #fff;
        background: #333;
    }
    }

    .static-img {
        display: block;
    }

    iframe {
        max-width: 100%;
    }
    /* From http://codepen.io/chriscoyier/full/kycDp */
    .map-container {
        width: 100%;
        margin: 0 auto;
        height: 0;
        padding-top: 38%;
        position: relative;
        display: none; /* Hide for small screens */
    iframe {
        width: 100%;
        height: 100%; /* had to specify height/width */
        position: absolute;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
    }
    }

    /* Medium Screens */
    @media all and (min-width: 34.375em) {
        .map-container {
            display: block;
        }
        .static-img {
            display: none;
        }
    }
</style>

<!--Pattern HTML-->
<div id="pattern" class="pattern">
    <div class="map">
        <a href="https://maps.google.com/maps?q=Pittsburgh,+PA&hl=en&sll=40.697488,-73.979681&sspn=0.667391,1.447449&oq=Pittsburgh&hnear=Pittsburgh,+Allegheny,+Pennsylvania&t=m&z=12" class="btn map-link">View Map</a>
    </div>
</div>
<!--End Pattern HTML-->

<div class="container">
    <section class="pattern-description">
        <h1>Adaptive Map</h1>
        <p>A map experience that defaults to a text link to Google Maps, loads in a static map image for small screens and an iframe map for larger screens.</p>
        <p><a href=
              "http://bradfrostweb.com/blog/post/adaptive-maps/">Read more about Adaptive Maps</a></p>
    </section>
    <footer role="contentinfo">
        <div>
            <nav id="menu">
                <a href="http://bradfrost.github.com/this-is-responsive/patterns.html">&larr;More Responsive Patterns</a>
            </nav>
        </div>
    </footer>
</div>


<script>
    $(document).ready(function(){
        buildMap();
    });

    var sw = document.body.clientWidth,
        bp = 550,
        $map = $('.map');
    var static = "http://maps.google.com/maps/api/staticmap?center=40.440625,-79.995886&zoom=13&markers=40.440625,-79.995886&size=640x320&sensor=true";
    var embed = '<iframe width="980" height="650" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=pittsburgh,+pa&amp;aq=&amp;sll=38.003385,-79.420925&amp;sspn=5.54782,11.612549&amp;ie=UTF8&amp;hq=&amp;hnear=Pittsburgh,+Allegheny,+Pennsylvania&amp;t=m&amp;ll=40.440676,-79.995918&amp;spn=0.117583,0.336113&amp;z=12&amp;iwloc=A&amp;output=embed"></iframe>';

    function buildMap() {
        if(sw>bp) { //If Large Screen
            if($('.map-container').length < 1) { //If map doesn't already exist
                buildEmbed();
            }
        } else {
            if($('.static-img').length < 1) { //If static image doesn't exist
                buildStatic();
            }
        }
    };

    function buildEmbed() { //Build iframe view
        $('<div class="map-container"/>').html(embed).prependTo($map);
    };

    function buildStatic() { //Build static map
        var mapLink = $('.map-link').attr('href'),
            $img = $('<img class="static-img" />').attr('src',static);
        $('<a/>').attr('href',mapLink).html($img).prependTo($map);
    }

    $(window).resize(function() {
        sw = document.body.clientWidth;
        buildMap();
        google.maps.event.trigger(map, "resize");
    });

</script>
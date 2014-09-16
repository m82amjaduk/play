<script type="text/javascript">
    var trackerUrl      = (("https:" == document.location.protocol) ? "https://" : "http://") + trackerLocation;

    var _paq = _paq || [];
    _paq.push(["setDocumentTitle", document.domain + "/" + document.title]);
    _paq.push(["setCookieDomain", "*."+siteDomain]);
    _paq.push(["setDomains", ["*."+siteDomain]]);
    _paq.push(['trackPageView']);
    _paq.push(['enableLinkTracking']);
    (function() {
        var u=trackerUrl;
        _paq.push(['setTrackerUrl', u+'piwik.php']);
        _paq.push(['setSiteId', siteID]);
        var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0]; g.type='text/javascript';
        g.defer=true; g.async=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
    })();
</script>
<noscript><p><img src="http://takeawayguru.com/tracker/piwik.php?idsite=3" style="border:0;" alt="" /></p></noscript>


<script>
    cLog('siteID> '+siteID + '; trackerUrl> '+ trackerUrl +  '; siteDomain> '+ siteDomain + '; debugMode> '+ debugMode );

    function cLog(data){ // console log
        if (debugMode)
            console.log(getCurrentTime() + ':: '+data);
    }
    function getCurrentTime(){
        var d = new Date();
        var currentTime = d.getFullYear() + "/" + (d.getMonth()+1) + "/" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
        return currentTime;
    }
</script>



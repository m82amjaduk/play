<!--https://www.google.co.uk/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=sql+search+within+10+mile+radius+longlat&spell=1-->
<!--http://stackoverflow.com/questions/8994718/mysql-longitude-and-latitude-query-for-other-rows-within-x-mile-radius-->
<!--http://gis.stackexchange.com/questions/31628/find-points-within-a-distance-using-mysql-->

<html>
<head>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyBl-XFi-PrFDZgDYRRD3PDtY4-xcRt6lkA&sensor=false">
    </script>

</head>

<body>
<?

$res = unserialize('a:4:{i:0;a:44:{i:0;s:1:"1";s:2:"id";s:1:"1";i:1;s:19:"2014-06-27 16:31:15";s:7:"updated";s:19:"2014-06-27 16:31:15";i:2;s:1:"0";s:6:"active";s:1:"0";i:3;s:1:"1";s:10:"store_code";s:1:"1";i:4;s:7:"AAA1786";s:11:"branch_code";s:7:"AAA1786";i:5;s:8:"Amersham";s:11:"branch_name";s:8:"Amersham";i:6;s:8:"Amersham";s:11:"unique_name";s:8:"Amersham";i:7;s:26:"114@store.robertdyas.co.uk";s:6:"email1";s:26:"114@store.robertdyas.co.uk";i:8;s:11:"02031292066";s:10:"telephone1";s:11:"02031292066";i:9;N;s:10:"telephone2";N;i:10;N;s:3:"fax";N;i:11;s:19:"82-86 Sycamore Road";s:8:"address1";s:19:"82-86 Sycamore Road";i:12;N;s:8:"address2";N;i:13;N;s:4:"town";N;i:14;s:8:"Amersham";s:4:"city";s:8:"Amersham";i:15;s:15:"Buckinghamshire";s:6:"county";s:15:"Buckinghamshire";i:16;N;s:7:"country";N;i:17;s:7:"HP6 5DR";s:8:"postcode";s:7:"HP6 5DR";i:18;N;s:9:"direction";N;i:19;s:0:"";s:7:"web_url";s:0:"";i:20;s:6:"51.677";s:3:"lat";s:6:"51.677";i:21;s:6:"-0.606";s:3:"lng";s:6:"-0.606";}i:1;a:44:{i:0;s:1:"2";s:2:"id";s:1:"2";i:1;s:19:"2014-06-30 13:21:33";s:7:"updated";s:19:"2014-06-30 13:21:33";i:2;s:1:"0";s:6:"active";s:1:"0";i:3;s:1:"1";s:10:"store_code";s:1:"1";i:4;s:7:"AAA1787";s:11:"branch_code";s:7:"AAA1787";i:5;s:9:"Amersham2";s:11:"branch_name";s:9:"Amersham2";i:6;s:9:"Amersham2";s:11:"unique_name";s:9:"Amersham2";i:7;s:26:"114@store.robertdyas.co.uk";s:6:"email1";s:26:"114@store.robertdyas.co.uk";i:8;s:11:"02031292066";s:10:"telephone1";s:11:"02031292066";i:9;N;s:10:"telephone2";N;i:10;N;s:3:"fax";N;i:11;s:19:"82-86 Sycamore Road";s:8:"address1";s:19:"82-86 Sycamore Road";i:12;N;s:8:"address2";N;i:13;N;s:4:"town";N;i:14;s:8:"Amersham";s:4:"city";s:8:"Amersham";i:15;s:15:"Buckinghamshire";s:6:"county";s:15:"Buckinghamshire";i:16;N;s:7:"country";N;i:17;s:7:"HP6 5DR";s:8:"postcode";s:7:"HP6 5DR";i:18;N;s:9:"direction";N;i:19;s:0:"";s:7:"web_url";s:0:"";i:20;s:9:"51.679792";s:3:"lat";s:9:"51.679792";i:21;s:9:"-0.602283";s:3:"lng";s:9:"-0.602283";}i:2;a:44:{i:0;s:1:"3";s:2:"id";s:1:"3";i:1;s:19:"2014-06-30 13:21:55";s:7:"updated";s:19:"2014-06-30 13:21:55";i:2;s:1:"0";s:6:"active";s:1:"0";i:3;s:1:"1";s:10:"store_code";s:1:"1";i:4;s:7:"AAA1788";s:11:"branch_code";s:7:"AAA1788";i:5;s:8:"Amersham";s:11:"branch_name";s:8:"Amersham";i:6;s:9:"Amersham3";s:11:"unique_name";s:9:"Amersham3";i:7;s:26:"114@store.robertdyas.co.uk";s:6:"email1";s:26:"114@store.robertdyas.co.uk";i:8;s:11:"02031292066";s:10:"telephone1";s:11:"02031292066";i:9;N;s:10:"telephone2";N;i:10;N;s:3:"fax";N;i:11;s:19:"82-86 Sycamore Road";s:8:"address1";s:19:"82-86 Sycamore Road";i:12;N;s:8:"address2";N;i:13;N;s:4:"town";N;i:14;s:8:"Amersham";s:4:"city";s:8:"Amersham";i:15;s:15:"Buckinghamshire";s:6:"county";s:15:"Buckinghamshire";i:16;N;s:7:"country";N;i:17;s:7:"HP6 5DR";s:8:"postcode";s:7:"HP6 5DR";i:18;N;s:9:"direction";N;i:19;s:0:"";s:7:"web_url";s:0:"";i:20;s:9:"51.678036";s:3:"lat";s:9:"51.678036";i:21;s:9:"-0.612947";s:3:"lng";s:9:"-0.612947";}i:3;a:44:{i:0;s:1:"4";s:2:"id";s:1:"4";i:1;s:19:"2014-07-01 16:43:35";s:7:"updated";s:19:"2014-07-01 16:43:35";i:2;s:1:"0";s:6:"active";s:1:"0";i:3;s:1:"1";s:10:"store_code";s:1:"1";i:4;s:7:"AAA1789";s:11:"branch_code";s:7:"AAA1789";i:5;s:9:"Amersham2";s:11:"branch_name";s:9:"Amersham2";i:6;s:9:"Amersham4";s:11:"unique_name";s:9:"Amersham4";i:7;s:26:"114@store.robertdyas.co.uk";s:6:"email1";s:26:"114@store.robertdyas.co.uk";i:8;s:11:"02031292066";s:10:"telephone1";s:11:"02031292066";i:9;N;s:10:"telephone2";N;i:10;N;s:3:"fax";N;i:11;s:19:"82-86 Sycamore Road";s:8:"address1";s:19:"82-86 Sycamore Road";i:12;N;s:8:"address2";N;i:13;N;s:4:"town";N;i:14;s:8:"Amersham";s:4:"city";s:8:"Amersham";i:15;s:15:"Buckinghamshire";s:6:"county";s:15:"Buckinghamshire";i:16;N;s:7:"country";N;i:17;s:7:"HP6 5DR";s:8:"postcode";s:7:"HP6 5DR";i:18;N;s:9:"direction";N;i:19;s:0:"";s:7:"web_url";s:0:"";i:20;s:9:"51.668036";s:3:"lat";s:9:"51.668036";i:21;s:9:"-0.622947";s:3:"lng";s:9:"-0.622947";}}');

?>

<script>
    <?
       foreach ( $res as $row){ $name = $row['unique_name'] ?>
    var <?=$name?> = new google.maps.LatLng(<?=$row['lat']?>, <?=$row['lng']?>);
    var <?=$name?> = new google.maps.Marker({
        position:<?=$name?>,
    });
<?}?>
    function initialize()
    {

        var mapCenter = new google.maps.LatLng(53.089362, -4.852386);
        var infowindow = null;

        var mapProp = {
            center:mapCenter,
            zoom:6,
            mapTypeId:google.maps.MapTypeId.ROADMAP
        };

        var map=new google.maps.Map(document.getElementById("googleMap")
            ,mapProp);

        <?
         foreach ( $res as $row){ $name = $row['unique_name'] ?>
        google.maps.event.addListener(<?=$name?>,'click',function() {
            map.setZoom(15);
            map.setCenter(<?=$name?>.getPosition());
            if (infowindow) {
                infowindow.close();
            }
            infowindow = new google.maps.InfoWindow();
            infowindow.setContent('<img src="http://www.retail-week.com/pictures/636xAny/8/6/4/1259864_Ryman_2.jpg" width="300px"/> <br />this store is ' + '<?=$name?>');
            infowindow.open(map,<?=$name?>);
        });
        <?=$name?>.setMap(map);
        <?}?>
    }

    function showMarker(marker){
        var gMarker = marker;
        var center = marker;

        google.maps.event.trigger(gMarker, 'click', {
            latLng: center
        });
    }
    google.maps.event.addDomListener(window, 'load', initialize);


</script>


<?
foreach ( $res as $row){ $name = $row['unique_name']?>
<?=$name?> <button type="button" onclick="showMarker(<?=$name?>)">Show On Map</button> <br>
<?}?>



<div id="googleMap" style="width:100%;height:800px;"></div>
</body>
</html>
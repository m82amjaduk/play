<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 16/09/2015
 * Time: 12:28
 */ ?>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css" type="text/css" media="all" rel="stylesheet">
<script>
    .ui-timepicker-div .ui-widget-header { margin-bottom: 8px; }
    .ui-timepicker-div dl { text-align: left; }
    .ui-timepicker-div dl dt { float: left; clear:left; padding: 0 0 0 5px; }
    .ui-timepicker-div dl dd { margin: 0 10px 10px 40%; }
    .ui-timepicker-div td { font-size: 90%; }
    .ui-tpicker-grid-label { background: none; border: none; margin: 0; padding: 0; }
    .ui-timepicker-div .ui_tpicker_unit_hide{ display: none; }

    .ui-timepicker-rtl{ direction: rtl; }
    .ui-timepicker-rtl dl { text-align: right; padding: 0 5px 0 0; }
    .ui-timepicker-rtl dl dt{ float: right; clear: right; }
    .ui-timepicker-rtl dl dd { margin: 0 40% 10px 10px; }

    /* Shortened version style */
    .ui-timepicker-div.ui-timepicker-oneLine { padding-right: 2px; }
    .ui-timepicker-div.ui-timepicker-oneLine .ui_tpicker_time,
    .ui-timepicker-div.ui-timepicker-oneLine dt { display: none; }
    .ui-timepicker-div.ui-timepicker-oneLine .ui_tpicker_time_label { display: block; padding-top: 2px; }
    .ui-timepicker-div.ui-timepicker-oneLine dl { text-align: right; }
    .ui-timepicker-div.ui-timepicker-oneLine dl dd,
    .ui-timepicker-div.ui-timepicker-oneLine dl dd > div { display:inline-block; margin:0; }
    .ui-timepicker-div.ui-timepicker-oneLine dl dd.ui_tpicker_minute:before,
    .ui-timepicker-div.ui-timepicker-oneLine dl dd.ui_tpicker_second:before { content:':'; display:inline-block; }
    .ui-timepicker-div.ui-timepicker-oneLine dl dd.ui_tpicker_millisec:before,
    .ui-timepicker-div.ui-timepicker-oneLine dl dd.ui_tpicker_microsec:before { content:'.'; display:inline-block; }
    .ui-timepicker-div.ui-timepicker-oneLine .ui_tpicker_unit_hide,
    .ui-timepicker-div.ui-timepicker-oneLine .ui_tpicker_unit_hide:before{ display: none; }
</script>
<div>

    <input type="text" value="21 Aug 2014 09:16" id="range_example_2_start" name="range_example_2_start" class="hasDatepicker">
    <input type="text" value="21 Aug 2014 10:16" id="range_example_2_end" name="range_example_2_end" class="hasDatepicker">
</div>

<script>
    var startDateTextBox = $('#range_example_2_start');
    var endDateTextBox = $('#range_example_2_end');

    $.timepicker.datetimeRange(
        startDateTextBox,
        endDateTextBox,
        {
            minInterval: (1000*60*60), // 1hr
            dateFormat: 'dd M yy',
            timeFormat: 'HH:mm',
            start: {}, // start picker options
            end: {} // end picker options
        }
    );
</script>
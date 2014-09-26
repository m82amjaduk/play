<?php
/**
 * Created by PhpStorm.
 * User: amojumder
 * Date: 26/09/2014
 * Time: 09:37
 * URL :: http://play.lc/jQueryRadio/
 * Source : http://stackoverflow.com/questions/12542988/check-uncheck-yes-no-radio-button-programmatically-jquery-mobile
 */ ?>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<?
$receiving = 'collection';
$checkedCollection = ($receiving == 'collection') ? 'checked' : NULL;
$checkedDelivery = ($receiving == 'delivery') ? 'checked' : NULL;
?>
        <label>yes / no ? </label>
        <fieldset data-role="controlgroup" data-type="horizontal">
            <input data-mini="true" type="radio" name="receiving" class="receivingClass" value="collection"  <?=$checkedCollection?> />
            <label for="collection">YES</label>
            <input data-mini="true"  type="radio" name="receiving" class="receivingClass" value="delivery"  <?=$checkedDelivery?> />
            <label for="delivery">NO</label>
        </fieldset>


<script>
    $(".receivingClass").click(function(){
        $(".fakeRadio").prop( "checked", false );
        $(this).prop( "checked", true );
        var receiving = $(this).attr("value")
        alert(receiving);
    });
</script>
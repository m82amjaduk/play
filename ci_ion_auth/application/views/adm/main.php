<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 09/09/2014
 * Time: 15:10
 */
//echo '<pre>'; print_r($table);
?>

<form action="somescript.php" />

<? foreach ($table as $row){
    $name = $row->name;
    $input =array( 'varchar', 'int',  'smallint', 'timestamp' );
    if(in_array($row->type, $input) ){
        echo getInput($row, $data->$name);
    }

    if($row->type == 'tinyint' && ($row->max_length == 4 || $row->max_length == 1) ){
        echo getEnable($row, $data->$name);
    }
    if($row->type == 'text' ){
        echo getTextarea($row, $data->$name);
    }

}?>
<div><input type="image" name="submitimage" src="someimage.gif" /></div>
</form>

<?
function getInput($row, $value){
    return "<div>$row->name<input type='text' name='$row->name'' value='$value' /></div>";
}
function getEnable($row, $value){
    $checkedYes = ($value == 1 )    ? "checked='checked'" : NULL;
    $checkedNo  = ($value != 1 )    ? "checked='checked'" : NULL;
    return "<div> $row->name <input type='radio' name='$row->name' value='yes' $checkedYes /> yes <input type='radio' name='$row->name' value='no' $checkedNo /> no </div>";
}
function getTextarea($row, $value){
    return "<div>$row->name  <br /><textarea name='textarea' rows='10' cols='50'>$value</textarea></div>";
}
?>

<!--(-->
<!--[name] => id-->
<!--[type] => int-->
<!--[default] =>-->
<!--[max_length] => 11-->
<!--[primary_key] => 1-->
<!--)-->

<!--[name] => active-->
<!--[type] => tinyint-->
<!--[default] => 0-->
<!--[max_length] => 4-->
<!--[primary_key] => 0-->

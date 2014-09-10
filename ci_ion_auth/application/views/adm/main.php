<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 09/09/2014
 * Time: 15:10
 */
//echo '<pre>'; print_r($schema);
//echo '<pre>'; print_r($data);

if(empty($data))
    die('No Valid Data Found');
?>

<form action='http://learning7.lc/ci_ion_auth/index.php/<?=$process?>' />

<?
unset($schema[0], $schema[1], $schema[2]);
echo "last Updated:: $data->updated <br /> ID:: $data->id";
foreach ($schema as $row){
    $name = $row->name;
    $input =array( 'varchar', 'smallint', 'int', 'timestamp' );

    if(in_array($row->type, $input) ){
        echo getInput($name, $data->$name);
    }

    if($row->type == 'tinyint' && ($row->max_length == 4 || $row->max_length == 1) ){
        echo getEnable($name, $data->$name);
    }else if($row->type == 'tinyint' && ($row->max_length != 4 || $row->max_length != 1) ){
        echo getInput($name, $data->$name);
    }
    if($row->type == 'text' ){
        echo getTextarea($name, $data->$name);
    }
    $allType = $input;
    $allType[] = 'text';
    $allType[] = 'tinyint';

//echo '<pre>'; print_r($allType);

    if(!in_array($row->type, $allType) ){
        echo $row->type;
        echo getInput($name, $data->$name);
    }


}?>
<div><input type="image" name="submitimage" src="someimage.gif" /></div>
</form>

<?
function getInput($name, $value){
    return "<div>$name<input type='text' name='$name'' value='$value' /></div>";
}
function getEnable($name, $value){
    $checkedYes = ($value == 1 )    ? "checked='checked'" : NULL;
    $checkedNo  = ($value != 1 )    ? "checked='checked'" : NULL;
    return "<div> $name <input type='radio' name='$name' value='1' $checkedYes /> yes <input type='radio' name='$name' value='0' $checkedNo /> no </div>";
}
function getTextarea($name, $value){
    return "<div>$name <br /><textarea name='$name' rows='10' cols='50'>$value</textarea></div>";
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

<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 23/04/14
 * Time: 17:21
 */
?>
<style>
    .back{
        background : #<?=mt_rand(1,999999)?>;
        width: <?=mt_rand(100,500)?>px;
        color: #fff;
    }
</style>
<div class="back">
<?
usleep(900000);
    echo(mt_rand() . "<br>");
    echo(mt_rand() . "<br>");
    echo(mt_rand(10,100));
?>
</div>
<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 16/09/2015
 * Time: 10:21
 */


$string = "<br>kk23?! fdgfd* wrw343242~#fgdgfd&23432 !'4545)))(((&&¬¬¬``)))";
$string = preg_replace('/[^A-Za-z0-9 \?!]/', '', $string);
echo $string ;
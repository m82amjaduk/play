<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 16/07/14
 * Time: 11:41
 */

$content = "
<page>
    <h1>Exemple d'utilisation</h1>
    <br>
    Ceci est un <b>exemple d'utilisation</b>
    de <a href='http://html2pdf.fr/'>HTML2PDF</a>.<br>
</page>";

echo $content;
require_once('html2pdf.class.php');
$html2pdf = new HTML2PDF('P','A4','fr');
$html2pdf->WriteHTML($content);
$html2pdf->Output('exemple.pdf');
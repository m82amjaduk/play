<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 24/06/14
 * Time: 19:19
 */?>

<form action="/import/upload_process" method="post" accept-charset="utf-8" enctype="multipart/form-data"> <div class="form_title">File Type: </div>
    <select name="table" class="form_select">
        <option value="prod_list">prod_list</option>
        <option value="prod_category">prod_category</option>
        <option value="prod_meats">prod_meats</option>
        <option value="prod_meat_price">prod_meat_price</option>
        <option value="cms_article">cms_article</option>
        <option value="cms_highlights">cms_highlights</option>
        <option value="services_opening_hours">services_opening_hours</option>
        <option value="settings_business">settings_business</option>
        <option value="page_contact">page_contact</option>
    </select>
    <input type="file" name="userfile" size="200">
    <br><br>
    <input type="submit" value="upload">
</form>


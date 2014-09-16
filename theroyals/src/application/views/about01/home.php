
<?
$mod = $this->aboutm->process_highlights ($highlights, array('mid_text',  'special')  );
//echo '<pre>';print_r($mod); exit;
$special = $mod['special'];
$mid_text = $mod['mid_text'][0];
?>
<!-- MAIN -->
<div id="main" class="cf">

    <!-- SLIDER -->
    <div class="slider-wrapper">
        <div id="slider" class="nivoSlider">
            <? foreach ($slides as $img) {?>
                <img src="<?=base_url().$img?>" alt="<?=$img?>"  width="100%"/>
            <?}?>
        </div>
    </div>
    <!-- ENDS SLIDER -->

    <!-- tagline -->
    <div class="tagline"> <?=$mid_text->title?> </div>
    <!-- ENDS tagline -->

    <!-- featured -->
    <ul class="feature cf">
        <? foreach ($special as $row){?>
        <li>
            <? if ($this->cm-> empty_define($row->image_src)){?>
            <a href="<?=$this->cm->url_build($row->image_href)?>" class="thumb" >
                <img src="<?=$row->image_src?>" alt="Thumbnail" />
                <div class="img-overlay">READ MORE</div>
            </a><?}?>

            <? if ($this->cm-> empty_define($row->title)){?>
            <a href="<?=$this->cm->url_build($row->button_href)?>"  class="title"><?=$row->title?></a> <?}?>
<!--            <div class="categories"><a href="#" >webdesign, </a><a href="#" >print, </a><a href="#" >photo</a></div>-->

            <? if ($this->cm-> empty_define($row->body)){?>
            <div  class="excerpt"><?=$row->body?></div> <?}?>

            <? if ($this->cm-> empty_define($row->button)){?>
            <a href="<?=$this->cm->url_build($row->button_href)?>" class="action-button" ><?=$row->button?></a> <?}?>
        </li>
        <?}?>
    </ul>
    <!-- ENDS featured -->

    <!-- Section Removed here 'one-third-col' -->

</div>
<!-- ENDS MAIN -->
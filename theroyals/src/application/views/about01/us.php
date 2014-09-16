<?
$modules_new = $this->aboutm->process_highlights ($highlights_us, array('side') );
$side = $modules_new['side'];
?>

<div id="main" class="cf">

    <!-- posts list -->
    <div id="posts-list" class="cf">

        <article class="cf">
            <div class="feature-image">
                <a href="<?=$article->image_href?>"><img src="<?=$article->image_src?>" alt="Thumbnail" width="100%"></a>
            </div>
            <div class="entry-title">
                <div class="meta">Updated : <?=date('dS M Y; H:m ', strtotime($article->updated))?></div>
                <a href="<?=$article->image_href?>" class="post-heading"><?=$article->title?></a>
            </div>
            <div class="excerpt"> <?=$article->body?></div>
            <a href="<?=$article->button_href?>" class="action-button"><?=$article->button?></a>
        </article>
    </div>
    <? require_once "aside.php"?>

</div>
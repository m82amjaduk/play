<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 20/04/14
 * Time: 17:07
 */

$welcome = ($this->session->userdata('lname')) ? ' !! '.$this->session->userdata('fname').' '.$this->session->userdata('lname') : ' to '.$business->business_name;

?>
<div class="content">
    <div class="pageTitle box">
        Takeaway Menu :: <?=$category->title?>
    </div>
    <div class="contentMain">
        <div class="productsLists">
            <? if ($category->description){?>  <div class="categoryDescription box"> <?=$category->description?> </div> <?}?>
            <? $i =1;
            foreach ($products as $row){ $prod_id = ltrim($row->id, 0); ?>
            <div class='prod box'>
                <form action='<?= site_url('takeaway/add_in_bag') ?>' method='GET' >
                    <div class="prodTitle">
                        <a href="#" title='Click To View Details' class='prodTitleName'><?= "$row->prod_code. $row->title" ?></a>
                        <div class="prodPrice">
                            <? $meats =  $row->meats;
                            if ($meats){?>
                                <select name="meat" class="selectMeat">
                                    <? foreach($meats as $row_m){
                                        $meat_details = "$row_m->price_id~$row_m->price~$row_m->meats_title";
                                        $meats_list = $row_m->meats_title.' '.$this->cm->money($row_m->price, 2);
                                        ?>
                                        <option value="<?=$meat_details?>"  > <?=$meats_list?> </option> <?}?>
                                </select> <?}else {?>
                                &pound<?=$row->price ?>
                            <?}?>
                        </div>
                    </div>
                    <div class="clearBoth"></div>
                    <?if($row->description){?>
                    <div class="prodDesc"><?=$row->description?></div> <?}?>
                    <div class='addNote'>Add Special Request</div>
                    <div class='note'>
                        <textarea name='note' placeholder="Please write here"></textarea>
                        <input type='hidden' name='product_id' value='<?php echo $prod_id; ?>' />
                        <input type='hidden' name='sn' value='<?php echo $row->sn; ?>' />
                        <input type='hidden' name='title' value='<?php echo $row->title; ?>' />
                        <input type='hidden' name='price' value='<?php echo $row->price; ?>' />
                    </div>
                    <input type='submit' class="addToCartButton" prod_id="<?=$prod_id?>" value='ADD TO BAG'  id="cj_p<?=$i++?>" />
                </form>
            </div>
            <?}?>
            </div>
        </div>


<!--  Right   -->
    <div class="right">
<!--        User Info-->
        <div class="box userWelcome"> Welcome <?=$welcome?> </div>

        <? if($cart){  ?>
        <div class="userInfo box">
            <a href="<?=site_url()?>takeaway/order_details">
                <input type='submit'  class="checkoutButton" id="cj_checkout" value='CHECKOUT' />
            </a>
            <a href="<?=site_url()?>takeaway/empty_my_bag"> Empty My Bag</a> <br />
            My Bag Total : £<?=$totalPrice?> <br />
                <div id="hideMyFoods"> Hide My Foods </div>
                <div id="showMyFoods"> Show My Foods </div>
        </div>
<!--        Cart  -->
        <div class="cart myFoods box">
            <? require_once  "cart.php"?>
        </div>
        <?}?>


<!--        Categories  -->
        <ul class="vertical-list box">
            <? $i = 1;
            foreach($categories as $row){
                $id = ltrim($row->id, 0);
                $curr = ($row->id == $category) ? " current" : ''; ?>
                <li>
                    <a href='<?=base_url()."takeaway/menu/$id"?>' class='button <?=$curr?>  pleaseWait' id="cj_c<?=$i++?>" >
                        <?=$row->title ?></a></li>
            <?}?>
            </ul>

<!--        Popular Dishes -->
        <? if($this->ion_auth->is_admin()) {?>
        <div class="popularDishes box">
            <a href="<?=base_url()?>dc"> Delete ALL Cache </a> <br />
            <a href="<?=base_url()?>migration/copy_images"> Copy Images </a> <br />
            <a href="<?=base_url()?>migration/delete_images"> Delete Images </a> <br />
            <a href="<?=base_url()?>takeaway/deleteCache"> Delete Cache </a> <br />
            <a href="<?=base_url()?>takeaway/deleteDBCache"> Delete DB Cache </a> <br />
            <a href="<?=base_url()?>aud">  All User Data </a> <br />
            <a href="<?=base_url()?>takeaway/deleteUserData">  Delete User Data </a> <br />
            <a href="<?=base_url()?>takeaway/sess_destroy"> Destroy Session </a> <br />
            <a href="<?=base_url()?>migration/index"> Migrate DB </a> <br />
            <a href="<?=base_url()?>takeaway/sms"> SMS Gateaway </a> <br />
            <a href="<?=base_url()?>auth/logout">  Logout </a> <br />
        </div> <?}?>
    </div>
    <?=$cb?>
</div>
<script>function reset () {
        $("#toggleCSS").attr("href", "<?=$menuCSS?>alertify.default.css");
        alertify.set({
            labels : {
                ok     : "OK",
                cancel : "Cancel"
            },
            delay : 5000,
            buttonReverse : false,
            buttonFocus   : "ok"
        });
    }

    // ==============================
<? if(empty($cart)) {?>
    $("#cj_checkout").click(function() {
        reset ();
        alertify.alert("Your Cart Is Empty <br /> Please Add Some Food ");
        return false;
    }); <?}else{?>
    $("#cj_checkout").click(function() {
        reset ();
        $("#wait").css("display","block");
    }); <?}?>

    $(".addNote").click(function() {
        $(this).siblings(".note").show();
        $(this).hide();
    });
    $("#hideMyFoods").click(function() {
        $(".myFoods").hide( "slow");
        $('#showMyFoods').show();
        $("#hideMyFoods").hide();
    });
    $("#showMyFoods").click(function() {
        $(".myFoods").show( "slow");
        $('#hideMyFoods').show();
        $("#showMyFoods").hide();
    });
</script>
<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 22/04/14
 * Time: 00:56
 */
?>
<style>
    #orderDetailsPage {
        font-size: 13px;
    }
    /*Login Form */
    .userLogin {
        float: right;
        width: 445px;
        margin: 0 10px 0 0;
    }
    .userLoginForm {
    }
    .userReg {
    }

    /*user Information Form*/
    .orderInfo{
        float: left;
        width: 445px;
        margin: 0  0 0 10px;
    }
    #orderDetailsPage input {
        width: 350px;
    }
    #orderDetailsPage textarea{
        width: 350px;
        height: 100px;
    }
    #orderDetailsPage .selectWrap{
        width: 370px;
        height: 45px;
    }
    #orderDetailsPage input[type="submit"]{
        width: 150px;
        margin: 15px 75px 10px 0;
        float: right;
    }
    #register input[type="submit"]{
        width: 150px;
        margin: -60px 255px 10px 0;
        float: right;
        background:#000;
        color:#aaa;
        border: 1px solid #000;
    }
    select {
        width: 370px;
        height: 30px;
    }
    .receiptBox {padding:1.5em;margin-bottom:1.5em;background:#e5eCf9;width:300px;}
    .payment {
        padding: 20px 10px;
        margin: 10px 0 20px 0;
    }
    .Completed{
        background-color: #b3ff2d;
    }
    .Pending{
        background-color: #ff1f40;
    }
</style>
<div class="content">
    <div id="orderDetailsPage">
        <div class="pageTitle box">
            Order :: <?=$order->order_code?>
            <div id="option_cont">   </div>
        </div>

        <div class="orderInfo">
            <? $transactionInfo = $this->session->userdata('transactionInfo');
            if(!empty($transactionInfo['transactionID']) ){?>
            <div class=" payment <?=$transactionInfo['transactionStatus']?>"> <?
                echo '<b>Transaction ID : ' .$transactionInfo['transactionID'].' </b><br /><br />' ;
                echo $transactionInfo['transactionMessage'] ;
           ?> </div> <?}?>
            <div class="receiptBox">
                <?= $receipt ?>
            </div>
        </div> <!-- End of orderInfo div -->


        <div class="userLogin">
             <img src="http://joybalti.com/s/cc_images/cache_2420067660.jpg?t=1308663022">
        </div> <!-- End of userLogin div -->
        <?=$cb?>
    </div> <!-- End of userDetails div -->
</div> <!-- End of content div -->

<? $this->session->unset_userdata('transactionInfo')?>


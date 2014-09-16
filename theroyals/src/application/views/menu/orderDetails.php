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

</style>

<div class="content">
    <div id="orderDetailsPage">
        <div class="pageTitle box">
            Please Enter Your Information...
            <div id="option_cont">     </div>
        </div>
        <div class="orderInfo">
            <form class="box"   action='<?= site_url('takeaway/user_details') ?>' method='GET'  name="cj_orderDetails" >
                <div class="selectWrap">
                    Payment Mathod :
                    <select name="payMethod" id="payMethod">
                        <? foreach ($pay_option as $key => $pay) {?>
                        <option value="<?=$key?>"><?=$pay?></option> <?}?>
                    </select>
                </div>
                <label>
                    <span>Discount Code :</span><input id="discount" type="text" name="discount" value="<?=$this->session->userdata('discount')?>"/>
                </label>

                <div class="selectWrap">
                    Delivery / Collection:
                    <select name="receiving" id="collectionDelivery">
                        <? $receiving = $this->session->userdata('receiving');
                        if ($receiving){ ?>
                            <option value="<?=$receiving?>"><?=ucwords($receiving)?></option>
                        <? } else {?>
                            <option value="collection">Collection</option>
                        <?}?>
                        <option value="delivery">Delivery</option>
                        <option value="collection">Collection</option>
                    </select>
                </div>
                <div class="selectWrap">
                    Day:
                    <select name="day" id="day" >
                        <div id="days_options">
                            <?=$openDaysList?>
                        </div>
                    </select>
                </div>

                <div class="selectWrap">
                    Time:
                    <select name="time" id="time" >
                        <?=$requestTimeList?>
                    </select>
                </div>

                <input id="discount" type="hidden" name="orderDetailsPage" value="1"/>

                <label>
                    <span>Order Note : </span><br/>
                    <textarea name="orderNote" id="orderNote"><?=$this->session->userdata('orderNote')?></textarea>
                    <input type="submit" value="Next" id="cj_next"/>
                </label>
                <?=$cb?>
            </form>
        </div> <!-- End of orderInfo div -->


        <div class="userLogin">
            <img src="http://joybalti.com/s/cc_images/cache_2420067660.jpg?t=1308663022">
<!--            <form class="box">
                <div>
                    <h1>Login Here :</h1>

                    <label>
                        <span>Email</span><input id="email" type="text" name="email"/>
                    </label>

                    <label>
                        <span>Password</span><input id="email" type="password" name="password"/>
                    </label>

                    <label>
                        <input type="submit" value="Login"/>
                    </label>

                    <label  id="register">
                        <input type="submit" value="Register"/>
                    </label>
                </div>
                <?/*=$cb*/?>
            </form>
            <div class="userReg box">
                Do not have login details yet!! <br/>
                Why not sign up now??
            </div>-->
        </div> <!-- End of userLogin div -->
        <?=$cb?>
    </div> <!-- End of userDetails div -->
</div> <!-- End of content div -->


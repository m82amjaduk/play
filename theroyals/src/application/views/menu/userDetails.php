<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 22/04/14
 * Time: 00:56
 */
?>
<style>
    #userDetailsPage {
        font-size: 13px;
    }
    /*Login Form */
    .cartEdit {
        float: right;
        width: 445px;
        margin: 0 10px 0 0;
    }
    .userLoginForm {
    }
    .userReg {
    }

    /*user Information Form*/
    .userInfo {
        float: left;
        width: 445px;
        margin: 0  0 0 10px;
    }
    #userDetailsPage input {
        width: 350px;
    }
    #userDetailsPage textarea{
        width: 350px;
        height: 100px;
    }
    #userDetailsPage input[type="submit"]{
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
</style>

<div class="content">
    <div id="userDetailsPage">
        <div class="pageTitle box">
            Please Enter Your Information...
            <div id="option_cont">     </div>
        </div>
        <div class="userInfo ">
            <form class="box"  action='<?= site_url('takeaway/confirm') ?>' method='GET' name="cj_userDetails">
                <div>
                    <div class="personalDetails">
                        <h1>Personal Details :</h1>
                        <label>
                            <span>Email Address *</span>
                            <input id="email" type="text" name="email" value="<?=$this->session->userdata('email')?>"/>
                        </label>
                        <label>
                            <span>First name *</span>
                            <input id="fname" type="text" name="fname"  value="<?=$this->session->userdata('fname')?>"/>
                        </label>
                        <label>
                            <span>Last name *</span>
                            <input id="lname" type="text" name="lname"  value="<?=$this->session->userdata('lname')?>"/>
                        </label>
                        <label>
                            <span>Phone *</span>
                            <input id="phone" type="text" name="phone"  value="<?=$this->session->userdata('phone')?>"/>
                        </label>
                    </div>

                    <br /><br />
                    <div class="personalDetails">
                        <h1>Delivery Address :</h1>
                        <h4>Optional for collection </h4>
                        <label>
                            <span>House No</span>
                            <input id="houseNo" type="text" name="houseNo"  value="<?=$this->session->userdata('houseNo')?>"/>
                        </label>
                        <label>
                            <span>Post Code</span>
                            <input id="postcode" type="text" name="postcode"  value="<?=$this->session->userdata('postcode')?>" />
                        </label>
                        <label>
                            <span>Address Line 1</span>
                            <input id="address1" type="text" name="address1"  value="<?=$this->session->userdata('address1')?>" />
                        </label>
                        <label>
                            <span>Address Line 2</span>
                            <input id="address2" type="text" name="address2"  value="<?=$this->session->userdata('address2')?>" />
                        </label>
                        <label>
                            <span>Town</span>
                            <input id="town" type="text" name="town"  value="<?=$this->session->userdata('town')?>" />
                        </label>
                        <label>
                            <span>City</span>
                            <input id="city" type="text" name="city"  value="<?=$this->session->userdata('city')?>" />
                        </label>
                        <label>
                            <span>County</span>
                            <input id="county" type="text" name="county"  value="<?=$this->session->userdata('county')?>" />
                        </label>
                    </div>
                    <input id="discount" type="hidden" name="userDetailsPage" value="1"/>

                    <label>
                        <span>Message</span><br/>
                        <textarea id="addressInstruction" name="addressInstruction" placeholder="Instruction for Driver.."><?=$this->session->userdata('addressInstruction')?></textarea>
                        <input type="submit"  value="Submit Form"  id="cj_next"/>
                    </label>
                    <?=$cb?>
                </div>
            </form>
        </div> <!-- End of userInfo div -->


        <div class="cartEdit">
            <img src="http://joybalti.com/s/cc_images/cache_2420067660.jpg?t=1308663022">
<!--            <div class="cartItems box">
                Do not have login details yet!! <br/>
                Why not sign up now??
            </div>
            <div class="cartSummary box">
                Do not have login details yet!! <br/>
                Why not sign up now??
            </div>-->
        </div> <!-- End of userLogin div -->
        <?=$cb?>
    </div> <!-- End of userDetails div -->
</div> <!-- End of content div -->
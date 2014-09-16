<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 27/04/14
 * Time: 22:30
 */
?>
<style>
    #checkoutPage {
        font-size: 13px;
    }
    /*Login Form */
    .customerDetails {
        float: right;
        width: 430px;
        margin: 0 10px 0 0;
        font-size: 16px;
    }
    .userLoginForm {
    }
    .userReg {
    }

    /*user Information Form*/
    .itemsList {
        float: left;
        width: 430px;
        margin: 0  0 0 10px;
    }
    .confirmButton{
        width:100px;
        float: right;
        margin: 15px 15px 20px 0;
    }
    .infoRight{
        width: 40%;
    }
    .priceInfo{
        text-align: right;
    }

</style>
<div class="content">
    <div id="checkoutPage">
        <div class="pageTitle box">
            Please Check Your Order Details
        </div>
        <div class="itemsList box">
            <? require_once  "cart.php" ?>
            <br /><br /><br /><br /><br /><br />
            <? $basePayable =  $totalPrice + $this->session->userdata('transectionFee') +  $this->session->userdata('deliveryCharge');

            ?>
            <div class=" priceInfo box">
                Bag Total : <?=$this->cm->money($totalPrice, 2) ?><br />
                Delivery Charge : <?=$this->cm->money($this->session->userdata('deliveryCharge'), 2) ?><br />
                Transaction Fee : <?=$this->cm->money($this->session->userdata('transectionFee'), 2) ?><br />
                Base Payable : <?=$this->cm->money($this->session->userdata('basePayable'), 2) ?><br />
                Discount : <?=$this->cm->money($this->session->userdata('discountPrice'), 2) ?><br />
                <h1> Checkout Price : <?=$this->cm->money( $transactionInfo['checkoutPrice'], 2) ?></h1>
            </div>
        </div>
        <div class="customerDetails box">
            <table style="width:100%">
                <tr>
                    <th class="infoRight"> </th>
                    <th> </th>
                </tr>
                <tr> <td> <br /> </td> <td>  </td> </tr>
                <tr> <td> <b> Order Details : </b> </td> <td>  </td> </tr>
                <tr> <td> Payment Method : </td> <td> <b><?=ucwords($this->session->userdata('payMethod'))?> </b> </td> </tr>
                <tr> <td> Collection / Delivery : </td> <td> <b><?=ucwords($this->session->userdata('receiving'))?> </b> </td> </tr>
                <tr> <td> Ready Time : </td> <td> <?= HOURS::dayTimeView($this->session->userdata('day')+$this->session->userdata('time'))?>  </td> </tr>
                <tr> <td> Discount Code: </td> <td> <?=$this->session->userdata('discount')?>  </td> </tr>
                <tr> <td> Order Note : </td> <td> <?=$this->session->userdata('orderNote')?>  </td> </tr>
                <tr> <td> <br /> </td> <td>  </td> </tr>
                <tr> <td> <b> Customer Details : </b> </td> <td>  </td> </tr>

                <tr> <td>Email :</td> <td> <?=$this->session->userdata('email')?> </td> </tr>
                <tr> <td>Customer Name :</td> <td> <?=$this->session->userdata('fname'). ' ' . $this->session->userdata('lname')?>  </td> </tr>
                <tr> <td>Phone :</td> <td> <b> <?=$this->session->userdata('phone')?> </b> </td> </tr>
                <tr> <td>Address : </td>  <td> <?=$this->session->userdata('houseNo'). ' ' .$this->session->userdata('address1')?> </td> </tr>
                <tr> <td> </td>  <td> <?=$this->session->userdata('address2'). ' * ' .$this->session->userdata('town'). ' * ' .$this->session->userdata('city'). ' * ' .$this->session->userdata('county')?> </td> </tr>
                <tr> <td> </td> <td> <b><?=$this->session->userdata('postcode')?> </b> </td> </tr>
                <tr> <td> Address Note : </td> <td>  <?=$this->session->userdata('addressInstruction')?>   </td> </tr>
            </table>
        </div>
        <?=$cb?>
        <div >
            <?
            if ($this->session->userdata('payMethod') == 'paypal')
                $processUrl = 'paypal/process/1';
            if ($this->session->userdata('payMethod') == 'cash')
                $processUrl = 'takeaway/process_order';
            if ($this->session->userdata('payMethod') == 'card')
                $processUrl = 'paymentsense/process/1';
                ?>
<!--            <a href="--><?//=site_url()?><!--takeaway/process_order" class="pleaseWait">-->
            <a href="<?=site_url().$processUrl?>" class="pleaseWait">
                <input type='submit'  class="confirmButton" value='Next'   id="cj_next" />
            </a>
        </div>
        <?=$cb?>
    </div>
</div>
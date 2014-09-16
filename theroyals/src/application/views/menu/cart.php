<?php
/**
 * Created by PhpStorm.
 * User: amzad
 * Date: 29/04/14
 * Time: 08:02
 */
?>
<table  >
    <tr>
        <th width="20">QT</th>
        <th width="260">DETAILS</th>
        <th width="35" align="right">PRICE</th>
        <th width="10"></th>
        <th width="10"></th>
    </tr>
    <?
    //        $this->tools->pa($cart, 0);
    $id = 0;
    foreach ($cart as $row) {
        $meatPrint = ($row['meat']) ? $row['meat'][2] .'-' : ''; ?>
        <tr>
            <td> <?= $row['quantity'] ?>x</td>
            <td><b>  <?= $meatPrint.$row['title'] ."</b><br />". $row['note']?> </td>
            <td> £<?= $row['price']*$row['quantity'] ?> </td>
            <td>
                <a href="<?=base_url().'takeaway/update_quantity/add/'.$id?>">
                    <img class="add" row="<?=$id?>" quantity="<?=$row['quantity']?>" src="<?=$menuIMG?>structure/add.png" width='15'/>
                </a>
            </td>
            <td>
                <a href="<?=base_url().'takeaway/update_quantity/sub/'.$id ?>">
                    <img class="sub" row="<?=$id?>" quantity="<?=$row['quantity']?>" src="<?=$menuIMG?>structure/minus.png" width='15'/>
                </a>
            </td>
        </tr>
        <?
        // TODO Get description in one line
        $id ++ ;} ?>
</table>
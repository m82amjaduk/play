<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 25/06/2015
 * Time: 10:57
 */
$i = 0;
//$handle1 = fopen("Book1.CSV", "r");
//while($data1 = fgetcsv($handle1, 100, ","))
//{
//    $i++;
//    echo '<pre>'; print_r($data1);
////    fwrite($fp,"\n");
//    echo ">> ".$data1[9]. " << ++++++++++++++++++++++++++++++++++++++++ $i <br />";
//}

$file =  fopen("Book1.CSV", "r");
$i=0;
while(! feof($file)) {
    $row        = fgetcsv($file, 1024, ',');
    $Sku_Id     = str_replace(' ', '', $row[9]);
    $Update_Qty = (empty($row[6])) ? 0 : $row[6];
    $Update_Qty = $row[5].$Update_Qty;
//    $Dstamp     =  Mage::helper('deltastockcontrol')->MySqlTime("$row[7]") ;

    $csvName    =  basename(strtoupper($file), ".CSV");
//    $imported_at    = Mage::helper('deltastockcontrol')->MySqlTime('now');
    $csv_row            = $i++;

     if ($i%500 == 0) echo  "\n".$csv_row;
    echo $Update_Qty . "\n<br />";

}
/*
INSERT INTO deltastockcontrol_queue (imported_at, csv_name, csv_row, sku, transaction_time, qty_imported ) VALUES
('now','test', 3 'sku1', 'now', '+10'), ('now','test', 3 'sku1', 'now', '+10'), ('now','test', 3 'sku1', 'now', '+10')
ON DUPLICATE KEY UPDATE csv_name = VALUES(csv_name)


INSERT INTO t (t.a, t.b, t.c)
VALUES ('key1','key2','value'), ('key1','key3','value2')
ON DUPLICATE KEY UPDATE
t.c = VALUES(t.c)
*/
<?
$months = genMonthList(2014,  01 );

//echo
foreach ($months as $row){
    echo $row['y'].'/'.$row['m'].'<br>';
}

function genMonthList($startYear,  $startMonth){
    $yearNow    = date('Y');
    $monthNow   = date('m');
    $months     = array();
    while($yearNow >= $startYear && $monthNow >= $startMonth ) {
        $months[] = array('y' => $yearNow, 'm' => $monthNow );
        $monthNow --;
        if ($monthNow == 0 ){
            $monthNow = 12;
            $yearNow --;
        }
    }
    return $months;
}

/*
SELECT
    orders.id AS id,
    orders.active,
    orders.order_code,
    orders.order_id_temp,
    orders.user_code,
    orders.fname,
    orders.lname,
    orders.email,
    orders.phone,
    orders.postcode,
    orders.placed_at,
    orders.requested_at,
    orders.receiving,
    orders.pay_method,
    orders.checkout_price,
    orders.vip,
    orders.customer_group,
    order_status_fun(orders.order_code) AS status
FROM storelocator_branches
WHERE YEAR(updated) = 2015 AND MONTH(updated)=1
ORDER BY id ASC;
*/


?>
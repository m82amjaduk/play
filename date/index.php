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



?>
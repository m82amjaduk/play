<?


$data1 = array (
    'product_id'  => 1
    , 'prod_code'  => 1
    , 'title'  => '*Onion Bhaji'
    , 'price'  => 2.75
    , 'quantity'  => 1
    , 'note'  => 'TEst1 note'
);


$data2 = array (
    'product_id'  =>2
    , 'prod_code'  => 1
    , 'title'  => 'Onion Bhaji'
    , 'price'  => 2.75
    , 'quantity'  => 1
    , 'note'  => 'TEst2 note'
);

$data3 = array (
    'product_id'  => 3
    , 'prod_code'  => 1
    , 'title'  => 'Onion Bhaji'
    , 'price'  => 2.75
    , 'quantity'  => 1
    , 'note'  => 'TEst3 notes'
);
$data4 = array (
    'product_id'  => 4
    , 'prod_code'  => 1
    , 'title'  => 'Onion Bhaji'
    , 'price'  => 2.75
    , 'quantity'  => 1
    , 'note'  => 'TEst3 notes'
);



































/*
 * 1.
 */


$data = array ($data1,$data2,$data2,$data3,$data3,$data3,$data4,$data4,$data1);

$collection = NULL;
foreach ($data as $row){
    $collection = addUpdateItem($row, $collection);
}


function addUpdateItem($array, $collection){
    $addItem = true;
    foreach($collection as  $key => $row){
        if(($array['product_id'] == $row['product_id']) && compareArrayRemovingAKey($array, $row, 'quantity')){
            $row['quantity'] += 1;
            $collection[$key]  = $row;
            $addItem = false;
        }
    }
    if($addItem){
        $collection[]  = $array;
    }
    return $collection;
}


/*
 *  Return true is both array are identical
 *  $array1             First array
 *  $array2             Second array
 *  $keyRemove          Key to remove before compare
 *  $this->compareArrayRemovingAKey($array1, $array2, 'quantity');
 */
function compareArrayRemovingAKey($array1, $array2, $keyRemove){
    unset($array1[$keyRemove]);
    unset($array2[$keyRemove]);
    return  (! array_diff($array1, $array2) ) ?  true : false;
}



echo '<pre> data'; print_r($data);
echo '<pre> collection'; print_r($collection);

//var_dump($data2 == $data3);






























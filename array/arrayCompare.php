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


$data = array ($data1,$data2,$data2,$data3,$data3,$data3,$data3,$data3,$data4,$data4,$data1);

$collection = array();

foreach ($data as $row){
    $collection = addUpdateItem($row, $collection);
}
orderBy($collection, 'quantity');

/*add or update and items to items array */
function addUpdateItem($array, $collection){
    $addItem = true;
    foreach($collection as  $key => $row){
        if(($array['product_id'] == $row['product_id']) && compareArrayRemovingKeys($array, $row, array('quantity', 'price'))){
            $row['quantity'] += 1;
            $row['price'] += $array['price'];
            $collection[$key]  = $row;
            $addItem = false;
        }
    }
    if($addItem){
        $collection[]  = $array;
    }
    return $collection;
}

/* Order an array by its key value */
function orderBy(&$data, $field)
{
    $code = "return strnatcmp(\$a['$field'], \$b['$field']);";
    usort($data, create_function('$a,$b', $code));
}

/*
 *  Return true is both array are identical
 *  $array1             First array
 *  $array2             Second array
 *  $keyRemove          Keys to remove in array before compare
 *  $this->compareArrayRemovingAKey($array1, $array2, array('quantity', 'price'));
 */
function compareArrayRemovingKeys($array1, $array2, $keys){
    foreach($keys as $key){
        unset($array1[$key]);
        unset($array2[$key]);
    }
    return  (! array_diff($array1, $array2) ) ?  true : false;
}



echo '<pre> data'; print_r($data);
echo '<pre> collection'; print_r($collection);

//var_dump($data2 == $data3);






























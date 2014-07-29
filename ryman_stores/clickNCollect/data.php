<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 29/07/14
 * Time: 15:10
 */

$dataMap = array(
    'status' => 'OK',
    'places' => array(
        array(
            'geo' => array(37.421995, -122.083702),
            'name' => 'Our Store',
            'geo_name' => 'test'
        ),
        array(
            'geo' => array(37.421995, -122.013702),
            'name' => 'Our Store2',
            'geo_name' => 'test'
        ),
        array(
            'geo' => array(37.421995, -122.083892),
            'name' => 'Our Store3',
            'geo_name' => 'test'
        )
    )
);

echo json_encode($dataMap);
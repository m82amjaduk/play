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
            'geo' => array(37.421995, -122.083802),
            'name' => 'Our Store',
            'geo_name' => 'test'
        )
    )
);

echo json_encode($dataMap);
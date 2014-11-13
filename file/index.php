<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 11/11/2014
 * Time: 11:13
 */


$data = tail('test.log', 10);


$data = implode("\n", array_reverse($data));
echo '<pre>'; print_r($data);

function tail($filename, $n)
{
    $buffer_size = 1024;

    $fp = fopen($filename, 'r');
    if (!$fp) return array();

    fseek($fp, 0, SEEK_END);
    $pos = ftell($fp);

    $input = '';
    $line_count = 0;

    while ($line_count < $n + 1)
    {
        // read the previous block of input
        $read_size = $pos >= $buffer_size ? $buffer_size : $pos;
        fseek($fp, $pos - $read_size, SEEK_SET);

        // prepend the current block, and count the new lines
        $input = fread($fp, $read_size).$input;
        $line_count = substr_count(ltrim($input), "\n");

        // if $pos is == 0 we are at start of file
        $pos -= $read_size;
        if (!$pos) break;
    }

    fclose($fp);

    // return the last 50 lines found

    return array_slice(explode("\n", rtrim($input)), -$n);
}


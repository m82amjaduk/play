<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 03/12/2014
 * Time: 11:45
 */

// namespace csvreader;
/**
 * CSVReader Class
 *
 * $Id: csvreader.php 147 2007-07-09 23:12:45Z Pierre-Jean $
 *
 * Allows to retrieve a CSV file content as a two dimensional array.
 * The first text line shall contains the column names.
 *
 * @author        Pierre-Jean Turpeau
 * @link        http://www.codeigniter.com/wiki/CSVReader
 */
class CSVReader {

    var $fields;        /** columns names retrieved after parsing */
    var $separator = ',';    /** separator used to explode each line */

    /**
     * Parse a text containing CSV formatted data.
     *
     * @access    public
     * @param    string
     * @return    array
     */
    function parse_text($p_Text) {
        $lines = explode("\n", $p_Text);
        return $this->parse_lines($lines);
    }

    /**
     * Parse a file containing CSV formatted data.
     *
     * @access    public
     * @param    string
     * @return    array
     */
    function parse_file($p_Filepath) {
        $lines = file($p_Filepath);
        return $this->parse_lines($lines);
    }
    /**
     * Parse an array of text lines containing CSV formatted data.
     *
     * @access    public
     * @param    array
     * @return    array
     */
    function parse_lines($p_CSVLines) {
        $content = FALSE;
        foreach( $p_CSVLines as $line_num => $line ) {
            $line =  rtrim ($line); // str_replace("\n", '', $line);
            if( $line != '' ) { // skip empty lines
                $elements = explode($this->separator, $line);
                $elements = $this->escape_string($elements);

                if( !is_array($content) ) { // the first line contains fields names
                    $this->fields = $elements;
                    $content = array();
                } else {
                    $item = array();
                    $this->fields = $this->escape_string($this->fields);
                    foreach( $this->fields as $id => $field ) {
                        if( isset($elements[$id]) ) {
                            $item[$field] = $elements[$id];
                        }
                    }
                    $content[] = $item;
                }
            }
        }
        return $content;
    }
    function escape_string($data){
        $result =   array();
        foreach($data as $key => $row){
            $result[$key]   =  str_replace('"', '', rtrim($row));//  preg_replace('/[\x00-\x09\x0B\x0C\x0E-\x1F\x7F]/', '', $row);
        }
        return $result;
    }

    /**
     * Generate CSV from a query result object
     *
     * @access	public
     * @param	object	The query result object
     * @param	string	The delimiter - comma by default
     * @param	string	The newline character - \n by default
     * @param	string	The enclosure - double quote by default
     * @return	string
     */
    function csv_from_result($query, $delim = ",", $newline = "\n", $enclosure = '"')
    {
        error_log('test');
        if ( ! is_object($query) OR ! method_exists($query, 'list_fields')) {
            show_error('You must submit a valid result object');
        }

        $out = NULL;

        // First generate the headings from the table column names
        $out .= $this->array_to_line($query->list_fields(), $delim, $newline, $enclosure );

        // Next blast through the result array and build out the rows
        foreach ($query->result_array() as $row) {
            $out .= $this->array_to_line($row, $delim, $newline, $enclosure );
        }
        return $out;
    }

    function array_to_line($array, $delim = ",", $newline = "\n", $enclosure = '"' ){
        $out = NULL;
        foreach ($array as $item) {
            $item = str_replace(',', '&#44;', $item); // Replacing COMMA with HTML ENTITY  '&#44;'
            $out .= $enclosure.str_replace($enclosure, $enclosure.$enclosure, $item).$enclosure.$delim;
        }
        $out = substr ($out, 0, -1);
        $out .= $newline;
        return $out;
    }
}

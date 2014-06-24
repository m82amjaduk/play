<?php
/**
 * Created by PhpStorm.
 * User: AMojumder
 * Date: 19/05/14
 * Time: 12:20
 */
class CSVMySQL {

    public function fromCSV (){
        return FALSE;
    }

    public function toCSV (){
        return FALSE;
    }
    public function prepareFile($exportDir, $exportFile, $type ='csv', $date=TRUE ){ // FUNCTIONS::prepareFile('../data', '/file', 'txt', $date=FALSE )
        $exportFile .= ($date) ?  date('_Y_m_d_H_i') : '';
        $exportFile .= ($type) ? '.'.$type : '';
        if (!is_dir($exportDir)) { mkdir($exportDir, 0777, true); }
        $fp = fopen($exportDir.$exportFile, 'w+');
        return $fp;
    }
    public function cleanArray($row){
        $cleanArray=array();
        foreach ($row as $key=>$col){
            $cleanArray[$key] = ($this-> cleanData($col)) ? $this-> cleanData($col) : NULL ;
        }
        return $cleanArray;
    }
    public function safeMode($safeMode, $file, $line){
        echo "\n\n ######################## Please Wait ########################## \n\n ";
        $completed = "\n\n ######################## *********** ########################## \n\n ";
        $comment = " SAFE MODE TURNED ON \n";
        $comment .= " Set safeMode(0); to run this script in \n File :: " . $file . "\n Line :: ". $line."\n";
        $comment .= " Complete test before you run on Production Server.";
        if($safeMode)
            die(  $comment.$completed);
    }
    public function cleanData($data){
        $data = trim(preg_replace('/\s\s+/', ' ',  $data));
        $data = preg_replace( "/\r|\n/", "", $data );
        $data = str_replace("\r\n","",$data);
        $data = str_replace("\n","",$data);
        $data = str_replace("\r","",$data);
        return $data;
    }
}

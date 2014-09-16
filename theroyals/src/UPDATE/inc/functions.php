<?
function getDatabase(){  // Does not work yet !!
    $CI =& get_instance();
    $CI->load->database();
    return $CI->db->database;
}

// Delete Dir
function deleteDir($dir){
    $it = new RecursiveDirectoryIterator($dir);
    $files = new RecursiveIteratorIterator($it,
        RecursiveIteratorIterator::CHILD_FIRST);
    foreach($files as $file) {
        if ($file->getFilename() === '.' || $file->getFilename() === '..') {
            continue;
        }
        if ($file->isDir()){
            rmdir($file->getRealPath());
        } else {
            unlink($file->getRealPath());
        }
    }
    rmdir($dir);
    return TRUE;
}

?>
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Migration extends CI_Controller {

    private $_email = NULL;


    function __construct() {
        parent::__construct();
        if($this->db->table_exists('users_address')){
            $this->load->library('ion_auth');
            if(!$this->ion_auth->is_admin()){
                redirect('auth/login', 'refresh');
            }
            $this->_email =  $this->session->userdata('identity');
        }else {
            $this->_email = 'Unknown';
        }
    }

    /*
     * /migration/index
     */
    public function index() {
        echo "<h3>Welcome to database migration</h3>";
        $this->load->database();


        if($this->db->table_exists('migrations')){
            $query = $this->db->get('migrations');
            $row = ($query->num_rows > 0 ? $query->row() : array());
            $msg = "Current Version :: $row->version";
        }else {
            $msg = "New Migration Initiate";
        }

        echo "<h3> $msg </h3>";
        $this->tools->logFileWrite($msg, 'migrations.log', $this->_email, basename(__FILE__), __LINE__);


        // Migration Begains Here
        $this->load->library('migration');
        if ( ! $this->migration->current())
        {
            show_error($this->migration->error_string());
            $msg = $this->migration->error_string();
        }else {
            $query = $this->db->get('migrations');
            $row = ($query->num_rows > 0 ? $query->row() : array());
            $msg = "Updated to Version :: $row->version";
        }
        echo "<h1> $msg </h1>";
        $this->tools->logFileWrite($msg, 'migrations.log', $this->_email, basename(__FILE__), __LINE__);

        ECHO "<a href='/UPDATE'> UPDATE </a>";
    }



    /*
     *  Delete dir img and all filed
     *  Produce massage if delete succeeded
     */
    public function delete_images(){
        if(SITECODE == 'amzad/d')
            die('NOT Allowed From This Host');
        $this->load->helper("file");
        $dir = 'img';
        delete_files($dir, true);
        echo (!is_dir($dir))? "<h1>$dir Delete Succeeded</h1>" : "<h1> $dir Delete Failed</h1>";
        $this->tools->logFileWrite('img Dir Deleted.', 'img.log', $this->_email, basename(__FILE__), __LINE__);
    }

    /*
     *  Get the file list from remote location
     *  Create Files url to copy ..
     *  Create Dir is not exist
     *  Copy the file to specific location
     */
    public function copy_images(){
        if(SITECODE == 'amzad/d')
            die('NOT Allowed From This Host');

        $baseUrl = "http://allinepos.co.uk/clientsImg/";
        $fullUrl = $baseUrl."index.php?s=". SITECODE ;

        $data = json_decode(file_get_contents($fullUrl));
        $newFiles   = $this->_getFilesUrl($data, $baseUrl);
        $totalFile = $this->_copyFiles($newFiles);

        echo '<h1>Copy Succeeded</h1>';
        echo "Total File Copied ".$totalFile;
    }

    /*
     *  Create Dir if does not exist
     *  Copy Files to remote location
     */
    private function _copyFiles($files){
        $success = 0;
        foreach ($files as $file){
            $copyFrom   = $file['copyFrom'];
            $dir        = $file['copyTo'];
            $file       = $dir.$file['file'];

            if (!file_exists($dir)) { mkdir($dir, 0777, true); }
            $res = (copy($copyFrom, $file))? 'COPIED' : 'FAILED';
            If($res == 'COPIED') $success++;

            echo $data = $res. ' >> ' . $success . ' '. $copyFrom;
            $this->tools->logFileWrite($data, 'img.log', $this->_email, basename(__FILE__), __LINE__);
            echo '<br />';
        }
        return $success;
    }

    /*
     *  Generate url to copy files
     *  Genrate dir where file should be copied
     *  Get the file name
     */
    private function _getFilesUrl($data, $baseUrl = "http://allinepos.co.uk/clientsImg/"){
        $imgSource = SITECODE.'/';
        $newFiles = array();
        foreach($data as $file){
            $fileName = basename($file);
            $newFiles[] = array(
                'copyFrom'  => $baseUrl.$file,
                'copyTo'    => str_replace($fileName, '', str_replace($imgSource, '', $file)),
                'file'      => $fileName
            );
        }
        return $newFiles;
    }

    /* End of file migration.php */
    /* Location: ./application/controllers/migration.php */
}

<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Migration extends CI_Controller {

    /*
     * http://learning7.lc/ion_auth/index.php/migration/index
     */
    public function index() {
        echo '<h1>Please Wait While I Work</h1>';
        $this->load->library('migration');

        if ( ! $this->migration->current())
        {
            show_error($this->migration->error_string());
        }
        echo '<h2>I Have Finished My Task.</h2>';
    }

    /* End of file migration.php */
    /* Location: ./application/controllers/migration.php */
}

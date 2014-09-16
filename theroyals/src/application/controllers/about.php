<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class About extends CI_Controller {

//    private $_cart;

    function __construct() {
        parent::__construct();
        $this->load->config('cwaiter');
        $this->load->model('cm');
        $this->load->model('aboutm');
        $this->load->model('emailm');
        $this->load->model('dbm');

        $this->_menuMainPage            = $this->config->item('aboutMainPage');
        $this->data['highlights_main']  = $this->cache->model('aboutm', 'get_cms_highlights', array('about/main'), $this->config->item('week'));
        $this->data['business']         = $this->dbm->getRow('settings_business');
        $this->data['tracker']          = $this->dbm->getRow('cms_tracker');
        $this->data['socialHerf']       = $this->dbm->getCollection('social_href');
//        echo '<pre>';  print_r($this->data['socialHerf']); exit;
    }

	public function index() {
        redirect('about/home', 'refresh');
	}

	public function home( ) {
        // TODO :: Need to get configure able slides from Database, for advance template.
        $this->data['slides']       = $this->cm->get_file_list("img/slides");
        $this->data['highlights']   = $this->cache->model('aboutm', 'get_cms_highlights', array('about/home'), $this->config->item('week'));

        $this->data['page']= 'home';
        $this->load->view($this->_menuMainPage, $this->data);
	}

	public function us( ) {
        $this->data['highlights_us']   = $this->cache->model('aboutm', 'get_cms_highlights', array('about/us'), $this->config->item('week'));
        $this->data['article']   = $this->cache->model('aboutm', 'get_cms_article', array('about_us'), $this->config->item('week'));
//        echo '<pre>'; print_r($this->data['article']  ); exit;

        $this->data['page']= 'us';
        $this->load->view($this->_menuMainPage, $this->data);
	}

	public function gallery() {
        // TODO :: Need to get configure able gallery from Database, for advance template.
        $this->data['gallery_imges']   = $this->cm->get_file_list("img/gallery");

        $this->data['page']     = 'gallery';
        $this->load->view($this->_menuMainPage, $this->data);
    }

	public function contact( ) {
        $this->data['contact']  = $this->dbm->getRow('page_contact');
        $this->data['phone']    = $this->aboutm->get_contact_phone($this->data['contact'], $this->data['business'] );
        $this->data['address']  = $this->aboutm->get_contact_address($this->data['contact'], $this->data['business'] );

        $this->data['page']     = 'contact';
        $this->load->view($this->_menuMainPage, $this->data);
    }

	public function contact_process( ) {
        $fname          = $this->input->post('fname');
        $lname          = $this->input->post('lname');
        $email          = $this->input->post('email');
        $phone          = $this->input->post('phone');
        $title          = $this->input->post('title');
        $comments       = $this->input->post('comments');
        $subject = base_url() . '>>'. $title;
        $greeting = "There is massage from <b>". $fname . ' '. $lname .'</b>';
        $body_text = 'Phone : '.$phone.
            '<br />Comments : '.$comments;
        //  TODO :: C0100 :: Form Validation
        //  TODO :: C0101 :: Chapta
        //  TODO :: C0102 :: SUCCESS Message
        //  TODO :: Set and set Session Data
        $this->emailm->send($email, $subject, $greeting, $body_text);
        redirect('about/contact', 'refresh');
    }


    /* End of file cwdp.php  // cwaiter desk printing */
    /* Location: ./application/controllers/cwdp.php */
}


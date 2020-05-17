<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Admin extends CI_Controller
{
    
        
    function __construct()
    {
        parent::__construct();
        $this->load->library(array('ion_auth','form_validation'));

        $this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));

        $this->lang->load('auth');

        if (!$this->ion_auth->logged_in())
        {
            // redirect them to the login page
            redirect('auth/login', 'refresh');
        }
    }

    public function index()
    {
        redirect('/admin/dashboard', 'refresh');   
    }

    public function dashboard()
    {
        // set the flash data error message if there is one
        $this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

        //list the users
        $this->data['users'] = $this->ion_auth->users()->result();
		//var_dump($this->data['users']);die;
		
        foreach ($this->data['users'] as $k => $user)
        {
            $this->data['users'][$k]->groups = $this->ion_auth->get_users_groups($user->id)->result();
        }
        // if success login redirect
        $this->template->load('template','dashboard', $this->data);
    }
    public function ajax($table){
        $json = [];

        $this->load->database();

        if(!empty($this->input->get("q"))){
            $this->db->like('name', $this->input->get("q"));
            $query = $this->db->select('id,name as text')
                        ->limit(10)
                        ->get($table);
            $json = $query->result();
        }
        
        echo json_encode($json);
    }
}


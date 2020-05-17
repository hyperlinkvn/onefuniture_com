<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Customers extends CI_Controller
{
    
        
    function __construct()
    {
        parent::__construct();
        $this->load->model('Customers_model');
        $this->load->library(array('ion_auth','form_validation'));

        if (!$this->ion_auth->logged_in()){
            // redirect them to the login page
            redirect('auth/login', 'refresh');
        }
    }

    public function index()
    {
        $customers = $this->Customers_model->get_all();

        $data = array(
            'customers_data' => $customers
        );

        $this->template->load('template','customers_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Customers_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id' => $row->id,
		'name' => $row->name,
		'email' => $row->email,
		'phone' => $row->phone,
		'address' => $row->address,
		'description' => $row->description,
		'date_created' => $row->date_created,
	    );
            $this->template->load('template','customers_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('customers'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('customers/create_action'),
	    'id' => set_value('id'),
	    'name' => set_value('name'),
	    'email' => set_value('email'),
	    'phone' => set_value('phone'),
	    'address' => set_value('address'),
	    'description' => set_value('description'),
	    'date_created' => set_value('date_created'),
	);
        $this->template->load('template','customers_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            if (!empty($_FILES['image']['name'])){
                $config['upload_path'] = 'uploads/images';
                $config['allowed_types'] = 'jpg|jpeg|png|gif';
                $config['file_name'] = $_FILES['image']['name'];

                $this->load->library('upload', $config);
                $this->upload->initialize($config);

                if ($this->upload->do_upload('image')) {
                  $uploadData = $this->upload->data();
                  $_POST['image'] = $uploadData['file_name'];
                } else{
                  $_POST['image'] = '';
                }
            }else{
                $_POST['image'] = $_POST['image_hidden'] ;   
                unset($_POST['image_hidden']);
            }
            $data = array(
		'name' => $this->input->post('name',TRUE),
		'email' => $this->input->post('email',TRUE),
		'phone' => $this->input->post('phone',TRUE),
		'address' => $this->input->post('address',TRUE),
		'description' => $this->input->post('description',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->Customers_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('customers'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Customers_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('customers/update_action'),
		'id' => set_value('id', $row->id),
		'name' => set_value('name', $row->name),
		'email' => set_value('email', $row->email),
		'phone' => set_value('phone', $row->phone),
		'address' => set_value('address', $row->address),
		'description' => set_value('description', $row->description),
		'date_created' => set_value('date_created', $row->date_created),
	    );
            $this->template->load('template','customers_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('customers'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            if (!empty($_FILES['image']['name'])){
                $config['upload_path'] = 'uploads/images';
                $config['allowed_types'] = 'jpg|jpeg|png|gif';
                $config['file_name'] = $_FILES['image']['name'];

                $this->load->library('upload', $config);
                $this->upload->initialize($config);

                if ($this->upload->do_upload('image')) {
                  $uploadData = $this->upload->data();
                  $_POST['image'] = $uploadData['file_name'];
                } else{
                  $_POST['image'] = '';
                }
            }else{
                $_POST['image'] = $_POST['image_hidden'] ;   
                unset($_POST['image_hidden']);
            }
            $data = array(
		'name' => $this->input->post('name',TRUE),
		'email' => $this->input->post('email',TRUE),
		'phone' => $this->input->post('phone',TRUE),
		'address' => $this->input->post('address',TRUE),
		'description' => $this->input->post('description',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->Customers_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('customers'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Customers_model->get_by_id($id);

        if ($row) {
            $this->Customers_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('customers'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('customers'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('name', 'name', 'trim|required');
	$this->form_validation->set_rules('email', 'email', 'trim|required');
	$this->form_validation->set_rules('phone', 'phone', 'trim|required');
	$this->form_validation->set_rules('address', 'address', 'trim|required');
	$this->form_validation->set_rules('description', 'description', 'trim|required');
	$this->form_validation->set_rules('date_created', 'date created', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "customers.xls";
        $judul = "customers";
        $tablehead = 0;
        $tablebody = 1;
        $nourut = 1;
        //penulisan header
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control: must-revalidate, post-check=0,pre-check=0");
        header("Content-Type: application/force-download");
        header("Content-Type: application/octet-stream");
        header("Content-Type: application/download");
        header("Content-Disposition: attachment;filename=" . $namaFile . "");
        header("Content-Transfer-Encoding: binary ");

        xlsBOF();

        $kolomhead = 0;
        xlsWriteLabel($tablehead, $kolomhead++, "No");
	xlsWriteLabel($tablehead, $kolomhead++, "Name");
	xlsWriteLabel($tablehead, $kolomhead++, "Email");
	xlsWriteLabel($tablehead, $kolomhead++, "Phone");
	xlsWriteLabel($tablehead, $kolomhead++, "Address");
	xlsWriteLabel($tablehead, $kolomhead++, "Description");
	xlsWriteLabel($tablehead, $kolomhead++, "Date Created");

	foreach ($this->Customers_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteLabel($tablebody, $kolombody++, $data->name);
	    xlsWriteLabel($tablebody, $kolombody++, $data->email);
	    xlsWriteLabel($tablebody, $kolombody++, $data->phone);
	    xlsWriteLabel($tablebody, $kolombody++, $data->address);
	    xlsWriteLabel($tablebody, $kolombody++, $data->description);
	    xlsWriteLabel($tablebody, $kolombody++, $data->date_created);

	    $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

    public function word()
    {
        header("Content-type: application/vnd.ms-word");
        header("Content-Disposition: attachment;Filename=customers.doc");

        $data = array(
            'customers_data' => $this->Customers_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('customers_doc',$data);
    }

}

/* End of file Customers.php */
/* Location: ./application/controllers/Customers.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-09-03 06:58:45 */
/* http://harviacode.com */
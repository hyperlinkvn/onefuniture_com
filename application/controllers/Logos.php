<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Logos extends CI_Controller
{
    
        
    function __construct()
    {
        parent::__construct();
        $this->load->model('Logos_model');
        $this->load->library(array('ion_auth','form_validation'));

        if (!$this->ion_auth->logged_in()){
            // redirect them to the login page
            redirect('auth/login', 'refresh');
        }
    }

    public function index()
    {
        $logos = $this->Logos_model->get_all();

        $data = array(
            'logos_data' => $logos
        );

        $this->template->load('template','logos_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Logos_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id' => $row->id,
		'name' => $row->name,
		'image' => $row->image,
		'url' => $row->url,
	    );
            $this->template->load('template','logos_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('logos'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('logos/create_action'),
	    'id' => set_value('id'),
	    'name' => set_value('name'),
	    'image' => set_value('image'),
	    'url' => set_value('url'),
	);
        $this->template->load('template','logos_form', $data);
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
		'image' => $this->input->post('image',TRUE),
		'url' => $this->input->post('url',TRUE),
	    );

            $this->Logos_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('logos'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Logos_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('logos/update_action'),
		'id' => set_value('id', $row->id),
		'name' => set_value('name', $row->name),
		'image' => set_value('image', $row->image),
		'url' => set_value('url', $row->url),
	    );
            $this->template->load('template','logos_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('logos'));
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
		'image' => $this->input->post('image',TRUE),
		'url' => $this->input->post('url',TRUE),
	    );

            $this->Logos_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('logos'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Logos_model->get_by_id($id);

        if ($row) {
            $this->Logos_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('logos'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('logos'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('name', 'name', 'trim|required');
	$this->form_validation->set_rules('url', 'url', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "logos.xls";
        $judul = "logos";
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
	xlsWriteLabel($tablehead, $kolomhead++, "Image");
	xlsWriteLabel($tablehead, $kolomhead++, "Url");

	foreach ($this->Logos_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteLabel($tablebody, $kolombody++, $data->name);
	    xlsWriteLabel($tablebody, $kolombody++, $data->image);
	    xlsWriteLabel($tablebody, $kolombody++, $data->url);

	    $tablebody++;
            $nourut++;
        }

        xlsEOF();
        exit();
    }

    public function word()
    {
        header("Content-type: application/vnd.ms-word");
        header("Content-Disposition: attachment;Filename=logos.doc");

        $data = array(
            'logos_data' => $this->Logos_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('logos_doc',$data);
    }

}

/* End of file Logos.php */
/* Location: ./application/controllers/Logos.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-09-13 18:49:22 */
/* http://harviacode.com */
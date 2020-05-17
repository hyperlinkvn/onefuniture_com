<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Banners extends CI_Controller
{
    
        
    function __construct()
    {
        parent::__construct();
        $this->load->model('Banners_model');
        $this->load->library(array('ion_auth','form_validation'));

        if (!$this->ion_auth->logged_in()){
            // redirect them to the login page
            redirect('auth/login', 'refresh');
        }
    }

    public function index()
    {
        $banners = $this->Banners_model->get_all();

        $data = array(
            'banners_data' => $banners
        );

        $this->template->load('template','banners_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Banners_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id' => $row->id,
		'name' => $row->name,
		'image' => $row->image,
		'small_text' => $row->small_text,
		'big_text' => $row->big_text,
		'url' => $row->url,
		'position' => $row->position,
		'date_created' => $row->date_created,
	    );
            $this->template->load('template','banners_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('banners'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('banners/create_action'),
	    'id' => set_value('id'),
	    'name' => set_value('name'),
	    'image' => set_value('image'),
	    'small_text' => set_value('small_text'),
	    'big_text' => set_value('big_text'),
	    'url' => set_value('url'),
	    'position' => set_value('position'),
	    'date_created' => set_value('date_created'),
	);
        $this->template->load('template','banners_form', $data);
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
		'small_text' => $this->input->post('small_text',TRUE),
		'big_text' => $this->input->post('big_text',TRUE),
		'url' => $this->input->post('url',TRUE),
		'position' => $this->input->post('position',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->Banners_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('banners'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Banners_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('banners/update_action'),
		'id' => set_value('id', $row->id),
		'name' => set_value('name', $row->name),
		'image' => set_value('image', $row->image),
		'small_text' => set_value('small_text', $row->small_text),
		'big_text' => set_value('big_text', $row->big_text),
		'url' => set_value('url', $row->url),
		'position' => set_value('position', $row->position),
		'date_created' => set_value('date_created', $row->date_created),
	    );
            $this->template->load('template','banners_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('banners'));
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
		'small_text' => $this->input->post('small_text',TRUE),
		'big_text' => $this->input->post('big_text',TRUE),
		'url' => $this->input->post('url',TRUE),
		'position' => $this->input->post('position',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->Banners_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('banners'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Banners_model->get_by_id($id);

        if ($row) {
            $this->Banners_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('banners'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('banners'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('name', 'name', 'trim|required');
	$this->form_validation->set_rules('small_text', 'small text', 'trim|required');
	$this->form_validation->set_rules('big_text', 'big text', 'trim|required');
	$this->form_validation->set_rules('url', 'url', 'trim|required');
	$this->form_validation->set_rules('position', 'position', 'trim|required');
	$this->form_validation->set_rules('date_created', 'date created', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "banners.xls";
        $judul = "banners";
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
	xlsWriteLabel($tablehead, $kolomhead++, "Small Text");
	xlsWriteLabel($tablehead, $kolomhead++, "Big Text");
	xlsWriteLabel($tablehead, $kolomhead++, "Url");
	xlsWriteLabel($tablehead, $kolomhead++, "Position");
	xlsWriteLabel($tablehead, $kolomhead++, "Date Created");

	foreach ($this->Banners_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteLabel($tablebody, $kolombody++, $data->name);
	    xlsWriteLabel($tablebody, $kolombody++, $data->image);
	    xlsWriteLabel($tablebody, $kolombody++, $data->small_text);
	    xlsWriteLabel($tablebody, $kolombody++, $data->big_text);
	    xlsWriteLabel($tablebody, $kolombody++, $data->url);
	    xlsWriteLabel($tablebody, $kolombody++, $data->position);
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
        header("Content-Disposition: attachment;Filename=banners.doc");

        $data = array(
            'banners_data' => $this->Banners_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('banners_doc',$data);
    }

}

/* End of file Banners.php */
/* Location: ./application/controllers/Banners.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-09-17 17:10:18 */
/* http://harviacode.com */
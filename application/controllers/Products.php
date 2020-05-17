<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Products extends CI_Controller
{
    
        
    function __construct()
    {
        parent::__construct();
        $this->load->model('Products_model');
        $this->load->library(array('ion_auth','form_validation'));

        if (!$this->ion_auth->logged_in()){
            // redirect them to the login page
            redirect('auth/login', 'refresh');
        }
    }

    public function index()
    {
        $products = $this->Products_model->get_all();

        $data = array(
            'products_data' => $products
        );

        $this->template->load('template','products_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Products_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id' => $row->id,
		'name' => $row->name,
		'description' => $row->description,
		'category_id' => $row->category_id,
		'price' => $row->price,
		'cost' => $row->cost,
		'image' => $row->image,
		'status' => $row->status,
		'option_ids' => $row->option_ids,
		'content' => $row->content,
		'date_created' => $row->date_created,
	    );
            $this->template->load('template','products_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('products'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('products/create_action'),
	    'id' => set_value('id'),
	    'name' => set_value('name'),
	    'description' => set_value('description'),
	    'category_id' => set_value('category_id'),
	    'price' => set_value('price'),
	    'cost' => set_value('cost'),
	    'image' => set_value('image'),
	    'status' => set_value('status'),
	    'option_ids' => set_value('option_ids'),
	    'content' => set_value('content'),
	    'date_created' => set_value('date_created'),
	);
        $this->template->load('template','products_form', $data);
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
                $_POST['image'] = $_POST['image_hidden'];   
                unset($_POST['image_hidden']);
            }

            if (!empty($_FILES['image1']['name'])){
                $config['upload_path'] = 'uploads/images';
                $config['allowed_types'] = 'jpg|jpeg|png|gif';
                $config['file_name'] = $_FILES['image1']['name'];

                $this->load->library('upload', $config);
                $this->upload->initialize($config);

                if ($this->upload->do_upload('image1')) {
                  $uploadData = $this->upload->data();
                  $_POST['image'] .= ','.$uploadData['file_name'];
                }
            }else{
                $_POST['image'] .= ','.$_POST['image_hidden1'];   
                unset($_POST['image_hidden1']);
            }

            if (!empty($_FILES['image2']['name'])){
                $config['upload_path'] = 'uploads/images';
                $config['allowed_types'] = 'jpg|jpeg|png|gif';
                $config['file_name'] = $_FILES['image2']['name'];

                $this->load->library('upload', $config);
                $this->upload->initialize($config);

                if ($this->upload->do_upload('image2')) {
                  $uploadData = $this->upload->data();
                  $_POST['image'] .= ','.$uploadData['file_name'];
                }
            }else{
                $_POST['image'] .= ','.$_POST['image_hidden2'];   
                unset($_POST['image_hidden2']);
            }
            $data = array(
		'name' => $this->input->post('name',TRUE),
		'description' => $this->input->post('description',TRUE),
		'category_id' => $this->input->post('category_id',TRUE),
		'price' => $this->input->post('price',TRUE),
		'cost' => $this->input->post('cost',TRUE),
		'image' => $this->input->post('image',TRUE),
		'status' => $this->input->post('status',TRUE),
		'option_ids' => $this->input->post('option_ids',TRUE),
		'content' => $this->input->post('content',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->Products_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('products'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Products_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('products/update_action'),
		'id' => set_value('id', $row->id),
		'name' => set_value('name', $row->name),
		'description' => set_value('description', $row->description),
		'category_id' => set_value('category_id', $row->category_id),
		'price' => set_value('price', $row->price),
		'cost' => set_value('cost', $row->cost),
		'image' => set_value('image', $row->image),
		'status' => set_value('status', $row->status),
		'option_ids' => set_value('option_ids', $row->option_ids),
		'content' => set_value('content', $row->content),
		'date_created' => set_value('date_created', $row->date_created),
	    );
            $this->template->load('template','products_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('products'));
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
                $_POST['image'] = $_POST['image_hidden'];   
                unset($_POST['image_hidden']);
            }

            if (!empty($_FILES['image1']['name'])){
                $config['upload_path'] = 'uploads/images';
                $config['allowed_types'] = 'jpg|jpeg|png|gif';
                $config['file_name'] = $_FILES['image1']['name'];

                $this->load->library('upload', $config);
                $this->upload->initialize($config);

                if ($this->upload->do_upload('image1')) {
                  $uploadData = $this->upload->data();
                  $_POST['image'] .= ','.$uploadData['file_name'];
                }
            }else{
                $_POST['image'] .= ','.$_POST['image_hidden1'];   
                unset($_POST['image_hidden1']);
            }

            if (!empty($_FILES['image2']['name'])){
                $config['upload_path'] = 'uploads/images';
                $config['allowed_types'] = 'jpg|jpeg|png|gif';
                $config['file_name'] = $_FILES['image2']['name'];

                $this->load->library('upload', $config);
                $this->upload->initialize($config);

                if ($this->upload->do_upload('image2')) {
                  $uploadData = $this->upload->data();
                  $_POST['image'] .= ','.$uploadData['file_name'];
                }
            }else{
                $_POST['image'] .= ','.$_POST['image_hidden2'];   
                unset($_POST['image_hidden2']);
            }
            $data = array(
		'name' => $this->input->post('name',TRUE),
		'description' => $this->input->post('description',TRUE),
		'category_id' => $this->input->post('category_id',TRUE),
		'price' => $this->input->post('price',TRUE),
		'cost' => $this->input->post('cost',TRUE),
		'image' => $this->input->post('image',TRUE),
		'status' => $this->input->post('status',TRUE),
		'option_ids' => $this->input->post('option_ids',TRUE),
		'content' => $this->input->post('content',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->Products_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('products'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Products_model->get_by_id($id);

        if ($row) {
            $this->Products_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('products'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('products'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('name', 'name', 'trim|required');
	$this->form_validation->set_rules('description', 'description', 'trim|required');
	$this->form_validation->set_rules('category_id', 'category id', 'trim|required');
	$this->form_validation->set_rules('price', 'price', 'trim|required');
	$this->form_validation->set_rules('cost', 'cost', 'trim|required');
	$this->form_validation->set_rules('status', 'status', 'trim|required');
	$this->form_validation->set_rules('option_ids', 'option ids', 'trim|required');
	$this->form_validation->set_rules('content', 'content', 'trim|required');
	$this->form_validation->set_rules('date_created', 'date created', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "products.xls";
        $judul = "products";
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
	xlsWriteLabel($tablehead, $kolomhead++, "Description");
	xlsWriteLabel($tablehead, $kolomhead++, "Category Id");
	xlsWriteLabel($tablehead, $kolomhead++, "Price");
	xlsWriteLabel($tablehead, $kolomhead++, "Cost");
	xlsWriteLabel($tablehead, $kolomhead++, "Image");
	xlsWriteLabel($tablehead, $kolomhead++, "Status");
	xlsWriteLabel($tablehead, $kolomhead++, "Option Ids");
	xlsWriteLabel($tablehead, $kolomhead++, "Content");
	xlsWriteLabel($tablehead, $kolomhead++, "Date Created");

	foreach ($this->Products_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteLabel($tablebody, $kolombody++, $data->name);
	    xlsWriteLabel($tablebody, $kolombody++, $data->description);
	    xlsWriteNumber($tablebody, $kolombody++, $data->category_id);
	    xlsWriteNumber($tablebody, $kolombody++, $data->price);
	    xlsWriteNumber($tablebody, $kolombody++, $data->cost);
	    xlsWriteLabel($tablebody, $kolombody++, $data->image);
	    xlsWriteLabel($tablebody, $kolombody++, $data->status);
	    xlsWriteLabel($tablebody, $kolombody++, $data->option_ids);
	    xlsWriteLabel($tablebody, $kolombody++, $data->content);
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
        header("Content-Disposition: attachment;Filename=products.doc");

        $data = array(
            'products_data' => $this->Products_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('products_doc',$data);
    }

}

/* End of file Products.php */
/* Location: ./application/controllers/Products.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-08 04:16:36 */
/* http://harviacode.com */
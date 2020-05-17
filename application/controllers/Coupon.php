<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Coupon extends CI_Controller
{
    
        
    function __construct()
    {
        parent::__construct();
        $this->load->model('Coupon_model');
        $this->load->library(array('ion_auth','form_validation'));

        if (!$this->ion_auth->logged_in()){
            // redirect them to the login page
            redirect('auth/login', 'refresh');
        }
    }

    public function index()
    {
        $coupon = $this->Coupon_model->get_all();

        $data = array(
            'coupon_data' => $coupon
        );

        $this->template->load('template','coupon_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Coupon_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id' => $row->id,
		'code' => $row->code,
		'category_id' => $row->category_id,
		'from_date' => $row->from_date,
		'to_date' => $row->to_date,
		'total' => $row->total,
		'discount' => $row->discount,
		'date_created' => $row->date_created,
	    );
            $this->template->load('template','coupon_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('coupon'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('coupon/create_action'),
	    'id' => set_value('id'),
	    'code' => set_value('code'),
	    'category_id' => set_value('category_id'),
	    'from_date' => set_value('from_date'),
	    'to_date' => set_value('to_date'),
	    'total' => set_value('total'),
	    'discount' => set_value('discount'),
	    'date_created' => set_value('date_created'),
	);
        $this->template->load('template','coupon_form', $data);
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
		'code' => $this->input->post('code',TRUE),
		'category_id' => $this->input->post('category_id',TRUE),
		'from_date' => $this->input->post('from_date',TRUE),
		'to_date' => $this->input->post('to_date',TRUE),
		'total' => $this->input->post('total',TRUE),
		'discount' => $this->input->post('discount',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->Coupon_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('coupon'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Coupon_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('coupon/update_action'),
		'id' => set_value('id', $row->id),
		'code' => set_value('code', $row->code),
		'category_id' => set_value('category_id', $row->category_id),
		'from_date' => set_value('from_date', $row->from_date),
		'to_date' => set_value('to_date', $row->to_date),
		'total' => set_value('total', $row->total),
		'discount' => set_value('discount', $row->discount),
		'date_created' => set_value('date_created', $row->date_created),
	    );
            $this->template->load('template','coupon_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('coupon'));
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
		'code' => $this->input->post('code',TRUE),
		'category_id' => $this->input->post('category_id',TRUE),
		'from_date' => $this->input->post('from_date',TRUE),
		'to_date' => $this->input->post('to_date',TRUE),
		'total' => $this->input->post('total',TRUE),
		'discount' => $this->input->post('discount',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->Coupon_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('coupon'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Coupon_model->get_by_id($id);

        if ($row) {
            $this->Coupon_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('coupon'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('coupon'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('code', 'code', 'trim|required');
	$this->form_validation->set_rules('category_id', 'category id', 'trim|required');
	$this->form_validation->set_rules('from_date', 'from date', 'trim|required');
	$this->form_validation->set_rules('to_date', 'to date', 'trim|required');
	$this->form_validation->set_rules('total', 'total', 'trim|required');
	$this->form_validation->set_rules('discount', 'discount', 'trim|required');
	$this->form_validation->set_rules('date_created', 'date created', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "coupon.xls";
        $judul = "coupon";
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
	xlsWriteLabel($tablehead, $kolomhead++, "Code");
	xlsWriteLabel($tablehead, $kolomhead++, "Category Id");
	xlsWriteLabel($tablehead, $kolomhead++, "From Date");
	xlsWriteLabel($tablehead, $kolomhead++, "To Date");
	xlsWriteLabel($tablehead, $kolomhead++, "Total");
	xlsWriteLabel($tablehead, $kolomhead++, "Discount");
	xlsWriteLabel($tablehead, $kolomhead++, "Date Created");

	foreach ($this->Coupon_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteLabel($tablebody, $kolombody++, $data->code);
	    xlsWriteNumber($tablebody, $kolombody++, $data->category_id);
	    xlsWriteLabel($tablebody, $kolombody++, $data->from_date);
	    xlsWriteLabel($tablebody, $kolombody++, $data->to_date);
	    xlsWriteNumber($tablebody, $kolombody++, $data->total);
	    xlsWriteNumber($tablebody, $kolombody++, $data->discount);
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
        header("Content-Disposition: attachment;Filename=coupon.doc");

        $data = array(
            'coupon_data' => $this->Coupon_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('coupon_doc',$data);
    }

}

/* End of file Coupon.php */
/* Location: ./application/controllers/Coupon.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-08 05:07:34 */
/* http://harviacode.com */
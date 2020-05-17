<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Orders extends CI_Controller
{
    
        
    function __construct()
    {
        parent::__construct();
        $this->load->model('Orders_model');
        $this->load->library(array('ion_auth','form_validation'));

        if (!$this->ion_auth->logged_in()){
            // redirect them to the login page
            redirect('auth/login', 'refresh');
        }
    }

    public function index()
    {
        $orders = $this->Orders_model->get_all();

        $data = array(
            'orders_data' => $orders
        );

        $this->template->load('template','orders_list', $data);
    }

    public function read($id) 
    {
        $row = $this->Orders_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id' => $row->id,
		'order_code' => $row->order_code,
		'customer_name' => $row->customer_name,
		'customer_id' => $row->customer_id,
		'delivery_address' => $row->delivery_address,
		'description' => $row->description,
		'total' => $row->total,
		'status' => $row->status,
		'note' => $row->note,
		'date_created' => $row->date_created,
	    );
            $this->template->load('template','orders_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('orders'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('orders/create_action'),
	    'id' => set_value('id'),
	    'order_code' => set_value('order_code'),
	    'customer_name' => set_value('customer_name'),
	    'customer_id' => set_value('customer_id'),
	    'delivery_address' => set_value('delivery_address'),
	    'description' => set_value('description'),
	    'total' => set_value('total'),
	    'status' => set_value('status'),
	    'note' => set_value('note'),
	    'date_created' => set_value('date_created'),
	);
        $this->template->load('template','orders_form', $data);
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
		'order_code' => $this->input->post('order_code',TRUE),
		'customer_name' => $this->input->post('customer_name',TRUE),
		'customer_id' => $this->input->post('customer_id',TRUE),
		'delivery_address' => $this->input->post('delivery_address',TRUE),
		'description' => $this->input->post('description',TRUE),
		'total' => $this->input->post('total',TRUE),
		'status' => $this->input->post('status',TRUE),
		'note' => $this->input->post('note',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->Orders_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('orders'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Orders_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('orders/update_action'),
		'id' => set_value('id', $row->id),
		'order_code' => set_value('order_code', $row->order_code),
		'customer_name' => set_value('customer_name', $row->customer_name),
		'customer_id' => set_value('customer_id', $row->customer_id),
		'delivery_address' => set_value('delivery_address', $row->delivery_address),
		'description' => set_value('description', $row->description),
		'total' => set_value('total', $row->total),
		'status' => set_value('status', $row->status),
		'note' => set_value('note', $row->note),
		'date_created' => set_value('date_created', $row->date_created),
	    );
            $this->template->load('template','orders_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('orders'));
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
		'order_code' => $this->input->post('order_code',TRUE),
		'customer_name' => $this->input->post('customer_name',TRUE),
		'customer_id' => $this->input->post('customer_id',TRUE),
		'delivery_address' => $this->input->post('delivery_address',TRUE),
		'description' => $this->input->post('description',TRUE),
		'total' => $this->input->post('total',TRUE),
		'status' => $this->input->post('status',TRUE),
		'note' => $this->input->post('note',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->Orders_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('orders'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Orders_model->get_by_id($id);

        if ($row) {
            $this->Orders_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('orders'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('orders'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('order_code', 'order code', 'trim|required');
	$this->form_validation->set_rules('customer_name', 'customer name', 'trim|required');
	$this->form_validation->set_rules('customer_id', 'customer id', 'trim|required');
	$this->form_validation->set_rules('delivery_address', 'delivery address', 'trim|required');
	$this->form_validation->set_rules('description', 'description', 'trim|required');
	$this->form_validation->set_rules('total', 'total', 'trim|required');
	$this->form_validation->set_rules('status', 'status', 'trim|required');
	$this->form_validation->set_rules('note', 'note', 'trim|required');
	$this->form_validation->set_rules('date_created', 'date created', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "orders.xls";
        $judul = "orders";
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
	xlsWriteLabel($tablehead, $kolomhead++, "Order Code");
	xlsWriteLabel($tablehead, $kolomhead++, "Customer Name");
	xlsWriteLabel($tablehead, $kolomhead++, "Customer Id");
	xlsWriteLabel($tablehead, $kolomhead++, "Delivery Address");
	xlsWriteLabel($tablehead, $kolomhead++, "Description");
	xlsWriteLabel($tablehead, $kolomhead++, "Total");
	xlsWriteLabel($tablehead, $kolomhead++, "Status");
	xlsWriteLabel($tablehead, $kolomhead++, "Note");
	xlsWriteLabel($tablehead, $kolomhead++, "Date Created");

	foreach ($this->Orders_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteLabel($tablebody, $kolombody++, $data->order_code);
	    xlsWriteLabel($tablebody, $kolombody++, $data->customer_name);
	    xlsWriteNumber($tablebody, $kolombody++, $data->customer_id);
	    xlsWriteLabel($tablebody, $kolombody++, $data->delivery_address);
	    xlsWriteLabel($tablebody, $kolombody++, $data->description);
	    xlsWriteNumber($tablebody, $kolombody++, $data->total);
	    xlsWriteLabel($tablebody, $kolombody++, $data->status);
	    xlsWriteLabel($tablebody, $kolombody++, $data->note);
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
        header("Content-Disposition: attachment;Filename=orders.doc");

        $data = array(
            'orders_data' => $this->Orders_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('orders_doc',$data);
    }

}

/* End of file Orders.php */
/* Location: ./application/controllers/Orders.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-09-13 18:49:59 */
/* http://harviacode.com */
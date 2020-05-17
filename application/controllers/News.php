<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class News extends CI_Controller
{
    
        
    function __construct()
    {
        parent::__construct();
        $this->load->model('News_model');
        $this->load->library(array('ion_auth','form_validation'));

        if (!$this->ion_auth->logged_in()){
            // redirect them to the login page
            redirect('auth/login', 'refresh');
        }
    }

    public function index()
    {
        $news = $this->News_model->get_all();

        $data = array(
            'news_data' => $news
        );

        $this->template->load('template','news_list', $data);
    }

    public function read($id) 
    {
        $row = $this->News_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id' => $row->id,
		'title' => $row->title,
		'description' => $row->description,
		'youtube_url' => $row->youtube_url,
		'content' => $row->content,
		'image' => $row->image,
		'status' => $row->status,
		'date_created' => $row->date_created,
	    );
            $this->template->load('template','news_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('news'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('news/create_action'),
	    'id' => set_value('id'),
	    'title' => set_value('title'),
	    'description' => set_value('description'),
	    'youtube_url' => set_value('youtube_url'),
	    'content' => set_value('content'),
	    'image' => set_value('image'),
	    'status' => set_value('status'),
	    'date_created' => set_value('date_created'),
	);
        $this->template->load('template','news_form', $data);
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
		'title' => $this->input->post('title',TRUE),
		'description' => $this->input->post('description',TRUE),
		'youtube_url' => $this->input->post('youtube_url',TRUE),
		'content' => $this->input->post('content'),
		'image' => $this->input->post('image',TRUE),
		'status' => $this->input->post('status',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->News_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('news'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->News_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('news/update_action'),
		'id' => set_value('id', $row->id),
		'title' => set_value('title', $row->title),
		'description' => set_value('description', $row->description),
		'youtube_url' => set_value('youtube_url', $row->youtube_url),
		'content' => set_value('content', $row->content),
		'image' => set_value('image', $row->image),
		'status' => set_value('status', $row->status),
		'date_created' => set_value('date_created', $row->date_created),
	    );
            $this->template->load('template','news_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('news'));
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
		'title' => $this->input->post('title',TRUE),
		'description' => $this->input->post('description',TRUE),
		'youtube_url' => $this->input->post('youtube_url',TRUE),
		'content' => $this->input->post('content'),
		'image' => $this->input->post('image',TRUE),
		'status' => $this->input->post('status',TRUE),
		'date_created' => $this->input->post('date_created',TRUE),
	    );

            $this->News_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('news'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->News_model->get_by_id($id);

        if ($row) {
            $this->News_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('news'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('news'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('title', 'title', 'trim|required');
	$this->form_validation->set_rules('description', 'description', 'trim|required');
	$this->form_validation->set_rules('youtube_url', 'youtube url', 'trim|required');
	$this->form_validation->set_rules('content', 'content', 'trim|required');
	$this->form_validation->set_rules('status', 'status', 'trim|required');
	$this->form_validation->set_rules('date_created', 'date created', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

    public function excel()
    {
        $this->load->helper('exportexcel');
        $namaFile = "news.xls";
        $judul = "news";
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
	xlsWriteLabel($tablehead, $kolomhead++, "Title");
	xlsWriteLabel($tablehead, $kolomhead++, "Description");
	xlsWriteLabel($tablehead, $kolomhead++, "Youtube Url");
	xlsWriteLabel($tablehead, $kolomhead++, "Content");
	xlsWriteLabel($tablehead, $kolomhead++, "Image");
	xlsWriteLabel($tablehead, $kolomhead++, "Status");
	xlsWriteLabel($tablehead, $kolomhead++, "Date Created");

	foreach ($this->News_model->get_all() as $data) {
            $kolombody = 0;

            //ubah xlsWriteLabel menjadi xlsWriteNumber untuk kolom numeric
            xlsWriteNumber($tablebody, $kolombody++, $nourut);
	    xlsWriteLabel($tablebody, $kolombody++, $data->title);
	    xlsWriteLabel($tablebody, $kolombody++, $data->description);
	    xlsWriteLabel($tablebody, $kolombody++, $data->youtube_url);
	    xlsWriteLabel($tablebody, $kolombody++, $data->content);
	    xlsWriteLabel($tablebody, $kolombody++, $data->image);
	    xlsWriteLabel($tablebody, $kolombody++, $data->status);
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
        header("Content-Disposition: attachment;Filename=news.doc");

        $data = array(
            'news_data' => $this->News_model->get_all(),
            'start' => 0
        );
        
        $this->load->view('news_doc',$data);
    }

}

/* End of file News.php */
/* Location: ./application/controllers/News.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2017-10-06 19:38:47 */
/* http://harviacode.com */
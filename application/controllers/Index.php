<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Index extends CI_Controller
{
    
        
    function __construct()
    {
        parent::__construct();
        $this->load->model('Index_model');
    }

    public function index()
    {
        $data = array();
        $data['banners_top'] = $this->Index_model->get_banners_by_position('TOP');
        $data['banners_subtop'] = $this->Index_model->get_banners_by_position('SUBTOP');
        $data['banners_middle'] = $this->Index_model->get_banners_by_position('MIDDLE');
        $data['banners_bottom'] = $this->Index_model->get_banners_by_position('BOTTOM');

        $data['new'] = $this->Index_model->get_product_by_cate(8,0);
        $data['sale'] = $this->Index_model->get_product_by_cate(3,8);
        $data['news'] = $this->Index_model->get_news(3,0);
        $data['logo'] = $this->Index_model->get_logo(10,0);
        $this->load->view('index',$data);
    }

	public function category($category_id=null)
    {
        $data = array();
        $page = 1;
        $sort = '';
        if (isset($_GET['sort']) && $_GET['sort'] != ''){
            $sort = $_GET['sort'];
        }
        $search = '';
        if (isset($_GET['search']) && $_GET['search'] != ''){
            $search = $_GET['search'];
        }
        $range_price = '';
        if (isset($_GET['min_price']) && $_GET['min_price'] != ''){
            $range_price = $_GET['min_price'].','.$_GET['max_price'];
        }
        if (isset($_GET['page']) && $_GET['page'] != ''){
            $page = $_GET['page'];
        }
        $data['page'] = $page;
        if (!empty($category_id)){
            $data['category'] = $this->Index_model->get_cate_by_id($category_id);
        }
        $data['products'] = $this->Index_model->get_product_by_cate(9,($page-1)*9,$category_id,$sort,$search,$range_price);
        $data['total'] = $this->Index_model->get_product_count($category_id,$sort,$search,$range_price);
        $data['categories'] = $this->Index_model->get_all_cate();
        $this->load->view('category1',$data);
    }    

    public function detail($id)
    {
        if ($this->input->server('REQUEST_METHOD') == 'POST'){
            if (isset($_POST['add-to-cart']) && $_POST['add-to-cart'] != ''){
                $product_id = $this->input->post('add-to-cart',true);
                $quantity = $this->input->post('quantity',true);
                $product_ids = $name = $this->session->userdata('cart');
                if (empty($product_ids)){
                    $product_ids = array();
                    $product = $this->Index_model->get_product_by_id($product_id);
                    $product->quantity = $quantity; 
                    $product_ids[] = $product;
                }else{
                    $found = 0;
                    foreach ($product_ids as $key => $value) {
                        if ($value->id == $product_id){
                            $product_ids[$key]->quantity += $quantity; 
                            $found = 1;
                        }
                    }
                    if ($found == 0){
                        $product = $this->Index_model->get_product_by_id($product_id);
                        $product->quantity = $quantity; 
                        $product_ids[] = $product;
                    }
                }

                $this->session->set_userdata('cart', $product_ids);
                header('Location: /index/cart/');
            }
        }
        $data = array();
		
        $data['product'] = $this->Index_model->get_product_by_id($id);
		
        $data['others'] = $this->Index_model->get_product_random(4,0,$data['product']->category_id);
        $data['categories'] = $this->Index_model->get_all_cate();
        $this->load->view('detail1',$data);
    }    

    public function sendMail($to,$subject,$message){
        $config = array(
          'protocol' => 'smtp',
          'smtp_host' => 'ssl://smtp.googlemail.com',
          'smtp_port' => 465,
          'smtp_user' => 'thiepcuoionline.vn@gmail.com',
          'smtp_pass' => '523/8ntp',
          'mailtype' => 'html',
          'charset' => 'utf-8',
          'wordwrap' => TRUE
        );

          $this->load->library('email', $config);
          $this->email->set_newline("\r\n");
          $this->email->from('thiepcuoionline.vn@gmail.com'); // change it to yours
          $this->email->to($to);// change it to yours
          $this->email->cc('thiepcuoionline.vn@gmail.com');// change it to yours
          $this->email->subject($subject);
          $this->email->message($message);
          if($this->email->send()){
                return true;
            }
            else
            {
                //show_error($this->email->print_debugger());
            }

    }

    public function cart(){
        $cart = $this->session->userdata('cart');

        if ($this->input->server('REQUEST_METHOD') == 'POST'){
            $customer = array(
                'name' => $this->input->post('billing_company'),
                'email' => $this->input->post('billing_email'),
                'phone' => $this->input->post('billing_phone'),
                'address' => $this->input->post('billing_address_1'),
                'date_created' => date('Y-m-d H:i:s')
            );
            $this->db->insert('customers', $customer);
            $customer_id = $this->db->insert_id();
            $content = '';
            $total = 0;
            foreach ($cart as $k => $v) {
                $content .= 'Sản phẩm:'.$v->name . ' |  Đơn giá: '. $v->price .'  | Số lượng:'.$v->quantity.'<br>';
                $total += $v->quantity * $v->price;
            }
            $discount = 0;
            $coupon = $this->session->userdata('coupon');
            if (count($coupon) > 0){
                $discount = $total * $coupon->discount/100;
                $content .= '<br>Giảm giá coupon ('.$coupon->code.'): '.number_format($discount);
            }

            $order = array(
                'order_code'=> rand(100,999).'-'.date('dm'),
                'customer_name'=> $this->input->post('billing_company'),
                'customer_id' => $customer_id,
                'delivery_address' => $this->input->post('billing_address_1'),
                'description' => $content,
                'total' => $total - $discount,
                'status' => 0,
                'date_created' => date('Y-m-d H:i:s'),
                'note' => 'Phone:'. $this->input->post('billing_phone') . ' - Email:'.$this->input->post('billing_email')
            );
            $this->db->insert('orders', $order);
            $order_id = $this->db->insert_id();

            $this->sendMail($this->input->post('billing_email'),'Đặt hàng thành công - '.$order['order_code'],'Chào bạn, <br><br> Chúng tôi vừa nhận được đơn đặt hàng từ bạn với nội dung<br>'.$content.' <br>Tổng tiền giảm:<b>'.number_format($discount).'</b><br>Tổng tiền đơn hàng: <b>'.number_format($total - $discount).'</b> <br><br>Chúng tôi sẽ liên lạc sớm cho bạn');
            $this->session->sess_destroy();
            header('Location: /index/index?order_code='.$order['order_code']);

        }
        $data = array();
        
        $data['product_ids'] = $cart;
        $total = 0;
        foreach ($data['product_ids'] as $key => $value) {
            $total = $total + ($value->price * $value->quantity);
        }
        $data['total'] = $total;
        $data['categories'] = $this->Index_model->get_all_cate();
        $data['coupon'] = $this->session->userdata('coupon');
        $this->load->view('cart',$data);
    }

    public function cart_remove($id){
        $product_ids = $name = $this->session->userdata('cart');
        if (empty($product_ids)){
            $product_ids = array();
        }
        foreach ($product_ids as $key => $value) {
            if ($value->id == $id){
                unset($product_ids[$key]);
            }
        }
        $this->session->set_userdata('cart', $product_ids);
        header('Location: /index/cart/');
    }

    public function cart_update(){
        if (isset($_POST['apply_coupon']) && $_POST['apply_coupon'] == 'Sử dụng'){
            $coupon = $this->Index_model->get_coupon_by_code(trim($_POST['coupon_code']));
            if (count($coupon) == false){
                $this->session->unset_userdata('coupon');
                header('Location: /index/cart/?msg=Coupon không hợp lệ!');
            }else{
                $this->session->set_userdata('coupon', $coupon);
                header('Location: /index/cart/?msg=Coupon sử dụng thành công!');
            }
        }
        $cart = $this->input->post('cart',true);
        $product_ids = $this->session->userdata('cart');
        if (empty($product_ids)){
            $product_ids = array();
        }
        foreach ($product_ids as $key => $value) {
            foreach ($cart as $k => $v) {
                if ($k == $value->id){
                    $product_ids[$key]->quantity = $v['qty'];
                }
            }
        }
        $this->session->set_userdata('cart', $product_ids);
        header('Location: /index/cart/');
    }

    public function track(){
        $data = array();
        if ($this->input->server('REQUEST_METHOD') == 'POST'){
            if ((isset($_POST['orderid']) && $_POST['orderid'] != '') || (isset($_POST['order_email']) && $_POST['order_email'] != '')){
                $orderid = $this->input->post('orderid',true);
                $order_email = $this->input->post('order_email',true);

                $order = $this->Index_model->get_order_by_code_email($orderid,$order_email);
                $msg = '';

                if (count($order) > 0){
                    $msg = 'Đơn hàng '. $order->order_code.' ==> ';
                    $column_comments = explode(',', '0:Đặt hàng thành công,1:Đang xử lý,2:Chưa thanh toán,3:Đang giao hàng,4:Đã giao hàng,5:Đơn hàng hủy');
                    foreach ($column_comments as $value) {
                        $value = explode(':', $value);
                        if ($order->status == $value[0]){ $msg .= $value[1]; }
                    } 
                }
                $data['msg'] = $msg;
            }
        }
        $data['categories'] = $this->Index_model->get_all_cate();
        $this->load->view('track',$data);
    }

    public function blog_detail($alias,$id){
        $news = $this->Index_model->get_news_by_id($id);
        $data['news'] = $news;
        $data['categories'] = $this->Index_model->get_all_cate();
        $this->load->view('content',$data);
    }

    public function about(){
        $data = array();
        $data['categories'] = $this->Index_model->get_all_cate();
        $this->load->view('about',$data);
    }

    public function contact(){
        if ($this->input->server('REQUEST_METHOD') == 'POST'){
            $your_name = $this->input->post('your-name',true);
            $your_email = $this->input->post('your-email',true);
            $your_subject = $this->input->post('your-subject',true);
            $your_message = $this->input->post('your-message',true);

            $this->sendMail($your_email,'Thông tin liên hệ thiepcuoionline.vn - '.$your_name,'Chào bạn, <br><br> Chúng tôi đã nhận được liên hệ từ bạn với nội dung<br><hr><br><b>Tiêu đề:</b><br>'.$your_subject.' <br><br><b>Nội dung:</b><br>'.$your_message.'<br><br>Chúng tôi sẽ liên lạc sớm cho bạn');
            header('Content-Type: application/json');
            die(json_encode(array('into'=>'jksjlad','status'=>'mail_sent','message'=>'Cảm ơn bạn đã liên hệ')));
        }
        $data = array();
        $data['categories'] = $this->Index_model->get_all_cate();
        $this->load->view('contact',$data);
    }

    public function blog(){
        $news = $this->Index_model->get_news(100,0);
        $data['categories'] = $this->Index_model->get_all_cate();
        $data['news'] = $news;

        $this->load->view('blog',$data);
    }

}


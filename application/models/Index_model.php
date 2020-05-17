<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Index_model extends CI_Model
{

    function __construct(){
        parent::__construct();
    }


    function get_all_cate()
    {
        return $this->db->order_by('date_created','desc')->get('categories')->result();
    }

    function get_cate_by_id($id=null)
    {
        $this->db->where('id', $id);
        return $this->db->get('categories')->row();
    }

    function get_banners_by_position($position) {
        $this->db->select();
        $this->db->from('banners'); 
        $this->db->where('position',$position);
        return $this->db->get()->result();
    }   

    function get_coupon_by_code($code) {
        $this->db->select();
        $this->db->from('coupon'); 
        $this->db->where('code',$code);
        $this->db->where("from_date <= '".date('Y-m-d H:i:s')."'");
        $this->db->where("to_date >= '".date('Y-m-d H:i:s')."'");
        $ok = $this->db->get()->row();
        return $ok;
    }   

    function get_product_by_cate($limit, $start = 0, $category_id = NULL,$sort='',$search='',$range_price='') {
        $this->db->select('products.*,categories.name as category_name');
        $this->db->from('products'); 
        $this->db->join('categories', 'categories.id=products.category_id');
        if ($category_id != NULL){
            $this->db->where('category_id',$category_id);
        }
        if ($sort != ''){
            switch ($sort) {
                case '1':
                    $this->db->order_by('products.date_created','desc');
                    break;
                case '2':
                    $this->db->order_by('price','asc');
                    break;
               case '3':
                    $this->db->order_by('price','desc');
                    break; 
                case '4':
                    $this->db->order_by('products.date_created','asc');
                    break;
                
                default:
                    $this->db->order_by('products.date_created','desc');
                    break;
            }
        }else{
			$this->db->order_by('products.date_created','desc');
		}
        if ($search != ''){
            $this->db->like('products.name',$search);
        }
        if ($range_price != ''){
            $range_price = explode(',', $range_price);
            $this->db->where('products.price >=', $range_price[0]);
            $this->db->where('products.price <=', $range_price[1]);
        }
    	$this->db->limit($limit, $start);
        return $this->db->get()->result();
    }

    function get_product_random($limit, $start = 0,$cate=0) {
        $this->db->select('products.*,categories.name as category_name');
        $this->db->from('products'); 
        $this->db->join('categories', 'categories.id=products.category_id');
		if ($cate != 0){
			$this->db->where('categories.id',$cate);
		}
		
        $this->db->order_by('RAND()');
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }

    function get_product_by_id($product_id) {
        $this->db->select('products.*,categories.name as category_name');
        $this->db->from('products'); 
        $this->db->join('categories', 'categories.id=products.category_id');
        $this->db->order_by('products.date_created');
        
        $this->db->where('products.id',$product_id);
        return $this->db->get()->row();
    }

    function get_order_by_code_email($order_code,$email) {
        $this->db->select();
        $this->db->from('orders'); 
        if ($order_code != ''){
            $this->db->or_where('orders.order_code',$order_code);    
        }
        if ($email != ''){
            $this->db->or_like('orders.note',$email);    
        }
        
        return $this->db->get()->row();
    }

    function get_news_by_id($id) {
        $this->db->select();
        $this->db->from('news'); 
        
        $this->db->or_where('id',$id);    
        
        return $this->db->get()->row();
    }


    function get_product_count($category_id = NULL,$sort='',$search='',$range_price='') {
        $this->db->select('count(*) as total');
        $this->db->from('products'); 
        $this->db->join('categories', 'categories.id=products.category_id');
        if ($category_id != NULL){
            $this->db->where('category_id',$category_id);
        }
        if ($sort != ''){
            switch ($sort) {
                case '1':
                    $this->db->order_by('products.date_created','desc');
                    break;
                case '2':
                    $this->db->order_by('price','asc');
                    break;
               case '3':
                    $this->db->order_by('price','desc');
                    break;
                case '4':
                    $this->db->order_by('products.date_created','asc');
                    break;
                
                default:
                    $this->db->order_by('products.date_created','desc');
                    break;
            }
        }
        if ($search != ''){
            $this->db->like('products.name',$search);
        }
        if ($range_price != ''){
            $range_price = explode(',', $range_price);
            $this->db->where('products.price >=', $range_price[0]);
            $this->db->where('products.price <=', $range_price[1]);
        }

        $result = $this->db->get()->row();
        return $result->total;
    }

    function get_news($limit, $start = 0) {
        $this->db->select();
        $this->db->from('news'); 
        $this->db->order_by('news.date_created');
        
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }    

    function get_logo($limit, $start = 0) {
        $this->db->select();
        $this->db->from('logos');         
        $this->db->limit($limit, $start);
        return $this->db->get()->result();
    }  


}

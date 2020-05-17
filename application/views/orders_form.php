<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        ORDERS
                        <small>Chỉnh sửa</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='<?php echo site_url('orders') ?>'>orders</a></li>
                        <li class='active'>chỉnh sửa</li>
                    </ol>
                </section>
                <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                
                  <h3 class='box-title'>ORDERS</h3>
                      <div class='box box-primary'>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"><table class='table table-bordered'>
	    <tr><td>Order Code <?php echo form_error('order_code') ?></td>
            <td><input type="text" class="form-control" name="order_code" id="order_code" placeholder="Order Code" value="<?php echo $order_code; ?>" />
        </td>
	    <tr><td>Customer Name <?php echo form_error('customer_name') ?></td>
            <td><input type="text" class="form-control" name="customer_name" id="customer_name" placeholder="Customer Name" value="<?php echo $customer_name; ?>" />
        </td>
	    <tr><td>Customer Id <?php echo form_error('customer_id') ?></td>
            <td><input type="text" class="form-control" name="customer_id" id="customer_id" placeholder="Customer Id" value="<?php echo $customer_id; ?>" />
        </td>
	    <tr><td>Delivery Address <?php echo form_error('delivery_address') ?></td>
            <td><input type="text" class="form-control" name="delivery_address" id="delivery_address" placeholder="Delivery Address" value="<?php echo $delivery_address; ?>" />
        </td>
	    <tr><td>Description <?php echo form_error('description') ?></td>
            <td><textarea class="form-control" rows="3" name="description" id="description" placeholder="Description"><?php echo $description; ?></textarea>
        </td></tr>
	    <tr><td>Total <?php echo form_error('total') ?></td>
            <td><input type="text" class="form-control" name="total" id="total" placeholder="Total" value="<?php echo $total; ?>" />
        </td>
	    <tr><td>Status</td><td><select class="form-control" name="status" id="status">  <?php $column_comments = explode(',', '0:Đặt hàng thành công,1:Đang xử lý,2:Chưa thanh toán,3:Đang giao hàng,4:Đã giao hàng,5:Đơn hàng hủy');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($status == $value[0]){ echo '<option selected value='.$value[0].'>'. $value[1] . '</option>'; }else{ echo '<option value='.$value[0].'>'. $value[1] . '</option>'; }
            } ?></select></td>
	    <tr><td>Note <?php echo form_error('note') ?></td>
            <td><input type="text" class="form-control" name="note" id="note" placeholder="Note" value="<?php echo $note; ?>" />
        </td>
	    <tr><td>Date Created <?php echo form_error('date_created') ?></td>
            <td><input type="text" class="form-control" name="date_created" id="date_created" placeholder="Date Created" value="<?php echo $date_created; ?>" />
        </td>
	    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <tr><td colspan='2'><button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('orders') ?>" class="btn btn-default">Cancel</a></td></tr>
	
    </table></form>
    </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
<!-- CK Editor -->
<script src='https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js'></script>
<!-- Bootstrap WYSIHTML5 -->
<script>
    $('#date_created').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd'
    });

    try{
        CKEDITOR.replace('content');        
    }catch(err){

    }
    
</script>

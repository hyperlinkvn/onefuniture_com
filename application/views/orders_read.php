
<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        ORDERS
                        <small>Xem</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='<?php echo site_url('orders') ?>'>orders</a></li>
                        <li class='active'>xem</li>
                    </ol>
                </section>

        <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                <h3 class='box-title'>Orders Read</h3>
        <table class="table table-bordered">
	    <tr><td>Order Code</td><td><?php echo $order_code; ?></td>
	    <tr><td>Customer Name</td><td><?php echo $customer_name; ?></td>
	    <tr><td>Customer Id</td><td><?php echo $customer_id; ?></td>
	    <tr><td>Delivery Address</td><td><?php echo $delivery_address; ?></td>
	    <tr><td>Description</td><td><?php echo $description; ?></td>
	    <tr><td>Total</td><td><?php echo $total; ?></td>
	    <tr><td>Status</td><td><?php $column_comments = explode(',', '0:Đặt hàng thành công,1:Đang xử lý,2:Chưa thanh toán,3:Đang giao hàng,4:Đã giao hàng,5:Đơn hàng hủy');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($status == $value[0]){ echo $value[1]; }
            } ?></td>
	    <tr><td>Note</td><td><?php echo $note; ?></td>
	    <tr><td>Date Created</td><td><?php echo $date_created; ?></td>
	    <tr><td></td><td><a href="<?php echo site_url('orders') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
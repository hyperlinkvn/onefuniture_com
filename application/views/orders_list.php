
<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        ORDERS
                        <small>Danh sách</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='#'>orders</a></li>
                        <li class='active'>danh sách</li>
                    </ol>
                </section>
                
        <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                  <h3 class='box-title'><?php echo anchor('orders/create/','Create',array('class'=>'btn btn-danger btn-sm'));?>
		<?php echo anchor(site_url('orders/excel'), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-primary btn-sm"'); ?>
		<?php echo anchor(site_url('orders/word'), '<i class="fa fa-file-word-o"></i> Word', 'class="btn btn-primary btn-sm"'); ?>
		<?php echo anchor(site_url('orders/pdf'), '<i class="fa fa-file-pdf-o"></i> PDF', 'class="btn btn-primary btn-sm"'); ?></h3>
                </div><!-- /.box-header -->
                <div class='box-body'>
        <table class="table table-bordered table-striped" id="mytable">
            <thead>
                <tr>
                    <th width="80px">No</th>
		    <th>Order Code</th>
		    <th>Customer Name</th>
		    <th>Customer Id</th>
		    <th>Delivery Address</th>
		    <th>Description</th>
		    <th>Total</th>
		    <th>Status</th>
		    <th>Note</th>
		    <th>Date Created</th>
		    <th>Action</th>
                </tr>
            </thead>
	    <tbody>
            <?php
            $start = 0;
            foreach ($orders_data as $orders)
            {
                ?>
                <tr>
		    <td><?php echo ++$start ?></td>
		    <td><?php echo $orders->order_code ?></td>
		    <td><?php echo $orders->customer_name ?></td>
		    <td><?php echo $orders->customer_id ?></td>
		    <td><?php echo $orders->delivery_address ?></td>
		    <td><?php echo $orders->description ?></td>
		    <td><?php echo $orders->total ?></td>
		    <td><?php $column_comments = explode(',', '0:Đặt hàng thành công,1:Đang xử lý,2:Chưa thanh toán,3:Đang giao hàng,4:Đã giao hàng,5:Đơn hàng hủy');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($orders->status == $value[0]){ echo $value[1]; }
            } ?></td>
		    <td><?php echo $orders->note ?></td>
		    <td><?php echo $orders->date_created ?></td>
		    <td style="text-align:center" width="140px">
			<?php 
			echo anchor(site_url('orders/read/'.$orders->id),'<i class="fa fa-eye"></i>',array('title'=>'detail','class'=>'btn btn-success btn-sm')); 
			echo '  '; 
			echo anchor(site_url('orders/update/'.$orders->id),'<i class="fa fa-pencil-square-o"></i>',array('title'=>'edit','class'=>'btn btn-warning btn-sm')); 
			echo '  '; 
			echo anchor(site_url('orders/delete/'.$orders->id),'<i class="fa fa-trash-o"></i>','title="delete" class="btn btn-danger btn-sm" onclick="javasciprt: return confirm(\'Are You Sure ?\')"'); 
			?>
		    </td>
	        </tr>
                <?php
            }
            ?>
            </tbody>
        </table>
        <script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js') ?>"></script>
        <script src="<?php echo base_url('assets/datatables/jquery.dataTables.js') ?>"></script>
        <script src="<?php echo base_url('assets/datatables/dataTables.bootstrap.js') ?>"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#mytable").dataTable();
            });
        </script>
                    </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->

<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        COUPON
                        <small>Xem</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='<?php echo site_url('coupon') ?>'>coupon</a></li>
                        <li class='active'>xem</li>
                    </ol>
                </section>

        <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                <h3 class='box-title'>Coupon Read</h3>
        <table class="table table-bordered">
	    <tr><td>Code</td><td><?php echo $code; ?></td>
	    <tr><td>Category Id</td><td><?php $column_comments = explode(',', '3:Thiệp cưới hiện đại,1:Thiệp cưới truyền thống,2:Thiệp cưới Vintage,4:Thiệp cưới khuyến mãi');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($category_id == $value[0]){ echo $value[1]; }
            } ?></td>
	    <tr><td>From Date</td><td><?php echo $from_date; ?></td>
	    <tr><td>To Date</td><td><?php echo $to_date; ?></td>
	    <tr><td>Total</td><td><?php echo $total; ?></td>
	    <tr><td>Discount</td><td><?php echo $discount; ?></td>
	    <tr><td>Date Created</td><td><?php echo $date_created; ?></td>
	    <tr><td></td><td><a href="<?php echo site_url('coupon') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
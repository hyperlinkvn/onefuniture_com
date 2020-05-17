
<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        BANNERS
                        <small>Xem</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='<?php echo site_url('banners') ?>'>banners</a></li>
                        <li class='active'>xem</li>
                    </ol>
                </section>

        <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                <h3 class='box-title'>Banners Read</h3>
        <table class="table table-bordered">
	    <tr><td>Name</td><td><?php echo $name; ?></td>
	    <tr><td>Image</td><td><img style='width:300px;height:auto;' src='/uploads/images/<?php echo $image; ?>' width='50px' height='50px' /></td>
	    <tr><td>Small Text</td><td><?php echo $small_text; ?></td>
	    <tr><td>Big Text</td><td><?php echo $big_text; ?></td>
	    <tr><td>Url</td><td><?php echo $url; ?></td>
	    <tr><td>Position</td><td><?php $column_comments = explode(',', 'TOP:TOP,SUBTOP:SUBTOP,MIDDLE:MIDDLE,BOTTOM:BOTTOM');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($position == $value[0]){ echo $value[1]; }
            } ?></td>
	    <tr><td>Date Created</td><td><?php echo $date_created; ?></td>
	    <tr><td></td><td><a href="<?php echo site_url('banners') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->

<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        MENU
                        <small>Xem</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='<?php echo site_url('menu') ?>'>menu</a></li>
                        <li class='active'>xem</li>
                    </ol>
                </section>

        <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                <h3 class='box-title'>Menu Read</h3>
        <table class="table table-bordered">
	    <tr><td>Name</td><td><?php echo $name; ?></td>
	    <tr><td>Link</td><td><?php echo $link; ?></td>
	    <tr><td>Icon</td><td><?php echo $icon; ?></td>
	    <tr><td>Is Active</td><td><?php $column_comments = explode(',', '1:Enable,0:Disable');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($is_active == $value[0]){ echo $value[1]; }
            } ?></td>
	    <tr><td>Is Parent</td><td><?php echo $is_parent; ?></td>
	    <tr><td></td><td><a href="<?php echo site_url('menu') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
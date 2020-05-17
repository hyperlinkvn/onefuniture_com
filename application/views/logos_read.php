
<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        LOGOS
                        <small>Xem</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='<?php echo site_url('logos') ?>'>logos</a></li>
                        <li class='active'>xem</li>
                    </ol>
                </section>

        <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                <h3 class='box-title'>Logos Read</h3>
        <table class="table table-bordered">
	    <tr><td>Name</td><td><?php echo $name; ?></td>
	    <tr><td>Image</td><td><img style='width:300px;height:auto;' src='/uploads/images/<?php echo $image; ?>' width='50px' height='50px' /></td>
	    <tr><td>Url</td><td><?php echo $url; ?></td>
	    <tr><td></td><td><a href="<?php echo site_url('logos') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
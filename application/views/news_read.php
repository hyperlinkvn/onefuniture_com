
<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        NEWS
                        <small>Xem</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='<?php echo site_url('news') ?>'>news</a></li>
                        <li class='active'>xem</li>
                    </ol>
                </section>

        <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                <h3 class='box-title'>News Read</h3>
        <table class="table table-bordered">
	    <tr><td>Title</td><td><?php echo $title; ?></td>
	    <tr><td>Description</td><td><?php echo $description; ?></td>
	    <tr><td>Youtube Url</td><td><?php echo $youtube_url; ?></td>
	    <tr><td>Content</td><td><?php echo $content; ?></td>
	    <tr><td>Image</td><td><img style='width:300px;height:auto;' src='/uploads/images/<?php echo $image; ?>' width='50px' height='50px' /></td>
	    <tr><td>Status</td><td><?php $column_comments = explode(',', '1:Enable,0:Disable');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($status == $value[0]){ echo $value[1]; }
            } ?></td>
	    <tr><td>Date Created</td><td><?php echo $date_created; ?></td>
	    <tr><td></td><td><a href="<?php echo site_url('news') ?>" class="btn btn-default">Cancel</a></td></tr>
	</table>
        </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
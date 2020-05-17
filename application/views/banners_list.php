
<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        BANNERS
                        <small>Danh sách</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='#'>banners</a></li>
                        <li class='active'>danh sách</li>
                    </ol>
                </section>
                
        <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                  <h3 class='box-title'><?php echo anchor('banners/create/','Create',array('class'=>'btn btn-danger btn-sm'));?>
		<?php echo anchor(site_url('banners/excel'), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-primary btn-sm"'); ?>
		<?php echo anchor(site_url('banners/word'), '<i class="fa fa-file-word-o"></i> Word', 'class="btn btn-primary btn-sm"'); ?>
		<?php echo anchor(site_url('banners/pdf'), '<i class="fa fa-file-pdf-o"></i> PDF', 'class="btn btn-primary btn-sm"'); ?></h3>
                </div><!-- /.box-header -->
                <div class='box-body'>
        <table class="table table-bordered table-striped" id="mytable">
            <thead>
                <tr>
                    <th width="80px">No</th>
		    <th>Name</th>
		    <th>Image</th>
		    <th>Small Text</th>
		    <th>Big Text</th>
		    <th>Url</th>
		    <th>Position</th>
		    <th>Date Created</th>
		    <th>Action</th>
                </tr>
            </thead>
	    <tbody>
            <?php
            $start = 0;
            foreach ($banners_data as $banners)
            {
                ?>
                <tr>
		    <td><?php echo ++$start ?></td>
		    <td><?php echo $banners->name ?></td>
		    <td><img src='/uploads/images/<?php echo $banners->image ?>' width='50px' height='50px' /></td>
		    <td><?php echo $banners->small_text ?></td>
		    <td><?php echo $banners->big_text ?></td>
		    <td><?php echo $banners->url ?></td>
		    <td><?php $column_comments = explode(',', 'TOP:TOP,SUBTOP:SUBTOP,MIDDLE:MIDDLE,BOTTOM:BOTTOM');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($banners->position == $value[0]){ echo $value[1]; }
            } ?></td>
		    <td><?php echo $banners->date_created ?></td>
		    <td style="text-align:center" width="140px">
			<?php 
			echo anchor(site_url('banners/read/'.$banners->id),'<i class="fa fa-eye"></i>',array('title'=>'detail','class'=>'btn btn-success btn-sm')); 
			echo '  '; 
			echo anchor(site_url('banners/update/'.$banners->id),'<i class="fa fa-pencil-square-o"></i>',array('title'=>'edit','class'=>'btn btn-warning btn-sm')); 
			echo '  '; 
			echo anchor(site_url('banners/delete/'.$banners->id),'<i class="fa fa-trash-o"></i>','title="delete" class="btn btn-danger btn-sm" onclick="javasciprt: return confirm(\'Are You Sure ?\')"'); 
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
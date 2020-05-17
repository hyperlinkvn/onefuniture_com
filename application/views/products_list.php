
<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        PRODUCTS
                        <small>Danh sách</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='#'>products</a></li>
                        <li class='active'>danh sách</li>
                    </ol>
                </section>
                
        <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                  <h3 class='box-title'><?php echo anchor('products/create/','Create',array('class'=>'btn btn-danger btn-sm'));?>
		<?php echo anchor(site_url('products/excel'), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-primary btn-sm"'); ?>
		<?php echo anchor(site_url('products/word'), '<i class="fa fa-file-word-o"></i> Word', 'class="btn btn-primary btn-sm"'); ?>
		<?php echo anchor(site_url('products/pdf'), '<i class="fa fa-file-pdf-o"></i> PDF', 'class="btn btn-primary btn-sm"'); ?></h3>
                </div><!-- /.box-header -->
                <div class='box-body'>
        <table class="table table-bordered table-striped" id="mytable">
            <thead>
                <tr>
                    <th width="80px">No</th>
		    <th>Name</th>
		    <th>Description</th>
		    <th>Category Id</th>
		    <th>Price</th>
		    <th>Cost</th>
		    <th>Image</th>
		    <th>Status</th>
		    <th>Option Ids</th>
		    <!-- <th>Content</th> -->
		    <th>Date Created</th>
		    <th>Action</th>
                </tr>
            </thead>
	    <tbody>
            <?php
            $start = 0;
            foreach ($products_data as $products)
            {
                ?>
                <tr>
		    <td><?php echo ++$start ?></td>
		    <td><?php echo $products->name ?></td>
		    <td><?php echo $products->description ?></td>
		    <td><?php $column_comments = explode(',', '1:Thiệp cưới hiện đại,2:Thiệp cưới phong cách,3:Thiệp cưới cổ điển,4:Thiệp cưới khuyến mãi');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($products->category_id == $value[0]){ echo $value[1]; }
            } ?></td>
		    <td><?php echo $products->price ?></td>
		    <td><?php echo $products->cost ?></td>
		    <td><img src='/uploads/images/<?php $products->image = explode(',', $products->image); echo @$products->image[0]; ?>' width='50px' height='50px' /></td>
		    <td><?php $column_comments = explode(',', '1:Enable,0:Disable');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($products->status == $value[0]){ echo $value[1]; }
            } ?></td>
		    <td><?php echo $products->option_ids ?></td>
		    <!-- <td><?php echo $products->content ?></td> -->
		    <td><?php echo $products->date_created ?></td>
		    <td style="text-align:center" width="140px">
			<?php 
			echo anchor(site_url('products/read/'.$products->id),'<i class="fa fa-eye"></i>',array('title'=>'detail','class'=>'btn btn-success btn-sm')); 
			echo '  '; 
			echo anchor(site_url('products/update/'.$products->id),'<i class="fa fa-pencil-square-o"></i>',array('title'=>'edit','class'=>'btn btn-warning btn-sm')); 
			echo '  '; 
			echo anchor(site_url('products/delete/'.$products->id),'<i class="fa fa-trash-o"></i>','title="delete" class="btn btn-danger btn-sm" onclick="javasciprt: return confirm(\'Are You Sure ?\')"'); 
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
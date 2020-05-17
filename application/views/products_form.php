<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        PRODUCTS
                        <small>Chỉnh sửa</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='<?php echo site_url('products') ?>'>products</a></li>
                        <li class='active'>chỉnh sửa</li>
                    </ol>
                </section>
                <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                
                  <h3 class='box-title'>PRODUCTS</h3>
                      <div class='box box-primary'>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"><table class='table table-bordered'>
	    <tr><td>Name <?php echo form_error('name') ?></td>
            <td><input type="text" class="form-control" name="name" id="name" placeholder="Name" value="<?php echo $name; ?>" />
        </td>
	    <tr><td>Description <?php echo form_error('description') ?></td>
            <td><textarea class="form-control" rows="3" name="description" id="description" placeholder="Description"><?php echo $description; ?></textarea>
        </td></tr>
	    <tr><td>Category Id</td><td><select class="form-control" name="category_id" id="category_id">  <?php $column_comments = explode(',', '1:Thiệp cưới hiện đại,2:Thiệp cưới phong cách,3:Thiệp cưới cổ điển,4:Thiệp cưới in hình,5:Thiệp cưới truyền thống,6:Thiệp khuyến mãi');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($category_id == $value[0]){ echo '<option selected value='.$value[0].'>'. $value[1] . '</option>'; }else{ echo '<option value='.$value[0].'>'. $value[1] . '</option>'; }
            } ?></select></td>
	    <tr><td>Price <?php echo form_error('price') ?></td>
            <td><input type="text" class="form-control" name="price" id="price" placeholder="Price" value="<?php echo $price; ?>" />
        </td>
	    <tr><td>Cost <?php echo form_error('cost') ?></td>
            <td><input type="text" class="form-control" name="cost" id="cost" placeholder="Cost" value="<?php echo $cost; ?>" />
        </td>
	    <tr><td>Image <?php echo form_error('image'); $image=explode(',', $image);  ?></td>
            <td><input type='hidden' id='image_hidden' name='image_hidden' value="<?php echo @$image[0]; ?>" /> <input type="file" class="form-control" name="image" id="image" placeholder="Image"; /><br>
              <input type='hidden' id='image_hidden1' name='image_hidden1' value="<?php echo @$image[1]; ?>" /> <input type="file" class="form-control" name="image1" id="image1" placeholder="Image"; /><br>
              <input type='hidden' id='image_hidden2' name='image_hidden2' value="<?php echo @$image[2]; ?>" /> <input type="file" class="form-control" name="image2" id="image2" placeholder="Image"; />
        </td>
	    <tr><td>Status</td><td><select class="form-control" name="status" id="status">  <?php $column_comments = explode(',', '1:Enable,0:Disable');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($status == $value[0]){ echo '<option selected value='.$value[0].'>'. $value[1] . '</option>'; }else{ echo '<option value='.$value[0].'>'. $value[1] . '</option>'; }
            } ?></select></td>
	    <tr><td>Option Ids <?php echo form_error('option_ids') ?></td>
            <td><input type="text" class="form-control" name="option_ids" id="option_ids" placeholder="Option Ids" value="<?php echo $option_ids; ?>" />
        </td>
	    <tr><td>Content <?php echo form_error('content') ?></td>
            <td><textarea class="form-control" rows="3" name="content" id="content" placeholder="Content"><?php echo $content; ?></textarea>
        </td></tr>
	    <tr><td>Date Created <?php echo form_error('date_created') ?></td>
            <td><input type="text" class="form-control" name="date_created" id="date_created" placeholder="Date Created" value="<?php echo $date_created; ?>" />
        </td>
	    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <tr><td colspan='2'><button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('products') ?>" class="btn btn-default">Cancel</a></td></tr>
	
    </table></form>
    </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
<!-- CK Editor -->
<script src='/assets/ckeditor/ckeditor.js'></script>
<!-- Bootstrap WYSIHTML5 -->
<link href='https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css' rel='stylesheet' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js'></script>
<script>
    $('#date_created').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd'
    });

  $('#from_date').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd'
    });

  $('#to_date').datepicker({
      autoclose: true,
      format: 'yyyy-mm-dd'
    });

    try{
        CKEDITOR.replace('content');        
    }catch(err){

    }
    $('.ajax-select2').select2({
        placeholder: 'Select ' + $('.ajax-select2').data('table'),
        ajax: {
          url: '/admin/ajax/' + $('.ajax-select2').data('table'),
          dataType: 'json',
          delay: 250,
          processResults: function (data) {
            return {
              results: data
            };
          },
          cache: true
        }
    });
    $('.select2-container').css('width','100%');
    $('.select2-container .select2-selection--single').css('height','32px').css('border-radius','0px');
    $('.select2-container--default .select2-selection--single').css('border','solid 1px #d2d6de');
</script>

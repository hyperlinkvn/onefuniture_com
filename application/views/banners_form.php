<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        BANNERS
                        <small>Chỉnh sửa</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='<?php echo site_url('banners') ?>'>banners</a></li>
                        <li class='active'>chỉnh sửa</li>
                    </ol>
                </section>
                <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                
                  <h3 class='box-title'>BANNERS</h3>
                      <div class='box box-primary'>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"><table class='table table-bordered'>
	    <tr><td>Name <?php echo form_error('name') ?></td>
            <td><input type="text" class="form-control" name="name" id="name" placeholder="Name" value="<?php echo $name; ?>" />
        </td>
	    <tr><td>Image <?php echo form_error('image') ?></td>
            <td><input type='hidden' id='image_hidden' name='image_hidden' value="<?php echo $image; ?>" /> <input type="file" class="form-control" name="image" id="image" placeholder="Image"; />
        </td>
	    <tr><td>Small Text <?php echo form_error('small_text') ?></td>
            <td><input type="text" class="form-control" name="small_text" id="small_text" placeholder="Small Text" value="<?php echo $small_text; ?>" />
        </td>
	    <tr><td>Big Text <?php echo form_error('big_text') ?></td>
            <td><input type="text" class="form-control" name="big_text" id="big_text" placeholder="Big Text" value="<?php echo $big_text; ?>" />
        </td>
	    <tr><td>Url <?php echo form_error('url') ?></td>
            <td><input type="text" class="form-control" name="url" id="url" placeholder="Url" value="<?php echo $url; ?>" />
        </td>
	    <tr><td>Position</td><td><select class="form-control" name="position" id="position">  <?php $column_comments = explode(',', 'TOP:TOP,SUBTOP:SUBTOP,MIDDLE:MIDDLE,BOTTOM:BOTTOM');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($position == $value[0]){ echo '<option selected value='.$value[0].'>'. $value[1] . '</option>'; }else{ echo '<option value='.$value[0].'>'. $value[1] . '</option>'; }
            } ?></select></td>
	    <tr><td>Date Created <?php echo form_error('date_created') ?></td>
            <td><input type="text" class="form-control" name="date_created" id="date_created" placeholder="Date Created" value="<?php echo $date_created; ?>" />
        </td>
	    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <tr><td colspan='2'><button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('banners') ?>" class="btn btn-default">Cancel</a></td></tr>
	
    </table></form>
    </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
<!-- CK Editor -->
<script src='https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js'></script>
<!-- Bootstrap WYSIHTML5 -->
<link href='https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css' rel='stylesheet' />
<script src='https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js'></script>
<script>
    $('#date_created').datepicker({
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

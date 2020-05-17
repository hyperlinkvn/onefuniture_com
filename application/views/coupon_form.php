<!-- Content Header (Page header) -->
                <section class='content-header'>
                    <h1>
                        COUPON
                        <small>Chỉnh sửa</small>
                    </h1>
                    <ol class='breadcrumb'>
                        <li><a href='/admin/'><i class='fa fa-dashboard'></i> Home</a></li>
                        <li><a href='<?php echo site_url('coupon') ?>'>coupon</a></li>
                        <li class='active'>chỉnh sửa</li>
                    </ol>
                </section>
                <!-- Main content -->
        <section class='content'>
          <div class='row'>
            <div class='col-xs-12'>
              <div class='box'>
                <div class='box-header'>
                
                  <h3 class='box-title'>COUPON</h3>
                      <div class='box box-primary'>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data"><table class='table table-bordered'>
	    <tr><td>Code <?php echo form_error('code') ?></td>
            <td><input type="text" class="form-control" name="code" id="code" placeholder="Code" value="<?php echo $code; ?>" />
        </td>
	    <tr><td>Category Id</td><td><select class="form-control" name="category_id" id="category_id">  <?php $column_comments = explode(',', '3:Thiệp cưới hiện đại,1:Thiệp cưới truyền thống,2:Thiệp cưới Vintage,4:Thiệp cưới khuyến mãi');
            foreach ($column_comments as $value) {
                $value = explode(':', $value);
                if ($category_id == $value[0]){ echo '<option selected value='.$value[0].'>'. $value[1] . '</option>'; }else{ echo '<option value='.$value[0].'>'. $value[1] . '</option>'; }
            } ?></select></td>
	    <tr><td>From Date <?php echo form_error('from_date') ?></td>
            <td><input type="text" class="form-control" name="from_date" id="from_date" placeholder="From Date" value="<?php echo $from_date; ?>" />
        </td>
	    <tr><td>To Date <?php echo form_error('to_date') ?></td>
            <td><input type="text" class="form-control" name="to_date" id="to_date" placeholder="To Date" value="<?php echo $to_date; ?>" />
        </td>
	    <tr><td>Total <?php echo form_error('total') ?></td>
            <td><input type="text" class="form-control" name="total" id="total" placeholder="Total" value="<?php echo $total; ?>" />
        </td>
	    <tr><td>Discount <?php echo form_error('discount') ?></td>
            <td><input type="text" class="form-control" name="discount" id="discount" placeholder="Discount" value="<?php echo $discount; ?>" />
        </td>
	    <tr><td>Date Created <?php echo form_error('date_created') ?></td>
            <td><input type="text" class="form-control" name="date_created" id="date_created" placeholder="Date Created" value="<?php echo $date_created; ?>" />
        </td>
	    <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
	    <tr><td colspan='2'><button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
	    <a href="<?php echo site_url('coupon') ?>" class="btn btn-default">Cancel</a></td></tr>
	
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

<!doctype html>
<html>
    <head>
        <title>harviacode.com - codeigniter crud generator</title>
        <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css') ?>"/>
        <style>
            .word-table {
                border:1px solid black !important; 
                border-collapse: collapse !important;
                width: 100%;
            }
            .word-table tr th, .word-table tr td{
                border:1px solid black !important; 
                padding: 5px 10px;
            }
        </style>
    </head>
    <body>
        <h2>Coupon List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Code</th>
		<th>Category Id</th>
		<th>From Date</th>
		<th>To Date</th>
		<th>Total</th>
		<th>Discount</th>
		<th>Date Created</th>
		
            </tr><?php
            foreach ($coupon_data as $coupon)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $coupon->code ?></td>
		      <td><?php echo $coupon->category_id ?></td>
		      <td><?php echo $coupon->from_date ?></td>
		      <td><?php echo $coupon->to_date ?></td>
		      <td><?php echo $coupon->total ?></td>
		      <td><?php echo $coupon->discount ?></td>
		      <td><?php echo $coupon->date_created ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>
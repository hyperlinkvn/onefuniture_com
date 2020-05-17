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
        <h2>Orders List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Order Code</th>
		<th>Customer Name</th>
		<th>Customer Id</th>
		<th>Delivery Address</th>
		<th>Description</th>
		<th>Total</th>
		<th>Status</th>
		<th>Note</th>
		<th>Date Created</th>
		
            </tr><?php
            foreach ($orders_data as $orders)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $orders->order_code ?></td>
		      <td><?php echo $orders->customer_name ?></td>
		      <td><?php echo $orders->customer_id ?></td>
		      <td><?php echo $orders->delivery_address ?></td>
		      <td><?php echo $orders->description ?></td>
		      <td><?php echo $orders->total ?></td>
		      <td><?php echo $orders->status ?></td>
		      <td><?php echo $orders->note ?></td>
		      <td><?php echo $orders->date_created ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>
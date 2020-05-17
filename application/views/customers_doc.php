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
        <h2>Customers List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Name</th>
		<th>Email</th>
		<th>Phone</th>
		<th>Address</th>
		<th>Description</th>
		<th>Date Created</th>
		
            </tr><?php
            foreach ($customers_data as $customers)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $customers->name ?></td>
		      <td><?php echo $customers->email ?></td>
		      <td><?php echo $customers->phone ?></td>
		      <td><?php echo $customers->address ?></td>
		      <td><?php echo $customers->description ?></td>
		      <td><?php echo $customers->date_created ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>
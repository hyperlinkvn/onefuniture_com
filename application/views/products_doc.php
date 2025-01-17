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
        <h2>Products List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Name</th>
		<th>Description</th>
		<th>Category Id</th>
		<th>Price</th>
		<th>Cost</th>
		<th>Image</th>
		<th>Status</th>
		<th>Option Ids</th>
		<th>Content</th>
		<th>Date Created</th>
		
            </tr><?php
            foreach ($products_data as $products)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $products->name ?></td>
		      <td><?php echo $products->description ?></td>
		      <td><?php echo $products->category_id ?></td>
		      <td><?php echo $products->price ?></td>
		      <td><?php echo $products->cost ?></td>
		      <td><?php echo $products->image ?></td>
		      <td><?php echo $products->status ?></td>
		      <td><?php echo $products->option_ids ?></td>
		      <td><?php echo $products->content ?></td>
		      <td><?php echo $products->date_created ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>
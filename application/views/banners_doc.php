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
        <h2>Banners List</h2>
        <table class="word-table" style="margin-bottom: 10px">
            <tr>
                <th>No</th>
		<th>Name</th>
		<th>Image</th>
		<th>Small Text</th>
		<th>Big Text</th>
		<th>Url</th>
		<th>Position</th>
		<th>Date Created</th>
		
            </tr><?php
            foreach ($banners_data as $banners)
            {
                ?>
                <tr>
		      <td><?php echo ++$start ?></td>
		      <td><?php echo $banners->name ?></td>
		      <td><?php echo $banners->image ?></td>
		      <td><?php echo $banners->small_text ?></td>
		      <td><?php echo $banners->big_text ?></td>
		      <td><?php echo $banners->url ?></td>
		      <td><?php echo $banners->position ?></td>
		      <td><?php echo $banners->date_created ?></td>	
                </tr>
                <?php
            }
            ?>
        </table>
    </body>
</html>
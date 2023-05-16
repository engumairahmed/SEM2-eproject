<?php
require_once "header.php"


?>

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Products</h1>


                    <!-- Data Tables -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">View Products</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Category</th>
                                            <th>Brand</th>
                                            <th>Price</th>
                                            <th>Stock</th>
                                            <th>Image</th>
                                            <th>Delete</th>
                                            <th>Update</th>
                                        </tr>
                                    </thead>                                   
                                    <tbody>
                                        <?php
                                            $query="SELECT * FROM orders o INNER JOIN user u ON o.ord_user=u.user_id INNER JOIN products p ON o.ord_product=p.prod_id;";
                                            $res=mysqli_query($conn,$query);
                                            while($row=mysqli_fetch_assoc($res)){
                                                echo'
                                                <tr>
                                                    <td>'.$row["ord_id"].'</td>
                                                    <td>'.$row["user_name"].'</td>
                                                    <td>'.$row["prod_name"].'</td>
                                                    <td>'.$row["ord_quantity"].'</td>
                                                    <td>'.$row["ord_status"].'</td>
                                                    <td>'.$row["ord_receipt_no"].'</td>
                                                    <td><img src="'.$row["prod_image"].'" width=60px></td>
                                                    <td><a class="btn btn-danger delBtn" href="#" data-id="'.$row["ord_id"].'" data-toggle="modal" data-target="#DelConfirmModal">Delete</a></</td>
                                                    <td><a class="btn btn-warning" href="products.php?uid='.$row["ord_id"].'">Update</a></td>
                                                </tr>';
                                            };
                                        ?>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->



<?php

require_once "footer.php"

?>
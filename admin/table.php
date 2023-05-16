<?php
require_once "header2.php"


?>

                <!-- Begin Page Content -->
                <div class="container-fluid">



                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
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
                                            <th>Image</th>
                                            <th>Delete</th>
                                            <th>Update</th>
                                        </tr>
                                    </thead>                                   
                                    <tbody>
                                        <?php
                                            $query="SELECT * FROM products p INNER JOIN category c ON p.prod_category=c.cat_id INNER JOIN brands b ON p.prod_brand=b.brand_id;";
                                            $res=mysqli_query($conn,$query);
                                            while($row=mysqli_fetch_assoc($res)){
                                                echo'
                                                <tr>
                                                    <td>'.$row["prod_id"].'</td>
                                                    <td>'.$row["prod_name"].'</td>
                                                    <td>'.$row["cat_name"].'</td>
                                                    <td>'.$row["brand_name"].'</td>
                                                    <td>'.$row["prod_price"].'</td>
                                                    <td><img src=".'.$row["prod_image"].'"></td>
                                                    <td><a class="btn btn-danger delBtn" href="#" data-id="'.$row["prod_id"].'" data-toggle="modal" data-target="#DelConfirmModal">Delete</a></</td>
                                                    <td><a class="btn btn-warning" href="products.php?uid='.$row["prod_id"].'">Update</a></td>
                                                </tr>';
                                            };
                                        ?>
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                            <td>2011/04/25</td>
                                            <td>$320,800</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->
                </div>
            <!-- End of Main Content -->

<?php

require_once "footer2.php"

?>
<?php
require_once "header.php"


?>


                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>


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
                                            <th>Category</th>
                                            <th>Delete</th>
                                            <th>Edit</th>
                                        </tr>
                                    </thead>                                   
                                    <tbody>
                                        <?php
                                            $query="SELECT * FROM category;";
                                            $res=mysqli_query($conn,$query);
                                            while($row=mysqli_fetch_assoc($res)){
                                                echo'
                                                <tr>
                                                    <td>'.$row["cat_id"].'</td>
                                                    <td>'.$row["cat_name"].'</td>
                                                    <td><a class="btn btn-danger delBtn" href="#" data-id="'.$row["cat_id"].'" data-toggle="modal" data-target="#DelConfirmModal">Delete</a></</td>
                                                    <td><a class="btn btn-warning" href="products.php?uid='.$row["cat_id"].'">Edit</a></td>
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
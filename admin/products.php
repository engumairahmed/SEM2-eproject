<?php
require_once "header.php";

if(isset($_POST["addProduct"])){
    print_r($_POST);
$name=$_POST["prodName"];
$brand=$_POST["brand"];
$category=$_POST["category"];
$price=$_POST["price"];
$imgName=$_FILES["image"]["name"];
$tmpFile=$_FILES["image"]["tmp_name"];
$path='img/'.time().$imgName;
$xt=explode('.',$imgName);
$type=end($xt);
$ext=array('jpg','jpeg','png','jfif');
if(in_array($type,$ext)){
    move_uploaded_file($tmpFile,$path);
    $query="INSERT INTO products VALUE(NULL,'$name',$brand,$category,$price,'$path');";
    mysqli_query($conn,$query);
} else{
    echo "<script>alert('Invalid File Type.!')</script>";
};
};


?>
<!---Product Add & Edit Form--->
    <div class="container"> 
            <?php
            
            if(isset($_GET["uid"])){
                $query="SELECT * FROM products p INNER JOIN category c ON p.prod_category=c.cat_id INNER JOIN brands b ON p.prod_brand=b.brand_id WHERE prod_id=$uid;";
            $res=mysqli_query($conn,$query);
            $dt=mysqli_fetch_assoc($res);
                echo '<h1 class="h3 mb-2 text-gray-800">Edit Product</h1>
                <form class="user" method="post" enctype="multipart/form-data">
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <input type="name" value="'.$dt["prod_name"].'" name="updProdName" class="form-control">
                            </div>
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <select name="updBrand" id="" class="py-2 form-control" placeholder="Select Brand">
                                    <option selected value='.$dt["brand_name"].'>Select Brand</option>
                                    ';
                                    $query="SELECT * FROM brands";
                                    $res=mysqli_query($conn,$query);
                                    while($row=mysqli_fetch_assoc($res)){
                                    echo '<option value="'.$row["brand_id"].'">'.$row["brand_name"].'</option>';
                                    };
                               echo '
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <select name="updCategory" id="" class="py-2 form-control" placeholder="Select Category">
                                    <option selected value='.$dt["cat_id"].'>Select Category</option>
                                    ';
                                    $query="SELECT * FROM category";
                                    $res=mysqli_query($conn,$query);
                                    while($row=mysqli_fetch_assoc($res)){
                                    echo '<option value="'.$row["cat_id"].'">'.$row["cat_name"].'</option>';
                                    };
                               echo '
                                </select>
                            </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="number" value="'.$dt["prod_price"].'" name="updPrice" class="form-control">
                                </div>
                            </div> 
                            <div class="form-group row">                      
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <input type="file" name="updImage" class="form-control">
                                </div>
                            </div>
                            <input type="submit" name="updProduct" class="btn btn-warning" value="Update">                                        
                            <hr>
                                            
                </form>';
            } else{
                echo '<h1 class="h3 mb-2 text-gray-800">Add Product</h1>
                <form class="user" method="post" enctype="multipart/form-data">
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <input type="name" name="prodName" class="form-control"
                                placeholder="Enter Product Name">
                        </div>
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <select name="brand" id="" class="py-2 form-control" placeholder="Select Brand">
                                <option selected value=0>Select Brand</option>
                                ';
                                $query="SELECT * FROM brands";
                                $res=mysqli_query($conn,$query);
                                while($row=mysqli_fetch_assoc($res)){
                                echo '<option value="'.$row["brand_id"].'">'.$row["brand_name"].'</option>';
                                };
                            echo '
                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-6 mb-3 mb-sm-0">
                            <select name="category" id="" class="py-2 form-control" placeholder="Select Category">
                                <option selected value=0>Select Category</option>
                                ';
                                $query="SELECT * FROM category";
                                $res=mysqli_query($conn,$query);
                                while($row=mysqli_fetch_assoc($res)){
                                echo '<option value="'.$row["cat_id"].'">'.$row["cat_name"].'</option>';
                                };
                            echo '
                            </select>
                        </div>
                            <div class="col-sm-6 mb-3 mb-sm-0">
                                <input type="number" value="" name="price" class="form-control" placeholder="Enter Price">
                            </div>  
                    </div>               
                    <input type="file" name="image" class="form-control col-sm-3 mb-3 mb-sm-0">
                    <input type="submit" name="addProduct" class="btn btn-dark mt-3" value="Add">
                    <hr>                                        
                </form>';
            };
            
            ?>       
        </div>

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
                                            $query="SELECT * FROM products p INNER JOIN category c ON p.prod_category=c.cat_id INNER JOIN brands b ON p.prod_brand=b.brand_id INNER JOIN stock s ON s.stk_product=p.prod_id;";
                                            $res=mysqli_query($conn,$query);
                                            while($row=mysqli_fetch_assoc($res)){
                                                echo'
                                                <tr>
                                                    <td>'.$row["prod_id"].'</td>
                                                    <td>'.$row["prod_name"].'</td>
                                                    <td>'.$row["cat_name"].'</td>
                                                    <td>'.$row["brand_name"].'</td>
                                                    <td>'.$row["prod_price"].'</td>
                                                    <td>'.$row["stk_quantity"].'</td>
                                                    <td><img src="'.$row["prod_image"].'" width=60px></td>
                                                    <td><a class="btn btn-danger delBtn" href="#" data-id="'.$row["prod_id"].'" data-toggle="modal" data-target="#DelConfirmModal">Delete</a></</td>
                                                    <td><a class="btn btn-warning" href="products.php?uid='.$row["prod_id"].'">Update</a></td>
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
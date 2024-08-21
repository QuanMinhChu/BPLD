<?php
session_start();
include('includes/dbconnection.php');

if (strlen($_SESSION['bpmsaid'] == 0)) {
    header('location:logout.php');
} else {

    if (isset($_POST['submit'])) {
        $name = $_POST['name'];
        $price = $_POST['price'];
        $description = $_POST['description'];
        $brand = $_POST['brand'];
        $image = $_FILES['image']['name'];
        $target = "uploads/" . basename($image);

        $query = mysqli_query($con, "INSERT INTO products(name, price, description, brand, image) VALUES('$name', '$price', '$description', '$brand', '$image')");
        if ($query) {
            move_uploaded_file($_FILES['image']['tmp_name'], $target);
            $msg = "Product added successfully.";
        } else {
            $msg = "Something went wrong. Please try again.";
        }
    }

    if (isset($_GET['del'])) {
        $id = $_GET['id'];
        mysqli_query($con, "DELETE FROM products WHERE id = '$id'");
        $msg = "Product deleted.";
    }

    ?>

    <!DOCTYPE HTML>
    <html>
    <head>
        <title>BPMS || Manage Products</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.css" rel="stylesheet">
        <script src="js/jquery-1.11.1.min.js"></script>
    </head>
    <body class="cbp-spmenu-push">
    <div class="main-content">
        <?php include_once('includes/sidebar.php'); ?>
        <?php include_once('includes/header.php'); ?>
        <div id="page-wrapper">
            <div class="main-page">
                <div class="tables">
                    <h3 class="title1">Manage Products</h3>
                    <div class="table-responsive bs-example widget-shadow">
                        <h4>Product List:</h4>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th>Brand</th>
                                <th>Image</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            $ret = mysqli_query($con, "SELECT * FROM products");
                            $cnt = 1;
                            while ($row = mysqli_fetch_array($ret)) {
                                ?>
                                <tr>
                                    <th scope="row"><?php echo $cnt; ?></th>
                                    <td><?php echo $row['name']; ?></td>
                                    <td><?php echo $row['price']; ?></td>
                                    <td><?php echo $row['description']; ?></td>
                                    <td><?php echo $row['brand']; ?></td>
                                    <td><img src="uploads/<?php echo $row['image']; ?>" width="100"></td>
                                    <td>
                                        <a href="editProducts.php?id=<?php echo $row['id']; ?>">Edit</a> |
                                        <a href="manageProduct.php?id=<?php echo $row['id']; ?>&del=delete"
                                           onclick="return confirm('Are you sure you want to delete?')">Delete</a>
                                    </td>
                                </tr>
                                <?php $cnt = $cnt + 1;
                            } ?>
                            </tbody>
                        </table>
                    </div>
                    <div class="form-body">
                        <form method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="name">Product Name</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="price">Price</label>
                                <input type="text" class="form-control" name="price" required>
                            </div>
                            <div class="form-group">
                                <label for="description">Description</label>
                                <textarea class="form-control" name="description" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="brand">Brand</label>
                                <input type="text" class="form-control" name="brand" required>
                            </div>
                            <div class="form-group">
                                <label for="image">Product Image</label>
                                <input type="file" class="form-control" name="image" required>
                            </div>
                            <button type="submit" name="submit" class="btn btn-primary">Add Product</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <?php include_once('includes/footer.php'); ?>
    </div>
    <script src="js/bootstrap.js"></script>
    </body>
    </html>
<?php } ?>

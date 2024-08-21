<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Chi Tiết Sản Phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>
    <?php include('includes/header.php'); ?>

    <div class="container mt-5">
        <?php
        include('includes/dbconnection.php');
        $id = $_GET['id'];
        $query = "SELECT * FROM products WHERE id='$id'";
        $result = mysqli_query($con, $query);

        if ($row = mysqli_fetch_assoc($result)) {
            ?>
            <div class="row">
                <div class="col-md-6">
                    <img src="path/to/image/<?php echo $row['id']; ?>.jpg" class="img-fluid" alt="<?php echo $row['name']; ?>">
                </div>
                <div class="col-md-6">
                    <h2><?php echo $row['name']; ?></h2>
                    <p>Giá: <?php echo number_format($row['price'], 0, ',', '.'); ?> VND</p>
                    <p><?php echo $row['description']; ?></p>
                    <p>Hãng: <?php echo $row['brand']; ?></p>
                    <a href="add-to-cart.php?id=<?php echo $row['id']; ?>" class="btn btn-primary">Thêm vào Giỏ Hàng</a>
                </div>
            </div>
            <?php
        } else {
            echo '<p class="text-center">Sản phẩm không tồn tại.</p>';
        }
        ?>
    </div>

    <?php include('includes/footer.php'); ?>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

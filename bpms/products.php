<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Danh Mục Sản Phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>
    <?php include('includes/header.php'); ?>

    <div class="container mt-5">
        <h2 class="text-center mb-4">Danh Mục Sản Phẩm</h2>
        <div class="row">
            <?php
            include('includes/dbconnection.php');
            $query = "SELECT * FROM products";
            $result = mysqli_query($con, $query);

            if (mysqli_num_rows($result) > 0) {
                while ($row = mysqli_fetch_assoc($result)) {
                    ?>
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="uploads/<?php echo $row['image']; ?>" class="card-img-top" alt="<?php echo $row['name']; ?>">
                            <div class="card-body">
                                <h5 class="card-title"><?php echo $row['name']; ?></h5>
                                <p class="card-text">Giá: <?php echo number_format($row['price'], 0, ',', '.'); ?> VND</p>
                                <p class="card-text"><?php echo $row['description']; ?></p>
                                <p class="card-text">Hãng: <?php echo $row['brand']; ?></p>
                                <a href="product-details.php?id=<?php echo $row['id']; ?>" class="btn btn-primary">Xem Chi Tiết</a>
                            </div>
                        </div>
                    </div>
                    <?php
                }
            } else {
                echo '<p class="text-center">Chưa có sản phẩm nào.</p>';
            }
            ?>
        </div>
    </div>

    <?php include('includes/footer.php'); ?>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

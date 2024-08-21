<?php
session_start();
error_reporting(E_ALL);  // Hiển thị tất cả các lỗi để dễ dàng kiểm tra
ini_set('display_errors', 1); // Bật hiển thị lỗi

include('includes/dbconnection.php');

if (strlen($_SESSION['bpmsaid']) == 0) {
    header('location:logout.php');
    exit();
} else {

    if (isset($_POST['submit'])) {
        $id = $_POST['id'];
        $name = $_POST['name'];
        $price = $_POST['price'];
        $description = $_POST['description'];
        $brand = $_POST['brand'];
        $image = $_FILES['image']['name'];

        // Xử lý upload hình ảnh
        if ($image) {
            $target_dir = "uploads/";
            $target_file = $target_dir . basename($_FILES["image"]["name"]);

            // Kiểm tra và tạo thư mục nếu không tồn tại
            if (!file_exists($target_dir)) {
                mkdir($target_dir, 0777, true);
            }

            // Di chuyển tệp hình ảnh
            if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
                // Upload thành công
            } else {
                echo "<script>alert('Không thể tải lên hình ảnh.');</script>";
                exit();
            }
        } else {
            // Nếu không upload hình ảnh mới, giữ nguyên hình ảnh cũ
            $image = $_POST['old_image'];
        }

        // Cập nhật sản phẩm vào cơ sở dữ liệu
        $query = "UPDATE products SET name=?, price=?, description=?, brand=?, image=? WHERE id=?";
        $stmt = $con->prepare($query);
        $stmt->bind_param("sdssss", $name, $price, $description, $brand, $image, $id);

      
    $msg="Customer Detail has been Updated.";
  }
  else
    {
      $msg="Something Went Wrong. Please try again";
    }
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Chỉnh sửa sản phẩm</title>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!-- font-awesome icons -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- js -->
    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- webfonts -->
    <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
    <!-- animate -->
    <link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
    <script src="js/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
    <!-- Metis Menu -->
    <script src="js/metisMenu.min.js"></script>
    <script src="js/custom.js"></script>
    <link href="css/custom.css" rel="stylesheet">
</head>
<body class="cbp-spmenu-push">
    <div class="main-content">
        <!--left-fixed -navigation-->
        <?php include_once('includes/sidebar.php'); ?>
        <!-- header-starts -->
        <?php include_once('includes/header.php'); ?>
        <!-- main content start-->
        <div id="page-wrapper">
            <div class="main-page">
                <div class="forms">
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="title1">Chỉnh sửa sản phẩm</h3>
                            <div class="form-three widget-shadow">
                                <form method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="id" value="<?php echo htmlspecialchars($row['id'] ?? ''); ?>">
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <input type="text" name="name" class="form-control" value="<?php echo htmlspecialchars($row['name'] ?? ''); ?>" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Giá sản phẩm</label>
                                        <input type="number" name="price" class="form-control" value="<?php echo htmlspecialchars($row['price'] ?? ''); ?>" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Mô tả sản phẩm</label>
                                        <textarea name="description" class="form-control" required><?php echo htmlspecialchars($row['description'] ?? ''); ?></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Hãng</label>
                                        <input type="text" name="brand" class="form-control" value="<?php echo htmlspecialchars($row['brand'] ?? ''); ?>" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Hình ảnh</label>
                                        <input type="file" name="image" class="form-control">
                                        <input type="hidden" name="old_image" value="<?php echo htmlspecialchars($row['image'] ?? ''); ?>">
                                        <?php if (isset($row['image']) && $row['image']) { ?>
                                            <img src="uploads/<?php echo htmlspecialchars($row['image']); ?>" alt="<?php echo htmlspecialchars($row['name']); ?>" width="100">
                                        <?php } ?>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-primary">Cập nhật</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--footer-->
        <?php include_once('includes/footer.php'); ?>
    </div>
    <!--scrolling js-->
    <script src="js/jquery.nicescroll.js"></script>
    <script src="js/scripts.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.js"></script>
</body>
</html>
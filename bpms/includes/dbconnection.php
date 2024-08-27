<?php
session_start();
error_reporting(0);
$con=mysqli_connect("localhost", "root", "", "bpmsdb");
if(mysqli_connect_errno()){
echo "Connection Fail".mysqli_connect_error();
}

  ?>

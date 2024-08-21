-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th8 19, 2024 lúc 04:27 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bpmsdb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `brand` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `brand`, `image`) VALUES
(2, 'Hoa', 100000.00, 'Son đẹp', 'Gucci', 'pi.png'),
(3, 'Hoa', 100000.00, 'Son đẹp', 'Gucci', 'pi.png'),
(4, 'Hoa', 100000.00, 'Son đẹp', 'Gucci', 'pi.png'),
(5, 'Cây cảnh trong nhà', 100000.00, 'qư', 'Gucci', 'e4.png'),
(6, 'Cây cảnh trong nhà', 100000.00, '5yyyy', 'Gucci', 'a1.png'),
(7, 'Hoa tươi', 100000.00, 'sdfgfsdgsdrfgsdfgs', 'Gucci', 'qa3.png'),
(8, 'admin', 100000.00, 'sfsdfsdf', 'Gucci', 'e4.png'),
(9, 'Hoa tươi', 100000.00, 'sdfsdfsd', 'Gucci', 'r3.png'),
(10, 'admin', 100000.00, '3434', 'Gucci', 'sp1_1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbladmin`
--

CREATE TABLE `tbladmin` (
  `ID` int(10) NOT NULL,
  `AdminName` char(50) DEFAULT NULL,
  `UserName` char(50) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `AdminRegdate`) VALUES
(1, 'test', 'admin', 7898799798, 'tester1@gmail.com', '202cb962ac59075b964b07152d234b70', '2019-07-25 06:21:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblappointment`
--

CREATE TABLE `tblappointment` (
  `ID` int(10) NOT NULL,
  `AptNumber` varchar(80) DEFAULT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `PhoneNumber` bigint(11) DEFAULT NULL,
  `AptDate` varchar(120) DEFAULT NULL,
  `AptTime` varchar(120) DEFAULT NULL,
  `Services` varchar(120) DEFAULT NULL,
  `ApplyDate` timestamp NULL DEFAULT current_timestamp(),
  `Remark` varchar(250) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `RemarkDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tblappointment`
--

INSERT INTO `tblappointment` (`ID`, `AptNumber`, `Name`, `Email`, `PhoneNumber`, `AptDate`, `AptTime`, `Services`, `ApplyDate`, `Remark`, `Status`, `RemarkDate`) VALUES
(1, '261064124', 'Komal', 'komal@gmail.com', 7798797897, '7/27/2019', '4:00pm', '1', '2019-07-26 04:48:25', 'Accepted', '1', '2019-07-26 06:41:16'),
(2, '985645887', 'Kashish', 'Kash@gmail.com', 4654654654, '7/29/2019', '4:30pm', 'Deluxe Pedicure', '2019-07-26 05:04:38', 'Rejected', '2', '2019-07-26 06:47:04'),
(3, '965887988', 'Sanjeeta Jain', 'sna@gmail.com', 5646464646, '8/20/2019', '2:30pm', 'Loreal Hair Color(Full)', '2019-08-19 12:35:30', 'we will wait', '1', '2019-08-19 13:37:39'),
(4, '578797544', 'Anuj Kumar', 'phpgurukulofficial@gmail.com', 123456789, '8/30/2019', '1:30am', 'Test', '2019-08-21 16:13:13', 'dfsg', '1', '2024-07-19 07:39:07'),
(5, '899118550', 'bb', 'bgfdh@fdfdsf.com', 4234235423, '8/27/2019', '1:30am', 'Loreal Hair Color(Full)', '2019-08-21 16:14:14', '', '', '0000-00-00 00:00:00'),
(6, '621107928', 'ABC', 'abc@gmail.com', 1234567890, '8/27/2019', '1:30am', 'Rebonding', '2019-08-21 16:22:25', 'Testing', '2', '2019-08-21 16:24:10'),
(7, '168089001', 'tuyen', 'tn397642@gmail.com', 911903547, '7/31/2024', '12:00am', 'O3 Facial', '2024-07-01 20:51:17', '', '', '0000-00-00 00:00:00'),
(8, '934934490', 'tuyen', 'tn397642@gmail.com', 911903547, '7/30/2024', '1:00am', 'Charcol Facial', '2024-07-19 16:23:15', '?e', '1', '2024-07-19 16:24:30'),
(9, '342060901', 'Hoa', 'tuyen00002@outlook.com.vn', 911903547, '7/7/2024', '12:00am', 'Normal Pedicure', '2024-07-19 16:23:47', '', '', '0000-00-00 00:00:00'),
(10, '180821322', 'Cây c?nh v?n phòng', 'sajal.agrawal1997@gmail.com', 911903547, '7/22/2024', '12:00am', 'Deluxe Menicure', '2024-07-21 15:17:37', '', '', '0000-00-00 00:00:00'),
(11, '340861227', 'Hoa t??i', 'tuyen00002@outlook.com.vn', 911903547, '7/27/2024', '12:00am', 'Charcol Facial', '2024-07-21 15:17:56', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcustomers`
--

CREATE TABLE `tblcustomers` (
  `ID` int(10) NOT NULL,
  `Name` varchar(120) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Gender` enum('Female','Male','Transgender') DEFAULT NULL,
  `Details` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tblcustomers`
--

INSERT INTO `tblcustomers` (`ID`, `Name`, `Email`, `MobileNumber`, `Gender`, `Details`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Sunita Vermad', 'verma@gmail.com', 5546464646, 'Transgender', 'Taking Hair Spa', '2019-07-26 11:09:10', '2024-07-19 07:14:48'),
(2, 'Rahul Singh', 'singh@gmail.com', 5565565656, 'Male', 'Taken haircut by him', '2019-07-26 11:10:02', NULL),
(3, 'Khusbu', 'saini@gmail.com', 4646445464, 'Transgender', 'khjhhkjkjkuhj', '2019-07-26 11:10:28', NULL),
(4, 'Sanjeeta Jain', 'san@gmail.com', 5646464646, 'Female', 'Taking Body Spa', '2019-08-19 13:38:58', NULL),
(5, 'Test user', 'testuser@gmail.com', 1234567890, 'Female', 'Test', '2019-08-21 16:24:53', '2019-08-21 16:25:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblinvoice`
--

CREATE TABLE `tblinvoice` (
  `id` int(11) NOT NULL,
  `Userid` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL,
  `BillingId` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tblinvoice`
--

INSERT INTO `tblinvoice` (`id`, `Userid`, `ServiceId`, `BillingId`, `PostingDate`) VALUES
(1, 2, 2, 621839533, '2018-07-30 15:33:22'),
(2, 2, 5, 621839533, '2019-06-04 15:33:22'),
(3, 2, 6, 621839533, '2019-07-30 15:33:22'),
(4, 2, 7, 621839533, '2019-07-30 15:33:22'),
(5, 1, 1, 904156433, '2019-07-30 15:40:42'),
(6, 1, 2, 904156433, '2019-07-30 15:40:42'),
(7, 1, 3, 904156433, '2019-07-30 15:40:42'),
(8, 1, 4, 904156433, '2019-07-30 15:40:42'),
(9, 3, 1, 225057023, '2019-07-30 16:03:32'),
(10, 3, 8, 225057023, '2019-07-30 16:03:32'),
(11, 3, 1, 970548035, '2019-07-31 04:42:45'),
(12, 3, 6, 970548035, '2019-07-31 04:42:45'),
(13, 3, 9, 970548035, '2019-07-31 04:42:45'),
(14, 4, 2, 942476283, '2019-08-19 13:39:13'),
(15, 4, 12, 942476283, '2019-08-19 13:39:13'),
(16, 5, 3, 297018570, '2019-08-21 16:25:27'),
(17, 5, 4, 297018570, '2019-08-21 16:25:27'),
(18, 5, 8, 297018570, '2019-08-21 16:25:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblpage`
--

CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` date DEFAULT NULL,
  `Timing` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tblpage`
--

INSERT INTO `tblpage` (`ID`, `PageType`, `PageTitle`, `PageDescription`, `Email`, `MobileNumber`, `UpdationDate`, `Timing`) VALUES
(1, 'aboutus', 'About Us', '        Our main focus is on quality and hygiene. Our Parlour is well equipped with advanced technology equipments and provides best quality services. Our staff is well trained and experienced, offering advanced services in Skin, Hair and Body Shaping that will provide you with a luxurious experience that leave you feeling relaxed and stress free. The specialities in the parlour are, apart from regular bleachings and Facials, many types of hairstyles, Bridal and cine make-up and different types of Facials &amp; fashion hair colourings.', NULL, NULL, NULL, ''),
(2, 'contactus', 'Contact Us', '890,Sector 62, Gyan Sarovar, GAIL Noida(Delhi/NCR)', 'info@gmail.com', 7896541236, NULL, '10:30 am to 7:30 pm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblservices`
--

CREATE TABLE `tblservices` (
  `ID` int(10) NOT NULL,
  `ServiceName` varchar(200) DEFAULT NULL,
  `Cost` int(10) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `tblservices`
--

INSERT INTO `tblservices` (`ID`, `ServiceName`, `Cost`, `CreationDate`) VALUES
(1, 'O3 Facial', 1200, '2019-07-25 11:22:38'),
(2, 'Fruit Facial', 500, '2019-07-25 11:22:53'),
(3, 'Charcol Facial', 1000, '2019-07-25 11:23:10'),
(4, 'Deluxe Menicure', 500, '2019-07-25 11:23:34'),
(5, 'Deluxe Pedicure', 600, '2019-07-25 11:23:47'),
(6, 'Normal Menicure', 300, '2019-07-25 11:24:01'),
(7, 'Normal Pedicure', 400, '2019-07-25 11:24:19'),
(8, 'U-Shape Hair Cut', 250, '2019-07-25 11:24:38'),
(9, 'Layer Haircut', 550, '2019-07-25 11:24:53'),
(10, 'Rebonding', 3999, '2019-07-25 11:25:08'),
(11, 'Loreal Hair Color(Full)', 1200, '2019-07-25 11:25:35'),
(12, 'Body Spa', 1500, '2019-08-19 13:36:27'),
(14, 'Test', 100, '2019-08-21 15:45:50'),
(15, 'ABC', 200, '2019-08-21 16:23:23');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tblappointment`
--
ALTER TABLE `tblappointment`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tblcustomers`
--
ALTER TABLE `tblcustomers`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tblinvoice`
--
ALTER TABLE `tblinvoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `tblpage`
--
ALTER TABLE `tblpage`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tblservices`
--
ALTER TABLE `tblservices`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `tblappointment`
--
ALTER TABLE `tblappointment`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `tblcustomers`
--
ALTER TABLE `tblcustomers`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tblinvoice`
--
ALTER TABLE `tblinvoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `tblpage`
--
ALTER TABLE `tblpage`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `tblservices`
--
ALTER TABLE `tblservices`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

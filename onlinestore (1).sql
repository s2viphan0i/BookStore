-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2018 at 02:53 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `book_author` varchar(100) COLLATE utf8_bin NOT NULL,
  `book_image` varchar(100) CHARACTER SET latin1 NOT NULL,
  `book_price` int(11) NOT NULL,
  `category_id` int(5) NOT NULL,
  `book_releasedate` date NOT NULL,
  `book_note` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_name`, `book_author`, `book_image`, `book_price`, `category_id`, `book_releasedate`, `book_note`) VALUES
(1, 'Fifty Shade Of Grey', 'E. L. James', '7Apr2018172942GMT_1523122182403_10292.jpg', 50000, 3, '2004-10-13', '50 Shade Of Grey'),
(4, 'SÚNG, VI TRÙNG VÀ THÉP', 'Jared Diamond', '7Apr2018175358GMT_1523123638983_7527.jpg', 60000, 2, '2015-04-25', 'Súng, vi trùng và thép'),
(5, 'Bá Tước Monto Crixto', 'Alexandre Dumas', '9Apr2018150456GMT_1523286296373_7698.jpg', 30000, 1, '2014-05-23', 'DUMAS'),
(6, 'Socola Cho Một Trái Tim Yêu', 'Kay Allenbaugh', '21Apr2018091054GMT_1524301854026_7986.jpg', 40000, 3, '2000-07-12', 'Socola Cho Một Trái Tim Yêu - Kay Allenbaugh'),
(7, 'Không có sông nào để vượt qua', 'Ni Daehaeng', '26Apr2018184109GMT_1524768069386_8001.png', 40000, 5, '2015-07-15', 'Không có sông nào để vượt qua của tác giả Ni Daehaeng'),
(8, 'Hà mã, Chó, Chim, Cá và những thứ khác', 'Thanh Toàn', '28Apr2018050057GMT_1524891657086_10587.jpg', 30000, 2, '2018-04-12', 'Hà mã, Chó, Chim, Cá và những thứ khác - Thanh Toàn');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Lịch sử'),
(2, 'Văn hóa - Xã hội'),
(3, 'Tình cảm'),
(4, 'Khoa học - viễn tưởng'),
(5, 'Sống đẹp');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `quantity` int(2) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `orders_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `book_id`, `quantity`, `price`, `orders_id`) VALUES
(1, 1, 2, 50000, 1),
(2, 4, 1, 60000, 1),
(3, 1, 2, 50000, 1),
(4, 4, 1, 60000, 1),
(5, 1, 1, 50000, 1),
(6, 7, 1, 40000, 1),
(7, 6, 1, 40000, 1),
(8, 1, 2, 50000, 1),
(9, 1, 1, 50000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `user_id`, `status`) VALUES
(3, 2, 0),
(4, 1, 0),
(5, 1, 0),
(6, 2, 0),
(7, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `fullname`, `role`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'Sin Nguyen', 3),
(2, 'sonvip27', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Văn A', 2),
(3, 'user1', 'e10adc3949ba59abbe56e057f20f883e', 'Người dùng 1', 1),
(4, 's2viphan0i', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị B', 1),
(5, 'trungtamjava', 'e10adc3949ba59abbe56e057f20f883e', 'Nhân viên A', 2),
(6, 'son_truong', 'c33367701511b4f6020ec61ded352059', 'Trường Sơn', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

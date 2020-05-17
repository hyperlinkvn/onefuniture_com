-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 12, 2020 at 02:27 PM
-- Server version: 5.6.47-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thi1001a_thieponline`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `small_text` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `big_text` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'TOP:TOP,SUBTOP:SUBTOP,MIDDLE:MIDDLE,BOTTOM:BOTTOM',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `name`, `image`, `small_text`, `big_text`, `url`, `position`, `date_created`) VALUES
(1, 'Banner 1', 'background_32.jpg', 'BỘ SƯU TẬP THIỆP CƯỚI 2018', 'YOUR WED - YOUR WAY', 'http://thiepcuoionline.vn/index/category/4', 'TOP', '2017-09-28 00:00:00'),
(2, 'Banner 2', 'background_33.jpg', 'For A Best Ever Bridal Season', 'New Wedding Rings', '/', 'TOP', '2017-09-30 00:00:00'),
(3, 'Banner3', 'home15-banner_01.jpg', 'abcd', 'abcd', 'http://thiepcuoionline.vn/duydung', 'SUBTOP', '2017-09-29 00:00:00'),
(4, 'Banner 4', 'home15-banner_02.jpg', 'a', 'a', 'http://thiepcuoionline.vn/duydung', 'SUBTOP', '2017-09-29 00:00:00'),
(5, 'Banner 5', 'home15-banner_03.jpg', 'a', 'a', 'http://thiepcuoionline.vn/duydung/', 'SUBTOP', '2017-09-29 00:00:00'),
(6, 'Banner 6', 'home15-banner_041.jpg', 'a', 'a', 'http://thiepcuoionline.vn/index/category/4', 'MIDDLE', '2017-09-22 00:00:00'),
(7, 'Banner 7', 'background_31.jpg', 'a', 'a', '/', 'BOTTOM', '2017-09-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `alias`, `date_created`) VALUES
(1, 'Thiệp cưới Hiện Đại', 'thiep cuoi hien dai', '2017-08-01 20:30:10'),
(2, 'Thiệp cưới phong cách', 'thiep cuoi phong cach', '2017-09-01 20:30:10'),
(3, 'Thiệp cưới Cổ Điển', 'thiep cuoi co dien', '2017-09-25 00:00:00'),
(4, 'Thiệp cưới in hình', 'thiep-in-hinh', '2017-10-19 00:00:00'),
(5, 'Thiệp cưới Truyền Thống', 'thiep cuoi truyen thong', '2018-03-22 00:00:00'),
(6, 'Thiệp Khuyến Mãi', 'km', '2018-04-21 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id` int(11) NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL COMMENT '3:Thiệp cưới hiện đại,1:Thiệp cưới truyền thống,2:Thiệp cưới Vintage,4:Thiệp cưới khuyến mãi',
  `from_date` datetime NOT NULL,
  `to_date` datetime NOT NULL,
  `total` int(11) DEFAULT '0',
  `discount` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`id`, `code`, `category_id`, `from_date`, `to_date`, `total`, `discount`, `date_created`) VALUES
(1, 'NOEL2017', 3, '2017-10-11 00:00:00', '2017-12-16 00:00:00', 0, 10, '2017-11-01 00:00:00'),
(2, 'KT20', 3, '2017-10-08 00:00:00', '2017-10-09 00:00:00', 50, 20, '2017-10-08 00:00:00'),
(3, 'DT10', 3, '2017-10-08 00:00:00', '2017-12-31 00:00:00', 100, 10, '2017-12-20 00:00:00'),
(4, 'HM10', 3, '2018-04-23 00:00:00', '2018-05-31 00:00:00', 10, 10, '2018-04-17 00:00:00'),
(5, 'Am', 3, '2018-04-17 00:00:00', '2018-05-31 00:00:00', 300, 10, '2018-04-17 00:00:00'),
(6, 'Hoang My', 4, '2018-04-16 00:00:00', '2018-04-19 00:00:00', 300, 20, '2018-04-17 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `description`, `date_created`) VALUES
(1, 'Vi Bảo Quốc', 'vibaoquoc@gmail.com', '906099321', '105/2 Bạch Đằng , P.2 , Q.Tân Bình , Tp.Hồ Chí Minh, 22', 'Khách hàng VIP , Lĩnh vực IT', '2017-09-03 00:00:00'),
(2, 'Vi Bảo Quốc', 'vibaoquoc@gmail.com', '0906099321', '105/2 Bạch Đằng , P.2 , Q.Tân Bình , Tp.Hồ Chí Minh', NULL, '2017-09-24 01:35:23'),
(3, 'Vi Bảo Quốc', 'vibaoquoc@gmail.com', '0906099321', '105/2 Bạch Đằng , P.2 , Q.Tân Bình , Tp.Hồ Chí Minh', NULL, '2017-09-24 01:43:04'),
(4, '', '', '', '', NULL, '2017-09-24 02:05:34'),
(5, 'Vi Bảo Quốc', 'vibaoquoc@gmail.com', '0906099321', '105/2 Bạch Đằng , P.2 , Q.Tân Bình , Tp.Hồ Chí Minh', NULL, '2017-09-24 05:20:59'),
(6, '', '', '', '', NULL, '2017-09-25 15:05:26'),
(7, 'tân', 'tanytuong@gmail.com', '0949449914', 'q12', NULL, '2017-09-25 17:57:45'),
(8, '', '', '', '', NULL, '2017-09-26 05:22:45'),
(9, '', '', '', '', NULL, '2017-09-26 05:24:07'),
(10, 'Vy', 'le.thvy08@gmail.com', '0983491441', '', NULL, '2017-09-26 05:25:30'),
(11, '', '', '', '', NULL, '2017-09-30 16:17:53'),
(12, 'Vi Bảo Quốc', 'vibaoquoc@gmail.com', '0906099321', '105/2 Bạch Đằng , P.2 , Q.Tân Bình , Tp.Hồ Chí Minh', NULL, '2017-10-01 04:15:24'),
(13, 'Hàng giá gốc', 'vibaoquoc@gmail.com', '0906099321', '105/2 Bạch Đằng , P.2 , Q.Tân Bình , Tp.Hồ Chí Minh', NULL, '2017-10-01 04:25:54'),
(14, '', '', '', '', NULL, '2017-10-01 04:32:59'),
(15, '', '', '', '', NULL, '2017-10-01 05:32:04'),
(16, 'Tân Bùi', 'tanytuong@gmail.com', '0949449914', 'q10 tphcm', NULL, '2017-10-08 04:18:33'),
(17, 'HUy', 'huysusano@gmail.com', '09494932132321', 'q12', NULL, '2017-12-04 08:32:31'),
(18, 'Test', 'test@gmail.com', '09104908', '128 Minh Khai', NULL, '2017-12-16 02:46:19'),
(19, 'tanytuong@gmail.com', 'tanytuong@gmail.com', '09494944914', 'Q12', NULL, '2017-12-18 04:38:37'),
(20, 'tanytuong@gmail.com', 'tanytuong@gmail.com', '09494944914', 'dsfadfsdaf', NULL, '2017-12-20 07:41:11'),
(21, 'tanytuong@gmail.com', 'tanytuong@gmail.com', '09494944914', '5238 ntp q12', NULL, '2018-03-24 03:32:47'),
(22, 'Chi Tâm', 'tanytuong@gmail.com', '0949449914', 'Q12', NULL, '2018-04-29 01:20:41'),
(23, 'Mai Xuân Huy', 'huyts2001@gmail.com', '1694040226', 'số 8 - Khu BT lô 09- Vân Canh HUD - Vân Canh- Hoài Đức -Hà Nội', NULL, '2018-05-03 12:53:50'),
(24, 'teo', 'tanytuong@gmail.com', '09494944914', 'tatdfa Q12', NULL, '2018-05-24 15:21:07'),
(25, 'ta', 'tagb@gmail.com', '09494949496', 'dgfafdgfagafg', NULL, '2018-05-24 15:38:48'),
(26, 'Thuỷ', 'tbog19@gmail.com', '0976861697', '40 ngách 24/27 Thổ Quan - Khâm Thiên - Đống Đa - Hà Nội', NULL, '2018-07-05 16:42:04'),
(27, 'Bùi Quốc Tý', 'tybq93@gmail.com', '0848211293', '440/30 Nguyễn Kiệm, P3, Quận Phú Nhuận', NULL, '2018-10-30 14:00:24'),
(28, 'Trần Thanh Sơn', 'thanh.son.m.tran@gmail.com', '0979427497', '935 đại lộ Bình Dương, kp9, phường Hiệp An, Thành Phố Thủ Dầu Một, Bình Dương', NULL, '2018-11-06 14:33:54'),
(29, 'asa', 'tanytuong@gmailc.om', '949449914', '523/8 Nguyễn Tri Phương', NULL, '2018-11-07 05:42:57'),
(30, 'Nguyễn Thị Thu Thủy', 'samnguyen1205@gmail.com', '947730900', '601 Cách Mạng Tháng Tám (Công ty dược 3/2)', NULL, '2018-11-29 09:38:43'),
(31, 'Thuỷ Nguyễn', 'samnguyen1205@gmail.com', '0947730900', '601 Cách Mạng Tháng 8, p.15, quận 10', NULL, '2018-11-29 12:44:14'),
(32, 'lien nguyen', 'ln_nguyen89@yahoo.com', '6823315586', '1104 inglewood dr. mansfield tx, 76063', NULL, '2019-01-04 04:34:05'),
(33, 'Lê Minh Huyền', 'huyenlm850@gmail.com', '898906656', '515 chung cu DTA, ap Vung gam, Phuoc an, Nhon trach, Dong nai', NULL, '2019-02-16 05:58:13'),
(34, 'Hơn', 'vanhonnguyen92@gmail.com', '0981828272', '285 cmt8,p12, Q.10', NULL, '2019-02-17 02:38:09'),
(35, 'Nguyễn Thị Liên Ái', 'nguyenthilienai01@gmail.com', '0778744876', 'Tòa nhà Anna, Khu CVPM Quang Trung,p. Tân Chánh Hiệp, Quận 12', NULL, '2019-03-20 08:45:01'),
(36, 'Nguyễn Thị Liên Ái', 'nguyenthilienai01@gmail.com', '0778744876', 'Tòa nhà Anna, Khu CVPM Quang Trung,p. Tân Chánh Hiệp, Quận 12', NULL, '2019-03-20 08:46:34'),
(37, 'Nguyễn Thị Liên Ái', 'nguyenthilienai01@gmail.com', '0778744876', 'Tòa nhà Anna, Khu CVPM Quang Trung,p. Tân Chánh Hiệp, Quận 12', NULL, '2019-03-20 08:49:07'),
(38, 'Nguyễn Thị Liên Ái', 'nguyenthilienai01@gmail.com', '0778744876', 'Tòa nhà Anna, Khu CVPM Quang Trung,p. Tân Chánh Hiệp, Quận 12', NULL, '2019-03-20 08:50:43'),
(39, 'Nguyễn Thị Liên Ái', 'nguyenthilienai01@gmail.com', '0778744876', 'Tòa nhà Anna, Khu CVPM Quang Trung,p. Tân Chánh Hiệp, Quận 12', NULL, '2019-03-20 08:56:11'),
(40, 'Vũ Hải', 'azalea.vu87@gmail.com', '0942822444', '115 bà huyện thanh quan p9, q3', NULL, '2019-05-14 12:43:43'),
(41, 'Vũ hải', 'azalea.vu87@gmail.com', '0942822444', '115 bà huyện thanh quan p9, q3', NULL, '2019-05-14 13:01:53'),
(42, 'Hải anh', 'azalea.vu87@gmail.com', '0942822444', '115 Ba huyen Thanh Quan', NULL, '2019-05-15 08:04:12'),
(43, 'Hải anh', 'azalea.vu87@gmail.com', '0942822444', '115 Ba huyen Thanh Quan', NULL, '2019-05-15 08:05:47'),
(44, 'Nguyen Thi Thuy Duong', 'bttthuyduong@gmail.com', '0976807092', 'VPBank Tower 1-1A-2 Tôn Đức Thắng, Quận 1, HCM', NULL, '2019-06-06 13:02:47'),
(45, 'Thuy Duong', 'bttthuyduong@gmail.com', '0976807092', 'VPBank Tower 1-1A-2 Ton Duc Thang, Quan 1, HCM', NULL, '2019-06-06 13:05:43'),
(46, 'Thuy Duong', 'bttthuyduong@gmail.com', '0976807092', 'VPBank Tower 1-1A-2 Ton Duc Thang, Quan 1, HCM', NULL, '2019-06-06 13:07:33'),
(47, 'test', 'test@123.com', '0900022234', '1041 trần xuân soan q7', NULL, '2019-06-13 03:28:24'),
(48, 'test', 'test@123.com', '0900022234', '1041 trần xuân soan q7', NULL, '2019-06-13 03:29:58'),
(49, 'test', 'test@gmail.com', '0900022234', '1041 trần xuân soan q7', NULL, '2019-06-13 03:33:45'),
(50, 'test', 'test@gmail.com', '0900022234', '1041 trần xuân soan q7', NULL, '2019-06-13 03:35:19'),
(51, 'test', 'test@gmail.com', '0900022234', '1041 trần xuân soan q7', NULL, '2019-06-13 03:39:59'),
(52, 'HỒ THẾ VINH', 'vualamvuahoc7x@gmail.com', '0909787887', '102 Nguyễn Văn Cừ, P.An Khánh, Q.Ninh Kiều, TP.Cần Thơ', NULL, '2019-07-25 02:47:07'),
(53, 'hgf', 'nggggg@gmail.com', '0913455656', '85 ggf', NULL, '2019-08-05 16:25:47'),
(54, 'hgf', 'nggggg@gmail.com', '0913455656', '85 ggf', NULL, '2019-08-05 16:25:50'),
(55, 'Vy', 'vyq22@gmail.com', '0918235532', '82', NULL, '2019-08-16 00:32:30'),
(56, 'NHAT MY CO.,LTD', 'nhatmyvn@gmail.com', '5113888217', '01 b TRAN BINH TRONG', NULL, '2019-08-16 01:06:29'),
(57, 'Kim Ly', 'kimlylt.le@gmail.com', '0975606914', '259A Hai Bà Trưng, phường 6, quận 3, HCM', NULL, '2019-08-19 03:48:32'),
(58, 'Henry Ngo', 'henrytngo@gmail.com', '+14084894998', '5917 Howell Street, Oakland, CA 94609-1515, United States', NULL, '2019-08-28 19:10:01'),
(59, 'Be Hoang', 'behoang03@outlook.com', '(510) 491-7184 ', '139 Haverhill ct San Jose ca 95051', NULL, '2019-09-12 03:57:25'),
(60, 'Nhi Bui', 'ntb9388@gmail.com', '8177570580', '88/5 Mac Dinh Chi, Phuong Da Kao, Quan 1, TPHCM', NULL, '2019-11-12 14:32:08'),
(61, 'NGUYỆT ÁNH', 'Nguyetanh618@gmail.com', '0976980651', 'số 17 ngõ 172 phú diễn - bắc từ liêm- hà  nội', NULL, '2019-11-24 03:01:13'),
(62, 'Nguyễn Đặng Thanh Tuyền', 'tnguyen15076@llcc.edu', '0943980038', '207/13 phường 4, quốc lộ 1, thành phố Tân An, Long An', NULL, '2019-11-29 06:58:55'),
(63, 'Tran HA', 'afasf@gmail.com', '0402300203', 'askskasksaka', NULL, '2019-12-30 19:42:56'),
(64, 'test', 'tientai.vt@gmail.com', '0908232967', 'Ba Ria Vung Tau', NULL, '2020-02-26 07:12:14'),
(65, 'Thhy', 'Thuthuy29kt@yahoo.com.vn', '09494949144', '4567uzvajb', NULL, '2020-02-28 01:05:01'),
(66, 'Huỳnh Thị Thanh Nguyên', 'nguyentttstp@gmail.com', '0909485756', '295 nguyễn bình, phú xuân, nhà bè', NULL, '2020-04-29 15:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logos`
--

CREATE TABLE `logos` (
  `id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `logos`
--

INSERT INTO `logos` (`id`, `name`, `image`, `url`) VALUES
(1, 'Logo7', 'elem-clients_17.png', '/'),
(2, 'Logo6', 'elem-clients_16.png', '/'),
(3, 'Logo5', 'elem-clients_15.png', '/'),
(4, 'Logo4', 'elem-clients_13.png', '/'),
(5, 'Logo3', 'elem-clients_11.png', '/'),
(6, 'Logo2', 'elem-clients_10.png', '/'),
(7, 'Logo1', 'elem-clients_14.png', '/');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `link` varchar(50) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `is_active` tinyint(2) NOT NULL COMMENT '1:Enable,0:Disable',
  `is_parent` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `link`, `icon`, `is_active`, `is_parent`) VALUES
(15, 'Quản lý menu', 'menu', 'fa fa-list-alt', 1, 0),
(18, 'Quản lý sản phẩm', '/products', 'fa fa-credit-card', 1, 0),
(19, 'Nhóm sản phẩm', '/categories', 'fa fa-credit-card', 1, 18),
(20, 'Thiệp cưới', '/products', 'fa fa-credit-card', 1, 18),
(21, 'Quản lý banner', '/banners', 'fa fa-image', 1, 0),
(22, 'Quản lý khách hàng', '/customers', 'fa fa-users', 1, 0),
(23, 'Quản lý đơn hàng', '/orders', 'fa fa-clipboard', 1, 0),
(24, 'Quản lý logo', '/logos', 'fa fa-image', 1, 0),
(25, 'Quản lý nội dung', '/news', 'fa fa-clipboard', 1, 0),
(26, 'Quản lý mã khuyến mãi', '/coupon', 'fa fa-credit-card', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `youtube_url` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(3) NOT NULL COMMENT '1:Enable,0:Disable',
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `youtube_url`, `content`, `image`, `status`, `date_created`) VALUES
(1, 'Giới thiệu', 'Thiệp cưới online giao hàng miễn phí', 'https://www.youtube.com/watch?v=GZNP9Xdv4rI', '<p>Thiệp cưới online giao h&agrave;ng miễn ph&iacute;</p>\r\n\r\n<p style=\"text-align: center;\"><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/OUB6zKc-Tos\" width=\"560\"></iframe></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><iframe frameborder=\"0\" height=\"180\" scrolling=\"no\" src=\"https://mp3.zing.vn/embed/song/ZW8I8008\" width=\"640\"></iframe></p>', 'img-blog_04-1170x658.jpg', 1, '2017-09-27 00:00:00'),
(2, 'Dịch vụ thiết kế online', 'Dịch vụ thiết kế online', NULL, '<p>Dịch vụ thiết kế online</p>', 'sa.jpg', 1, '2017-09-27 00:00:00'),
(3, 'Liên hệ', 'Dịch vụ thiết kế online', NULL, '<p>Dịch vụ thiết kế online</p>', '02roz4love.jpg', 1, '2017-09-27 00:00:00'),
(4, 'clip ca nhạc', 'sdasdasdf', 'https://www.youtube.com/watch?v=LjGPYw9wmZU', '<p><img alt=\"\" src=\"https://imgur.com/a/HnI9M\" /><img alt=\"\" src=\"https://imgur.com/a/HnI9M\" style=\"height:4000px; width:800px\" /></p>', '14217b_61501183a0864c0c8b9b37bf904d2979-1.png', 1, '2018-03-13 00:00:00');
INSERT INTO `news` (`id`, `title`, `description`, `youtube_url`, `content`, `image`, `status`, `date_created`) VALUES
(5, 'Mẫu trang trí tham khảo', 'Font & Accesories sample', 'https://www.youtube.com/watch?v=LjGPYw9wmZU', '<p>Each product can be completely customized to match your wedding theme.</p>\r\n\r\n<p>We know how special Your wedding is to you and how important it is to get every detail just perfect!<br />\r\n<br />\r\nThat is why, you can choose your perfect colors &amp; fonts from our charts.&nbsp;<br />\r\n<br />\r\nGreat selection of types of fonts, colors of papers, envelopes, ribbons and threads</p>\r\n\r\n<p>will help you to create Your ideal design.</p>\r\n\r\n<p>If you cannot find what you are searching for - just let us know.</p>\r\n\r\n<p>We love custom orders!</p>\r\n\r\n<p>Font chart</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/1.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/2.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/3.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/4.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/5.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/6.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/7.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/8.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/9.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/10.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/11.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/12.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/13.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/14.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/15.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/16.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/17.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/18.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/19.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/20.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/21.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/22.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/23.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/24.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/25.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/26.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/27.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/28.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/29.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/30.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/31.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/32.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/33.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/34.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/35.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/36.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/37.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/38.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/39.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/40.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/41.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/42.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/43.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/44.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/45.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/46.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/47.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/48.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/49.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/50.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/51.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/52.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/53.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/54.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/55.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/56.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/57.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/58.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/59.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/60.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/61.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/62.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/63.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/64.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/65.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/66.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/67.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/68.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/69.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/70.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/71.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/72.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/73.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/74.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/75.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/76.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/77.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/78.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/79.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/80.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/81.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/82.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/83.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/84.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/85.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/86.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/87.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/88.svg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com/templates/template_7/img/fonts/89.svg\" /></p>\r\n\r\n<p>ribon color</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_979_pl.jpg\" /></p>\r\n\r\n<p>light blue</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_978_pl.jpg\" /></p>\r\n\r\n<p>turquoise</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_977_pl.jpg\" /></p>\r\n\r\n<p>tiffany blue</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_976_pl.jpg\" /></p>\r\n\r\n<p>hot pink</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_975_pl.jpg\" /></p>\r\n\r\n<p>pink</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_974_pl.jpg\" /></p>\r\n\r\n<p>purple</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_973_pl.jpg\" /></p>\r\n\r\n<p>violet</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_972_pl.jpg\" /></p>\r\n\r\n<p>light plum</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_971_pl.jpg\" /></p>\r\n\r\n<p>thistle</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_970_pl.jpg\" /></p>\r\n\r\n<p>burgundy</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_969_pl.jpg\" /></p>\r\n\r\n<p>red</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_968_pl.jpg\" /></p>\r\n\r\n<p>orange</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_967_pl.jpg\" /></p>\r\n\r\n<p>yellow</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_966_pl.jpg\" /></p>\r\n\r\n<p>gold</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_965_pl.jpg\" /></p>\r\n\r\n<p>peach</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_964_pl.jpg\" /></p>\r\n\r\n<p>brown</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_963_pl.jpg\" /></p>\r\n\r\n<p>tan</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_962_pl.jpg\" /></p>\r\n\r\n<p>beige</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_961_pl.jpg\" /></p>\r\n\r\n<p>olive</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_960_pl.jpg\" /></p>\r\n\r\n<p>light olive</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_950_pl.jpg\" /></p>\r\n\r\n<p>white</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_951_pl.jpg\" /></p>\r\n\r\n<p>ecru</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_952_pl.jpg\" /></p>\r\n\r\n<p>silver</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_959_pl.jpg\" /></p>\r\n\r\n<p>dark green</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_958_pl.jpg\" /></p>\r\n\r\n<p>green</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_957_pl.jpg\" /></p>\r\n\r\n<p>greenyellow</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_956_pl.jpg\" /></p>\r\n\r\n<p>pale green</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_955_pl.jpg\" /></p>\r\n\r\n<p>mint</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_954_pl.jpg\" /></p>\r\n\r\n<p>black</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_953_pl.jpg\" /></p>\r\n\r\n<p>grey</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_980_pl.jpg\" /></p>\r\n\r\n<p>blue</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_981_pl.jpg\" /></p>\r\n\r\n<p>royal blue</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_982_pl.jpg\" /></p>\r\n\r\n<p>sky blue</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_983_pl.jpg\" /></p>\r\n\r\n<p>navy blue</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/3_984_pl.jpg\" /></p>\r\n\r\n<p>like on the picture</p>\r\n\r\n<p>paper color</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_896_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_897_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_898_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_899_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_900_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_901_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_902_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_903_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_904_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_895_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_894_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_893_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_892_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_891_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_890_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_889_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_888_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_905_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_906_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_907_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_908_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_909_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_910_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_911_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_912_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_913_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_914_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_915_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_916_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_917_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_918_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_919_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_920_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_921_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_922_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_923_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_924_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_925_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_926_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_927_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_928_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_929_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_930_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_931_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_932_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_933_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_934_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_935_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_936_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_937_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_938_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_939_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_940_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_941_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_942_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_943_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_944_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_945_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_946_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_947_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_948_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/22_949_pl.jpg\" /></p>\r\n\r\n<p>envelopes color</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_884_pl.jpg\" /></p>\r\n\r\n<p>white shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_860_pl.jpg\" /></p>\r\n\r\n<p>tiffany blue</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_861_pl.jpg\" /></p>\r\n\r\n<p>cyan mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_857_pl.jpg\" /></p>\r\n\r\n<p>light blue mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_856_pl.jpg\" /></p>\r\n\r\n<p>hot pink shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_855_pl.jpg\" /></p>\r\n\r\n<p>hot pink mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_854_pl.jpg\" /></p>\r\n\r\n<p>pink shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_853_pl.jpg\" /></p>\r\n\r\n<p>pink mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_852_pl.jpg\" /></p>\r\n\r\n<p>blush mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_851_pl.jpg\" /></p>\r\n\r\n<p>plum shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_850_pl.jpg\" /></p>\r\n\r\n<p>plum mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_849_pl.jpg\" /></p>\r\n\r\n<p>purple mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_848_pl.jpg\" /></p>\r\n\r\n<p>marsala mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_847_pl.jpg\" /></p>\r\n\r\n<p>red shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_846_pl.jpg\" /></p>\r\n\r\n<p>red mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_845_pl.jpg\" /></p>\r\n\r\n<p>orange mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_844_pl.jpg\" /></p>\r\n\r\n<p>yellow mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_843_pl.jpg\" /></p>\r\n\r\n<p>mirror gold</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_842_pl.jpg\" /></p>\r\n\r\n<p>old gold shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_841_pl.jpg\" /></p>\r\n\r\n<p>gold shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_840_pl.jpg\" /></p>\r\n\r\n<p>brown shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_839_pl.jpg\" /></p>\r\n\r\n<p>coffee eco</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_838_pl.jpg\" /></p>\r\n\r\n<p>brown eco</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_837_pl.jpg\" /></p>\r\n\r\n<p>beige shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_836_pl.jpg\" /></p>\r\n\r\n<p>green shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_835_pl.jpg\" /></p>\r\n\r\n<p>green mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_834_pl.jpg\" /></p>\r\n\r\n<p>lemon shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_833_pl.jpg\" /></p>\r\n\r\n<p>mint mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_832_pl.jpg\" /></p>\r\n\r\n<p>pistachio eco</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_831_pl.jpg\" /></p>\r\n\r\n<p>corn eco</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_830_pl.jpg\" /></p>\r\n\r\n<p>peach mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_829_pl.jpg\" /></p>\r\n\r\n<p>black shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_828_pl.jpg\" /></p>\r\n\r\n<p>black mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_827_pl.jpg\" /></p>\r\n\r\n<p>silver mirror</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_826_pl.jpg\" /></p>\r\n\r\n<p>dark grey shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_825_pl.jpg\" /></p>\r\n\r\n<p>grey mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_824_pl.jpg\" /></p>\r\n\r\n<p>light grey mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_823_pl.jpg\" /></p>\r\n\r\n<p>grey eco</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_881_pl.jpg\" /></p>\r\n\r\n<p>white linen</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_882_pl.jpg\" /></p>\r\n\r\n<p>white embossed 1</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_883_pl.jpg\" /></p>\r\n\r\n<p>white embossed 2</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_818_pl.jpg\" /></p>\r\n\r\n<p>ecru shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_817_pl.jpg\" /></p>\r\n\r\n<p>ecru linen</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_816_pl.jpg\" /></p>\r\n\r\n<p>ecru eco</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_815_pl.jpg\" /></p>\r\n\r\n<p>ecru mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_862_pl.jpg\" /></p>\r\n\r\n<p>royal blue</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_863_pl.jpg\" /></p>\r\n\r\n<p>blue shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_864_pl.jpg\" /></p>\r\n\r\n<p>dark blue</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_865_pl.jpg\" /></p>\r\n\r\n<p>navy blue mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_880_pl.jpg\" /></p>\r\n\r\n<p>white mat</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_885_pl.jpg\" /></p>\r\n\r\n<p>ice white shimmer</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/33_887_pl.jpg\" /></p>\r\n\r\n<p>as on the picture</p>\r\n\r\n<p>thread color</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1035_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1034_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1033_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1032_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1030_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1031_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1050_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1049_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1048_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1047_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1046_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1045_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1044_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1043_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1042_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1040_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1037_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1038_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1039_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1036_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1041_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1026_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1027_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1028_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1029_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1025_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1023_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1022_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1051_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1052_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1053_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1213_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1054_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/26_1055_pl.jpg\" /></p>\r\n\r\n<p>Main Envelope Seal</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1359_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1360_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1361_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1362_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1363_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1387_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1388_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1391_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1392_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1393_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1394_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1395_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1396_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1397_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1398_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1399_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1400_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1401_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1402_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1403_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1404_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1405_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1406_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1407_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1408_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1409_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/51_1410_pl.jpg\" /></p>\r\n\r\n<p>Wax seal color</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/50_1349_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/50_1350_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/50_1351_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/50_1352_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/50_1353_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/50_1354_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/50_1355_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/50_1356_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/50_1358_pl.jpg\" /></p>\r\n\r\n<p>Twine color</p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1118_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1119_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1117_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1114_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1115_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1113_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1116_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1120_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1121_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1122_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1123_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1124_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1125_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1126_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1127_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1128_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1129_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1130_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1131_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1132_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1133_pl.jpg\" /></p>\r\n\r\n<p><img src=\"https://4lovepolkadots.com//templates/template_7/8/images/thumb.php?x=250&amp;file=templates/template_7/8/images/products_options/34_1134_pl.jpg\" /></p>', '', 1, '2018-03-13 00:00:00');
INSERT INTO `news` (`id`, `title`, `description`, `youtube_url`, `content`, `image`, `status`, `date_created`) VALUES
(8, 'Những điểm khác biệt thú vị trong đám cưới xưa và nay', 'Những điểm khác biệt thú vị trong đám cưới xưa và nay', 'http://thiepcuoionline.vn/uploads/images/02roz4love.jpg', '<h1>Những điểm kh&aacute;c biệt th&uacute; vị trong đ&aacute;m cưới xưa v&agrave; nay</h1>\r\n\r\n<p><img alt=\"\" src=\"https://mbi.dkn.tv/wp-content/uploads/2017/02/DAICUOI.jpg\" style=\"height:353px; width:675px\" /></p>\r\n\r\n<p><strong>Cưới hỏi l&agrave; dịp trọng đại của đời người v&agrave; cũng l&agrave; một cột mốc quan trọng đ&aacute;nh dấu sự gắn kết của đ&ocirc;i nam nữ, ch&iacute;nh v&igrave; vậy từng chi tiết trong đ&aacute;m cưới đều được chăm ch&uacute;t kĩ lưỡng. Thế nhưng theo thời gian, việc tổ chức đ&aacute;m cưới đ&atilde; c&oacute; nhiều thay đổi r&otilde; rệt&hellip;</strong></p>\r\n\r\n<p><strong>1. Thiệp hồng</strong></p>\r\n\r\n<p>Thiệp hồng ch&iacute;nh l&agrave; &ldquo;dấu hiệu&rdquo; đầu ti&ecirc;n của một đ&aacute;m cưới. Chắc hẳn ch&uacute;ng ta ai cũng c&ograve;n nhớ những tấm thiệp đỏ, thơm nức với những d&ograve;ng chữ được viết rất cầu k&igrave; thuở nhỏ.</p>\r\n\r\n<p>Thiệp hồng c&oacute; lịch sử kh&aacute; l&acirc;u đời. Trước đ&acirc;y v&agrave;o giai đoạn 1960 &ndash; 1970, người ta mời cưới chỉ đơn thuần l&agrave; mời miệng. Dần dần, người ta th&ocirc;ng b&aacute;o việc tổ chức đ&aacute;m cưới bằng những tờ giấy b&aacute;o hỉ c&oacute; ghi thời gian, địa điểm r&otilde; r&agrave;ng.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-055620-thiep-moi-cuoi_520x694.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Thiệp cưới ngày xưa là những tờ giấy báo hỉ có ghi thời gian, địa điểm rõ ràng. \" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-055906-tam-thiep-cuoi-1990-va-bang-chi-phi-khong-qua-335000-gay-sot-14-151547_600x800.jpg\" title=\"Thiệp cưới ngày xưa là những tờ giấy báo hỉ có ghi thời gian, địa điểm rõ ràng. \" /></p>\r\n\r\n<p><em>Thiệp cưới ng&agrave;y xưa l&agrave;&nbsp;những tờ giấy b&aacute;o hỉ c&oacute; ghi thời gian, địa điểm r&otilde; r&agrave;ng.</em></p>\r\n\r\n<p>Những năm 90, thiệp cưới mới bắt đầu phổ biến với những mẫu m&atilde; từ đơn giản đến phức tạp. M&agrave;u sắc l&uacute;c bấy giờ thường l&agrave; m&agrave;u đỏ, hồng thể hiện cho t&igrave;nh y&ecirc;u v&agrave; hạnh ph&uacute;c lứa đ&ocirc;i.</p>\r\n\r\n<p>Ng&agrave;y&nbsp;nay, thiệp cưới được thiết kế v&ocirc; c&ugrave;ng bắt mắt với đủ mọi m&agrave;u sắc, kiểu d&aacute;ng v&agrave; họa tiết kh&aacute;c nhau. Đặc biệt nhất l&agrave; c&agrave;ng ng&agrave;y c&agrave;ng c&oacute; nhiều cặp đ&ocirc;i tự thiết kế mẫu thiệp mời kh&ocirc;ng đụng h&agrave;ng để thể hiện c&aacute; t&iacute;nh của m&igrave;nh.</p>\r\n\r\n<p><img alt=\"\" src=\"http://thiepcuoionline.vn/uploads/images/H08.jpg\" style=\"height:480px; width:600px\" /></p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060137-thiep-moi-cuoi-1_600x462.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"gày nay, thiệp cưới được thiết kế vô cùng bắt mắt với đủ mọi màu sắc, kiểu dáng và họa tiết khác nhau.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060139-thiep-cuoi-dep-mau-hong-9_520x347.jpg\" title=\"gày nay, thiệp cưới được thiết kế vô cùng bắt mắt với đủ mọi màu sắc, kiểu dáng và họa tiết khác nhau.\" /></p>\r\n\r\n<p><em>Ng&agrave;y&nbsp;nay, thiệp cưới được thiết kế v&ocirc; c&ugrave;ng bắt mắt với đủ mọi m&agrave;u sắc, kiểu d&aacute;ng v&agrave; họa tiết kh&aacute;c nhau.</em></p>\r\n\r\n<p><strong>2. Ảnh cưới</strong></p>\r\n\r\n<p>Ảnh cưới được c&aacute;c c&ocirc; d&acirc;u ch&uacute; rể đặc biệt quan t&acirc;m để kỉ niệm lại sự kiện quan trọng trong đời của m&igrave;nh. Trước đ&acirc;y, ảnh cưới l&agrave; ảnh trắng đen, đến thế kỉ 19 mới c&oacute; ảnh m&agrave;u v&agrave; được đ&ocirc;i uy&ecirc;n ương chọn chụp ở nhiều địa điểm kh&aacute;c nhau.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060215-dam-cuoi-xua-va-nay-6_600x423.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060217-dam-cuoi-xua-va-nay-5_600x652.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060322-damcuoingayxua7_520x807.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Trước đây, ảnh cưới là ảnh trắng đen, đến thế kỉ 19 mới có ảnh màu và được đôi uyên ương chọn chụp ở nhiều địa điểm khác nhau. \" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060214-dam-cuoi-xua-va-nay-4_600x457.jpg\" title=\"Trước đây, ảnh cưới là ảnh trắng đen, đến thế kỉ 19 mới có ảnh màu và được đôi uyên ương chọn chụp ở nhiều địa điểm khác nhau. \" /></p>\r\n\r\n<p><em>Trước đ&acirc;y, ảnh cưới l&agrave; ảnh trắng đen, đến thế kỉ 19 mới c&oacute; ảnh m&agrave;u v&agrave; được đ&ocirc;i uy&ecirc;n ương chọn chụp ở nhiều địa điểm kh&aacute;c nhau.</em></p>\r\n\r\n<p>Giờ đ&acirc;y, nh&igrave;n bộ ảnh cưới của c&aacute;c cặp đ&ocirc;i chắc hẳn bạn kh&ocirc;ng khỏi trầm trồ về độ đầu tư kĩ lưỡng. Từ trang phục đến bối cảnh đều c&oacute; sẵn một &ecirc;-k&iacute;p chuy&ecirc;n nghiệp để lo liệu cho c&ocirc;ng việc n&agrave;y. Thậm ch&iacute; rất nhiều cặp đ&ocirc;i c&ograve;n quay video để lưu lại khoảnh khắc đ&aacute;ng nhớ của m&igrave;nh.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060735-dam-cuoi-xua-va-nay-7_600x376.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060736-dam-cuoi-xua-va-nay-8_600x450.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Từ trang phục đến bối cảnh đều có sẵn một ê-kíp chuyên nghiệp để lo liệu cho công việc này.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060551-kinh-nghiem-chup-anh-cuoi-o-xa-tien-cho-dich-vu_600x400.jpg\" title=\"Từ trang phục đến bối cảnh đều có sẵn một ê-kíp chuyên nghiệp để lo liệu cho công việc này.\" /></p>\r\n\r\n<p><em>Từ trang phục đến bối cảnh đều c&oacute; sẵn một &ecirc;-k&iacute;p chuy&ecirc;n nghiệp để lo liệu cho c&ocirc;ng việc n&agrave;y.</em></p>\r\n\r\n<p><strong>3. Trang phục c&ocirc; d&acirc;u, ch&uacute; rể</strong></p>\r\n\r\n<p>Ng&agrave;y xưa, ch&uacute; rể sẽ diện vest thắt c&agrave; vạt c&agrave;i hoa trước ngực, c&aacute;c c&ocirc; d&acirc;u thường mặc &aacute;o d&agrave;i hay v&aacute;y trắng đăng-ten k&iacute;n đ&aacute;o. Kiểu trang điểm thường thấy nhất của c&aacute;c &ldquo;t&acirc;n nương&rdquo; ch&iacute;nh l&agrave; m&ocirc;i son đỏ nổi bật v&agrave; rạng rỡ.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060624-dam-cuoi-xua-va-nay-14_600x450.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Ngày xưa, chú rể sẽ diện vest đen và cài hoa trước ngực, các cô dâu thường mặc áo dài hay váy trắng đăng-ten kín đáo.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-060625-dam-cuoi-xua-va-nay-18_600x398.jpg\" title=\"Ngày xưa, chú rể sẽ diện vest đen và cài hoa trước ngực, các cô dâu thường mặc áo dài hay váy trắng đăng-ten kín đáo.\" /></p>\r\n\r\n<p><em>Ng&agrave;y xưa, ch&uacute; rể sẽ diện vest thắt c&agrave; vạt c&agrave;i hoa trước ngực, c&aacute;c c&ocirc; d&acirc;u thường mặc &aacute;o d&agrave;i hay v&aacute;y trắng đăng-ten k&iacute;n đ&aacute;o.</em></p>\r\n\r\n<p>Ng&agrave;y nay, c&ocirc; d&acirc;u ch&uacute; rể c&oacute; nhiều sự lựa chọn hơn cho đ&aacute;m cưới của m&igrave;nh, thay v&igrave; kiểu thắt c&agrave; vạt chủ rể ng&agrave;y nay thường thắt nơ. Đặc biệt l&agrave; c&ocirc; d&acirc;u hiện đại, họ ăn mặc theo &yacute; th&iacute;ch của m&igrave;nh từ v&aacute;y x&ograve;e bồng, v&aacute;y đu&ocirc;i c&aacute;, v&aacute;y su&ocirc;ng, v&aacute;y kiểu dạ hội đến c&aacute;c kiểu v&aacute;y ngắn,&hellip; Thậm ch&iacute; c&ocirc; d&acirc;u c&oacute; thể thay nhiều trang phục cưới theo nhiều phong c&aacute;ch kh&aacute;c nhau.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061041-amk1382136750_520x795.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Ngày nay, cô dâu chú rể có nhiều sự lựa chọn hơn cho đám cưới của mình.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061043-chon-vay-cuoi-cho-co-dau-vai-to-6_520x757.jpg\" title=\"Ngày nay, cô dâu chú rể có nhiều sự lựa chọn hơn cho đám cưới của mình.\" /></p>\r\n\r\n<p><em>Ng&agrave;y nay, c&ocirc; d&acirc;u ch&uacute; rể c&oacute; nhiều sự lựa chọn hơn cho đ&aacute;m cưới của m&igrave;nh.</em></p>\r\n\r\n<p><strong>4. Xe rước d&acirc;u</strong></p>\r\n\r\n<p>Xe rước d&acirc;u phổ biến trong đ&aacute;m cưới ng&agrave;y xưa thường l&agrave; xe đạp hoặc đi bộ. Những gia đ&igrave;nh kh&aacute; giả c&oacute; thể rước d&acirc;u bằng xe m&aacute;y hoặc &ocirc; t&ocirc;. Ở những v&ugrave;ng s&ocirc;ng nước, bạn sẽ thấy một đặc điểm th&uacute; vị l&agrave; rước d&acirc;u bằng đ&ograve;.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061104-dam-cuoi-xua-va-nay-16_600x388.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /><br />\r\n<img alt=\"Xe rước dâu phổ biến trong đám cưới ngày xưa thường là xe đạp hoặc đi bộ.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061105-dam-cuoi-xua-va-nay-17_600x799.jpg\" title=\"Xe rước dâu phổ biến trong đám cưới ngày xưa thường là xe đạp hoặc đi bộ.\" /></p>\r\n\r\n<p><em>Xe rước d&acirc;u phổ biến trong đ&aacute;m cưới ng&agrave;y xưa thường l&agrave; xe đạp hoặc đi bộ.</em></p>\r\n\r\n<p><img alt=\"những vùng sông nước, bạn sẽ thấy một đặc điểm thú vị là rước dâu bằng đò.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061418-damcuoisongnuoc_520x341.jpg\" title=\"những vùng sông nước, bạn sẽ thấy một đặc điểm thú vị là rước dâu bằng đò.\" /></p>\r\n\r\n<p><em>Những v&ugrave;ng s&ocirc;ng nước, bạn sẽ thấy một đặc điểm th&uacute; vị l&agrave; rước d&acirc;u bằng đ&ograve;.</em></p>\r\n\r\n<p>B&acirc;y giờ, ai cũng cho rằng rước d&acirc;u phải c&oacute; &ocirc; t&ocirc; l&agrave; điều hiển nhi&ecirc;n. Kh&ocirc;ng kh&oacute; để bạn bắt gặp một đo&agrave;n rước d&acirc;u to&agrave;n bằng xe hơi hạng sang tr&ecirc;n đường phố. B&ecirc;n cạnh đ&oacute; cũng c&oacute; nhiều c&ocirc; d&acirc;u ch&uacute; rể muốn tạo sự kh&aacute;c biệt bằng c&aacute;ch rước d&acirc;u bằng m&ocirc; t&ocirc; hoặc xe m&aacute;y cổ.</p>\r\n\r\n<p><img alt=\"Không khó để bạn bắt gặp một đoàn rước dâu toàn bằng xe hơi hạng sang trên đường phố.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061118-dam-cuoi-xua-va-nay-19_600x400.jpg\" title=\"Không khó để bạn bắt gặp một đoàn rước dâu toàn bằng xe hơi hạng sang trên đường phố.\" /></p>\r\n\r\n<p><em>Kh&ocirc;ng kh&oacute; để bạn bắt gặp một đo&agrave;n rước d&acirc;u to&agrave;n bằng xe hơi hạng sang tr&ecirc;n đường phố.</em></p>\r\n\r\n<p><img alt=\"Có nhiều cô dâu chú rể muốn tạo sự khác biệt bằng cách rước dâu bằng mô tô hoặc xe máy cổ. \" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061507-maxresdefault_520x434.jpg\" title=\"Có nhiều cô dâu chú rể muốn tạo sự khác biệt bằng cách rước dâu bằng mô tô hoặc xe máy cổ. \" /></p>\r\n\r\n<p><em>C&oacute; nhiều c&ocirc; d&acirc;u ch&uacute; rể muốn tạo sự kh&aacute;c biệt bằng c&aacute;ch rước d&acirc;u bằng m&ocirc; t&ocirc; hoặc xe m&aacute;y cổ.</em></p>\r\n\r\n<p><strong>5. Nghi thức&nbsp;</strong></p>\r\n\r\n<p>Đ&aacute;m cưới ng&agrave;y xưa được chia ra l&agrave;m hai phần: Lễ v&agrave; hội do ảnh hưởng của thuyết &ldquo;thọ mai gia lễ&rdquo;. Phần lễ gồm c&ograve;n c&aacute;c nghi thức: Th&aacute;ch cưới, đ&oacute;n d&acirc;u, đưa d&acirc;u, lại mặt. Phần hội được tổ chức với hoạt động ăn uống, ca h&aacute;t. Đ&aacute;m cưới được tổ chức nhiều ng&agrave;y, ng&agrave;y ch&iacute;nh th&igrave; mời tất cả mọi người, c&ograve;n những ng&agrave;y phụ th&igrave; mời anh em, họ h&agrave;ng th&acirc;n th&iacute;ch đến d&ugrave;ng cơm.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061532-dam-cuoi-xua-va-nay-21_600x396.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061533-dam-cuoi-xua-va-nay-11_600x387.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Đám cưới ngày xưa được chia ra làm hai phần: lễ và hội do ảnh hưởng của thuyết &quot;thọ mai gia lễ&quot;.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061531-dam-cuoi-xua-va-nay-9_600x400.jpg\" title=\"Đám cưới ngày xưa được chia ra làm hai phần: lễ và hội do ảnh hưởng của thuyết &quot;thọ mai gia lễ&quot;.\" /></p>\r\n\r\n<p><em>Đ&aacute;m cưới ng&agrave;y xưa được chia ra l&agrave;m hai phần: lễ v&agrave; hội do ảnh hưởng của thuyết &ldquo;thọ mai gia lễ&rdquo;.</em></p>\r\n\r\n<p>C&ograve;n ng&agrave;y nay khi đến tham dự đ&aacute;m cưới, bạn sẽ thấy hẳn một &ecirc;-k&iacute;p chuy&ecirc;n nghiệp từ MC đến nhạc c&ocirc;ng, thậm ch&iacute; l&agrave; đội ngũ b&ecirc; tr&aacute;p. C&ocirc; d&acirc;u ch&uacute; rể v&agrave; quan kh&aacute;ch chỉ cần l&agrave;m theo sự điều khiển của người MC. Những nghi lễ cũng kh&ocirc;ng qu&aacute; cầu k&igrave; m&agrave; ch&uacute; trọng v&agrave; phần hội để tạo kh&ocirc;ng kh&iacute; vui vẻ, cởi mở cho mọi người.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061555-dam-cuoi-xua-va-nay-22_600x338.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Những nghi lễ cũng không quá cầu kì mà chú trọng và phần hội để tạo không khí vui vẻ, cởi mở cho mọi người. \" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-061905-jh_520x269.jpg\" title=\"Những nghi lễ cũng không quá cầu kì mà chú trọng và phần hội để tạo không khí vui vẻ, cởi mở cho mọi người. \" /></p>\r\n\r\n<p><strong>6. Qu&agrave; cưới</strong></p>\r\n\r\n<p>Qu&agrave; cưới cũng l&agrave; một c&acirc;u chuyện th&uacute; vị. Ng&agrave;y xưa, qu&agrave; cưới mang t&iacute;nh thiệt thực cao như &nbsp;xoong, chậu, ph&iacute;ch nước,bếp dầu, lốp xe đạp, b&aacute;t sứ,&hellip; để phục vụ cho cuộc sống mới của đ&ocirc;i trẻ. Dần dần, h&igrave;nh thức đi tiền mừng cưới được mọi người &aacute;p dụng v&igrave; sự tiện lợi hơn.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-062040-anh-cuoi-dac-biet-1299709_600x400.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Ngày xưa, quà cưới mang tính thiệt thực cao như  xoong, chậu, phích nước,bếp dầu, lốp xe đạp, bát sứ,... để phục vụ cho cuộc sống mới của đôi trẻ.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-062041-dam-cuoi-viet-1980-16_520x347.jpg\" title=\"Ngày xưa, quà cưới mang tính thiệt thực cao như  xoong, chậu, phích nước,bếp dầu, lốp xe đạp, bát sứ,... để phục vụ cho cuộc sống mới của đôi trẻ.\" /></p>\r\n\r\n<p><em>Ng&agrave;y xưa, qu&agrave; cưới mang t&iacute;nh thiệt thực cao như &nbsp;xoong, chậu, ph&iacute;ch nước,bếp dầu, lốp xe đạp, b&aacute;t sứ,&hellip; để phục vụ cho cuộc sống mới của đ&ocirc;i trẻ.</em></p>\r\n\r\n<p>C&ograve;n b&acirc;y giờ, qu&agrave; cưới kh&ocirc;ng chỉ mang &yacute; nghĩa ch&uacute;c ph&uacute;c cho c&ocirc; d&acirc;u ch&uacute; rể m&agrave; c&ograve;n thể hiện được đẳng cấp của người đến dự. Đ&aacute;m cưới c&agrave;ng linh đ&igrave;nh th&igrave; tiền mừng cưới cũng phải &ldquo;xứng tầm&rdquo;. Kh&aacute;ch đến dự chỉ cần để tiền mừng v&agrave;o &ldquo;th&ugrave;ng tiền mừng&rdquo; được trang tr&iacute; đẹp mắt.</p>\r\n\r\n<p><img alt=\"Khách đến dự chỉ cần để tiền mừng vào &quot;thùng tiền mừng&quot; được trang trí đẹp mắt. \" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-062107-dam-cuoi-xua-va-nay-24_600x400.jpg\" title=\"Khách đến dự chỉ cần để tiền mừng vào &quot;thùng tiền mừng&quot; được trang trí đẹp mắt. \" /></p>\r\n\r\n<p><em>Kh&aacute;ch đến dự chỉ cần để tiền mừng v&agrave;o &ldquo;th&ugrave;ng tiền mừng&rdquo; được trang tr&iacute; đẹp mắt.</em></p>\r\n\r\n<p><strong>7. Nơi tổ chức đ&aacute;m cưới</strong></p>\r\n\r\n<p>Thời xưa, đ&aacute;m cưới được tổ chức ngay trong nh&agrave; của c&ocirc; d&acirc;u, ch&uacute; rể. Nh&agrave; cửa sẽ được dọn dẹp tinh tương, b&agrave;y tr&iacute; gọn g&agrave;ng. Tr&ecirc;n tường d&aacute;n h&igrave;nh long phượng, t&ecirc;n c&ocirc; d&acirc;u ch&uacute; rể c&ugrave;ng một chữ Hỉ to tướng. Cổng sẽ được l&agrave;m bằng c&aacute;c loại l&aacute; c&acirc;y v&ocirc; c&ugrave;ng cầu k&igrave;.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-062337-cong-hoa-cuoi_520x399.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Thời xưa, đám cưới được tổ chức ngay trong nhà của cô dâu, chú rể.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-062338-damcuoixua_520x387.jpg\" title=\"Thời xưa, đám cưới được tổ chức ngay trong nhà của cô dâu, chú rể.\" /></p>\r\n\r\n<p><em>Thời xưa, đ&aacute;m cưới được tổ chức ngay trong nh&agrave; của c&ocirc; d&acirc;u, ch&uacute; rể.</em></p>\r\n\r\n<p>Đ&aacute;m cưới hiện đại sẽ được tổ chức tại nh&agrave; h&agrave;ng sang trọng, c&oacute; s&acirc;n khấu v&agrave; b&agrave;y b&agrave;n tiệc b&ecirc;n dưới. B&agrave;n tiệc được b&agrave;y tr&iacute; theo phong c&aacute;ch phương T&acirc;y với hoa, nến,&hellip; Thậm ch&iacute; c&oacute; rất nhiều gia đ&igrave;nh c&ograve;n tổ chức đ&aacute;m cưới ngo&agrave;i trời như tr&ecirc;n b&atilde;i biển hoặc tr&ecirc;n t&agrave;u, điều n&agrave;y đ&atilde; tạo n&ecirc;n một n&eacute;t mới mẻ v&agrave; kh&aacute;c biệt so với đ&aacute;m cưới xưa.</p>\r\n\r\n<p><img alt=\"Đám cưới hiện đại sẽ được tổ chức tại nhà hàng sang trọng, có sân khấu và bày bàn tiệc bên dưới.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-062341-dam-cuoi-xua-va-nay-12_600x358.jpg\" title=\"Đám cưới hiện đại sẽ được tổ chức tại nhà hàng sang trọng, có sân khấu và bày bàn tiệc bên dưới.\" /></p>\r\n\r\n<p><em>Đ&aacute;m cưới hiện đại sẽ được tổ chức tại nh&agrave; h&agrave;ng sang trọng, c&oacute; s&acirc;n khấu v&agrave; b&agrave;y b&agrave;n tiệc b&ecirc;n dưới.</em></p>\r\n\r\n<p><img alt=\"Thậm chí có rất nhiều gia đình còn tổ chức đám cưới ngoài trời .\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-062339-dam-cuoi-xua-va-nay-13_600x341.jpg\" title=\"Thậm chí có rất nhiều gia đình còn tổ chức đám cưới ngoài trời .\" /></p>\r\n\r\n<p><em>Thậm ch&iacute; c&oacute; rất nhiều gia đ&igrave;nh c&ograve;n tổ chức đ&aacute;m cưới ngo&agrave;i trời .</em></p>\r\n\r\n<p><strong>8. Chi ph&iacute; cho đ&aacute;m cưới</strong></p>\r\n\r\n<p>Hậu đ&aacute;m cưới, chi ph&iacute; đ&aacute;m cưới cũng ch&iacute;nh l&agrave; một trong những mối bận t&acirc;m của c&ocirc; d&acirc;u ch&uacute; rể. Từ xưa cho đến b&acirc;y giờ, việc &ldquo;lỗ&rdquo; hay &ldquo;l&atilde;i&rdquo; lu&ocirc;n được nhiều người để &yacute; đến. Kh&ocirc;ng c&oacute; g&igrave; lạ khi c&agrave;ng ng&agrave;y bạn c&agrave;ng thấy cảnh người ta phải đi &ldquo;c&agrave;y&rdquo; hoặc vay để chuẩn bị cho lễ cưới của m&igrave;nh. Đ&aacute;m cưới c&agrave;ng ho&agrave;nh tr&aacute;ng th&igrave; chi ph&iacute; ph&aacute;t sinh cũng c&agrave;ng nhiều, khiến kh&ocirc;ng chỉ vợ chồng trẻ m&agrave; ngay cả hai b&ecirc;n gia đ&igrave;nh cũng đặc biệt quan t&acirc;m.</p>\r\n\r\n<p><img alt=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-062411-dam-cuoi-xua-va-nay-25_600x427.jpg\" title=\"Những khác biệt thú vị về đám cưới ngày ấy - bây giờ\" /></p>\r\n\r\n<p><img alt=\"Hậu đám cưới, chi phí đám cưới cũng chính là một trong những mối bận tâm của cô dâu chú rể.\" src=\"http://inspired.dkn.tv/wp-content/uploads/2017/02/20161014-062412-dam-cuoi-xua-va-nay-26_600x650.jpg\" title=\"Hậu đám cưới, chi phí đám cưới cũng chính là một trong những mối bận tâm của cô dâu chú rể.\" /></p>\r\n\r\n<p><em>Hậu đ&aacute;m cưới, chi ph&iacute; đ&aacute;m cưới cũng ch&iacute;nh l&agrave; một trong những mối bận t&acirc;m của c&ocirc; d&acirc;u ch&uacute; rể.<br />\r\nNguồng DKN.</em></p>', '02roz4love1.jpg', 1, '2018-04-13 00:00:00'),
(9, '5 xu hướng thiết kế menu tiệc cưới được yêu thích nhất năm 2018', 'Nếu dự định tổ chức cưới trong năm nay bạn nhất định không được bỏ qua 5 xu hướng menu tiệc cưới “nóng hổi” này. Menu in hoa, màu nước hay bằng đá, gỗ ấn tượng… chắc chắn là mảnh ghép quan trọng để hiện thực hóa đám cưới trong mơ.\r\n\r\nNếu bạn sắp tổ chức đám cưới mà chưa chọn được mẫu menu tiệc cưới ưng ý thì hãy tham khảo ngay 5 xu hướng này nhé! Đây chính là các thiết kế menu được dự đoán sẽ “gây bão” trong năm 2018.', 'https://www.youtube.com/watch?v=Ed8LtddH1dM', '<h1>5 xu hướng thiết kế menu tiệc cưới được y&ecirc;u th&iacute;ch nhất năm 2018</h1>\r\n\r\n<p>Nếu dự định tổ chức cưới trong năm nay bạn nhất định kh&ocirc;ng được bỏ qua 5 xu hướng menu tiệc cưới &ldquo;n&oacute;ng hổi&rdquo; n&agrave;y. Menu in hoa, m&agrave;u nước hay bằng đ&aacute;, gỗ ấn tượng&hellip; chắc chắn l&agrave; mảnh gh&eacute;p quan trọng để hiện thực h&oacute;a đ&aacute;m cưới trong mơ.</p>\r\n\r\n<p>Nếu bạn sắp tổ chức đ&aacute;m cưới m&agrave; chưa chọn được mẫu menu tiệc cưới ưng &yacute; th&igrave; h&atilde;y tham khảo ngay 5 xu hướng n&agrave;y nh&eacute;! Đ&acirc;y ch&iacute;nh&nbsp;l&agrave; c&aacute;c thiết kế menu được dự đo&aacute;n sẽ &ldquo;g&acirc;y b&atilde;o&rdquo; trong năm 2018.</p>\r\n\r\n<h2>Menu&nbsp;họa tiết Floral</h2>\r\n\r\n<p>Floral &ndash; những họa tiết hoa l&aacute; tươi tắn lu&ocirc;n l&agrave; xu hướng kh&ocirc;ng bao giờ cũ cho c&aacute;c&nbsp;<a href=\"http://www.marry.vn/kinh-nghiem-cuoi/dam-cuoi/\" rel=\"noopener noreferrer\" target=\"_blank\">đ&aacute;m cưới</a>&nbsp;m&ugrave;a Xu&acirc;n-H&egrave;.&nbsp;Thay cho phong c&aacute;ch Greenery năm 2017, năm nay,&nbsp;họa tiết hoa Floral được thiết kế với m&agrave;u sắc rực rỡ lấy cảm hứng từ theme cưới Mexican.</p>\r\n\r\n<p>Theo đ&oacute;, họa tiết hoa l&aacute; tạo th&agrave;nh điểm nhấn nổi bật, cực kỳ thu h&uacute;t. Bạn chắc chắn kh&ocirc;ng thể rời mắt khỏi một menu tiệc cưới tr&ocirc;ng qua đ&atilde; thấy hấp dẫn như thế n&agrave;y:</p>\r\n\r\n<p><img alt=\"Menu tiệc cưới 1\" src=\"http://www.marry.vn/wp-content/uploads/2018/01/15/15/menu-tiec-cuoi-1.jpg\" style=\"height:902px; width:600px\" /><img alt=\"Menu tiệc cưới 2\" src=\"http://www.marry.vn/wp-content/uploads/2018/01/15/15/menu-tiec-cuoi-2.jpg\" style=\"height:900px; width:600px\" /></p>\r\n\r\n<p>Phong c&aacute;ch thiết kế menu n&agrave;y th&iacute;ch hợp cho&nbsp;<a href=\"http://www.marry.vn/dam-cuoi/mau-thuc-don-dam-cuoi\" rel=\"noopener noreferrer\" target=\"_blank\">c&aacute;c mẫu thực đơn cưới</a>&nbsp;chung lẫn thực đơn nhỏ d&agrave;nh ri&ecirc;ng cho từng vị kh&aacute;ch. Bạn n&ecirc;n chọn&nbsp;nh&agrave; in uy t&iacute;n để m&agrave;u sắc được đ&uacute;ng như mong muốn. Chi ph&iacute; đ&aacute;m cưới c&oacute; thể hơi cao một ch&uacute;t nhưng ho&agrave;n to&agrave;n xứng đ&aacute;ng.</p>\r\n\r\n<p><a href=\"http://www.marry.vn/dam-cuoi/thuc-don-dam-cuoi-mien-bac\" title=\"Thực đơn cỗ cưới đúng \"><img alt=\"Thực đơn cỗ cưới đúng \" src=\"http://www.marry.vn/wp-content/uploads/2014/05/09/thuc-don-co-cuoi-kieu-mien-bac-ft-447x335.jpg\" /></a></p>\r\n\r\n<p><a href=\"http://www.marry.vn/dam-cuoi/thuc-don-dam-cuoi-mien-bac\" title=\"Thực đơn cỗ cưới đúng \">Thực đơn cỗ cưới đ&uacute;ng &quot;chuẩn&quot; phong tục miền Bắc</a></p>\r\n\r\n<p>Đặc trưng v&ugrave;ng miền kh&aacute;c nhau dẫn đến văn h&oacute;a cưới hỏi kh&aacute;c nhau, trong đ&oacute; thực đơn cỗ cưới l&agrave;...</p>\r\n\r\n<h2>Menu cưới vẽ m&agrave;u nước</h2>\r\n\r\n<p>M&agrave;u nước, lại một phong c&aacute;ch cũ m&agrave; kh&ocirc;ng hề nh&agrave;m ch&aacute;n, hứa hẹn sẽ l&ecirc;n ng&ocirc;i trong năm nay. Những vệt m&agrave;u nước loang lổ lu&ocirc;n gợi cảm gi&aacute;c mềm mại, ph&oacute;ng kho&aacute;ng đầy quyến rũ. Năm 2018, dự kiến c&aacute;c mẫu menu cưới sẽ được thiết kế theo hai trường ph&aacute;i: M&agrave;u nước ombre mềm mại v&agrave; c&aacute;c vệt m&agrave;u bất quy tắc đầy ph&aacute; c&aacute;ch.</p>\r\n\r\n<p><img alt=\"Menu tiệc cưới 4\" src=\"http://www.marry.vn/wp-content/uploads/2018/01/15/15/menu-tiec-cuoi-4.jpg\" style=\"height:900px; width:600px\" /></p>\r\n\r\n<p>Một menu đ&aacute;m cưới trang tr&iacute; m&agrave;u nước kiểu ombre l&agrave; sự kết hợp ho&agrave;n hảo giữa truyền thống v&agrave; hiện đại</p>\r\n\r\n<p><img alt=\"Menu tiệc cưới 3\" src=\"http://www.marry.vn/wp-content/uploads/2018/01/15/15/menu-tiec-cuoi-3.jpg\" style=\"height:898px; width:600px\" /></p>\r\n\r\n<h2>Thực đơn với kiểu chữ&nbsp;Calligraphy</h2>\r\n\r\n<p>Xu hướng cưới tối giản, hiện đại đang dần lấn lướt c&aacute;c đ&aacute;m cưới rườm r&agrave; c&oacute; phần &ldquo;sến s&uacute;a&rdquo; truyền thống. Theo đ&oacute;, thực đơn đ&aacute;m cưới với kiểu chữ nghệ thuật Calligraphy nhanh ch&oacute;ng lọt v&agrave;o &ldquo;mắt xanh&rdquo; của nhiều cặp đ&ocirc;i.</p>\r\n\r\n<p>Chữ viết theo phong c&aacute;ch Calligraphy được viết từ b&uacute;t l&ocirc;ng mềm để tạo thành những nét đ&acirc;̣m hoặc nhạt chỉ với m&ocirc;̣t nét. Trong đ&oacute; nét đ&acirc;̣m là những nét xu&ocirc;́ng, còn các nét chữ đi l&ecirc;n được viết mỏng, nhẹ và nhạt.</p>\r\n\r\n<p><img alt=\"Menu tiệc cưới 6\" src=\"http://www.marry.vn/wp-content/uploads/2018/01/15/15/menu-tiec-cuoi-6.jpg\" style=\"height:600px; width:600px\" /></p>\r\n\r\n<p>Tr&ecirc;n thực tế, Calligraphy c&oacute; những nguy&ecirc;n tắc nhất định phải tu&acirc;n thủ nếu muốn cho ra đời một t&aacute;c phẩm đẹp</p>\r\n\r\n<p>Menu cưới thường được viết đơn giản với n&eacute;t chữ uốn lượn tự do, ph&oacute;ng kho&aacute;ng tưởng như kh&ocirc;ng theo một quy tắc n&agrave;o nhưng lại kh&ocirc;ng hề rối mắt.</p>\r\n\r\n<p><img alt=\"Menu tiệc cưới ft\" src=\"http://www.marry.vn/wp-content/uploads/2018/01/15/15/menu-tiec-cuoi-ft.jpg\" style=\"height:450px; width:600px\" /></p>\r\n\r\n<h2>Thực đơn cưới handmade</h2>\r\n\r\n<p>Tr&agrave;o lưu tổ chức đ&aacute;m cưới DIY c&agrave;ng lan rộng bao nhi&ecirc;u th&igrave; c&aacute;c chi tiết trong đ&aacute;m cưới c&agrave;ng được &ldquo;handmade h&oacute;a&rdquo; nhiều bấy nhi&ecirc;u. Trước đ&acirc;y, người ta chủ yếu&nbsp;<a href=\"http://www.marry.vn/theme-cuoi/giay-vintage-trang-tri-dam-cuoi\" rel=\"noopener noreferrer\" target=\"_blank\">trang tr&iacute; đ&aacute;m cưới với phụ kiện handmade</a>. Ng&agrave;y nay, thiệp cưới, menu cưới hay thậm ch&iacute; b&aacute;nh cưới cũng được l&agrave;m thủ c&ocirc;ng ho&agrave;n to&agrave;n.</p>\r\n\r\n<p><img alt=\"Menu tiệc cưới 8\" src=\"http://www.marry.vn/wp-content/uploads/2018/01/15/15/menu-tiec-cuoi-8.jpg\" style=\"height:400px; width:600px\" /></p>\r\n\r\n<p>Một tấm gỗ khắc lazer đơn giản d&agrave;nh cho đ&aacute;m cưới phong c&aacute;ch Rustic</p>\r\n\r\n<h2>Menu tiệc dạng Geometrics</h2>\r\n\r\n<p>Trong năm 2018, kh&ocirc;ng chỉ xu hướng trang tr&iacute; backdrop cưới với c&aacute;c h&igrave;nh, khối h&igrave;nh học l&ecirc;n ng&ocirc;i m&agrave; thiệp cưới, thực đơn đ&aacute;m cưới cũng &ldquo;ăn theo&rdquo; tr&agrave;o lưu n&agrave;y. Những khối h&igrave;nh học g&oacute;c cạnh được kết hợp kh&eacute;o l&eacute;o sao cho vừa mạnh mẽ, hiện đại vừa kh&ocirc;ng mất n&eacute;t l&atilde;ng mạn vốn c&oacute; trong t&igrave;nh y&ecirc;u.</p>\r\n\r\n<p><img alt=\"Menu tiệc cưới 10\" src=\"http://www.marry.vn/wp-content/uploads/2018/01/15/15/menu-tiec-cuoi-10.jpg\" style=\"height:615px; width:600px\" /></p>\r\n\r\n<p>Kh&ocirc;ng theo một quy tắc n&agrave;o nhưng mẫu menu n&agrave;y lại c&oacute; sức cuốn h&uacute;t kỳ lạ</p>\r\n\r\n<p><img alt=\"Menu tiệc cưới 9\" src=\"http://www.marry.vn/wp-content/uploads/2018/01/15/15/menu-tiec-cuoi-9.jpg\" style=\"height:441px; width:600px\" /></p>\r\n\r\n<p>Phong c&aacute;ch Geometrics kết hợp m&agrave;u nước với t&ocirc;ng t&iacute;m nổi bật</p>\r\n\r\n<p>Đ&oacute; c&oacute; thể l&agrave; những tờ b&igrave;a cứng được cắt theo h&igrave;nh khối lục gi&aacute;c, tam gi&aacute;c hay thậm ch&iacute; kh&ocirc;ng theo một quy luật n&agrave;o. C&aacute;c g&oacute;c cạnh cũng được chọn l&agrave;m họa tiết &eacute;p kim, đổ m&agrave;u để tạo sự nổi bật, sang trọng.</p>\r\n\r\n<p>Trước đ&acirc;y, menu Geometrics thường c&oacute; h&igrave;nh lục gi&aacute;c, ngũ gi&aacute;c hay c&aacute;c h&igrave;nh khối c&acirc;n. Năm nay, xu hướng thiết kế c&aacute;c h&igrave;nh g&oacute;c cạnh kỳ lạ, kh&ocirc;ng theo một quy luật n&agrave;o lại đang rất được l&ograve;ng c&aacute;c cặp đ&ocirc;i.</p>\r\n\r\n<p><a href=\"http://www.marry.vn/dam-cuoi/thuc-don-nao-cho-ngay-cuoi\" title=\"Thực đơn đám cưới miền Nam đậm đà hương vị quê hương\"><img alt=\"Thực đơn đám cưới miền Nam đậm đà hương vị quê hương\" src=\"http://www.marry.vn/wp-content/uploads/2017/08/11/Thuc-don-dam-cuoi-mien-Nam-ft1-447x335.jpg\" /></a><a href=\"http://www.marry.vn/dam-cuoi/thuc-don-nao-cho-ngay-cuoi\" title=\"Thực đơn đám cưới miền Nam đậm đà hương vị quê hương\">Thực đơn đ&aacute;m cưới miền Nam đậm đ&agrave; hương vị qu&ecirc; hương</a></p>\r\n\r\n<p>Trước cuốn thực đơn d&agrave;y cộm của c&aacute;c nh&agrave; h&agrave;ng tiệc cưới, dịch vụ nấu tiệc cưới chắc chắn bạn sẽ...</p>\r\n\r\n<p>Đ&acirc;y c&oacute; thể l&agrave; kết quả muốn được ph&aacute; c&aacute;ch nhằm bộc lộ v&agrave; khẳng định bản sắc ri&ecirc;ng th&ocirc;ng qua phong c&aacute;ch trang tr&iacute;&nbsp;&ldquo;kh&ocirc;ng đụng h&agrave;ng&rdquo;.</p>\r\n\r\n<p><img alt=\"Menu tiệc cưới 11\" src=\"http://www.marry.vn/wp-content/uploads/2018/01/15/15/menu-tiec-cuoi.jpg\" style=\"height:600px; width:600px\" /></p>\r\n\r\n<p>Menu bằng đ&aacute; cẩm thạch với những đường v&acirc;n độc đ&aacute;o</p>\r\n\r\n<p>Thực đơn cưới bằng giấy, gỗ thậm ch&iacute; mica hay thủy tinh trong suốt dường như đ&atilde; qu&aacute; nh&agrave;m ch&aacute;n n&ecirc;n ng&agrave;y c&agrave;ng c&oacute; nhiều cặp đ&ocirc;i chọn lựa c&aacute;c chất liệu mới lạ. Điển h&igrave;nh l&agrave; menu cưới từ đồng d&aacute;t mỏng hay đ&aacute; cẩm thạch khắc chữ. Ngo&agrave;i ra, bạn c&ograve;n c&oacute; thể kết hợp c&aacute;c xu hướng n&agrave;y để tạo n&ecirc;n mẫu menu tiệc cưới &ldquo;của ri&ecirc;ng đ&ocirc;i ta&rdquo; đấy!</p>', 'deco_1-01_d.jpg', 1, '2018-05-14 00:00:00'),
(10, 'Mỗi tấm thiệp là một câu chuyện', 'Mỗi tấm thiệp là một câu chuyện', 'https://www.youtube.com/watch?time_continue=8&v=dRLq2mc5IZk', '<p>Thiệp cưới sẽ thể hiện sự tr&acirc;n trọng đến với quan kh&aacute;ch, n&ecirc;n phải thật độc đ&aacute;o, thật nổi bật theo c&aacute;ch m&agrave; cặp đ&ocirc;i muốn truyền tải đến cho mọi người.</p>\r\n\r\n<p>Với phương ch&acirc;m: &ldquo;Từ tr&aacute;i tim đến tr&aacute;i tim&rdquo;, Thiệp cưới Online lu&ocirc;n cẩn thận, tỉ mỉ đến mỗi chi tiết, lu&ocirc;n hy vọng tấm thiệp mời c&oacute; thể thay c&ocirc; d&acirc;u ch&uacute; rể mang những th&ocirc;ng điệp tuyệt vời đến cho quan kh&aacute;ch, cho bạn b&egrave;, người th&acirc;n của c&ocirc; d&acirc;u ch&uacute; rể.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Thiệp cưới online 2\" src=\"http://www.marry.vn/wp-content/uploads/2018/05/17/17/Thiep-cuoi-online-1.jpg\" style=\"height:450px; width:600px\" /></p>\r\n\r\n<p>Mỗi tấm thiệp l&agrave; một c&acirc;u chuyện, những tấm thiệp đa dạng phong c&aacute;ch, từ mộc mạc đơn giản, hoa l&aacute; xinh xắn, đến sang trọng nổi bậc của những chi tiết &eacute;p kim, nhưng chung qui lại, mỗi tấm thiệp ho&agrave;n th&agrave;nh đều chỉnh chu, ho&agrave;n hảo nhất c&oacute; thể.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Thiệp cưới online 1\" src=\"http://www.marry.vn/wp-content/uploads/2018/05/17/17/Thiep-cuoi-online-3.jpg\" style=\"height:427px; width:600px\" /></p>\r\n\r\n<p>Thiệp cưới Online tin rằng một tấm&nbsp;<a href=\"http://www.marry.vn/thiep-cuoi-dep/\" rel=\"noopener noreferrer\" target=\"_blank\">thiệp cưới đẹp</a>, kh&ocirc;ng chỉ đẹp bởi h&igrave;nh thức b&ecirc;n ngo&agrave;i, m&agrave; phải đẹp đến từng font chữ, từng chất giấy, từng m&agrave;u sắc hoa văn. Mỗi sản phẩm ho&agrave;n thiện, mỗi lời khen ngợi từ kh&aacute;ch h&agrave;ng l&agrave; th&agrave;nh quả m&agrave; cả tập thể lu&ocirc;n tr&acirc;n trọng.</p>\r\n\r\n<p><img alt=\"Thiệp cưới online\" src=\"http://www.marry.vn/wp-content/uploads/2018/05/17/17/Thiep-cuoi-online-2.jpg\" style=\"height:399px; width:600px\" /></p>\r\n\r\n<p>L&agrave; v&igrave; đ&aacute;m cưới chỉ một lần trong đời, n&ecirc;n Thiệp cưới Online lu&ocirc;n mong muốn những sản phẩm ho&agrave;n hảo nhất c&oacute; thể cho c&ocirc; d&acirc;u ch&uacute; rể. H&atilde;y đến v&agrave; hiện thực h&oacute;a &yacute; tưởng c&ugrave;ng với Thiệp cưới Online.</p>\r\n\r\n<p>Địa chỉ: 523/8 Nguyễn Tri Phương, Phường 8, Quận 10, TPHCM<br />\r\nĐiện thoại: 0888 77 24 77<br />\r\nEmail: thiepcuoionline.vn@gmail.com<br />\r\nWebsite: thiepcuoionline.vn</p>', 'img_3367.jpg', 1, '2018-05-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `delivery_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `status` tinyint(3) DEFAULT NULL COMMENT '0:Đặt hàng thành công,1:Đang xử lý,2:Chưa thanh toán,3:Đang giao hàng,4:Đã giao hàng,5:Đơn hàng hủy',
  `note` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `customer_name`, `customer_id`, `delivery_address`, `description`, `total`, `status`, `note`, `date_created`) VALUES
(1, '00001', 'Vi Bảo Quốc', 1, '105/2 Bạch Đằng , P.2 , Q.Tân Bình , Tp.Hồ Chí Minh, 22', 'Cần giao vào giờ hành chính', 20000, 1, 'Đã chuẩn bị hàng xong', '2017-09-03 00:00:00'),
(2, '240135237', 'Vi Bảo Quốc', 2, '105/2 Bạch Đằng , P.2 , Q.Tân Bình , Tp.Hồ Chí Minh', 'Sản phẩm:Sản phẩm test |  Đơn giá: 11000  | Số lượng:1<br>', 11000, 0, 'Phone:0906099321 - Email:vibaoquoc@gmail.com', '2017-09-24 01:35:23'),
(3, '240143041', 'Vi Bảo Quốc', 3, '105/2 Bạch Đằng , P.2 , Q.Tân Bình , Tp.Hồ Chí Minh', 'Sản phẩm:Sản phẩm test |  Đơn giá: 11000  | Số lượng:500<br>Sản phẩm:AF2017001 |  Đơn giá: 15000  | Số lượng:200<br>', 3000000, 0, 'Phone:0906099321 - Email:vibaoquoc@gmail.com', '2017-09-24 01:43:04'),
(5, '240520598', 'Vi Bảo Quốc', 5, '105/2 Bạch Đằng , P.2 , Q.Tân Bình , Tp.Hồ Chí Minh', 'Sản phẩm:AF2017001 |  Đơn giá: 15000  | Số lượng:500<br>', 7500000, 4, 'Phone:0906099321 - Email:vibaoquoc@gmail.com', '2017-09-24 05:20:59'),
(6, '251505265', '', 6, '', 'Sản phẩm:Sản phẩm test |  Đơn giá: 11000  | Số lượng:1<br>', 11000, 0, 'Phone: - Email:', '2017-09-25 15:05:26'),
(7, '251757455', 'tân', 7, 'q12', 'Sản phẩm:AF2017001 |  Đơn giá: 15000  | Số lượng:200<br>', 3000000, 0, 'Phone:0949449914 - Email:tanytuong@gmail.com', '2017-09-25 17:57:45'),
(8, '260522453', '', 8, '', 'Sản phẩm:AF2017001 |  Đơn giá: 15000  | Số lượng:1<br>', 15000, 0, 'Phone: - Email:', '2017-09-26 05:22:45'),
(20, '438-2012', 'tanytuong@gmail.com', 20, 'dsfadfsdaf', 'Sản phẩm:AF2017001 |  Đơn giá: 6500  | Số lượng:1<br><br>Giảm giá coupon (DT10): 650', 5850, 1, 'Phone:09494944914 - Email:tanytuong@gmail.com', '2017-12-20 07:41:11'),
(23, '366-0305', 'Mai Xuân Huy', 23, 'số 8 - Khu BT lô 09- Vân Canh HUD - Vân Canh- Hoài Đức -Hà Nội', 'Sản phẩm:KM01 |  Đơn giá: 3000  | Số lượng:5<br>', 15000, 0, 'Phone:1694040226 - Email:huyts2001@gmail.com', '2018-05-03 12:53:50'),
(24, '338-2405', 'teo', 24, 'tatdfa Q12', 'Sản phẩm:KM01 |  Đơn giá: 3000  | Số lượng:13<br>', 39000, 0, 'Phone:09494944914 - Email:tanytuong@gmail.com', '2018-05-24 15:21:07'),
(26, '728-0507', 'Thuỷ', 26, '40 ngách 24/27 Thổ Quan - Khâm Thiên - Đống Đa - Hà Nội', 'Sản phẩm:V04 |  Đơn giá: 12000  | Số lượng:30<br>', 360000, 0, 'Phone:0976861697 - Email:tbog19@gmail.com', '2018-07-05 16:42:06'),
(27, '673-3010', 'Bùi Quốc Tý', 27, '440/30 Nguyễn Kiệm, P3, Quận Phú Nhuận', 'Sản phẩm:KM01 |  Đơn giá: 3000  | Số lượng:50<br>', 150000, 0, 'Phone:0848211293 - Email:tybq93@gmail.com', '2018-10-30 14:00:24'),
(28, '362-0611', 'Trần Thanh Sơn', 28, '935 đại lộ Bình Dương, kp9, phường Hiệp An, Thành Phố Thủ Dầu Một, Bình Dương', 'Sản phẩm:P06 |  Đơn giá: 4500  | Số lượng:400<br>', 1800000, 0, 'Phone:0979427497 - Email:thanh.son.m.tran@gmail.com', '2018-11-06 14:33:54'),
(29, '742-2911', 'Nguyễn Thị Thu Thủy', 30, '601 Cách Mạng Tháng Tám (Công ty dược 3/2)', 'Sản phẩm:H030 |  Đơn giá: 7500  | Số lượng:50<br>', 375000, 0, 'Phone:947730900 - Email:samnguyen1205@gmail.com', '2018-11-29 09:38:43'),
(30, '161-2911', 'Thuỷ Nguyễn', 31, '601 Cách Mạng Tháng 8, p.15, quận 10', 'Sản phẩm:H030 |  Đơn giá: 7500  | Số lượng:50<br>', 375000, 0, 'Phone:0947730900 - Email:samnguyen1205@gmail.com', '2018-11-29 12:44:14'),
(31, '386-0401', 'lien nguyen', 32, '1104 inglewood dr. mansfield tx, 76063', 'Sản phẩm:V04 |  Đơn giá: 12000  | Số lượng:400<br>', 4800000, 0, 'Phone:6823315586 - Email:ln_nguyen89@yahoo.com', '2019-01-04 04:34:05'),
(32, '741-1602', 'Lê Minh Huyền', 33, '515 chung cu DTA, ap Vung gam, Phuoc an, Nhon trach, Dong nai', 'Sản phẩm:H31 |  Đơn giá: 4500  | Số lượng:40<br>', 180000, 0, 'Phone:898906656 - Email:huyenlm850@gmail.com', '2019-02-16 05:58:13'),
(33, '587-1702', 'Hơn', 34, '285 cmt8,p12, Q.10', 'Sản phẩm:KM02 |  Đơn giá: 4000  | Số lượng:30<br>', 120000, 0, 'Phone:0981828272 - Email:vanhonnguyen92@gmail.com', '2019-02-17 02:38:09'),
(34, '825-2003', 'Nguyễn Thị Liên Ái', 35, 'Tòa nhà Anna, Khu CVPM Quang Trung,p. Tân Chánh Hiệp, Quận 12', 'Sản phẩm:H023 |  Đơn giá: 5500  | Số lượng:200<br>', 1100000, 0, 'Phone:0778744876 - Email:nguyenthilienai01@gmail.com', '2019-03-20 08:45:01'),
(35, '133-2003', 'Nguyễn Thị Liên Ái', 36, 'Tòa nhà Anna, Khu CVPM Quang Trung,p. Tân Chánh Hiệp, Quận 12', 'Sản phẩm:H023 |  Đơn giá: 5500  | Số lượng:200<br>', 1100000, 0, 'Phone:0778744876 - Email:nguyenthilienai01@gmail.com', '2019-03-20 08:46:34'),
(36, '137-2003', 'Nguyễn Thị Liên Ái', 37, 'Tòa nhà Anna, Khu CVPM Quang Trung,p. Tân Chánh Hiệp, Quận 12', 'Sản phẩm:H023 |  Đơn giá: 5500  | Số lượng:100<br>', 550000, 0, 'Phone:0778744876 - Email:nguyenthilienai01@gmail.com', '2019-03-20 08:49:07'),
(37, '905-2003', 'Nguyễn Thị Liên Ái', 38, 'Tòa nhà Anna, Khu CVPM Quang Trung,p. Tân Chánh Hiệp, Quận 12', 'Sản phẩm:H023 |  Đơn giá: 5500  | Số lượng:100<br>', 550000, 0, 'Phone:0778744876 - Email:nguyenthilienai01@gmail.com', '2019-03-20 08:50:43'),
(38, '871-2003', 'Nguyễn Thị Liên Ái', 39, 'Tòa nhà Anna, Khu CVPM Quang Trung,p. Tân Chánh Hiệp, Quận 12', 'Sản phẩm:H029 |  Đơn giá: 4500  | Số lượng:100<br>', 450000, 0, 'Phone:0778744876 - Email:nguyenthilienai01@gmail.com', '2019-03-20 08:56:11'),
(39, '376-1405', 'Vũ Hải', 40, '115 bà huyện thanh quan p9, q3', '', 0, 0, 'Phone:0942822444 - Email:azalea.vu87@gmail.com', '2019-05-14 12:43:43'),
(40, '666-1405', 'Vũ hải', 41, '115 bà huyện thanh quan p9, q3', 'Sản phẩm:H029 |  Đơn giá: 4500  | Số lượng:230<br>', 1035000, 0, 'Phone:0942822444 - Email:azalea.vu87@gmail.com', '2019-05-14 13:01:53'),
(41, '192-1505', 'Hải anh', 42, '115 Ba huyen Thanh Quan', 'Sản phẩm:H029 |  Đơn giá: 4500  | Số lượng:230<br>', 1035000, 0, 'Phone:0942822444 - Email:azalea.vu87@gmail.com', '2019-05-15 08:04:12'),
(42, '932-1505', 'Hải anh', 43, '115 Ba huyen Thanh Quan', 'Sản phẩm:H029 |  Đơn giá: 4500  | Số lượng:230<br>', 1035000, 0, 'Phone:0942822444 - Email:azalea.vu87@gmail.com', '2019-05-15 08:05:47'),
(43, '431-0606', 'Nguyen Thi Thuy Duong', 44, 'VPBank Tower 1-1A-2 Tôn Đức Thắng, Quận 1, HCM', 'Sản phẩm:C06 |  Đơn giá: 6500  | Số lượng:100<br>', 650000, 0, 'Phone:0976807092 - Email:bttthuyduong@gmail.com', '2019-06-06 13:02:47'),
(44, '316-0606', 'Thuy Duong', 45, 'VPBank Tower 1-1A-2 Ton Duc Thang, Quan 1, HCM', 'Sản phẩm:C06 |  Đơn giá: 6500  | Số lượng:100<br>', 650000, 0, 'Phone:0976807092 - Email:bttthuyduong@gmail.com', '2019-06-06 13:05:43'),
(45, '158-0606', 'Thuy Duong', 46, 'VPBank Tower 1-1A-2 Ton Duc Thang, Quan 1, HCM', 'Sản phẩm:C06 |  Đơn giá: 6500  | Số lượng:100<br>', 650000, 0, 'Phone:0976807092 - Email:bttthuyduong@gmail.com', '2019-06-06 13:07:33'),
(46, '676-1306', 'test', 47, '1041 trần xuân soan q7', 'Sản phẩm:P10 |  Đơn giá: 4500  | Số lượng:1<br>', 4500, 0, 'Phone:0900022234 - Email:test@123.com', '2019-06-13 03:28:24'),
(47, '343-1306', 'test', 48, '1041 trần xuân soan q7', 'Sản phẩm:P10 |  Đơn giá: 4500  | Số lượng:1<br>', 4500, 0, 'Phone:0900022234 - Email:test@123.com', '2019-06-13 03:29:58'),
(48, '928-1306', 'test', 49, '1041 trần xuân soan q7', 'Sản phẩm:P10 |  Đơn giá: 4500  | Số lượng:1<br>', 4500, 0, 'Phone:0900022234 - Email:test@gmail.com', '2019-06-13 03:33:45'),
(49, '298-1306', 'test', 50, '1041 trần xuân soan q7', 'Sản phẩm:P10 |  Đơn giá: 4500  | Số lượng:1<br>', 4500, 0, 'Phone:0900022234 - Email:test@gmail.com', '2019-06-13 03:35:19'),
(50, '455-1306', 'test', 51, '1041 trần xuân soan q7', 'Sản phẩm:P10 |  Đơn giá: 4500  | Số lượng:1<br>Sản phẩm:H029 |  Đơn giá: 4500  | Số lượng:10<br>', 49500, 0, 'Phone:0900022234 - Email:test@gmail.com', '2019-06-13 03:39:59'),
(51, '182-2507', 'HỒ THẾ VINH', 52, '102 Nguyễn Văn Cừ, P.An Khánh, Q.Ninh Kiều, TP.Cần Thơ', 'Sản phẩm:H030 |  Đơn giá: 7500  | Số lượng:1<br>', 7500, 0, 'Phone:0909787887 - Email:vualamvuahoc7x@gmail.com', '2019-07-25 02:47:07'),
(52, '103-0508', 'hgf', 53, '85 ggf', 'Sản phẩm:H028 |  Đơn giá: 9000  | Số lượng:1000<br>Sản phẩm:C03 |  Đơn giá: 7500  | Số lượng:1000<br>', 16500000, 0, 'Phone:0913455656 - Email:nggggg@gmail.com', '2019-08-05 16:25:47'),
(53, '373-0508', 'hgf', 54, '85 ggf', '', 0, 0, 'Phone:0913455656 - Email:nggggg@gmail.com', '2019-08-05 16:25:50'),
(54, '489-1608', 'Vy', 55, '82', 'Sản phẩm:C03 |  Đơn giá: 7500  | Số lượng:1000<br>', 7500000, 0, 'Phone:0918235532 - Email:vyq22@gmail.com', '2019-08-16 00:32:30'),
(55, '803-1608', 'NHAT MY CO.,LTD', 56, '01 b TRAN BINH TRONG', 'Sản phẩm:H030 |  Đơn giá: 7500  | Số lượng:1000<br>', 7500000, 0, 'Phone:5113888217 - Email:nhatmyvn@gmail.com', '2019-08-16 01:06:29'),
(56, '780-1908', 'Kim Ly', 57, '259A Hai Bà Trưng, phường 6, quận 3, HCM', 'Sản phẩm:H31 |  Đơn giá: 4500  | Số lượng:10<br>', 45000, 0, 'Phone:0975606914 - Email:kimlylt.le@gmail.com', '2019-08-19 03:48:32'),
(57, '480-2808', 'Henry Ngo', 58, '5917 Howell Street, Oakland, CA 94609-1515, United States', 'Sản phẩm:C03 |  Đơn giá: 7500  | Số lượng:50<br>', 375000, 0, 'Phone:+14084894998 - Email:henrytngo@gmail.com', '2019-08-28 19:10:01'),
(58, '460-1209', 'Be Hoang', 59, '139 Haverhill ct San Jose ca 95051', 'Sản phẩm:H028 |  Đơn giá: 9000  | Số lượng:500<br>', 4500000, 0, 'Phone:(510) 491-7184  - Email:behoang03@outlook.com', '2019-09-12 03:57:25'),
(59, '648-1211', 'Nhi Bui', 60, '88/5 Mac Dinh Chi, Phuong Da Kao, Quan 1, TPHCM', 'Sản phẩm:H31 |  Đơn giá: 4500  | Số lượng:350<br>', 1575000, 0, 'Phone:8177570580 - Email:ntb9388@gmail.com', '2019-11-12 14:32:08'),
(60, '134-2411', 'NGUYỆT ÁNH', 61, 'số 17 ngõ 172 phú diễn - bắc từ liêm- hà  nội', 'Sản phẩm:H31 |  Đơn giá: 4500  | Số lượng:08<br>', 36000, 0, 'Phone:0976980651 - Email:Nguyetanh618@gmail.com', '2019-11-24 03:01:13'),
(61, '685-2911', 'Nguyễn Đặng Thanh Tuyền', 62, '207/13 phường 4, quốc lộ 1, thành phố Tân An, Long An', 'Sản phẩm:H24 |  Đơn giá: 6000  | Số lượng:85<br>', 510000, 0, 'Phone:0943980038 - Email:tnguyen15076@llcc.edu', '2019-11-29 06:58:55'),
(62, '448-3012', 'Tran HA', 63, 'askskasksaka', 'Sản phẩm:R.001 |  Đơn giá: 9000  | Số lượng:30<br>', 270000, 0, 'Phone:0402300203 - Email:afasf@gmail.com', '2019-12-30 19:42:56'),
(63, '937-2602', 'test', 64, 'Ba Ria Vung Tau', 'Sản phẩm:H31 |  Đơn giá: 4500  | Số lượng:1<br>', 4500, 0, 'Phone:0908232967 - Email:tientai.vt@gmail.com', '2020-02-26 07:12:14'),
(64, '743-2802', 'Thhy', 65, '4567uzvajb', 'Sản phẩm:H31 |  Đơn giá: 4500  | Số lượng:100<br>', 450000, 0, 'Phone:09494949144 - Email:Thuthuy29kt@yahoo.com.vn', '2020-02-28 01:05:01'),
(65, '123-2904', 'Huỳnh Thị Thanh Nguyên', 66, '295 nguyễn bình, phú xuân, nhà bè', 'Sản phẩm:V01 |  Đơn giá: 6500  | Số lượng:70<br>', 455000, 0, 'Phone:0909485756 - Email:nguyentttstp@gmail.com', '2020-04-29 15:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) NOT NULL COMMENT '1:Thiệp cưới hiện đại,2:Thiệp cưới phong cách,3:Thiệp cưới cổ điển,4:Thiệp cưới khuyến mãi',
  `price` int(11) DEFAULT '0',
  `cost` int(11) DEFAULT '0',
  `image` varchar(300) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '1:Enable,0:Disable',
  `option_ids` varchar(200) DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `category_id`, `price`, `cost`, `image`, `status`, `option_ids`, `content`, `date_created`) VALUES
(1, 'H12', 'Thiệp cưới thiết kế riêng theo yêu cầu khách hàng\r\nChất liệu giấy ECONO (Nhật)\r\nIn kỷ thuật số - Có in giả lót trong bao thư', 1, 7000, 5000, 'Uyen_-_Trung-01_mk1.jpg,Uyen_-_Trung-01_mk.jpg,', 1, '1', '<p><img alt=\"\" src=\"/uploads/images/Uyen_-_Trung-01_mk.jpg\"></p>\r\n\r\n<p> </p>', '2017-08-31 00:00:00'),
(3, 'V01', 'Sử dụng giấy Econo Nhật với công nghệ in kỹ thuật số hiện đại, chắc chắn sẽ mang đến cho bạn một sản phẩm mang tính thẩm mỹ cao, mộc mạc nhưng tinh tế', 3, 6500, 5000, 'V011.jpg,V01A.jpg,', 1, 'V01', '<h2>Chất liệu:</h2>\r\n\r\n<p>Giấy Econo Nhật cao cấp. định lượng 250/300 grs</p>\r\n\r\n<h2>Kiểu in:</h2>\r\n\r\n<p>In kỹ thuật số cao cấp</p>\r\n\r\n<h2>Kích thước:</h2>\r\n\r\n<p>+ Bao thư: 14 x 19</p>\r\n\r\n<p>+ Thiệp báo: 13 x 18</p>\r\n\r\n<p>+ Thiệp mời: 11 x 15</p>', '2018-04-28 00:00:00'),
(6, 'H13', 'Thiệp cưới hiện đại với họa tiết hoa nhẹ nhàng nhưng ko kém phần nổi bật', 1, 4500, 3200, 'H131.jpg,,', 1, '1', '<p>Hoa đâu nhất thiết phải cắm vào bình, hoa còn có thể mang vào thiệp cưới. Ai bảo hoa trên thiệp là sến súa, là bánh bèo? Các nàng vào chứng thực giúp mình nhé !!!</p>', '2017-08-31 00:00:00'),
(7, 'V011', 'Sử dụng giấy KRAFT Nhật với công nghệ in kỹ thuật số hiện đại, chắc chắn sẽ mang đến cho bạn một sản phẩm mang tính thẩm mỹ cao, mộc mạc nhưng tinh tế', 3, 7500, 6000, 'V09.jpg,hoa17.jpg,hoa13.jpg', 1, '1', '<p> </p>\r\n\r\n<p>okijl</p>', '2018-04-28 00:00:00'),
(10, 'H008', 'Sản phẩm này khá tốt', 1, 8500, 7000, 'H08.jpg,,', 1, '1', '<p>Thử xem sao</p>', '2018-03-22 00:00:00'),
(11, 'H019', 'Xanh lá mạ là một màu tượng trưng cho hệ sinh thái, cho nguồn năng lượng mạnh mẽ đến từ thiên nhiên. \"Hồi sinh, khôi phục và tươi mới\" chính là ý nghĩa của sắc màu này.', 1, 5500, 4000, 'H19.jpg,,', 1, '1', '<p>ds</p>', '2017-09-01 20:30:10'),
(12, 'H004', 'Để mang đến những điều tốt nhất  cho khách hàng trong mùa cưới năm nay. Chúng tôi có chương trình giảm giá 10% cho khách hàng từ ngày 1/10 đến 31/12. Số lượng càng tăng - giá càng giảm', 1, 5500, 4500, 'H03.jpg,,', 1, '1', '<p>Giống như tên gọi của mình: SANG TRỌNG, BẢNH BAO chính là tinh thần của set thiệp này. Tông Peach Quartz nhẹ nhàng kết hợp vs cụm hoa peony nhỏ “ton sur ton”, đem lại cho set thiệp một chút gì đó ấm áp nhưng không kém phần sang trọng, chắc chắn là lựa chọn phù hợp nhất cho những đám cưới vào mùa Thu Đông này.</p>\r\n\r\n<p>Full Set thiệp bao gồm: Thiệp đơn 2 mặt  - Đai tag tên logo cô dâu chú rể  – Phong bì  và gợi ý cho các cặp đôi đang phân vân chọn lựa cho mẫu thiệp trong ngày trọng đại của mình “Gam màu Pastel không bao giờ lỗi mốt”.</p>', '2017-09-01 20:30:10'),
(13, 'C004', 'Thiệp cưới phong cách hiện đại nhưng không kém phần tinh tế', 2, 15000, 13500, 'C04.jpg,^B6CDE5BCAC0F8A80F2B3E87C3CADFF116F1029AE210CD7B9DE^pimgpsh_fullsize_distr.jpg,', 1, '1', '<p>Thiệp cưới phong cách hiện đại nhưng không kém phần tinh tế  Thiệp cưới phong cách hiện đại nhưng không kém phần tinh tếThiệp cưới phong cách hiện đại nhưng không kém phần tinh tếThiệp cưới phong cách hiện đại nhưng không kém phần tinh tếThiệp cưới phong cách hiện đại nhưng không kém phần tinh tếThiệp cưới phong cách hiện đại nhưng không kém phần tinh tếThiệp cưới phong cách hiện đại nhưng không kém phần tinh tếThiệp cưới phong</p>\r\n\r\n<p> </p>', '2017-09-01 20:30:10'),
(14, 'H007', 'Trong đời người đàn ông có thể lắm bông hoa, nhưng chỉ có mỗi một đóa hồng. Và chàng chỉ có mỗi mình bạn thôi.', 1, 4500, 3000, 'H07a1.jpg,,', 1, '789', '<p>Hoa đâu nhất thiết phải cắm vào bình, hoa còn có thể mang vào thiệp cưới. </p>', '2017-09-19 00:00:00'),
(15, 'C07', 'C7', 2, 12000, 10000, 'C07.jpg,,', 1, '7', '<p><img alt=\"\" src=\"https://i.imgur.com/dLaVmM7.jpg\"></p>', '2017-09-26 00:00:00'),
(19, 'H001', 'Thiệp cưới hiện đại với họa tiết hoa nhẹ nhàng nhưng ko kém phần sang trọng.', 1, 6500, 4500, 'mau_54-01.jpg,mau_54-01aa.jpg,mau_54-01aaaa.jpg', 1, 't', '<p><img alt=\"\" src=\"/uploads/images/mau_54-01aa.jpg\"></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/mau_54-01aaaa.jpg\"></p>', '2018-03-22 00:00:00'),
(20, 'C03', 'Hoa đâu nhất thiết phải cắm vào bình, hoa còn có thể mang vào thiệp cưới.', 2, 7500, 5000, 'C03.jpg,hoa21.jpg,', 1, 'C03', '<p><img alt=\"\" src=\"/uploads/images/hoa21.jpg\"></p>', '2018-05-09 00:00:00'),
(21, 'V02', 'Thiệp cưới hiện đại với họa tiết hoa nhẹ nhàng nhưng ko kém phần sang trọng.', 3, 6500, 5000, 'V021.jpg,H003-U_S.jpg,', 1, 'V02', '<p>th</p>', '2018-03-22 00:00:00'),
(22, 'H002', 'Sản phẩm được ưa chuộng trong thời gian gần đây', 1, 5500, 4500, 'H018B.jpg,,', 1, '1', '<p>Sắc tím lên ngôi theo viện màu PANTONE năm 2018</p>', '2018-02-03 00:00:00'),
(23, 'H006', 'Không cần phải nói nhiều nữa. Thiệp vẽ hoa  luôn luôn được mọi người chào đón bởi vẻ dịu dàng, duyên dáng của nó', 1, 4500, 3500, 'H061.jpg,,', 1, '1', '<p>Điểm thú vị ở mẫu thiệp này là bạn có thể lựa chọn phong cách vintage hay boho thì đều rất hợp thời và quan trọng là khác biệt nhé.</p>', '2018-02-05 00:00:00'),
(24, 'H009', 'Thiệp vẽ hoa luôn luôn được mọi người chào đón bởi vẻ dịu dàng, duyên dáng của nó', 1, 5500, 4500, 'H09.jpg,,', 1, '1', '<p> abc</p>', '2018-02-05 00:00:00'),
(25, 'H020', 'Thiệp vẽ hoa chưa bao giờ hết hot. Trên chất liệu giấy ECONO Nhật cùng với qui trình in kỹ thuật số hiện đại sẽ mang đến cho khách hàng những sản phẩm ưng ý và chất lượng nhất', 1, 5000, 4000, 'H20.jpg,,', 1, '1', '<p>abc</p>', '2018-02-05 00:00:00'),
(26, 'H15', 'Thiệp vẽ hoa lại còn mang màu tím thủy chung thì chắc hẳn sẽ là mẫu hot năm nay đây', 1, 5500, 4500, 'H051.jpg,,', 1, '1', '<p> </p>\r\n\r\n<p>Kích thước 1 bộ thiệp bao gồm:</p>\r\n\r\n<p>1 bao thư: 14 x 19</p>\r\n\r\n<p>1 thiệp báo: 13 x 18</p>\r\n\r\n<p>1 thiệp mời: 11 x15</p>\r\n\r\n<p>Chất liệu: Giấy ECONO Nhật</p>\r\n\r\n<p>Định lượng 300 gsm</p>', '2018-03-22 00:00:00'),
(27, 'H014', 'Thiệp cưới vẽ hoa', 1, 4500, 3500, 'H014.jpg,,', 1, '1', '<p>Kích thước 1 bộ thiệp bao gồm:</p>\r\n\r\n<p>1 bao thư: 11 x 21</p>\r\n\r\n<p>1 thiệp báo: 10 x 19</p>\r\n\r\n<p>1 thiệp mời: 10 x 19</p>\r\n\r\n<p>Chất liệu: Giấy ECONO Nhật</p>\r\n\r\n<p>Định lượng 300 gsm</p>', '2018-02-05 00:00:00'),
(28, 'H016', 'Thiệp họa tiết lá gần gũi với thiên nhiên cũng là xu hướng thiệp cưới của năm 2018 này', 1, 6000, 5000, '111-WM-01.jpg,,', 1, '1', '<p>Kích thước 1 bộ thiệp bao gồm:</p>\r\n\r\n<p>1 bao thư: 14 x 19</p>\r\n\r\n<p>1 thiệp báo: 13 x 18</p>\r\n\r\n<p>1 thiệp mời: 11 x15</p>\r\n\r\n<p>Chất liệu: Giấy ECONO Nhật</p>\r\n\r\n<p>Định lượng 300 gsm</p>', '2018-02-05 00:00:00'),
(29, 'H22', 'Thiệp vẽ hoa lại còn mang màu tím sắc son thì chắc hẳn sẽ là một trong những mẫu hot năm nay', 1, 5000, 4000, 'H018.jpg,,', 1, '1', '<p>Kích thước 1 bộ thiệp bao gồm:</p>\r\n\r\n<p>1 bao thư: 14 x 19</p>\r\n\r\n<p>1 thiệp báo: 13 x 18</p>\r\n\r\n<p>1 thiệp mời: 11 x15</p>\r\n\r\n<p>Chất liệu: Giấy ECONO Nhật</p>\r\n\r\n<p>Định lượng 300 gsm</p>', '2018-02-05 00:00:00'),
(31, 'V05', 'Cặp đôi nào có vẻ nghiện cà phê thì ắt hẳn sẽ lựa chọn chiếc thiệp được thiết kế khác biệt này rồi', 3, 4500, 3000, 'V05A.jpg,,', 1, '1', '<p>Kích thước 1 bộ thiệp bao gồm:</p>\r\n\r\n<p>1 bao thư: 11 x 21</p>\r\n\r\n<p>1 thiệp báo: 10 x 20</p>\r\n\r\n<p>1 thiệp mời: 10 x 20</p>\r\n\r\n<p>Chất liệu: Giấy ECONO Nhật</p>\r\n\r\n<p>Định lượng 300 gsm</p>', '2018-02-05 00:00:00'),
(32, 'H023', 'In kỹ thuật số trên nền giấy Camay thì càng làm bật lên nét đẹp của thiết kế này', 1, 5500, 4500, 'Mock_up_leave.jpg,,', 1, '1', '<p>Kích thước 1 bộ thiệp bao gồm:</p>\r\n\r\n<p>1 bao thư: 14 x 19</p>\r\n\r\n<p>1 thiệp báo: 13 x 18</p>\r\n\r\n<p>1 thiệp mời: 11 x15</p>\r\n\r\n<p>Chất liệu: Giấy Camayt</p>\r\n\r\n<p>Định lượng 250 gsm với thiệp mời và thiệp báo, 150 gsm với bao thư</p>', '2018-02-05 00:00:00'),
(33, 'H024', 'Chất liệu giấy Camay sẽ làm bậc lên vẻ đẹp của thiết kế này', 1, 6500, 6500, 'mau_38-01.jpg,,', 1, '1', '<p>Kích thước 1 bộ thiệp bao gồm:</p>\r\n\r\n<p>1 bao thư: 14 x 19</p>\r\n\r\n<p>1 thiệp báo: 13 x 18</p>\r\n\r\n<p>1 thiệp mời: 11 x15</p>\r\n\r\n<p>Chất liệu: Giấy Camay</p>\r\n\r\n<p>Định lượng 250 gsm với thiệp mời và thiệp báo, 150 gsm với bao thư</p>', '2018-02-05 00:00:00'),
(34, 'V07', 'Thiết kế cổ điển', 3, 4500, 3200, 'V07.jpg,,', 1, 'V07', '<p>Kích thước 1 bộ thiệp bao gồm:</p>\r\n\r\n<p>1 bao thư: 11 x 21</p>\r\n\r\n<p>1 thiệp báo: 10 x 20</p>\r\n\r\n<p>1 thiệp mời: 10 x 20</p>\r\n\r\n<p>Chất liệu: Giấy ECONO Nhật</p>\r\n\r\n<p>Định lượng 250 gsm với thiệp mời và thiệp báo, 150 gsm với bao thư</p>', '2018-02-05 00:00:00'),
(36, 'P01', 'Thiệp cưới in hình giá chỉ 3900đ/bộ', 4, 4500, 3200, '21.jpg,,', 1, 'P01', '<p>Thiệp cưới in hình giá chỉ 3900đ/bộ</p>', '2018-03-22 00:00:00'),
(37, 'P02', 'Thiệp cưới in hình giá chỉ 3900đ/bộ', 4, 4500, 3200, '9.jpg,,', 1, 'P02', '<p>Thiệp cưới in hình giá chỉ 3900đ/bộ</p>', '2018-03-22 00:00:00'),
(38, 'P03', 'Thiệp cưới in hình giá chỉ 4500đ/bộ', 4, 7500, 5500, '3.jpg,,', 1, 'P03', '<p>Thiệp cưới in hình giá chỉ 7500đ/bộ</p>\r\n\r\n<p>Dán đế giấy Kraft + in 2 mặt giá 85000/bộ</p>', '2018-03-22 00:00:00'),
(39, 'P04', 'Thiệp cưới in hình giá chỉ 4500đ/bộ', 4, 4500, 3200, '41.jpg,,', 1, 'P04', '<p>Thiệp cưới in hình giá chỉ 3900đ/bộ</p>', '2018-03-22 00:00:00'),
(40, 'P05', 'Thiệp cưới in hình trên giấy  mỹ thuật  6900đ/bộ', 4, 8900, 6200, '5.jpg,,', 1, 'P05', '<p>Thiệp cưới in hình trên giấy mỹ thuật  6900đ/bộ</p>', '2018-03-22 00:00:00'),
(41, 'P06', 'Thiệp cưới in hình giá chỉ 4500đ/bộ', 4, 4500, 3200, '6.jpg,,', 1, 'P06', '<p>Thiệp cưới in hình giá chỉ 3900đ/bộ</p>', '2018-03-22 00:00:00'),
(42, 'P07', 'Thiệp cưới in hình giá chỉ 4500đ/bộ', 4, 4500, 3200, '71.jpg,,', 1, 'P07', '<p>Thiệp cưới in hình giá chỉ 3900đ/bộ</p>', '2018-03-22 00:00:00'),
(43, 'P08', 'Thiệp cưới in hình giá chỉ 4500đ/bộ', 4, 4500, 3200, '8.jpg,,', 1, 'P08', '<p>Thiệp cưới in hình giá chỉ 3900đ/bộ</p>', '2018-03-22 00:00:00'),
(44, 'H23', 'thiệp hoa', 1, 4500, 3200, 'H23.jpg,,', 1, 'H23', '<p>.</p>', '2018-03-22 00:00:00'),
(45, 'V06', 'Thiệp cưới cổ điển', 3, 6500, 4500, 'V06.jpg,,', 1, 'V06', '<p>Thiệp cưới cổ điển </p>', '2018-03-22 00:00:00'),
(46, 'C01', 'Thiep cao cap', 2, 6500, 5500, 'C01.jpg,C01a.jpg,C01b.jpg', 1, 'c01', '<p><img alt=\"\" src=\"/uploads/images/C01.jpg\" xss=removed></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/C01b.jpg\"></p>', '2018-03-23 00:00:00'),
(47, 'C02', 'Thiệp cưới pc', 2, 10000, 75000, 'dau-01_web.jpg,dau_2.jpg,dau_3-01.jpg', 1, '01', '<p><img alt=\"\" src=\"/uploads/images/dau_2.jpg\" xss=removed></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/dau-01_web.jpg\" xss=removed></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/dau_3-01.jpg\" xss=removed></p>', '2018-04-20 00:00:00'),
(48, 'C05', 'C05', 2, 7000, 5000, 'hoa_aplle-01aa.jpg,,', 1, '07', '<p>07</p>', '2018-04-20 00:00:00'),
(49, 'C06', 'C06', 2, 6500, 6000, 'cuc.jpg,,', 1, '06', '<h2>CHẤT LIỆU:</h2>\r\n\r\n<p>Giấy Econo Nhật cao cấp. định lượng 250/300 grs</p>\r\n\r\n<h2>KIỂU IN:</h2>\r\n\r\n<p>In kỹ thuật số cao cấp</p>\r\n\r\n<h2>KÍCH THƯỚC:</h2>\r\n\r\n<p>+ Bao thư: 14 x 19</p>\r\n\r\n<p>+ Thiệp báo: 13 x 18</p>\r\n\r\n<p>+ Thiệp mời: 11 x 15</p>', '2018-04-20 00:00:00'),
(50, 'V02', 'V', 3, 10000, 8000, 'kraft_1-01-01.jpg,kraft_1-02-01-01.jpg,kraft_1-02-3-01-01.jpg', 1, '02', '<p><img alt=\"\" src=\"/uploads/images/kraft_1-02-01-01.jpg\" xss=removed></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/kraft_1-01-01.jpg\" xss=removed></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/kraft_1-02-3-01-01.jpg\" xss=removed></p>', '2018-04-20 00:00:00'),
(54, 'C08', 'C08', 2, 9500, 7500, 'hoa_2_B-011.jpg,hoa_2-01.jpg,weeding-invitations-7-.jpg', 1, '04', '<p><img alt=\"\" src=\"/uploads/images/hoa_2_B-011.jpg\" xss=removed></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/weeding-invitations-7-.jpg\" xss=removed></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/hoa_2-01.jpg\" xss=removed></p>', '2018-04-24 00:00:00'),
(55, 'V03', '1', 3, 9500, 7000, 'V03_1.jpg,rustic-floral-laser-cut-wedding-invites-EWWS131-5.jpg,rustic-floral-laser-cut-wedding-invites-EWWS131.jpg', 1, '02', '<p><img alt=\"\" src=\"/uploads/images/V03_1.jpg\"></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/V03_2.jpg\"></p>\r\n\r\n<p> </p>\r\n\r\n<p> </p>\r\n\r\n<p> </p>', '2018-04-24 00:00:00'),
(56, 'V04', 'V04', 3, 12000, 1000, 'InvitationLaceBlush00.jpg,InvitationLaceBlush00aaa.jpg,', 1, 'a', '<p><img alt=\"\" src=\"/uploads/images/InvitationLaceBlush00.jpg\" xss=removed></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/InvitationLaceBlush00aaa.jpg\"></p>\r\n\r\n<p> </p>', '2018-04-24 00:00:00'),
(57, 'KM06', 'BST Thiệp cưới khuyến mãi đồng giá chỉ 3000đ/bộ', 6, 3500, 2000, 'KM06.jpg,,', 1, '1', '<p>1</p>', '2018-03-12 00:00:00'),
(58, 'KM05', 'BST Thiệp cưới khuyến mãi đồng giá chỉ 3000đ/bộ', 6, 3000, 2000, 'KM05.jpg,,', 1, '1', '<p>1</p>', '2018-03-31 00:00:00'),
(59, 'KM04', 'BST Thiệp cưới khuyến mãi đồng giá chỉ 3000đ/bộ', 6, 3000, 2000, 'KM04.jpg,,', 1, '4', '<p>1</p>', '2018-04-01 00:00:00'),
(60, 'KM02', 'BST Thiệp cưới khuyến mãi đồng giá chỉ 3000đ/bộ', 6, 4000, 2000, 'KM03.jpg,,', 1, '1', '<p>1</p>', '2018-04-02 00:00:00'),
(61, 'KM03', 'BST Thiệp cưới khuyến mãi đồng giá chỉ 3000đ/bộ', 6, 3500, 2000, 'KM02.jpg,,', 1, '1', '<p>1</p>', '2018-04-02 00:00:00'),
(62, 'KM01', 'BST Thiệp cưới khuyến mãi đồng giá chỉ 3000đ/bộ', 6, 3500, 2000, 'KM01.jpg,,', 1, '1', '<p>1</p>', '2018-04-04 00:00:00'),
(63, 'C07', 'Thiệp cưới phong cách ART DECO 1920s', 2, 12000, 85000, 'deco_2.jpg,deco_2_b.jpg,deco_2_a1.jpg', 1, 'q', '<p><img alt=\"\" src=\"/uploads/images/deco_2_b.jpg\"></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/deco_2_a1.jpg\" xss=removed></p>', '2018-05-10 00:00:00'),
(64, 'H24', 'Greenery là màu của khởi đầu đầy sức sống. Và thật ý nghĩa nếu chọn màu khởi đầu cho ngày trọng đại khởi đầu một chương mới của cuộc đời mỗi chúng ta', 1, 6000, 4500, 'mau_55-0_web.jpg,mau_55-01a.jpg,mau_55-01ac.jpg', 1, 'a', '<p><img alt=\"\" src=\"/uploads/images/mau_55-01a.jpg\"></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/mau_55-01ac.jpg\"></p>', '2018-05-08 00:00:00'),
(65, 'R.001', 'Với một đám cưới được tổ chức ở bãi biển thì chắc chắn thiệp cưới này sẽ đáp ứng được sở thích của chủ nhân buổi lễ', 1, 9000, 7500, '49_-_mau_bien-011.jpg,49_-_mau_bien-01800jpg.jpg,', 1, '1', '<p>1 bộ thiệp bao gồm</p>\r\n\r\n<p>1 bao thư chữ V kích thước 14 x 19 cm ( kèm lót trong in cùng chủ đề )</p>\r\n\r\n<p>1 thiệp báo 13x18 cm có lót đế giấy kraft</p>\r\n\r\n<p>1 thiệp mời 12 x 17 cm có lót đế giất kraft</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/49_-_mau_bien-01800jpg.jpg\" xss=removed></p>\r\n\r\n<p> </p>', '2018-05-11 00:00:00'),
(66, 'H028', 'Tấm thiệp hồng đi kèm với nó là sắc đỏ rực của hoa thì càng khiến ngày vui của thêm điểm nhấn', 1, 9000, 7000, '1500x1170_px.jpg,sau_chinh_suawm-0A1.jpg,', 1, '1', '<p>1 bộ thiệp bao gồm:</p>\r\n\r\n<p>1 bao thư chữ V kích thước 14 x 19 cm ( kèm lót trong in cùng chủ đề )</p>\r\n\r\n<p>1 thiệp báo 13x18 cm </p>\r\n\r\n<p>1 thiệp mời 11 x 15 cm</p>\r\n\r\n<p> </p>', '2018-05-11 00:00:00'),
(67, 'H029', 'Greenery là màu của khởi đầu đầy sức sống. Và thật ý nghĩa nếu chọn màu khởi đầu cho ngày trọng đại khởi đầu một chương mới của cuộc đời mỗi chúng ta', 1, 4500, 3500, 'mau_59_WEB.jpg,mau_59_a.jpg,mau_59b.jpg', 1, '1', '<p><img alt=\"\" src=\"/uploads/images/mau_59_a.jpg\"></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/mau_59.jpg\"></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/mau_59b.jpg\"></p>', '2018-05-14 00:00:00'),
(68, 'P09', 'Greenery là màu của khởi đầu đầy sức sống. Và thật ý nghĩa nếu chọn màu khởi đầu cho ngày trọng đại khởi đầu một chương mới của cuộc đời mỗi chúng ta', 4, 4500, 3500, '61_sss.jpg,il_fullxfull_620230190_b4uz.jpg,', 1, 'q', '<p><img alt=\"\" src=\"/uploads/images/mau_61a.jpg\" xss=removed></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/61_sss.jpg\"></p>', '2018-05-14 00:00:00'),
(69, 'P10', 'Thiệp in hình ngộ nghĩnh', 4, 4500, 3900, 'mau-65-01.jpg,,', 1, '1', '<p>Thiệp cưới in hình</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/mau-65-01.jpg\" xss=removed></p>', '2018-05-14 00:00:00'),
(70, 'P11', 'Thiệp cưới in hình siêu cute', 4, 6000, 3900, 'PP02_web1.jpg,,', 1, '1', '<p>Thiệp cưới in hình siêu cute</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/PP02_web1.jpg\"></p>', '2018-04-01 00:00:00'),
(71, 'C09', 'Thiệp chất liệu mica', 2, 35000, 20000, 'sdfasd.jpg,,', 1, '1', '<p>Thiệp cao cấp</p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/sdfasd.jpg\"></p>', '2018-06-07 00:00:00'),
(72, 'H030', 'Thiệp Họa tiết con công', 1, 7500, 5000, 'con_cong.jpg,,', 1, '1', '<p>a<img alt=\"\" src=\"/uploads/images/con_cong.jpg\"></p>', '2018-06-07 00:00:00'),
(73, 'H31', 'Thiệp Hoa', 1, 4500, 39000, 'la.jpg,,', 1, '1', '<p><img alt=\"\" src=\"/uploads/images/la.jpg\" xss=removed></p>', '2018-05-27 00:00:00'),
(74, 'Sản phẩm test 001', 'Sản phẩm test 001', 1, 5000, 4000, '5e612d7b71a702526ca31fad.jpg,,', 1, '1', '<p>Hihi Sản phẩm test 001</p>', '2020-03-23 00:00:00'),
(75, 'A032', 'Thiep KM', 1, 1500, 1000, '82533189_2615837318663433_3765234847279218688_n.jpg,82173643_2611113462469152_1985433483949899776_n.jpg,83710073_2628577230722775_3581851318676881408_n.jpg', 1, '1', '<p>dfafasdf<img alt=\"\" src=\"/uploads/images/01peony4love.jpg\"></p>\r\n\r\n<p><img alt=\"\" src=\"/uploads/images/7bd1055f09bc5cc4cf6cec8a544c68cc.jpg\"></p>\r\n\r\n<p>o<img alt=\"\" src=\"/uploads/images/1ff8f441-9d88-4e3d-863e-6880a510f52c.jpg\" xss=removed><img alt=\"\" src=\"/uploads/images/2020/82533189_2615837318663433_3765234847279218688_n.jpg\" xss=removed></p>', '2020-03-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, 'm6zsr/H8j6bPV6pPSaH6/O', 1268889823, 1589266635, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(2, '115.73.130.174', NULL, '$2y$08$0MduXqD4x8hXe0AlRf6Myu2tyUtvPDD4ozbIlAxPVSjpQ29SDTW9O', NULL, 'tanytuong@gmail.com', NULL, NULL, NULL, 'CwpXtLDZsD5snhjoqxIknu', 1507171339, 1565421988, 1, 'tanproit', 'bui', 'fastprint', '0949449914'),
(3, '116.111.9.155', NULL, '$2y$08$7hc5HmKyGiwLlrrOQEOhVO/bxo964juQt19PcCPnm6UwJO2H9PUIa', NULL, 'thiepcuoionline.vn@gmail.com', NULL, NULL, NULL, NULL, 1510328698, NULL, 1, 'quan', 'tri vien', 'TConline', '0949449914');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(10, 2, 1),
(8, 3, 1),
(9, 3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logos`
--
ALTER TABLE `logos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logos`
--
ALTER TABLE `logos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

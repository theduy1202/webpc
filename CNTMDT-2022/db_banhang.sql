-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2022 at 06:21 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_banhang`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(16, 17, '2022-01-04', 98094000, 'ATM', 'không', '2022-01-04 05:07:27', '2022-01-04 05:07:27'),
(15, 16, '2021-12-21', 23597000, 'ATM', 'không có', '2021-12-21 08:31:10', '2021-12-21 08:31:10'),
(14, 15, '2021-12-21', 150652000, 'COD', 'Không có', '2021-12-21 08:22:35', '2021-12-21 08:22:35');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(15, 16, 20, 1, 66927000, '2022-01-04 05:07:27', '2022-01-04 05:07:27'),
(14, 16, 15, 1, 31167000, '2022-01-04 05:07:27', '2022-01-04 05:07:27'),
(13, 15, 11, 1, 23597000, '2021-12-21 08:31:10', '2021-12-21 08:31:10'),
(12, 14, 23, 1, 109129000, '2021-12-21 08:22:35', '2021-12-21 08:22:35'),
(11, 14, 3, 1, 11253000, '2021-12-21 08:22:35', '2021-12-21 08:22:35'),
(10, 14, 8, 1, 18307000, '2021-12-21 08:22:35', '2021-12-21 08:22:35'),
(9, 14, 5, 1, 11963000, '2021-12-21 08:22:35', '2021-12-21 08:22:35');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(16, 'Dang The', 'Nam', 'theduyspeed4165@gmail.com', 'LA-LS-LX', '0123456789', 'không có', '2021-12-21 08:31:10', '2021-12-21 08:31:10'),
(17, 'Dang The', 'Nam', 'angduy525@gmail.com', 'LA-LS-LX', '0123456789', 'không', '2022-01-04 05:07:27', '2022-01-04 05:07:27'),
(15, 'Dang The', 'Nam', 'angduy55@gmail.com', 'LA-LS-LX', '0123456789', 'Không có', '2021-12-21 08:22:35', '2021-12-21 08:22:35');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Gaming PC - Alpha 3000G - Athlon 3000G/ B450/ 8GB/ 128GB', 1, '- CPU: AMD Athlon 3000G (3.5GHz, 2 nhân 4 luồng , 5MB Cache )\r\n\r\n- Mainboard: ASUS TUF GAMING B450M-PRO II\r\n\r\n- RAM: V-Color Skywalker Plus 8GB 3200MHz Purple\r\n\r\n- Nguồn: Cooler Master Elite V3 230V P400 400W Bulk\r\n\r\n- SSD: Ổ cứng SSD ADATA XPG SX6000 LITE 128GB M2 NVMe 2280\r\n\r\n- Vỏ case: Vỏ Case Golden Field U2', 5663000, 0, 'alpha-3000g-500x500.jpg', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(2, 'Gaming PC - Alpha 10100 - i3 10100/ H510/ 8GB/ 128GB/ 400W', 1, '- CPU: Intel Core i3-10100 4C/8T (3.6GHz up to 4.3GHz, 6MB)\r\n\r\n- Mainboard: Asus Prime H510M-D\r\n\r\n- RAM: RAM V-Color Skywalker Plus 8GB 3200MHz Purple\r\n\r\n- Nguồn: Nguồn Cooler Master Elite V3 230V P400 400W Bulk\r\n\r\n- SSD: ADATA XPG SX6000 LITE 128GB M2 NVMe 2280\r\n\r\n- Vỏ case: Vỏ Case Golden Field U2', 8832000, 8591000, 'Alpha-10100-500x500.jpg', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(3, 'Gaming PC - Alpha RX550 - i3 10100F/ H510/ 8GB/ 128GB/ 400W', 1, '- CPU: Intel Core i3-10100F 4C/8T (3.6GHz up to 4.3GHz, 6MB)\r\n\r\n- Mainboard: Bo Mạch Chủ Asus Prime H510M-E\r\n\r\n- RAM: Ram Desktop Klevv 8GB DDR4 2666Mhz\r\n\r\n- VGA: Card Màn Hình Biostar Radeon RX 550 4GB\r\n\r\n- Nguồn: Nguồn Cooler Master Elite V3 230V P400 400W Bulk\r\n\r\n- SSD: ADATA XPG SX6000 LITE 128GB M2 NVMe 2280\r\n\r\n- Vỏ case: Vỏ Case Golden Field U2', 11253000, 0, 'Alpha-RX550-500x500.jpg', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(4, 'Gaming PC - Alpha 4650G - Ryzen 5 PRO 4650G/ B450/ 8GB/ 128GB/ 400W', 1, '- CPU: AMD Ryzen 5 PRO 4650G MPK (3.7 GHz upto 4.2GHz/ 6 Cores, 12 Threads)\r\n\r\n- Mainboard: ASUS TUF GAMING B450M-PRO II\r\n\r\n- RAM: V-Color Skywalker Plus 8GB 3200MHz Purple\r\n\r\n- Nguồn: Cooler Master Elite V3 230V PC400 400W\r\n\r\n- SSD: AFOX 120GB Sata III (AFSN8T3BN120G)\r\n\r\n- Vỏ case: Xigmatek Venom ll MES', 11326000, 0, 'pc-alpha-4650g-500x500.png', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(5, 'Gaming PC - Alpha 5600G - R5 5600G/ B450M/ 8GB/ 128GB/ 400W', 1, '- CPU:CPU AMD Ryzen 5 5600G (3.9GHz Upto 4.4GHz / 19MB / 6 Cores, 12 Threads )\r\n\r\n- Mainboard: Bo mạch chủ ASUS TUF GAMING B450M-PRO II\r\n\r\n- RAM: Ram Desktop Klevv 8GB DDR4 2666Mhz\r\n\r\n- Nguồn: Nguồn Cooler Master Elite V3 230V P400 400W Bulk\r\n\r\n- SSD: ADATA XPG SX6000 LITE 128GB M2 NVMe 2280\r\n\r\n- Vỏ case: Vỏ Case Golden Field U2', 11963000, 0, 'gaming-pc-alpha-5600g-a-500x500.jpg', 'Bộ', 1, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(6, 'Gaming PC - Glacier 1050Ti - i3 10105F/ H510/ 8GB/ 128GB/ GTX 1050Ti/ 550W', 2, '- CPU Intel Core i3-10105F 4C/8T (3.6GHz up to 4.3GHz, 6MB) \r\n\r\n- Main: Bo Mạch Chủ Asus Prime H510M-E\r\n\r\n- Ram: RAM V-Color Skywalker Plus 8GB 3200MHz Purple\r\n\r\n- SSD: Ổ cứng SSD ADATA XPG SX6000 LITE 128GB M2 NVMe 2280\r\n\r\n- VGA: Palit GTX 1050 Ti StormX\r\n\r\n- PSU: Nguồn máy tính Gigabyte P550B 550W - 80 Plus Bronze\r\n\r\n- Case: Vỏ Case Xigmatek Gemini (No Fan)', 13797000, 0, 'Glacier-1050Ti-500x500.jpg', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(7, 'Gaming PC - Glacier 1650 - i3 10105F/ H510/ 8GB/ 128GB/ GTX 1650/ 550W', 2, '- CPU Intel Core i3-10105F 4C/8T (3.6GHz up to 4.3GHz, 6MB) \r\n\r\n- Main: Bo Mạch Chủ ASROCK H510M-HDV\r\n\r\n- Ram: RAM V-Color Skywalker Plus 8GB 3200MHz Purple\r\n\r\n- SSD : Ổ cứng SSD ADATA XPG SX6000 LITE 128GB M2 NVMe 2280\r\n\r\n- VGA: Card Màn Hình Inno3D GTX 1650 TWIN X2 OC 4GB GDDR6\r\n\r\n- PSU:  Nguồn máy tính Gigabyte P550B 550W - 80 Plus Bronze\r\n\r\n- Case:  Xigmatek Gemini (No Fan)', 14847000, 0, 'Glacier-1650-500x500.jpg', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(8, 'Gaming PC - Glacier 1650 Super - i3 10105F / B560M/ 8GB/ 250GB/ GTX 1650 Super/ 550W\r\n', 2, '- CPU: Intel Core i3-10105F 4C/8T (3.6GHz up to 4.3GHz, 6MB) - LGA 1200\r\n\r\n- Bo Mạch Chủ: Asus Prime H510M-K\r\n\r\n- Ram: V-Color Skywalker Plus 8GB 3200MHz Purple\r\n\r\n- Card Màn Hình: Asus TUF GTX 1650 Super 4GB Gaming GDDR6\r\n\r\n- Nguồn: Gigabyte P550B 550W - 80 Plus Bronze\r\n\r\n- Ổ cứng: Kingston NV1 250GB NVMe PCIe Gen 3.0 x 4\r\n\r\n- Vỏ case: Xigmatek Venom ll GLS', 18377000, 18307000, 'gaming-pc-glacier-1650s-500x500.png', 'Bộ', 1, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(9, 'Gaming PC - Sniper 6600 i3-10105F/ B560M/ 16GB/ 128GB/ / 550W', 3, '- CPU:Intel Core i3 - 10105F 4C/8T ( 3.7GHz up to 4.4GHz, 6MB )\r\n\r\n- Mainboard: Asrock B560M-HDV\r\n\r\n- RAM: Kingston HyperX Fury Black 16G/2666 (8GB x2)\r\n\r\n- SSD: DATA XPG SX6000 LITE 128GB M2 NVMe 2280\r\n\r\n- VGA: ASROCK Radeon RX 6600 Challenger D 8GB (RX6600 CLD 8G)\r\n\r\n- PSU: Gigabyte P550B 550W - 80 Plus Bronze\r\n\r\n- Vỏ case: Xigmatek Gemini Arctic', 23499000, 0, 'gaming-pc-sniper-6600-500x500.jpg', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(11, 'Gaming PC - Sniper 1660 Super i3-10105F/ H510/ 8GB/ 128GB/ GTX 1660 Super/ 550W', 3, '- CPU:Intel Core i3 - 10105F 4C/8T ( 3.7GHz up to 4.4GHz, 6MB )\r\n\r\n- Mainboard:  Bo Mạch Chủ Asus Prime H510M-E\r\n\r\n- RAM: RAM V-Color Skywalker Plus 8GB 3200MHz Purple\r\n\r\n- SSD: DATA XPG SX6000 LITE 128GB M2 NVMe 2280\r\n\r\n- VGA: GIGABYTE GTX 1660 SUPER OC 6G\r\n\r\n- PSU: Nguồn máy tính Gigabyte P550B 550W - 80 Plus Bronze\r\n\r\n- Vỏ case: Vỏ Case Xigmatek Gemini', 23597000, 0, 'Sniper-1660s-500x500.jpg', 'Bộ', 1, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(12, 'Gaming PC - Lumen 2060 - i3 10105F/H510M/ 16GB/ 250GB/ RTX 2060/ 550W', 4, '- CPU : Intel Core i3 - 10105F 4C/8T ( 3.7GHz up to 4.4GHz, 6MB )\r\n\r\n- VGA :  Asus Dual RTX 2060 6G EVO\r\n\r\n- Main :  Bo Mạch Chủ Asus Prime H510M-E\r\n\r\n- RAM : Kingston HyperX Fury Black 16G/2666 (8GB x2)\r\n\r\n- PSU : Nguồn Gigabyte P550B 550W - 80 Plus Bronze\r\n\r\n- SSD: Ổ Cứng SSD Kingston NV1 250GB NVMe PCIe Gen 3.0 x 4\r\n\r\n- Vỏ Case : Vỏ Case Xigmatek Gemini', 24388000, 24318000, 'Lumen-2060-500x500.png', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(13, 'Gaming PC - Lumen 6600XT Naraka Edition - i3 10105F/ H510/ 16GB/ 250GB/ 6600XT/ 550W', 4, '- CPU : Intel Core i3 - 10105F 4C/8T ( 3.7GHz up to 4.4GHz, 6MB )\r\n\r\n- VGA :  MSI Radeon RX 6600 XT MECH 2X 8G OC\r\n\r\n- Main : Bo Mạch Chủ Asus Prime H510M-E\r\n\r\n- RAM : RAM Kingston HyperX Fury Black 16G/2666 (8GB x2)\r\n\r\n- PSU : Corsair CV650 - 80 Plus Bronze\r\n\r\n- SSD: ADATA XPG SX6000 LITE 256GB\r\n\r\n- Vỏ Case : Xigmatek Gemini Arctic', 25239000, 0, 'gaming-pc-lumen-6600xt-x-500x500.jpg', 'Bộ', 1, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(14, 'Gaming PC - Đỗ Đại Học (Nova 3060) - i3 10105F/ H510/ 250GB/ 16GB/ RTX 3060/ 650W', 5, '- CPU: Intel Core i3 - 10105F 4C/8T ( 3.7GHz up to 4.4GHz, 6MB )\r\n\r\n- Main: Bo Mạch Chủ Asus Prime H510M-E\r\n\r\n- RAM: Kingston HyperX Fury Black 16G/2666 (8GB x2)\r\n\r\n- SSD: Ổ Cứng SSD Kingston NV1 250GB NVMe PCIe Gen 3.0 x 4\r\n\r\n- VGA:  LEADTEK RTX 3060 CLASSIC 12GB\r\n\r\n- PSU: Nguồn Corsair CV650 - 80 Plus Bronze\r\n\r\n- Vỏ case: Vỏ Case XIGMATEK GAMING X 3FX', 27278000, 27208000, 'do-dai-hoc-500x500.png', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(15, 'Gaming PC - Nova 3060 Mini iTX - I5 10400F/ B460/ 16GB / 250GB/ RTX 3060/ 550W', 5, '- CPU: Intel Core i5-10400F (2.9GHz up to 4.3GHz, 12MB)\r\n\r\n- Main: ASUS PRIME B460I-PLUS\r\n\r\n- Ram: Kingston HyperX Fury Black 16G/2666 (8GB x2)\r\n\r\n- SSD : SSD Western Digital Blue SN550 500GB NVME\r\n\r\n- VGA: LEADTEK RTX 3060 CLASSIC 12GB (LHR)\r\n\r\n- PSU: Nguồn Corsair CV650 - 80 Plus Bronze\r\n\r\n- Case:  NZXT H210 Matte White', 31258000, 31167000, 'Nova-3060-itx-500x500.png', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(16, 'Gaming PC - Nova 6700XT - i5-11500/ B560/ 16GB/ RX 6700XT/ 250GB/ 650W', 5, '- CPU: Intel Core i5 - 11500 6C/12T ( 2.7GHz up to 4.4GHz, 12MB )\r\n\r\n- Main: Asus Prime B560M-K\r\n\r\n- RAM: Kingston HyperX Fury Black 16G/2666 (8GB x2)\r\n\r\n- SSD: Samsung 980 250GB M.2 NVMe\r\n\r\n- VGA: MSI RX 6700 XT MECH 2X 12G OC\r\n\r\n- PSU: SilverStone VIVA 650 - 80 Plus Bronze\r\n\r\n- Vỏ case:  XIGMATEK TRIPLE X', 36537000, 0, 'Nova-6700XT-500x500.png', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(17, 'Gaming PC - Nova 3070Ti - i5 10400F/ B460/ 16GB/ 512GB/ RTX 3070Ti/ 750W', 5, '- CPU: Intel Core i5-10400F (2.9GHz up to 4.3GHz, 12MB) - LGA 1200\r\n\r\n- Main: Asus Prime B460M-K\r\n\r\n- Ram: Kingston HyperX Fury Black 16G/2666 (8GB x2)\r\n\r\n- VGA: INNO3D Geforce RTX 3070 Ti X3 OC ( LHR)\r\n\r\n- SSD: Kingston NV1 500GB NVMe PCIe Gen 3.0 x 4\r\n\r\n- PSU: Corsair RM750 80 Plus Gold\r\n\r\n- Case: Xigmatek Master X 3FX', 40667000, 40377000, 'gaming-pc-nova-gen10-rtx-500x500.png', 'Bộ', 1, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(18, 'Gaming PC - Nova 3070Ti - Ryzen 5 3600/ B450/ 16GB/ 256GB/ RTX 3070Ti/ 750W', 5, '- CPU: CPU AMD Ryzen 5 3600 3.6 GHz\r\n\r\n- Main: ASUS Prime B450M-A II\r\n\r\n- RAM: Ram Klevv Cras X RGB 16GB (2x8GB) DDR4 Bus 3200\r\n\r\n- VGA: INNO3D Geforce RTX 3070 Ti X3 OC ( LHR)\r\n\r\n- SSD: Silicon Power A60 M.2 NVME 256GB\r\n\r\n- PSU: Nguồn SilverStone Essential Series ET650-G 80 Plus Gold\r\n\r\n- Case: Xigmatek Master X 3FX', 42167000, 41968000, 'gaming-pc-nova-3070-by-aorus-500x500.png', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(19, 'Gaming PC - Nova 3060Ti Mini - i5 11500/ B560/ 16GB/ 1TB/ RTX 3060Ti/ 650W', 5, '- CPU Intel Core i5 - 11500 6C/12T ( 2.7GHz up to 4.4GHz, 12MB )\r\n\r\n- Main: Asus ROG Strix B560-I GAMING WIFI\r\n\r\n- Ram Klevv Cras XR RGB 16GB (2x8GB) DDR4 Bus 3600\r\n\r\n- SSD : Silicon Power P34A80 1TB\r\n\r\n- VGA: ASUS DUAL GeForce RTX 3060 Ti V2 MINI O8GB GDDR6 (LHR)\r\n\r\n- Nguồn:  Asus TUF Gaming 650W Bronze\r\n\r\n- Case:  Asus ROG Z11 ITX (Mini ITX Tower/Màu đen)', 48348000, 48048000, 'gaming-pc-nova-3060ti-mini-500x500.png', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(20, 'Gaming PC - Nova 6800XT - Ryzen 9 5900X / X570/ 32GB/ RX 6800XT/ 1Tb/ 750W', 5, '- CPU: AMD Ryzen 9 5900X 3.7 GHz (4.8GHz Max Boost)/ 70MB Cache/ 12C24T/ 105W/ Socket AM4\r\n\r\n- Main: Gigabyte X570 Gaming X\r\n\r\n- RAM: G.Skill TRIDENT Z RGB - 32GB (16GBx2) DDR4 3200MHz\r\n\r\n- SSD: Kingston NV1 1TB NVMe PCIe Gen 3.0 x 4\r\n\r\n- VGA: GIGABYTE Radeon RX 6800 XT GAMING OC 16G\r\n\r\n- PSU: Gigabyte P750GM 750W - 80 Plus Gold\r\n\r\n- Vỏ case: Gigabyte AORUS C300 GLASS\r\n\r\n- Tản Nhiệt CPU: Gigabyte AORUS ATC800', 67227000, 66927000, 'Nova-6800-XT-500x500.png', 'Bộ', 1, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(21, 'Gaming PC - Sentinel 3070 - i7 12700K/ Z690/ 32GB/ 2TB/ RTX 3070/ 850W', 6, '- CPU: Intel Core i7 - 12700K 12C/20T ( 3.60 GHz up to 5.00 GHz )\r\n\r\n- Main: ASUS ROG STRIX Z690-E GAMING WIFI\r\n\r\n- RAM: Kingston FURY Beast 32G/5200MHz/DDR5 (16x2)\r\n\r\n- SSD: Silicon Power US70 M.2 NVME 2TB PCIe Gen4x4\r\n\r\n- VGA: ASUS GeForce RTX 3070 Noctua OC Edition 8GB\r\n\r\n- PSU: Asus ROG Strix 850W Gold\r\n\r\n- Vỏ case: NZXT H710 Matte Black\r\n\r\n- Tản Nhiệt CPU: AIO Asus ROG Strix LC 360 ARG', 82807000, 83407000, 'PC-Sentinel-3070-500x500.png', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(22, 'Gaming PC Sentinel 3080A - R7 5800X/ B550/ 32GB/ 512Gb NVME/ RTX 3080/ 850W', 6, '- CPU : Ryzen 7 5800X 3.8 GHz (4.7 GHz with boost) / 32MB / 8 cores 16 threads / 105W / Socket AM4\r\n\r\n- VGA : ASUS ROG Strix RTX 3080 O10G Gaming\r\n\r\n- Main : Asus ROG STRIX B550-E GAMING\r\n\r\n- RAM : G.Skill TRIDENT Z RGB - 32GB (16GBx2) DDR4 3000MHz\r\n\r\n- PSU : Corsair RM850 80 PLUS Gold PSU Modular\r\n\r\n- SSD :  Intel 660p 512GB PCIe NVMe 3.0 x4\r\n\r\n- Vỏ Case : Corsair 4000D Airflow TG Black', 83568000, 83168000, 'sentinel-a-500x500.jpg', 'Bộ', 0, '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(23, 'Gaming PC - Sentinel 3080 Powered By MSI - i9 11900/ Z590/ 32GB/ 512Gb NVME/ RTX 3080/ 850W', 6, '- CPU: Intel Core i9 - 11900 8C/16T ( 2.5GHz up to 5.2GHz, 16MB )\r\n\r\n- Main: MSI MEG Z590 GODLIKE\r\n\r\n- Ram: G.Skill TRIDENT Z RGB - 32GB (16GBx2) DDR4 3000MHz\r\n\r\n- VGA: MSI RTX 3080 SUPRIM X 10G\r\n\r\n- SSD: Samsung 980 Pro 1TB\r\n\r\n- PSU: MSI MPG A850GF 850W - 80 Plus Gold\r\n\r\n- Case: MSI MPG Sekira 500G\r\n\r\n- Tản Nhiệt AIO: MSI MAG CORELIQUID 360R', 117547000, 109129000, 'gaming-pc-sentinel-3080-by-msi-500x500.jpg', 'Bộ', 1, '2021-12-20 00:33:33', '2021-12-20 00:33:33');

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.png'),
(4, '', 'banner4.png');

-- --------------------------------------------------------

--
-- Table structure for table `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Gaming PC Alpha', '- CPU: Intel Core i3-10100F 4C/8T (3.6GHz up to 4.3GHz, 6MB)\r\n\r\n- Mainboard: Bo Mạch Chủ Asus Prime H510M-E\r\n\r\n- RAM: Ram Desktop Klevv 8GB DDR4 2666Mhz\r\n\r\n- VGA: Card Màn Hình Biostar Radeon RX 550 4GB\r\n\r\n- Nguồn: Nguồn Cooler Master Elite V3 230V P400 400W Bulk\r\n\r\n- SSD: ADATA XPG SX6000 LITE 128GB M2 NVMe 2280\r\n\r\n- Vỏ case: Vỏ Case Golden Field U2', 'Alpha-RX550-500x500.jpg', '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(2, 'Gaming PC Glacier', '- CPU: Intel Core i3-10105F 4C/8T (3.6GHz up to 4.3GHz, 6MB) - LGA 1200\r\n\r\n- Bo Mạch Chủ: Asus Prime H510M-K\r\n\r\n- Ram: V-Color Skywalker Plus 8GB 3200MHz Purple\r\n\r\n- Card Màn Hình: Asus TUF GTX 1650 Super 4GB Gaming GDDR6\r\n\r\n- Nguồn: Gigabyte P550B 550W - 80 Plus Bronze\r\n\r\n- Ổ cứng: Kingston NV1 250GB NVMe PCIe Gen 3.0 x 4\r\n\r\n- Vỏ case: Xigmatek Venom ll GLS', 'gaming-pc-glacier-1650s-500x500.png', '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(3, 'Gaming PC Sniper', '- CPU:Intel Core i3 - 10105F 4C/8T ( 3.7GHz up to 4.4GHz, 6MB )\r\n\r\n- Mainboard:  Bo Mạch Chủ Asus Prime H510M-E\r\n\r\n- RAM: RAM V-Color Skywalker Plus 8GB 3200MHz Purple\r\n\r\n- SSD: DATA XPG SX6000 LITE 128GB M2 NVMe 2280\r\n\r\n- VGA: GIGABYTE GTX 1660 SUPER OC 6G\r\n\r\n- PSU: Nguồn máy tính Gigabyte P550B 550W - 80 Plus Bronze\r\n\r\n- Vỏ case: Vỏ Case Xigmatek Gemini', 'Sniper-1660s-500x500.jpg', '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(4, 'Gaming PC Lumen', '- CPU : Intel Core i3 - 10105F 4C/8T ( 3.7GHz up to 4.4GHz, 6MB )\r\n\r\n- VGA :  MSI Radeon RX 6600 XT MECH 2X 8G OC\r\n\r\n- Main : Bo Mạch Chủ Asus Prime H510M-E\r\n\r\n- RAM : RAM Kingston HyperX Fury Black 16G/2666 (8GB x2)\r\n\r\n- PSU : Corsair CV650 - 80 Plus Bronze\r\n\r\n- SSD: ADATA XPG SX6000 LITE 256GB\r\n\r\n- Vỏ Case : Xigmatek Gemini Arctic', 'gaming-pc-lumen-6600xt-x-500x500.jpg', '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(5, 'Gaming PC Nova', '- CPU: Intel Core i5 - 11500 6C/12T ( 2.7GHz up to 4.4GHz, 12MB )\r\n\r\n- Main: Asus Prime B560M-K\r\n\r\n- RAM: Kingston HyperX Fury Black 16G/2666 (8GB x2)\r\n\r\n- SSD: Samsung 980 250GB M.2 NVMe\r\n\r\n- VGA: MSI RX 6700 XT MECH 2X 12G OC\r\n\r\n- PSU: SilverStone VIVA 650 - 80 Plus Bronze\r\n\r\n- Vỏ case:  XIGMATEK TRIPLE X', 'Nova-6700XT-500x500.png', '2021-12-20 00:33:33', '2021-12-20 00:33:33'),
(6, 'Gaming PC Sentinel', '- CPU: Intel Core i9 - 11900 8C/16T ( 2.5GHz up to 5.2GHz, 16MB )\r\n\r\n- Main: MSI MEG Z590 GODLIKE\r\n\r\n- Ram: G.Skill TRIDENT Z RGB - 32GB (16GBx2) DDR4 3000MHz\r\n\r\n- VGA: MSI RTX 3080 SUPRIM X 10G\r\n\r\n- SSD: Samsung 980 Pro 1TB\r\n\r\n- PSU: MSI MPG A850GF 850W - 80 Plus Gold\r\n\r\n- Case: MSI MPG Sekira 500G\r\n\r\n- Tản Nhiệt AIO: MSI MAG CORELIQUID 360R', 'gaming-pc-sentinel-3080-by-msi-500x500.jpg', '2021-12-20 00:33:33', '2021-12-20 00:33:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dang The', 'BKU@gmail.com', '$2y$10$pHcnvRMrgBo4VwVoQaTSnOnaNFK7688tF06WqN9SVZYzl8O8Oq4f6', '0123456789', 'LA-LS-LX', NULL, '2021-12-21 09:27:28', '2021-12-21 09:27:28'),
(2, 'Dang The', 'angduy55@gmail.com', '$2y$10$Zka3XgQUSAxGQWkuUoZTFeOmRPoMurxMy4v/EyG2KJSEoWqgSS9zm', '0123456789', 'LA-LS-LX', 'TI1rRsQChDdViSv4o7Y3z7taLGOt3OQ4h9iCj8DhZWFVD0mHRivhVHHJto7I', '2021-12-21 10:30:32', '2021-12-21 10:30:32'),
(3, 'Dang The', 'angduy525@gmail.com', '$2y$10$y.F8ZJYeuSIcx4Hb2sIwy.0bJRsYvk4lXoyJY9u24QIcwLTFNLn9a', '0123456789', 'LA-LS-LX', NULL, '2022-01-04 04:59:48', '2022-01-04 04:59:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

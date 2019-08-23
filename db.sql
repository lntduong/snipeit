-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: db:3306
-- Generation Time: Aug 23, 2019 at 07:17 AM
-- Server version: 5.6.44
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `snipeit`
--
CREATE DATABASE IF NOT EXISTS `snipeit` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `snipeit`;

-- --------------------------------------------------------

--
-- Table structure for table `accessories`
--

CREATE TABLE `accessories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `requestable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accessories`
--

INSERT INTO `accessories` (`id`, `name`, `category_id`, `user_id`, `qty`, `requestable`, `created_at`, `updated_at`, `deleted_at`, `location_id`, `purchase_date`, `purchase_cost`, `order_number`, `company_id`, `min_amt`, `manufacturer_id`, `model_number`, `image`, `supplier_id`) VALUES
(1, 'USB Keyboard', 8, 1, 15, 0, '2019-06-11 01:52:41', '2019-06-11 01:52:41', NULL, 4, NULL, NULL, NULL, NULL, 2, 1, '9033261', NULL, 4),
(2, 'Bluetooth Keyboard', 8, 1, 10, 0, '2019-06-11 01:52:41', '2019-06-11 01:52:41', NULL, 3, NULL, NULL, NULL, NULL, 2, 1, '29988776', NULL, 4),
(3, 'Magic Mouse', 9, 1, 13, 0, '2019-06-11 01:52:41', '2019-06-11 01:52:41', NULL, 5, NULL, NULL, NULL, NULL, 2, 1, '24014322', NULL, 2),
(4, 'Sculpt Comfort Mouse', 9, 1, 13, 0, '2019-06-11 01:52:41', '2019-06-11 01:52:41', NULL, 1, NULL, NULL, NULL, NULL, 2, 2, '10147275', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accessories_users`
--

CREATE TABLE `accessories_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `action_logs`
--

CREATE TABLE `action_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `filename` text COLLATE utf8mb4_unicode_ci,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `expected_checkin` date DEFAULT NULL,
  `accepted_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `accept_signature` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `log_meta` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `action_logs`
--

INSERT INTO `action_logs` (`id`, `user_id`, `action_type`, `target_id`, `target_type`, `location_id`, `note`, `filename`, `item_type`, `item_id`, `expected_checkin`, `accepted_id`, `created_at`, `updated_at`, `deleted_at`, `thread_id`, `company_id`, `accept_signature`, `log_meta`) VALUES
(1, 2, 'checkout', 20, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 48, NULL, NULL, '2018-10-22 12:38:50', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(2, 1, 'checkout', 7, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 57, NULL, NULL, '2018-07-16 05:15:39', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(3, 2, 'checkout', 39, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1182, NULL, NULL, '2019-06-09 10:15:13', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(4, 1, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 78, NULL, NULL, '2019-05-13 21:19:51', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(5, 1, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 964, NULL, NULL, '2018-11-06 03:24:01', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(6, 1, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1117, NULL, NULL, '2018-07-23 07:58:49', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(7, 1, 'checkout', 20, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1129, NULL, NULL, '2019-02-24 05:16:43', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(8, 1, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 700, NULL, NULL, '2018-10-05 17:11:54', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(9, 2, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 204, NULL, NULL, '2018-12-06 02:43:54', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(10, 1, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1198, NULL, NULL, '2018-08-17 15:10:12', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(11, 1, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 655, NULL, NULL, '2018-09-02 09:54:20', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(12, 2, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1359, NULL, NULL, '2018-10-06 08:26:50', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(13, 2, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 454, NULL, NULL, '2018-09-28 14:54:26', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(14, 1, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 984, NULL, NULL, '2018-06-15 12:54:38', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(15, 1, 'checkout', 20, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 792, NULL, NULL, '2018-12-13 21:11:23', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(16, 1, 'checkout', 7, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 584, NULL, NULL, '2018-08-23 21:33:49', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(17, 1, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 172, NULL, NULL, '2018-07-16 13:43:18', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(18, 2, 'checkout', 1, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1323, NULL, NULL, '2019-02-15 05:52:44', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(19, 1, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 647, NULL, NULL, '2018-10-14 23:05:32', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(20, 1, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 266, NULL, NULL, '2019-05-17 09:55:15', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(21, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1368, NULL, NULL, '2018-10-29 15:56:52', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(22, 1, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 372, NULL, NULL, '2018-08-03 08:28:03', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(23, 1, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 509, NULL, NULL, '2018-08-09 07:06:12', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(24, 1, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1130, NULL, NULL, '2018-10-24 01:58:21', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(25, 1, 'checkout', 37, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1248, NULL, NULL, '2019-02-08 05:09:24', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(26, 2, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1235, NULL, NULL, '2019-01-13 18:59:36', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(27, 1, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 929, NULL, NULL, '2018-12-22 22:12:02', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(28, 2, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 234, NULL, NULL, '2019-05-24 08:15:54', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(29, 2, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 571, NULL, NULL, '2018-07-01 07:51:31', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(30, 2, 'checkout', 8, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 524, NULL, NULL, '2018-10-18 02:16:42', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(31, 1, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 611, NULL, NULL, '2019-01-21 05:59:05', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(32, 2, 'checkout', 51, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 830, NULL, NULL, '2019-02-17 00:55:37', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(33, 1, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 761, NULL, NULL, '2018-06-15 19:00:10', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(34, 2, 'checkout', 30, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 799, NULL, NULL, '2018-10-29 13:13:58', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(35, 2, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1259, NULL, NULL, '2019-04-27 22:05:14', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(36, 1, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 504, NULL, NULL, '2019-02-25 14:36:40', '2019-06-11 01:53:04', NULL, NULL, NULL, NULL, NULL),
(37, 1, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 885, NULL, NULL, '2019-03-19 17:24:27', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(38, 1, 'checkout', 27, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1199, NULL, NULL, '2018-07-16 21:31:42', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(39, 2, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1177, NULL, NULL, '2018-09-26 23:16:27', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(40, 2, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 642, NULL, NULL, '2018-09-16 08:52:44', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(41, 2, 'checkout', 29, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 692, NULL, NULL, '2019-06-03 01:58:25', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(42, 2, 'checkout', 14, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1268, NULL, NULL, '2018-07-06 06:59:16', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(43, 2, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1292, NULL, NULL, '2018-12-30 03:42:41', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(44, 2, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 970, NULL, NULL, '2018-11-08 19:10:22', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(45, 1, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 142, NULL, NULL, '2019-05-29 21:12:44', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(46, 1, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 507, NULL, NULL, '2018-11-14 01:22:29', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(47, 1, 'checkout', 22, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 79, NULL, NULL, '2018-10-19 17:51:59', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(48, 1, 'checkout', 48, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 200, NULL, NULL, '2018-12-17 05:46:14', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(49, 2, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 354, NULL, NULL, '2018-06-13 11:16:55', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(50, 1, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 470, NULL, NULL, '2019-06-09 06:37:17', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(51, 2, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 146, NULL, NULL, '2018-12-30 04:56:16', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(52, 2, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1155, NULL, NULL, '2018-11-13 08:26:22', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(53, 1, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 220, NULL, NULL, '2018-10-29 01:57:11', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(54, 2, 'checkout', 27, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 907, NULL, NULL, '2019-01-15 21:29:36', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(55, 1, 'checkout', 29, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 213, NULL, NULL, '2019-01-30 05:21:42', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(56, 2, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 92, NULL, NULL, '2019-03-19 04:28:38', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(57, 2, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1112, NULL, NULL, '2019-02-02 16:40:54', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(58, 1, 'checkout', 42, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 480, NULL, NULL, '2019-03-22 09:25:23', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(59, 1, 'checkout', 17, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 248, NULL, NULL, '2018-06-26 07:49:41', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(60, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 152, NULL, NULL, '2018-08-31 11:25:43', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(61, 1, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1282, NULL, NULL, '2019-05-22 07:58:32', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(62, 2, 'checkout', 30, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 242, NULL, NULL, '2018-11-18 03:19:18', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(63, 2, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1279, NULL, NULL, '2019-01-08 10:21:23', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(64, 2, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 966, NULL, NULL, '2018-07-06 05:46:25', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(65, 1, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 88, NULL, NULL, '2018-11-23 00:50:05', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(66, 2, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 210, NULL, NULL, '2019-03-28 16:56:05', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(67, 2, 'checkout', 27, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1225, NULL, NULL, '2018-08-21 18:19:52', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(68, 1, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 663, NULL, NULL, '2018-12-04 06:11:04', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(69, 1, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 245, NULL, NULL, '2019-02-11 20:40:40', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(70, 2, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 510, NULL, NULL, '2018-06-27 18:26:13', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(71, 1, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 808, NULL, NULL, '2019-04-14 23:49:15', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(72, 2, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 486, NULL, NULL, '2018-09-12 22:23:00', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(73, 2, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 307, NULL, NULL, '2019-03-01 17:00:52', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(74, 1, 'checkout', 23, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 518, NULL, NULL, '2019-05-23 21:42:01', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(75, 2, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1314, NULL, NULL, '2018-12-19 03:51:09', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(76, 2, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1200, NULL, NULL, '2018-08-31 22:32:38', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(77, 1, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 704, NULL, NULL, '2019-01-09 20:29:27', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(78, 2, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 222, NULL, NULL, '2018-11-02 05:47:49', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(79, 1, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 71, NULL, NULL, '2018-09-18 20:16:00', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(80, 2, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 276, NULL, NULL, '2018-12-21 07:53:12', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(81, 2, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 391, NULL, NULL, '2019-02-07 01:35:39', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(82, 1, 'checkout', 22, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 934, NULL, NULL, '2019-05-01 17:35:51', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(83, 2, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1254, NULL, NULL, '2018-09-19 07:30:09', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(84, 1, 'checkout', 18, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 188, NULL, NULL, '2018-09-03 12:52:36', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(85, 2, 'checkout', 43, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 445, NULL, NULL, '2019-05-01 13:01:24', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(86, 2, 'checkout', 40, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 977, NULL, NULL, '2018-08-26 13:11:07', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(87, 2, 'checkout', 55, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1216, NULL, NULL, '2019-01-15 12:14:27', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(88, 2, 'checkout', 43, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 697, NULL, NULL, '2018-12-18 06:40:29', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(89, 1, 'checkout', 41, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 766, NULL, NULL, '2019-03-14 07:44:34', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(90, 1, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1165, NULL, NULL, '2018-10-17 16:10:59', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(91, 1, 'checkout', 46, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 975, NULL, NULL, '2019-03-11 02:29:05', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(92, 2, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 368, NULL, NULL, '2018-11-18 19:03:02', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(93, 2, 'checkout', 52, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 911, NULL, NULL, '2018-09-06 05:49:27', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(94, 2, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 177, NULL, NULL, '2019-04-12 16:03:06', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(95, 1, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 231, NULL, NULL, '2019-03-16 01:49:10', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(96, 1, 'checkout', 48, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 568, NULL, NULL, '2018-11-09 09:19:23', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(97, 2, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1295, NULL, NULL, '2018-09-13 20:25:36', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(98, 1, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1150, NULL, NULL, '2018-09-06 19:49:43', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(99, 2, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 166, NULL, NULL, '2019-01-01 19:21:00', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(100, 2, 'checkout', 42, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 731, NULL, NULL, '2019-05-27 11:40:35', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(101, 2, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 238, NULL, NULL, '2019-01-23 20:23:16', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(102, 2, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 350, NULL, NULL, '2018-07-26 01:08:58', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(103, 2, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 305, NULL, NULL, '2019-04-08 16:56:26', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(104, 2, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1233, NULL, NULL, '2018-10-02 04:49:06', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(105, 2, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 775, NULL, NULL, '2018-09-29 21:55:27', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(106, 1, 'checkout', 32, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 501, NULL, NULL, '2018-09-24 16:12:24', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(107, 2, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 246, NULL, NULL, '2019-02-23 07:39:26', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(108, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 122, NULL, NULL, '2019-02-05 16:17:09', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(109, 2, 'checkout', 43, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1319, NULL, NULL, '2019-05-11 11:49:56', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(110, 2, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 572, NULL, NULL, '2019-04-19 18:12:59', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(111, 2, 'checkout', 39, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 318, NULL, NULL, '2018-12-09 03:44:42', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(112, 1, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1317, NULL, NULL, '2018-11-23 10:23:53', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(113, 1, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1132, NULL, NULL, '2018-08-25 19:41:30', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(114, 2, 'checkout', 17, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 163, NULL, NULL, '2018-08-03 20:19:01', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(115, 2, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 426, NULL, NULL, '2018-07-24 03:47:22', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(116, 2, 'checkout', 27, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 376, NULL, NULL, '2018-08-14 12:18:26', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(117, 1, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 891, NULL, NULL, '2019-03-02 00:39:43', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(118, 1, 'checkout', 40, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 361, NULL, NULL, '2018-07-04 08:07:41', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(119, 2, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 635, NULL, NULL, '2019-06-06 16:34:59', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(120, 2, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1226, NULL, NULL, '2018-12-06 18:48:23', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(121, 2, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 597, NULL, NULL, '2019-05-29 14:09:58', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(122, 2, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 433, NULL, NULL, '2018-06-23 10:27:59', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(123, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 370, NULL, NULL, '2019-03-06 06:45:57', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(124, 1, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 60, NULL, NULL, '2018-08-19 23:31:21', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(125, 2, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 521, NULL, NULL, '2018-09-01 23:16:29', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(126, 1, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 817, NULL, NULL, '2019-02-05 14:08:01', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(127, 1, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 836, NULL, NULL, '2019-05-06 03:00:32', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(128, 1, 'checkout', 20, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1308, NULL, NULL, '2019-03-05 04:47:51', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(129, 2, 'checkout', 54, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 920, NULL, NULL, '2019-02-03 23:27:46', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(130, 2, 'checkout', 8, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 144, NULL, NULL, '2018-12-20 22:33:58', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(131, 2, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 812, NULL, NULL, '2018-09-09 14:13:35', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(132, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 164, NULL, NULL, '2019-04-28 06:45:08', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(133, 2, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1190, NULL, NULL, '2018-10-23 22:24:49', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(134, 1, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1206, NULL, NULL, '2018-07-12 16:50:33', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(135, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 565, NULL, NULL, '2018-09-13 18:20:46', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(136, 2, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 646, NULL, NULL, '2018-08-08 04:57:08', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(137, 2, 'checkout', 43, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 120, NULL, NULL, '2019-05-06 16:32:24', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(138, 2, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 271, NULL, NULL, '2019-05-12 13:53:40', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(139, 1, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 414, NULL, NULL, '2018-07-14 20:57:21', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(140, 1, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 939, NULL, NULL, '2018-09-05 16:25:42', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(141, 1, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 815, NULL, NULL, '2018-09-13 18:54:00', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(142, 1, 'checkout', 52, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 343, NULL, NULL, '2018-09-11 18:58:18', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(143, 2, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 696, NULL, NULL, '2018-12-21 14:33:32', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(144, 1, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 810, NULL, NULL, '2019-02-27 18:09:22', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(145, 2, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 182, NULL, NULL, '2018-08-09 06:33:28', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(146, 1, 'checkout', 42, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 784, NULL, NULL, '2019-02-20 19:42:48', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(147, 1, 'checkout', 57, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1232, NULL, NULL, '2019-01-19 16:41:58', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(148, 1, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 288, NULL, NULL, '2018-08-04 21:19:13', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(149, 2, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 739, NULL, NULL, '2019-05-24 14:17:00', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(150, 1, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 422, NULL, NULL, '2018-12-13 16:11:19', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(151, 1, 'checkout', 55, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 408, NULL, NULL, '2019-02-24 10:41:10', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(152, 1, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 328, NULL, NULL, '2018-09-04 06:19:29', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(153, 2, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 250, NULL, NULL, '2018-08-01 16:06:47', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(154, 1, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 552, NULL, NULL, '2018-08-16 15:50:48', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(155, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 895, NULL, NULL, '2019-05-05 20:14:47', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(156, 1, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 297, NULL, NULL, '2019-02-11 12:36:16', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(157, 2, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 783, NULL, NULL, '2019-05-02 17:52:04', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(158, 1, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 569, NULL, NULL, '2019-04-01 03:51:21', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(159, 1, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 668, NULL, NULL, '2019-01-06 09:14:05', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(160, 1, 'checkout', 14, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1153, NULL, NULL, '2019-04-09 09:28:14', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(161, 1, 'checkout', 48, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 9, NULL, NULL, '2018-09-19 21:04:54', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(162, 1, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1321, NULL, NULL, '2019-04-09 02:01:36', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(163, 2, 'checkout', 41, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 249, NULL, NULL, '2019-05-24 03:50:19', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(164, 2, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1297, NULL, NULL, '2019-03-14 08:23:45', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(165, 2, 'checkout', 39, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 495, NULL, NULL, '2018-08-23 10:36:54', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(166, 2, 'checkout', 18, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 345, NULL, NULL, '2019-03-28 00:53:50', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(167, 1, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 432, NULL, NULL, '2018-11-06 08:26:05', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(168, 1, 'checkout', 7, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 824, NULL, NULL, '2018-09-03 23:17:34', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(169, 1, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1241, NULL, NULL, '2018-11-24 00:43:30', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(170, 2, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 884, NULL, NULL, '2018-07-04 14:13:25', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(171, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 477, NULL, NULL, '2018-11-23 05:57:33', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(172, 2, 'checkout', 46, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 488, NULL, NULL, '2019-04-18 06:24:17', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(173, 2, 'checkout', 12, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 864, NULL, NULL, '2018-12-08 14:52:39', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(174, 1, 'checkout', 27, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 304, NULL, NULL, '2018-07-22 12:12:36', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(175, 1, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1331, NULL, NULL, '2018-10-19 10:16:01', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(176, 2, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 721, NULL, NULL, '2019-01-20 04:17:41', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(177, 1, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 30, NULL, NULL, '2018-08-28 17:47:49', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(178, 1, 'checkout', 18, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 797, NULL, NULL, '2018-12-08 08:43:33', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(179, 2, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 103, NULL, NULL, '2019-05-02 18:24:03', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(180, 2, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 752, NULL, NULL, '2018-07-13 11:04:31', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(181, 1, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 194, NULL, NULL, '2019-01-04 04:21:59', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(182, 1, 'checkout', 41, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1122, NULL, NULL, '2018-12-11 23:55:04', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(183, 1, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1291, NULL, NULL, '2018-07-15 01:41:19', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(184, 1, 'checkout', 23, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1212, NULL, NULL, '2019-03-27 02:13:32', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(185, 1, 'checkout', 14, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 111, NULL, NULL, '2019-03-17 11:35:28', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(186, 2, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 181, NULL, NULL, '2018-09-24 07:33:08', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(187, 2, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 31, NULL, NULL, '2019-04-04 00:57:33', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(188, 1, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1284, NULL, NULL, '2019-02-18 08:09:02', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(189, 2, 'checkout', 46, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 322, NULL, NULL, '2018-07-08 14:35:23', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(190, 2, 'checkout', 48, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 159, NULL, NULL, '2019-03-06 06:30:29', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(191, 1, 'checkout', 51, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 921, NULL, NULL, '2019-05-31 11:42:59', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(192, 2, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 409, NULL, NULL, '2019-03-25 15:24:07', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(193, 1, 'checkout', 7, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 598, NULL, NULL, '2019-04-16 20:59:33', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(194, 1, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 385, NULL, NULL, '2018-08-20 12:48:39', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(195, 2, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 981, NULL, NULL, '2018-10-16 23:41:10', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(196, 1, 'checkout', 55, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 168, NULL, NULL, '2019-03-30 12:20:03', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(197, 2, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 233, NULL, NULL, '2018-07-24 11:54:49', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(198, 2, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 398, NULL, NULL, '2019-01-09 14:31:52', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(199, 1, 'checkout', 32, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 751, NULL, NULL, '2019-05-15 06:20:53', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(200, 1, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1318, NULL, NULL, '2018-06-20 06:40:26', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(201, 2, 'checkout', 54, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 215, NULL, NULL, '2019-01-22 02:19:47', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(202, 2, 'checkout', 39, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 816, NULL, NULL, '2019-04-07 22:34:31', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(203, 2, 'checkout', 35, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 367, NULL, NULL, '2019-02-16 15:25:45', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(204, 2, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1139, NULL, NULL, '2019-04-15 01:05:28', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(205, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 487, NULL, NULL, '2018-09-03 03:16:13', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(206, 2, 'checkout', 54, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1204, NULL, NULL, '2018-07-10 17:20:16', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(207, 1, 'checkout', 32, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 21, NULL, NULL, '2018-06-25 12:50:23', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(208, 2, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 449, NULL, NULL, '2018-09-05 20:24:04', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(209, 1, 'checkout', 49, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 76, NULL, NULL, '2018-06-20 22:40:39', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(210, 1, 'checkout', 23, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1158, NULL, NULL, '2018-12-20 01:39:59', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(211, 1, 'checkout', 52, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 854, NULL, NULL, '2018-08-24 01:28:24', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(212, 2, 'checkout', 23, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 326, NULL, NULL, '2019-02-10 20:15:41', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(213, 1, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 114, NULL, NULL, '2019-02-12 17:50:19', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(214, 2, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1285, NULL, NULL, '2019-01-20 22:06:12', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(215, 2, 'checkout', 7, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 96, NULL, NULL, '2018-11-07 16:07:39', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(216, 2, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1123, NULL, NULL, '2019-02-03 17:22:25', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(217, 1, 'checkout', 42, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 81, NULL, NULL, '2019-01-28 06:33:44', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(218, 1, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 95, NULL, NULL, '2019-04-14 02:22:41', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(219, 2, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 859, NULL, NULL, '2019-05-03 21:57:41', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(220, 2, 'checkout', 39, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 36, NULL, NULL, '2018-07-24 03:32:59', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(221, 1, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 333, NULL, NULL, '2018-07-31 05:32:27', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(222, 1, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1172, NULL, NULL, '2019-06-09 02:13:54', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(223, 2, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 757, NULL, NULL, '2018-11-15 12:36:47', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(224, 2, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 400, NULL, NULL, '2019-02-08 13:26:13', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(225, 1, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 254, NULL, NULL, '2019-02-03 20:08:00', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(226, 1, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1320, NULL, NULL, '2018-10-13 05:14:22', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(227, 2, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 925, NULL, NULL, '2018-10-08 17:54:58', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(228, 1, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1191, NULL, NULL, '2019-06-01 05:24:39', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(229, 1, 'checkout', 41, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 679, NULL, NULL, '2018-11-14 02:34:11', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(230, 1, 'checkout', 54, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 876, NULL, NULL, '2019-01-19 09:11:51', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(231, 1, 'checkout', 30, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 709, NULL, NULL, '2018-10-28 09:32:27', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(232, 2, 'checkout', 55, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 506, NULL, NULL, '2018-07-11 03:02:34', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(233, 1, 'checkout', 46, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 933, NULL, NULL, '2019-01-13 14:49:58', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(234, 1, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 779, NULL, NULL, '2018-11-26 05:22:00', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(235, 1, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1166, NULL, NULL, '2018-12-23 04:56:34', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(236, 1, 'checkout', 51, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 440, NULL, NULL, '2019-04-23 07:36:12', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(237, 2, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 863, NULL, NULL, '2019-03-09 22:13:52', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(238, 2, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 125, NULL, NULL, '2018-11-16 20:09:37', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(239, 2, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 969, NULL, NULL, '2019-01-09 09:55:10', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(240, 2, 'checkout', 42, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 559, NULL, NULL, '2018-12-30 12:47:22', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(241, 2, 'checkout', 35, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1293, NULL, NULL, '2018-08-31 23:58:26', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(242, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 315, NULL, NULL, '2018-10-22 16:06:30', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(243, 2, 'checkout', 39, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 627, NULL, NULL, '2018-08-19 17:36:36', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(244, 1, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 330, NULL, NULL, '2018-11-07 22:27:04', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(245, 2, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1143, NULL, NULL, '2019-04-26 12:09:21', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(246, 1, 'checkout', 7, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 342, NULL, NULL, '2018-10-02 05:51:26', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(247, 2, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 983, NULL, NULL, '2019-05-09 14:18:01', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(248, 1, 'checkout', 14, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 91, NULL, NULL, '2019-04-24 23:30:07', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(249, 2, 'checkout', 11, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 311, NULL, NULL, '2018-12-04 20:48:43', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(250, 2, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1340, NULL, NULL, '2018-11-29 21:43:12', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(251, 1, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 640, NULL, NULL, '2019-04-01 02:00:49', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(252, 1, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 901, NULL, NULL, '2018-08-07 23:45:11', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(253, 2, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1193, NULL, NULL, '2018-11-18 00:19:02', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(254, 2, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1170, NULL, NULL, '2019-04-28 03:44:06', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(255, 2, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 452, NULL, NULL, '2018-08-13 06:47:46', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(256, 1, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 189, NULL, NULL, '2019-01-27 15:26:08', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(257, 1, 'checkout', 49, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1196, NULL, NULL, '2018-06-16 07:57:42', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(258, 2, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 34, NULL, NULL, '2019-04-06 04:52:26', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(259, 2, 'checkout', 11, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1111, NULL, NULL, '2019-01-14 23:49:48', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(260, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1255, NULL, NULL, '2019-06-06 14:38:59', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(261, 2, 'checkout', 42, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 612, NULL, NULL, '2019-02-25 09:59:18', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(262, 2, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 638, NULL, NULL, '2018-10-21 08:17:06', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(263, 1, 'checkout', 54, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 353, NULL, NULL, '2018-11-18 15:24:21', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(264, 1, 'checkout', 11, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 916, NULL, NULL, '2019-01-29 20:17:31', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(265, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1205, NULL, NULL, '2018-10-02 09:15:42', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(266, 1, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 942, NULL, NULL, '2019-01-01 20:59:00', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(267, 1, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 689, NULL, NULL, '2019-03-05 04:37:52', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(268, 2, 'checkout', 29, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 395, NULL, NULL, '2018-11-30 10:36:43', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(269, 1, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 813, NULL, NULL, '2018-10-21 13:59:01', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(270, 1, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1201, NULL, NULL, '2018-06-19 13:41:32', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(271, 2, 'checkout', 30, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 653, NULL, NULL, '2018-08-05 16:36:16', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(272, 1, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1276, NULL, NULL, '2019-06-01 23:13:34', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(273, 2, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 198, NULL, NULL, '2019-02-26 01:42:09', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(274, 1, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 769, NULL, NULL, '2019-03-09 22:06:01', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(275, 1, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 424, NULL, NULL, '2018-09-07 19:48:01', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(276, 2, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 690, NULL, NULL, '2019-04-15 21:25:42', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(277, 2, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 839, NULL, NULL, '2019-04-22 16:35:52', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(278, 1, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 97, NULL, NULL, '2018-08-06 09:51:47', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(279, 2, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 63, NULL, NULL, '2018-09-30 22:16:02', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` (`id`, `user_id`, `action_type`, `target_id`, `target_type`, `location_id`, `note`, `filename`, `item_type`, `item_id`, `expected_checkin`, `accepted_id`, `created_at`, `updated_at`, `deleted_at`, `thread_id`, `company_id`, `accept_signature`, `log_meta`) VALUES
(280, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 712, NULL, NULL, '2019-05-28 18:22:18', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(281, 1, 'checkout', 41, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 788, NULL, NULL, '2018-07-20 05:30:16', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(282, 1, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 641, NULL, NULL, '2019-01-29 17:27:36', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(283, 2, 'checkout', 43, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 542, NULL, NULL, '2018-08-05 01:49:22', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(284, 1, 'checkout', 35, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 531, NULL, NULL, '2018-10-28 07:24:53', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(285, 1, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1283, NULL, NULL, '2018-10-09 07:33:36', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(286, 1, 'checkout', 17, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 811, NULL, NULL, '2019-02-12 23:15:02', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(287, 2, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 364, NULL, NULL, '2019-02-02 07:21:26', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(288, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 625, NULL, NULL, '2018-12-16 07:17:58', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(289, 2, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 802, NULL, NULL, '2018-09-07 01:50:17', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(290, 1, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 834, NULL, NULL, '2019-05-31 09:37:39', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(291, 2, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 207, NULL, NULL, '2018-12-08 04:17:04', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(292, 2, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 73, NULL, NULL, '2019-05-04 14:53:24', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(293, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 497, NULL, NULL, '2018-08-17 02:51:53', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(294, 2, 'checkout', 41, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1156, NULL, NULL, '2018-12-30 05:04:54', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(295, 2, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 325, NULL, NULL, '2019-05-04 02:41:24', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(296, 1, 'checkout', 30, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 239, NULL, NULL, '2018-08-18 02:57:21', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(297, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 577, NULL, NULL, '2018-11-01 14:43:16', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(298, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 147, NULL, NULL, '2018-12-08 03:36:16', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(299, 2, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 908, NULL, NULL, '2018-07-29 23:41:43', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(300, 1, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1306, NULL, NULL, '2019-03-29 19:36:37', '2019-06-11 01:53:05', NULL, NULL, NULL, NULL, NULL),
(301, 2, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 338, NULL, NULL, '2019-04-16 06:49:24', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(302, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 740, NULL, NULL, '2018-09-23 22:21:42', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(303, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 134, NULL, NULL, '2018-08-28 12:59:53', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(304, 1, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 711, NULL, NULL, '2018-12-17 07:49:53', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(305, 2, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 670, NULL, NULL, '2019-04-30 11:27:10', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(306, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 835, NULL, NULL, '2018-10-14 12:11:48', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(307, 2, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 997, NULL, NULL, '2018-08-27 11:13:20', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(308, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 80, NULL, NULL, '2018-07-31 00:37:51', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(309, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 535, NULL, NULL, '2018-12-03 06:32:27', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(310, 2, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 656, NULL, NULL, '2019-05-31 01:24:15', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(311, 2, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1352, NULL, NULL, '2019-04-10 10:01:47', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(312, 2, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 550, NULL, NULL, '2019-01-10 02:18:15', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(313, 2, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 221, NULL, NULL, '2019-05-28 14:24:49', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(314, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 938, NULL, NULL, '2018-08-31 15:59:37', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(315, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1249, NULL, NULL, '2018-08-19 21:02:09', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(316, 1, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 621, NULL, NULL, '2019-01-06 20:20:10', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(317, 2, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1332, NULL, NULL, '2018-08-12 00:02:44', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(318, 2, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1325, NULL, NULL, '2019-01-07 02:41:01', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(319, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 858, NULL, NULL, '2018-07-27 04:37:53', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(320, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 755, NULL, NULL, '2019-04-01 17:38:37', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(321, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1256, NULL, NULL, '2019-03-18 01:58:25', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(322, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 263, NULL, NULL, '2018-06-29 06:09:13', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(323, 1, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 456, NULL, NULL, '2018-07-20 09:32:40', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(324, 2, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 191, NULL, NULL, '2019-03-22 10:32:28', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(325, 2, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 794, NULL, NULL, '2018-10-14 00:03:05', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(326, 1, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 284, NULL, NULL, '2018-06-15 01:55:14', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(327, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 279, NULL, NULL, '2019-05-18 12:24:08', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(328, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 106, NULL, NULL, '2019-01-06 23:48:39', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(329, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1366, NULL, NULL, '2018-12-12 12:44:34', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(330, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 6, NULL, NULL, '2019-04-24 08:25:20', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(331, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 833, NULL, NULL, '2019-05-31 05:26:08', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(332, 1, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1180, NULL, NULL, '2019-01-24 04:49:31', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(333, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1280, NULL, NULL, '2018-06-14 01:20:57', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(334, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 309, NULL, NULL, '2019-04-28 13:12:05', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(335, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 533, NULL, NULL, '2019-05-02 09:18:18', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(336, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 853, NULL, NULL, '2018-09-30 08:47:57', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(337, 1, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 82, NULL, NULL, '2018-12-11 14:55:37', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(338, 1, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 347, NULL, NULL, '2019-01-01 08:12:46', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(339, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 381, NULL, NULL, '2018-10-30 06:20:33', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(340, 2, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 904, NULL, NULL, '2018-11-30 17:47:30', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(341, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 64, NULL, NULL, '2019-03-15 10:09:55', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(342, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1126, NULL, NULL, '2018-11-29 12:58:08', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(343, 1, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 241, NULL, NULL, '2019-03-18 09:38:51', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(344, 2, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 22, NULL, NULL, '2018-11-16 08:29:15', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(345, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 873, NULL, NULL, '2019-05-04 10:52:44', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(346, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 596, NULL, NULL, '2018-06-26 13:54:58', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(347, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1370, NULL, NULL, '2018-10-09 11:02:21', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(348, 2, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1217, NULL, NULL, '2018-09-01 14:52:51', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(349, 2, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 115, NULL, NULL, '2018-11-13 07:20:17', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(350, 1, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 771, NULL, NULL, '2018-12-23 12:39:23', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(351, 1, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 173, NULL, NULL, '2018-12-02 03:41:58', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(352, 2, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1243, NULL, NULL, '2019-05-16 06:17:57', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(353, 1, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 829, NULL, NULL, '2019-04-09 13:45:02', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(354, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2018-10-16 10:04:22', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(355, 1, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 714, NULL, NULL, '2018-07-04 22:11:47', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(356, 1, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1273, NULL, NULL, '2018-07-07 02:17:14', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(357, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 517, NULL, NULL, '2019-04-23 04:20:20', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(358, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 980, NULL, NULL, '2019-06-07 10:13:38', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(359, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 919, NULL, NULL, '2018-06-27 01:33:54', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(360, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 230, NULL, NULL, '2018-12-23 21:39:14', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(361, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 447, NULL, NULL, '2018-09-29 17:22:59', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(362, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 145, NULL, NULL, '2019-03-27 22:40:03', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(363, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1178, NULL, NULL, '2019-05-24 18:09:57', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(364, 1, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 425, NULL, NULL, '2018-06-24 11:32:21', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(365, 1, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 631, NULL, NULL, '2019-03-29 15:29:23', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(366, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1281, NULL, NULL, '2018-11-26 18:48:02', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(367, 1, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 317, NULL, NULL, '2019-05-20 17:48:36', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(368, 1, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1103, NULL, NULL, '2019-04-11 11:38:45', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(369, 1, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 252, NULL, NULL, '2019-02-17 16:28:33', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(370, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 581, NULL, NULL, '2018-12-30 14:16:52', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(371, 1, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 475, NULL, NULL, '2019-02-28 17:41:45', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(372, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 791, NULL, NULL, '2018-09-19 00:05:44', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(373, 2, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 135, NULL, NULL, '2019-03-03 21:39:37', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(374, 1, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 541, NULL, NULL, '2019-03-19 08:18:59', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(375, 1, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 630, NULL, NULL, '2018-08-02 18:32:15', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(376, 1, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 59, NULL, NULL, '2018-10-08 00:59:48', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(377, 2, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 545, NULL, NULL, '2019-02-06 10:05:10', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(378, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 750, NULL, NULL, '2018-12-27 18:40:58', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(379, 1, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 404, NULL, NULL, '2018-07-08 01:51:05', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(380, 2, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 623, NULL, NULL, '2018-09-11 09:52:39', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(381, 1, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 378, NULL, NULL, '2018-08-25 12:25:55', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(382, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 922, NULL, NULL, '2018-08-11 07:04:39', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(383, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1271, NULL, NULL, '2018-07-19 02:25:04', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(384, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 479, NULL, NULL, '2018-07-12 17:42:34', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(385, 2, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1336, NULL, NULL, '2018-08-22 13:38:02', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(386, 2, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 151, NULL, NULL, '2018-09-12 04:20:52', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(387, 1, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 126, NULL, NULL, '2019-04-07 11:05:46', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(388, 1, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1333, NULL, NULL, '2019-05-03 01:19:44', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(389, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 413, NULL, NULL, '2018-12-24 17:18:52', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(390, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1356, NULL, NULL, '2018-07-08 02:25:33', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(391, 2, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1104, NULL, NULL, '2019-03-18 18:44:07', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(392, 2, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 344, NULL, NULL, '2019-02-05 13:25:27', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(393, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 851, NULL, NULL, '2018-10-05 23:44:13', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(394, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 356, NULL, NULL, '2018-12-14 16:37:43', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(395, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 464, NULL, NULL, '2019-03-24 10:29:12', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(396, 2, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 436, NULL, NULL, '2018-09-06 18:41:59', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(397, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 351, NULL, NULL, '2019-04-03 20:08:00', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(398, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 708, NULL, NULL, '2018-12-18 11:55:46', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(399, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 270, NULL, NULL, '2018-11-03 07:28:46', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(400, 1, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 789, NULL, NULL, '2018-11-27 08:50:51', '2019-06-11 01:53:06', NULL, NULL, NULL, NULL, NULL),
(401, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2019-06-12 01:56:57', '2019-06-12 01:56:57', NULL, NULL, NULL, NULL, '{\"purchase_cost\":{\"old\":\"897.55\",\"new\":96.69},\"supplier_id\":{\"old\":1,\"new\":\"4\"}}'),
(402, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2019-06-12 01:58:12', '2019-06-12 01:58:12', NULL, NULL, NULL, NULL, '{\"purchase_cost\":{\"old\":\"1435.15\",\"new\":153.153},\"notes\":{\"old\":\"Created by DB seeder\",\"new\":\"ahihi do ngoc\"},\"warranty_months\":{\"old\":null,\"new\":\"36\"}}'),
(403, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 1, NULL, NULL, '2019-06-26 23:41:25', '2019-06-26 23:41:25', NULL, NULL, 3, NULL, NULL),
(404, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 2, NULL, NULL, '2019-06-27 00:07:39', '2019-06-27 00:07:39', NULL, NULL, 5, NULL, NULL),
(405, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 3, NULL, NULL, '2019-06-27 00:42:21', '2019-06-27 00:42:21', NULL, NULL, 5, NULL, NULL),
(406, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 3, NULL, NULL, '2019-06-27 00:43:20', '2019-06-27 00:43:20', NULL, NULL, 3, NULL, '{\"company_id\":{\"old\":5,\"new\":\"3\"},\"name\":{\"old\":\"Store 2\",\"new\":\"Store 2 updated\"},\"location_id\":{\"old\":11,\"new\":\"5\"},\"updated_at\":{\"old\":\"2019-06-27 00:42:21\",\"new\":\"2019-06-27 00:43:20\"}}'),
(407, 59, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 3, NULL, NULL, '2019-06-27 01:00:29', '2019-06-27 01:00:29', NULL, NULL, 3, NULL, NULL),
(408, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2019-07-02 23:59:32', '2019-07-02 23:59:32', NULL, NULL, NULL, NULL, '{\"rtd_location_id\":{\"old\":1,\"new\":\"11\"},\"location_id\":{\"old\":1,\"new\":\"11\"}}'),
(409, 59, 'checkout', 59, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2019-07-03 19:14:13', '2019-07-03 19:14:13', NULL, NULL, NULL, NULL, NULL),
(410, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 4, NULL, NULL, '2019-07-03 19:26:12', '2019-07-03 19:26:12', NULL, NULL, 5, NULL, NULL),
(411, 59, 'checkout', 59, 'App\\Models\\User', 11, '', NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2019-07-04 01:06:02', '2019-07-04 01:06:02', NULL, NULL, NULL, NULL, NULL),
(412, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 5, NULL, NULL, '2019-07-05 00:38:24', '2019-07-05 00:38:24', NULL, NULL, 4, NULL, NULL),
(413, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Consumable', 4, NULL, NULL, '2019-07-05 01:29:08', '2019-07-05 01:29:08', NULL, NULL, 3, NULL, NULL),
(414, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 1, NULL, NULL, '2019-07-05 01:52:19', '2019-07-05 01:52:19', NULL, NULL, 4, NULL, NULL),
(415, 59, 'checkout', 1, 'App\\Models\\Asset', NULL, '', NULL, 'App\\Models\\Asset', 3, NULL, NULL, '2019-07-05 01:58:34', '2019-07-05 01:58:34', NULL, NULL, NULL, NULL, NULL),
(416, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 2, NULL, NULL, '2019-07-05 02:19:43', '2019-07-05 02:19:43', NULL, NULL, 5, NULL, NULL),
(417, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 3, NULL, NULL, '2019-07-05 02:36:19', '2019-07-05 02:36:19', NULL, NULL, 2, NULL, NULL),
(418, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 4, NULL, NULL, '2019-07-05 02:37:54', '2019-07-05 02:37:54', NULL, NULL, 5, NULL, NULL),
(419, 59, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 4, NULL, NULL, '2019-07-08 00:20:41', '2019-07-08 00:20:41', NULL, NULL, 5, NULL, NULL),
(420, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 2, NULL, NULL, '2019-07-08 01:55:59', '2019-07-08 01:55:59', NULL, NULL, 5, NULL, '{\"name\":{\"old\":\"1111\",\"new\":\"Vinx\"},\"updated_at\":{\"old\":\"2019-07-05 02:19:43\",\"new\":\"2019-07-08 01:55:59\"}}'),
(421, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 5, NULL, NULL, '2019-07-08 02:02:02', '2019-07-08 02:02:02', NULL, NULL, 5, NULL, NULL),
(422, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 6, NULL, NULL, '2019-07-08 02:02:55', '2019-07-08 02:02:55', NULL, NULL, 4, NULL, NULL),
(423, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 7, NULL, NULL, '2019-07-08 02:03:08', '2019-07-08 02:03:08', NULL, NULL, 5, NULL, NULL),
(424, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 8, NULL, NULL, '2019-07-08 20:39:04', '2019-07-08 20:39:04', NULL, NULL, 5, NULL, NULL),
(425, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 8, NULL, NULL, '2019-07-08 20:48:28', '2019-07-08 20:48:28', NULL, NULL, 5, NULL, '{\"location_id\":{\"old\":null,\"new\":\"1\"},\"updated_at\":{\"old\":\"2019-07-08 20:39:04\",\"new\":\"2019-07-08 20:48:28\"}}'),
(426, 59, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 8, NULL, NULL, '2019-07-08 20:48:52', '2019-07-08 20:48:52', NULL, NULL, 5, NULL, NULL),
(427, 59, 'checkout', 11, 'App\\Models\\Location', 11, '', NULL, 'App\\Models\\Asset', 5, NULL, NULL, '2019-07-10 20:48:03', '2019-07-10 20:48:03', NULL, NULL, NULL, NULL, NULL),
(428, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 35, NULL, NULL, '2019-07-16 01:53:48', '2019-07-16 01:53:48', NULL, NULL, NULL, NULL, NULL),
(429, 59, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 26, NULL, NULL, '2019-07-16 01:56:07', '2019-07-16 01:56:07', NULL, NULL, NULL, NULL, NULL),
(430, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 9, NULL, NULL, '2019-07-16 02:18:40', '2019-07-16 02:18:40', NULL, NULL, 5, NULL, NULL),
(431, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 1, NULL, NULL, '2019-07-16 02:19:55', '2019-07-16 02:19:55', NULL, NULL, 4, NULL, '{\"image\":{\"old\":null,\"new\":\"zKPfjsMWn18ugezQKU1R0EcNk.jpg\"},\"updated_at\":{\"old\":\"2019-07-05 01:52:19\",\"new\":\"2019-07-16 02:19:55\"}}'),
(432, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 36, NULL, NULL, '2019-07-16 02:59:03', '2019-07-16 02:59:03', NULL, NULL, NULL, NULL, NULL),
(433, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 36, NULL, NULL, '2019-07-16 02:59:41', '2019-07-16 02:59:41', NULL, NULL, NULL, NULL, '{\"location_id\":{\"old\":null,\"new\":\"1\"},\"contact_id_1\":{\"old\":null,\"new\":\"61\"},\"contact_id_2\":{\"old\":null,\"new\":\"62\"},\"updated_at\":{\"old\":\"2019-07-16 02:59:03\",\"new\":\"2019-07-16 02:59:41\"}}'),
(434, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2019-07-16 03:03:46', '2019-07-16 03:03:46', NULL, NULL, NULL, NULL, '{\"image\":{\"old\":null,\"new\":\"3aAgIgwEuR0xidcjfSieeiz1p.jpeg\"}}'),
(435, 59, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 36, NULL, NULL, '2019-07-16 03:57:58', '2019-07-16 03:57:58', NULL, NULL, NULL, NULL, NULL),
(436, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 28, NULL, NULL, '2019-07-16 18:51:04', '2019-07-16 18:51:04', NULL, NULL, NULL, NULL, '{\"billing_date\":{\"old\":null,\"new\":\"2019-07-30\"},\"updated_at\":{\"old\":\"2019-07-08 02:39:47\",\"new\":\"2019-07-16 18:51:04\"},\"user_id\":{\"old\":0,\"new\":59}}'),
(437, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 34, NULL, NULL, '2019-07-16 18:51:33', '2019-07-16 18:51:33', NULL, NULL, NULL, NULL, '{\"billing_date\":{\"old\":null,\"new\":\"2019-07-29\"},\"updated_at\":{\"old\":\"2019-07-08 21:41:02\",\"new\":\"2019-07-16 18:51:33\"},\"user_id\":{\"old\":0,\"new\":59}}'),
(438, 59, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 27, NULL, NULL, '2019-07-16 18:51:45', '2019-07-16 18:51:45', NULL, NULL, NULL, NULL, NULL),
(439, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 16, NULL, NULL, '2019-07-16 19:04:19', '2019-07-16 19:04:19', NULL, NULL, NULL, NULL, NULL),
(440, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 17, NULL, NULL, '2019-07-16 19:08:31', '2019-07-16 19:08:31', NULL, NULL, NULL, NULL, NULL),
(441, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1374, NULL, NULL, '2019-07-16 19:16:01', '2019-07-16 19:16:01', NULL, NULL, 2, NULL, NULL),
(442, 59, 'checkout', 15, 'App\\Models\\User', 1, 'Checked out on asset creation', NULL, 'App\\Models\\Asset', 1374, NULL, NULL, '2019-07-16 19:16:01', '2019-07-16 19:16:01', NULL, NULL, 1, NULL, NULL),
(443, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 17, NULL, NULL, '2019-07-16 19:16:09', '2019-07-16 19:16:09', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-31\",\"new\":\"2019-07-31 00:00:00\"},\"name\":{\"old\":null,\"new\":\"Ki\\u1ec3m k\\u00ea \\u0111\\u1ee3t 1\"},\"updated_at\":{\"old\":\"2019-07-16 19:08:31\",\"new\":\"2019-07-16 19:16:09\"}}'),
(444, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 32, NULL, NULL, '2019-07-16 19:17:11', '2019-07-16 19:17:11', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-07-08 21:10:22\",\"new\":\"2019-07-16 19:17:11\"},\"user_id\":{\"old\":0,\"new\":59}}'),
(449, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 37, NULL, NULL, '2019-07-16 19:19:09', '2019-07-16 19:19:09', NULL, NULL, NULL, NULL, NULL),
(450, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 37, NULL, NULL, '2019-07-16 19:19:40', '2019-07-16 19:19:40', NULL, NULL, NULL, NULL, '{\"name\":{\"old\":\"Contract SASS\",\"new\":\"Contract SASSA\"},\"updated_at\":{\"old\":\"2019-07-16 19:19:09\",\"new\":\"2019-07-16 19:19:40\"}}'),
(451, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 10, NULL, NULL, '2019-07-16 19:27:30', '2019-07-16 19:27:30', NULL, NULL, 5, NULL, NULL),
(452, 63, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 5, NULL, NULL, '2019-07-16 20:08:13', '2019-07-16 20:08:13', NULL, NULL, 5, NULL, NULL),
(453, 63, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 9, NULL, NULL, '2019-07-16 20:08:56', '2019-07-16 20:08:56', NULL, NULL, 5, NULL, '{\"name\":{\"old\":\"ahih \\u0111\\u1ed3 ng\\u1ed1c\",\"new\":\"Store fruit\"},\"image\":{\"old\":\"Vkkj7HUpdGLmX8HeO2qjC0b83.jpg\",\"new\":\"Zcph9ocnkdN7mbBDgpQNcBhQy.jpeg\"},\"updated_at\":{\"old\":\"2019-07-16 02:18:40\",\"new\":\"2019-07-16 20:08:56\"}}'),
(454, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 11, NULL, NULL, '2019-07-16 20:09:58', '2019-07-16 20:09:58', NULL, NULL, 5, NULL, NULL),
(456, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 18, NULL, NULL, '2019-07-16 20:20:30', '2019-07-16 20:20:30', NULL, NULL, NULL, NULL, NULL),
(457, 63, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 17, NULL, NULL, '2019-07-16 20:21:17', '2019-07-16 20:21:17', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-31\",\"new\":\"2019-07-31 00:00:00\"},\"notes\":{\"old\":null,\"new\":\"123\"},\"updated_at\":{\"old\":\"2019-07-16 19:16:09\",\"new\":\"2019-07-16 20:21:17\"}}'),
(458, 65, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 38, NULL, NULL, '2019-07-16 20:37:53', '2019-07-16 20:37:53', NULL, NULL, NULL, NULL, NULL),
(459, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 12, NULL, NULL, '2019-07-16 20:46:20', '2019-07-16 20:46:20', NULL, NULL, 5, NULL, NULL),
(460, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 12, NULL, NULL, '2019-07-16 20:46:47', '2019-07-16 20:46:47', NULL, NULL, 5, NULL, '{\"image\":{\"old\":\"KnrxUK64yVxLw3Z8z70q8QiOO.jpg\",\"new\":null},\"updated_at\":{\"old\":\"2019-07-16 20:46:20\",\"new\":\"2019-07-16 20:46:47\"}}'),
(461, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 12, NULL, NULL, '2019-07-16 21:07:23', '2019-07-16 21:07:23', NULL, NULL, 5, NULL, '{\"location_id\":{\"old\":7,\"new\":null},\"updated_at\":{\"old\":\"2019-07-16 20:46:47\",\"new\":\"2019-07-16 21:07:23\"}}'),
(462, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 11, NULL, NULL, '2019-07-16 21:07:38', '2019-07-16 21:07:38', NULL, NULL, 5, NULL, '{\"location_id\":{\"old\":1,\"new\":null},\"updated_at\":{\"old\":\"2019-07-16 20:09:58\",\"new\":\"2019-07-16 21:07:38\"}}'),
(463, 65, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 39, NULL, NULL, '2019-07-16 21:12:00', '2019-07-16 21:12:00', NULL, NULL, NULL, NULL, NULL),
(464, 65, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 35, NULL, NULL, '2019-07-16 21:12:54', '2019-07-16 21:12:54', NULL, NULL, NULL, NULL, NULL),
(465, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 36, NULL, NULL, '2019-07-16 21:13:00', '2019-07-16 21:13:00', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-16 19:17:26\",\"new\":\"2019-07-16 21:13:00\"},\"user_id\":{\"old\":59,\"new\":65},\"updated_at\":{\"old\":\"2019-07-16 19:17:26\",\"new\":\"2019-07-16 21:13:00\"},\"status_id\":{\"old\":1,\"new\":\"4\"}}'),
(466, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 40, NULL, NULL, '2019-07-16 21:16:05', '2019-07-16 21:16:05', NULL, NULL, NULL, NULL, NULL),
(467, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 41, NULL, NULL, '2019-07-16 21:16:31', '2019-07-16 21:16:31', NULL, NULL, NULL, NULL, NULL),
(468, 63, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 41, NULL, NULL, '2019-07-16 21:16:44', '2019-07-16 21:16:44', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-16 21:16:31\",\"new\":\"2019-07-16 21:16:44\"},\"updated_at\":{\"old\":\"2019-07-16 21:16:31\",\"new\":\"2019-07-16 21:16:44\"},\"status_id\":{\"old\":1,\"new\":\"5\"}}'),
(469, 63, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 41, NULL, NULL, '2019-07-16 21:17:10', '2019-07-16 21:17:10', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-16 21:16:44\",\"new\":\"2019-07-16 21:17:10\"},\"updated_at\":{\"old\":\"2019-07-16 21:16:44\",\"new\":\"2019-07-16 21:17:10\"},\"status_id\":{\"old\":5,\"new\":\"2\"}}'),
(470, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 13, NULL, NULL, '2019-07-16 21:50:28', '2019-07-16 21:50:28', NULL, NULL, 5, NULL, NULL),
(471, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 13, NULL, NULL, '2019-07-16 21:52:30', '2019-07-16 21:52:30', NULL, NULL, 5, NULL, '{\"name\":{\"old\":\"store_Test\",\"new\":\"store_test_edit\"},\"image\":{\"old\":null,\"new\":\"F0q11SkMAgvSRDt43LMgS2lKK.jpg\"},\"updated_at\":{\"old\":\"2019-07-16 21:50:28\",\"new\":\"2019-07-16 21:52:30\"}}'),
(472, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 13, NULL, NULL, '2019-07-16 21:52:53', '2019-07-16 21:52:53', NULL, NULL, 5, NULL, '{\"location_id\":{\"old\":null,\"new\":\"8\"},\"image\":{\"old\":\"F0q11SkMAgvSRDt43LMgS2lKK.jpg\",\"new\":\"TuC0oMXIOGiAD3LNnuzHKEobx.jpg\"},\"updated_at\":{\"old\":\"2019-07-16 21:52:30\",\"new\":\"2019-07-16 21:52:53\"}}'),
(473, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 13, NULL, NULL, '2019-07-16 21:54:00', '2019-07-16 21:54:00', NULL, NULL, 5, NULL, NULL),
(474, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 12, NULL, NULL, '2019-07-16 21:54:52', '2019-07-16 21:54:52', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"Xv0e2B1TPrxRhPLEKUfyasgjw.jpg\"},\"updated_at\":{\"old\":\"2019-07-16 21:07:23\",\"new\":\"2019-07-16 21:54:52\"}}'),
(475, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 19, NULL, NULL, '2019-07-16 21:57:08', '2019-07-16 21:57:08', NULL, NULL, NULL, NULL, NULL),
(476, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 39, NULL, NULL, '2019-07-16 23:24:25', '2019-07-16 23:24:25', NULL, NULL, NULL, NULL, NULL),
(477, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 39, NULL, NULL, '2019-07-16 23:25:03', '2019-07-16 23:25:03', NULL, NULL, NULL, NULL, '{\"location_id\":{\"old\":null,\"new\":\"7\"},\"updated_at\":{\"old\":\"2019-07-16 23:24:25\",\"new\":\"2019-07-16 23:25:03\"}}'),
(478, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 39, NULL, NULL, '2019-07-16 23:25:21', '2019-07-16 23:25:21', NULL, NULL, NULL, NULL, '{\"contact_id_1\":{\"old\":null,\"new\":\"62\"},\"contact_id_2\":{\"old\":null,\"new\":\"65\"},\"updated_at\":{\"old\":\"2019-07-16 23:25:03\",\"new\":\"2019-07-16 23:25:21\"}}'),
(479, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 39, NULL, NULL, '2019-07-16 23:26:10', '2019-07-16 23:26:10', NULL, NULL, NULL, NULL, '{\"start_date\":{\"old\":\"2019-07-10\",\"new\":\"2019-07-11\"},\"billing_date\":{\"old\":\"2019-07-18\",\"new\":\"2019-07-09\"},\"payment_date\":{\"old\":null,\"new\":\"2019-07-18\"},\"updated_at\":{\"old\":\"2019-07-16 23:25:21\",\"new\":\"2019-07-16 23:26:10\"}}'),
(480, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 39, NULL, NULL, '2019-07-16 23:29:53', '2019-07-16 23:29:53', NULL, NULL, NULL, NULL, '{\"terms_and_conditions\":{\"old\":null,\"new\":\"Terms and Conditions\"},\"notes\":{\"old\":null,\"new\":\"\\r\\nNotes\\r\\n\"},\"updated_at\":{\"old\":\"2019-07-16 23:26:10\",\"new\":\"2019-07-16 23:29:53\"}}'),
(481, 63, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 19, NULL, NULL, '2019-07-16 23:32:53', '2019-07-16 23:32:53', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-31\",\"new\":\"2019-07-31 00:00:00\"},\"name\":{\"old\":null,\"new\":\"Ki\\u1ec3m K\\u00ea \\u0111\\u1ee3t 3\"},\"updated_at\":{\"old\":\"2019-07-16 21:57:08\",\"new\":\"2019-07-16 23:32:53\"}}'),
(482, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 40, NULL, NULL, '2019-07-16 23:35:42', '2019-07-16 23:35:42', NULL, NULL, NULL, NULL, NULL),
(483, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 40, NULL, NULL, '2019-07-16 23:35:51', '2019-07-16 23:35:51', NULL, NULL, NULL, NULL, NULL),
(484, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 20, NULL, NULL, '2019-07-16 23:52:12', '2019-07-16 23:52:12', NULL, NULL, NULL, NULL, NULL),
(485, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 20, NULL, NULL, '2019-07-16 23:53:01', '2019-07-16 23:53:01', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-17\",\"new\":\"2019-07-17 00:00:00\"},\"name\":{\"old\":null,\"new\":\"Ki\\u1ec3m k\\u00ea Kitty\"},\"notes\":{\"old\":null,\"new\":\"S\\u1ed1 l\\u01b0\\u1ee3ng \"},\"updated_at\":{\"old\":\"2019-07-16 23:52:12\",\"new\":\"2019-07-16 23:53:01\"}}'),
(486, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 20, NULL, NULL, '2019-07-16 23:53:18', '2019-07-16 23:53:18', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-17\",\"new\":\"2019-07-17 00:00:00\"},\"name\":{\"old\":\"Ki\\u1ec3m k\\u00ea Kitty\",\"new\":\"Ki\\u1ec3m k\\u00ea\"},\"updated_at\":{\"old\":\"2019-07-16 23:53:01\",\"new\":\"2019-07-16 23:53:18\"}}'),
(487, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 42, NULL, NULL, '2019-07-16 23:54:53', '2019-07-16 23:54:53', NULL, NULL, NULL, NULL, NULL),
(488, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 43, NULL, NULL, '2019-07-16 23:55:04', '2019-07-16 23:55:04', NULL, NULL, NULL, NULL, NULL),
(489, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 44, NULL, NULL, '2019-07-16 23:57:00', '2019-07-16 23:57:00', NULL, NULL, NULL, NULL, NULL),
(490, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 45, NULL, NULL, '2019-07-16 23:57:10', '2019-07-16 23:57:10', NULL, NULL, NULL, NULL, NULL),
(491, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 46, NULL, NULL, '2019-07-16 23:57:16', '2019-07-16 23:57:16', NULL, NULL, NULL, NULL, NULL),
(492, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 47, NULL, NULL, '2019-07-16 23:57:33', '2019-07-16 23:57:33', NULL, NULL, NULL, NULL, NULL),
(493, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 47, NULL, NULL, '2019-07-16 23:57:43', '2019-07-16 23:57:43', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-16 23:57:33\",\"new\":\"2019-07-16 23:57:43\"},\"updated_at\":{\"old\":\"2019-07-16 23:57:33\",\"new\":\"2019-07-16 23:57:43\"},\"status_id\":{\"old\":1,\"new\":\"6\"}}'),
(494, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 44, NULL, NULL, '2019-07-16 23:58:40', '2019-07-16 23:58:40', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-16 23:57:00\",\"new\":\"2019-07-16 23:58:40\"},\"updated_at\":{\"old\":\"2019-07-16 23:57:00\",\"new\":\"2019-07-16 23:58:40\"},\"status_id\":{\"old\":1,\"new\":\"4\"}}'),
(495, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 46, NULL, NULL, '2019-07-16 23:59:50', '2019-07-16 23:59:50', NULL, NULL, NULL, NULL, NULL),
(496, 63, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 42, NULL, NULL, '2019-07-17 00:00:00', '2019-07-17 00:00:00', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-16 23:54:53\",\"new\":\"2019-07-17 00:00:00\"},\"updated_at\":{\"old\":\"2019-07-16 23:54:53\",\"new\":\"2019-07-17 00:00:00\"}}'),
(497, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 44, NULL, NULL, '2019-07-17 00:00:00', '2019-07-17 00:00:00', NULL, NULL, NULL, NULL, NULL),
(498, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 48, NULL, NULL, '2019-07-17 00:00:11', '2019-07-17 00:00:11', NULL, NULL, NULL, NULL, NULL),
(499, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 47, NULL, NULL, '2019-07-17 00:01:55', '2019-07-17 00:01:55', NULL, NULL, NULL, NULL, NULL),
(500, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 49, NULL, NULL, '2019-07-17 00:01:56', '2019-07-17 00:01:56', NULL, NULL, NULL, NULL, NULL),
(501, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 50, NULL, NULL, '2019-07-17 00:02:17', '2019-07-17 00:02:17', NULL, NULL, NULL, NULL, NULL),
(502, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 50, NULL, NULL, '2019-07-17 00:02:30', '2019-07-17 00:02:30', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-17 00:02:17\",\"new\":\"2019-07-17 00:02:30\"},\"updated_at\":{\"old\":\"2019-07-17 00:02:17\",\"new\":\"2019-07-17 00:02:30\"},\"status_id\":{\"old\":1,\"new\":\"7\"}}'),
(503, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 41, NULL, NULL, '2019-07-17 00:04:39', '2019-07-17 00:04:39', NULL, NULL, NULL, NULL, NULL),
(504, 63, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 41, NULL, NULL, '2019-07-17 00:04:42', '2019-07-17 00:04:42', NULL, NULL, NULL, NULL, NULL),
(505, 63, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 39, NULL, NULL, '2019-07-17 00:05:01', '2019-07-17 00:05:01', NULL, NULL, NULL, NULL, NULL),
(506, 63, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 40, NULL, NULL, '2019-07-17 00:05:29', '2019-07-17 00:05:29', NULL, NULL, NULL, NULL, NULL),
(507, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 41, NULL, NULL, '2019-07-17 00:05:47', '2019-07-17 00:05:47', NULL, NULL, NULL, NULL, '{\"name\":{\"old\":\"HD Kitty\",\"new\":\"HD Su kem\"},\"updated_at\":{\"old\":\"2019-07-17 00:04:39\",\"new\":\"2019-07-17 00:05:47\"}}'),
(508, 63, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 50, NULL, NULL, '2019-07-17 00:15:03', '2019-07-17 00:15:03', NULL, NULL, NULL, NULL, NULL),
(509, 63, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 48, NULL, NULL, '2019-07-17 00:15:18', '2019-07-17 00:15:18', NULL, NULL, NULL, NULL, NULL),
(510, 63, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 45, NULL, NULL, '2019-07-17 00:15:31', '2019-07-17 00:15:31', NULL, NULL, NULL, NULL, NULL),
(511, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 41, NULL, NULL, '2019-07-17 00:16:03', '2019-07-17 00:16:03', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-07-17 00:05:47\",\"new\":\"2019-07-17 00:16:03\"},\"user_id\":{\"old\":64,\"new\":65}}'),
(512, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 39, NULL, NULL, '2019-07-17 00:16:24', '2019-07-17 00:16:24', NULL, NULL, NULL, NULL, '{\"notes\":{\"old\":\"\\r\\nNotes\\r\\n\",\"new\":\"Notes\\r\\n\"},\"updated_at\":{\"old\":\"2019-07-16 23:29:53\",\"new\":\"2019-07-17 00:16:24\"},\"user_id\":{\"old\":64,\"new\":65}}'),
(513, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 41, NULL, NULL, '2019-07-17 00:25:12', '2019-07-17 00:25:12', NULL, NULL, NULL, NULL, NULL),
(514, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 51, NULL, NULL, '2019-07-17 00:47:00', '2019-07-17 00:47:00', NULL, NULL, NULL, NULL, NULL),
(515, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 21, NULL, NULL, '2019-07-17 01:38:09', '2019-07-17 01:38:09', NULL, NULL, NULL, NULL, NULL),
(516, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 52, NULL, NULL, '2019-07-17 01:38:33', '2019-07-17 01:38:33', NULL, NULL, NULL, NULL, NULL),
(517, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 53, NULL, NULL, '2019-07-17 01:38:39', '2019-07-17 01:38:39', NULL, NULL, NULL, NULL, NULL),
(518, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 52, NULL, NULL, '2019-07-17 01:38:47', '2019-07-17 01:38:47', NULL, NULL, NULL, NULL, NULL),
(519, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 54, NULL, NULL, '2019-07-17 01:39:06', '2019-07-17 01:39:06', NULL, NULL, NULL, NULL, NULL),
(520, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 55, NULL, NULL, '2019-07-17 01:39:16', '2019-07-17 01:39:16', NULL, NULL, NULL, NULL, NULL),
(521, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 54, NULL, NULL, '2019-07-17 01:39:27', '2019-07-17 01:39:27', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-17 01:39:06\",\"new\":\"2019-07-17 01:39:27\"},\"updated_at\":{\"old\":\"2019-07-17 01:39:06\",\"new\":\"2019-07-17 01:39:27\"},\"status_id\":{\"old\":4,\"new\":\"3\"}}'),
(522, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 54, NULL, NULL, '2019-07-17 01:39:41', '2019-07-17 01:39:41', NULL, NULL, NULL, NULL, NULL),
(523, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 56, NULL, NULL, '2019-07-17 01:39:53', '2019-07-17 01:39:53', NULL, NULL, NULL, NULL, NULL),
(524, 65, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 42, NULL, NULL, '2019-07-17 02:33:44', '2019-07-17 02:33:44', NULL, NULL, NULL, NULL, NULL),
(525, 65, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 43, NULL, NULL, '2019-07-17 02:34:19', '2019-07-17 02:34:19', NULL, NULL, NULL, NULL, NULL),
(526, 65, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 44, NULL, NULL, '2019-07-17 02:36:00', '2019-07-17 02:36:00', NULL, NULL, NULL, NULL, NULL),
(527, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 44, NULL, NULL, '2019-07-17 02:36:33', '2019-07-17 02:36:33', NULL, NULL, NULL, NULL, '{\"name\":{\"old\":\"Contract XiaoZhan\",\"new\":\"Contract WangYiB\"},\"updated_at\":{\"old\":\"2019-07-17 02:36:00\",\"new\":\"2019-07-17 02:36:33\"}}'),
(528, 65, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 44, NULL, NULL, '2019-07-17 02:37:44', '2019-07-17 02:37:44', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` (`id`, `user_id`, `action_type`, `target_id`, `target_type`, `location_id`, `note`, `filename`, `item_type`, `item_id`, `expected_checkin`, `accepted_id`, `created_at`, `updated_at`, `deleted_at`, `thread_id`, `company_id`, `accept_signature`, `log_meta`) VALUES
(529, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 57, NULL, NULL, '2019-07-17 02:50:51', '2019-07-17 02:50:51', NULL, NULL, NULL, NULL, NULL),
(530, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 39, NULL, NULL, '2019-07-17 02:51:18', '2019-07-17 02:51:18', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-07-17 00:16:24\",\"new\":\"2019-07-17 02:51:18\"},\"user_id\":{\"old\":65,\"new\":64}}'),
(531, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 56, NULL, NULL, '2019-07-17 02:52:57', '2019-07-17 02:52:57', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-17 01:39:53\",\"new\":\"2019-07-17 02:52:57\"},\"user_id\":{\"old\":64,\"new\":59},\"updated_at\":{\"old\":\"2019-07-17 01:39:53\",\"new\":\"2019-07-17 02:52:57\"},\"status_id\":{\"old\":5,\"new\":\"1\"}}'),
(532, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 58, NULL, NULL, '2019-07-17 02:53:17', '2019-07-17 02:53:17', NULL, NULL, NULL, NULL, NULL),
(533, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 59, NULL, NULL, '2019-07-17 02:53:35', '2019-07-17 02:53:35', NULL, NULL, NULL, NULL, NULL),
(534, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 59, NULL, NULL, '2019-07-17 02:53:45', '2019-07-17 02:53:45', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-17 02:53:35\",\"new\":\"2019-07-17 02:53:45\"},\"updated_at\":{\"old\":\"2019-07-17 02:53:35\",\"new\":\"2019-07-17 02:53:45\"},\"status_id\":{\"old\":1,\"new\":\"7\"}}'),
(535, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 45, NULL, NULL, '2019-07-17 02:56:20', '2019-07-17 02:56:20', NULL, NULL, NULL, NULL, NULL),
(536, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 45, NULL, NULL, '2019-07-17 02:56:49', '2019-07-17 02:56:49', NULL, NULL, NULL, NULL, NULL),
(537, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 14, NULL, NULL, '2019-07-17 03:12:45', '2019-07-17 03:12:45', NULL, NULL, 5, NULL, NULL),
(538, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 22, NULL, NULL, '2019-07-17 03:15:35', '2019-07-17 03:15:35', NULL, NULL, NULL, NULL, NULL),
(539, 65, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 60, NULL, NULL, '2019-07-17 03:28:05', '2019-07-17 03:28:05', NULL, NULL, NULL, NULL, NULL),
(540, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 60, NULL, NULL, '2019-07-17 03:28:18', '2019-07-17 03:28:18', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-17 03:28:05\",\"new\":\"2019-07-17 03:28:18\"},\"updated_at\":{\"old\":\"2019-07-17 03:28:05\",\"new\":\"2019-07-17 03:28:18\"},\"status_id\":{\"old\":2,\"new\":\"1\"}}'),
(541, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 15, NULL, NULL, '2019-07-17 18:18:22', '2019-07-17 18:18:22', NULL, NULL, 5, NULL, NULL),
(542, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 15, NULL, NULL, '2019-07-17 18:18:34', '2019-07-17 18:18:34', NULL, NULL, 5, NULL, '{\"location_id\":{\"old\":null,\"new\":\"11\"},\"updated_at\":{\"old\":\"2019-07-17 18:18:22\",\"new\":\"2019-07-17 18:18:34\"}}'),
(543, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 15, NULL, NULL, '2019-07-17 18:19:43', '2019-07-17 18:19:43', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"LtXbE6cElRallssywk8qsDBOE.jpeg\"},\"updated_at\":{\"old\":\"2019-07-17 18:18:34\",\"new\":\"2019-07-17 18:19:43\"}}'),
(544, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 15, NULL, NULL, '2019-07-17 18:19:54', '2019-07-17 18:19:54', NULL, NULL, 5, NULL, '{\"location_id\":{\"old\":11,\"new\":null},\"updated_at\":{\"old\":\"2019-07-17 18:19:43\",\"new\":\"2019-07-17 18:19:54\"}}'),
(545, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 15, NULL, NULL, '2019-07-17 18:20:07', '2019-07-17 18:20:07', NULL, NULL, 5, NULL, '{\"location_id\":{\"old\":null,\"new\":\"11\"},\"updated_at\":{\"old\":\"2019-07-17 18:19:54\",\"new\":\"2019-07-17 18:20:07\"}}'),
(546, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 46, NULL, NULL, '2019-07-17 18:38:32', '2019-07-17 18:38:32', NULL, NULL, NULL, NULL, NULL),
(547, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 61, NULL, NULL, '2019-07-17 18:40:44', '2019-07-17 18:40:44', NULL, NULL, NULL, NULL, NULL),
(548, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 47, NULL, NULL, '2019-07-17 18:41:00', '2019-07-17 18:41:00', NULL, NULL, NULL, NULL, NULL),
(549, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 47, NULL, NULL, '2019-07-17 18:42:31', '2019-07-17 18:42:31', NULL, NULL, NULL, NULL, '{\"location_id\":{\"old\":null,\"new\":\"11\"},\"contact_id_1\":{\"old\":null,\"new\":\"62\"},\"contact_id_2\":{\"old\":null,\"new\":\"65\"},\"updated_at\":{\"old\":\"2019-07-17 18:41:00\",\"new\":\"2019-07-17 18:42:31\"}}'),
(550, 59, 'checkout', 62, 'App\\Models\\User', 11, NULL, NULL, 'App\\Models\\License', 1, NULL, NULL, '2019-07-17 19:42:54', '2019-07-17 19:42:54', NULL, NULL, 5, NULL, NULL),
(551, 65, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1375, NULL, NULL, '2019-07-17 19:48:52', '2019-07-17 19:48:52', NULL, NULL, 5, NULL, NULL),
(552, 65, 'checkout', 64, 'App\\Models\\User', NULL, 'Checked out on asset creation', NULL, 'App\\Models\\Asset', 1375, NULL, NULL, '2019-07-17 19:48:52', '2019-07-17 19:48:52', NULL, NULL, NULL, NULL, NULL),
(553, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 23, NULL, NULL, '2019-07-17 19:52:53', '2019-07-17 19:52:53', NULL, NULL, NULL, NULL, NULL),
(554, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 62, NULL, NULL, '2019-07-17 19:53:35', '2019-07-17 19:53:35', NULL, NULL, NULL, NULL, NULL),
(555, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 63, NULL, NULL, '2019-07-17 19:55:25', '2019-07-17 19:55:25', NULL, NULL, NULL, NULL, NULL),
(556, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 47, NULL, NULL, '2019-07-17 19:57:29', '2019-07-17 19:57:29', NULL, NULL, NULL, NULL, '{\"name\":{\"old\":\"Pen\",\"new\":\"Computer\"},\"updated_at\":{\"old\":\"2019-07-17 18:42:31\",\"new\":\"2019-07-17 19:57:29\"}}'),
(557, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 23, NULL, NULL, '2019-07-17 19:57:59', '2019-07-17 19:57:59', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-11\",\"new\":\"2019-07-11 00:00:00\"},\"name\":{\"old\":\"Inventory_Pen\",\"new\":\"Inventory_Computer\"},\"updated_at\":{\"old\":\"2019-07-17 19:52:53\",\"new\":\"2019-07-17 19:57:59\"}}'),
(558, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1376, NULL, NULL, '2019-07-17 20:09:43', '2019-07-17 20:09:43', NULL, NULL, 5, NULL, NULL),
(559, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1376, NULL, NULL, '2019-07-17 20:13:53', '2019-07-17 20:13:53', NULL, NULL, 5, NULL, '{\"name\":{\"old\":null,\"new\":\"CPU\"}}'),
(560, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1377, NULL, NULL, '2019-07-17 20:15:12', '2019-07-17 20:15:12', NULL, NULL, 5, NULL, NULL),
(561, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1377, NULL, NULL, '2019-07-17 20:15:34', '2019-07-17 20:15:34', NULL, NULL, 5, NULL, '{\"name\":{\"old\":null,\"new\":\"Laptop\"}}'),
(562, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1378, NULL, NULL, '2019-07-17 20:16:32', '2019-07-17 20:16:32', NULL, NULL, 5, NULL, NULL),
(563, 64, 'checkout', 1376, 'App\\Models\\Asset', NULL, '', NULL, 'App\\Models\\Asset', 1378, NULL, NULL, '2019-07-17 20:18:02', '2019-07-17 20:18:02', NULL, NULL, 5, NULL, NULL),
(564, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1378, NULL, NULL, '2019-07-17 20:18:41', '2019-07-17 20:18:41', NULL, NULL, 5, NULL, '{\"purchase_cost\":{\"old\":null,\"new\":15},\"warranty_months\":{\"old\":null,\"new\":\"12\"}}'),
(565, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1379, NULL, NULL, '2019-07-17 20:22:47', '2019-07-17 20:22:47', NULL, NULL, 5, NULL, NULL),
(566, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2019-07-17 20:24:43', '2019-07-17 20:24:43', NULL, NULL, NULL, NULL, '{\"asset_tag\":{\"old\":\"1156627037\",\"new\":\"1156627038\"}}'),
(567, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2019-07-17 20:26:30', '2019-07-17 20:26:30', NULL, NULL, NULL, NULL, '{\"asset_tag\":{\"old\":\"1156627038\",\"new\":\"1827163892\"}}'),
(568, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1380, NULL, NULL, '2019-07-17 20:26:49', '2019-07-17 20:26:49', NULL, NULL, 5, NULL, NULL),
(569, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1380, NULL, NULL, '2019-07-17 20:28:11', '2019-07-17 20:28:11', NULL, NULL, 5, NULL, '{\"rtd_location_id\":{\"old\":null,\"new\":\"8\"},\"location_id\":{\"old\":null,\"new\":\"8\"}}'),
(570, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1381, NULL, NULL, '2019-07-17 20:30:31', '2019-07-17 20:30:31', NULL, NULL, 5, NULL, NULL),
(571, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1382, NULL, NULL, '2019-07-17 20:32:25', '2019-07-17 20:32:25', NULL, NULL, 5, NULL, NULL),
(572, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1383, NULL, NULL, '2019-07-17 20:34:00', '2019-07-17 20:34:00', NULL, NULL, 5, NULL, NULL),
(573, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1384, NULL, NULL, '2019-07-17 20:34:50', '2019-07-17 20:34:50', NULL, NULL, 5, NULL, NULL),
(574, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1385, NULL, NULL, '2019-07-17 20:36:09', '2019-07-17 20:36:09', NULL, NULL, 5, NULL, NULL),
(575, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1376, NULL, NULL, '2019-07-17 20:43:29', '2019-07-17 20:43:29', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"tsZmLZGTpBDi0gPQzBPUnmtJY.jpeg\"}}'),
(576, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1376, NULL, NULL, '2019-07-17 20:45:36', '2019-07-17 20:45:36', NULL, NULL, 5, NULL, '{\"image\":{\"old\":\"tsZmLZGTpBDi0gPQzBPUnmtJY.jpeg\",\"new\":\"094KHyMIMlAGuQ2FjGrzOkzaF.jpeg\"}}'),
(577, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1383, NULL, NULL, '2019-07-17 20:46:09', '2019-07-17 20:46:09', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"vF6QJNJhj5MsSL3anTTXEm5hG.jpeg\"}}'),
(578, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1378, NULL, NULL, '2019-07-17 20:46:37', '2019-07-17 20:46:37', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"xD9DJUbs4I0Xk5XKQmcemK6rp.jpeg\"}}'),
(579, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1378, NULL, NULL, '2019-07-17 20:46:39', '2019-07-17 20:46:39', NULL, NULL, 5, NULL, '{\"image\":{\"old\":\"xD9DJUbs4I0Xk5XKQmcemK6rp.jpeg\",\"new\":\"SG4wmNFbKe7feEmCPshjat2B0.jpeg\"}}'),
(580, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1382, NULL, NULL, '2019-07-17 20:48:39', '2019-07-17 20:48:39', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"19zJ53gLC4Hf421f7vUqiFnhB.jpeg\"}}'),
(581, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1377, NULL, NULL, '2019-07-17 20:50:24', '2019-07-17 20:50:24', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"xMiJxG8Pd0MWlB5Z18dtPVbJK.jpeg\"}}'),
(582, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1385, NULL, NULL, '2019-07-17 20:51:18', '2019-07-17 20:51:18', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"WKh2sv2z1CCnCzXZ76FbfK0p0.jpeg\"}}'),
(583, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1384, NULL, NULL, '2019-07-17 20:52:25', '2019-07-17 20:52:25', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"IrMCDL6RXK2oSMZdRpaGWAcfM.jpeg\"}}'),
(584, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1381, NULL, NULL, '2019-07-17 20:52:58', '2019-07-17 20:52:58', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"hijb6n3DQMpMNVEMp3DOHneF7.jpeg\"}}'),
(585, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1379, NULL, NULL, '2019-07-17 20:53:33', '2019-07-17 20:53:33', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"M5NLuBOvI4qQenVDKmwY4oyQN.jpeg\"}}'),
(586, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1380, NULL, NULL, '2019-07-17 20:54:04', '2019-07-17 20:54:04', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"ocQc1K7JtPkQX0kDjqj56xPCT.jpeg\"}}'),
(587, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 24, NULL, NULL, '2019-07-17 20:56:53', '2019-07-17 20:56:53', NULL, NULL, NULL, NULL, NULL),
(588, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 16, NULL, NULL, '2019-07-17 21:07:14', '2019-07-17 21:07:14', NULL, NULL, 5, NULL, NULL),
(589, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 16, NULL, NULL, '2019-07-17 21:07:47', '2019-07-17 21:07:47', NULL, NULL, 5, NULL, '{\"image\":{\"old\":\"FPXufnNdZBQR4JD6yZjk4ucT2.jpg\",\"new\":\"Dj5JqXWucNNjr3LvB38A3KWAd.jpg\"},\"updated_at\":{\"old\":\"2019-07-17 21:07:14\",\"new\":\"2019-07-17 21:07:47\"}}'),
(590, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 16, NULL, NULL, '2019-07-17 21:08:59', '2019-07-17 21:08:59', NULL, NULL, 5, NULL, '{\"image\":{\"old\":\"Dj5JqXWucNNjr3LvB38A3KWAd.jpg\",\"new\":\"8afhcC9XCSKpkOVRSIPK5ofME.jpg\"},\"updated_at\":{\"old\":\"2019-07-17 21:07:47\",\"new\":\"2019-07-17 21:08:59\"}}'),
(591, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1386, NULL, NULL, '2019-07-17 21:17:43', '2019-07-17 21:17:43', NULL, NULL, 5, NULL, NULL),
(592, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1386, NULL, NULL, '2019-07-17 21:18:18', '2019-07-17 21:18:18', NULL, NULL, 5, NULL, '{\"asset_tag\":{\"old\":\"111333001\",\"new\":\"111222501\"}}'),
(593, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1387, NULL, NULL, '2019-07-17 21:19:01', '2019-07-17 21:19:01', NULL, NULL, 5, NULL, NULL),
(594, 59, 'checkout', 62, 'App\\Models\\User', 11, 'Checked out on asset creation', NULL, 'App\\Models\\Asset', 1387, NULL, NULL, '2019-07-17 21:19:01', '2019-07-17 21:19:01', NULL, NULL, 5, NULL, NULL),
(595, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 17, NULL, NULL, '2019-07-17 21:22:11', '2019-07-17 21:22:11', NULL, NULL, 6, NULL, NULL),
(596, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 48, NULL, NULL, '2019-07-17 21:24:07', '2019-07-17 21:24:07', NULL, NULL, NULL, NULL, NULL),
(597, 65, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 49, NULL, NULL, '2019-07-29 00:04:48', '2019-07-29 00:04:48', NULL, NULL, NULL, NULL, NULL),
(598, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 47, NULL, NULL, '2019-07-29 00:05:36', '2019-07-29 00:05:36', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-07-17 19:57:29\",\"new\":\"2019-07-29 00:05:36\"},\"user_id\":{\"old\":64,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"3\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Store\"}}'),
(599, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 38, NULL, NULL, '2019-07-29 00:05:55', '2019-07-29 00:05:55', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-07-16 20:37:53\",\"new\":\"2019-07-29 00:05:55\"},\"object_id\":{\"old\":0,\"new\":\"12\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Department\"}}'),
(600, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 32, NULL, NULL, '2019-07-29 00:06:24', '2019-07-29 00:06:24', NULL, NULL, NULL, NULL, '{\"contact_id_1\":{\"old\":null,\"new\":\"62\"},\"contact_id_2\":{\"old\":null,\"new\":\"7\"},\"end_date\":{\"old\":\"2019-07-22\",\"new\":\"2019-07-31\"},\"billing_date\":{\"old\":\"0000-00-00\",\"new\":\"1900-11-21\"},\"terms_and_conditions\":{\"old\":null,\"new\":\"x\"},\"notes\":{\"old\":null,\"new\":\"x\"},\"updated_at\":{\"old\":\"2019-07-16 19:17:11\",\"new\":\"2019-07-29 00:06:24\"},\"user_id\":{\"old\":59,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"7\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Department\"}}'),
(601, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 35, NULL, NULL, '2019-07-29 00:06:44', '2019-07-29 00:06:44', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-07-16 01:53:48\",\"new\":\"2019-07-29 00:06:44\"},\"user_id\":{\"old\":59,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"1\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Company\"}}'),
(602, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 37, NULL, NULL, '2019-07-29 00:07:07', '2019-07-29 00:07:07', NULL, NULL, NULL, NULL, '{\"end_date\":{\"old\":\"2019-08-06\",\"new\":\"2019-08-07\"},\"terms_and_conditions\":{\"old\":\"xsax\",\"new\":\"xsaxasx\"},\"updated_at\":{\"old\":\"2019-07-16 19:19:40\",\"new\":\"2019-07-29 00:07:07\"},\"user_id\":{\"old\":59,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"17\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Store\"}}'),
(603, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 33, NULL, NULL, '2019-07-29 00:07:36', '2019-07-29 00:07:36', NULL, NULL, NULL, NULL, '{\"contact_id_1\":{\"old\":null,\"new\":\"15\"},\"terms_and_conditions\":{\"old\":null,\"new\":\"sa\"},\"notes\":{\"old\":null,\"new\":\"as\"},\"updated_at\":{\"old\":\"2019-07-08 21:39:58\",\"new\":\"2019-07-29 00:07:36\"},\"user_id\":{\"old\":0,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"9\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Department\"}}'),
(604, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 34, NULL, NULL, '2019-07-29 00:07:58', '2019-07-29 00:07:58', NULL, NULL, NULL, NULL, '{\"location_id\":{\"old\":null,\"new\":\"6\"},\"contact_id_1\":{\"old\":null,\"new\":\"7\"},\"contact_id_2\":{\"old\":null,\"new\":\"15\"},\"payment_date\":{\"old\":null,\"new\":\"2019-07-17\"},\"terms_and_conditions\":{\"old\":null,\"new\":\"xsa\"},\"notes\":{\"old\":null,\"new\":\"xasx\"},\"updated_at\":{\"old\":\"2019-07-16 18:51:33\",\"new\":\"2019-07-29 00:07:58\"},\"user_id\":{\"old\":59,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"3\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Store\"}}'),
(605, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 31, NULL, NULL, '2019-07-29 00:08:13', '2019-07-29 00:08:13', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-07-08 21:08:43\",\"new\":\"2019-07-29 00:08:13\"},\"user_id\":{\"old\":0,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"7\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Department\"}}'),
(606, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 42, NULL, NULL, '2019-07-29 00:08:29', '2019-07-29 00:08:29', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-07-17 02:33:44\",\"new\":\"2019-07-29 00:08:29\"},\"object_id\":{\"old\":0,\"new\":\"6\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Company\"}}'),
(607, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 43, NULL, NULL, '2019-07-29 00:08:47', '2019-07-29 00:08:47', NULL, NULL, NULL, NULL, '{\"end_date\":{\"old\":\"2019-07-28\",\"new\":\"2019-07-30\"},\"terms_and_conditions\":{\"old\":\"asxa\",\"new\":\"xasxasx\"},\"updated_at\":{\"old\":\"2019-07-17 02:34:19\",\"new\":\"2019-07-29 00:08:47\"},\"object_id\":{\"old\":0,\"new\":\"17\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Store\"}}'),
(608, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 48, NULL, NULL, '2019-07-29 00:09:11', '2019-07-29 00:09:11', NULL, NULL, NULL, NULL, '{\"contact_id_1\":{\"old\":null,\"new\":\"28\"},\"contact_id_2\":{\"old\":null,\"new\":\"62\"},\"end_date\":{\"old\":\"2020-07-31\",\"new\":\"2020-08-07\"},\"payment_date\":{\"old\":null,\"new\":\"2019-07-01\"},\"terms_and_conditions\":{\"old\":null,\"new\":\"asx\"},\"notes\":{\"old\":null,\"new\":\"xasxsax\"},\"updated_at\":{\"old\":\"2019-07-17 21:24:07\",\"new\":\"2019-07-29 00:09:11\"},\"user_id\":{\"old\":59,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"1\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Company\"}}'),
(609, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 39, NULL, NULL, '2019-07-29 00:09:27', '2019-07-29 00:09:27', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-07-17 02:51:18\",\"new\":\"2019-07-29 00:09:27\"},\"user_id\":{\"old\":64,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"15\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Department\"}}'),
(610, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 29, NULL, NULL, '2019-07-29 00:09:47', '2019-07-29 00:09:47', NULL, NULL, NULL, NULL, '{\"contact_id_2\":{\"old\":null,\"new\":\"28\"},\"updated_at\":{\"old\":\"2019-07-08 02:43:59\",\"new\":\"2019-07-29 00:09:47\"},\"user_id\":{\"old\":0,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"16\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Department\"}}'),
(611, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 28, NULL, NULL, '2019-07-29 00:10:21', '2019-07-29 00:10:21', NULL, NULL, NULL, NULL, '{\"contact_id_1\":{\"old\":null,\"new\":\"28\"},\"contact_id_2\":{\"old\":null,\"new\":\"7\"},\"end_date\":{\"old\":\"2019-07-08\",\"new\":\"2019-09-04\"},\"payment_date\":{\"old\":null,\"new\":\"2019-07-10\"},\"terms_and_conditions\":{\"old\":null,\"new\":\"axasxax\"},\"notes\":{\"old\":null,\"new\":\"axasxax\"},\"updated_at\":{\"old\":\"2019-07-16 18:51:04\",\"new\":\"2019-07-29 00:10:21\"},\"user_id\":{\"old\":59,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"3\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Company\"}}'),
(612, 65, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 46, NULL, NULL, '2019-07-29 00:10:52', '2019-07-29 00:10:52', NULL, NULL, NULL, NULL, '{\"location_id\":{\"old\":null,\"new\":\"10\"},\"contact_id_1\":{\"old\":null,\"new\":\"15\"},\"contact_id_2\":{\"old\":null,\"new\":\"15\"},\"payment_date\":{\"old\":null,\"new\":\"2019-07-16\"},\"terms_and_conditions\":{\"old\":null,\"new\":\"xsasx\"},\"notes\":{\"old\":null,\"new\":\"xasxas\"},\"updated_at\":{\"old\":\"2019-07-17 18:38:32\",\"new\":\"2019-07-29 00:10:52\"},\"user_id\":{\"old\":64,\"new\":65},\"object_id\":{\"old\":0,\"new\":\"17\"},\"object_type\":{\"old\":\"\",\"new\":\"App\\\\Models\\\\Store\"}}'),
(613, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 25, NULL, NULL, '2019-07-29 20:46:12', '2019-07-29 20:46:12', NULL, NULL, NULL, NULL, NULL),
(614, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 26, NULL, NULL, '2019-07-29 20:48:41', '2019-07-29 20:48:41', NULL, NULL, NULL, NULL, NULL),
(615, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 27, NULL, NULL, '2019-07-29 20:49:08', '2019-07-29 20:49:08', NULL, NULL, NULL, NULL, NULL),
(616, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 28, NULL, NULL, '2019-07-29 20:49:36', '2019-07-29 20:49:36', NULL, NULL, NULL, NULL, NULL),
(617, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 29, NULL, NULL, '2019-07-29 20:50:41', '2019-07-29 20:50:41', NULL, NULL, NULL, NULL, NULL),
(618, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 30, NULL, NULL, '2019-07-29 20:51:21', '2019-07-29 20:51:21', NULL, NULL, NULL, NULL, NULL),
(619, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 30, NULL, NULL, '2019-07-29 20:51:48', '2019-07-29 20:51:48', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-04\",\"new\":\"2019-07-04 00:00:00\"},\"updated_at\":{\"old\":\"2019-07-29 20:51:21\",\"new\":\"2019-07-29 20:51:48\"}}'),
(620, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 30, NULL, NULL, '2019-07-29 20:52:12', '2019-07-29 20:52:12', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-04\",\"new\":\"2019-07-04 00:00:00\"},\"updated_at\":{\"old\":\"2019-07-29 20:51:48\",\"new\":\"2019-07-29 20:52:12\"}}'),
(621, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 31, NULL, NULL, '2019-07-29 20:52:49', '2019-07-29 20:52:49', NULL, NULL, NULL, NULL, NULL),
(622, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 64, NULL, NULL, '2019-07-29 20:53:09', '2019-07-29 20:53:09', NULL, NULL, NULL, NULL, NULL),
(623, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 65, NULL, NULL, '2019-07-29 20:53:19', '2019-07-29 20:53:19', NULL, NULL, NULL, NULL, NULL),
(624, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 66, NULL, NULL, '2019-07-29 20:53:48', '2019-07-29 20:53:48', NULL, NULL, NULL, NULL, NULL),
(625, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 67, NULL, NULL, '2019-07-29 20:53:55', '2019-07-29 20:53:55', NULL, NULL, NULL, NULL, NULL),
(626, 65, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 50, NULL, NULL, '2019-07-30 02:04:23', '2019-07-30 02:04:23', NULL, NULL, NULL, NULL, NULL),
(627, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 18, NULL, NULL, '2019-07-30 02:28:18', '2019-07-30 02:28:18', NULL, NULL, 5, NULL, NULL),
(628, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 18, NULL, NULL, '2019-07-30 02:30:41', '2019-07-30 02:30:41', NULL, NULL, 5, NULL, '{\"name\":{\"old\":\"store\",\"new\":\"store Ph\\u1ed5 Quang\"},\"image\":{\"old\":null,\"new\":\"yzKFhkkpDG27e1IxOJdXFPwOb.jpg\"},\"updated_at\":{\"old\":\"2019-07-30 02:28:18\",\"new\":\"2019-07-30 02:30:41\"}}'),
(629, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 19, NULL, NULL, '2019-07-30 02:32:19', '2019-07-30 02:32:19', NULL, NULL, 5, NULL, NULL),
(630, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 51, NULL, NULL, '2019-07-30 03:05:22', '2019-07-30 03:05:22', NULL, NULL, NULL, NULL, NULL),
(631, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 51, NULL, NULL, '2019-07-30 03:06:55', '2019-07-30 03:06:55', NULL, NULL, NULL, NULL, '{\"location_id\":{\"old\":null,\"new\":\"8\"},\"contact_id_1\":{\"old\":null,\"new\":\"64\"},\"contact_id_2\":{\"old\":null,\"new\":\"62\"},\"payment_date\":{\"old\":null,\"new\":\"2019-07-16\"},\"terms_and_conditions\":{\"old\":null,\"new\":\"Terms and Conditions\"},\"notes\":{\"old\":null,\"new\":\"Notes\"},\"updated_at\":{\"old\":\"2019-07-30 03:05:22\",\"new\":\"2019-07-30 03:06:55\"}}'),
(632, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 38, NULL, NULL, '2019-07-30 03:13:35', '2019-07-30 03:13:35', NULL, NULL, NULL, NULL, '{\"billing_date\":{\"old\":\"2019-07-30\",\"new\":\"2019-07-02\"},\"terms_and_conditions\":{\"old\":\"hihih\",\"new\":\"hihi\"},\"updated_at\":{\"old\":\"2019-07-29 00:05:55\",\"new\":\"2019-07-30 03:13:35\"},\"user_id\":{\"old\":65,\"new\":64},\"object_id\":{\"old\":12,\"new\":\"15\"},\"object_type\":{\"old\":\"App\\\\Models\\\\Department\",\"new\":\"App\\\\Models\\\\Store\"}}'),
(633, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 52, NULL, NULL, '2019-07-30 03:31:25', '2019-07-30 03:31:25', NULL, NULL, NULL, NULL, NULL),
(634, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 53, NULL, NULL, '2019-07-30 03:32:35', '2019-07-30 03:32:35', NULL, NULL, NULL, NULL, NULL),
(635, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 52, NULL, NULL, '2019-07-30 03:35:53', '2019-07-30 03:35:53', NULL, NULL, NULL, NULL, '{\"name\":{\"old\":\"S\\u00e1ch\",\"new\":\"S\\u00e1ch \\u1ebf\"},\"updated_at\":{\"old\":\"2019-07-30 03:31:25\",\"new\":\"2019-07-30 03:35:53\"}}'),
(636, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 32, NULL, NULL, '2019-07-30 03:39:42', '2019-07-30 03:39:42', NULL, NULL, NULL, NULL, NULL),
(637, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 32, NULL, NULL, '2019-07-30 03:40:36', '2019-07-30 03:40:36', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-03\",\"new\":\"2019-07-03 00:00:00\"},\"notes\":{\"old\":null,\"new\":\"Notes\"},\"updated_at\":{\"old\":\"2019-07-30 03:39:42\",\"new\":\"2019-07-30 03:40:36\"},\"object_type\":{\"old\":\"App\\\\Models\\\\Company\",\"new\":\"App\\\\Models\\\\Store\"},\"object_id\":{\"old\":5,\"new\":\"15\"}}'),
(638, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 68, NULL, NULL, '2019-07-30 03:44:43', '2019-07-30 03:44:43', NULL, NULL, NULL, NULL, NULL),
(639, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 69, NULL, NULL, '2019-07-30 03:45:59', '2019-07-30 03:45:59', NULL, NULL, NULL, NULL, NULL),
(640, 59, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 69, NULL, NULL, '2019-07-31 18:06:37', '2019-07-31 18:06:37', NULL, NULL, NULL, NULL, NULL),
(641, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 20, NULL, NULL, '2019-07-31 19:02:18', '2019-07-31 19:02:18', NULL, NULL, 5, NULL, NULL),
(642, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 20, NULL, NULL, '2019-07-31 19:02:57', '2019-07-31 19:02:57', NULL, NULL, 5, NULL, '{\"location_id\":{\"old\":null,\"new\":\"11\"},\"updated_at\":{\"old\":\"2019-07-31 19:02:18\",\"new\":\"2019-07-31 19:02:57\"}}'),
(643, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 20, NULL, NULL, '2019-07-31 19:03:11', '2019-07-31 19:03:11', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"vg2MHNs0rHllwhehFJs2hnVf4.jpg\"},\"updated_at\":{\"old\":\"2019-07-31 19:02:57\",\"new\":\"2019-07-31 19:03:11\"}}'),
(644, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 21, NULL, NULL, '2019-07-31 19:04:24', '2019-07-31 19:04:24', NULL, NULL, 4, NULL, NULL),
(645, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 21, NULL, NULL, '2019-07-31 19:05:04', '2019-07-31 19:05:04', NULL, NULL, 4, NULL, NULL),
(646, 65, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 54, NULL, NULL, '2019-07-31 19:44:31', '2019-07-31 19:44:31', NULL, NULL, NULL, NULL, NULL),
(647, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 55, NULL, NULL, '2019-07-31 20:21:35', '2019-07-31 20:21:35', NULL, NULL, NULL, NULL, NULL),
(648, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 55, NULL, NULL, '2019-07-31 20:24:27', '2019-07-31 20:24:27', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-07-31 20:21:35\",\"new\":\"2019-07-31 20:24:27\"},\"object_type\":{\"old\":\"App\\\\Models\\\\Company\",\"new\":\"App\\\\Models\\\\Department\"}}'),
(649, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 55, NULL, NULL, '2019-07-31 20:25:45', '2019-07-31 20:25:45', NULL, NULL, NULL, NULL, '{\"location_id\":{\"old\":null,\"new\":\"12\"},\"contact_id_1\":{\"old\":null,\"new\":\"64\"},\"contact_id_2\":{\"old\":null,\"new\":\"64\"},\"updated_at\":{\"old\":\"2019-07-31 20:24:27\",\"new\":\"2019-07-31 20:25:45\"}}'),
(650, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 55, NULL, NULL, '2019-07-31 20:27:34', '2019-07-31 20:27:34', NULL, NULL, NULL, NULL, NULL),
(651, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 56, NULL, NULL, '2019-07-31 20:31:58', '2019-07-31 20:31:58', NULL, NULL, NULL, NULL, NULL),
(652, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 56, NULL, NULL, '2019-07-31 20:32:04', '2019-07-31 20:32:04', NULL, NULL, NULL, NULL, '{\"terms_and_conditions\":{\"old\":\"\\r\\nTerms and Conditions\",\"new\":\"Terms and Conditions\"},\"updated_at\":{\"old\":\"2019-07-31 20:31:58\",\"new\":\"2019-07-31 20:32:04\"}}'),
(653, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 56, NULL, NULL, '2019-07-31 20:32:15', '2019-07-31 20:32:15', NULL, NULL, NULL, NULL, NULL),
(654, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 33, NULL, NULL, '2019-07-31 20:52:00', '2019-07-31 20:52:00', NULL, NULL, NULL, NULL, NULL),
(655, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 27, NULL, NULL, '2019-07-31 20:52:19', '2019-07-31 20:52:19', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-03\",\"new\":\"2019-07-03 00:00:00\"},\"updated_at\":{\"old\":\"2019-07-29 20:49:08\",\"new\":\"2019-07-31 20:52:19\"},\"object_type\":{\"old\":\"App\\\\Models\\\\Store\",\"new\":\"App\\\\Models\\\\Company\"},\"object_id\":{\"old\":17,\"new\":\"6\"}}'),
(656, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 27, NULL, NULL, '2019-07-31 20:52:34', '2019-07-31 20:52:34', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-03\",\"new\":\"2019-07-03 00:00:00\"},\"updated_at\":{\"old\":\"2019-07-31 20:52:19\",\"new\":\"2019-07-31 20:52:34\"},\"object_type\":{\"old\":\"App\\\\Models\\\\Company\",\"new\":\"App\\\\Models\\\\Store\"},\"object_id\":{\"old\":6,\"new\":\"17\"}}'),
(657, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 34, NULL, NULL, '2019-07-31 20:53:57', '2019-07-31 20:53:57', NULL, NULL, NULL, NULL, NULL),
(658, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 70, NULL, NULL, '2019-07-31 20:58:04', '2019-07-31 20:58:04', NULL, NULL, NULL, NULL, NULL),
(659, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 71, NULL, NULL, '2019-07-31 20:58:45', '2019-07-31 20:58:45', NULL, NULL, NULL, NULL, NULL),
(660, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 71, NULL, NULL, '2019-07-31 20:58:57', '2019-07-31 20:58:57', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-07-31 20:58:45\",\"new\":\"2019-07-31 20:58:57\"},\"updated_at\":{\"old\":\"2019-07-31 20:58:45\",\"new\":\"2019-07-31 20:58:57\"},\"status_id\":{\"old\":6,\"new\":\"1\"}}'),
(661, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 72, NULL, NULL, '2019-07-31 20:59:12', '2019-07-31 20:59:12', NULL, NULL, NULL, NULL, NULL),
(662, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 71, NULL, NULL, '2019-07-31 20:59:31', '2019-07-31 20:59:31', NULL, NULL, NULL, NULL, NULL),
(663, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 72, NULL, NULL, '2019-07-31 20:59:36', '2019-07-31 20:59:36', NULL, NULL, NULL, NULL, NULL),
(664, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 27, NULL, NULL, '2019-07-31 21:00:19', '2019-07-31 21:00:19', NULL, NULL, NULL, NULL, NULL),
(665, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 35, NULL, NULL, '2019-07-31 21:00:54', '2019-07-31 21:00:54', NULL, NULL, NULL, NULL, NULL),
(666, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 35, NULL, NULL, '2019-07-31 21:01:22', '2019-07-31 21:01:22', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-08-01\",\"new\":\"2019-08-01 00:00:00\"},\"updated_at\":{\"old\":\"2019-07-31 21:00:54\",\"new\":\"2019-07-31 21:01:22\"},\"object_type\":{\"old\":\"App\\\\Models\\\\Store\",\"new\":\"App\\\\Models\\\\Contract\"},\"object_id\":{\"old\":17,\"new\":\"46\"}}'),
(667, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 73, NULL, NULL, '2019-07-31 21:01:33', '2019-07-31 21:01:33', NULL, NULL, NULL, NULL, NULL),
(668, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 74, NULL, NULL, '2019-07-31 21:01:40', '2019-07-31 21:01:40', NULL, NULL, NULL, NULL, NULL),
(669, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 74, NULL, NULL, '2019-07-31 21:01:55', '2019-07-31 21:01:55', NULL, NULL, NULL, NULL, NULL),
(670, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 73, NULL, NULL, '2019-07-31 21:01:59', '2019-07-31 21:01:59', NULL, NULL, NULL, NULL, NULL),
(671, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 33, NULL, NULL, '2019-07-31 21:40:33', '2019-07-31 21:40:33', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-08-01\",\"new\":\"2019-08-01 00:00:00\"},\"name\":{\"old\":\"akeInventory_laptop\",\"new\":\"Inventory_laptop\"},\"updated_at\":{\"old\":\"2019-07-31 20:52:00\",\"new\":\"2019-07-31 21:40:33\"}}'),
(672, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 36, NULL, NULL, '2019-07-31 21:45:02', '2019-07-31 21:45:02', NULL, NULL, NULL, NULL, NULL),
(673, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 78, NULL, NULL, '2019-07-31 21:59:59', '2019-07-31 21:59:59', NULL, NULL, NULL, NULL, NULL),
(674, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 78, NULL, NULL, '2019-07-31 23:27:34', '2019-07-31 23:27:34', NULL, NULL, NULL, NULL, NULL),
(675, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 79, NULL, NULL, '2019-07-31 23:29:43', '2019-07-31 23:29:43', NULL, NULL, NULL, NULL, NULL),
(676, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 80, NULL, NULL, '2019-07-31 23:31:52', '2019-07-31 23:31:52', NULL, NULL, NULL, NULL, NULL),
(677, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 79, NULL, NULL, '2019-07-31 23:33:36', '2019-07-31 23:33:36', NULL, NULL, NULL, NULL, NULL),
(678, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 37, NULL, NULL, '2019-07-31 23:40:08', '2019-07-31 23:40:08', NULL, NULL, NULL, NULL, NULL),
(679, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 37, NULL, NULL, '2019-07-31 23:40:28', '2019-07-31 23:40:28', NULL, NULL, NULL, NULL, NULL),
(680, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 81, NULL, NULL, '2019-07-31 23:41:01', '2019-07-31 23:41:01', NULL, NULL, NULL, NULL, NULL),
(681, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 82, NULL, NULL, '2019-07-31 23:41:43', '2019-07-31 23:41:44', NULL, NULL, NULL, NULL, NULL),
(682, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 83, NULL, NULL, '2019-08-04 18:17:35', '2019-08-04 18:17:35', NULL, NULL, NULL, NULL, NULL),
(683, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 84, NULL, NULL, '2019-08-04 21:55:03', '2019-08-04 21:55:03', NULL, NULL, NULL, NULL, NULL),
(684, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 38, NULL, NULL, '2019-08-04 21:59:50', '2019-08-04 21:59:50', NULL, NULL, NULL, NULL, NULL),
(685, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 22, NULL, NULL, '2019-08-05 02:41:39', '2019-08-05 02:41:39', NULL, NULL, 5, NULL, NULL),
(686, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 57, NULL, NULL, '2019-08-05 03:06:23', '2019-08-05 03:06:23', NULL, NULL, NULL, NULL, NULL),
(687, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 39, NULL, NULL, '2019-08-05 03:09:47', '2019-08-05 03:09:47', NULL, NULL, NULL, NULL, NULL),
(688, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 85, NULL, NULL, '2019-08-05 03:15:37', '2019-08-05 03:15:37', NULL, NULL, NULL, NULL, NULL),
(689, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 86, NULL, NULL, '2019-08-05 03:15:47', '2019-08-05 03:15:47', NULL, NULL, NULL, NULL, NULL),
(690, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 87, NULL, NULL, '2019-08-05 03:16:48', '2019-08-05 03:16:48', NULL, NULL, NULL, NULL, NULL),
(691, 59, 'checkout', 62, 'App\\Models\\User', 11, '', NULL, 'App\\Models\\Asset', 1376, NULL, NULL, '2019-08-05 03:17:46', '2019-08-05 03:17:46', NULL, NULL, 5, NULL, NULL),
(692, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1376, NULL, NULL, '2019-08-05 03:26:41', '2019-08-05 03:26:41', NULL, NULL, 5, NULL, '{\"requestable\":{\"old\":0,\"new\":true}}'),
(693, NULL, 'requested', 59, 'App\\Models\\User', 11, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2019-08-05 03:27:11', '2019-08-05 03:27:11', NULL, NULL, NULL, NULL, NULL),
(694, NULL, 'requested', 59, 'App\\Models\\User', 11, NULL, NULL, 'App\\Models\\Asset', 3, NULL, NULL, '2019-08-05 03:28:54', '2019-08-05 03:28:54', NULL, NULL, NULL, NULL, NULL),
(695, NULL, 'requested', 59, 'App\\Models\\User', 11, NULL, NULL, 'App\\Models\\Asset', 1156, NULL, NULL, '2019-08-05 03:29:31', '2019-08-05 03:29:31', NULL, NULL, NULL, NULL, NULL),
(696, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 54, NULL, NULL, '2019-08-05 04:25:18', '2019-08-05 04:25:18', NULL, NULL, NULL, NULL, '{\"name\":{\"old\":\"ADR\",\"new\":\"ADR XXX\"},\"updated_at\":{\"old\":\"2019-07-31 19:44:31\",\"new\":\"2019-08-05 04:25:18\"},\"user_id\":{\"old\":65,\"new\":59}}'),
(697, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1375, NULL, NULL, '2019-08-06 02:10:34', '2019-08-06 02:10:34', NULL, NULL, 5, NULL, '{\"rtd_location_id\":{\"old\":null,\"new\":\"11\"}}'),
(698, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1375, NULL, NULL, '2019-08-06 02:10:51', '2019-08-06 02:10:51', NULL, NULL, 5, NULL, '{\"requestable\":{\"old\":0,\"new\":true}}'),
(699, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1375, NULL, NULL, '2019-08-06 02:11:03', '2019-08-06 02:11:03', NULL, NULL, 5, NULL, '{\"rtd_location_id\":{\"old\":11,\"new\":null}}'),
(700, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1375, NULL, NULL, '2019-08-06 02:12:56', '2019-08-06 02:12:56', NULL, NULL, 5, NULL, '{\"company_id\":{\"old\":5,\"new\":\"6\"}}'),
(701, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 58, NULL, NULL, '2019-08-06 20:07:20', '2019-08-06 20:07:20', NULL, NULL, NULL, NULL, NULL),
(702, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1388, NULL, NULL, '2019-08-07 20:48:17', '2019-08-07 20:48:17', NULL, NULL, NULL, NULL, NULL),
(703, 59, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 1388, NULL, NULL, '2019-08-07 20:48:17', '2019-08-07 20:48:17', NULL, NULL, NULL, NULL, NULL),
(704, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1389, NULL, NULL, '2019-08-07 20:49:43', '2019-08-07 20:49:43', NULL, NULL, NULL, NULL, NULL),
(705, 59, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 1389, NULL, NULL, '2019-08-07 20:49:43', '2019-08-07 20:49:43', NULL, NULL, NULL, NULL, NULL),
(706, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1390, NULL, NULL, '2019-08-07 20:52:25', '2019-08-07 20:52:25', NULL, NULL, NULL, NULL, NULL),
(707, 59, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 1390, NULL, NULL, '2019-08-07 20:52:25', '2019-08-07 20:52:25', NULL, NULL, NULL, NULL, NULL),
(708, 64, 'checkin from', 3, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 1156, NULL, NULL, '2019-08-08 03:47:52', '2019-08-08 03:47:52', NULL, NULL, 4, NULL, NULL),
(709, 59, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1390, NULL, NULL, '2019-08-08 04:43:29', '2019-08-08 04:43:29', NULL, NULL, NULL, NULL, NULL),
(710, 64, 'restored', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1390, NULL, NULL, '2019-08-08 18:42:35', '2019-08-08 18:42:35', NULL, NULL, NULL, NULL, NULL),
(711, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 10, NULL, NULL, '2019-08-08 18:54:58', '2019-08-08 18:54:58', NULL, NULL, NULL, NULL, NULL),
(712, 64, 'restored', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 10, NULL, NULL, '2019-08-08 18:57:49', '2019-08-08 18:57:49', NULL, NULL, NULL, NULL, NULL),
(713, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2019-08-08 18:58:11', '2019-08-08 18:58:11', NULL, NULL, NULL, NULL, NULL),
(714, 59, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 3, NULL, NULL, '2019-08-08 18:59:25', '2019-08-08 18:59:25', NULL, NULL, NULL, NULL, NULL),
(715, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 36, NULL, NULL, '2019-08-08 19:27:14', '2019-08-08 19:27:14', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-08-20\",\"new\":\"2019-08-20 00:00:00\"},\"updated_at\":{\"old\":\"2019-07-31 21:45:02\",\"new\":\"2019-08-08 19:27:14\"}}'),
(716, 64, 'restored', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2019-08-08 20:21:33', '2019-08-08 20:21:33', NULL, NULL, NULL, NULL, NULL),
(717, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 9, NULL, NULL, '2019-08-08 20:25:01', '2019-08-08 20:25:01', NULL, NULL, NULL, NULL, NULL),
(718, 64, 'audit', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2019-08-08 20:49:35', '2019-08-08 20:49:35', NULL, NULL, NULL, NULL, NULL),
(719, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 40, NULL, NULL, '2019-08-09 00:01:11', '2019-08-09 00:01:11', NULL, NULL, NULL, NULL, NULL),
(720, 63, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 40, NULL, NULL, '2019-08-09 00:01:36', '2019-08-09 00:01:36', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-08-06\",\"new\":\"2019-08-06 00:00:00\"},\"updated_at\":{\"old\":\"2019-08-09 00:01:11\",\"new\":\"2019-08-09 00:01:36\"},\"object_type\":{\"old\":\"App\\\\Models\\\\Location\",\"new\":\"App\\\\Models\\\\Company\"},\"object_id\":{\"old\":12,\"new\":\"6\"}}'),
(721, 63, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 40, NULL, NULL, '2019-08-09 00:01:45', '2019-08-09 00:01:45', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-08-06\",\"new\":\"2019-08-06 00:00:00\"},\"updated_at\":{\"old\":\"2019-08-09 00:01:36\",\"new\":\"2019-08-09 00:01:45\"},\"object_type\":{\"old\":\"App\\\\Models\\\\Company\",\"new\":\"App\\\\Models\\\\Location\"},\"object_id\":{\"old\":6,\"new\":\"12\"}}'),
(722, 63, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 40, NULL, NULL, '2019-08-09 00:02:09', '2019-08-09 00:02:09', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-08-06\",\"new\":\"2019-07-05 00:00:00\"},\"updated_at\":{\"old\":\"2019-08-09 00:01:45\",\"new\":\"2019-08-09 00:02:09\"}}'),
(723, 63, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 40, NULL, NULL, '2019-08-09 00:02:38', '2019-08-09 00:02:38', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-05\",\"new\":\"2019-07-05 00:00:00\"},\"name\":{\"old\":\"Ki\\u1ec3m k\\u00ea l\\u1ea7n 1 b\\u00ecnh d\\u01b0\\u01a1ng \",\"new\":\"Ki\\u1ec3m k\\u00ea l\\u1ea7n 1 wasaco\"},\"updated_at\":{\"old\":\"2019-08-09 00:02:09\",\"new\":\"2019-08-09 00:02:38\"},\"object_id\":{\"old\":12,\"new\":\"11\"}}'),
(724, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-09 00:21:09', '2019-08-09 00:21:09', NULL, NULL, 5, NULL, NULL),
(725, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1392, NULL, NULL, '2019-08-09 00:28:37', '2019-08-09 00:28:37', NULL, NULL, 5, NULL, NULL),
(726, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1393, NULL, NULL, '2019-08-09 00:29:01', '2019-08-09 00:29:01', NULL, NULL, 5, NULL, NULL),
(727, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1394, NULL, NULL, '2019-08-09 00:29:12', '2019-08-09 00:29:12', NULL, NULL, 5, NULL, NULL),
(728, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1394, NULL, NULL, '2019-08-09 00:29:45', '2019-08-09 00:29:45', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"tB3VLKLoJY5J1V1hjtgqm52Wn.jpeg\"}}'),
(729, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-09 00:30:04', '2019-08-09 00:30:04', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"V4WDyIQivpU9Lf2cV74L2CBSg.jpeg\"}}'),
(730, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1395, NULL, NULL, '2019-08-09 00:30:46', '2019-08-09 00:30:46', NULL, NULL, 5, NULL, NULL),
(731, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1396, NULL, NULL, '2019-08-09 00:31:15', '2019-08-09 00:31:15', NULL, NULL, 5, NULL, NULL),
(732, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1397, NULL, NULL, '2019-08-09 00:31:42', '2019-08-09 00:31:42', NULL, NULL, 5, NULL, NULL),
(733, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1398, NULL, NULL, '2019-08-09 00:32:07', '2019-08-09 00:32:07', NULL, NULL, 5, NULL, NULL),
(734, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1399, NULL, NULL, '2019-08-09 00:32:21', '2019-08-09 00:32:21', NULL, NULL, 5, NULL, NULL),
(735, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1400, NULL, NULL, '2019-08-09 00:32:36', '2019-08-09 00:32:36', NULL, NULL, 5, NULL, NULL),
(736, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1395, NULL, NULL, '2019-08-09 00:32:51', '2019-08-09 00:32:51', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"5mqUJJdKG1GxovnHA4d8apS2g.jpeg\"}}'),
(737, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1396, NULL, NULL, '2019-08-09 00:33:04', '2019-08-09 00:33:04', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"rQj1kfEyaKmGuQPtAGc6TB8NF.jpeg\"}}'),
(738, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1400, NULL, NULL, '2019-08-09 00:33:22', '2019-08-09 00:33:22', NULL, NULL, 5, NULL, '{\"image\":{\"old\":null,\"new\":\"jWQn8gEf8MAwz6MOaVl9WotH1.jpeg\"}}');
INSERT INTO `action_logs` (`id`, `user_id`, `action_type`, `target_id`, `target_type`, `location_id`, `note`, `filename`, `item_type`, `item_id`, `expected_checkin`, `accepted_id`, `created_at`, `updated_at`, `deleted_at`, `thread_id`, `company_id`, `accept_signature`, `log_meta`) VALUES
(739, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 23, NULL, NULL, '2019-08-09 01:13:58', '2019-08-09 01:13:58', NULL, NULL, 7, NULL, NULL),
(740, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 59, NULL, NULL, '2019-08-09 01:29:52', '2019-08-09 01:29:52', NULL, NULL, NULL, NULL, NULL),
(741, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 41, NULL, NULL, '2019-08-09 01:34:51', '2019-08-09 01:34:51', NULL, NULL, NULL, NULL, NULL),
(742, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 88, NULL, NULL, '2019-08-09 01:43:34', '2019-08-09 01:43:34', NULL, NULL, NULL, NULL, NULL),
(743, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 89, NULL, NULL, '2019-08-09 01:43:35', '2019-08-09 01:43:35', NULL, NULL, NULL, NULL, NULL),
(744, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 90, NULL, NULL, '2019-08-09 01:43:36', '2019-08-09 01:43:36', NULL, NULL, NULL, NULL, NULL),
(745, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 91, NULL, NULL, '2019-08-11 18:12:22', '2019-08-11 18:12:22', NULL, NULL, NULL, NULL, NULL),
(746, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 92, NULL, NULL, '2019-08-11 18:12:27', '2019-08-11 18:12:27', NULL, NULL, NULL, NULL, NULL),
(747, 63, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 93, NULL, NULL, '2019-08-11 18:12:50', '2019-08-11 18:12:50', NULL, NULL, NULL, NULL, NULL),
(748, 67, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 60, NULL, NULL, '2019-08-11 20:40:33', '2019-08-11 20:40:33', NULL, NULL, NULL, NULL, NULL),
(749, NULL, 'requested', 67, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2019-08-11 20:43:59', '2019-08-11 20:43:59', NULL, NULL, 5, NULL, NULL),
(750, NULL, 'requested', 59, 'App\\Models\\User', 11, NULL, NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2019-08-11 21:23:54', '2019-08-11 21:23:54', NULL, NULL, NULL, NULL, NULL),
(751, NULL, 'request canceled', 59, 'App\\Models\\User', 11, NULL, NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2019-08-11 21:23:59', '2019-08-11 21:23:59', NULL, NULL, NULL, NULL, NULL),
(752, NULL, 'requested', 67, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 00:08:17', '2019-08-12 00:08:17', NULL, NULL, 5, NULL, NULL),
(753, 59, 'checkout', 67, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 00:12:06', '2019-08-12 00:12:06', NULL, NULL, 5, NULL, NULL),
(754, 59, 'checkin from', 67, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 00:13:32', '2019-08-12 00:13:32', NULL, NULL, 5, NULL, NULL),
(755, NULL, 'requested', 67, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1392, NULL, NULL, '2019-08-12 00:14:15', '2019-08-12 00:14:15', NULL, NULL, 5, NULL, NULL),
(756, NULL, 'request canceled', 67, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 00:48:32', '2019-08-12 00:48:32', NULL, NULL, 5, NULL, NULL),
(757, NULL, 'requested', 59, 'App\\Models\\User', 11, NULL, NULL, 'App\\Models\\Asset', 1393, NULL, NULL, '2019-08-12 00:49:27', '2019-08-12 00:49:27', NULL, NULL, 5, NULL, NULL),
(758, 59, 'checkout', 62, 'App\\Models\\User', 11, '', NULL, 'App\\Models\\Asset', 1392, NULL, NULL, '2019-08-12 00:51:42', '2019-08-12 00:51:42', NULL, NULL, 5, NULL, NULL),
(759, NULL, 'requested', 67, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 00:52:04', '2019-08-12 00:52:04', NULL, NULL, 5, NULL, NULL),
(760, 59, 'checkout', 62, 'App\\Models\\User', 11, '', NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 00:52:25', '2019-08-12 00:52:25', NULL, NULL, 5, NULL, NULL),
(761, NULL, 'requested', 67, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1393, NULL, NULL, '2019-08-12 00:53:33', '2019-08-12 00:53:33', NULL, NULL, 5, NULL, NULL),
(762, NULL, 'requested', 67, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1394, NULL, NULL, '2019-08-12 00:54:10', '2019-08-12 00:54:10', NULL, NULL, 5, NULL, NULL),
(763, 59, 'checkout', 67, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 1394, NULL, NULL, '2019-08-12 00:54:25', '2019-08-12 00:54:25', NULL, NULL, 5, NULL, NULL),
(764, 59, 'checkout', 67, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 1393, NULL, NULL, '2019-08-12 00:55:22', '2019-08-12 00:55:22', NULL, NULL, 5, NULL, NULL),
(765, NULL, 'requested', 67, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1395, NULL, NULL, '2019-08-12 00:56:54', '2019-08-12 00:56:54', NULL, NULL, 5, NULL, NULL),
(766, NULL, 'requested', 59, 'App\\Models\\User', 11, NULL, NULL, 'App\\Models\\Asset', 1395, NULL, NULL, '2019-08-12 00:57:25', '2019-08-12 00:57:25', NULL, NULL, 5, NULL, NULL),
(767, 59, 'checkout', 62, 'App\\Models\\User', 11, '', NULL, 'App\\Models\\Asset', 1395, NULL, NULL, '2019-08-12 00:58:49', '2019-08-12 00:58:49', NULL, NULL, 5, NULL, NULL),
(768, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1401, NULL, NULL, '2019-08-12 02:06:05', '2019-08-12 02:06:05', NULL, NULL, NULL, NULL, NULL),
(769, 59, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 1401, NULL, NULL, '2019-08-12 02:06:05', '2019-08-12 02:06:05', NULL, NULL, NULL, NULL, NULL),
(770, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1402, NULL, NULL, '2019-08-12 02:22:29', '2019-08-12 02:22:29', NULL, NULL, NULL, NULL, NULL),
(771, 59, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 1402, NULL, NULL, '2019-08-12 02:22:29', '2019-08-12 02:22:29', NULL, NULL, NULL, NULL, NULL),
(772, NULL, 'request canceled', 67, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 02:25:11', '2019-08-12 02:25:11', NULL, NULL, 5, NULL, NULL),
(773, 59, 'checkin from', 62, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 02:26:16', '2019-08-12 02:26:16', NULL, NULL, 5, NULL, NULL),
(774, NULL, 'request canceled', 59, 'App\\Models\\User', 11, NULL, NULL, 'App\\Models\\Asset', 1393, NULL, NULL, '2019-08-12 02:27:04', '2019-08-12 02:27:04', NULL, NULL, 5, NULL, NULL),
(775, 59, 'checkin from', 67, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 1394, NULL, NULL, '2019-08-12 02:28:33', '2019-08-12 02:28:33', NULL, NULL, 5, NULL, NULL),
(776, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1403, NULL, NULL, '2019-08-12 02:30:58', '2019-08-12 02:30:58', NULL, NULL, NULL, NULL, NULL),
(777, 59, 'create', NULL, NULL, NULL, 'Imported using csv importer', NULL, 'App\\Models\\Asset', 1403, NULL, NULL, '2019-08-12 02:30:58', '2019-08-12 02:30:58', NULL, NULL, NULL, NULL, NULL),
(778, NULL, 'requested', 59, 'App\\Models\\User', 11, NULL, NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 05:36:45', '2019-08-12 05:36:45', NULL, NULL, 5, NULL, NULL),
(779, 59, 'checkout', 62, 'App\\Models\\User', 11, '', NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 05:42:57', '2019-08-12 05:42:57', NULL, NULL, 5, NULL, NULL),
(780, NULL, 'requested', 67, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-12 05:45:10', '2019-08-12 05:45:11', NULL, NULL, 5, NULL, NULL),
(781, 59, 'checkout', 62, 'App\\Models\\User', 11, '', NULL, 'App\\Models\\Asset', 1394, NULL, NULL, '2019-08-12 06:00:49', '2019-08-12 06:00:49', NULL, NULL, 5, NULL, NULL),
(782, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 94, NULL, NULL, '2019-08-12 06:59:47', '2019-08-12 06:59:47', NULL, NULL, NULL, NULL, NULL),
(783, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 95, NULL, NULL, '2019-08-12 07:22:46', '2019-08-12 07:22:46', NULL, NULL, NULL, NULL, NULL),
(784, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 95, NULL, NULL, '2019-08-12 07:23:33', '2019-08-12 07:23:33', NULL, NULL, NULL, NULL, '{\"checked_time\":{\"old\":\"2019-08-12 21:22:35\",\"new\":\"2019-08-12 21:23:08\"},\"updated_at\":{\"old\":\"2019-08-12 07:22:46\",\"new\":\"2019-08-12 07:23:33\"},\"status_id\":{\"old\":null,\"new\":\"6\"}}'),
(785, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 96, NULL, NULL, '2019-08-12 23:43:43', '2019-08-12 23:43:43', NULL, NULL, NULL, NULL, NULL),
(786, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 61, NULL, NULL, '2019-08-13 01:30:42', '2019-08-13 01:30:42', NULL, NULL, NULL, NULL, NULL),
(787, 59, 'checkout', 62, 'App\\Models\\User', 11, '', NULL, 'App\\Models\\Asset', 1151, NULL, NULL, '2019-08-13 01:33:35', '2019-08-13 01:33:35', NULL, NULL, 5, NULL, NULL),
(788, 59, 'checkin from', 62, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 1391, NULL, NULL, '2019-08-13 01:35:21', '2019-08-13 01:35:21', NULL, NULL, 5, NULL, NULL),
(789, 59, 'checkin from', 59, 'App\\Models\\User', NULL, '', NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2019-08-13 19:40:25', '2019-08-13 19:40:25', NULL, NULL, 5, NULL, NULL),
(790, 59, 'checkout', 7, 'App\\Models\\User', 2, '', NULL, 'App\\Models\\Asset', 1, NULL, NULL, '2019-08-13 19:45:03', '2019-08-13 19:45:03', NULL, NULL, 1, NULL, NULL),
(791, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 19, NULL, NULL, '2019-08-13 23:33:55', '2019-08-13 23:33:55', NULL, NULL, 5, NULL, '{\"location_id\":{\"old\":11,\"new\":\"15\"},\"updated_at\":{\"old\":\"2019-07-30 02:32:19\",\"new\":\"2019-08-13 23:33:55\"}}'),
(792, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 32, NULL, NULL, '2019-08-13 23:55:00', '2019-08-13 23:55:00', NULL, NULL, NULL, NULL, '{\"billing_date\":{\"old\":\"1900-11-21\",\"new\":\"2019-08-11\"},\"updated_at\":{\"old\":\"2019-07-29 00:06:24\",\"new\":\"2019-08-13 23:55:00\"},\"user_id\":{\"old\":65,\"new\":64}}'),
(793, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 61, NULL, NULL, '2019-08-14 00:01:18', '2019-08-14 00:01:18', NULL, NULL, NULL, NULL, '{\"updated_at\":{\"old\":\"2019-08-13 01:30:42\",\"new\":\"2019-08-14 00:01:18\"},\"user_id\":{\"old\":59,\"new\":64}}'),
(794, 59, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 62, NULL, NULL, '2019-08-14 00:31:16', '2019-08-14 00:31:16', NULL, NULL, NULL, NULL, NULL),
(795, 59, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Consumable', 4, NULL, NULL, '2019-08-18 19:23:24', '2019-08-18 19:23:24', NULL, NULL, 3, NULL, NULL),
(796, 64, 'checkout', 11, 'App\\Models\\Location', 11, '', NULL, 'App\\Models\\Asset', 1400, NULL, NULL, '2019-08-19 18:56:41', '2019-08-19 18:56:41', NULL, NULL, NULL, NULL, NULL),
(797, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 42, NULL, NULL, '2019-08-21 01:23:48', '2019-08-21 01:23:48', NULL, NULL, NULL, NULL, NULL),
(798, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\ContractAsset', 102, NULL, NULL, '2019-08-21 20:01:34', '2019-08-21 20:01:34', NULL, NULL, NULL, NULL, NULL),
(799, 1, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\ContractAsset', 102, NULL, NULL, '2019-08-21 20:01:46', '2019-08-21 20:01:46', NULL, NULL, NULL, NULL, NULL),
(800, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 4, NULL, NULL, '2019-08-22 02:31:18', '2019-08-22 02:31:18', NULL, NULL, NULL, NULL, '[]'),
(801, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\ContractAsset', 103, NULL, NULL, '2019-08-22 02:34:05', '2019-08-22 02:34:05', NULL, NULL, NULL, NULL, NULL),
(802, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 97, NULL, NULL, '2019-08-22 02:37:14', '2019-08-22 02:37:14', NULL, NULL, NULL, NULL, NULL),
(803, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\InventoryResult', 98, NULL, NULL, '2019-08-22 02:37:28', '2019-08-22 02:37:28', NULL, NULL, NULL, NULL, NULL),
(804, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 63, NULL, NULL, '2019-08-22 02:37:46', '2019-08-22 02:37:46', NULL, NULL, NULL, NULL, NULL),
(805, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\ContractAsset', 104, NULL, NULL, '2019-08-22 02:37:54', '2019-08-22 02:37:54', NULL, NULL, NULL, NULL, NULL),
(806, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\ContractAsset', 104, NULL, NULL, '2019-08-22 02:38:19', '2019-08-22 02:38:19', NULL, NULL, NULL, NULL, NULL),
(807, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Inventory', 26, NULL, NULL, '2019-08-22 02:38:28', '2019-08-22 02:38:28', NULL, NULL, NULL, NULL, '{\"inventory_date\":{\"old\":\"2019-07-01\",\"new\":\"2019-07-01 00:00:00\"},\"user_id\":{\"old\":64,\"new\":1},\"updated_at\":{\"old\":\"2019-07-29 20:48:41\",\"new\":\"2019-08-22 02:38:28\"}}'),
(808, 64, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\ContractAsset', 105, NULL, NULL, '2019-08-22 02:40:56', '2019-08-22 02:40:56', NULL, NULL, NULL, NULL, NULL),
(809, 64, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Contract', 63, NULL, NULL, '2019-08-22 02:41:13', '2019-08-22 02:41:13', NULL, NULL, NULL, NULL, '{\"terms_and_conditions\":{\"old\":null,\"new\":\"\\r\\nTerms and Conditions\"},\"notes\":{\"old\":null,\"new\":\"Notes\"},\"updated_at\":{\"old\":\"2019-08-22 02:37:46\",\"new\":\"2019-08-22 02:41:13\"}}'),
(810, 64, 'delete', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Store', 7, NULL, NULL, '2019-08-22 18:42:08', '2019-08-22 18:42:08', NULL, NULL, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asset_tag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `serial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `physical` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT '0',
  `warranty_months` int(11) DEFAULT NULL,
  `depreciate` tinyint(1) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `requestable` tinyint(4) NOT NULL DEFAULT '0',
  `rtd_location_id` int(11) DEFAULT NULL,
  `accepted` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_checkout` datetime DEFAULT NULL,
  `expected_checkin` date DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `assigned_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_audit_date` datetime DEFAULT NULL,
  `next_audit_date` date DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `checkin_counter` int(11) NOT NULL DEFAULT '0',
  `checkout_counter` int(11) NOT NULL DEFAULT '0',
  `requests_counter` int(11) NOT NULL DEFAULT '0',
  `_snipeit_progressive_motivating_firmware_1` text COLLATE utf8mb4_unicode_ci,
  `_snipeit_customer_focused_actuating_knowledgebase_2` text COLLATE utf8mb4_unicode_ci,
  `_snipeit_self_enabling_6thgeneration_interface_3` text COLLATE utf8mb4_unicode_ci,
  `_snipeit_synergized_grid_enabled_archive_4` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_progressive_motivating_firmware_1`, `_snipeit_customer_focused_actuating_knowledgebase_2`, `_snipeit_self_enabling_6thgeneration_interface_3`, `_snipeit_synergized_grid_enabled_archive_4`) VALUES
(1, 'Macbook Vinx ', '1827163892', 1, '3a9fd0a2-a2ce-3f66-a329-32467f3fc9a3', '2018-12-11', '96.69', '41124360', 7, 'Created by DB seeder', '3aAgIgwEuR0xidcjfSieeiz1p.jpeg', 1, '2019-06-11 01:52:41', '2019-08-13 19:45:03', 1, NULL, 1, 0, NULL, NULL, 4, 1, 11, 'pending', '2019-08-13 19:45:03', NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 1, 2, 2, NULL, NULL, NULL, NULL),
(2, 'Lap VVC', '556266896', 1, '20b47bbe-1ccb-32ff-9ba7-198c376ed74c', '2019-03-21', '153.15', '27324472', 59, 'ahihi do ngoc', NULL, 1, '2019-06-11 01:52:41', '2019-08-12 00:09:40', 1, NULL, 1, 0, 36, NULL, 1, 1, 5, 'pending', '2019-07-01 00:00:00', '2019-07-31', NULL, 'App\\Models\\User', NULL, NULL, 11, 0, 1, 0, NULL, NULL, NULL, NULL),
(3, NULL, '1318237042', 1, '045626c4-5cf8-39b3-b9f7-5ac80dd4f139', '2019-01-15', '2379.63', '3846871', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-08-08 18:59:25', 1, '2019-08-08 18:59:25', 1, 0, NULL, NULL, 1, 1, 3, NULL, '2019-07-05 01:58:34', NULL, NULL, 'App\\Models\\Asset', NULL, NULL, 11, 0, 1, 1, NULL, NULL, NULL, NULL),
(4, NULL, '234142360', 1, '59f22d59-b7f8-3c5b-a4bf-0d23b593bb8b', '2018-09-12', '2835.99', '18455373', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-08-22 02:31:18', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', '2019-08-08 08:49:35', '2020-08-08', 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(5, NULL, '261297886', 1, 'a1267b02-48dd-3c58-9762-0649307efa09', '2019-02-22', '1195.57', '42921750', 11, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-07-10 20:48:03', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, '2019-07-01 00:00:00', '2019-07-31', NULL, 'App\\Models\\Location', NULL, NULL, 11, 0, 1, 0, NULL, NULL, NULL, NULL),
(6, NULL, '730143066', 1, 'e572a7ad-224a-3a76-9772-2da0478c5f57', '2019-01-02', '2720.29', '29811130', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(7, NULL, '1326758311', 1, '8a7e4014-f9d7-3ee6-ae56-c691c5becfd4', '2018-09-13', '1302.64', '48569786', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-07-16 20:16:35', 1, '2019-07-16 20:16:35', 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(8, NULL, '394818905', 1, 'a189334f-40ab-3aa2-8a27-3cd6617ad6cd', '2019-03-06', '2454.08', '31744210', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(9, NULL, '964396994', 1, '0b96d5e0-2858-34ff-a75d-1eb6dcad05c8', '2018-10-16', '779.38', '14138519', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-08-08 20:25:01', 1, '2019-08-08 20:25:01', 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(10, NULL, '677939381', 1, '2b2db81e-e63c-32c3-bcaa-a48268cb88ce', '2019-02-16', '613.03', '34458006', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-08-08 18:57:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(11, NULL, '71575827', 1, '0b015fc1-a693-3bb4-b781-99346124de2c', '2018-08-30', '1660.87', '10210399', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(12, NULL, '1463368670', 1, '56c65688-6dc1-39a1-915f-4ba82ca64147', '2018-07-10', '2556.07', '21551407', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(13, NULL, '1247144547', 1, '448ad87b-e8b8-3623-b118-4ca333d2e422', '2018-08-12', '443.52', '20479133', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-08-08 20:21:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(14, NULL, '1356697159', 1, 'd707519e-664d-3c59-8d17-c265fc9d2a06', '2018-12-15', '865.25', '6245113', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(15, NULL, '1549906665', 1, '05c7464b-e51e-39fe-93d9-bd17247660b5', '2019-01-27', '2958.75', '27817793', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(16, NULL, '9635466', 1, '9b0f4d41-2f29-3f1b-a9b6-ce0d2cf7479a', '2019-03-23', '893.92', '38510338', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(17, NULL, '899390185', 1, '086e966d-3a53-3cea-8005-b256c91cc2cc', '2018-09-21', '2437.49', '47660124', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(18, NULL, '771956871', 1, 'c7fe720e-1345-3f00-8799-1bc63aaba97a', '2018-07-18', '449.78', '39063321', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(19, NULL, '336214568', 1, '77e7692a-0e01-37ee-a3ff-925298884d11', '2019-02-21', '2708.21', '34333436', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(20, NULL, '366851560', 1, '38d86a18-425d-3c3c-a8f4-37d91ad6d919', '2018-08-26', '1001.96', '45309971', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(21, NULL, '1364448645', 1, '3d474d07-e6a4-36ac-a0e5-2c6104d484e7', '2019-03-11', '1702.09', '9257288', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(22, NULL, '1514490738', 1, 'e1e5d5a4-cef8-359a-92e4-e0e6812bc46b', '2019-03-21', '1471.99', '15993582', 8, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(23, NULL, '1098470969', 1, 'a4a278ba-96d2-381c-86a8-16a24ef453cf', '2018-07-01', '904.66', '9335220', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(24, NULL, '563103659', 1, 'f6fb4db4-9457-3230-bead-ef80b9ff084f', '2019-06-10', '2965.38', '34593907', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(25, NULL, '632509790', 1, '921541d8-5228-3acd-9e24-b19b4dd40630', '2019-03-13', '2134.75', '22450551', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(26, NULL, '4663205', 1, '2341c2e3-2c6b-3ac4-8211-cde015cca8f8', '2019-02-28', '2147.32', '5355463', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(27, NULL, '899495486', 1, '0b045a51-1c0c-37aa-a825-256de47bfd31', '2018-07-26', '2289.12', '39176180', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(28, NULL, '1032595035', 1, '3599106f-2068-3060-82cf-2437acddb3b2', '2018-11-25', '2287.01', '4843409', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(29, NULL, '78443820', 1, '33a1f1e7-ec99-338f-9ad5-9da87455607e', '2019-01-02', '1083.82', '10154110', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(30, NULL, '1283127629', 1, '63e1916d-9145-3df8-9d8e-1e555a0776bd', '2018-12-31', '946.40', '19953386', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(31, NULL, '1507507890', 1, 'b4ea1b66-bdf2-3d56-b5ce-16bf57c539b5', '2018-11-28', '1374.11', '42316403', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(32, NULL, '1486487135', 1, '65cf1893-3bd5-3b87-87a9-ddabe3108794', '2018-12-29', '1833.37', '20745530', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(33, NULL, '1437588431', 1, '5e656a47-5d30-351c-86dc-189f27ddffdf', '2018-10-27', '2325.91', '24407670', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(34, NULL, '108384605', 1, '02d700e0-e1d4-3e48-94bb-f6a9940eebca', '2018-10-15', '582.62', '41924675', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:41', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(35, NULL, '993016743', 1, '511a04d9-9d65-399b-b28f-e2b3ea3e43b7', '2018-10-28', '2191.97', '4611989', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(36, NULL, '1095154289', 1, '2c6e13e9-ccb4-3c86-90dd-3fd25740be75', '2018-11-25', '325.51', '14856418', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(37, NULL, '27953678', 1, '91c1733f-ca64-3d90-a200-e697f4ef8404', '2018-06-13', '1390.39', '40344911', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(38, NULL, '1446404115', 1, 'd32a8c26-e493-3509-b290-2146dddfcd9b', '2018-12-23', '528.17', '4948518', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(39, NULL, '249495628', 1, 'c58229e8-d20c-3fa4-819f-6dd5c968da5c', '2019-06-03', '626.84', '26565312', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(40, NULL, '27350435', 1, 'd4fc6f6e-6fff-3ca0-becc-94410a30bc36', '2018-12-27', '2022.95', '14808299', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(41, NULL, '383067427', 1, '1b054e19-6aa5-3828-853e-0927b19be8e5', '2019-02-02', '1642.68', '15028257', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(42, NULL, '370186335', 1, '5838af94-cfcd-3b42-9fad-16424a84c032', '2018-09-16', '2773.61', '32158573', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(43, NULL, '1296523131', 1, '1db10d6a-bfd6-3bee-a061-f577672ed04d', '2019-03-20', '1459.19', '20979473', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(44, NULL, '909160000', 1, '85906239-6b4a-37d0-8039-ea9e1c538d3c', '2018-11-21', '1246.30', '16595478', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(45, NULL, '563971007', 1, 'fdc07634-3665-3f25-83c8-c853c4579cbe', '2018-08-11', '1002.67', '10980216', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(46, NULL, '768102327', 1, 'ecd3abb0-4e01-3d45-97ea-6fa5c45d3838', '2018-11-06', '1891.16', '15436708', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(47, NULL, '1144830363', 1, '9b6bb520-13be-3636-950a-0d41ed1d3ff3', '2019-04-17', '350.83', '14446114', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(48, NULL, '833353572', 1, '1a712554-34b9-3b05-9df2-93a418c78d9f', '2018-10-31', '1026.25', '12331205', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(49, NULL, '718127326', 1, '6728f948-600c-3917-813c-3253a0357ae8', '2019-02-16', '1391.26', '22767172', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(50, NULL, '227668061', 1, 'c6654fb4-6538-3a22-b154-8ffc8f6c27cf', '2018-11-18', '2292.54', '38677440', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(51, NULL, '1489814411', 1, 'b1fe2648-fdf7-37da-b330-70887837c902', '2018-09-14', '2972.32', '35812343', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(52, NULL, '950064566', 1, 'cf0c784b-1d22-3f38-b3e0-ff312336a9e9', '2019-01-04', '953.87', '12696096', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(53, NULL, '788411533', 1, '4d3a05b2-ba25-3bcf-a4dc-f5db8978e277', '2018-07-22', '2676.66', '33285759', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(54, NULL, '337683437', 1, 'aad3b024-a9e8-3187-bbf7-f04db765272a', '2018-10-07', '855.11', '41096631', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(55, NULL, '252354194', 1, '9cdeb173-83c1-3378-84a4-834d9c2b710a', '2018-06-27', '2510.19', '33955960', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(56, NULL, '692771839', 1, '38c35e2f-33d3-3883-88d5-3f3bbf6c0910', '2018-06-18', '2871.22', '21237793', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(57, NULL, '674934663', 1, '8bfb96b2-e463-3306-97f7-21b96a8b87a4', '2019-05-17', '1399.36', '47040256', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(58, NULL, '287806198', 1, '5af6fe64-fa33-3476-97ff-fc3cb9223c11', '2018-06-23', '2691.08', '15991908', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(59, NULL, '193172003', 1, '88076abc-be2d-3ac9-be64-d88b1ded6063', '2019-02-04', '895.72', '1477760', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(60, NULL, '1342211398', 1, '7d513755-062c-3285-b6e0-cda095da1869', '2018-11-15', '2309.84', '37089010', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(61, NULL, '1000911231', 1, 'c593e763-8c5e-3414-b7f4-d26ebaf14e72', '2019-04-27', '1155.72', '42699831', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(62, NULL, '1016260195', 1, 'b61cc13b-e127-3f4d-a9d1-964f9790fc2a', '2019-04-03', '1658.61', '18382126', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(63, NULL, '1213684712', 1, '40d9b724-750a-354a-a63f-06772b3e7586', '2019-01-17', '1531.73', '6019651', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(64, NULL, '807584890', 1, 'bc753b42-3ccf-3430-8c12-e2d6bdfd2b80', '2019-02-18', '2865.96', '15747234', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(65, NULL, '984979233', 1, '05be77a1-bf05-37f3-adfd-a103215ccc24', '2018-07-25', '2121.75', '31601741', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(66, NULL, '398329444', 1, 'fdbf21fb-d33f-3024-936d-22fcb7005f4f', '2019-03-26', '2271.20', '22905959', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(67, NULL, '416780409', 1, '6bc6e7d5-7eea-3cfe-a75c-23efc69054c2', '2019-02-16', '2621.43', '42251790', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(68, NULL, '1401508894', 1, '0795e661-3a6a-3cfc-9ae8-d325cd5c46ed', '2018-12-22', '1927.35', '26900999', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(69, NULL, '1408033373', 1, 'c9b9edd3-faa5-3356-a1f9-f4a481e3cad6', '2019-04-22', '2209.60', '31914067', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(70, NULL, '332778327', 1, '5251cf4d-99d1-3d8d-9c44-1a761da8ed31', '2019-03-22', '375.64', '22231429', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(71, NULL, '201065580', 1, '1f83fa57-047c-352b-bcb2-68fc851fea89', '2019-04-11', '2405.27', '25862014', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(72, NULL, '1545747891', 1, '3355d5b3-41e6-3d0a-a5ec-9b83eeb3e8b1', '2019-02-20', '2422.94', '34734159', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(73, NULL, '1324251079', 1, '3f2c3eee-6619-3cbf-b2c5-9444878d8ebc', '2019-01-01', '375.44', '7247176', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(74, NULL, '12063559', 1, 'd025254b-550b-387d-98b0-446a2150d8b7', '2018-08-03', '1193.70', '15812237', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(75, NULL, '1156660928', 1, 'af2015f9-cd38-38b1-94be-127ce8bf5d9c', '2019-01-16', '2306.85', '30059930', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(76, NULL, '1109149757', 1, '6ffe6eb9-421a-33f6-b5c4-bed29ac546d2', '2019-04-23', '1307.88', '3058187', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(77, NULL, '717608832', 1, '5fd5de81-83f6-36ff-a0b1-2d8edce96aab', '2019-02-24', '900.84', '47036859', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(78, NULL, '218690511', 1, '26855a3c-addb-37bf-a555-79a6746cd792', '2019-01-19', '1618.68', '42051934', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(79, NULL, '1190404280', 1, '310518f4-74ee-35b1-b4a7-258503ce328d', '2018-09-25', '1369.50', '43485287', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(80, NULL, '1007276007', 1, 'b1a7c7b0-88fa-399d-9b8d-698a18bf1a78', '2018-12-09', '689.86', '15396582', 8, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(81, NULL, '1486675890', 1, 'ff6be279-005a-3432-b3c0-93b200aa7a0a', '2018-12-11', '2887.58', '27626278', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(82, NULL, '1393116968', 1, 'd7c97cb8-dc5d-3013-a7a0-f53a6161b61e', '2019-01-23', '2605.26', '29793630', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(83, NULL, '1153908752', 1, 'b67ec9b3-ba17-36d9-85e5-82cbdd39d840', '2019-03-07', '2326.84', '48364973', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(84, NULL, '829614502', 1, '514065ea-a721-3ecb-8c55-beb89ef84685', '2018-09-07', '2486.41', '43447479', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(85, NULL, '283422096', 1, '16dc9eec-55f9-3072-99b5-77d887360695', '2018-10-09', '1637.33', '8795484', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(86, NULL, '769436825', 1, '920f478a-90bb-3a6a-9873-a008730b5cbe', '2019-04-05', '1832.58', '19258048', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(87, NULL, '724092331', 1, '4b684af4-2a7f-3bc1-a24f-feaafb99795a', '2018-06-22', '979.67', '30666331', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(88, NULL, '636579884', 1, 'e8f4cc91-e3c3-3e05-9fb2-3df61b271367', '2018-07-25', '1573.75', '22573278', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(89, NULL, '634392487', 1, 'b3040d76-585b-3d2e-8bda-8751f7be7978', '2018-11-25', '2606.21', '2183004', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(90, NULL, '171326454', 1, 'f539891f-416e-3474-9669-6f3cc71b8a36', '2018-07-21', '1466.37', '2318446', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(91, NULL, '1286018293', 1, 'cabac095-a8f7-38a9-b7c0-8a6f7367e648', '2019-03-04', '2427.16', '11568200', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(92, NULL, '1023053031', 1, 'd31fdc1c-d53d-3834-87ae-9000c238d068', '2018-10-22', '2756.22', '39337018', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(93, NULL, '318290484', 1, '44a32056-0808-31cf-bec6-cedf9e36eeb9', '2018-12-28', '976.66', '39948757', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(94, NULL, '240064010', 1, 'a2b398f4-e936-34f4-979b-dc0615bd9e64', '2019-05-30', '2922.89', '29207873', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(95, NULL, '1041378159', 1, '4bf91e5e-be09-3584-93f4-690e7b3f503d', '2019-05-14', '2537.07', '9857487', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(96, NULL, '893880466', 1, 'd52fc3f8-084f-3651-ac26-ea12127825d1', '2018-11-06', '954.23', '48988071', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(97, NULL, '10140153', 1, 'd6658f6d-b95f-3523-a7dc-5c8b7543bf6f', '2018-12-01', '1880.39', '22268066', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(98, NULL, '1136846139', 1, 'bae8c9c7-9262-3d7c-a4a8-e5f740470686', '2018-06-28', '509.62', '33807807', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(99, NULL, '326952076', 1, '684a7cca-effb-31af-b2d4-ab368ca8f02d', '2018-12-31', '830.85', '30370281', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(100, NULL, '280825984', 1, 'cbc438a4-7034-3df2-923b-c1fa47122101', '2018-08-26', '2737.62', '19164317', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(101, NULL, '1364121117', 1, '2fbf5bb2-0bbf-3c59-b051-1bd08c3c2223', '2018-08-23', '1057.03', '31248031', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(102, NULL, '1510119043', 1, '1f2aa6d9-07c8-3f24-a1b1-5456aae86177', '2018-08-13', '1486.60', '30453445', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(103, NULL, '1281031262', 1, '0c2a1ef1-9c63-340e-afec-b7bbbf66e78a', '2019-03-17', '734.46', '8093025', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(104, NULL, '1260773230', 1, '4b3b0c0f-f70f-3472-8b23-de875ee5fb38', '2018-07-02', '2444.83', '16208227', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(105, NULL, '1175135030', 1, 'efec9318-3ef0-3a10-ac5b-15d60dffc50f', '2018-09-28', '460.39', '4753626', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(106, NULL, '346520071', 1, '4298cf52-0e01-3439-bf70-8ce3470f79ff', '2019-02-19', '2776.49', '10906403', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(107, NULL, '86377329', 1, '11e1c394-ac52-3345-9b82-975b976f8af0', '2018-12-13', '683.10', '30545952', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(108, NULL, '189790958', 1, '0c682048-0c2e-33ed-a5b5-9665e6a3d8f1', '2019-03-28', '793.79', '46367341', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(109, NULL, '953004239', 1, '8ea2720c-fd57-3526-84ab-09db27f16214', '2018-12-18', '2901.03', '27080751', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(110, NULL, '1337696126', 1, '93c404f3-3669-3087-8967-b7b545ae8c07', '2018-10-19', '1081.86', '20670866', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(111, NULL, '923178442', 1, '4217887d-a137-340d-a6a2-3e22b8ce0c18', '2019-03-30', '2924.89', '12038961', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(112, NULL, '18390682', 1, '8367d867-b5d9-3c8f-9d9d-5150893f7277', '2018-12-09', '385.42', '5445501', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(113, NULL, '1463061414', 1, 'abcbed2b-4bcb-3878-a643-f251aec1bc81', '2018-12-27', '2646.71', '22653719', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(114, NULL, '926178200', 1, '08050412-b203-3129-bf77-615c48c656ef', '2018-09-03', '544.59', '15842650', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(115, NULL, '512853717', 1, '11faa9b1-7c90-3737-9b68-10f87b51c138', '2019-05-24', '902.76', '41796101', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(116, NULL, '1420453072', 1, 'd5cd5f42-5525-329f-a143-c089ee2bbb86', '2018-06-18', '2913.07', '39365794', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(117, NULL, '1383336362', 1, 'c1954b2f-4e5d-3f7a-bf51-23c5ae2983df', '2018-09-02', '894.73', '12780316', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(118, NULL, '1163701894', 1, '569094f3-7c13-3ee8-9dcf-b6a4e183fe0d', '2018-09-27', '1190.78', '19347594', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(119, NULL, '141659167', 1, '60e349bc-1946-35ec-8264-12a3f03a4f4a', '2018-12-01', '2657.24', '49743207', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(120, NULL, '1542339594', 1, 'c6e297ff-adf7-3b2b-8f80-72c653abbdf7', '2019-05-09', '1207.39', '39791584', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(121, NULL, '474112971', 1, 'd5106994-c347-3cec-bc62-242d4f0ab325', '2019-02-01', '1426.18', '24132638', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(122, NULL, '1210138901', 1, '05d64c62-1c2e-3dd3-a97e-3b4ee9ea49b4', '2018-07-30', '750.15', '16003053', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(123, NULL, '268603148', 1, 'bdb87d55-3126-38db-b259-09ced76f5ecb', '2018-12-20', '559.44', '46803673', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(124, NULL, '1176425184', 1, 'efaeed0d-ec70-3d81-b6b4-a9f18cba8c93', '2019-05-10', '2308.85', '31877204', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(125, NULL, '506220688', 1, 'b2fc20af-8891-3341-a36d-4aaef2868266', '2018-11-09', '2249.26', '18991915', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:42', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(126, NULL, '1272563418', 1, '80c692bf-7289-32f9-8186-2f44dfb32862', '2018-08-31', '994.18', '36363057', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(127, NULL, '287662365', 1, 'd27e97f9-9b5d-3ab5-8bcc-7a834b9a878e', '2019-02-08', '1165.71', '23137369', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(128, NULL, '1268462372', 1, '03bf97a6-4dca-35fa-9abc-ff0e317460dd', '2019-04-29', '1809.78', '8715673', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(129, NULL, '936522173', 1, '369c28fc-a873-3918-91ee-f41125e490ce', '2018-08-25', '2209.49', '20342871', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(130, NULL, '1419203578', 1, '6ce93716-ec06-3148-9170-a04c4b7c1f20', '2019-03-13', '2328.26', '49222969', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(131, NULL, '902923393', 1, '4dcf1e19-641c-3d2e-addc-f534c7139716', '2019-06-07', '1462.43', '14116326', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(132, NULL, '1097465006', 1, '83a90c8f-bb31-3f7a-a814-657f4aea8f58', '2019-04-24', '353.33', '2687495', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(133, NULL, '1482114103', 1, '81754f97-d56c-361a-8e2e-8183f3024181', '2018-08-01', '2042.59', '24793239', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(134, NULL, '895104129', 1, '87c67bf4-9716-33e4-bf7a-081a4bf91e84', '2018-06-16', '2515.19', '2003641', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(135, NULL, '740356015', 1, '37336b61-983c-3b7f-89af-7b9a5c288891', '2018-08-01', '1965.25', '11806957', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(136, NULL, '278245654', 1, 'ae500748-33d8-3919-a5e6-8c09ceb0e00b', '2018-08-02', '2006.79', '3107401', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(137, NULL, '182593861', 1, '529d3bd3-c894-33cd-90ac-2c31c1a131c1', '2018-08-01', '2201.19', '27234673', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(138, NULL, '108762533', 1, '78517f7d-bbdd-3df0-87b9-51dfdeea974b', '2019-01-14', '587.97', '46975046', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(139, NULL, '155296357', 1, '8e26d98f-bd96-372e-8673-43db3a0f9b81', '2019-04-23', '968.03', '40060677', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(140, NULL, '1336000597', 1, '2e8bc51a-1337-37e9-aac7-ddff93c7a391', '2019-04-04', '2588.00', '36415483', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(141, NULL, '1324586216', 1, 'a63f736d-bae0-3604-bc56-173a74e7ce01', '2019-01-04', '850.75', '45779231', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(142, NULL, '1269554140', 1, '350978b0-0dc4-39a1-b2aa-e9096268702c', '2019-02-19', '2590.01', '20680647', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(143, NULL, '772237815', 1, '79969b47-a671-344b-bda5-7615bccd3075', '2018-09-03', '1565.54', '16956263', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(144, NULL, '1468119240', 1, '1a1eb856-b08d-3ac1-8830-226c02716af9', '2018-12-06', '1285.95', '17609831', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(145, NULL, '215982358', 1, 'fd1727ad-b84c-3e72-af34-d3b271690db0', '2018-09-18', '1770.19', '29122579', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(146, NULL, '591928455', 1, '94646b4f-09a9-34bd-9d2b-00b45fa27643', '2018-06-26', '962.34', '20062311', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(147, NULL, '803942459', 1, 'baa3a774-f7ab-3b32-bafd-3a130eded7dd', '2019-04-22', '2350.17', '30454977', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(148, NULL, '1519062376', 1, 'ef1d5a89-469e-337f-ac45-66ef4211e420', '2018-10-26', '1537.79', '7355042', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(149, NULL, '621942790', 1, '465c74a8-f815-3217-ab12-fa7127fdbc12', '2018-11-08', '2737.52', '22979619', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(150, NULL, '1375888318', 1, '26770053-0ac4-30ee-96a5-894aad9cd6c9', '2018-09-17', '1653.76', '43642798', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(151, NULL, '692861480', 1, 'b8b8c935-ff54-3ffa-8dc0-333a9d170c3c', '2018-09-10', '942.40', '36172783', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(152, NULL, '839787747', 1, 'a29edfa9-05fa-386d-a770-85efd88649df', '2018-08-12', '2460.19', '13452207', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(153, NULL, '1489440249', 1, '5ba8df0b-acc4-3152-8541-3a4e8429e7d2', '2018-10-16', '1063.91', '46480894', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(154, NULL, '1380725968', 1, '509de421-3821-372f-8810-9b4e244bbe19', '2018-07-28', '1075.61', '49506113', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(155, NULL, '470811264', 1, 'd44af442-f90e-354a-899f-9003b2703a5c', '2019-04-10', '1283.76', '48708618', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(156, NULL, '1551556938', 1, '10e090a1-edeb-3b96-8092-10f13ee29544', '2018-10-31', '695.12', '23338963', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(157, NULL, '868276760', 1, 'a206e1b2-2412-3f60-9bb5-bec888ea7afc', '2018-12-29', '1686.82', '26643932', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(158, NULL, '494500131', 1, 'e64be595-be3f-3b3b-a290-5ae6d51b1649', '2019-02-07', '1131.74', '36251482', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(159, NULL, '1462648978', 1, '865adc5b-7a7d-33d0-9fac-4a1e02075007', '2019-06-04', '2177.97', '36669365', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_progressive_motivating_firmware_1`, `_snipeit_customer_focused_actuating_knowledgebase_2`, `_snipeit_self_enabling_6thgeneration_interface_3`, `_snipeit_synergized_grid_enabled_archive_4`) VALUES
(160, NULL, '530987821', 1, 'f21a040f-3958-3abb-b68e-8216e94b2934', '2018-12-12', '2962.48', '8733245', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(161, NULL, '60412113', 1, 'e3b5694d-6ac9-3a06-a89b-3be820a898ae', '2018-10-13', '1865.34', '25876684', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(162, NULL, '328156944', 1, 'df145476-c094-3bcc-bf40-4f264c4cdbdf', '2018-08-19', '621.81', '4780712', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(163, NULL, '1474094615', 1, '666cad99-bd21-3f9a-b856-d960b8942400', '2019-04-20', '2593.63', '40857540', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(164, NULL, '459780756', 1, 'c0eed8aa-893b-349f-b7e6-d8cb624da1f3', '2018-08-25', '1761.73', '13231655', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(165, NULL, '33631648', 1, 'b0b402cf-1489-372b-bcf9-5b62dbad51ce', '2018-11-22', '1612.56', '36142178', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(166, NULL, '1382771648', 1, '6689e00b-3eed-330f-a4d5-164da096c165', '2019-05-07', '2970.58', '47534428', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(167, NULL, '930029504', 1, '26fe6517-7d94-3112-987d-0fd4aa494892', '2018-09-16', '1981.07', '36853690', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(168, NULL, '1162088389', 1, 'd96b367c-b1ce-3e2b-b650-a2dbd2f506a5', '2018-08-28', '2904.73', '39215496', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(169, NULL, '553827468', 1, '63b37ffb-2eaa-36e8-98c0-87384b5d7cd9', '2019-02-09', '349.48', '43317351', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(170, NULL, '1091806310', 1, 'd71fc5e5-a251-3f1b-9be5-7783e588d14a', '2018-07-20', '2772.62', '15146533', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(171, NULL, '1544736775', 1, '9d0c3651-fa6b-34b0-9fad-4e36366fc841', '2019-04-06', '949.84', '22310041', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(172, NULL, '932476579', 1, 'bb5dd17a-d254-34d1-ae5a-5ca151e6be0e', '2018-07-03', '1343.24', '18645020', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(173, NULL, '660436909', 1, '838ff116-0f82-3740-963e-ae769b713d5c', '2018-07-28', '1720.45', '40429562', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(174, NULL, '1448385270', 1, '39eba18c-dea1-364c-8aec-1935b583b1bb', '2018-08-06', '2140.97', '42703949', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(175, NULL, '1489839257', 1, '6b2759a4-421a-3d04-a4d3-d7840d4663e8', '2019-05-24', '1863.73', '11686884', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(176, NULL, '1109813057', 1, 'fd9d2cf0-7be6-3905-a988-a1291945763a', '2019-03-23', '2822.39', '49821392', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(177, NULL, '886771132', 1, '81378102-f8e6-376c-8751-6fe86ed8f169', '2019-04-30', '1810.21', '11386479', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(178, NULL, '854382474', 1, '60805af7-151f-3b58-8a83-aae5e143763d', '2018-11-08', '2446.01', '17093794', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(179, NULL, '1312263683', 1, '0f0a02c4-9722-395f-8c45-0553407bda68', '2018-08-26', '1867.69', '37103920', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(180, NULL, '1341400429', 1, '98c45403-3e87-3cf8-9156-83a4cf538533', '2019-02-11', '403.28', '35170290', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(181, NULL, '302337190', 1, '03cd5646-4964-375b-93ab-4e0b11043fdf', '2019-04-03', '814.77', '3855146', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(182, NULL, '1206632110', 1, '85aed207-d252-300c-9d1c-c1ec0889dffb', '2019-02-07', '2431.68', '15169441', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(183, NULL, '409088025', 1, '31cc7981-df40-314e-b2ef-a9d7b9c0059c', '2018-10-08', '1733.56', '14443740', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(184, NULL, '840695601', 1, 'db8035d4-f83d-370c-978d-04d673c91fef', '2019-02-08', '818.36', '49309265', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(185, NULL, '110404349', 1, '895a4629-d3a9-3c8d-800e-33ea7a5e3c19', '2018-08-15', '1867.18', '14486563', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(186, NULL, '423585836', 1, 'e7b7ca2f-4e42-3e57-a786-ed39d96a40b9', '2018-12-08', '2960.31', '43191664', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(187, NULL, '203503045', 1, 'd973dd37-97b6-3abd-b7ac-8c19614a78e9', '2019-04-06', '1747.34', '2224978', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(188, NULL, '1302294298', 1, 'd3b12b55-0f26-3c99-ab77-0773ea017a00', '2018-09-24', '1770.47', '27714768', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(189, NULL, '1195009426', 1, 'f1ba90bf-3b89-3cb2-a4df-a12406be0cdd', '2018-09-09', '827.20', '40677348', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(190, NULL, '1293098522', 1, 'bd5d9d56-8f62-38b0-ba22-f19aaa12702b', '2018-11-15', '2636.06', '21785859', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(191, NULL, '1001158501', 1, '3a3ee9ca-cb89-3e76-99a8-20c12103db17', '2018-09-26', '1237.62', '42665890', 10, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(192, NULL, '869953884', 1, '18140709-1daf-3f40-abf3-21a92a16bcd0', '2018-09-29', '527.81', '16671932', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(193, NULL, '45562747', 1, '4a16851d-87d3-33db-9103-86c226d44421', '2019-01-08', '983.03', '26629915', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(194, NULL, '1274618080', 1, 'ce48d5dc-098a-3e4a-9607-10436837c9fe', '2018-08-12', '760.71', '39072762', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(195, NULL, '10382768', 1, '2d8a4e27-3256-381e-8cf2-2a62209d658a', '2019-05-28', '422.06', '25310606', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(196, NULL, '1203117729', 1, '47448598-55ee-34c5-b1aa-16a7eabb3814', '2019-04-07', '2161.67', '32691883', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(197, NULL, '477006467', 1, '7e44860b-5594-36ec-832c-842c1d550acc', '2019-04-17', '2876.94', '49451244', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(198, NULL, '959449478', 1, 'f1972d0b-4557-33f1-9ebd-98c6bf37448d', '2018-11-15', '2624.66', '4824737', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(199, NULL, '500815411', 1, 'c21cf712-b191-3781-b5fb-702d7a398411', '2019-01-22', '1854.07', '40386518', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(200, NULL, '822240023', 1, 'bdce7482-d9f8-3555-89fa-2bbbf6f3a541', '2019-04-21', '638.17', '14788202', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(201, NULL, '1319986633', 1, '3f06483c-d53c-3838-838c-dfd9181fb383', '2018-10-29', '1580.87', '36306432', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(202, NULL, '1361701887', 1, '14d1cb25-ee66-3af3-b566-41ec1a0099b7', '2019-05-12', '2373.37', '13319449', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(203, NULL, '665634635', 1, 'c56452b5-9c1f-3bae-8bf9-1f94acd86b33', '2018-07-19', '806.67', '16904932', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(204, NULL, '754409951', 1, '29efe021-5fd0-352c-9ab2-eef664dde503', '2018-10-01', '1913.97', '23512423', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(205, NULL, '1482583949', 1, '83c50913-9041-3055-b6b9-a95788c32939', '2018-12-01', '1093.30', '27657422', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(206, NULL, '1191828895', 1, 'cbc9c99f-25e3-3710-be74-b3d3a281f762', '2018-12-25', '861.06', '39770301', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(207, NULL, '1475045921', 1, '292924bf-3acc-35de-b0eb-81c06c635288', '2019-04-23', '764.59', '33817293', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(208, NULL, '362314595', 1, '91b656cb-2db8-3ac4-a900-65bc3359cacd', '2019-02-28', '1145.53', '10501402', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(209, NULL, '938448094', 1, 'e6c5692d-9830-39d7-b627-fbba7ae9c242', '2018-08-22', '1095.26', '6579369', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(210, NULL, '1508100523', 1, '95a6c389-5992-396d-b243-1c13ac254ce5', '2019-04-27', '1331.42', '33686099', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(211, NULL, '1407815757', 1, 'd29dfedc-44fa-3bfa-8fd6-b2be5e388d08', '2019-05-27', '1636.06', '9945864', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:43', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(212, NULL, '1496017519', 1, '7cb228f3-4552-36ac-b6a1-b6199f39fc26', '2019-05-28', '2527.60', '6675701', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(213, NULL, '1488399017', 1, '256f2f19-6aea-3146-9d58-dd5c96f6d217', '2018-08-13', '2751.72', '39001782', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(214, NULL, '1537279101', 1, '1c521021-fbb2-32b2-9b73-ca9f1c44c9f9', '2019-04-24', '463.87', '34737143', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(215, NULL, '792964671', 1, '3ad17e8c-2c04-3238-846e-94b561c045f3', '2019-02-14', '2428.74', '40946432', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(216, NULL, '1400324220', 1, '06ee58ec-05d0-36da-8f72-9ccff129bb9c', '2019-03-18', '2793.70', '30931915', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(217, NULL, '323971659', 1, '15e8b033-bb25-3158-963b-f208d5264b44', '2019-05-21', '1891.88', '39733150', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(218, NULL, '1076091137', 1, '5354c6d6-5e98-324e-874e-54b5af9fabe9', '2019-01-23', '1827.67', '8820021', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(219, NULL, '1002042247', 1, '34f09f5e-68c5-33f1-b88a-f170de701537', '2018-09-09', '2707.74', '6316414', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(220, NULL, '1427807412', 1, '73735729-25fa-34ba-8087-9cfef2de0dc1', '2018-12-23', '1131.45', '28094900', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(221, NULL, '1323050887', 1, '48b1076f-9f4d-34a7-90db-ec7e7278b7d1', '2019-04-04', '2693.26', '34161869', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(222, NULL, '968726356', 1, 'e4786e52-e38f-3a61-a3f4-9f594ca92580', '2018-07-25', '1758.21', '11741250', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(223, NULL, '727144911', 1, 'c4d83b65-3c49-368d-8e9b-ae7384257310', '2019-05-30', '2428.07', '14280315', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(224, NULL, '230299124', 1, '7b0a0078-6711-32c5-b49b-9e2f4297aa59', '2018-08-09', '671.77', '3898832', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(225, NULL, '526286847', 1, '03ed7687-782f-3de0-81a2-362521225f96', '2018-08-10', '385.75', '6475408', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(226, NULL, '1398895479', 1, 'eb4b5ad1-247d-3c2c-8ab1-ca84f145a54c', '2018-12-14', '1048.72', '26189791', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(227, NULL, '476515251', 1, '28b921d9-3f90-3609-9421-60cb0905a30c', '2019-05-12', '2540.97', '33292102', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(228, NULL, '1501068251', 1, 'ac80f4c1-b34d-3284-a372-3a57b0586610', '2018-06-28', '2265.11', '19479136', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(229, NULL, '1230452698', 1, 'fa808f1e-073b-3055-8d84-6314e2c53c3d', '2018-07-11', '2449.71', '42515038', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(230, NULL, '1195864607', 1, '66d6e8c2-e70e-387c-a26e-bef409199b28', '2019-04-11', '2799.06', '5038457', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(231, NULL, '797403727', 1, '69e4ffd2-57cb-3965-a43b-8ed80c150f88', '2018-10-27', '529.55', '2430916', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(232, NULL, '987061608', 1, '02859a3a-4380-3879-a026-6bccb345f43f', '2019-03-02', '2403.45', '11078887', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(233, NULL, '1545831084', 1, 'ba6c796f-cab9-3b33-88f5-b5de471efada', '2019-06-10', '550.53', '20484895', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(234, NULL, '1353640040', 1, 'fd8d57ee-f479-3204-971e-f97246bb38c5', '2018-09-03', '1097.90', '2589615', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(235, NULL, '585076579', 1, 'a128cb3d-caa5-31e6-946c-65f6d105e14a', '2018-07-25', '1318.10', '46337380', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(236, NULL, '668367498', 1, '3a65c6b6-65c9-3eaf-b968-7689be0c22b5', '2019-04-01', '2328.69', '37604984', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(237, NULL, '1524648234', 1, 'ef75d573-fea0-3eac-9c79-9c508d5fb73b', '2018-09-25', '716.76', '15077516', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(238, NULL, '595159039', 1, 'f5b68879-fe51-3d35-a455-5e6fb8d351ac', '2019-05-02', '2612.40', '16809628', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(239, NULL, '87167235', 1, '2a5f2e36-63dd-34e2-be96-4e2112ff72c1', '2019-03-03', '2069.20', '33488364', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(240, NULL, '1052135698', 1, '3844ba88-c1b2-3c33-aac9-b7bf17f36c55', '2018-12-12', '2389.47', '44509750', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(241, NULL, '583721129', 1, '99172b6e-5468-3f47-88b8-f4ae027e7cd3', '2018-09-16', '1596.56', '34484355', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(242, NULL, '65375024', 1, 'e109e178-3cc1-3df4-9829-ad0327e63f41', '2019-01-25', '1996.22', '5958107', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(243, NULL, '1121541807', 1, 'e79fa721-b509-376f-bbb8-ca522e791b26', '2019-02-02', '1929.02', '29555771', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(244, NULL, '1040866857', 1, 'edd813d3-7a48-3c3e-a7bb-8d86c1ca1162', '2018-08-09', '532.80', '10016181', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(245, NULL, '308405086', 1, '302a5c52-013f-3175-a156-519173888a19', '2018-12-02', '2008.91', '45272283', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(246, NULL, '1308800035', 1, '02bb2ba4-f038-3d9c-8342-9f770ff165ce', '2018-08-06', '886.65', '30153056', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(247, NULL, '4053924', 1, '17cfb946-6919-3984-8892-3411be692aa6', '2019-04-04', '2427.17', '18066684', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(248, NULL, '914773409', 1, 'd4f74e58-824f-3fc5-8bb6-39e7279ce2b0', '2018-10-16', '1663.12', '31984758', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(249, NULL, '1442111001', 1, '0e66305e-79f1-3c3d-855f-167158683af5', '2019-03-22', '794.40', '13027441', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(250, NULL, '816624874', 1, '64bfecf4-7d46-38c8-bcc2-6960f17401fb', '2018-10-13', '1992.23', '3472782', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(251, NULL, '1297475483', 1, 'b8c93677-0612-34cb-a2c3-5fa88000e136', '2018-12-15', '1969.57', '41646122', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(252, NULL, '1282677512', 1, '38993d16-0b51-3a98-8547-26026524215b', '2019-05-03', '411.94', '41150262', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(253, NULL, '773953590', 1, '7a66bff5-5850-37e4-8ab6-1ed4c15054a2', '2019-05-09', '1808.79', '42913539', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(254, NULL, '1118557254', 1, 'aa72d4a7-436a-3f08-b062-90e412aa437f', '2019-04-26', '1155.13', '27347708', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(255, NULL, '1481719328', 1, '71ad7fb7-58b4-39fa-9fe4-d265db831048', '2019-04-16', '1478.65', '4199548', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(256, NULL, '237519245', 1, '87297fbd-05db-3aa7-87f8-7af1b96dfd39', '2019-01-16', '903.41', '6353511', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(257, NULL, '1498277371', 1, '1d87535a-96a1-3449-ba02-c6e7ef996815', '2018-09-08', '596.73', '35294898', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(258, NULL, '768195502', 1, '34c7b812-a6b0-3b00-a4b5-2db31e65c9df', '2019-04-04', '510.86', '13781565', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(259, NULL, '1518584585', 1, '326385a4-d85f-384d-a3f0-8b99bd21455e', '2018-08-05', '366.74', '15402416', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(260, NULL, '1230556534', 1, '15402d6d-1140-3208-9a54-bb5cb2d5db46', '2018-10-22', '642.51', '3488032', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(261, NULL, '1433861016', 1, '139bd136-1456-39ce-ab6f-0eb3be2219e5', '2018-07-26', '1466.01', '4533657', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(262, NULL, '597708330', 1, '544e3af2-5164-309a-b51e-c9c14117a621', '2018-12-09', '1476.46', '7476994', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(263, NULL, '425015719', 1, 'a2a9dc12-6c19-3382-9387-4df3a05d6943', '2019-03-18', '2305.14', '48422795', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(264, NULL, '880167537', 1, 'd7e77dbb-9c53-3c13-89d4-0dba354000f1', '2018-07-10', '2071.80', '32229515', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(265, NULL, '318761844', 1, 'b4ef191d-771a-3dc1-b229-564409ada546', '2019-02-17', '1339.62', '11355709', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(266, NULL, '76629038', 1, 'bc02e17b-efca-362d-86f1-6c8b05d80ebc', '2019-02-18', '1838.26', '25382490', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(267, NULL, '958179597', 1, 'a6f97eb3-4306-36e9-8cc3-5596a386d5f7', '2018-09-04', '2081.31', '21133356', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(268, NULL, '209306470', 1, 'efcfe63e-fd5f-38be-937b-ccaf38fbc96b', '2018-10-09', '1177.19', '44120992', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(269, NULL, '1552744078', 1, '97beaa71-e6d5-350b-8f91-e5308d53ce90', '2018-12-18', '404.14', '6769295', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(270, NULL, '328760682', 1, '4f49974f-e7fd-3ea5-8e7b-c43344d0a9c7', '2019-06-02', '940.16', '10269462', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(271, NULL, '1095440944', 1, '10070c84-ff07-389b-a81a-e399057b1994', '2019-04-14', '1279.63', '11204543', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(272, NULL, '1100959808', 1, 'f7ed1c75-0733-35dd-bfc9-85a9f29fc01b', '2018-07-15', '606.18', '8509713', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(273, NULL, '1220925237', 1, '22db11c4-e37c-31b6-b2ae-f5a9f44ac3ff', '2018-06-22', '1199.72', '19192301', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(274, NULL, '831535999', 1, '95d2d3db-c4db-3fb9-91d0-11981a55c4f6', '2018-08-18', '2093.80', '48193786', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(275, NULL, '696143467', 1, 'c0bdaa4c-ba9a-329e-9369-dbda66ecc9ad', '2019-03-04', '853.38', '39483451', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(276, NULL, '998567986', 1, 'a5a5943a-6a0c-3941-86a8-e95cb4779fa7', '2018-09-14', '2057.74', '1844203', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(277, NULL, '1104443057', 1, '25e69da3-c3db-3982-b496-be28a996bfa9', '2018-12-26', '632.09', '2854603', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(278, NULL, '516405314', 1, 'fdb08de4-6768-399d-9ae1-929bbbd2f48e', '2018-12-28', '2022.78', '36995207', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(279, NULL, '1502570187', 1, 'f3232ab9-8fea-32e3-8dd9-b164433f5a4f', '2019-01-21', '2537.83', '40895933', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(280, NULL, '196714969', 1, '55bc453c-3e24-398b-8567-d898eb097b03', '2018-08-04', '2818.72', '17629490', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(281, NULL, '315031461', 1, '116fce73-7057-3949-af34-0fc8d5db6e7f', '2019-05-12', '979.54', '13245997', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(282, NULL, '276861964', 1, '61ca52a4-4a28-3659-8534-e4bd09890e4d', '2018-12-08', '2365.92', '49352242', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(283, NULL, '442820240', 1, '66165ef6-ea83-304c-9706-a0ceef117754', '2018-06-25', '1667.27', '38734367', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(284, NULL, '209295495', 1, '7664670c-c466-32df-b64d-74042ef54b7b', '2018-11-21', '854.25', '37806102', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(285, NULL, '1382607703', 1, 'f09d8d56-032f-3223-ae7c-43591328c40c', '2019-06-06', '480.65', '46029844', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(286, NULL, '526372628', 1, '646e512c-3a27-312f-9c25-f5cb2d9eed05', '2018-08-06', '1304.36', '9340325', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(287, NULL, '186336274', 1, 'b3264112-6f71-3a0e-a8a7-5ac1ba18b928', '2019-01-09', '1162.87', '9020882', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(288, NULL, '400429704', 1, '59e39aef-3a29-3b54-9030-c86bae5de7f3', '2018-12-29', '2380.39', '12223291', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(289, NULL, '384006266', 1, 'c26a7c3d-f531-3d60-8f05-b5e898096e6a', '2018-11-13', '2641.14', '16228484', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(290, NULL, '218200011', 1, '80fa7582-0cdb-3e04-be09-4632c2009e6c', '2018-08-15', '500.41', '6185772', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(291, NULL, '413819279', 1, 'f50808f3-edb5-3c3a-8d42-0d226fd48cf0', '2019-03-25', '1999.18', '40621420', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(292, NULL, '269524968', 1, '088663c4-8a6e-3f9d-a88a-2ad65617b60a', '2018-07-02', '1032.31', '29616761', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(293, NULL, '343812420', 1, '94ab84a0-9e5f-352d-9f92-c36510eb13c4', '2019-01-25', '2038.48', '9082679', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(294, NULL, '250160085', 1, 'ef432ab9-7692-3437-9a95-64fa86680a3c', '2019-04-26', '645.64', '37672494', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(295, NULL, '1353999551', 1, '62728320-04f8-363b-b4fc-46f2646d1bef', '2018-10-07', '1129.13', '6421016', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(296, NULL, '994869173', 1, 'fb46043e-e550-3437-abdc-bd3e623aace6', '2019-03-02', '1356.88', '11866115', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(297, NULL, '199454045', 1, '2f9e5af3-b025-3790-a3a4-ca271037a8c7', '2018-10-16', '983.25', '1831209', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(298, NULL, '370782593', 1, 'c4f3b67d-e088-3852-b9af-84230bb3a54d', '2018-11-17', '2108.69', '29343884', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(299, NULL, '1189847480', 1, '0ff57b63-2d57-3b25-bed8-66f0acbca3a7', '2019-01-23', '2306.11', '47612363', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(300, NULL, '301514604', 1, 'a667d62d-0c2a-3e73-9f9e-afa1f156e744', '2018-07-07', '2320.04', '46216676', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(301, NULL, '279711091', 1, '58210eb7-3550-3c80-8a9f-4030886369f1', '2018-12-26', '2124.50', '4865016', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(302, NULL, '857277291', 1, 'f60572ab-7c4e-31bf-a627-c0d571dc872a', '2019-03-03', '2799.38', '28665340', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(303, NULL, '1357881793', 1, '3c5f6f50-31f8-387b-b93b-1f10d55c597f', '2018-07-21', '1049.39', '48965346', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:44', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(304, NULL, '1233938742', 1, 'b003b809-8894-3377-a908-81e2cbd24665', '2018-08-27', '1030.80', '13580776', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(305, NULL, '696064617', 1, 'b7889a35-4c00-3f87-a469-4b90d40decac', '2018-07-19', '2614.13', '42376645', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(306, NULL, '838106227', 1, '426c0e69-d5db-3dc3-ac3b-82630503be0f', '2019-04-09', '2342.26', '18451530', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(307, NULL, '129363681', 1, 'dafe5ff8-ae0c-361d-b88c-8bedc3e285f9', '2019-06-03', '2150.45', '40789512', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(308, NULL, '1080004587', 1, 'd6bb78ad-fb53-3199-bb15-7d3ac6495dce', '2019-01-07', '2043.97', '3871229', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(309, NULL, '10179629', 1, '7e17fe10-d87c-3f9f-b441-91d3915e800b', '2018-10-16', '2072.38', '14545759', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(310, NULL, '448823422', 1, 'd20e713c-c3c0-336f-ba0d-2f95222d68b7', '2019-04-30', '2571.78', '9197813', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(311, NULL, '1308781577', 1, '0b398f67-afcd-3b87-9084-368453728cd1', '2018-09-18', '2189.42', '45970758', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(312, NULL, '483600497', 1, '2e1e5252-43f8-317c-8876-e6a7465d5209', '2018-08-11', '778.91', '25868144', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(313, NULL, '1297194353', 1, 'b0558544-a599-33c5-9ff8-5ca8fe465ec9', '2019-03-19', '2103.08', '24053879', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(314, NULL, '996186119', 1, '7a7beb67-3cc1-3527-ac52-b0889946053d', '2019-03-20', '893.73', '10125200', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(315, NULL, '936704114', 1, '7c195e7b-e988-346e-b4b7-10b944ee50aa', '2019-02-11', '2400.28', '38398081', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(316, NULL, '1017381326', 1, '7f224b94-d4f2-3400-90dd-5ac5a0e6c8dd', '2019-05-14', '1228.21', '46751169', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(317, NULL, '1461369086', 1, '66f277a4-a5a3-39de-818a-bcfb0fcd1d62', '2018-07-17', '2382.88', '16063333', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(318, NULL, '1061432131', 1, 'c2ec268d-e191-3e14-b6a3-f248204ef96f', '2018-10-18', '360.87', '11074034', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(319, NULL, '1525497908', 1, '37bbb52c-2478-3e06-8066-c96f8708c9c1', '2018-10-23', '1438.80', '40929728', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_progressive_motivating_firmware_1`, `_snipeit_customer_focused_actuating_knowledgebase_2`, `_snipeit_self_enabling_6thgeneration_interface_3`, `_snipeit_synergized_grid_enabled_archive_4`) VALUES
(320, NULL, '84758987', 1, '82b5e619-6d4c-3514-ba0c-7b2618699372', '2019-01-03', '1896.21', '45864009', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(321, NULL, '34415521', 1, '93492034-b2cf-39e7-ab96-828031970b64', '2018-09-25', '2675.51', '22669787', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(322, NULL, '1390400092', 1, 'acb3ed43-02c2-3ff4-92ab-ac73090f9fab', '2018-10-25', '1281.84', '41231335', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(323, NULL, '72283898', 1, '9cb95e99-ec6b-3b25-b60d-156a22c27a69', '2018-07-08', '2254.85', '6723018', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(324, NULL, '92045340', 1, '5828a774-c5a1-345c-b3fb-2e4055e48105', '2018-11-25', '1575.10', '25115296', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(325, NULL, '1084338302', 1, '742ba7f7-8b39-377c-831c-c6382b2ce9c3', '2019-05-31', '536.52', '19655710', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(326, NULL, '83661186', 1, '2fc89a38-6704-37e5-bfcb-b977e4c91f78', '2019-06-02', '1183.71', '33512065', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(327, NULL, '585820837', 1, '0b7b49b1-0911-3019-beb0-d5ae5aef0911', '2018-09-01', '2686.40', '44895162', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(328, NULL, '819021301', 1, 'a47f78ff-38b2-3d82-91b5-b3c820f1d6b3', '2019-04-13', '2688.08', '18021197', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(329, NULL, '1204720791', 1, 'fc85872c-a1f8-3a41-8728-592c071b2b51', '2019-02-12', '2183.89', '4781061', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(330, NULL, '1401758587', 1, '5b3b7893-3d25-3cc8-826d-55ffaa084e36', '2019-04-11', '2839.07', '12760064', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(331, NULL, '698423630', 1, 'd0d3033f-478c-3c4f-9a3a-e546d8fe90e2', '2018-11-25', '2121.27', '19936017', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(332, NULL, '190525695', 1, '4037e32d-f2b0-3024-ab51-11a319c19d95', '2018-10-03', '1125.86', '1382639', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(333, NULL, '182716507', 1, '27d296fa-fffa-32ed-ac42-c88420a2a954', '2019-02-27', '1467.94', '18814595', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(334, NULL, '11079915', 1, 'bb1387ac-8f21-35f2-838f-363e38575582', '2019-05-29', '332.06', '41465847', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(335, NULL, '984563144', 1, '986dc20a-e699-3c4e-9f47-1e9c12f27f23', '2018-12-22', '1466.53', '7324583', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(336, NULL, '391273868', 1, 'cb7faa96-5561-3f7e-b5cb-c3536e394731', '2018-08-31', '2396.07', '48791538', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(337, NULL, '1404589485', 1, '04e4b629-1f0a-3c2c-80a4-99287316d247', '2018-07-25', '796.85', '37663948', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(338, NULL, '1513149069', 1, '4130dbbc-21ba-34dc-b8e7-928e94d115d4', '2018-09-09', '853.87', '20889281', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(339, NULL, '1365331495', 1, '9ce5b7f5-837c-3869-8300-60e764fcba78', '2018-11-01', '301.25', '9824572', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(340, NULL, '172751244', 1, '44735a1a-40f3-31bf-aa3d-f9d3b87d8319', '2019-01-06', '1392.79', '33775044', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(341, NULL, '1071827091', 1, '0d0ed46e-bc35-3895-ac44-7f63708050c1', '2018-12-29', '1428.22', '4613579', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(342, NULL, '1474685085', 1, 'de4044e1-87d5-3ca3-9ed7-e976c1924a7a', '2019-01-01', '2545.30', '3527516', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(343, NULL, '1027756134', 1, 'b69b2d12-a9ad-3955-9ad3-6f9ccdfcaeb8', '2019-05-09', '2185.55', '46194284', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(344, NULL, '733825044', 1, '2ecc8c0e-4118-3b13-9d85-4f9fa4786f56', '2019-04-24', '1815.03', '7722636', 8, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(345, NULL, '994807799', 1, '46c2e8e7-66f1-35a4-8cfe-8898a8e33aa5', '2018-12-06', '1458.49', '19190970', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(346, NULL, '128731966', 1, 'f25c9e94-6584-3b60-a648-60020fa081e4', '2018-10-16', '1420.65', '27235563', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(347, NULL, '430738798', 1, 'f8a21539-78f2-31f7-aeb0-c852339c8b94', '2018-10-22', '2389.86', '30702484', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(348, NULL, '775336917', 1, '9c2e0053-c190-3701-b8fc-7a2ec7a7355e', '2018-07-31', '2900.63', '32586711', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(349, NULL, '86708042', 1, '1e578c1e-4183-3a22-8a67-da710bd3f35b', '2018-11-11', '2389.08', '15773715', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(350, NULL, '543660432', 1, 'd4e90b77-0f6b-3c21-8ddb-9965a5392d1c', '2018-11-21', '1573.41', '37340275', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(351, NULL, '1134387969', 1, '56a0b217-c361-366b-ba5a-7fb18dd8e202', '2018-11-09', '1380.15', '31687014', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(352, NULL, '239456085', 1, 'f3a75eca-c06b-35ab-a4ff-b8a963a20024', '2018-09-18', '2871.14', '22925274', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(353, NULL, '939205230', 1, 'b9bed9f6-f2af-311a-b3f7-e1aaa00a4499', '2018-07-12', '322.02', '5723291', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(354, NULL, '1325013292', 1, '412ebcb9-1e1b-39a0-b5b2-dbf42ffcc3ba', '2018-10-09', '2603.05', '20271284', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(355, NULL, '794851547', 1, 'c567ff1c-3db8-39c7-bd38-342a1b7bbd67', '2019-03-17', '1725.27', '13511427', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(356, NULL, '631996119', 1, '56b3ec9a-9f27-3a75-bb16-1bfd41e7c0c9', '2019-03-23', '2196.62', '16932757', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(357, NULL, '1277900415', 1, '394d0c47-37bc-3412-acce-3160e2fe7e70', '2018-12-14', '2974.45', '43045150', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(358, NULL, '194443481', 1, '31670dce-5f97-396f-88b2-adf0a00cc516', '2019-02-10', '1315.22', '40932998', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(359, NULL, '135474034', 1, '0346d001-628d-31c3-8a10-7a472a9e74da', '2018-09-07', '358.93', '10865461', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(360, NULL, '1290980505', 1, 'bbbb7578-2cda-33c1-bd13-e8ded790f2b4', '2019-02-07', '1655.70', '3871045', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(361, NULL, '1061885103', 1, '6a847c1a-4313-3f76-944d-a4f787ca0bf3', '2018-07-27', '2722.70', '23052741', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(362, NULL, '460772208', 1, '97b29a9d-1804-3ef3-98f3-72814627ea80', '2018-07-25', '317.66', '19129682', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(363, NULL, '1527509410', 1, 'a132d71e-3e6e-3b98-8884-a4e19a9f2af5', '2019-03-23', '1086.19', '47296537', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(364, NULL, '1005222777', 1, '9708310d-7b99-3221-a652-95ad0a49a571', '2018-09-18', '341.99', '20898240', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(365, NULL, '191806520', 1, '01ca003c-f034-3857-bee2-131e2ba13734', '2018-08-20', '2352.95', '11715908', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(366, NULL, '701506663', 1, '9c9cf53b-4633-3160-bff7-ec2367af9485', '2019-02-05', '1803.16', '45096758', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(367, NULL, '291315218', 1, '88a36e2e-83ef-3ef8-93ff-807ea9ce436d', '2019-04-02', '964.98', '7677420', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(368, NULL, '347873774', 1, '5f5c4953-f8d5-3a03-b5d5-ec556adb2732', '2018-06-22', '2883.22', '17098234', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(369, NULL, '1083199874', 1, '132fd66d-262c-332d-a07b-25083638a644', '2018-07-29', '1635.78', '21457820', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(370, NULL, '664266126', 1, '90440d4e-c4ff-3cbc-aece-5db07aa91c4b', '2018-08-09', '797.60', '41703975', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(371, NULL, '1487961824', 1, 'cc31c0aa-9335-3f78-90d5-72c48f786306', '2018-06-14', '1703.89', '10050872', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(372, NULL, '1015815912', 1, '721c15f5-4572-3dba-a622-ce967ad1e32f', '2019-03-06', '2730.35', '3326478', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(373, NULL, '1296945881', 1, 'a6bbff7a-b132-3fa3-9653-cbef016e22d7', '2019-03-14', '369.68', '47428622', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(374, NULL, '485195864', 1, '612deb12-2fcb-3bf6-8133-e86a7a7af6d6', '2018-07-13', '1422.02', '47675822', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(375, NULL, '782647807', 1, '6dfd3f7d-4118-3f01-9951-9232067c3889', '2019-01-18', '798.86', '12461195', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(376, NULL, '738011400', 1, '19972e89-b621-3b92-9c34-45d3c69eb5b8', '2019-03-01', '987.09', '29183072', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(377, NULL, '195220006', 1, '8090acb0-ba69-3359-aad4-72370864aa8b', '2018-08-04', '1111.66', '31067292', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(378, NULL, '1098591135', 1, 'a7590585-e4c6-37f0-b325-d8d4166db3a2', '2019-03-17', '2488.92', '2517960', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(379, NULL, '1129765923', 1, 'ed6b6ea3-a9e2-3a29-9ae9-cabf28caf4e7', '2018-07-07', '2869.72', '39145902', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(380, NULL, '17642288', 1, 'b086235c-80aa-3e60-84b3-64087b732552', '2019-01-23', '1825.51', '13768212', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(381, NULL, '960582875', 1, 'f92dfc5c-06a3-3053-8edc-8d5a3a906176', '2019-05-28', '2916.87', '15711108', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(382, NULL, '1484780160', 1, '44ea818e-f1ba-3ca4-a02b-5dcd1062f683', '2019-03-29', '2203.78', '40011591', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(383, NULL, '48206768', 1, 'a60aa018-9103-3f31-929a-d0c3b2d6ad2d', '2018-10-25', '398.73', '17253818', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(384, NULL, '1070682760', 1, 'b875e853-e851-3310-8e9d-52530be64984', '2018-08-08', '1439.87', '4491533', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(385, NULL, '1206378841', 1, 'ba309a70-5498-3598-b3eb-18a83db44889', '2018-10-25', '2977.05', '15029929', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(386, NULL, '559630883', 1, 'a8ef933b-c47f-3c18-9485-8af7c0757938', '2019-04-17', '2411.28', '35736091', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(387, NULL, '510701868', 1, '33b9d06a-68ee-3d19-bf68-59d67f7864ca', '2018-09-03', '784.13', '8009321', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(388, NULL, '379306441', 1, 'cdd9ab93-5e40-3d39-8b99-f4b4faf66164', '2018-07-05', '2329.15', '1202532', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(389, NULL, '1282328623', 1, '80c13768-081f-3841-ae0f-2cff9e4880a6', '2018-06-15', '2308.27', '48478079', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(390, NULL, '1251606655', 1, 'c083c7f7-ac9e-348b-aa80-ecb79e6d50ae', '2019-02-14', '2688.48', '49126772', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(391, NULL, '1119630754', 1, '6350b894-e73b-3a50-be72-4852f1611d1d', '2019-05-01', '1376.79', '32466100', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(392, NULL, '1549865321', 1, '84c1e07b-72fa-3d77-8699-bf6ddeedd300', '2019-05-23', '1128.09', '42016396', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(393, NULL, '854540319', 1, '94ad6f97-1a36-3ec8-8c62-d9f34dc473e9', '2019-04-02', '1739.86', '2275171', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(394, NULL, '458431335', 1, 'f2f13822-13be-3168-a226-7db9c21ab8b7', '2018-08-24', '2217.74', '8902158', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:45', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(395, NULL, '362115022', 1, '0b558f48-0a59-33bd-ad77-82923a0cc5c7', '2019-02-03', '1531.54', '15735902', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(396, NULL, '400057052', 1, '256b33cf-cd26-3850-ba6e-fd16de38c3f5', '2018-12-21', '572.29', '29545506', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(397, NULL, '740030151', 1, 'bc6414c0-2d5e-3020-a4d9-93bf9dd67cd1', '2019-05-07', '2043.47', '44613678', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(398, NULL, '1387954532', 1, 'c464083e-47ad-3df4-890c-b6842a96b48f', '2018-07-12', '2235.54', '23901929', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(399, NULL, '1096349548', 1, 'fc820442-aa77-331c-a292-08986cd0de08', '2019-06-07', '958.30', '22631873', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(400, NULL, '846072795', 1, 'd744851f-cac9-3208-8a93-cb4975d65810', '2019-01-14', '377.98', '7845890', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(401, NULL, '1087537578', 1, 'b0708fd9-5a82-346b-bd7b-cf27dc1269dc', '2018-07-09', '1688.11', '10755576', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(402, NULL, '58270021', 1, 'e2ecdeb6-4178-322c-8876-43fdd7e9602f', '2018-10-04', '1122.41', '26696162', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(403, NULL, '675708370', 1, 'a9688eb7-a77f-33df-9eab-4ab19fdd7e9a', '2018-06-14', '2052.43', '28400579', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(404, NULL, '597241400', 1, '8fa9d31d-c7ef-38d8-b6d1-89a3c34611b6', '2019-05-28', '2642.14', '29027372', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(405, NULL, '1153279541', 1, '36ebc1a9-bcb3-3873-9879-b621881a5761', '2018-08-21', '2123.24', '47254357', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(406, NULL, '647042096', 1, '4e38af68-3541-339b-a71a-3bfb7e847361', '2019-06-06', '1467.05', '3010292', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(407, NULL, '1285134100', 1, 'a0216397-3bf7-34f5-b396-36b4e204ad58', '2019-03-17', '1828.02', '49677396', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(408, NULL, '218658835', 1, 'd8c31839-1d3e-33bb-832b-aa840a197db2', '2018-08-18', '2859.98', '16088760', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(409, NULL, '232839758', 1, '8aed72ca-4e34-3825-be0f-933872278ea0', '2018-08-30', '1303.83', '48269990', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(410, NULL, '834276855', 1, '5bcc9a08-76d2-3b8b-ac91-984a90b94f24', '2018-08-02', '632.87', '5585698', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(411, NULL, '86640840', 1, '97993fbd-632f-356e-97b0-c541cf152b09', '2018-08-26', '324.12', '37036009', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(412, NULL, '319685354', 1, 'cbea442c-4468-3458-9405-6fa60581c853', '2019-02-19', '2056.77', '12270085', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(413, NULL, '559070540', 1, 'f50ea1a1-a2b1-3507-9289-6b4ba89cb03f', '2018-07-03', '1970.49', '3962930', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(414, NULL, '757464153', 1, '8f8f2ce2-66a2-3b3b-88c9-a9d001fea14a', '2018-12-24', '1687.71', '18920275', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(415, NULL, '892633834', 1, '82d2b5d3-902f-31e5-b9c1-b8e49a9aeafa', '2019-04-13', '1997.66', '20375255', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(416, NULL, '732103476', 1, '66939661-6ea4-3e49-bbc2-a6f38f9a235b', '2018-11-17', '1427.41', '9188888', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(417, NULL, '772204221', 1, 'f57a2d93-8715-3026-a56c-f1a91e42e6c3', '2018-07-28', '973.74', '30524486', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(418, NULL, '78941562', 1, 'afc374cb-d928-3293-9d1d-1bf62d8c767e', '2018-10-23', '2197.85', '33434756', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(419, NULL, '197368006', 1, '287c3e1f-c0a9-38ae-9a66-d6c6a95b9b22', '2018-06-13', '546.00', '12610564', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(420, NULL, '1273731912', 1, 'bd8a353c-926f-3312-8ff0-36395d1956dd', '2018-09-04', '482.35', '18632430', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(421, NULL, '536093594', 1, '829ef31c-b88d-395d-9bca-2fa5df4929f8', '2019-04-28', '1169.92', '13444599', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(422, NULL, '1462824465', 1, '48e0a90d-14f3-3df6-82a3-af437e3855fe', '2019-04-14', '913.38', '21526919', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(423, NULL, '998652364', 1, 'a66de495-9eec-3a0b-a5fe-3bf23ab1b168', '2018-09-19', '2076.14', '21841374', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(424, NULL, '728499470', 1, '845ffec4-7d74-3e2a-b5f2-121ab89f2e4b', '2019-05-26', '404.75', '25026605', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(425, NULL, '1160318621', 1, '5405a567-682e-3b29-8d4a-4f7a73860848', '2018-09-13', '2003.82', '24329591', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(426, NULL, '90214611', 1, 'fd20c63c-96c0-35df-a9cb-71a9d717fa74', '2018-10-22', '1965.10', '3000193', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(427, NULL, '126009627', 1, 'c7b381f2-c628-37a9-ab60-5edb34fb3e69', '2018-07-26', '1796.68', '2812399', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(428, NULL, '1013192527', 1, '6a49b865-10da-34b0-a9f3-ee3aa9e47ab7', '2019-02-12', '2074.95', '17598608', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(429, NULL, '640920725', 1, 'f7609af8-baf4-309b-b351-5f5788d26cfc', '2019-01-25', '2615.24', '36884140', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(430, NULL, '102690772', 1, '54e6991e-06f9-3ee1-be28-01f8240e1eec', '2018-10-18', '2566.92', '49080535', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(431, NULL, '1093025734', 1, '19b508a7-1359-3659-b473-b7c1d46f168d', '2018-08-25', '2214.87', '2681737', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(432, NULL, '761770693', 1, 'e2a7ee1b-33aa-3834-a8aa-77aab73c29a4', '2018-09-21', '671.89', '49693774', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(433, NULL, '1362871749', 1, 'efb09f65-ee1f-3e51-9397-66e7f336e80c', '2018-07-29', '2328.99', '46677014', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(434, NULL, '15120799', 1, 'bc022afa-cb1d-39dd-9831-3c89092653dc', '2018-10-15', '2498.27', '12511559', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(435, NULL, '1110158459', 1, '1c42894c-d56e-3ccc-a040-794c6af39161', '2018-06-22', '1340.27', '7989531', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(436, NULL, '284166590', 1, '303d28a4-3104-3124-93f5-18a27048bff5', '2018-11-18', '2122.58', '38658434', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(437, NULL, '1290091489', 1, 'eff0ca90-19f5-3449-8264-4e57712dd2e9', '2018-12-17', '1976.22', '5476630', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(438, NULL, '1347486971', 1, 'a034b675-0d63-38ba-bf9e-c49caccf1b3e', '2018-08-03', '359.51', '15917099', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(439, NULL, '602934014', 1, '76767a2b-59b8-3922-9ebf-ad835a9e1b0e', '2019-03-19', '2713.13', '46889285', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(440, NULL, '815075175', 1, '647a7434-2af4-3b66-97a5-72141e374af0', '2019-01-18', '2126.69', '4091258', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(441, NULL, '234376319', 1, 'e01cd7a1-7bec-3d71-8839-b108ed418ff0', '2018-07-21', '775.27', '17202721', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(442, NULL, '181515298', 1, '7254111f-1ddb-3bf1-8335-a460cc84a7ab', '2018-06-15', '883.74', '21767924', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(443, NULL, '882163191', 1, '15ef62bd-387c-3d1c-b3e7-7fa4c6c05cb0', '2019-02-02', '1301.19', '2309209', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(444, NULL, '952753715', 1, '3caec10d-7f7e-3326-903e-ff8f3a487c4c', '2018-09-29', '1367.08', '21291262', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(445, NULL, '173048629', 1, 'aee8c35b-2fbf-30d6-bf1c-955c8aff21b6', '2019-03-08', '1318.23', '23148756', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(446, NULL, '519082480', 1, '6196c172-5562-3d91-9365-db8a9a2f7717', '2019-03-01', '1559.23', '10574964', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(447, NULL, '159961819', 1, '1d450db7-e0bc-3720-8287-c63b8235460d', '2018-09-28', '1952.67', '27798495', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(448, NULL, '307834349', 1, '61294455-5f9e-3cad-8bfe-e3d6468a2b3d', '2018-08-16', '1611.79', '13140386', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(449, NULL, '1330326585', 1, 'd3f8985a-9790-3ce2-91fa-894054581ba4', '2018-07-27', '2051.94', '3854102', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(450, NULL, '545344788', 1, '6c9a00a0-13f3-3635-a0c5-714e7ea0712e', '2019-03-02', '749.79', '26222215', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(451, NULL, '690310762', 1, '1c1a7af4-3a92-37e8-9395-de0fca9fd813', '2019-01-12', '1206.72', '37255129', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(452, NULL, '504017582', 1, '331d05a5-7b1a-34f1-ba2b-d5077a0cbb74', '2018-09-29', '350.21', '41454023', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(453, NULL, '280815237', 1, '977ad013-4121-31b2-a3e4-4d18d294ef59', '2019-06-02', '1359.78', '17802296', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(454, NULL, '44621545', 1, '8df3a8a5-a8ad-37b1-a3c6-c8b7f60ace59', '2019-03-13', '2843.29', '33691754', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(455, NULL, '30477859', 1, '27c5f082-778d-3e1f-bfc3-086b46cb0585', '2018-12-05', '2054.05', '15896568', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(456, NULL, '560132745', 1, '891f8cd8-bd0d-340a-9797-71cb403028fe', '2018-11-16', '2389.53', '38827429', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(457, NULL, '1388765527', 1, '3ec98774-2a62-39bf-9e8a-a63625094168', '2019-02-26', '1831.16', '49828882', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(458, NULL, '558957534', 1, '2f5f876e-2162-34ba-a5da-1b8bb163fd0a', '2018-12-20', '1096.35', '46013480', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(459, NULL, '893848110', 1, '198d315a-ebb8-31c5-aa67-87350a9b55d9', '2019-01-23', '1254.83', '36572374', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(460, NULL, '1344092773', 1, '022bc51c-8354-3b83-b61a-c9d4dd187b1d', '2019-03-26', '842.19', '3345983', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(461, NULL, '1539723887', 1, '479e378b-88c1-3be1-8264-27e1e3415559', '2018-11-19', '1736.35', '14820229', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(462, NULL, '1300394327', 1, '4fc0e313-33c8-3dac-8d8c-a753eb85cb8e', '2018-06-30', '483.67', '9730032', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(463, NULL, '802004735', 1, '95e0bced-5b37-3164-8d23-1ce70a9a6203', '2018-09-30', '2736.62', '12172427', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(464, NULL, '128122297', 1, 'fefc1c80-0ff5-3ee4-af2d-457930e1d273', '2019-06-05', '2563.97', '44182934', 8, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(465, NULL, '1449610010', 1, '112c4bbb-5bd7-3e13-ac52-00cc20426d05', '2019-01-07', '2954.53', '37786102', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(466, NULL, '1128196562', 1, 'd1c1396a-b25e-36b4-8dc1-f91737463bc4', '2018-10-31', '2676.99', '40660043', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(467, NULL, '1229357714', 1, 'd42b641c-3f42-3193-b6ce-384b37fde3e5', '2019-01-06', '1593.60', '7378408', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(468, NULL, '952688752', 1, '7bc03fbd-80db-3b7b-8136-05f011f86aa2', '2018-12-04', '2464.85', '13387137', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(469, NULL, '972375078', 1, 'c8acdd3c-14ca-38fa-a486-c6ccc1767ecb', '2019-05-04', '2553.96', '31031554', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(470, NULL, '1493614691', 1, '5936aeb8-6745-3cbd-864e-58136cdc62ab', '2019-04-30', '1167.68', '12348318', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(471, NULL, '991697233', 1, '5b7c82d6-70bb-36b0-9b58-eadfc7228f94', '2018-11-10', '1502.42', '34755074', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(472, NULL, '697715840', 1, 'ab9c01ca-f242-3985-95c7-8afee2755290', '2019-05-31', '1585.80', '36807403', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(473, NULL, '916045713', 1, '1af6a0fd-8a79-38be-8775-cd0d68c225b1', '2019-02-05', '2377.76', '16508530', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(474, NULL, '593223979', 1, '403f958b-6eaa-3c58-a84e-00ab167d742f', '2019-01-17', '1393.50', '6021763', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(475, NULL, '228778905', 1, '3d084076-3758-3362-a322-6b531ab871af', '2018-10-06', '1134.67', '34881049', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(476, NULL, '347636802', 1, '151be9a1-adbe-37f5-933b-7626b90f0555', '2018-12-23', '1642.87', '8433448', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(477, NULL, '1256555083', 1, 'f92e6fba-90b7-3650-bbda-c48876851f37', '2019-06-08', '508.75', '36502632', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(478, NULL, '895473899', 1, '0d0acb20-ff58-31b7-b757-13ed130fe38f', '2019-01-03', '2728.08', '48636056', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:46', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(479, NULL, '692730652', 1, '7deb8cd5-ea8f-3bb9-9a60-ec5e8d93edc4', '2018-12-04', '940.81', '41728082', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_progressive_motivating_firmware_1`, `_snipeit_customer_focused_actuating_knowledgebase_2`, `_snipeit_self_enabling_6thgeneration_interface_3`, `_snipeit_synergized_grid_enabled_archive_4`) VALUES
(480, NULL, '1498599327', 1, '2a962d06-7f49-3634-b615-f993bec48d71', '2019-03-17', '2857.99', '11970603', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(481, NULL, '155587468', 1, 'ee4cbcfe-cc8c-3ad9-94ec-25f2e42b05cc', '2018-09-20', '1282.60', '38268730', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(482, NULL, '227546778', 1, '5fc5ab91-0572-3d6c-9e8f-f0d07723be5a', '2019-03-29', '2243.34', '25979086', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(483, NULL, '323071384', 1, 'dcb1695b-9c63-3767-adc1-dc87a2b5a1e5', '2019-02-20', '2913.38', '26233871', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(484, NULL, '595084175', 1, 'da0a5556-d733-3c59-954a-812108d649d2', '2018-12-18', '2724.16', '1222933', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(485, NULL, '491957644', 1, 'f409e7b0-d713-3150-baa9-561ca0e634c4', '2019-05-28', '1262.93', '14694517', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(486, NULL, '432428234', 1, '7b395a31-7f06-3b24-badd-35def792c4c4', '2019-01-07', '2103.79', '11896785', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(487, NULL, '1154365723', 1, '45f5d4ff-c711-3b2d-afb9-4ae26631fa8e', '2019-02-26', '1520.32', '4794188', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(488, NULL, '349135916', 1, '515ed511-c462-3fa0-a8f9-0b908dfd7b37', '2018-11-13', '781.44', '49323219', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(489, NULL, '1397433028', 1, '32f7d138-7341-3da8-84a7-d606d4ec8a87', '2018-10-12', '2673.17', '4501472', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(490, NULL, '944592188', 1, '56f2e32d-e545-3eb3-b7ca-57aab1681009', '2018-08-14', '2051.00', '15015067', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(491, NULL, '1516074734', 1, '798a3b20-b003-32f9-9afb-1547a4847e49', '2018-11-05', '886.11', '10019511', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(492, NULL, '1105348448', 1, 'ed1dc5f8-db80-3c7d-9e4c-995ee9373905', '2019-03-17', '1477.74', '32272987', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(493, NULL, '762641825', 1, '9ce47afe-12b1-3ccd-abdb-cff5e38ec745', '2018-07-27', '1503.39', '32313442', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(494, NULL, '1022763924', 1, '4b93d570-048a-3317-8554-8a2cfd728a12', '2019-02-21', '2790.30', '6822817', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(495, NULL, '1275651750', 1, '39638bcb-1bd3-3bcf-93b6-c0a46d4dbd5a', '2018-11-29', '1143.93', '34557101', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(496, NULL, '1133047293', 1, '077b87ff-8854-3318-9fbc-f3b3f1cadc49', '2019-01-07', '529.27', '19907700', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(497, NULL, '1538149994', 1, 'c3b2d6c4-5435-3134-9206-090681dcb5fe', '2018-11-03', '972.00', '46065232', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(498, NULL, '1391343027', 1, '00f9a7b2-0799-391e-9cf1-8ed3839d6f20', '2018-09-15', '2441.16', '6290047', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(499, NULL, '1089918590', 1, '0dcf432e-0a76-37fa-83cb-0f292248b88b', '2019-02-06', '2460.70', '15197063', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(500, NULL, '656825871', 1, '1d6e4d69-c4dc-351f-a0cf-e87e9e5130f6', '2018-11-06', '1327.37', '19926067', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(501, NULL, '1066880712', 1, 'fb52eb28-db34-315a-b7c0-b878f0c27371', '2019-01-19', '1473.31', '27737662', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(502, NULL, '1275099230', 1, '5c846324-3b5d-30b3-b273-cf2cf6cd744e', '2018-10-29', '2506.75', '47831510', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(503, NULL, '596772004', 1, '5c268706-e934-3e75-8679-3d7e34039626', '2019-04-28', '692.45', '1906215', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(504, NULL, '1113250781', 1, '9cb7aa62-fcbf-3be2-9f71-bfbc2ffc48ff', '2019-04-13', '905.04', '16428604', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(505, NULL, '529946138', 1, 'ed5df6f5-e880-301c-9441-6e14a71407a8', '2019-02-02', '666.32', '49618749', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(506, NULL, '1461643607', 1, 'f252bcb6-80af-3a06-91e6-cf7d571f2801', '2018-10-10', '1199.10', '2511335', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(507, NULL, '400807103', 1, '9e38fa32-13a1-326e-9f99-d9f94375e9e9', '2018-10-12', '2244.37', '38642294', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(508, NULL, '237391361', 1, '58392386-1c2a-3a28-8063-f8bfac19481c', '2018-09-01', '2086.34', '44589686', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(509, NULL, '485842423', 1, 'f8049255-7bba-3314-a45f-3eee4079f527', '2018-12-12', '1849.38', '20703438', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(510, NULL, '871044280', 1, 'bc679673-d183-3bd5-ae47-4aaa01174cab', '2019-06-04', '1010.23', '27888307', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(511, NULL, '1429686199', 1, 'c65ff247-482a-3cc9-969e-9516abc95bb0', '2018-11-25', '2005.61', '19294529', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(512, NULL, '1489679475', 1, '2e8c2ee4-3e1d-34af-9174-9be0f04ae244', '2018-09-25', '1983.63', '30321783', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(513, NULL, '1454062433', 1, 'aacaeb7b-704b-30f7-9212-936d6f8ba0a4', '2018-08-20', '2933.62', '24854046', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(514, NULL, '215010223', 1, '8b340b38-fcbd-3a18-96a4-50afe39abcf1', '2019-04-06', '2325.69', '45038970', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(515, NULL, '941085620', 1, 'bbc38d65-045e-3c74-9456-10689c6789b1', '2018-08-20', '2280.50', '17345346', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(516, NULL, '245927764', 1, 'fb2573c8-0352-3fee-9fdf-be7fb9dadce8', '2018-07-02', '2077.86', '5416491', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(517, NULL, '246927006', 1, 'e7cd5185-2c6f-38be-9f4b-79cdb50f473f', '2018-07-02', '1974.92', '33318575', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(518, NULL, '1102235651', 1, '8a5cafcf-7e9b-3d3e-9d4a-62ee6cdd133f', '2019-04-25', '1078.00', '11296829', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(519, NULL, '1074523157', 1, 'caf40a06-9a29-348b-93af-f0ab893167de', '2018-09-02', '935.00', '29380879', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(520, NULL, '394033702', 1, 'ff223ad9-28f0-3952-9fb9-d19e6ad05f22', '2018-08-18', '2422.20', '15562550', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(521, NULL, '409344636', 1, '039e83a5-ca79-32c2-bfc2-c0c2f3a4a324', '2019-03-07', '882.32', '25047705', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(522, NULL, '214125143', 1, 'f5b8bb66-fcef-38f0-b3a9-d050452a986f', '2018-11-06', '1969.86', '31546801', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(523, NULL, '65090315', 1, '45972f06-d60f-3414-a781-e248e0d07e2c', '2018-11-22', '2106.90', '18445041', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(524, NULL, '1475948449', 1, '6564ba89-5700-3a56-a813-ce7fef260685', '2018-07-30', '2192.85', '12616842', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(525, NULL, '461217943', 1, 'a7bee57a-0d0f-31b6-b886-ead8530c5579', '2019-04-24', '2452.18', '6423631', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(526, NULL, '410359173', 1, 'a926bb34-3efc-3b59-8c08-8ba3101c57c4', '2018-09-04', '2216.45', '35412259', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(527, NULL, '1001608417', 1, 'b4f7043a-cd55-3834-8805-ee0eaff6e660', '2019-02-14', '2700.77', '14133263', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(528, NULL, '159535355', 1, '9be99418-d7a3-32a4-aa32-31c1898ff55f', '2018-06-18', '2714.71', '5591338', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(529, NULL, '11080876', 1, '685adac0-123b-3229-9b23-4b072f6ca342', '2018-09-06', '2781.87', '47417635', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(530, NULL, '1168863655', 1, '66a211d8-06a8-3f70-9368-517fd2723304', '2018-07-08', '1959.70', '2977074', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(531, NULL, '1037830591', 1, 'fa89072b-a5e0-3602-84ef-06a8e5b4eed3', '2018-10-10', '321.23', '40499408', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(532, NULL, '1210362910', 1, 'a1ff2169-4f1e-3811-90b2-8dfa689eb37c', '2018-08-30', '1082.44', '17752096', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(533, NULL, '826255973', 1, '7fe1ed8d-cde1-35de-a666-4d56354a7337', '2018-10-22', '2221.62', '27809759', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(534, NULL, '1118067747', 1, '2dff5bbb-97e0-303f-bab1-74e47501d9fd', '2019-01-04', '406.42', '15723084', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(535, NULL, '578649904', 1, '5de6cdd1-a4ee-36d4-99a0-85d666cb5b16', '2018-08-05', '1258.18', '40811982', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(536, NULL, '595231331', 1, '584377be-9fb8-33e2-8fb3-c7c2e5c7040c', '2018-08-05', '2804.23', '12790268', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(537, NULL, '1085979731', 1, '7dc49d64-da86-3009-83f7-8c8593efe1e2', '2018-06-24', '1468.91', '20323727', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(538, NULL, '904747222', 1, 'b28c8359-99c4-340a-9fd3-bb3a649b8844', '2018-09-17', '1075.90', '21873354', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(539, NULL, '1321127281', 1, 'db647f0c-f554-3683-8cb9-01da2fbd0d44', '2018-09-19', '2948.95', '48423446', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(540, NULL, '202489600', 1, 'b5c6ea0d-8dcb-3a25-9330-f0dc03106e37', '2019-01-15', '1942.58', '48407784', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(541, NULL, '269372974', 1, '0e90a78e-ff17-303b-aa8c-6f7e79bf3bf7', '2018-10-01', '2959.32', '42240514', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(542, NULL, '1150830588', 1, '2a974121-7e9e-36c2-91e4-30fbf2179fa6', '2019-01-13', '908.84', '42771584', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(543, NULL, '337338413', 1, 'a1a74243-1692-3966-9227-de1078b2b1ff', '2018-09-26', '2002.43', '10353637', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(544, NULL, '423065879', 1, '9eefd825-7763-3394-935e-a8bc93b20a24', '2018-07-29', '420.73', '44142385', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(545, NULL, '646982017', 1, '4a91b7b6-5663-3b6e-bc3b-208717dba705', '2018-07-25', '1166.15', '35949069', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(546, NULL, '288373406', 1, 'a2f4c97b-9d04-3123-8372-ca1a1e5afd64', '2019-02-08', '2424.90', '41768098', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(547, NULL, '132555483', 1, '136214d2-7ddb-336e-95ee-78011de8e357', '2018-09-12', '1963.09', '7304547', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(548, NULL, '1416831975', 1, 'a34ff804-4a96-317c-aca3-a7f51a8fdee0', '2019-04-26', '869.71', '25463742', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(549, NULL, '237776957', 1, '1fba67b0-5bbd-3562-b152-e0ac2aa88013', '2019-03-01', '1576.00', '5369765', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(550, NULL, '1517979096', 1, '83d5651f-1e28-33e5-bd81-d3f48d14d044', '2019-01-28', '2875.86', '8659354', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(551, NULL, '1413936798', 1, '1e920c0d-0fa0-39d0-ac08-6bead2c26dbe', '2018-07-27', '2255.18', '41940491', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(552, NULL, '546261519', 1, 'f160a280-862e-3849-89ce-2f4314f97774', '2019-01-23', '1174.61', '24390286', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(553, NULL, '788685533', 1, '7aabc1de-a706-3e7d-9657-0b96003dcdae', '2018-10-26', '2252.73', '32262162', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(554, NULL, '1334504539', 1, 'bac074a6-68a9-3924-96e5-573753a31e25', '2018-12-13', '817.32', '12061815', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(555, NULL, '1207555338', 1, '262d2d07-d272-3e2b-9cd2-1165aad5fcbc', '2018-11-19', '2364.60', '18734142', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(556, NULL, '915821911', 1, '557aafad-5145-3c4d-95c9-5994644b6024', '2018-09-16', '1403.15', '26734000', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(557, NULL, '152302216', 1, 'a4ae48c1-13a8-301e-b8c8-f2c7657928df', '2018-11-27', '2025.46', '6477988', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(558, NULL, '742737639', 1, '01d4c064-362b-3a1b-b2b3-3f3627509a68', '2018-11-15', '2535.35', '3317071', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(559, NULL, '1147863461', 1, '7d7946d2-cf58-3b20-b026-cacf900ddbf0', '2019-03-08', '601.76', '4260696', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(560, NULL, '8599801', 1, 'b3c512c4-9a52-344f-97bd-7af49781a02c', '2018-10-08', '2592.86', '33621157', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(561, NULL, '291655500', 1, '9630151e-c155-3150-aeed-1607452fac7a', '2019-04-08', '791.16', '7159501', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(562, NULL, '269049456', 1, 'a94bb034-7cf3-3d68-878e-11813f4b84ce', '2019-01-06', '377.53', '35597304', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(563, NULL, '913811517', 1, '9a0b90fc-7d1b-3310-9e49-02ea490ee3ac', '2019-01-14', '2936.21', '6335644', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(564, NULL, '1488667406', 1, 'd62eac96-b09f-3729-9485-589a80b2dfb7', '2019-03-31', '2083.05', '44015304', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:47', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(565, NULL, '1515833293', 1, '2396005e-2cd5-387c-b0fe-20b99fa94cc5', '2018-11-04', '1859.13', '25989219', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(566, NULL, '742477582', 1, '21c9ecd1-0023-3305-8516-c76a4bd131b5', '2018-09-14', '541.33', '33370158', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(567, NULL, '682395169', 1, 'a41b0d0b-e5c9-3ecd-8404-f29801c4f65d', '2018-11-29', '1844.71', '5280417', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(568, NULL, '435696063', 1, 'ec1d5a59-30eb-3ae6-a245-62bad0de44a1', '2019-05-03', '2561.05', '23204108', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(569, NULL, '1236188584', 1, 'ad9ca7db-8400-3eb6-ae0a-e1c6b967fba3', '2019-01-01', '2672.22', '3106719', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(570, NULL, '1427673416', 1, 'aa954ca5-dad7-34e6-a837-118fbd71ad2b', '2018-08-01', '2470.49', '19953893', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(571, NULL, '1546251314', 1, 'e29ea54e-8b80-35c2-ae44-b6806b29835a', '2019-04-07', '2856.44', '1196618', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(572, NULL, '850962909', 1, 'b328f842-fd6f-34a3-acfe-87f3f6d21398', '2018-06-16', '1228.63', '45095342', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(573, NULL, '1176446429', 1, '7b7979d7-bbaa-3f16-b6c9-04a27361f7b7', '2019-03-21', '2224.92', '11919606', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(574, NULL, '560124299', 1, '9cff6445-dc18-3ff7-bffa-c1c2fe056fa7', '2019-04-07', '1355.88', '4936416', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(575, NULL, '193751994', 1, 'a76e94b1-dfa2-3f21-a725-336e20509314', '2018-10-16', '1710.35', '26623142', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(576, NULL, '243171551', 1, 'bb084518-4448-3c28-83ed-41b7b6222ee0', '2018-10-03', '2586.47', '35371602', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(577, NULL, '704204798', 1, 'efcfc760-4a0c-3a02-9f39-a2134d08a3e0', '2018-11-18', '2759.12', '42283856', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(578, NULL, '358330298', 1, '08601d1f-1a9d-311e-8b70-2102bb1fd810', '2019-03-19', '2475.61', '34859660', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(579, NULL, '565362339', 1, '39767ec3-62f6-35e8-83f8-0990b5180ed1', '2019-02-25', '1372.94', '34644149', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(580, NULL, '423299271', 1, '6acc871d-7bba-3650-8c60-ba55b9e27f0d', '2019-05-30', '326.97', '34471467', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(581, NULL, '899707975', 1, '59e7b46a-e272-3a52-bb6e-0689baad36b2', '2019-05-27', '2111.33', '3555996', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(582, NULL, '32902353', 1, '8ec1efcb-994e-391a-acef-ae5baf36d9c7', '2018-06-29', '2275.63', '35783978', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(583, NULL, '69172037', 1, '6be7b851-7630-3135-92c3-be6a572951fd', '2019-03-24', '2086.88', '24793035', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(584, NULL, '994831805', 1, '450edb63-dae8-351c-ab42-b9fe1a3b83e7', '2018-10-22', '1414.28', '31531781', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(585, NULL, '1116184778', 1, '7fc35d03-d66e-33dd-9de2-105b6ac5d95a', '2019-03-17', '1954.21', '5780136', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(586, NULL, '62494648', 1, 'c6e3f1db-07ae-3a71-bcf8-c278feec60c6', '2018-09-09', '1928.15', '49705814', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(587, NULL, '948052533', 1, 'fd180301-45e7-3b71-954c-8c97282228eb', '2018-11-21', '1324.84', '17315503', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(588, NULL, '1048029051', 1, '58420532-9e9e-3901-89f1-aefe950fd9ba', '2018-07-27', '365.79', '22607503', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(589, NULL, '450311263', 1, '090ad481-9b4a-318b-9e48-ccf31f4b6638', '2018-10-07', '337.54', '2532871', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(590, NULL, '1538164265', 1, 'a3d79b2a-0a56-365c-8c49-167f73c43c3b', '2018-08-17', '1438.22', '37499010', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(591, NULL, '800381843', 1, '397ef9eb-7673-392c-80ed-885835afa1b9', '2019-04-23', '2792.97', '20774341', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(592, NULL, '327597778', 1, '2d2afc5e-38b5-3dc0-9034-ee5366b07ee9', '2018-11-02', '2305.70', '36540820', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(593, NULL, '586592096', 1, '31a3eccf-7d07-3e45-ba38-c16cf58224f8', '2019-06-01', '2949.80', '2877810', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(594, NULL, '172847985', 1, '97bb913d-da60-3f57-982b-97743c601d28', '2019-02-01', '780.13', '39123900', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(595, NULL, '313582575', 1, '7cf30bcf-a89e-3f87-a12f-0645dae68408', '2018-11-26', '2896.99', '37842662', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(596, NULL, '386454935', 1, '972dae52-5be0-3001-aa56-a47f28a4273a', '2019-05-29', '1832.81', '21165282', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(597, NULL, '233978186', 1, '5bf15e23-fbbb-38f8-a6b2-a9da9c3172e6', '2019-06-06', '2898.95', '40915909', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(598, NULL, '1179206011', 1, 'cc6bb9df-e13e-30fc-9db5-df280d0d404a', '2018-12-13', '1444.08', '1203399', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(599, NULL, '372010357', 1, '3e93eae6-cae9-3c17-bbc5-be37631bde86', '2018-07-18', '464.92', '40799701', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(600, NULL, '1348595724', 1, '3fdbe8bc-3b14-3c8f-bb11-2b4f25d0c43a', '2019-04-02', '1650.69', '8962644', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(601, NULL, '999037055', 1, 'cd0dffd3-43c9-300c-849d-cdca32b3430f', '2019-04-20', '1208.32', '38194807', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(602, NULL, '1029596503', 1, '3e68223d-1294-334b-a526-3ee0dc2a3c0b', '2018-11-25', '1156.28', '20764900', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(603, NULL, '1033769498', 1, '03486a59-8840-3780-bb18-a6fd0403899c', '2018-10-06', '1064.52', '7679252', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(604, NULL, '1432544178', 1, '482de6e8-30e5-311e-ab82-e7b5bacc6bbc', '2019-01-11', '2019.62', '8807694', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(605, NULL, '1126779618', 1, '1a8b74ba-bb99-34eb-b7c7-a612afa37943', '2018-09-01', '2422.29', '41341022', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(606, NULL, '1414024773', 1, 'fa8e740b-e75f-3d27-b2ce-1b980ab3cbaf', '2019-03-16', '1030.51', '47774967', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(607, NULL, '444411536', 1, '5c3d135b-886c-320c-9bfa-4256dfb70f55', '2018-06-20', '1117.10', '20735291', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(608, NULL, '537821024', 1, '7af9ea71-9a0f-3a15-872e-0bdcb6a77709', '2018-10-06', '1221.42', '42387904', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(609, NULL, '408039080', 1, '702a4439-63c0-3a99-ac3e-f09d25b4cbad', '2019-04-10', '396.64', '10999973', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(610, NULL, '1033145384', 1, '5d07af56-71c6-3972-9914-c862a34bc3f3', '2019-03-11', '1929.13', '46584095', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(611, NULL, '268469105', 1, '31c59001-df6a-3a9f-a415-a1b3fe08c849', '2019-05-18', '1157.64', '31423756', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(612, NULL, '898989741', 1, '40574fe8-6a86-37f1-97fc-363fe24b22e8', '2018-06-14', '2144.54', '20910388', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(613, NULL, '572118357', 1, '2191ba91-9eba-35c0-9f63-08a753f26205', '2018-09-07', '1782.93', '41900050', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(614, NULL, '682272549', 1, 'e69562c9-da31-33f2-86a1-ee3780a2f378', '2019-02-18', '1203.25', '48663665', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(615, NULL, '1245242531', 1, 'a83bd5fb-0121-3094-b7f4-4621099032e4', '2018-08-25', '2491.59', '36350068', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(616, NULL, '85326457', 1, 'e9044d6a-9a8c-3d56-b23f-12584c0d3a61', '2018-08-01', '1381.26', '44276873', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(617, NULL, '1188005699', 1, '6372341d-8c5a-39e0-ba7b-efd58851a1f5', '2019-02-25', '1221.33', '27187462', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(618, NULL, '219395418', 1, '35e93152-5f93-3ede-b164-f2fb29bfd85e', '2019-02-05', '2778.38', '9748793', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(619, NULL, '762385220', 1, 'eeccb321-398f-3afc-9b2a-aba9aa167186', '2019-05-23', '1148.15', '5338432', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(620, NULL, '508579135', 1, '95965628-78e5-3cb3-8468-c9b0d748a40e', '2018-11-30', '2301.26', '16650891', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(621, NULL, '120331167', 1, '7dc375c0-5e15-3d67-abdb-e9d08600f9b2', '2019-05-01', '1270.71', '40482977', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(622, NULL, '1351877743', 1, 'f720fc2e-edc7-311c-a963-3f854750c415', '2018-09-20', '2225.49', '11939440', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(623, NULL, '105074348', 1, '5522ea61-343d-30c9-bd9c-a444fc7bb95f', '2019-01-01', '2037.52', '39831943', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(624, NULL, '587185670', 1, '856b5bc7-edf4-3075-ba54-61f595815c03', '2019-01-16', '2119.80', '15973425', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(625, NULL, '159219186', 1, 'e4875b32-4153-3623-a111-a040fafb13df', '2019-05-07', '2898.34', '36397120', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(626, NULL, '719354307', 1, '9d952a78-4bb7-3c96-b3d8-6b5aba461be6', '2018-11-15', '2565.70', '4721561', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(627, NULL, '1381924792', 1, 'e416f32e-de2f-3965-b9f5-68ebb075142e', '2018-08-02', '2262.16', '44371722', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(628, NULL, '164093167', 1, 'eda65bde-6b10-3752-b75b-970b23b2dde4', '2018-12-01', '2265.07', '48825310', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(629, NULL, '170088660', 1, '25da7766-ad43-3f50-9ad7-f1f3b84f5838', '2018-09-17', '1845.89', '38991017', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(630, NULL, '1370468316', 1, '656f90d5-5fa9-3796-a33e-cd9a1f7c1db6', '2018-07-05', '1619.65', '36293872', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(631, NULL, '500251373', 1, 'df964360-91bd-3e54-88f6-addc2cb0ca3e', '2019-05-27', '2842.48', '43974581', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(632, NULL, '354278197', 1, '0cf257b7-d93f-3e32-b1e4-81e4f6dad7da', '2018-11-03', '1530.12', '20219713', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(633, NULL, '366147752', 1, 'dcc5dce4-3d63-397c-a4c6-e64e9a94fd81', '2018-10-02', '1455.05', '47495519', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(634, NULL, '1035341405', 1, '086f52fa-f6a6-3b73-baef-605c92c5f4a6', '2018-10-14', '1799.43', '14307630', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(635, NULL, '303899790', 1, 'a29e10b4-f355-3b2e-94fd-dde0303b3048', '2018-10-12', '1842.52', '19259153', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(636, NULL, '1204402863', 1, '550c48db-7462-3b7f-bfb3-bc0bd91ae7da', '2019-04-09', '2437.97', '45502453', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(637, NULL, '1055368908', 1, '77a4e62b-a67f-3c11-8c7b-30ff58c120b5', '2018-12-23', '1641.43', '30644202', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(638, NULL, '373507080', 1, '09a93c32-775f-3526-8e50-060db59317aa', '2019-03-25', '2699.94', '10975832', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(639, NULL, '176984581', 1, 'af2b8566-f384-3fc0-93e9-235f1bf4a1c9', '2019-05-18', '2650.86', '27182915', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_progressive_motivating_firmware_1`, `_snipeit_customer_focused_actuating_knowledgebase_2`, `_snipeit_self_enabling_6thgeneration_interface_3`, `_snipeit_synergized_grid_enabled_archive_4`) VALUES
(640, NULL, '1527350260', 1, '173952df-1ed1-3467-b4ba-4eba93b7a711', '2019-05-25', '2770.93', '41084645', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(641, NULL, '651420258', 1, 'c0171d8f-69d3-36c0-b97a-8fab21012282', '2019-02-16', '1203.67', '46568841', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(642, NULL, '1154804914', 1, '44250c81-75b7-3c02-9bab-70542d16511b', '2019-01-26', '342.24', '29532654', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(643, NULL, '489539156', 1, '07259983-2d99-3853-99fc-29e6feb3285d', '2019-03-28', '560.16', '32617780', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(644, NULL, '483460123', 1, '3b58d726-7809-313c-86a0-4060b6ad89ae', '2018-12-25', '2741.70', '29117624', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(645, NULL, '923253613', 1, 'e52421ea-4797-3f83-a0fc-4982da7be69f', '2018-12-22', '2831.92', '46036895', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(646, NULL, '245895000', 1, '3e49baef-6c4b-37e3-973a-f66c0e165fda', '2018-11-12', '1377.28', '25422997', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:48', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(647, NULL, '542209358', 1, '3d4f0aa6-327f-383f-80dc-541b8bef7983', '2018-12-10', '2187.54', '23639562', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(648, NULL, '634149926', 1, '45055a90-becd-32ab-8880-00425a1545a2', '2018-09-04', '2499.83', '9082691', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(649, NULL, '980649948', 1, '32ba2e43-8ca6-3d26-acca-da2d64056f59', '2019-03-31', '2658.26', '49237896', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(650, NULL, '229182712', 1, 'eeef5fb2-000d-39db-ada1-6b634a12be26', '2018-12-16', '1260.27', '19954059', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(651, NULL, '24708841', 1, '34e1e5a3-ebf4-3027-8f6a-352d04ecc290', '2018-12-18', '2789.02', '13961543', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(652, NULL, '49513662', 1, '980a65c5-88bd-3c00-a0d4-7c05907916a1', '2019-04-03', '1899.63', '45790538', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(653, NULL, '431534145', 1, '6be85ea5-2d72-3290-b9ac-1f10c21edaa9', '2019-04-18', '1982.89', '26457759', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(654, NULL, '144623440', 1, '0d1ef44b-331f-3472-8b32-447c036130b6', '2018-09-05', '386.71', '40286828', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(655, NULL, '356471257', 1, '98727b20-4202-3f97-83cd-85db33d26211', '2019-03-27', '706.40', '39546341', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(656, NULL, '1422424692', 1, '1974ae47-8691-3543-a1b6-142e17790331', '2018-07-08', '2711.20', '24574799', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(657, NULL, '1489912162', 1, 'b106e1e9-1b51-3598-bd6d-84f03e7fc2f9', '2019-01-12', '711.93', '13039802', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(658, NULL, '62125084', 1, '2ac84c9a-3531-30bc-8588-e9a6bc654f62', '2019-04-28', '1250.19', '8767947', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(659, NULL, '721959537', 1, '392a4c39-a8c8-3788-ae7f-5901a40aa99f', '2019-02-24', '461.50', '39802308', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(660, NULL, '1009509327', 1, '07944637-6769-30e1-ad93-e2f4f2a3599e', '2019-03-03', '487.82', '7159553', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(661, NULL, '327543447', 1, '4ce98c4e-d291-30a8-9d6f-f8be2155a990', '2018-09-24', '2781.49', '30750773', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(662, NULL, '1531774369', 1, '1c6f84f7-3306-3274-88e4-2f3cad3fa6b0', '2018-12-24', '1555.97', '41415105', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(663, NULL, '818564643', 1, 'a4766d65-ccea-3313-9c05-0744eb29dd81', '2018-06-26', '1904.74', '33435391', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(664, NULL, '1277406524', 1, 'eebc29ab-2aae-3f90-8e47-8f7f9f0c059d', '2018-12-20', '651.26', '31644372', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(665, NULL, '1113428711', 1, 'db7c8a6f-d8d0-3fea-8c4f-e52c9938abac', '2018-08-12', '2397.20', '3101078', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(666, NULL, '105626782', 1, '97e54745-36a3-36eb-a666-4693c3d6d636', '2018-11-03', '2688.02', '1969307', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(667, NULL, '569784951', 1, '9510fd9e-baa6-3178-ad8d-6c6779d0df74', '2019-01-19', '1246.68', '43861724', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(668, NULL, '1213764369', 1, '991bb3b4-6b40-3653-a414-0541b5d0dd89', '2018-12-05', '2653.42', '34628538', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(669, NULL, '875343894', 1, 'd704e262-7ee3-3597-83a7-153aa55eef83', '2019-03-03', '1220.55', '45717176', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(670, NULL, '419265401', 1, 'fa477fce-9d0b-361b-9c6d-4d8ad4ee6cec', '2019-01-31', '1896.13', '20386533', 8, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(671, NULL, '1219314997', 1, 'faf6341c-0109-3b06-a0c2-0ff90afbae7d', '2019-01-17', '1206.84', '40660281', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(672, NULL, '510698199', 1, 'e0ea836d-e628-3d6f-a071-209491944532', '2019-04-28', '1134.18', '24225292', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(673, NULL, '1347403766', 1, '4264391c-b733-3980-9c94-a0974f978eae', '2019-03-26', '2782.30', '21893291', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(674, NULL, '342700503', 1, '0c343a56-5779-38c2-9218-2a3c876e1ae2', '2019-03-07', '744.78', '33888257', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(675, NULL, '1504810825', 1, '6d179382-c41a-3900-96cd-5f1d554b9149', '2018-06-18', '2550.59', '32444269', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(676, NULL, '655783351', 1, '86dcf480-0fd5-3f78-a16c-036a3352be53', '2018-06-12', '1367.03', '37265653', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(677, NULL, '462334044', 1, '2eaf4a57-02d4-32dd-8c15-557d092d7350', '2018-08-02', '1665.29', '6931960', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(678, NULL, '156990490', 1, 'd091ce2d-14b1-3cbe-9057-2257eed1d3ee', '2019-01-13', '2665.06', '13799392', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(679, NULL, '507567571', 1, '9e28d8e2-96e7-3672-9656-0f0726b0d345', '2018-11-17', '2087.06', '36027421', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(680, NULL, '1065926993', 1, '25180b2d-3905-3de8-bf50-a020f87b8041', '2018-12-16', '1281.30', '49385897', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(681, NULL, '372671423', 1, '3a47c29a-506b-397b-9dc6-ba9d10624650', '2019-05-20', '1380.21', '43979306', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(682, NULL, '838300824', 1, 'f28e2dbc-c6e7-3f85-88b1-1c72030c9e53', '2018-12-02', '2368.37', '42060457', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(683, NULL, '1259500200', 1, 'e1c8bf18-7c40-3be4-96cd-78304e60a89b', '2018-07-24', '2771.13', '8132555', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(684, NULL, '1479151095', 1, '2718a930-a46d-3701-be65-c5b7de37474a', '2018-07-25', '2498.05', '1669059', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(685, NULL, '176457963', 1, '332b6e04-05d0-3c7b-a6d2-c283306f05f0', '2018-11-05', '2183.71', '31772460', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(686, NULL, '1536569547', 1, '8389e3da-a056-3853-a0a2-223233a4e6ac', '2019-06-10', '2068.25', '19465274', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(687, NULL, '1487604848', 1, '9c7916ee-a513-377c-847b-c50f5d2cbd57', '2019-03-06', '1802.12', '48207129', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(688, NULL, '741883240', 1, '5f2a7fd6-04e5-3862-9a23-cde19afc636f', '2019-05-04', '1287.52', '1646985', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(689, NULL, '155353754', 1, '85ddef97-82dd-3ec9-8fdb-5b3f55154743', '2019-05-22', '2468.03', '20402755', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(690, NULL, '817007997', 1, 'af4ee496-ae49-37a5-967c-773934318deb', '2019-01-21', '1532.36', '22588604', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(691, NULL, '1214659595', 1, 'df356eb0-4705-3eea-87fc-8fc67cdabeb7', '2018-07-13', '2244.45', '45824115', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(692, NULL, '143176099', 1, 'f061162b-541c-3eb4-8fda-77936f22925a', '2019-02-19', '1279.65', '17031742', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(693, NULL, '418754688', 1, 'af004bcd-dca7-3748-ad7b-70004b145221', '2019-03-09', '2875.41', '48774374', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(694, NULL, '961209003', 1, '93c9a4e1-9ccf-3076-949c-ab91bafbfddc', '2018-07-29', '2873.95', '3317808', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(695, NULL, '604251162', 1, 'ffd84f71-6a53-3c45-9a7a-36bd974e9a75', '2018-09-24', '2631.18', '12627401', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(696, NULL, '1541707449', 1, '66da4de1-b65f-3537-ba42-93e4d6ac630e', '2018-11-21', '2687.59', '16337683', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(697, NULL, '1349785955', 1, 'e8da275e-a21f-3d11-a0a3-c8aa6df5be9d', '2018-07-26', '2328.36', '29041096', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(698, NULL, '1421963602', 1, '37c3511d-aaf5-3574-b8b9-d054c0baac56', '2018-06-28', '1058.57', '9995809', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(699, NULL, '1464185489', 1, 'd5ada18e-ba3f-3585-81b4-ad32f55c9739', '2018-06-20', '2729.60', '31042402', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(700, NULL, '776361983', 1, '2fa5ab23-b834-339f-9501-72e6f6217281', '2019-03-28', '2290.83', '38641176', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(701, NULL, '403099620', 1, '7a0df4e7-4b16-3039-bcaf-609d2bdc1145', '2019-02-05', '2833.06', '8617681', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(702, NULL, '1112518503', 1, '2483177a-2f3e-331f-b96a-8404b4284788', '2018-09-04', '1509.42', '39030417', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(703, NULL, '37406557', 1, '7f17cc1d-4d22-3f6e-9460-3b5caa1135eb', '2018-07-18', '595.57', '42917205', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(704, NULL, '403088377', 1, 'd0a489cd-d843-3770-8417-76926c186dda', '2019-02-06', '531.03', '23340711', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(705, NULL, '1471469596', 1, '29ab89f4-806b-3dd9-99e7-66c0e390211d', '2018-06-14', '756.70', '16875251', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(706, NULL, '351381605', 1, '8e9af0e1-f07a-3d7c-9457-73141688d4e5', '2018-06-26', '2620.96', '2972098', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(707, NULL, '1176657360', 1, 'af73b79b-687f-3ef8-b00c-1cb1fb2f5d88', '2019-02-24', '2909.25', '10943936', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(708, NULL, '297966133', 1, '9be59ff4-8b77-3ae2-b06f-cfd8fa62a013', '2019-03-01', '308.56', '47581307', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(709, NULL, '474935425', 1, 'b964203d-e554-3924-ae3f-80162b433da0', '2018-08-29', '1176.85', '47754685', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(710, NULL, '110739335', 1, 'beafd9c3-63a5-375d-ac09-b72fa18e2bca', '2019-04-08', '2892.60', '39026604', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(711, NULL, '557424', 1, 'badfb407-fbaf-3a70-aa90-2a637134cd8a', '2019-05-30', '1811.34', '12070746', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(712, NULL, '887665835', 1, '2748d254-08d3-3db1-9aea-87513c3ac250', '2018-07-06', '1370.73', '18925418', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(713, NULL, '1159342795', 1, 'cc3beda3-b4e9-3dd7-87c7-1b1bb5961645', '2019-05-26', '2511.45', '7188861', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(714, NULL, '1264878526', 1, '0a770f3a-2529-3a9a-ad1a-04090d55d99c', '2019-02-21', '842.26', '1062706', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(715, NULL, '513093124', 1, 'a6e7192c-ec1e-3c53-bbcc-bbbec88a6113', '2018-07-08', '2942.17', '49325175', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(716, NULL, '616027621', 1, '162408fa-2e0b-30b6-a902-bdd33c4b4c04', '2018-11-04', '1056.50', '24143366', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(717, NULL, '1263511796', 1, '32f857ff-cc79-3264-96be-3999131f611c', '2018-11-09', '2224.03', '49991907', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(718, NULL, '1041106806', 1, 'aabbd786-d84b-3199-bbc8-d3ac64d6be62', '2018-12-09', '2724.60', '21989810', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(719, NULL, '280488322', 1, 'adb3e8ca-040b-388b-91d2-7903992e329e', '2018-10-31', '1320.53', '47449897', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(720, NULL, '1001719608', 1, '8199b552-c7c1-324e-ab9e-e9e0410c94f3', '2018-08-14', '1238.05', '24257528', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(721, NULL, '1328690952', 1, 'bb440fef-21da-33d9-b012-192909e042a7', '2019-03-25', '326.49', '29269298', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(722, NULL, '399273217', 1, '06e3b762-281b-3af6-90cf-abf1085acc72', '2018-06-18', '986.83', '13398852', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(723, NULL, '1242162086', 1, 'ae009d50-bb52-33a1-b539-23d1fb9a57d8', '2019-04-06', '2780.95', '36771918', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(724, NULL, '1075941503', 1, 'f83480f2-2400-3f74-b946-7a13b6aee8cb', '2018-06-30', '531.01', '10817672', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(725, NULL, '120128284', 1, '357870a7-815e-3925-8cab-c2447989481b', '2018-11-06', '2265.30', '5046332', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(726, NULL, '1067416318', 1, 'b218818d-70e3-3957-8942-608f7338fcbf', '2019-05-24', '2651.57', '31044352', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(727, NULL, '1043190046', 1, '403db125-008f-3934-bb77-df059b4942f0', '2019-04-27', '2720.31', '30575040', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(728, NULL, '904564803', 1, '8d9b66bd-eb31-3eb7-aa0b-9e9772b720ec', '2018-12-08', '2491.36', '16842501', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:49', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(729, NULL, '234910815', 1, '84e1a853-6c94-396a-aa9f-52958ac08952', '2018-11-22', '1236.02', '26062333', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(730, NULL, '1556912713', 1, '74f972a9-18d6-3361-b50f-c4e97597eda3', '2018-12-01', '2088.55', '2405908', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(731, NULL, '204258627', 1, '5ae1e812-c80a-3f43-8e46-1f0148e9a15f', '2019-03-08', '314.53', '39278018', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(732, NULL, '950239212', 1, '47fc35d4-c861-3c70-a7a9-99c3f96e70d3', '2018-06-14', '2980.10', '32744522', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(733, NULL, '1194226073', 1, 'ad771c99-45c8-3898-aa27-b9ee9bbb29cd', '2018-10-06', '2768.78', '32997193', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(734, NULL, '637787488', 1, 'f1b98a96-30e2-31c7-8043-127cf3ad2d9f', '2018-06-12', '2393.24', '46117341', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(735, NULL, '1408654171', 1, 'd3647195-97dc-3e57-91b6-dc931cd5e63c', '2019-02-07', '384.24', '7725404', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(736, NULL, '94999401', 1, 'c9b45f79-7e6f-34ef-a91a-407817d21266', '2018-08-09', '1493.17', '23474749', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(737, NULL, '402417063', 1, '9c37c29b-85bd-3eb3-a607-2c97a3d25d44', '2018-08-08', '2793.71', '45509479', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(738, NULL, '526647799', 1, '5ad0c04a-2486-3063-b8c1-045b6ba20cf1', '2019-03-07', '1593.91', '3454752', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(739, NULL, '1025170875', 1, '36ec3eaa-f1ff-3d3b-b3fa-21c9ed415b1c', '2018-10-17', '1844.61', '42383050', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(740, NULL, '1099623749', 1, '35f37017-2416-3b53-b011-eaae79c19882', '2018-10-27', '2955.08', '17032037', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(741, NULL, '408944136', 1, '1738674a-8830-3cc0-a258-f9f54295ccc1', '2019-03-13', '1606.91', '19471343', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(742, NULL, '635520912', 1, '643f7715-bca7-36e5-a000-47157056217a', '2018-08-24', '393.69', '36415314', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(743, NULL, '1379844877', 1, 'dbd6b2d1-e678-3bd8-8b57-2cccf912f93b', '2018-09-23', '1163.03', '15211018', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(744, NULL, '21330141', 1, '717fcdbe-abf4-36fa-8bc4-8b6cd196659d', '2018-07-09', '1525.16', '36336968', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(745, NULL, '1287241114', 1, 'ddcd0316-7b24-3e11-a391-ac02c01db121', '2019-01-08', '2761.72', '2602962', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(746, NULL, '1201131844', 1, '1bd7982c-0812-3048-ba56-cea44b74fef1', '2018-08-28', '801.71', '20428659', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(747, NULL, '223217056', 1, '8e387127-9c36-348b-aa9f-208d75c9f03f', '2018-07-18', '2057.01', '4904593', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(748, NULL, '1007385487', 1, 'a2ff12fb-e16b-3ef6-a7cd-2bfae5d9acb1', '2018-08-09', '331.96', '37920993', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(749, NULL, '1215697458', 1, '61527a24-b3fa-3039-89a5-935641565ac6', '2019-01-07', '2457.85', '15104358', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(750, NULL, '357869929', 1, '75639a33-b75c-38ca-9fcd-616a7130c46a', '2018-06-17', '845.88', '18344957', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(751, NULL, '811691786', 1, 'fb668af8-74b8-34dc-b87b-ad267a1c9c2b', '2019-04-14', '1042.24', '46655664', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(752, NULL, '1006132326', 1, '194edace-27c0-3938-8f2e-5e7550aaf2f7', '2019-04-17', '1053.60', '15839266', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(753, NULL, '860106818', 1, '8c2371be-8e2c-3253-9b91-d0a39db17459', '2018-10-15', '1742.05', '36709049', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(754, NULL, '1273744271', 1, '4ea06577-de01-32cf-b54c-76295563585f', '2018-10-23', '1944.27', '8402917', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(755, NULL, '684187179', 1, '19d2f352-9fcd-36bd-b638-a9232754e580', '2018-10-09', '1006.57', '17891808', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(756, NULL, '687579483', 1, '4223ff86-98ab-37e5-a647-567674c75d46', '2018-10-27', '1538.85', '48583013', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(757, NULL, '348444706', 1, '0c95ff38-3ec8-324a-b6f3-1656fa2dff69', '2018-10-25', '1074.12', '39502165', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(758, NULL, '135370083', 1, '1f3b3f00-3b35-35d6-afb1-3fec614cee60', '2018-12-31', '1101.26', '37704627', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(759, NULL, '1319799772', 1, '9a72aa34-2348-3833-be39-347f6e863777', '2018-12-17', '1058.88', '18230311', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(760, NULL, '214242545', 1, 'd829a5fb-7a9d-3a03-bbea-ff62ace82754', '2018-12-26', '390.98', '27988870', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(761, NULL, '175332411', 1, 'a8c07158-e97c-39fb-92f8-62728c9a8268', '2018-07-19', '2898.38', '36718887', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(762, NULL, '276974056', 1, '5c288e6b-e46b-3f02-84b2-6dd136d99d68', '2019-04-14', '453.55', '47778574', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(763, NULL, '203862418', 1, '4877b9b2-bae9-3915-84af-03d987738386', '2018-08-18', '2659.79', '19967558', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(764, NULL, '370984172', 1, '2850e4ce-ba64-33df-9281-20941986b18f', '2018-08-28', '911.25', '5306101', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(765, NULL, '131708886', 1, 'fed2a1a7-768f-370c-9e1c-c79176902002', '2018-09-27', '1055.16', '40674111', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(766, NULL, '1156276790', 1, '1334ab42-6dbe-3d5c-ab05-dfb8ce248f58', '2019-03-29', '2534.64', '40416905', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(767, NULL, '600865227', 1, 'd2edbc35-7432-3edb-87fc-da58c7c6054a', '2018-08-19', '518.53', '44815378', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(768, NULL, '573885409', 1, '6e6839df-3a4e-39a8-a147-edb4fb89b5b4', '2018-10-09', '1271.87', '16486556', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(769, NULL, '890685348', 1, '3db91ef4-6709-3e98-af23-c3cd6a78c887', '2018-09-23', '2454.96', '12664895', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(770, NULL, '155420036', 1, '1719130f-c84f-3462-8c0b-7aaeaa864c3a', '2019-03-07', '2299.88', '2441297', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(771, NULL, '751959830', 1, '640b018b-e9f9-38cd-9119-68dbe60d3e41', '2018-06-23', '2791.04', '33823315', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(772, NULL, '478739480', 1, 'c656696f-4339-33b8-af3c-8490db0fc963', '2018-12-28', '1539.81', '25222614', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(773, NULL, '222820857', 1, '5d98bd07-6aee-315f-af3b-4b3acb6df25e', '2019-03-15', '2795.63', '39339092', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(774, NULL, '760524533', 1, '50767b1f-aeac-38f5-b2bd-6c044c7943b1', '2018-08-10', '1665.82', '47442323', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(775, NULL, '1539113977', 1, 'ef6f2f83-97ff-3619-9ff1-dd389b0399dd', '2018-09-14', '1422.44', '33999418', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(776, NULL, '620321913', 1, '2f6f8e5d-34c7-3ed4-8f74-187616e8728a', '2018-12-02', '1588.26', '34190662', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(777, NULL, '244302314', 1, '9269ec5c-f9c5-316e-9b97-dc628f9c7e09', '2019-01-04', '569.09', '21724729', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(778, NULL, '216497600', 1, 'd56c79eb-4aff-399a-b961-ff54d38c0f49', '2018-12-23', '2663.66', '18915463', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(779, NULL, '25179182', 1, '8a6dc1f1-a05c-3126-a396-ee12f42fa3c2', '2019-01-20', '1498.28', '17672531', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(780, NULL, '1199926844', 1, '14dad0ce-6936-310c-81e1-048a01c91c12', '2018-07-18', '562.32', '26712739', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(781, NULL, '1098562955', 1, '3022d3f8-a0c8-3210-8640-2ac6208597ca', '2019-03-17', '2375.77', '6001958', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(782, NULL, '719624177', 1, 'e9feec14-d0a0-3f78-93f2-17ec738803c7', '2018-11-01', '2878.21', '10436443', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(783, NULL, '153910145', 1, 'd8a46bdf-feff-3c80-91a3-43fc0e462748', '2018-08-19', '2517.00', '40042383', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(784, NULL, '1268848460', 1, '010cea44-9f9c-37e3-bdfa-ad04620cbfc1', '2018-10-15', '751.82', '46599826', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(785, NULL, '982783704', 1, '084a8442-70ee-318e-8fd1-fc2d341d8dd7', '2019-01-05', '1880.26', '24947013', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(786, NULL, '560916124', 1, '8ef5b9d5-0aa1-318f-a99b-7e12b81fc7b2', '2019-02-02', '1032.72', '16752338', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(787, NULL, '550409172', 1, 'ff34391d-064e-3fee-9872-00ad8ddc5195', '2019-05-15', '1820.62', '40027397', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(788, NULL, '1216300912', 1, '3bf0daa9-9d70-3d8f-98fa-fbfdd8975707', '2019-05-10', '1727.60', '15752779', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(789, NULL, '457718750', 1, '59debbb5-5744-30f4-9a3d-a847d16ff7a4', '2019-06-05', '827.43', '49252988', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(790, NULL, '93337360', 1, 'fa582a3e-970e-3506-a9e7-ff773d46ca50', '2018-11-30', '1576.80', '38401006', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(791, NULL, '532868119', 1, 'e31cb1e3-3b1d-3d08-a461-7a163f6fcf49', '2019-03-16', '2855.07', '28691347', 8, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(792, NULL, '1287919429', 1, 'c34072b7-6da9-3225-b416-8572eca3a786', '2019-03-02', '302.41', '33163257', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(793, NULL, '1018832011', 1, 'f007f2a9-d5ce-36ff-a768-0bab466bc4a3', '2019-02-11', '767.56', '12358885', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(794, NULL, '1022372140', 1, 'f92c9def-2251-39ce-99ce-15fab4bfa42a', '2018-09-29', '2189.59', '2463281', 8, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(795, NULL, '373479205', 1, 'a1a49070-a9a0-3592-a78b-ada9f18b03c4', '2019-02-07', '1184.24', '1240988', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(796, NULL, '735770215', 1, '083b4b51-735c-3bc8-ae9c-ccc51e8a8b1c', '2018-10-28', '724.46', '33924058', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(797, NULL, '839510482', 1, '91b5c82c-fa00-334b-989d-cb2c459008f3', '2019-03-03', '1255.12', '41547494', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(798, NULL, '182592969', 1, '2f8a4167-d3ec-3b3a-9d18-c7437c037795', '2019-05-11', '1715.86', '34518037', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(799, NULL, '831646343', 1, 'a1133849-1232-3ade-837d-ce67dfb1cb99', '2019-06-05', '2667.82', '25139196', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_progressive_motivating_firmware_1`, `_snipeit_customer_focused_actuating_knowledgebase_2`, `_snipeit_self_enabling_6thgeneration_interface_3`, `_snipeit_synergized_grid_enabled_archive_4`) VALUES
(800, NULL, '1446391336', 1, '229cf777-5a47-3586-8faa-a3c91a9d3681', '2018-11-24', '634.11', '16717919', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(801, NULL, '1468327409', 1, '18fc7ed7-1d1f-3f2b-a015-97b5235d41db', '2018-10-18', '2914.97', '10896879', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(802, NULL, '1476738145', 1, '9590a41f-910a-3791-90fc-829e495ef266', '2019-05-03', '1063.20', '28198460', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(803, NULL, '994299899', 1, 'bfc70538-077a-3b37-adfa-573533bc7aa8', '2018-10-07', '1448.51', '49022023', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(804, NULL, '780064019', 1, 'f305473f-6e1a-3e32-a1c0-3b4c4dddafa5', '2018-07-17', '664.34', '3394994', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(805, NULL, '477007794', 1, 'bcce3754-d34a-3316-8f16-08f44ed0d0f4', '2018-09-01', '1193.79', '46079060', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(806, NULL, '1138659385', 1, '851e7f0c-10fd-360f-a4a6-2ae8aac43f60', '2019-06-09', '2792.10', '15791651', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:50', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(807, NULL, '851782218', 1, 'ba96861f-c03e-3cc6-a173-6268d26049da', '2018-08-12', '328.44', '7191977', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(808, NULL, '473438027', 1, '17c274bb-2e3a-3979-abb8-e2a60fd2bbfc', '2018-11-04', '2073.38', '49638589', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(809, NULL, '295201790', 1, '2ecbdc98-bc76-3c5b-9c18-8c2cf4873396', '2019-01-08', '676.50', '36997741', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(810, NULL, '424053040', 1, '11249a1a-ed7f-302e-b1b7-51883cf0b35a', '2019-04-29', '1146.02', '46396305', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(811, NULL, '595833707', 1, '786460ef-9550-3a22-b468-8d99aa484b4e', '2018-06-16', '1267.76', '22461897', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(812, NULL, '1274019176', 1, '58c56aed-d986-388b-9f9a-a6e284b30d83', '2018-10-21', '1629.96', '13162022', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(813, NULL, '791997238', 1, 'fadca35e-fd34-38ac-a280-02257e7e09d2', '2018-07-24', '1008.26', '10372482', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(814, NULL, '874248550', 1, 'a618309a-87c3-37e2-9d8c-2926635c1b9b', '2019-01-22', '2852.37', '33256995', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(815, NULL, '249738466', 1, 'ff3d5abe-0ca9-3369-8af2-cdc7ad7196ff', '2018-08-25', '867.79', '29347400', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(816, NULL, '742050585', 1, '12a973f0-f198-3d0d-8a46-7374863c1cd7', '2019-01-23', '1262.30', '23362296', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(817, NULL, '99719665', 1, 'd2e758bb-c1b0-363d-b1d7-1412f9e3776a', '2019-03-12', '1967.88', '41845641', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(818, NULL, '343583361', 1, 'a509d4eb-8c82-3ff6-8f5d-c9a44cbce612', '2019-06-02', '1710.73', '14245619', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(819, NULL, '1000611417', 1, '9038dff5-f745-3fa9-8e43-98938279aa93', '2019-02-21', '2244.49', '33045547', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(820, NULL, '1248851047', 1, '4067ac88-9f3f-3940-afb1-8d7d0fb8b642', '2018-12-23', '1266.44', '18107085', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(821, NULL, '1014117730', 1, '39be998d-6ef2-3427-9cbe-8fccb05a1722', '2019-01-24', '2929.77', '9659330', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(822, NULL, '1552273672', 1, '51b8197d-6b4d-3c9d-880b-f2227ac5928e', '2019-06-04', '1393.22', '12145224', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(823, NULL, '25452275', 1, '6d83990f-2467-3624-b96a-f2d1c0bf31f9', '2018-09-18', '1950.21', '38783105', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(824, NULL, '541332519', 1, '07bcd0c7-c656-3363-a11d-626d07357274', '2018-12-24', '2328.18', '9636206', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(825, NULL, '284489135', 1, '0264f5a1-7cda-3b0d-8a92-0c7f3c27891e', '2019-02-02', '2920.42', '35276217', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(826, NULL, '1262391312', 1, 'a50b96bc-251c-364f-89b9-52f4e62100b3', '2018-07-04', '1422.89', '28372107', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(827, NULL, '208945163', 1, '8efef007-6bb0-3e26-b70b-599e377bcf43', '2018-08-06', '376.81', '38118143', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(828, NULL, '1472572787', 1, 'd3655a24-8793-363a-b7de-c8f3b778e243', '2019-03-29', '1783.74', '30371119', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(829, NULL, '776909129', 1, 'e81413a6-70d4-3b26-997a-64e558ef27aa', '2018-11-01', '1143.94', '39234137', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(830, NULL, '605680117', 1, '9829ac19-0d1d-337a-af2a-bbe5f4156173', '2019-03-28', '2995.21', '6896014', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(831, NULL, '1074185799', 1, '2f5873ca-fba4-304e-8f3b-d45f0fc39c3a', '2018-09-07', '2167.56', '47200725', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(832, NULL, '40507159', 1, 'e4da7604-57b1-3519-8ecb-fe81b2b3c498', '2018-06-25', '1466.16', '4829620', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(833, NULL, '279138006', 1, '1ee7b474-3672-39fb-af44-ae824302bdc8', '2018-08-19', '1363.70', '39816451', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(834, NULL, '272795978', 1, 'b61d558f-49ec-3d42-b6c2-b576a8ffd746', '2019-02-01', '2621.95', '2128854', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(835, NULL, '678868132', 1, '1b6e6682-f263-3b84-b2b5-d903e68c6ab9', '2018-06-26', '568.08', '41640448', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(836, NULL, '1412774399', 1, '46922042-56d2-3d9f-bd97-8ddd3ceb8c42', '2018-08-21', '2278.30', '21783285', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(837, NULL, '1035227890', 1, '82cc97f2-d1fe-3d1f-9c5c-b110ee6f9e31', '2018-12-17', '369.68', '40197711', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(838, NULL, '734044288', 1, 'dc96b7cb-f4a0-33f8-8f06-ff2ae01a1a79', '2018-10-16', '1147.24', '18033162', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(839, NULL, '811684899', 1, '8fb2e68c-8e98-3245-a49c-f36e0e827b05', '2018-07-27', '1830.15', '29715642', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(840, NULL, '1057570720', 1, '1eccd927-fada-3ac7-91a7-b10b88ff84b7', '2018-11-06', '2771.35', '16469858', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(841, NULL, '35655034', 1, '8382c3a5-0c49-3c69-8e58-07e582d64fb0', '2019-03-13', '1539.11', '3619610', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(842, NULL, '775450327', 1, 'a92e7099-61e8-3fd7-a077-3ba86e7fe91b', '2018-10-31', '2112.47', '48645897', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(843, NULL, '427303904', 1, 'ddb6cc8c-d461-3452-b75c-04d8d0bf8a38', '2018-07-09', '955.96', '9675399', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(844, NULL, '329310443', 1, '5d21fc38-f65d-3bf7-bad9-e9eb9b388ee8', '2018-12-28', '379.70', '41933526', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(845, NULL, '1372385669', 1, '046e9636-47f1-3c26-acee-3cf156fd2de0', '2018-11-12', '2999.18', '40330535', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(846, NULL, '64874843', 1, 'db2c4ac2-2f17-30cb-99e3-18d2d175e027', '2018-10-15', '2694.99', '33093897', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(847, NULL, '300941476', 1, '87fc2002-7731-3fcd-9e1d-7c200ed356b2', '2018-12-01', '1014.66', '33204704', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(848, NULL, '230637581', 1, '387890bd-dc1c-3915-9cff-bf1266fdfea1', '2019-04-22', '358.31', '21087254', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(849, NULL, '449920085', 1, 'ed34da9d-3782-3dc5-bf5a-1ca391b2cde1', '2018-09-13', '993.57', '14965798', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(850, NULL, '1427351460', 1, '04ea007b-2af3-3c70-9106-5b02a8213b1c', '2019-01-29', '2002.00', '24953919', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(851, NULL, '229364907', 1, '53700716-2a7a-32a3-8427-baa0d1e1297f', '2018-06-14', '2442.83', '43146938', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(852, NULL, '814757981', 1, 'db3c37c1-0337-3b71-b711-3cd0bdc8ae3b', '2019-01-16', '1497.31', '36165402', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(853, NULL, '1079712241', 1, '6a3ab337-98c4-3b63-95ae-366d354d4b84', '2019-01-19', '735.97', '10894810', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(854, NULL, '117571393', 1, '4a21b4c5-7813-3b4c-b359-28147aaf1e49', '2018-06-24', '1086.01', '3957498', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(855, NULL, '814647414', 1, '3293b14d-3049-3608-bc47-4296310ddeb3', '2018-10-29', '1948.93', '18161196', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(856, NULL, '1436319241', 1, '57d20d34-ad76-3627-85ba-108b62bc5b41', '2018-12-06', '1280.11', '31158742', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(857, NULL, '234712872', 1, '38de48b2-3eab-3f3d-b48c-889c1f478575', '2019-05-03', '2966.97', '45582421', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(858, NULL, '562487920', 1, '246cf90a-a516-3431-8387-c5e7a6b37e60', '2019-01-09', '755.59', '4628525', 10, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(859, NULL, '277792958', 1, 'c3ecc498-d78f-3656-9299-7dca8c397bff', '2018-12-07', '878.33', '2940915', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(860, NULL, '1047696561', 1, 'd559f203-812c-337b-af2c-684657871118', '2018-10-04', '601.33', '34090222', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(861, NULL, '513251335', 1, 'd2a423d5-49ba-3651-a53a-c027e5856190', '2018-09-23', '2331.71', '41835867', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(862, NULL, '429770783', 1, '1560437d-c08a-3fb6-b79f-d71a5cdce311', '2018-06-22', '1575.07', '30548628', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(863, NULL, '1063784783', 1, '912a90a5-8b2b-30ad-ac88-b493f095203d', '2018-11-17', '963.70', '40487258', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(864, NULL, '1112975833', 1, '433a92c2-4c27-3a7d-a6da-446d995bd5d3', '2018-11-19', '1557.61', '30858753', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(865, NULL, '314020229', 1, '9eb9b269-489b-3947-9553-037092cc031f', '2019-05-03', '1967.87', '8107267', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(866, NULL, '926152731', 1, '715142fa-bb3d-31c6-8746-5ccbcf0b8972', '2019-06-03', '2283.05', '26634730', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(867, NULL, '796312089', 1, 'd7be4ccb-260e-3385-8e79-afadf419aba4', '2018-07-19', '1212.31', '16206276', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(868, NULL, '1091972611', 1, '637e41d1-a163-3b1e-b7e7-858b215e042b', '2018-11-11', '1700.69', '45478347', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(869, NULL, '1304330572', 1, '8c11cfb4-5360-3532-8c3d-36a91c752594', '2019-05-13', '1702.97', '39858546', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(870, NULL, '62739085', 1, 'e7bd52d1-a349-32d4-906b-9a97dda23241', '2019-04-23', '2453.49', '19223343', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(871, NULL, '49469962', 1, '019c9030-eab6-3761-8d43-c38ae8679e17', '2019-04-13', '2089.88', '30268372', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(872, NULL, '101148012', 1, 'f62ed791-267f-315a-8fae-77091619613d', '2018-09-07', '1365.57', '45417720', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(873, NULL, '434479462', 1, 'a3c415dc-f25b-3a31-8a9f-f7077151c581', '2018-10-04', '2754.38', '48863561', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(874, NULL, '942089807', 1, 'abe618a6-fe33-37a5-8888-fd6674629387', '2019-06-02', '1488.64', '44712531', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(875, NULL, '1297611435', 1, '8e560688-e30f-3997-a860-f68be9910020', '2018-07-29', '901.57', '6191181', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(876, NULL, '469616890', 1, '6ad205af-5d96-38f5-9a34-966289b2bbd1', '2019-05-22', '2321.78', '32651011', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(877, NULL, '123520400', 1, '744932a0-cb93-3000-98b2-72981fddc56a', '2018-08-04', '371.64', '35748628', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(878, NULL, '949607677', 1, '02dec16d-aacd-3998-97f6-f3e542cbe9d9', '2019-04-18', '2300.78', '8494813', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(879, NULL, '921137361', 1, '35dba935-4b91-386e-9682-505641e73c6f', '2019-06-02', '1274.14', '34746299', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(880, NULL, '904900604', 1, '0ea82e33-4227-3f90-9b65-b28d65dd7a73', '2019-03-09', '2813.96', '22734805', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(881, NULL, '1067099630', 1, 'ffc5ac8d-c8fb-3ac1-a111-651eab487f08', '2019-02-08', '2474.44', '32305785', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:51', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(882, NULL, '1047920165', 1, 'e4480bd8-ad5d-3b52-b42a-6d63a484f427', '2018-09-29', '2863.10', '6340893', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(883, NULL, '1110223811', 1, 'de6e1549-85f5-3244-b1ff-4b925b468173', '2018-08-21', '1209.73', '20880141', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(884, NULL, '190649470', 1, 'c908fc58-c820-346b-9ca6-1807eb094b01', '2018-10-25', '2472.09', '30649105', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(885, NULL, '175947661', 1, 'be19c45e-64a8-319b-b371-aee51829aaa1', '2019-03-24', '1786.87', '32390294', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(886, NULL, '1312205163', 1, '7f00b929-2d5c-3ce2-99b0-92e4313512dd', '2019-01-14', '1515.76', '25361679', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(887, NULL, '508827123', 1, '787beb5e-d15f-3d13-85b5-c42c69de8856', '2019-01-25', '840.81', '46141564', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(888, NULL, '1243959415', 1, '8311deb4-41cd-3d48-b8c9-ae2f4ce58a19', '2018-08-24', '1119.27', '28904305', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(889, NULL, '244437148', 1, 'b0b5a443-c89d-39be-bc48-b14fec9983cd', '2018-10-06', '653.93', '19890195', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(890, NULL, '1093225520', 1, 'f18217cf-c10c-31bb-9aab-46f3d0a58162', '2018-07-02', '1870.80', '28015551', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(891, NULL, '935901404', 1, '833059ca-d586-3356-a3f5-e6344fbd95d0', '2018-10-28', '2918.73', '19193338', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(892, NULL, '1397101342', 1, 'b2eeeabf-f6c4-32e3-b652-040b6c60494f', '2018-06-22', '2811.83', '13258956', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(893, NULL, '13786462', 1, '2ffa77cb-4973-30b2-bf97-dee026948ce9', '2018-08-05', '515.93', '17590149', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(894, NULL, '139088740', 1, 'e0069619-b55e-347e-9a99-6ce448c39855', '2018-12-03', '2966.39', '41803144', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(895, NULL, '1020661271', 1, 'cf289198-ff3a-3b68-9442-892d6ca287f5', '2019-01-26', '1543.43', '26771403', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(896, NULL, '869491614', 1, '1cdc8c8b-528c-3899-a6bc-ff36f3b826f1', '2018-06-21', '1461.73', '13013546', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(897, NULL, '1520966141', 1, 'a4b51899-040c-3611-9388-dac1b7d1f226', '2018-09-09', '2794.96', '49080872', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(898, NULL, '246791210', 1, 'dd1481fa-eed8-3e6b-a166-f2a72c01949b', '2018-10-06', '2552.72', '11682342', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(899, NULL, '739494268', 1, '437c5ba8-7a3c-3495-b2d9-7fa489707a77', '2019-04-05', '2482.55', '37946242', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(900, NULL, '76153651', 1, '21bec55c-c627-39cd-b4da-aa12817d0dce', '2018-08-15', '2628.27', '34315000', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(901, NULL, '1278284958', 1, '153a57ea-609b-3334-ba27-746588329359', '2019-02-17', '2838.73', '38418078', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(902, NULL, '204476664', 1, '701b714a-c666-3649-81cb-e2572f7d27ea', '2018-11-12', '2066.33', '22146038', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(903, NULL, '1122189591', 1, 'fa870972-14dd-3058-9473-a8879e9054e7', '2018-11-28', '2616.98', '44530943', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(904, NULL, '867224078', 1, 'f13c9e0e-2ed0-3e80-8b35-cffa9f092e91', '2018-08-09', '2072.55', '17045503', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(905, NULL, '367063438', 1, '02838dc9-fd31-392d-999e-34e58d2753be', '2018-08-12', '2534.90', '11457333', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(906, NULL, '940408467', 1, '61b73850-2322-343c-9d23-5cbd8e82534c', '2018-06-17', '2590.06', '25332188', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(907, NULL, '1335133851', 1, 'fd9ebec9-2a2e-3365-a178-333a56992447', '2019-02-13', '1727.13', '44270587', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(908, NULL, '1367228676', 1, '5991145e-155f-3f0a-aa66-114141396033', '2018-12-01', '1613.45', '6294325', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(909, NULL, '728913010', 1, '2dd1d818-904c-3407-afc4-183eab34c874', '2018-10-03', '2588.71', '45426256', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(910, NULL, '1295411390', 1, '21f77e20-9a5b-3359-9f55-26d41257ea23', '2019-05-03', '1261.69', '24593500', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(911, NULL, '243143319', 1, '42f4c732-6bb2-30ed-85f4-18f4ec00ade0', '2018-09-17', '2866.69', '11286088', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(912, NULL, '1394763378', 1, 'be066243-3ff7-3177-bcca-5d62e6ee934c', '2019-01-10', '1479.95', '34121035', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(913, NULL, '990788167', 1, 'd93a908b-da81-32d4-b5f7-89880041ddaf', '2018-12-24', '1056.93', '11190396', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(914, NULL, '1477298513', 1, '259d2378-3324-3a9d-ba5d-417b0c1abe8f', '2018-09-09', '1702.41', '36625941', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(915, NULL, '1549366623', 1, 'd21a760d-7f9a-301e-86b8-a0636351b68e', '2019-04-20', '1978.10', '40554023', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(916, NULL, '441322161', 1, '064d28ec-de69-3028-98f2-076910d2f2ed', '2019-04-06', '1431.26', '34195799', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(917, NULL, '137375488', 1, '94157305-c84b-38d9-9d6a-370adc3d580c', '2018-12-05', '2522.09', '24896879', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(918, NULL, '373236440', 1, '518163b0-4d3e-300f-a10d-6f8d88e613d6', '2018-09-21', '2839.50', '29426357', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(919, NULL, '1259199921', 1, '547061e2-28a7-3e46-a81c-1f5da7dee66b', '2019-02-13', '413.98', '46275438', 10, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(920, NULL, '1102262284', 1, '54ef4f4b-4f2c-3439-8de0-2b8fab5008e2', '2019-01-24', '527.67', '32256297', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(921, NULL, '318346673', 1, '70713ba1-a514-379e-b89c-4a255d425e52', '2018-12-31', '2482.91', '12353491', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(922, NULL, '1044157556', 1, '562a3166-2741-3ade-baf2-43762fb35892', '2019-03-05', '653.45', '20016212', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(923, NULL, '1229487803', 1, '50a80dc9-2121-3859-b895-3de60a86607f', '2018-09-27', '1477.20', '20995899', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(924, NULL, '458915877', 1, 'ba6c7263-73bf-3883-9e78-20e089c493a4', '2018-08-19', '404.12', '35247229', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(925, NULL, '925546837', 1, '6cf18391-49a8-3d82-8d85-a6f375884fd2', '2019-01-24', '1465.11', '4183217', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(926, NULL, '1546655589', 1, 'f69feda2-3c1d-3a8e-a622-dbea1101c345', '2019-03-04', '2668.95', '20418204', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(927, NULL, '480304279', 1, 'ccaf9531-05db-3b7b-8d2f-165c84c93fab', '2019-05-07', '1028.98', '33982755', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(928, NULL, '380317426', 1, '89a31452-24ef-3ad9-a067-e11239722f96', '2019-01-04', '1691.49', '25192470', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(929, NULL, '1118141507', 1, 'b8c4048e-b12b-353b-bfb6-6de0826f0eee', '2019-05-30', '848.48', '19561790', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(930, NULL, '1006114769', 1, 'cbff77ac-167a-3cf0-8e8f-89c873786eec', '2019-01-03', '1041.06', '39284670', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(931, NULL, '1462924905', 1, '7b77f43c-513f-3550-a680-6234048ee378', '2019-03-29', '431.48', '23289607', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(932, NULL, '1347101825', 1, '43b8c8a5-46a2-3653-bdb9-e53fd3e550f5', '2019-05-09', '1128.67', '27021262', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(933, NULL, '424468843', 1, '701032c6-cfee-3482-962a-e7644e9065de', '2018-11-08', '2657.25', '21357623', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(934, NULL, '1536929245', 1, '9d3f26c0-b86e-3b3e-8048-a40670ef4c52', '2019-04-01', '2524.14', '13643917', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(935, NULL, '1017546842', 1, 'b5248ab2-1367-3735-8823-027aaa2717e5', '2018-07-22', '692.99', '39250710', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(936, NULL, '461398235', 1, '212a5f09-623f-3856-b9d7-24b47f66b74d', '2018-07-08', '383.73', '29956159', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(937, NULL, '422217792', 1, 'b763d66f-8a5a-3656-aed9-c32214c5d2ad', '2018-11-23', '963.72', '20732609', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(938, NULL, '261985055', 1, '9487f86a-6af5-3a61-a16a-2cb6d74088f3', '2018-11-26', '2906.58', '14583499', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(939, NULL, '467727219', 1, '4c8df300-efc3-3ad7-a653-31eb435a74a1', '2018-08-27', '2317.66', '14226991', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(940, NULL, '773708991', 1, '6f3c5b70-7ac7-3d46-b4b7-903640ddc3c5', '2019-04-20', '1942.25', '2459194', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(941, NULL, '237101492', 1, 'd210ff82-47b1-3f22-a406-7b5682657480', '2018-09-15', '2189.15', '45827391', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(942, NULL, '1225277845', 1, '9135329c-c5e6-38a8-bbca-565dd3ce8f06', '2018-07-28', '1462.99', '14474465', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(943, NULL, '1112510048', 1, 'cce91151-63d1-39a2-82de-7bf837a9592f', '2018-11-14', '577.62', '36277527', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(944, NULL, '147677209', 1, '6ee9bde4-c568-3050-bc6d-7526b8edc395', '2019-05-30', '790.01', '5648533', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(945, NULL, '1154269581', 1, '540ac748-3997-3e64-83a7-e05d3e107fc6', '2018-06-29', '605.76', '3136513', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(946, NULL, '479604361', 1, '8cf9d76c-0c09-3bf6-9f51-d6f4a9878dbb', '2018-08-17', '1732.00', '39890881', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(947, NULL, '1444988995', 1, 'ee268a14-c94c-3a8c-a732-49345eb09eb8', '2018-12-04', '1150.14', '32797051', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(948, NULL, '403985849', 1, '456bd5e2-fd83-395d-9da8-a8fe285541ec', '2018-07-17', '748.05', '27748918', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:52', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(949, NULL, '617059531', 1, '0a666c77-7b1a-3d32-915f-5aba6d09b292', '2019-04-25', '2637.10', '44425101', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(950, NULL, '644353260', 1, '224ec3c3-45c5-3006-80ca-e347795e9bf4', '2019-01-21', '665.53', '37963478', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(951, NULL, '1395795892', 1, '9fc00415-a1fb-34c4-9b00-7cca60d71e5f', '2018-10-29', '2797.96', '12954627', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(952, NULL, '596642025', 1, 'a137ccd4-8fcd-3d07-acb3-0767d4cea7f3', '2018-06-17', '2227.66', '33220305', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(953, NULL, '929670375', 1, 'df6d8b5c-8410-3ed8-a6e3-f5af24548137', '2018-06-18', '874.43', '33668213', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(954, NULL, '526038860', 1, '063f1791-5250-3817-b433-d4a54bbee1e0', '2018-08-13', '2849.89', '31165049', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(955, NULL, '536007122', 1, '2ffe7864-e4d1-3da8-bcf0-a95b06d6ae11', '2019-06-02', '829.83', '18343495', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(956, NULL, '1154720153', 1, 'ada6f2f1-e10f-3498-a70d-a7fbfce031ef', '2019-06-08', '1445.62', '30929075', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(957, NULL, '1438700665', 1, 'af8a7a2c-0d27-3498-9367-f5dd2f4e9e90', '2019-01-23', '1583.39', '36069157', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(958, NULL, '893368258', 1, 'a68bd9de-6ff3-362e-9542-b47ec6688e8f', '2019-03-01', '1122.46', '36467783', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(959, NULL, '1097186881', 1, '260c8451-f9eb-3067-a2b0-93f658f5d4df', '2019-02-09', '2569.46', '34564243', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_progressive_motivating_firmware_1`, `_snipeit_customer_focused_actuating_knowledgebase_2`, `_snipeit_self_enabling_6thgeneration_interface_3`, `_snipeit_synergized_grid_enabled_archive_4`) VALUES
(960, NULL, '1505192853', 1, '2ec45729-733d-3f6b-b5d2-df73776c20a3', '2018-09-26', '2414.77', '37109817', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(961, NULL, '428253259', 1, 'a18b4d01-0c00-38ac-bb24-3218edbec6fd', '2018-10-03', '2120.82', '49857459', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(962, NULL, '1541349114', 1, '949ee522-bf84-3a04-8b34-d8e09b36fa38', '2019-06-04', '376.36', '1024373', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(963, NULL, '809806792', 1, 'dddb95d2-9c90-3ecd-946d-e701ac127b33', '2018-08-27', '2744.41', '40223193', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(964, NULL, '93154615', 1, 'e5c93a91-c986-3c33-aea5-c074cdbb2bbc', '2018-12-05', '1398.02', '2821543', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(965, NULL, '1518541403', 1, '6afc84ae-2bb7-37bc-a9b2-26fd7876ff2d', '2018-07-18', '1567.20', '23260699', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(966, NULL, '681593988', 1, '7f4a64d8-2872-31cb-931d-bc94238a933a', '2018-08-26', '1702.65', '12305073', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(967, NULL, '113404350', 1, 'd55f5fd5-1d15-359e-934e-7e9c8f98c0a2', '2019-06-05', '840.30', '18377190', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(968, NULL, '456791484', 1, 'b16385e6-bda3-3fdb-a2bb-d2c1b657c904', '2019-04-17', '2459.74', '14249022', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(969, NULL, '833448997', 1, '6a7892e7-e013-37fe-b73b-a28cba3648f6', '2018-11-17', '2414.47', '19606727', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(970, NULL, '271581283', 1, 'a1a1fec5-6fd4-3a72-a045-b2f503086747', '2019-04-17', '2329.38', '37058942', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(971, NULL, '461852179', 1, 'a3af472f-1fa2-38ad-97a9-a8972e1f747d', '2018-12-10', '669.02', '43055441', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(972, NULL, '1471308405', 1, '534b95c1-d8e0-31f4-9874-512e888d3426', '2018-09-01', '1495.81', '10090651', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(973, NULL, '1098622266', 1, 'cd899287-792c-3b7e-9842-a78395c44935', '2018-12-21', '2632.51', '8003422', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(974, NULL, '764508820', 1, '66de86cd-0b35-3546-85e7-8072fc80d175', '2018-09-12', '456.04', '45575392', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(975, NULL, '1409034610', 1, '1d7d30cb-0ff2-3813-9fa0-881874b36bb2', '2019-02-12', '1858.03', '14356513', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(976, NULL, '1261754871', 1, '14d918d0-c126-3e00-844f-048a12a93234', '2019-03-01', '2813.10', '1198923', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(977, NULL, '1479503163', 1, '39c1e70f-61b3-3d5c-b8b3-70c9a942b58c', '2018-12-16', '2892.24', '4031302', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(978, NULL, '924884019', 1, '9f6b1c83-4089-30c1-8da6-fc26d8fef0c1', '2018-07-17', '2919.89', '40332720', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(979, NULL, '445636401', 1, 'f0e0ac1e-0d0d-3b69-8f5e-0a59a4f1dd6f', '2018-09-28', '2925.53', '39648121', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(980, NULL, '320308415', 1, 'b8fffbde-129e-349f-8b28-e202d994e890', '2019-06-04', '1924.83', '43050435', 8, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(981, NULL, '378636355', 1, '678ec4a0-f1d7-3905-b0a5-ddfab8b20dce', '2018-10-23', '2089.88', '34768211', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(982, NULL, '1010894453', 1, '093a0917-4d6a-3930-95cc-46eeb535dc8b', '2018-08-24', '2086.38', '12776897', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(983, NULL, '1251058149', 1, '5be93cc0-2c4a-313d-ae5e-3364f9bd72db', '2018-12-08', '924.69', '20675599', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(984, NULL, '1255385093', 1, 'eb3d9547-0cd2-317a-99a5-d35783d7ac09', '2018-10-23', '2231.50', '40009833', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(985, NULL, '929613655', 1, '65318225-9500-3d91-9ac6-fb6eeed5dd64', '2019-04-21', '2198.96', '3626511', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(986, NULL, '334184929', 1, '1f0a4964-1bad-368e-b480-3b2ba895d6b1', '2018-09-18', '2625.91', '16214991', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(987, NULL, '1085615443', 1, 'fb94fff2-df7c-31d0-b60a-1e993703cba9', '2019-05-18', '478.11', '28405858', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(988, NULL, '206067216', 1, '45108df5-800f-36ec-b62d-16f6986405de', '2018-06-22', '754.80', '14881605', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(989, NULL, '901195080', 1, 'f3b1feb4-24a0-3de4-8e11-bdce86df8f4a', '2018-12-10', '2489.55', '39366052', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(990, NULL, '599144636', 1, 'ff3ef8cb-bfc2-348a-b968-958f3d9f37a4', '2019-05-12', '1977.42', '43067424', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(991, NULL, '911020528', 1, 'f97c9e88-0c0b-3c80-a4c2-1270d09b80ec', '2018-09-09', '366.71', '20940653', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(992, NULL, '317431213', 1, '9282c6eb-e923-3e76-a7b2-b8644f81acd6', '2019-04-12', '1865.63', '31008569', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(993, NULL, '559749621', 1, 'aba77fb2-5512-3dd9-ab2b-e4142218b4e4', '2019-01-27', '522.04', '1008856', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(994, NULL, '275710091', 1, '287bba6f-f3c7-3069-b2a6-f76d4fd3f562', '2018-12-02', '2239.12', '32396138', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(995, NULL, '993941876', 1, 'b23660a8-dabf-32bd-8053-76f6a804bfe2', '2018-09-27', '1403.54', '27142971', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(996, NULL, '647358104', 1, '45dda659-ed0d-3166-adcc-69dbb016ac39', '2018-10-21', '1325.22', '45359787', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(997, NULL, '69456577', 1, '148d92fc-4bb1-3ca2-9083-e06bf6ad5c3e', '2018-08-07', '691.71', '13748310', 10, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(998, NULL, '120726054', 1, 'e5d3cd54-f274-3b4f-a921-c7afb661f7e8', '2019-03-09', '2522.90', '47184550', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(999, NULL, '692566975', 1, 'c6c76555-422e-3f0b-b01c-2520c163e8dc', '2019-04-11', '2699.10', '4173876', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1000, NULL, '723769666', 1, 'ff6ec79b-cc61-3ff7-b0dd-b51bffd3eec4', '2018-08-10', '1240.88', '29904084', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1001, NULL, '921871530', 1, 'fa76e90e-86a1-3b3b-b662-8f9bb478d5c2', '2019-01-30', '2578.85', '35173887', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1002, NULL, '933789126', 1, '193af9c5-66d3-3aef-9d13-b012eab6601c', '2019-02-08', '2829.11', '47409184', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1003, NULL, '316727647', 1, '972b482c-c6f8-3433-9e9a-284246a948c7', '2019-04-13', '1655.45', '45439295', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1004, NULL, '1345023309', 1, 'd0b43ec2-8dfa-3959-b663-885a41bcb07a', '2019-04-21', '1397.60', '21356897', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1005, NULL, '946786870', 1, 'd663f4a4-2461-3e05-8865-111043e1a584', '2019-02-28', '1875.08', '3062664', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1006, NULL, '99076288', 1, '6bf99cbe-b2b6-328b-8812-ac472fa81918', '2018-09-26', '347.46', '7878859', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1007, NULL, '415529163', 1, 'bc872a8f-3b22-38bc-a28c-4a5a13a0b63f', '2018-11-03', '2059.18', '43354564', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1008, NULL, '1019843699', 1, '0d288066-8cbd-3535-aa32-50f0b9316896', '2019-03-30', '731.03', '23032353', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1009, NULL, '1457000826', 1, '81648e62-0089-3bf1-9b76-79a558f9548b', '2019-03-27', '1805.27', '34073054', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1010, NULL, '86972540', 1, '9a48e748-9e38-3ec7-b650-97b9d8a870d2', '2019-04-09', '1419.98', '28394189', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1011, NULL, '1465041822', 1, '128570a2-2a8f-3350-9d82-ce7a1c7a358e', '2018-12-18', '2355.85', '40657266', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1012, NULL, '700815317', 1, '24c5e80e-0d1b-3ca3-ae4c-cba9ec6a04a3', '2019-04-24', '996.83', '42056919', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1013, NULL, '1269560315', 1, 'cd185de5-5690-3785-af4b-771520782595', '2018-12-31', '1657.09', '39033552', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1014, NULL, '325983058', 1, '45bf5278-f0ba-375e-9f7f-c9824b2010f6', '2019-05-28', '1199.47', '20886040', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1015, NULL, '211546372', 1, '93a07135-c405-32fc-84c8-e7b91cf242b7', '2018-06-15', '2976.92', '35747040', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:53', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1016, NULL, '854239271', 1, '65b9df6d-17db-3043-a5ba-8d222bee0847', '2019-05-20', '2681.35', '33149570', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1017, NULL, '1024682490', 1, '2a2acf31-86e7-39b1-ada5-dbd54ceb2d72', '2019-04-20', '2235.50', '27356630', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1018, NULL, '1057409791', 1, '7cfa66dc-5b03-35d1-8ece-4f7dcbc180e8', '2018-07-03', '1285.78', '28820019', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1019, NULL, '1556601479', 1, '6975c80c-7852-3d11-a2a7-0e4a6a47e945', '2019-04-01', '1205.14', '2211653', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1020, NULL, '526963359', 1, '4fc39097-43a0-36b1-a3cd-82357c93097b', '2019-03-17', '1363.27', '48755238', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1021, NULL, '1372619180', 1, '7486299b-b333-38e0-8729-cc271163152e', '2018-12-28', '498.96', '13709331', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1022, NULL, '1349640661', 1, 'e9977fb4-aa84-3113-9452-9f30b5ff273d', '2019-03-14', '1451.56', '46957259', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1023, NULL, '756152155', 1, '328bd2a0-3a6d-3f15-a0ac-a71956cbd93f', '2018-09-03', '2832.79', '10548223', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1024, NULL, '149052638', 1, '6b366ef5-4afc-3365-9111-2140db4e68aa', '2019-01-26', '2684.68', '33464357', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1025, NULL, '725599854', 1, '401b800f-9c4d-3ca2-a851-9df41df26596', '2019-04-27', '785.42', '5509600', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1026, NULL, '1123221846', 1, 'fbdd0118-728d-383f-9b5d-2ceb089083a4', '2018-09-20', '1265.17', '5758019', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1027, NULL, '882665853', 1, '6832acc4-42d5-3bfc-baf6-3f685a844c74', '2019-03-25', '343.84', '29874560', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1028, NULL, '967490759', 1, 'ca9ab94e-05f3-3cee-ae98-a14a5605d106', '2018-06-22', '2285.31', '8724597', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1029, NULL, '611334297', 1, '1d3f3d86-90e3-3539-b5e7-c21c9c738af3', '2018-09-02', '757.87', '32842192', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1030, NULL, '593751670', 1, 'cc783982-ed80-3073-a02d-7ef24d349222', '2018-11-04', '667.41', '38177674', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1031, NULL, '1539049092', 1, 'ef228846-f649-304d-ad89-c60d2d407d04', '2018-10-17', '765.67', '43944837', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1032, NULL, '494574451', 1, '83fdc34a-d772-3573-84f8-84cf9514acc8', '2019-06-03', '2583.71', '5155266', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1033, NULL, '281104173', 1, 'c2e409a9-ef75-3e30-8931-f672eab6a94f', '2019-04-01', '781.32', '45650636', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1034, NULL, '210676683', 1, 'be313552-22c0-33b9-a2c8-6eb368a465d4', '2018-07-13', '1633.06', '29173198', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1035, NULL, '1466852569', 1, '69bb19d2-8578-3a5a-a420-6952819a1930', '2019-03-07', '2351.93', '16060677', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1036, NULL, '203546392', 1, '9b106e3a-83ce-389c-a300-cef2f6642912', '2019-02-15', '2373.47', '29864650', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1037, NULL, '843202589', 1, '93a1633b-729b-3c74-a13c-e866d954f397', '2019-05-24', '2816.83', '19784860', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1038, NULL, '1016028437', 1, 'a3bfe8be-67b4-302c-88f7-6f09d6809a98', '2018-10-10', '1468.42', '18494005', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1039, NULL, '1390612979', 1, 'd9a321c4-83dc-3eed-8ffd-ae29f659977b', '2018-07-07', '315.19', '14495843', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1040, NULL, '39900101', 1, 'b21ab8d2-ec79-3047-a106-359b9b51d918', '2018-07-01', '2066.18', '28997008', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1041, NULL, '1304210751', 1, 'a9aa89ef-0003-3d21-b246-efc70a06acb5', '2018-06-21', '1126.79', '29224849', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1042, NULL, '1459816209', 1, '5ea99c9b-96b2-3760-8290-02f188be338c', '2018-09-27', '898.55', '35172459', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1043, NULL, '1489749891', 1, '827bf568-bd6c-33a1-8934-5bc886614eea', '2018-09-12', '1548.48', '15702543', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1044, NULL, '759144094', 1, '359be653-3d83-3d0e-9d20-4f67ee51849d', '2018-10-14', '682.82', '22674641', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1045, NULL, '399810627', 1, '3a021f2b-740b-3f1a-a843-8213c1a49227', '2018-11-19', '1505.54', '15071492', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1046, NULL, '1062712340', 1, '7e0e6206-172b-3a15-9c11-f853d25d1c53', '2018-11-14', '1516.15', '27691444', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1047, NULL, '354419573', 1, 'f2d55ed3-537f-37a9-bb2f-b597628d1e78', '2019-03-29', '1304.78', '27806952', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1048, NULL, '804132961', 1, 'e0e5fed0-f7e7-3f87-ab56-8cf221ee5e57', '2018-07-05', '444.48', '3107400', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1049, NULL, '1243127082', 1, '96274971-d9e1-3828-954a-fd4fe5177fb8', '2019-06-07', '400.87', '26951218', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1050, NULL, '127535413', 1, 'e5314d36-64e4-39f5-bf44-264d97f68226', '2019-03-01', '1482.41', '37407061', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 2, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1051, NULL, '1086981321', 1, 'c2fe0028-187c-398f-9f6d-dc61f1996665', '2018-08-30', '2350.81', '45519807', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1052, NULL, '444535476', 1, 'dd555e5c-ed11-3bba-8de8-34e7b278c0bf', '2019-02-22', '973.22', '44359153', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1053, NULL, '497438685', 1, '2cf90e61-e376-31f7-9027-391c094410de', '2018-10-28', '371.60', '35059100', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1054, NULL, '165865929', 1, 'bb687b44-332f-359a-bc44-6e01aab6653c', '2018-06-30', '2077.15', '10206449', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1055, NULL, '553075095', 1, '175fb11e-0a13-3839-886a-2d42479d7ae8', '2018-07-04', '1951.11', '18864901', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1056, NULL, '1513829179', 1, 'adc1c286-df25-3330-acfa-f1c7bec25331', '2018-10-09', '1047.90', '29917430', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1057, NULL, '1502178393', 1, 'd3a611a8-6644-3f6a-98f7-cc9e29ac33d6', '2018-11-24', '523.91', '7335177', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1058, NULL, '896612820', 1, '2cdb98f8-db5b-36ec-ac7c-89722ddbb2de', '2018-07-15', '626.08', '15004822', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1059, NULL, '690057564', 1, 'c8d155e1-3cd6-3c73-822a-8d7fab3ba82a', '2019-05-05', '319.00', '42676029', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1060, NULL, '519220687', 1, '4f5a0916-d332-3896-acb9-204ca8aa8610', '2018-10-18', '390.24', '5730338', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1061, NULL, '849311383', 1, '5d7d5700-342d-3e1b-b524-fc15aefb7530', '2019-05-21', '2080.73', '39467854', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1062, NULL, '693930601', 1, '1c0a5122-8448-3c3d-8fda-a98369ca15db', '2018-06-17', '687.26', '18871332', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1063, NULL, '1034179943', 1, 'c2f34c63-b2b7-34a8-89bc-c5b22c4108c3', '2019-04-10', '1776.00', '12632569', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1064, NULL, '924273986', 1, '31c3ff7d-cf04-32ad-b225-02e5a86cc764', '2018-12-09', '1305.32', '26648286', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1065, NULL, '861950981', 1, 'cfee0a56-7762-3e31-a423-7f0e4b2b8849', '2019-04-18', '2436.04', '18684225', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1066, NULL, '419459386', 1, '78530204-d7e1-352d-afcc-550ec4f6c42a', '2018-12-29', '1280.64', '8911625', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1067, NULL, '192611383', 1, '23230feb-f30b-389d-aa7d-a2e803fe21c0', '2018-08-28', '1004.38', '46556855', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1068, NULL, '972858676', 1, 'aaad836d-1c1b-33df-b584-e84dcb7fb7f7', '2018-12-07', '2407.60', '4409678', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1069, NULL, '801999447', 1, 'bf8f5ae9-2cde-3af8-ac2a-90095e43d3a4', '2019-05-26', '697.90', '34201301', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1070, NULL, '1015880233', 1, '9b170ce2-6204-3f53-bc5c-3eeebf979529', '2019-04-14', '850.05', '42871445', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1071, NULL, '423241903', 1, '2d226eda-89f7-388c-8745-fd170273f8fa', '2018-12-07', '1988.26', '15148844', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1072, NULL, '576395011', 1, '031bb38a-04f2-356a-a4a8-0ecb2d87eb3e', '2018-08-06', '1173.33', '23624847', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1073, NULL, '329856120', 1, '85e3c835-0567-3447-b374-c96490117d31', '2018-12-25', '566.24', '47596288', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1074, NULL, '752708036', 1, '35bc1250-ec00-349e-9b9f-399accdbbf24', '2019-05-28', '708.70', '13215902', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1075, NULL, '383391664', 1, 'b1d104e7-ca27-3fa9-ad90-1f6061a3f40c', '2018-07-08', '2289.93', '11424222', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1076, NULL, '265571454', 1, 'e621d4ff-8a7f-3073-8627-044d893ede13', '2018-08-19', '2237.12', '3129432', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1077, NULL, '1090864751', 1, '71a07184-fb65-34ff-8ae9-bbfc1ca2885b', '2018-11-05', '861.71', '47204055', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1078, NULL, '959798584', 1, 'a30d2898-96c5-375a-a7e2-2c9fe83d6f8d', '2018-07-22', '1662.87', '26045666', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1079, NULL, '431659931', 1, 'b8332539-6179-33ed-a10e-bf0208f7e2cf', '2018-12-06', '2738.69', '23929736', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:08', 1, NULL, 3, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1080, NULL, '1368060195', 1, '4446c8b8-c5c1-32d7-b459-f3ce53f77f60', '2019-06-02', '1372.94', '6262024', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1081, NULL, '792133589', 1, 'f9a083db-99c3-300e-97c9-69190d8709ba', '2019-04-20', '1534.72', '9684580', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1082, NULL, '492644249', 1, '1d9fea91-5f07-3dfc-9813-96132ddbf816', '2019-01-18', '2871.95', '47809241', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1083, NULL, '354568310', 1, '4be719af-834c-3839-ba55-361cca368d15', '2018-12-13', '1433.89', '11437414', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1084, NULL, '1101904071', 1, 'a98aae77-b6e2-3c2d-b286-f6bfdf5f65f4', '2018-08-11', '811.03', '11156047', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1085, NULL, '208067683', 1, '9d5449cf-eb27-313a-a6c3-5facef1a712a', '2018-11-07', '2805.73', '36292427', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1086, NULL, '412589320', 1, '15e085b9-abc5-366f-9bcf-ec8098ef21ae', '2019-02-01', '605.88', '12911578', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1087, NULL, '553702684', 1, '6c3e173c-3943-31fd-a295-d8c2e79a5dea', '2019-04-20', '512.99', '21370325', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1088, NULL, '1400700693', 1, 'f4be5f2a-09db-384d-aeb0-b2f8b2136429', '2019-01-24', '763.54', '42462555', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1089, NULL, '785936776', 1, 'c260a63d-24a0-3562-ad47-20f302ce3652', '2019-01-16', '760.37', '8354243', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1090, NULL, '1423231478', 1, 'f029c0ff-ecd7-3dfa-9a0a-ac9ef4249b4b', '2019-04-12', '1192.17', '15569164', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1091, NULL, '713923551', 1, '25688f2e-1c8b-3a0f-8fd6-74cb9a649f82', '2019-01-31', '2568.03', '24062551', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1092, NULL, '104398061', 1, '1c2e4b95-f1f1-383c-9698-d858325dfba9', '2018-11-02', '1189.68', '5767113', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1093, NULL, '660989251', 1, '47582c4e-ce8f-3826-91b1-3f0df0be4a4d', '2019-02-17', '1650.36', '40137741', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1094, NULL, '1279979890', 1, '126e4c13-3fbe-345b-9318-8fef0f6ab5e8', '2018-09-18', '505.71', '41365062', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1095, NULL, '274507714', 1, 'bc6ddc9d-ece5-3e06-84e3-e55da3524f7b', '2019-03-28', '2302.73', '22401496', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1096, NULL, '138918991', 1, '756825e3-0aab-3865-8897-39cb2c0a97a5', '2019-05-29', '1521.00', '38047902', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:54', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1097, NULL, '643201297', 1, 'ca6105b2-84bb-3adc-8fb7-ec5f6beb50e9', '2019-03-09', '2236.31', '40694088', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1098, NULL, '395209591', 1, '28d8da9e-e921-3fe4-a7ac-4d0a62e9fcc6', '2019-02-27', '2449.34', '22886544', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1099, NULL, '1399854817', 1, '5210ac78-f1e9-332d-9f19-9d3f577d7277', '2019-01-02', '2890.54', '49709112', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1100, NULL, '248258502', 1, 'ec5e4438-92c3-3974-9ef3-0c3a6b855e56', '2019-03-06', '1832.41', '3294820', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 3, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1101, NULL, '1268111847', 2, '96b6ee69-1133-35bb-a166-82de34c26c5c', '2019-04-21', '593.99', '43763703', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1102, NULL, '328230916', 2, '6bb7945a-b661-3c13-bfc3-31721a7624d5', '2019-02-19', '2235.41', '2755021', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1103, NULL, '503439658', 2, '86c7712f-31b8-3d06-9370-5418e25826c4', '2019-05-15', '2483.86', '23269293', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1104, NULL, '821385863', 2, 'dcdb9d94-9852-3721-9593-51b72ecfa31e', '2018-07-10', '1572.23', '31021427', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1105, NULL, '649251424', 2, '9b6db83a-e39e-3eba-bb5d-f59765acdd14', '2018-09-27', '1251.30', '8599537', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1106, NULL, '1028006046', 2, '9050daee-f048-340d-9aba-d8521c3f68da', '2018-10-29', '2435.04', '30254116', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1107, NULL, '1347608911', 2, '2037b6f5-2792-3a34-8905-87202b6b8c50', '2019-04-19', '2539.30', '47578080', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1108, NULL, '782400135', 2, 'ea195421-7b5e-3be6-8468-00b7c4171705', '2018-08-30', '992.70', '7573608', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1109, NULL, '1209065802', 2, '4636aec4-6b51-3e42-951b-1b9fa9a409f3', '2019-05-01', '1041.86', '39992963', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1110, NULL, '97999213', 2, '8c5adcbf-55bd-380f-b08e-42820cd060db', '2019-05-01', '1196.35', '36687998', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1111, NULL, '632254346', 2, '275c2a53-47ff-3b90-932b-8f0a71c7d272', '2018-08-10', '333.49', '37657963', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1112, NULL, '2703497', 2, 'a44889c4-175a-3034-872f-5bfead8feac0', '2018-12-31', '369.61', '44916995', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1113, NULL, '269204270', 2, 'b6bf0e23-4ca8-3e77-8cf9-06b424262ae7', '2018-10-24', '502.15', '40375206', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1114, NULL, '1057404796', 2, '224f7d64-cf2e-363b-9c50-51181152cc0b', '2018-10-30', '2699.37', '39044600', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1115, NULL, '110993647', 2, '9a0b052e-702e-3b28-ba41-1e69c5a87934', '2018-08-16', '2376.35', '48995696', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1116, NULL, '33645501', 2, '30fc868d-27f9-39d5-8ed8-c2f0ff60248b', '2019-03-15', '2170.19', '43750316', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1117, NULL, '439173893', 2, '2dacc9fb-a446-31b0-b384-d82281591ec3', '2018-11-25', '1050.96', '14963298', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1118, NULL, '1052782360', 2, '86c5d777-0674-324a-999d-24da5cd5a17a', '2019-04-30', '2002.94', '36699825', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1119, NULL, '966394067', 2, '566507f0-ebbb-31b5-a4bf-8167c497446a', '2018-11-24', '1312.01', '7017535', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1120, NULL, '1257746470', 2, '33684232-ffee-389e-8fc5-90cce19b6b5f', '2019-03-30', '2732.17', '37115569', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_progressive_motivating_firmware_1`, `_snipeit_customer_focused_actuating_knowledgebase_2`, `_snipeit_self_enabling_6thgeneration_interface_3`, `_snipeit_synergized_grid_enabled_archive_4`) VALUES
(1121, NULL, '198920884', 2, 'd745e5b1-25ec-3651-9c34-0c50a8b0ed42', '2019-06-08', '2701.72', '2721298', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1122, NULL, '793360454', 2, '75b612a4-32a5-30b4-ab38-3ff0785ee70d', '2018-11-28', '2749.34', '22418182', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1123, NULL, '626319791', 2, '1bf88e36-5054-359a-b829-a28902c7f215', '2019-02-15', '2523.62', '12808292', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1124, NULL, '1214493591', 2, 'a32d1723-4287-38eb-b7f7-1befb94b6fa7', '2019-04-15', '1710.80', '39518539', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1125, NULL, '770800199', 2, 'dd1a4ceb-4a0f-3a5c-8f45-6699a6d8d466', '2018-07-01', '311.05', '39926303', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1126, NULL, '979147735', 2, '3b33d73f-eeb5-38ab-b2d4-e9fc09047c04', '2018-11-17', '2509.23', '19390551', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1127, NULL, '1196042527', 2, '51f421f7-d6e8-3643-8e8f-dd5f337985c4', '2019-03-03', '994.89', '25397164', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1128, NULL, '170838287', 2, '7ad0376b-8c6d-3ee6-9c5a-2f93f3b0c175', '2019-04-29', '1529.11', '39990789', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1129, NULL, '1105452529', 2, '297a9012-5721-38cc-a31c-26b0a86def45', '2018-10-09', '418.56', '21647489', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1130, NULL, '17538000', 2, '7bb67e94-959e-3e8d-82df-fec0f48ca33c', '2019-02-25', '2896.05', '39226074', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1131, NULL, '800387975', 2, 'e0e90bf7-8aab-3dfb-a1a7-e83628d4217c', '2018-07-22', '2838.53', '44002298', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1132, NULL, '658298281', 2, '112bf320-447a-3c29-9a9d-945b465e05f5', '2018-07-14', '2893.82', '25864004', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1133, NULL, '138916799', 2, '8523b591-8251-3faa-be4e-c96a51de8f55', '2018-07-13', '2061.34', '47948627', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1134, NULL, '1421333385', 2, '516ac8d6-ff5c-3cc6-bfb7-96df9847ad8c', '2019-05-06', '307.75', '24143827', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1135, NULL, '89659500', 2, '5a55eb59-be35-3e87-aa75-d51df04e9d72', '2018-09-06', '2726.03', '31131232', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1136, NULL, '84006858', 2, '0dd4976a-d2c4-3e0e-9f91-18a59513489d', '2018-11-14', '1273.57', '47862933', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1137, NULL, '379055601', 2, 'efddfa43-58ab-3fe3-a1dd-ac23c1b0a311', '2018-06-21', '2001.93', '30383700', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1138, NULL, '921430409', 2, '20061e7f-d1b1-3013-b938-2a723d8df4de', '2018-11-20', '1355.71', '27764432', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1139, NULL, '709502943', 2, 'd955bf45-ac25-314e-acda-178e18f28e9c', '2018-12-28', '1062.17', '42086328', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1140, NULL, '887629036', 2, 'a9559b11-da1e-3c62-b6eb-53cd820e386a', '2018-07-30', '846.80', '37760191', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1141, NULL, '248044879', 2, '55975b89-9c47-3055-87b2-b66dd0aec9e2', '2018-10-06', '2171.10', '41987920', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1142, NULL, '1219152635', 2, '5d9ccfd0-4a8d-304e-982c-eb89d2e50cae', '2019-03-21', '2716.35', '36604602', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1143, NULL, '78312400', 2, '1d61d5c1-7e1d-3b3b-b3c1-40d0a504eefa', '2019-02-05', '401.43', '29566839', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1144, NULL, '951975747', 2, '05b917b1-30b8-3a51-a317-c1d3fea1b88b', '2018-09-05', '976.68', '25873245', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1145, NULL, '105409827', 2, 'c95d5e0c-cc3e-33b6-a4c3-739ab9a2f210', '2019-04-03', '2984.43', '35602443', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1146, NULL, '1277994777', 2, 'ec4be28b-01f4-3625-ad70-4c43eaa0b332', '2018-10-11', '753.24', '17825192', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1147, NULL, '288798935', 2, '656e8cd6-2c87-3a33-ac3c-6176da52441e', '2019-04-03', '2491.96', '15944483', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1148, NULL, '650366114', 2, 'aa5f7979-b568-31e9-9724-7eb88e1fcb1e', '2018-10-15', '2840.74', '31294108', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1149, NULL, '1481615649', 2, '6a2db3fc-f71a-306a-8a4e-9f1f47bd3361', '2018-07-09', '2013.67', '5694357', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1150, NULL, '1243451150', 2, '727916e2-c843-364e-9495-b4e3ed9000c9', '2018-11-07', '532.32', '31924425', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1151, NULL, '660871924', 3, '063bd3e3-72f4-38aa-96a0-3483730baaf1', '2019-04-10', '2273.10', '31671736', 62, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-08-13 01:33:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, 'pending', '2019-08-13 01:33:35', NULL, NULL, 'App\\Models\\User', NULL, NULL, 11, 0, 1, 0, NULL, NULL, NULL, NULL),
(1152, NULL, '1246349346', 3, '7f7d385a-1338-3618-ad53-5efb0c47cfb3', '2019-01-24', '1303.90', '45019159', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1153, NULL, '1095626270', 3, '30909aea-6f6b-38c4-919a-355187f03aa2', '2018-09-16', '2487.99', '25012546', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1154, NULL, '247101908', 3, '8e71d0fa-2925-3514-8ee5-beeb682c398e', '2018-11-18', '2512.02', '31305270', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1155, NULL, '233353652', 3, '7dc47672-ab0a-3ce1-b9f2-f34aa66d1546', '2018-12-12', '2588.67', '49833425', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1156, '', '1197508336', 4, 'e6fe18ea-12b7-3ed7-ad68-964f05898af1', '2019-05-07', '2973.89', '21875842', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-08-08 03:47:52', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 0, 1, NULL, NULL, NULL, NULL),
(1157, NULL, '641802507', 4, '3d36b121-6d2c-3dc0-8e21-58040224de6a', '2018-11-28', '1898.36', '30764602', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1158, NULL, '39566527', 4, '77af4cae-c67c-3420-bd93-dcc92d51c577', '2018-10-14', '1748.72', '31044708', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1159, NULL, '652572688', 4, '76ff2cb1-746b-39fe-82a9-9ea2de6b222d', '2018-10-04', '2347.37', '42515153', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1160, NULL, '370273334', 4, 'e06d911e-1af5-3097-815e-868e2fc8c4bc', '2019-02-02', '424.93', '26097720', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1161, NULL, '1505225287', 5, '011332b4-b76c-3ad9-ac00-2c97e5deee30', '2019-02-23', '1466.99', '39252617', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1162, NULL, '550501962', 5, '601e4250-5cba-358e-a9c3-9e78109c98ce', '2018-06-26', '1466.60', '3545330', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1163, NULL, '341086455', 5, '1384c7b9-5b02-37eb-ab81-91ea8d8f8bee', '2018-08-03', '2230.49', '35954630', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1164, NULL, '1411103786', 5, 'b5e8a43e-4605-3278-9d33-375c34a0a107', '2018-09-17', '1208.82', '42039495', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1165, NULL, '1297423142', 5, 'b0f619ba-01ee-35e9-b3c6-001131df7e75', '2018-07-25', '1514.51', '40821537', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1166, NULL, '376245183', 6, 'd699dfaf-db2e-32e4-b6e5-519a9812c23c', '2018-11-07', '2432.94', '25335372', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1167, NULL, '2334311', 6, 'be2b5981-29fc-35b9-998b-6cd4f400037a', '2019-01-03', '2474.27', '44964852', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1168, NULL, '694117585', 6, 'd0ec952f-1ac9-3e07-95ca-21c56cbb5186', '2019-05-08', '2248.57', '27995396', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:55', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1169, NULL, '1051244775', 6, '6fc0fb27-9f39-3719-858e-84ebfb0a8f5c', '2018-11-29', '2272.25', '9257228', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1170, NULL, '1435395970', 6, 'a22a3b60-6aed-3dad-b1e4-34cd4ed2bc07', '2018-11-24', '1120.41', '8848812', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1171, NULL, '926426938', 7, 'cec111d5-0552-34af-aae4-879fbd3c8ff2', '2018-09-15', '1927.51', '30155129', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1172, NULL, '778855095', 7, 'f1a4c89c-bec4-365e-b4f0-fc949e61e1df', '2019-04-02', '876.57', '45039199', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1173, NULL, '1288256181', 7, 'ef283fce-985e-376a-a40e-925314ff3626', '2019-04-28', '1167.63', '30637500', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1174, NULL, '1546828054', 8, '4c98d87b-ac60-3f97-8cac-695231affcdb', '2019-03-26', '2870.74', '26811221', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1175, NULL, '1431622386', 8, '2cf061e8-50bb-3259-9c6a-3af4a0d05b77', '2018-12-17', '2830.39', '45476257', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1176, NULL, '1398535169', 8, '07c702b5-d5ae-3c4a-a94f-0e2fa85d30ac', '2018-11-26', '1222.43', '21623641', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1177, NULL, '1363624928', 8, 'f2f10976-96fb-3df4-bed0-a7ed03f279d6', '2019-05-20', '2295.66', '43588372', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1178, NULL, '481569031', 8, '564202b0-538b-3536-9332-4e26559bcb0b', '2019-05-02', '1427.97', '2890634', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1179, NULL, '1105714534', 8, '33d3d5ac-6eaf-382b-9528-5c947cb30ce8', '2019-02-27', '995.30', '36009950', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1180, NULL, '1267616235', 8, '21e24dd3-e3e4-3ebc-9893-c9de3f12668b', '2018-12-31', '1968.43', '25829234', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1181, NULL, '1414213040', 8, '937f4930-f475-3f6f-9e6d-c86c84eb38c3', '2018-10-14', '928.68', '24064979', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1182, NULL, '127891635', 8, 'eef41658-3535-3eb9-9d1c-624fbf774aec', '2018-09-12', '2598.20', '31846615', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1183, NULL, '605060949', 8, '53996e58-0566-30e8-81e6-b7d59f769ee3', '2018-08-01', '2169.30', '9487267', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1184, NULL, '144459566', 8, 'c3798d94-1b7e-392a-b32f-21c0ef511d2e', '2018-10-16', '2401.89', '9974583', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1185, NULL, '630829377', 8, '7de4e2d7-874e-31bc-b9f3-905e4575ffec', '2018-11-14', '1007.03', '28963135', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1186, NULL, '819009563', 8, '2d41b97f-0b2a-3764-8be0-40ba206dd1cd', '2018-12-25', '1493.01', '5004884', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1187, NULL, '283430013', 8, '2cba4139-96e1-3058-ba73-66d7ea6993a3', '2018-10-02', '2923.80', '24233915', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1188, NULL, '1306343909', 8, '32384669-b7fe-3756-be30-8d9c68102375', '2019-05-24', '2973.63', '27829360', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1189, NULL, '979213936', 8, '1d1d8a5d-689d-3a5a-a347-aafc918ccc01', '2018-06-13', '2325.08', '7245936', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1190, NULL, '699224881', 8, 'bd4db12b-cd37-3eb8-bbf4-c7a982cb35ff', '2018-11-09', '419.68', '5228898', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1191, NULL, '1436682691', 8, 'ec05ce6b-7f7d-32f0-aae0-038bbc96b87b', '2019-01-28', '951.69', '43307971', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1192, NULL, '1324764692', 8, 'e17ca816-a537-3254-ad06-0963ac4652ad', '2018-11-24', '1902.12', '8340804', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1193, NULL, '529280215', 8, '7c9efcbd-8e67-317e-847c-502161c3522e', '2019-01-06', '792.30', '31944586', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1194, NULL, '1160492175', 8, '24ad3943-3451-3321-9f5e-1d99feea4676', '2019-05-24', '765.89', '2418886', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1195, NULL, '710109861', 8, '6e600078-854a-3838-b26a-721942f5648a', '2019-05-02', '2370.42', '2073732', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1196, NULL, '1120537226', 8, '4eb872ba-629f-3176-b491-c938be70110b', '2019-05-30', '1072.33', '6109951', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1197, NULL, '268823485', 8, '8864350c-c84c-393d-ae83-72a96dd8bd1b', '2018-09-07', '2738.96', '49848438', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1198, NULL, '711909122', 8, 'e45250bf-234d-3bf2-a4b7-aad484dd4c52', '2019-02-15', '522.18', '27455079', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1199, NULL, '874758195', 8, '6329fc9e-c872-3fd4-883e-ac2d9e97a0f0', '2018-12-30', '1768.70', '3245115', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1200, NULL, '1542606741', 8, 'a64f8af7-c666-350e-a2f2-e716a0c6120c', '2018-07-19', '2945.45', '30471486', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1201, NULL, '1145865700', 8, '1405f2a8-05ad-3acf-b4a4-05fcbb5574c4', '2019-05-06', '981.76', '39140881', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1202, NULL, '488163163', 8, '12291a6f-820a-3e29-bfc3-7acbda536da3', '2018-06-17', '2673.25', '18161120', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1203, NULL, '1465009769', 8, '1d1e6eb9-11cd-34cb-a4ff-fb4489c049be', '2019-05-29', '2604.89', '43100150', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1204, NULL, '924763195', 9, 'b66bb2c3-ccea-32bb-9c77-22ae0b3b595c', '2018-08-02', '2935.05', '7075408', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1205, NULL, '639765811', 9, 'a0bae62d-6e68-31db-bb6f-0d406698e56b', '2019-01-24', '2160.38', '11112478', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1206, NULL, '713769734', 9, '10fec74c-a1ed-345a-afeb-34dc10a538d2', '2018-09-01', '732.97', '41886719', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1207, NULL, '478251615', 9, 'e5832db5-95d9-3b46-8a47-abe21a589a7f', '2019-04-03', '1256.47', '37916126', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1208, NULL, '478390138', 9, '2fd124f8-317b-3ae5-911b-eef659fad27c', '2018-11-09', '1273.82', '35892802', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1209, NULL, '345214464', 9, '63427704-dbd6-38bb-bb1b-3c4f2a8fe3dd', '2018-09-10', '1392.04', '2391397', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1210, NULL, '124510326', 9, '154b2fb0-0c1e-3a8f-9070-794f7979a331', '2018-09-14', '2001.27', '28078904', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1211, NULL, '1503275771', 9, '4857bf19-d581-3c90-9ff3-ba4445c3d498', '2018-11-28', '335.23', '44357841', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1212, NULL, '1195031360', 9, '687eb2c2-685b-3068-b52a-2b080423775e', '2018-07-07', '1298.12', '45269683', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1213, NULL, '137194141', 9, 'df347376-9173-3c78-bef9-2692a56c0be8', '2018-09-22', '704.21', '5064537', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1214, NULL, '375453830', 9, '42366614-dbf5-326a-9bd9-fcbf0550dcf1', '2018-10-25', '435.86', '5816179', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1215, NULL, '92559922', 9, 'ef9e7d64-606b-39d3-9c94-1bb6c324ae9a', '2019-03-29', '1930.65', '42221513', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1216, NULL, '625614818', 9, '3f4c57bb-10e4-3898-9b45-0553b9d3def8', '2019-05-28', '1660.58', '45717104', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1217, NULL, '1442084037', 9, '3f428211-8659-3672-a4f0-2653968f6b20', '2018-07-16', '1728.45', '31517533', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1218, NULL, '36336002', 9, '5f6a9418-be12-307d-9d83-6040d570eaeb', '2018-09-26', '322.05', '29652795', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1219, NULL, '768421664', 9, '0d6ad143-19f5-3fae-b210-151691456144', '2019-02-04', '1174.71', '11272692', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1220, NULL, '1170266598', 9, 'ff02edf5-13ee-39f9-93a9-b35d77b9a331', '2018-11-29', '1586.61', '48734892', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1221, NULL, '1051355990', 9, 'f2c3ff7f-0338-3ddf-8203-9683b2fd9907', '2018-09-25', '2539.49', '42388781', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1222, NULL, '1540999788', 9, '201b3874-269b-306a-9e69-d0b8a101d408', '2018-09-27', '1196.71', '4869280', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1223, NULL, '649154670', 9, 'f2d8e3e7-8651-37bd-a8f1-6783e79b3408', '2018-08-21', '528.00', '21654557', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1224, NULL, '1321087844', 9, '28c41797-16c9-3dbc-a9e6-474aafbe0e6b', '2019-02-08', '1826.68', '16408062', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1225, NULL, '309832426', 9, '3aaa5992-9493-3729-9e9a-7f8abfc60c54', '2019-04-03', '1937.63', '10806458', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1226, NULL, '1546017011', 9, 'dcbd669b-0c61-3b47-b2a0-57052d9cd839', '2018-12-06', '1096.60', '11365152', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1227, NULL, '644596705', 9, 'dcaf7085-f2f4-3487-b89c-e7f00921df10', '2019-02-17', '1558.50', '11683522', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1228, NULL, '1173716194', 9, '921665f4-a928-34db-bd17-784253755fd8', '2019-04-25', '510.26', '25879746', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1229, NULL, '226384719', 9, '272e94a7-b790-32f5-b858-2460942370e3', '2018-10-17', '2601.20', '46207860', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1230, NULL, '1065830756', 9, '261713fb-d35c-3a1a-8600-a1a9f4982ec4', '2019-01-23', '2369.39', '28988930', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1231, NULL, '1328703339', 9, 'd808d246-1636-30d2-9307-e0bc8a204407', '2019-01-01', '874.38', '20769255', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:56', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1232, NULL, '293607244', 9, 'ed8cd4c6-4f35-3002-85b3-37ac5976ed50', '2018-11-05', '1665.02', '38691587', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1233, NULL, '510909647', 9, '645aa227-35d3-3a35-b663-406e8e7a5b43', '2018-12-27', '2351.07', '20357541', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1234, NULL, '1128301366', 10, '4bb3c843-f602-35e9-844e-de2e5fb04842', '2019-02-25', '779.16', '5564161', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1235, NULL, '1374815835', 10, '367843a4-00c8-3d28-8220-29809e965878', '2018-11-19', '2363.06', '2072157', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1236, NULL, '1219642170', 10, '085612bc-d040-3717-ac6f-c92d74508a38', '2018-10-13', '1509.45', '4992240', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1237, NULL, '476804', 10, '4dab2c04-4d8e-3aa5-899d-787080c57a87', '2018-06-12', '2827.73', '15436868', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1238, NULL, '423099445', 10, '5130fdfa-e461-343d-884f-1294f95e625f', '2019-03-06', '2739.23', '33200476', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1239, NULL, '513245997', 10, '7c23462a-b24e-3549-be59-78913e2c4ad4', '2018-07-20', '1075.11', '5124550', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1240, NULL, '780825145', 10, 'b2ba47c4-f9e8-365f-9d4a-27e608ec4b24', '2019-05-06', '1745.31', '4284403', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1241, NULL, '344931992', 10, 'a07797e3-8236-348b-9d01-6eb511731547', '2018-11-03', '905.81', '27304105', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1242, NULL, '46939223', 10, '2422175a-d283-32e2-bba7-8ce046f049f4', '2019-03-12', '2139.51', '19706176', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1243, NULL, '690913552', 10, 'e7d54fbe-9485-330a-8265-4522fd55f7ec', '2019-02-19', '787.85', '31587988', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1244, NULL, '780448554', 10, '6fc06566-f438-3f33-add6-596476097ac7', '2019-05-04', '2638.50', '13892853', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1245, NULL, '602940535', 10, '3faabea5-b9f2-369b-8b73-ca86224dc850', '2018-08-17', '2524.86', '23117393', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1246, NULL, '573103201', 10, '1b7e566e-1f71-32de-9b5b-541ad9ef8952', '2018-12-15', '2668.61', '7548147', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1247, NULL, '896304484', 10, '12aed043-3082-3295-9920-9eb00db29118', '2019-02-07', '1849.94', '3750459', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1248, NULL, '1355317624', 10, 'b394e81e-d846-38e4-9165-db307d6442d0', '2018-07-19', '620.64', '38509343', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1249, NULL, '1048003576', 10, '4c8a7832-87e0-376b-8010-342d52b343c3', '2018-12-15', '710.35', '48442198', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1250, NULL, '28366894', 10, '422d3cf7-ae42-38d6-8efa-6ac760c983f8', '2019-02-05', '1808.21', '11106017', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1251, NULL, '1346156613', 10, '79a4c272-a11a-34dc-bea7-abf873bf3bde', '2019-05-16', '1712.56', '28405838', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1252, NULL, '918770682', 10, '8b2610b4-d7e2-3acd-968b-38a1df50e3c5', '2018-10-20', '1704.14', '26227307', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1253, NULL, '38416605', 10, 'e45a9344-38b8-3e9f-a870-00c68e92603b', '2018-09-16', '669.31', '39239678', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1254, NULL, '807539561', 10, '9add51e3-8bd0-37a6-8c50-83caa8e5dddf', '2018-11-21', '2249.04', '8284135', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1255, NULL, '1048619347', 10, '985c5328-2897-3b43-9bc2-cf3c714e0d45', '2019-01-26', '2475.28', '4728377', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1256, NULL, '817170817', 10, 'e8f9dfeb-f905-3887-a971-295d1f1d3fc4', '2018-07-27', '1306.01', '9962300', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1257, NULL, '1416395107', 10, '4e16420a-f93f-3f0c-a549-37b234be01aa', '2019-02-22', '1195.43', '8855794', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1258, NULL, '325859152', 10, '9eda8b55-e9d9-3e20-9983-d478eff44bab', '2018-07-18', '860.99', '8224539', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1259, NULL, '628981715', 10, 'ed73c80d-60d2-34c9-bb8e-ed2c002da7e0', '2018-11-09', '1041.76', '15762086', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1260, NULL, '1420030700', 10, 'b1021013-050e-3b25-afc4-45ed092417d3', '2019-04-20', '495.42', '45615721', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1261, NULL, '206798773', 10, '2673719c-87f3-3458-abed-7a62a4c980ef', '2018-10-02', '2968.68', '13563105', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1262, NULL, '1283341048', 10, 'ad51ee34-6666-3aac-99b0-c093387231d9', '2019-06-05', '526.49', '31108367', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1263, NULL, '1078627978', 10, '45c27e55-9404-36b0-901d-a96e85b0fc96', '2018-09-19', '1397.27', '39731811', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1264, NULL, '360552301', 11, '824acbe0-7346-3566-a693-4cb987b0cb80', '2019-03-20', '1163.62', '21103720', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1265, NULL, '1019428830', 11, '7230ebff-ead8-3b46-a222-7bfa1bb0db0a', '2019-01-20', '1635.07', '38081873', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1266, NULL, '48417210', 11, '017b998e-f73d-3727-9449-bf6c242efa2a', '2018-08-31', '1828.81', '15650113', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1267, NULL, '551345481', 11, 'f4be9437-fffa-333a-8bed-75aeb615c64a', '2019-01-14', '1644.31', '19659178', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1268, NULL, '823272307', 11, 'd5ebc446-3991-3344-ab8a-5f96b10996b1', '2018-10-11', '662.75', '38658201', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1269, NULL, '264967225', 12, '73e816a4-59e9-319d-a1e6-d8133cc2be3a', '2019-01-15', '527.31', '28379014', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1270, NULL, '482487405', 12, '4c30313c-0d7c-3ae1-b903-500e9373e9d4', '2018-12-01', '799.86', '28330814', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1271, NULL, '1125592727', 13, 'd44a8554-353d-3e1a-add8-37b90cc53b82', '2018-09-18', '1873.74', '3392368', 6, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1272, NULL, '84203430', 13, 'c656c5c1-af57-37a6-bf40-7d9a57d75a3f', '2018-10-31', '1071.81', '1290856', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1273, NULL, '669443277', 13, 'c25f5a88-d3a6-3a2a-9793-5f6b6efe9c12', '2019-02-05', '2037.06', '19807098', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1274, NULL, '1120101803', 13, '562ad0e0-cd5f-31e6-9541-c7b8b3dbe951', '2018-11-27', '1492.53', '13668979', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1275, NULL, '636202962', 13, 'ba6a3f00-0c5d-32ef-8264-c2f7f9446ef8', '2018-12-02', '1229.88', '15677749', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1276, NULL, '106163435', 13, '820b40eb-36f3-37a9-b563-6a3cae54238a', '2019-03-19', '594.65', '5880923', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1277, NULL, '674472903', 13, '0932c0a2-11da-3782-a665-2a49402f1865', '2018-10-19', '1099.26', '8593203', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1278, NULL, '1432016776', 13, '55ed5391-4a41-31e8-9d60-9071682b8e76', '2018-11-06', '728.53', '47183410', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1279, NULL, '194766220', 13, '2f3e9d48-8a18-3333-95b6-7266f4762d2a', '2019-02-12', '2554.10', '31974839', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_progressive_motivating_firmware_1`, `_snipeit_customer_focused_actuating_knowledgebase_2`, `_snipeit_self_enabling_6thgeneration_interface_3`, `_snipeit_synergized_grid_enabled_archive_4`) VALUES
(1280, NULL, '591207026', 13, 'be645999-a703-33b0-bcd0-07ca8281e12d', '2018-10-31', '1511.58', '37470824', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1281, NULL, '668764350', 13, '930a96dd-3c4d-3835-b7c8-72450e3b7825', '2018-12-07', '2425.89', '18578604', 9, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1282, NULL, '1231996139', 13, '5ae1a31b-54ac-303d-af4a-742f1532d965', '2019-03-01', '2417.28', '10524251', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1283, NULL, '780829734', 14, '6b6a9a71-5007-3802-83cd-2c403367d3f2', '2018-11-27', '1876.37', '39535053', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1284, NULL, '1510027251', 14, '0eba61bb-148d-3fbf-9e3a-16928911cbba', '2018-06-17', '2457.52', '39865137', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1285, NULL, '1329017380', 14, 'e77d76bf-76ad-3667-b6bd-5780558a50c5', '2019-01-05', '1524.16', '17698721', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1286, NULL, '222353904', 14, 'd1ffb3f2-1201-3e42-babb-a911af29855d', '2018-11-12', '1631.02', '45839617', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1287, NULL, '195404735', 15, '1acf2928-95da-37f7-833a-edb22569b2d0', '2019-01-24', '482.83', '29660833', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1288, NULL, '939461100', 15, 'ece5a99f-fa14-32e4-b601-5e5c3bd865ba', '2019-03-26', '988.90', '34908989', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1289, NULL, '441932333', 15, '9b96d5de-cb70-369d-8b3e-51a1a107f334', '2019-01-07', '1445.71', '49500377', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1290, NULL, '740281250', 15, 'd429064c-a530-31e4-8270-904f73b11dbf', '2018-09-26', '2036.09', '47629275', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1291, NULL, '1265263132', 15, 'c143ae61-e1ff-3ea1-82e4-45b687a4831f', '2018-12-22', '563.23', '24534725', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1292, NULL, '1041844231', 15, '818c923c-706d-3b5d-829b-f2992c1b29b4', '2019-01-15', '1382.92', '44601754', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1293, NULL, '809691173', 15, 'd9469f80-cf37-33f3-bc19-b70ab002b799', '2018-12-14', '1534.80', '17350262', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1294, NULL, '1173129282', 15, '9744d465-3fa2-3c41-99c9-00d34251ad55', '2018-10-17', '2275.48', '43103838', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1295, NULL, '1278125148', 15, '75cfe725-18de-31c2-8270-4279f6109e44', '2018-11-06', '2010.82', '34895696', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1296, NULL, '1460389220', 15, '3ae531c9-d91c-3459-a9b7-5ad12d700d9e', '2019-01-15', '1100.52', '39962937', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:57', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1297, NULL, '1542980575', 15, 'fbb48ccc-ee3c-31cd-b38b-c5c003203cbd', '2018-10-04', '382.24', '4806523', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1298, NULL, '835013528', 15, 'f46c5b34-f71d-32ac-a8c6-db31d491325d', '2018-07-18', '1391.32', '14490343', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1299, NULL, '900875836', 15, 'be44b10e-b33d-3afb-b304-c214a1e72ff4', '2018-07-02', '2149.03', '46843574', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1300, NULL, '1266606388', 15, '70f75037-5aaa-3360-8428-4b51c1c570fe', '2019-06-08', '305.29', '43053567', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1301, NULL, '887994229', 15, '1c5d3ce3-5514-3c5f-b8ca-36e47afa3d3a', '2018-11-25', '1387.63', '5864837', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1302, NULL, '590344926', 15, '507ac617-2b11-3154-abe4-d56c98894263', '2018-09-23', '2394.56', '32446510', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1303, NULL, '1119534415', 15, '0cd1a218-4f66-334c-8b39-c0bc48592c66', '2019-04-09', '2474.76', '6368931', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1304, NULL, '706144705', 15, '31ea7352-ef11-3881-9e27-2e5b2310c4c6', '2019-04-01', '1944.65', '6035550', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1305, NULL, '463265421', 15, 'ae73f04a-c5af-3dcc-9d41-e2e29e0c80aa', '2019-02-15', '2043.17', '47815786', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1306, NULL, '689152315', 15, '3ea9e691-a5b5-3b86-ab80-1ebb27e7d8ac', '2018-12-15', '1591.92', '47852575', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1307, NULL, '609562158', 15, '92d28ab7-4d4d-39fd-a79b-80873bb94cb6', '2018-06-23', '1833.02', '18630868', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1308, NULL, '393207721', 15, '38da76a1-ff2b-3ad3-a682-482ae738c570', '2018-11-15', '1650.21', '31274919', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1309, NULL, '895450177', 15, 'e0aa8926-0633-3cd6-b688-ff438aee4fd7', '2018-11-12', '2023.34', '10784435', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1310, NULL, '1107775795', 15, '925bb104-ed7c-3db1-944e-5770592f3a57', '2019-02-04', '684.32', '12897680', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1311, NULL, '920847655', 15, 'beb1b1a8-5919-35b0-8349-3ebcfb084cf6', '2019-02-02', '1590.65', '4296755', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1312, NULL, '841081917', 15, 'b0e22eab-f5bf-3170-8a00-5b3f80e5587c', '2018-09-25', '1688.24', '24776498', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1313, NULL, '1048523341', 15, '8d056020-857e-31c9-811d-5cacc43bbb44', '2018-12-23', '2750.70', '24801764', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1314, NULL, '224420362', 16, 'e3f42455-a972-3952-8615-692e8eb6c737', '2019-03-21', '1208.14', '40255994', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1315, NULL, '1399689450', 16, '1181e756-1ad0-36fa-8694-51b03ed14063', '2019-04-20', '2306.86', '3547122', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1316, NULL, '1399182114', 16, '4555cbfc-3135-3f69-a969-7f51808436e4', '2019-05-23', '2710.25', '42191612', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1317, NULL, '1513361006', 16, '5c5718c1-c5df-338b-a522-57b4fd4aab3f', '2018-07-23', '829.26', '17246985', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1318, NULL, '356639377', 16, '3acf91a3-d277-352d-a9cf-bc7ec22d90fc', '2019-03-31', '1871.17', '29254916', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1319, NULL, '196591713', 16, '55e725b1-2c95-3a8c-952f-423e54546150', '2018-09-16', '977.31', '17733447', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1320, NULL, '1470264134', 16, 'a94aa47c-9954-371e-b721-009a72a44b38', '2018-09-08', '2461.99', '22297726', 5, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1321, NULL, '608342630', 16, '6fb2fc3c-9861-3f8f-a4a9-607c7399c540', '2019-04-28', '2910.91', '25647048', 4, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1322, NULL, '736161792', 16, '45429006-151d-38c3-8699-67d3d06ebfc0', '2019-05-18', '1460.44', '34590937', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1323, NULL, '690464439', 16, '21bae82f-5774-396c-ba63-24115c9e81b2', '2019-04-26', '975.50', '4265604', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1324, NULL, '705243533', 16, '36da959c-d279-31e0-bad0-3d542bf1b4cf', '2018-08-04', '1709.05', '9000366', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1325, NULL, '514707432', 16, '075fe8a8-b015-3db0-a593-70b872d487e8', '2018-10-05', '2998.09', '5995765', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1326, NULL, '151626776', 16, 'ed375e61-6113-3d1f-a620-93ea99b3607e', '2018-07-05', '664.85', '42048616', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1327, NULL, '449257222', 16, '0123dfc6-1d2b-3bdc-9e0f-d9c106c8bee1', '2018-12-13', '448.74', '46719674', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1328, NULL, '385188320', 16, 'f987d49c-6e8f-36d5-9dea-71670b61e191', '2018-07-20', '2758.72', '6544819', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1329, NULL, '1352599160', 16, '3c2b8870-c380-3d76-883d-d75a482196bf', '2019-05-28', '819.59', '28630777', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1330, NULL, '922850193', 16, 'edf70a4b-b71a-381a-ab7a-32680f75d24c', '2019-05-22', '735.06', '46701668', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1331, NULL, '1344751200', 16, 'fcb1643a-c522-3fb5-98e8-ca8e7e1d69c0', '2019-04-15', '1400.88', '35129950', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1332, NULL, '606908528', 16, '83211852-1273-3b68-80e1-f58b8a1146cb', '2018-10-14', '2326.09', '33938180', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1333, NULL, '211955553', 16, '455f3633-762e-3922-8a3f-065594e6a1b8', '2018-10-11', '651.92', '17249765', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1334, NULL, '477248087', 16, 'ee3936ed-289b-3ba6-ad3a-41c56a4750a2', '2018-08-15', '388.20', '16974364', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1335, NULL, '695828325', 16, '5c02ab87-2b2e-3219-95d9-5623979a5caa', '2018-09-03', '509.07', '44818050', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL, NULL, NULL, NULL),
(1336, NULL, '487464423', 16, 'f0567796-fb0d-369e-b48b-15d254cb3ccf', '2018-09-13', '435.42', '41148257', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1337, NULL, '353077636', 16, 'be1d9e76-35e5-3896-9ecf-70aa31e0a87f', '2018-09-27', '1013.61', '22457705', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1338, NULL, '258515398', 16, 'c06bedde-94c5-3d7e-b35e-4e46d37a3ce9', '2019-01-26', '2082.32', '18839154', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1339, NULL, '1123691630', 16, 'e82c8bbd-89f2-3059-8fe4-2e94c938fc3d', '2019-04-29', '2949.56', '48361689', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1340, NULL, '1503728605', 16, '4eaae441-2845-39fb-9be6-bc72eca5eda1', '2018-06-25', '2270.54', '4286615', 2, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1341, NULL, '520921408', 16, 'b76efd12-e4aa-3ff5-b7df-4705a94a234b', '2019-05-15', '2744.55', '10678429', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1342, NULL, '609016754', 16, '0c5db570-a174-3f14-8746-57e582b1f22e', '2019-04-18', '2333.55', '10137629', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1343, NULL, '655879019', 16, '4422d21a-6434-3462-a1cd-d96ca99a179e', '2018-07-22', '2457.02', '10681258', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1344, NULL, '752387240', 16, '8dbb1cd6-2e31-3144-a933-515f3e13a5e7', '2018-11-20', '2338.07', '43297347', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1345, NULL, '576312833', 16, '41fe375c-e1ec-34d5-a9a7-b25f616c9c04', '2018-08-24', '2829.20', '7627950', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1346, NULL, '1130498013', 16, '2acfda7a-517f-37b3-bc86-723ab6ecbd59', '2019-05-11', '2237.80', '4088623', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1347, NULL, '1492541102', 16, 'a69028eb-bb28-3364-b23f-18deda8e2970', '2019-04-01', '2134.34', '21853829', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1348, NULL, '1355058952', 16, '79f0c19c-c6b6-3895-947e-6d0d3c499317', '2019-06-08', '851.57', '17092019', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1349, NULL, '155628953', 16, '1ae37225-0adf-315b-98e8-240ffda6c2e0', '2019-01-15', '672.97', '20107401', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1350, NULL, '1288682754', 16, '468a0e61-3bd1-339f-b199-583f96273a0a', '2018-06-11', '596.04', '20582995', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1351, NULL, '919127669', 16, 'c77c4888-3019-3fbb-bc9f-def6c9d4a225', '2018-11-21', '2086.43', '12153701', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1352, NULL, '770086268', 16, 'd5ebac82-8e0b-3ea1-b797-1a5085e031f6', '2019-04-29', '1247.44', '3488208', 7, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1353, NULL, '508613824', 16, '898ab917-56a9-3d3d-9a63-0a83a88969df', '2019-01-07', '1052.66', '8566150', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1354, NULL, '624198909', 17, 'a672856f-4046-35a9-9611-fbc8aee55154', '2019-04-24', '1317.68', '32397832', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1355, NULL, '694499856', 17, 'e7d2391e-acd4-3954-af9b-9bed10eb55e9', '2019-03-31', '1863.85', '15916275', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1356, NULL, '212437026', 17, 'dc2af7cb-7861-3796-9650-cd9326c36b11', '2018-06-12', '2785.40', '29542558', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1357, NULL, '1033151748', 17, '470b344a-27f6-388f-a3b4-8476970566a1', '2019-04-17', '2665.15', '48120608', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1358, NULL, '1281049775', 17, '2f8c1055-661f-32e7-a568-1d68901af337', '2018-08-17', '1972.72', '31690327', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL, NULL, NULL, NULL),
(1359, NULL, '1299563343', 17, '047e1450-9148-3eb9-9f8e-974536cb0652', '2018-11-09', '477.34', '26236425', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1360, NULL, '1477396556', 17, 'ffa383bc-72ea-300f-8c9b-2219bcd194b1', '2018-06-19', '2439.74', '40428775', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1361, NULL, '660694022', 17, '0cd96139-beb8-32ec-8e44-aa4b7cc26cac', '2018-08-11', '415.44', '35477733', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:58', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1362, NULL, '67065331', 17, '3864a08a-1fcc-3728-ac01-eb0b1b476442', '2019-02-19', '1635.46', '6150922', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL, NULL, NULL, NULL),
(1363, NULL, '267837558', 17, '57e5128a-4d9f-375f-9815-b856cd8a9688', '2019-05-11', '2670.01', '7173729', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1364, NULL, '549765426', 18, '5f4b18b5-1ef7-3f9d-b73f-32a4708ca730', '2018-07-08', '2084.50', '21160917', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1365, NULL, '501154473', 18, 'ca98188e-1aca-3868-a245-ce2b987ed920', '2019-02-13', '2295.17', '32532176', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL, NULL, NULL, NULL),
(1366, NULL, '1438427451', 18, 'f33206f7-dc61-3526-8f6e-fb1bb12051f4', '2019-05-02', '454.23', '2022049', 10, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 10, 0, 0, 0, NULL, NULL, NULL, NULL),
(1367, NULL, '174191350', 18, '0825a842-a638-3431-85f4-61de85514dde', '2018-06-23', '992.68', '27042108', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1368, NULL, '722040557', 18, '4969b22e-cd78-3c68-9755-52e9621a90ee', '2018-11-12', '1148.51', '46663849', 1, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1369, NULL, '654099028', 18, '870029b0-af3d-3d44-a046-626ff4202475', '2019-04-28', '934.08', '9228413', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1370, NULL, '1300768115', 18, '5917efda-5580-333c-84fb-41be53c870c0', '2019-02-26', '1711.33', '40815429', 3, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1371, NULL, '516384789', 18, '49df5067-1182-331f-ba3f-314cd43d6762', '2019-03-01', '1722.11', '38743954', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1372, NULL, '159965917', 18, '6a602651-b9ea-3a4c-80c5-a62924b58f9a', '2019-02-03', '1551.97', '44704409', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL, NULL, NULL, NULL),
(1373, NULL, '735472128', 18, '7209c2d7-b720-3074-b59d-b022a0a0062b', '2019-04-25', '2626.09', '37159265', NULL, 'Created by DB seeder', NULL, 1, '2019-06-11 01:52:59', '2019-06-11 01:53:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL, NULL, NULL, NULL),
(1374, NULL, '01376283', 9, NULL, '2019-07-30', NULL, NULL, 15, NULL, NULL, 59, '2019-07-16 19:16:01', '2019-07-16 19:16:01', 1, NULL, 1, 0, NULL, 0, NULL, 0, NULL, NULL, '2019-07-16 19:16:01', NULL, 2, 'App\\Models\\User', NULL, NULL, 1, 0, 1, 0, NULL, NULL, NULL, NULL),
(1375, NULL, '17120119', 10, NULL, NULL, NULL, NULL, 64, NULL, NULL, 65, '2019-07-17 19:48:52', '2019-08-19 18:49:11', 1, NULL, 1, 0, NULL, 0, NULL, 1, NULL, NULL, '2019-07-17 19:48:52', NULL, 6, 'App\\Models\\User', NULL, NULL, 16, 0, 1, 0, NULL, NULL, NULL, NULL),
(1376, 'CPU', '111222333', 10, NULL, NULL, NULL, NULL, 62, NULL, '094KHyMIMlAGuQ2FjGrzOkzaF.jpeg', 64, '2019-07-17 20:09:43', '2019-08-05 03:26:41', 1, NULL, 1, 0, NULL, 0, NULL, 1, NULL, NULL, '2019-08-01 00:00:00', '2019-08-31', 5, 'App\\Models\\User', NULL, NULL, 11, 0, 1, 0, NULL, NULL, NULL, NULL),
(1377, 'Laptop', '111222444', 9, NULL, NULL, NULL, NULL, NULL, NULL, 'xMiJxG8Pd0MWlB5Z18dtPVbJK.jpeg', 64, '2019-07-17 20:15:12', '2019-07-17 20:50:24', 1, NULL, 2, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(1378, 'Displays', '111222555', 18, NULL, NULL, '15.00', NULL, 1376, NULL, 'SG4wmNFbKe7feEmCPshjat2B0.jpeg', 64, '2019-07-17 20:16:32', '2019-07-17 20:46:39', 1, NULL, 1, 0, 12, 0, NULL, 0, NULL, NULL, '2019-07-09 00:00:00', '2019-07-26', 5, 'App\\Models\\Asset', NULL, NULL, NULL, 0, 1, 0, NULL, NULL, NULL, NULL),
(1379, 'Macbook', '111222666', 2, NULL, NULL, '30.00', NULL, NULL, NULL, 'M5NLuBOvI4qQenVDKmwY4oyQN.jpeg', 64, '2019-07-17 20:22:47', '2019-07-17 20:53:33', 1, NULL, 1, 0, 24, 0, NULL, 0, 11, NULL, NULL, NULL, 5, NULL, NULL, NULL, 11, 0, 0, 0, NULL, NULL, NULL, NULL),
(1380, 'Mobile', '111222777', 15, NULL, NULL, '2.50', NULL, NULL, NULL, 'ocQc1K7JtPkQX0kDjqj56xPCT.jpeg', 64, '2019-07-17 20:26:49', '2019-07-17 20:54:04', 1, NULL, 1, 0, 12, 0, NULL, 0, 8, NULL, NULL, NULL, 5, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1381, 'LT-Lenovo', '111222888', 7, NULL, NULL, '25.00', NULL, NULL, NULL, 'hijb6n3DQMpMNVEMp3DOHneF7.jpeg', 64, '2019-07-17 20:30:31', '2019-07-17 20:52:58', 1, NULL, 1, 0, 12, 0, NULL, 0, 6, NULL, NULL, NULL, 5, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1382, 'Displays - Dell', '111222999', 18, NULL, NULL, '2.00', NULL, NULL, NULL, '19zJ53gLC4Hf421f7vUqiFnhB.jpeg', 64, '2019-07-17 20:32:25', '2019-07-17 20:48:39', 1, NULL, 1, 0, 12, 0, NULL, 0, 8, NULL, NULL, NULL, 5, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1383, 'Destops', '111222112', 10, NULL, NULL, NULL, NULL, NULL, NULL, 'vF6QJNJhj5MsSL3anTTXEm5hG.jpeg', 64, '2019-07-17 20:34:00', '2019-07-17 20:46:09', 1, NULL, 1, 0, NULL, 0, NULL, 0, 8, NULL, NULL, NULL, 5, NULL, NULL, NULL, 8, 0, 0, 0, NULL, NULL, NULL, NULL),
(1384, 'LG', '111222113', 17, NULL, NULL, '6.00', NULL, NULL, NULL, 'IrMCDL6RXK2oSMZdRpaGWAcfM.jpeg', 64, '2019-07-17 20:34:50', '2019-07-17 20:52:25', 1, NULL, 1, 0, 5, 0, NULL, 0, 1, NULL, NULL, NULL, 5, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1385, 'LENOVO', '111222114', 9, NULL, NULL, '7.00', NULL, NULL, NULL, 'WKh2sv2z1CCnCzXZ76FbfK0p0.jpeg', 64, '2019-07-17 20:36:08', '2019-07-17 20:51:18', 1, NULL, 3, 0, 6, 0, NULL, 0, 6, NULL, NULL, NULL, 5, NULL, NULL, NULL, 6, 0, 0, 0, NULL, NULL, NULL, NULL),
(1386, NULL, '111222501', 19, NULL, '2019-07-12', '150.00', NULL, NULL, NULL, 'fKeIzixTUY17pa2G7PivfkLn2.jpeg', 59, '2019-07-17 21:17:43', '2019-07-17 21:18:18', 1, NULL, 1, 0, 12, 0, 4, 0, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(1387, NULL, '111222502', 19, NULL, NULL, '170.00', NULL, 62, NULL, 'LyOCxJciAglWyaUNBr8ZsyLFN.jpeg', 59, '2019-07-17 21:19:01', '2019-07-17 21:19:01', 1, NULL, 1, 0, 12, 0, NULL, 0, NULL, NULL, '2019-07-17 21:19:01', NULL, 5, 'App\\Models\\User', NULL, NULL, 11, 0, 1, 0, NULL, NULL, NULL, NULL),
(1388, '', '037118006', 20, 'e6fe18ea-12b7-3ed7-ad68-964f05898af1', NULL, '2973.89', NULL, NULL, NULL, NULL, NULL, '2019-08-07 20:48:17', '2019-08-07 20:48:17', 1, NULL, 8, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1389, '', '037118007', 20, 'e6fe18ea-12b7-3ed7-ad68-964f05898af1', NULL, '2973.89', NULL, NULL, NULL, NULL, NULL, '2019-08-07 20:49:43', '2019-08-07 20:49:43', 1, NULL, 8, 0, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1390, '', '0373034', 20, 'xxx-xxx-xxx-xxxxxxx', NULL, '1111.11', NULL, NULL, NULL, NULL, NULL, '2019-08-07 20:52:25', '2019-08-08 18:42:35', 1, NULL, 8, 0, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL, NULL, NULL, NULL),
(1391, 'Alien 17 inch', '15385-xxx-DXRM-01', 21, '15385-xxx-DXRM-01', '2019-08-01', '2700.00', NULL, NULL, NULL, 'V4WDyIQivpU9Lf2cV74L2CBSg.jpeg', 59, '2019-08-09 00:21:09', '2019-08-13 01:35:21', 1, NULL, 1, 0, 24, 0, 6, 1, 11, NULL, NULL, NULL, 5, NULL, NULL, NULL, 11, 3, 3, 2, NULL, NULL, NULL, NULL),
(1392, 'Alien 17 inch', '15385-xxx-DXRM-02', 21, '15385-xxx-DXRM-02', '2019-08-01', '2700.00', NULL, 62, NULL, '8ye4zgTyyZeq0eMVNMbq63ibw.jpeg', 59, '2019-08-09 00:28:37', '2019-08-12 00:51:43', 1, NULL, 1, 0, 24, 0, 6, 1, 11, 'pending', '2019-08-12 00:51:42', NULL, 5, 'App\\Models\\User', NULL, NULL, 11, 0, 1, 1, NULL, NULL, NULL, NULL),
(1393, 'Alien 17 inch', '15385-xxx-DXRM-03', 21, '15385-xxx-DXRM-03', '2019-08-01', '2700.00', NULL, 67, NULL, 'gx0mybWPeCvG8YIgD31QA2E9p.jpeg', 59, '2019-08-09 00:29:01', '2019-08-20 20:46:33', 1, NULL, 1, 0, 24, 0, 6, 1, 11, 'pending', '2019-08-12 00:55:22', NULL, 5, 'App\\Models\\User', NULL, NULL, NULL, 0, 1, 1, NULL, NULL, NULL, NULL),
(1394, 'Alien 17 inch', '15385-xxx-DXRM-04', 21, '15385-xxx-DXRM-04', '2019-08-01', '2700.00', NULL, 62, NULL, 'tB3VLKLoJY5J1V1hjtgqm52Wn.jpeg', 59, '2019-08-09 00:29:12', '2019-08-12 06:00:49', 1, NULL, 1, 0, 24, 0, 6, 1, 11, 'pending', '2019-08-12 06:00:49', '2019-08-12', 5, 'App\\Models\\User', NULL, NULL, 11, 1, 2, 1, NULL, NULL, NULL, NULL),
(1395, 'Alien 17 inch', '15385-xxx-DXRM-05', 21, '15385-xxx-DXRM-05', '2019-08-01', '2700.00', NULL, 62, NULL, '5mqUJJdKG1GxovnHA4d8apS2g.jpeg', 59, '2019-08-09 00:30:46', '2019-08-12 00:58:49', 1, NULL, 1, 0, 24, 0, 6, 1, 11, 'pending', '2019-08-12 00:58:49', NULL, 5, 'App\\Models\\User', NULL, NULL, 11, 0, 1, 2, NULL, NULL, NULL, NULL),
(1396, 'Alien 17 inch', '15385-xxx-DXRM-06', 21, '15385-xxx-DXRM-06', '2019-08-01', '2700.00', NULL, NULL, NULL, 'rQj1kfEyaKmGuQPtAGc6TB8NF.jpeg', 59, '2019-08-09 00:31:15', '2019-08-09 00:33:04', 1, NULL, 1, 0, 24, 0, 6, 1, 11, NULL, NULL, NULL, 5, NULL, NULL, NULL, 11, 0, 0, 0, NULL, NULL, NULL, NULL),
(1397, 'Alien 17 inch', '15385-xxx-DXRM-07', 21, '15385-xxx-DXRM-07', '2019-08-01', '2700.00', NULL, NULL, NULL, 'vhXrrxP0CoUxnrBjHs0EIJURx.jpeg', 59, '2019-08-09 00:31:42', '2019-08-09 00:31:42', 1, NULL, 1, 0, 24, 0, 6, 1, 11, NULL, NULL, NULL, 5, NULL, NULL, NULL, 11, 0, 0, 0, NULL, NULL, NULL, NULL),
(1398, 'Alien 17 inch', '15385-xxx-DXRM-08', 21, '15385-xxx-DXRM-08', '2019-08-01', '2700.00', NULL, NULL, NULL, 'MKN5he4jzF29EsA040Bw5qtF4.jpeg', 59, '2019-08-09 00:32:07', '2019-08-09 00:32:07', 1, NULL, 1, 0, 24, 0, 6, 1, 11, NULL, NULL, NULL, 5, NULL, NULL, NULL, 11, 0, 0, 0, NULL, NULL, NULL, NULL),
(1399, 'Alien 17 inch', '15385-xxx-DXRM-09', 21, '15385-xxx-DXRM-09', '2019-08-01', '2700.00', NULL, NULL, NULL, 'GAb2ytUAejmFXUDKOt5BAmGzf.jpeg', 59, '2019-08-09 00:32:21', '2019-08-09 00:32:21', 1, NULL, 1, 0, 24, 0, 6, 1, 11, NULL, NULL, NULL, 5, NULL, NULL, NULL, 11, 0, 0, 0, NULL, NULL, NULL, NULL),
(1400, 'Alien 17 inch', '15385-xxx-DXRM-10', 21, '15385-xxx-DXRM-10', '2019-08-01', '2700.00', NULL, 11, NULL, 'jWQn8gEf8MAwz6MOaVl9WotH1.jpeg', 59, '2019-08-09 00:32:36', '2019-08-19 18:56:41', 1, NULL, 1, 0, 24, 0, 6, 1, 11, NULL, '2019-08-19 18:56:41', NULL, 5, 'App\\Models\\Location', NULL, NULL, 11, 0, 1, 0, NULL, NULL, NULL, NULL),
(1401, 'Predator 17 inch', '15385-zzz-DXRM-01', 22, '15385-zzz-DXRM-01', NULL, '2500.00', NULL, NULL, NULL, NULL, NULL, '2019-08-12 02:06:05', '2019-08-12 02:06:05', 1, NULL, 1, 0, NULL, NULL, NULL, 0, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 0, 0, 0, NULL, NULL, NULL, NULL),
(1402, '', '15385-zzz-DXRM-02', 22, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-12 02:22:29', '2019-08-12 02:22:29', 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL),
(1403, '', '15385-zzz-DXRM-03', 22, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-12 02:30:58', '2019-08-12 02:30:58', 1, NULL, 1, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `asset_logs`
--

CREATE TABLE `asset_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int(11) NOT NULL,
  `checkedout_to` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `filename` text COLLATE utf8mb4_unicode_ci,
  `requested_at` datetime DEFAULT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `accessory_id` int(11) DEFAULT NULL,
  `accepted_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `expected_checkin` date DEFAULT NULL,
  `component_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asset_maintenances`
--

CREATE TABLE `asset_maintenances` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL,
  `supplier_id` int(10) UNSIGNED NOT NULL,
  `asset_maintenance_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_warranty` tinyint(1) NOT NULL,
  `start_date` date NOT NULL,
  `completion_date` date DEFAULT NULL,
  `asset_maintenance_time` int(11) DEFAULT NULL,
  `notes` longtext COLLATE utf8mb4_unicode_ci,
  `cost` decimal(20,2) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_maintenances`
--

INSERT INTO `asset_maintenances` (`id`, `asset_id`, `supplier_id`, `asset_maintenance_type`, `title`, `is_warranty`, `start_date`, `completion_date`, `asset_maintenance_time`, `notes`, `cost`, `deleted_at`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 1, 5, 'Repair', 'Title', 0, '2019-08-01', NULL, NULL, NULL, NULL, '2019-08-22 00:25:06', '2019-08-08 20:52:55', '2019-08-22 00:25:06', 64);

-- --------------------------------------------------------

--
-- Table structure for table `asset_uploads`
--

CREATE TABLE `asset_uploads` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `asset_id` int(11) NOT NULL,
  `filenotes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `eula_text` longtext COLLATE utf8mb4_unicode_ci,
  `use_default_eula` tinyint(1) NOT NULL DEFAULT '0',
  `require_acceptance` tinyint(1) NOT NULL DEFAULT '0',
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'asset',
  `checkin_email` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `user_id`, `deleted_at`, `eula_text`, `use_default_eula`, `require_acceptance`, `category_type`, `checkin_email`, `image`) VALUES
(1, 'Laptops', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Eum veniam sunt aut tempora quidem aperiam. Cumque facere voluptatibus ipsum et dolorum modi. Sunt blanditiis deserunt perspiciatis quia.', 1, 1, 'asset', 1, NULL),
(2, 'Desktops', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Fuga sed et magni eos. Veritatis excepturi omnis ut. Eos sed sint nulla est ut ducimus at. Ut assumenda aliquam repellat.', 1, 0, 'asset', 0, NULL),
(3, 'Tablets', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Vitae magnam enim exercitationem aut aliquid laudantium enim. Enim velit non totam et dolorum. Ea est sit accusantium occaecati laborum delectus officia. Eos voluptate est eaque eveniet qui est quis libero.', 1, 0, 'asset', 0, NULL),
(4, 'Mobile Phones', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Dolorem nam officiis ex quo voluptas. Cum et nihil quia. Perspiciatis est eveniet assumenda in nihil impedit nisi.', 0, 0, 'asset', 0, NULL),
(5, 'Displays', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Ea eius corrupti sed id quas. Possimus iusto tempora facere consequatur possimus. Eius culpa facilis nihil id est quo maiores.', 0, 0, 'asset', 1, NULL),
(6, 'VOIP Phones', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Fugiat sequi dolores repellat provident. Pariatur et ducimus modi. Iure nesciunt hic quia minus aut nesciunt perferendis. Et eos velit dicta adipisci.', 0, 0, 'asset', 1, NULL),
(7, 'Conference Phones', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Ut consequuntur iste odit quis et sed rerum. Provident rerum debitis autem fugiat eligendi provident. Aliquid eius cum dolor tenetur voluptas quos repellat. Placeat est in saepe aut dolore.', 0, 0, 'asset', 1, NULL),
(8, 'Keyboards', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Dolore est praesentium sed quis dicta. Vel perspiciatis blanditiis facere aliquam adipisci magnam. Incidunt corporis quia vero quia et. Aliquam maxime laborum qui neque voluptas.', 0, 0, 'accessory', 0, NULL),
(9, 'Mouse', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Qui assumenda neque error dicta expedita. Rerum nostrum incidunt voluptates voluptatem similique dolor aut architecto. Et et est error commodi voluptate.', 0, 0, 'accessory', 1, NULL),
(10, 'Printer Paper', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'At et aut libero. Qui quas quidem impedit est tenetur. Occaecati quisquam odit quam quo voluptatem. Molestias quidem culpa dolorem voluptate ut odit velit. Et ipsa et vitae minus explicabo.', 0, 0, 'consumable', 0, NULL),
(11, 'Printer Ink', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Quis in sed ipsam sequi at perferendis culpa tempora. Et id nihil non atque temporibus. Sit voluptatum aut laboriosam sit rerum consectetur. Eius facilis voluptatem quo natus saepe sit culpa.', 1, 0, 'consumable', 0, NULL),
(12, 'HDD/SSD', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Enim alias aut omnis sit debitis. Inventore dolorem incidunt et. Enim sed ex soluta voluptatibus voluptas. Nihil et est et dolores. Non odit sequi quod cum doloribus rerum sed et.', 0, 0, 'component', 1, NULL),
(13, 'RAM', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Quam debitis sed eum alias a. Laudantium atque hic molestias odit. Dignissimos qui occaecati ex culpa. Quod omnis quidem nesciunt eum molestiae. Cum voluptate excepturi eum quo accusamus.', 1, 0, 'component', 1, NULL),
(14, 'Graphics Software', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Rerum nisi laborum quidem aut ratione sapiente sint. Voluptates minima quod quis consequatur temporibus facere dolor.', 0, 0, 'license', 1, NULL),
(15, 'Office Software', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'Et sit provident nihil. Aut ex quos rem culpa sit fugiat nobis sunt. Sit minus nesciunt omnis molestiae animi. Ut excepturi suscipit aut qui est deleniti iure.', 0, 0, 'license', 0, NULL),
(16, 'POS System', '2019-07-17 21:13:49', '2019-07-17 21:16:45', 59, NULL, NULL, 0, 0, 'asset', 0, 'NHYS570jTooOora8DkbcGxL6M.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `checkout_requests`
--

CREATE TABLE `checkout_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `requestable_id` int(11) NOT NULL,
  `requestable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `canceled_at` datetime DEFAULT NULL,
  `fulfilled_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `checkout_requests`
--

INSERT INTO `checkout_requests` (`id`, `user_id`, `requestable_id`, `requestable_type`, `quantity`, `created_at`, `updated_at`, `canceled_at`, `fulfilled_at`, `deleted_at`) VALUES
(1, 59, 1, 'App\\Models\\Asset', 1, '2019-08-05 03:27:11', '2019-08-05 03:27:11', NULL, NULL, NULL),
(2, 59, 3, 'App\\Models\\Asset', 1, '2019-08-05 03:28:54', '2019-08-05 03:28:54', NULL, NULL, NULL),
(3, 59, 1156, 'App\\Models\\Asset', 1, '2019-08-05 03:29:31', '2019-08-05 03:29:31', NULL, NULL, NULL),
(4, 67, 1, 'App\\Models\\Asset', 1, '2019-08-11 20:43:59', '2019-08-11 20:43:59', NULL, NULL, NULL),
(5, 59, 2, 'App\\Models\\Asset', 1, '2019-08-11 21:23:54', '2019-08-11 21:23:59', '2019-08-11 21:23:59', NULL, NULL),
(6, 67, 1391, 'App\\Models\\Asset', 1, '2019-08-12 00:08:17', '2019-08-12 02:25:11', '2019-08-12 02:25:11', NULL, NULL),
(7, 67, 1392, 'App\\Models\\Asset', 1, '2019-08-12 00:14:15', '2019-08-12 00:14:15', NULL, NULL, NULL),
(8, 59, 1393, 'App\\Models\\Asset', 1, '2019-08-12 00:49:27', '2019-08-12 02:27:04', '2019-08-12 02:27:04', NULL, NULL),
(9, 67, 1391, 'App\\Models\\Asset', 1, '2019-08-12 00:52:04', '2019-08-12 02:25:11', '2019-08-12 02:25:11', NULL, NULL),
(10, 67, 1393, 'App\\Models\\Asset', 1, '2019-08-12 00:53:33', '2019-08-12 00:53:33', NULL, NULL, NULL),
(11, 67, 1394, 'App\\Models\\Asset', 1, '2019-08-12 00:54:10', '2019-08-12 00:54:10', NULL, NULL, NULL),
(12, 67, 1395, 'App\\Models\\Asset', 1, '2019-08-12 00:56:54', '2019-08-12 00:56:54', NULL, NULL, NULL),
(13, 59, 1395, 'App\\Models\\Asset', 1, '2019-08-12 00:57:25', '2019-08-12 00:57:25', NULL, NULL, NULL),
(14, 59, 1391, 'App\\Models\\Asset', 1, '2019-08-12 05:36:45', '2019-08-12 05:36:45', NULL, NULL, NULL),
(15, 67, 1391, 'App\\Models\\Asset', 1, '2019-08-12 05:45:11', '2019-08-12 05:45:11', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Brown Group', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL),
(2, 'Murphy-Torp', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL),
(3, 'Russel-Jast', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL),
(4, 'Wintheiser, Cole and Quitzon', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL),
(5, 'vinx vietnam', '2019-06-27 00:00:39', '2019-07-17 21:03:45', '5-vinxpng.png'),
(6, 'Aeon Mall', '2019-07-17 21:20:46', '2019-07-17 21:20:46', '8XliKQuofv7u7wPLOZMjIUjSF.png'),
(7, 'Quán ông già', '2019-08-09 01:13:15', '2019-08-09 01:13:15', NULL),
(8, '15385-xxx-DXRM-01', '2019-08-14 00:24:34', '2019-08-14 00:24:34', NULL),
(9, '15385-xxx-DXRM-02', '2019-08-14 00:24:34', '2019-08-14 00:24:34', NULL),
(10, '15385-xxx-DXRM-03', '2019-08-14 00:24:34', '2019-08-14 00:24:34', NULL),
(11, '15385-xxx-DXRM-04', '2019-08-14 00:24:34', '2019-08-14 00:24:34', NULL),
(12, '15385-xxx-DXRM-05', '2019-08-14 00:24:34', '2019-08-14 00:24:34', NULL),
(13, '15385-xxx-DXRM-06', '2019-08-14 00:24:34', '2019-08-14 00:24:34', NULL),
(14, '15385-xxx-DXRM-07', '2019-08-14 00:24:34', '2019-08-14 00:24:34', NULL),
(15, '15385-xxx-DXRM-08', '2019-08-14 00:24:34', '2019-08-14 00:24:34', NULL),
(16, '15385-xxx-DXRM-09', '2019-08-14 00:24:34', '2019-08-14 00:24:34', NULL),
(17, '15385-xxx-DXRM-10', '2019-08-14 00:24:34', '2019-08-14 00:24:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

CREATE TABLE `components` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `serial` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `components`
--

INSERT INTO `components` (`id`, `name`, `category_id`, `location_id`, `company_id`, `user_id`, `qty`, `order_number`, `purchase_date`, `purchase_cost`, `created_at`, `updated_at`, `deleted_at`, `min_amt`, `serial`, `image`) VALUES
(1, 'Crucial 4GB DDR3L-1600 SODIMM', 13, 3, 2, 1, 10, '34892491', '2019-01-21', '36.50', '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, 2, NULL, NULL),
(2, 'Crucial 8GB DDR3L-1600 SODIMM Memory for Mac', 13, NULL, NULL, 1, 10, '39398458', '2018-11-04', '10.21', '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, 2, NULL, NULL),
(3, 'Crucial BX300 120GB SATA Internal SSD', 12, NULL, NULL, 1, 10, '18028303', '2019-05-16', '15.62', '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, 2, NULL, NULL),
(4, 'Crucial BX300 240GB SATA Internal SSD', 12, NULL, NULL, 1, 10, '38337653', '2019-05-08', '17.52', '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `components_assets`
--

CREATE TABLE `components_assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `assigned_qty` int(11) DEFAULT '1',
  `component_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consumables`
--

CREATE TABLE `consumables` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `requestable` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `min_amt` int(11) DEFAULT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `item_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consumables`
--

INSERT INTO `consumables` (`id`, `name`, `category_id`, `location_id`, `user_id`, `qty`, `requestable`, `created_at`, `updated_at`, `deleted_at`, `purchase_date`, `purchase_cost`, `order_number`, `company_id`, `min_amt`, `model_number`, `manufacturer_id`, `item_no`, `image`) VALUES
(1, 'Cardstock (White)', 10, NULL, 1, 10, 0, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, '2018-08-08', '33.69', '6896932', 3, 2, NULL, 10, '28174144', NULL),
(2, 'Laserjet Paper (Ream)', 10, NULL, 1, 20, 0, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, '2018-12-11', '8.29', '8895307', NULL, 2, NULL, 10, '16221446', NULL),
(3, 'Laserjet Toner (black)', 11, NULL, 1, 20, 0, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, '2019-03-02', '36.09', '48338600', NULL, 2, NULL, 5, '26051700', NULL),
(4, '1111111', 11, 12, 59, 11, 0, '2019-07-05 01:29:08', '2019-08-18 19:23:24', NULL, '2019-07-24', '11111.00', '123213', 3, 111, '312312', 1, '213213', 'epPLoejRoOFFWPUYYYgxIZP3t.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `consumables_users`
--

CREATE TABLE `consumables_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `consumable_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `contact_id_1` int(11) DEFAULT NULL,
  `contact_id_2` int(11) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `billing_date` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  `terms_and_conditions` text COLLATE utf8mb4_unicode_ci,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `object_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contracts`
--

INSERT INTO `contracts` (`id`, `name`, `location_id`, `contact_id_1`, `contact_id_2`, `start_date`, `end_date`, `billing_date`, `payment_date`, `terms_and_conditions`, `notes`, `created_at`, `updated_at`, `deleted_at`, `user_id`, `object_id`, `object_type`) VALUES
(28, 'Hợp đồng 1', 1, 28, 7, '2019-07-08', '2019-09-04', '2019-07-30', '2019-07-10', 'axasxax', 'axasxax', '2019-07-08 02:39:47', '2019-07-29 00:10:21', NULL, 65, 3, 'App\\Models\\Company'),
(29, 'Hop dong 123', 11, 61, 28, '2019-07-01', '2019-07-31', '2019-07-31', '2019-07-31', NULL, NULL, '2019-07-08 02:43:59', '2019-07-29 00:09:47', NULL, 65, 16, 'App\\Models\\Department'),
(31, 'Contract Test 2', 9, 61, 61, '2019-07-02', '2019-07-12', '2019-07-05', '2019-07-10', 'Terms and Conditions', 'Notes', '2019-07-08 21:08:43', '2019-07-29 00:08:13', NULL, 65, 7, 'App\\Models\\Department'),
(32, 'Contract AD', NULL, 62, 7, '2019-07-24', '2019-07-31', '2019-08-11', NULL, 'x', 'x', '2019-07-08 21:10:22', '2019-08-13 23:55:00', NULL, 64, 7, 'App\\Models\\Department'),
(33, 'Contract Test 1', 11, 15, 61, '2019-07-01', '2019-07-05', '2019-07-03', '2019-07-04', 'sa', 'as', '2019-07-08 21:39:58', '2019-07-29 00:07:36', NULL, 65, 9, 'App\\Models\\Department'),
(34, 'Contract Test 1', 6, 7, 15, '2019-07-01', '2019-07-05', '2019-07-29', '2019-07-17', 'xsa', 'xasx', '2019-07-08 21:41:02', '2019-07-29 00:07:58', NULL, 65, 3, 'App\\Models\\Store'),
(35, 'Contract Fuji', 1, 61, 62, '2019-07-30', '2019-08-03', '2019-08-06', '2019-07-28', 'dasd', 'ahihi', '2019-07-16 01:53:48', '2019-07-29 00:06:44', NULL, 65, 1, 'App\\Models\\Company'),
(37, 'Contract SASSA', 10, 3, 5, '2019-08-06', '2019-08-07', '2019-08-07', '2019-07-28', 'xsaxasx', 'xsaxasx', '2019-07-16 19:19:09', '2019-07-29 00:07:07', NULL, 65, 17, 'App\\Models\\Store'),
(38, 'Contract 1707', 1, 53, 3, '2019-07-22', '2019-07-26', '2019-07-02', '2019-07-29', 'hihi', 'hihi', '2019-07-16 20:37:53', '2019-07-30 03:13:35', NULL, 64, 15, 'App\\Models\\Store'),
(39, 'HD Su kem', 7, 62, 65, '2019-07-11', '2019-07-18', '2019-07-09', '2019-07-18', 'Terms and Conditions', 'Notes\r\n', '2019-07-16 23:24:25', '2019-07-29 00:09:27', NULL, 65, 15, 'App\\Models\\Department'),
(42, 'Contract WangYiBo', 1, 5, 5, '2019-07-23', '2019-07-26', '2019-08-06', '2019-07-14', 'dasd', 'dasda', '2019-07-17 02:33:44', '2019-07-29 00:08:29', NULL, 65, 6, 'App\\Models\\Company'),
(43, 'Contract XiaoZhan', 1, 65, 61, '2019-07-29', '2019-07-30', '2019-06-25', '2019-07-30', 'xasxasx', 'xasxasx', '2019-07-17 02:34:19', '2019-07-29 00:08:47', NULL, 65, 17, 'App\\Models\\Store'),
(44, 'Contract WangYiB', NULL, NULL, NULL, '2019-07-23', '2019-07-22', '2019-07-22', NULL, NULL, NULL, '2019-07-17 02:36:00', '2019-07-17 02:37:44', '2019-07-17 02:37:44', 65, 0, ''),
(45, 'HD', NULL, NULL, NULL, '2019-07-11', '2019-07-18', '2019-07-26', NULL, NULL, NULL, '2019-07-17 02:56:20', '2019-07-17 02:56:49', '2019-07-17 02:56:49', 64, 0, ''),
(46, 'Sach giao khoa', 10, 15, 15, '2019-07-04', '2019-07-05', '2019-07-03', '2019-07-16', 'xsasx', 'xasxas', '2019-07-17 18:38:32', '2019-07-29 00:10:52', NULL, 65, 17, 'App\\Models\\Store'),
(47, 'Computer', 11, 62, 65, '2019-07-11', '2019-07-18', '2019-07-12', NULL, NULL, NULL, '2019-07-17 18:41:00', '2019-07-29 00:05:36', NULL, 65, 3, 'App\\Models\\Store'),
(48, 'HD cung cap may POS AeonBD', 12, 28, 62, '2019-08-01', '2020-08-07', '2019-08-31', '2019-07-01', 'asx', 'xasxsax', '2019-07-17 21:24:07', '2019-07-29 00:09:11', NULL, 65, 1, 'App\\Models\\Company'),
(49, 'Contract Aeon ', 6, 62, 28, '2019-07-09', '2019-07-31', '2019-08-07', '2019-07-16', 'as', 'dd', '2019-07-29 00:04:48', '2019-07-29 00:04:48', NULL, 65, 6, 'App\\Models\\Company'),
(50, 'Contract Mur', 6, 7, 15, '2019-07-09', '2019-07-23', '2019-08-05', '2019-08-02', NULL, NULL, '2019-07-30 02:04:23', '2019-07-30 02:04:23', NULL, 65, 2, 'App\\Models\\Company'),
(51, 'Contract_Company', 8, 64, 62, '2019-07-11', '2019-07-12', '2019-07-04', '2019-07-16', 'Terms and Conditions', 'Notes', '2019-07-30 03:05:22', '2019-07-30 03:06:55', NULL, 64, 5, 'App\\Models\\Company'),
(52, 'Sách ế', 1, NULL, NULL, '2019-07-01', '2019-07-03', '2019-07-03', NULL, 'Terms and Conditions', 'Notes', '2019-07-30 03:31:25', '2019-07-30 03:35:53', NULL, 64, 15, 'App\\Models\\Store'),
(53, 'Vở', 11, NULL, NULL, '2019-07-03', '2019-07-11', '2019-07-02', NULL, NULL, NULL, '2019-07-30 03:32:35', '2019-07-30 03:32:35', NULL, 64, 12, 'App\\Models\\Department'),
(54, 'ADR XXX', 6, 62, 28, '2019-08-06', '2019-08-21', '2019-08-21', '2019-07-31', NULL, NULL, '2019-07-31 19:44:31', '2019-08-05 04:25:18', NULL, 59, 15, 'App\\Models\\Store'),
(55, 'Laptop', 12, 64, 64, '2019-08-01', '2019-08-08', '2019-08-01', NULL, NULL, NULL, '2019-07-31 20:21:35', '2019-07-31 20:27:34', '2019-07-31 20:27:34', 64, 5, 'App\\Models\\Department'),
(56, 'Test_Contract_Store', 12, 13, 2, '2019-08-01', '2019-08-02', '2019-08-21', '2019-08-01', 'Terms and Conditions', 'Notes', '2019-07-31 20:31:58', '2019-07-31 20:32:15', '2019-07-31 20:32:15', 64, 15, 'App\\Models\\Store'),
(57, 'Cung cap HT ', NULL, NULL, NULL, '2019-08-01', '2019-08-30', '2019-08-22', NULL, NULL, NULL, '2019-08-05 03:06:23', '2019-08-05 03:06:23', NULL, 59, 22, 'App\\Models\\Store'),
(58, 'ADR XXXX', 6, 15, 15, '2019-08-06', '2019-08-26', '2019-08-29', '2019-08-29', NULL, NULL, '2019-08-06 20:07:20', '2019-08-06 20:07:20', NULL, 59, 15, 'App\\Models\\Store'),
(59, 'Hợp đồng ăn uống với bé Thanh', 13, 68, NULL, '2019-08-01', '2019-08-31', '2019-07-30', '2019-08-31', NULL, NULL, '2019-08-09 01:29:52', '2019-08-09 01:29:52', NULL, 59, 21, 'App\\Models\\Department'),
(60, 'Hợp đồng ăn uống', NULL, NULL, NULL, '2019-08-01', '2019-08-31', '2019-08-10', NULL, NULL, NULL, '2019-08-11 20:40:33', '2019-08-11 20:40:33', NULL, 67, 21, 'App\\Models\\Department'),
(61, 'Cung cấp laptop cho 32 người', 11, NULL, NULL, '2019-08-01', '2020-09-30', '2019-08-01', NULL, NULL, NULL, '2019-08-13 01:30:42', '2019-08-14 00:01:18', NULL, 64, 15, 'App\\Models\\Department'),
(62, 'Aeon Ejima-san', NULL, NULL, NULL, '2019-08-01', '2019-08-31', '2019-08-10', NULL, NULL, NULL, '2019-08-14 00:31:16', '2019-08-14 00:31:16', NULL, 59, 17, 'App\\Models\\Store'),
(63, 'Contract_Test', 12, 71, 72, '2019-08-01', '2019-08-02', '2019-08-09', '2019-08-01', '\r\nTerms and Conditions', 'Notes', '2019-08-22 02:37:46', '2019-08-22 02:41:13', NULL, 64, 9, 'App\\Models\\Department');

-- --------------------------------------------------------

--
-- Table structure for table `contract_assets`
--

CREATE TABLE `contract_assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `contract_id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contract_assets`
--

INSERT INTO `contract_assets` (`id`, `contract_id`, `asset_id`, `created_at`, `updated_at`, `deleted_at`, `user_id`) VALUES
(20, 29, 1, '2019-07-08 03:08:37', '2019-07-08 03:08:37', NULL, 59),
(21, 29, 2, '2019-07-08 03:08:40', '2019-07-08 03:08:40', NULL, 59),
(22, 26, 1, '2019-07-08 03:15:09', '2019-07-08 03:15:09', NULL, 59),
(23, 26, 3, '2019-07-08 03:15:13', '2019-07-08 03:15:13', NULL, 59),
(24, 26, 5, '2019-07-08 03:15:16', '2019-07-08 03:15:16', NULL, 59),
(25, 30, 1, '2019-07-08 21:16:19', '2019-07-08 21:16:19', NULL, 59),
(26, 30, 3, '2019-07-08 21:16:30', '2019-07-08 21:16:30', NULL, 59),
(27, 31, 2, '2019-07-08 21:23:39', '2019-07-08 21:23:39', NULL, 59),
(28, 31, 3, '2019-07-08 21:23:46', '2019-07-08 21:23:46', NULL, 59),
(29, 35, 2, '2019-07-16 01:54:11', '2019-07-16 01:54:11', NULL, 59),
(31, 35, 13, '2019-07-16 01:54:21', '2019-07-16 01:54:21', NULL, 59),
(32, 36, 1, '2019-07-16 02:59:37', '2019-07-16 02:59:37', NULL, 59),
(33, 36, 2, '2019-07-16 03:00:11', '2019-07-16 03:00:11', NULL, 59),
(34, 36, 3, '2019-07-16 03:01:09', '2019-07-16 03:01:09', NULL, 59),
(35, 28, 1, '2019-07-16 18:50:39', '2019-07-16 18:50:39', NULL, 59),
(36, 28, 3, '2019-07-16 18:50:44', '2019-07-16 18:50:44', NULL, 59),
(38, 28, 28, '2019-07-16 18:50:52', '2019-07-16 18:50:52', NULL, 59),
(39, 34, 2, '2019-07-16 18:51:25', '2019-07-16 18:51:25', NULL, 59),
(40, 34, 1, '2019-07-16 18:51:28', '2019-07-16 18:51:28', NULL, 59),
(41, 34, 22, '2019-07-16 18:51:32', '2019-07-16 18:51:32', NULL, 59),
(42, 32, 1, '2019-07-16 19:16:45', '2019-07-16 19:16:45', NULL, 59),
(43, 32, 2, '2019-07-16 19:16:47', '2019-07-16 19:16:47', NULL, 59),
(44, 32, 3, '2019-07-16 19:16:50', '2019-07-16 19:16:50', NULL, 59),
(45, 37, 1, '2019-07-16 19:19:17', '2019-07-16 19:19:17', NULL, 59),
(47, 37, 20, '2019-07-16 19:19:25', '2019-07-16 19:19:25', NULL, 59),
(51, 38, 14, '2019-07-16 20:38:40', '2019-07-16 20:38:40', NULL, 65),
(52, 39, 2, '2019-07-16 23:26:32', '2019-07-16 23:26:32', NULL, 64),
(55, 39, 3, '2019-07-16 23:27:29', '2019-07-16 23:27:29', NULL, 64),
(56, 39, 4, '2019-07-16 23:49:16', '2019-07-16 23:49:16', NULL, 64),
(57, 43, 1, '2019-07-17 02:34:37', '2019-07-17 02:34:37', NULL, 65),
(58, 43, 2, '2019-07-17 02:34:56', '2019-07-17 02:34:56', NULL, 65),
(60, 39, 1, '2019-07-17 02:51:16', '2019-07-17 02:51:16', NULL, 64),
(61, 47, 2, '2019-07-17 18:41:37', '2019-07-17 18:41:37', NULL, 64),
(62, 47, 3, '2019-07-17 18:42:58', '2019-07-17 18:42:58', NULL, 64),
(63, 29, 30, '2019-07-17 20:55:17', '2019-07-17 20:55:17', NULL, 59),
(64, 48, 1386, '2019-07-17 21:25:35', '2019-07-17 21:25:35', NULL, 59),
(65, 48, 1387, '2019-07-17 21:25:46', '2019-07-17 21:25:46', NULL, 59),
(66, 47, 1386, '2019-07-17 21:30:26', '2019-07-17 21:30:26', NULL, 64),
(67, 49, 2, '2019-07-29 00:04:55', '2019-07-29 00:04:55', NULL, 65),
(68, 49, 5, '2019-07-29 00:04:58', '2019-07-29 00:04:58', NULL, 65),
(69, 46, 6, '2019-07-29 00:10:51', '2019-07-29 00:10:51', NULL, 65),
(70, 50, 4, '2019-07-30 02:04:28', '2019-07-30 02:04:28', NULL, 65),
(71, 50, 2, '2019-07-30 02:04:30', '2019-07-30 02:04:30', NULL, 65),
(72, 51, 1, '2019-07-30 03:05:28', '2019-07-30 03:05:28', NULL, 64),
(73, 51, 4, '2019-07-30 03:05:34', '2019-07-30 03:05:34', NULL, 64),
(75, 53, 4, '2019-07-30 03:32:47', '2019-07-30 03:32:47', NULL, 64),
(76, 53, 5, '2019-07-30 03:32:50', '2019-07-30 03:32:50', NULL, 64),
(78, 57, 1387, '2019-08-05 03:06:56', '2019-08-05 03:06:56', NULL, 59),
(79, 57, 1, '2019-08-05 03:07:37', '2019-08-05 03:07:37', NULL, 59),
(80, 57, 462, '2019-08-05 03:08:06', '2019-08-05 03:08:06', NULL, 59),
(81, 54, 1, '2019-08-05 03:39:25', '2019-08-05 03:39:25', NULL, 59),
(82, 58, 4, '2019-08-06 20:07:26', '2019-08-06 20:07:26', NULL, 59),
(83, 52, 2, '2019-08-06 20:42:14', '2019-08-06 20:42:14', NULL, 64),
(84, 59, 1391, '2019-08-09 01:30:16', '2019-08-09 01:30:16', NULL, 59),
(85, 59, 1392, '2019-08-09 01:30:25', '2019-08-09 01:30:25', NULL, 59),
(86, 59, 1393, '2019-08-09 01:30:31', '2019-08-09 01:30:31', NULL, 59),
(87, 60, 4, '2019-08-11 20:40:42', '2019-08-11 20:40:42', NULL, 67),
(88, 60, 5, '2019-08-11 20:40:49', '2019-08-11 20:40:49', NULL, 67),
(89, 60, 6, '2019-08-11 20:40:52', '2019-08-11 20:40:52', NULL, 67),
(90, 60, 8, '2019-08-11 20:40:56', '2019-08-11 20:40:56', NULL, 67),
(92, 61, 1392, '2019-08-13 01:31:14', '2019-08-13 01:31:14', NULL, 59),
(93, 61, 1393, '2019-08-13 01:31:26', '2019-08-13 01:31:26', NULL, 59),
(94, 61, 1151, '2019-08-13 01:31:44', '2019-08-13 01:31:44', NULL, 59),
(95, 61, 4, '2019-08-13 01:31:49', '2019-08-13 01:31:49', NULL, 59),
(96, 62, 1391, '2019-08-14 00:51:01', '2019-08-14 00:51:01', NULL, 59),
(97, 62, 1392, '2019-08-14 00:51:14', '2019-08-14 00:51:14', NULL, 59),
(98, 62, 1393, '2019-08-14 00:51:22', '2019-08-14 00:51:22', NULL, 59),
(99, 62, 4, '2019-08-14 00:51:30', '2019-08-14 00:51:30', NULL, 59),
(100, 62, 5, '2019-08-14 00:51:34', '2019-08-14 00:51:34', NULL, 59),
(101, 62, 6, '2019-08-14 00:51:38', '2019-08-14 00:51:38', NULL, 59),
(102, 58, 5, '2019-08-21 20:01:34', '2019-08-21 20:01:46', '2019-08-21 20:01:46', 1),
(103, 53, 1, '2019-08-22 02:34:05', '2019-08-22 02:34:05', NULL, 64),
(104, 63, 2, '2019-08-22 02:37:54', '2019-08-22 02:38:19', '2019-08-22 02:38:19', 64),
(105, 63, 2, '2019-08-22 02:40:56', '2019-08-22 02:40:56', NULL, 64);

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `field_values` text COLLATE utf8mb4_unicode_ci,
  `field_encrypted` tinyint(1) NOT NULL DEFAULT '0',
  `db_column` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `help_text` text COLLATE utf8mb4_unicode_ci,
  `show_in_email` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `format`, `element`, `created_at`, `updated_at`, `user_id`, `field_values`, `field_encrypted`, `db_column`, `help_text`, `show_in_email`) VALUES
(1, 'Progressive motivating firmware', '', 'text', '2019-06-11 01:53:07', '2019-06-11 01:53:07', NULL, NULL, 0, '_snipeit_progressive_motivating_firmware_1', NULL, 0),
(2, 'Customer-focused actuating knowledgebase', '', 'text', '2019-06-11 01:53:07', '2019-06-11 01:53:07', NULL, NULL, 0, '_snipeit_customer_focused_actuating_knowledgebase_2', NULL, 0),
(3, 'Self-enabling 6thgeneration interface', '', 'text', '2019-06-11 01:53:07', '2019-06-11 01:53:07', NULL, NULL, 0, '_snipeit_self_enabling_6thgeneration_interface_3', NULL, 0),
(4, 'Synergized grid-enabled archive', '', 'text', '2019-06-11 01:53:07', '2019-06-11 01:53:07', NULL, NULL, 0, '_snipeit_synergized_grid_enabled_archive_4', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_fieldsets`
--

CREATE TABLE `custom_fieldsets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_custom_fieldset`
--

CREATE TABLE `custom_field_custom_fieldset` (
  `custom_field_id` int(11) NOT NULL,
  `custom_fieldset_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `user_id`, `location_id`, `manager_id`, `notes`, `created_at`, `updated_at`, `deleted_at`, `image`, `store_id`) VALUES
(1, 'Human Resources', 1, 2, 62, NULL, '2019-06-11 01:52:40', '2019-07-16 20:14:14', NULL, NULL, 2),
(2, 'Engineering', 1, 3, NULL, NULL, '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 2),
(3, 'Marketing', 1, 5, NULL, NULL, '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 2),
(4, 'Client Services', 1, 1, NULL, NULL, '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 2),
(5, 'Product Management', 1, 4, NULL, NULL, '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 2),
(6, 'Dept of Silly Walks', 1, 3, NULL, NULL, '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 2),
(7, 'Dept1', 59, 5, 60, NULL, '2019-07-08 21:02:05', '2019-07-08 21:02:05', NULL, 'yEu7nfj4d7ycXUQl1pCUgJLwW.jpeg', 6),
(8, 'Dept 5', 59, 6, 60, NULL, '2019-07-09 00:17:35', '2019-07-09 00:17:35', NULL, NULL, 2),
(9, 'Hello Kitty', 64, 11, 64, NULL, '2019-07-16 20:51:29', '2019-08-04 21:51:48', NULL, '9-hello-kitty-cjpg.jpg', 12),
(12, 'Fahasa', 64, 11, 64, NULL, '2019-07-17 18:23:35', '2019-07-17 18:26:36', NULL, '12-bookstorejpeg.jpeg', 15),
(14, 'Fahasa', 64, NULL, NULL, NULL, '2019-07-17 18:29:54', '2019-07-17 18:29:54', NULL, NULL, 12),
(15, 'VVC Offshore', 59, 11, 62, NULL, '2019-07-17 21:11:03', '2019-07-17 21:11:03', NULL, 'vmoZndwZpXNcpIAQK7XyhhCbk.png', 16),
(16, 'VVC Solution', 59, 11, 64, NULL, '2019-07-17 21:12:08', '2019-07-17 21:12:08', NULL, 'Gw1gKVdVBL7BbiLqyLNk3lWHJ.jpeg', 16),
(17, 'Dept_1', 64, 5, 62, NULL, '2019-07-30 02:42:03', '2019-07-30 02:42:35', NULL, '17-van-phongjpg.jpg', 19),
(19, 'Offshore', 64, NULL, NULL, NULL, '2019-07-31 19:14:51', '2019-07-31 19:14:51', NULL, NULL, 18),
(20, 'Solution', 64, 8, 13, NULL, '2019-07-31 19:17:48', '2019-07-31 19:17:48', NULL, NULL, 18),
(21, 'Ban ăn uống', 59, 13, NULL, NULL, '2019-08-09 01:15:13', '2019-08-09 01:15:13', NULL, NULL, 23),
(22, 'Hello_Test', 64, 14, 71, NULL, '2019-08-22 19:28:40', '2019-08-22 19:29:05', NULL, NULL, 12);

-- --------------------------------------------------------

--
-- Table structure for table `depreciations`
--

CREATE TABLE `depreciations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `months` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `depreciations`
--

INSERT INTO `depreciations` (`id`, `name`, `months`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Computer Depreciation', 36, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1),
(2, 'Display Depreciation', 12, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1),
(3, 'Mobile Phone Depreciation', 24, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Test permission', '{\"superuser\":\"0\",\"admin\":\"1\",\"import\":\"1\",\"reports.view\":\"1\",\"assets.view\":\"1\",\"assets.create\":\"1\",\"assets.edit\":\"1\",\"assets.delete\":\"1\",\"assets.checkin\":\"1\",\"assets.checkout\":\"1\",\"assets.audit\":\"1\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"stores.view\":\"1\",\"stores.create\":\"1\",\"stores.edit\":\"1\",\"stores.delete\":\"1\",\"contracts.view\":\"0\",\"contracts.create\":\"0\",\"contracts.edit\":\"0\",\"contracts.delete\":\"0\",\"inventories.view\":\"0\",\"inventories.create\":\"0\",\"inventories.edit\":\"0\",\"inventories.delete\":\"0\",\"inventoryresults.view\":\"0\",\"inventoryresults.create\":\"0\",\"inventoryresults.edit\":\"0\",\"inventoryresults.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', '2019-08-20 21:42:27', '2019-08-20 21:50:31');

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `import_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `header_row` text COLLATE utf8mb4_unicode_ci,
  `first_row` text COLLATE utf8mb4_unicode_ci,
  `field_map` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `imports`
--

INSERT INTO `imports` (`id`, `name`, `file_path`, `filesize`, `import_type`, `created_at`, `updated_at`, `header_row`, `first_row`, `field_map`) VALUES
(34, NULL, '2019-08-12-020814-export-assets-2019-08-11csv', 211, 'asset', '2019-08-12 02:08:14', '2019-08-12 02:08:38', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Serial\",\"Model\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-01\",\"15385-zzz-DXRM-01\",\"Predator\",\"Laptops\",\"Ready to Deploy\",\"\",\"Fegle Home\",\"Asus\",\"2500.00\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial\":\"serial\",\"Model\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(35, NULL, '2019-08-12-020911-export-assets-2019-08-11csv', 194, 'asset', '2019-08-12 02:09:11', '2019-08-12 02:09:29', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Serial\",\"Model\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"\",\"15385-zzz-DXRM-01\",\"Predator\",\"Laptops\",\"Ready to Deploy\",\"\",\"Fegle Home\",\"Asus\",\"2500.00\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial\":\"serial\",\"Model\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(36, NULL, '2019-08-12-020945-export-assets-2019-08-11csv', 194, 'asset', '2019-08-12 02:09:45', '2019-08-12 02:10:37', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Serial\",\"Model\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-01\",\"\",\"Predator\",\"Laptops\",\"Ready to Deploy\",\"\",\"Fegle Home\",\"Asus\",\"2500.00\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial\":\"serial\",\"Model\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(37, NULL, '2019-08-12-021110-export-assets-2019-08-11csv', 186, 'asset', '2019-08-12 02:11:10', '2019-08-12 02:11:35', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Serial\",\"Model\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-01\",\"\",\"\",\"Laptops\",\"Ready to Deploy\",\"\",\"Fegle Home\",\"Asus\",\"2500.00\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial\":\"serial\",\"Model\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(38, NULL, '2019-08-12-021221-export-assets-2019-08-11csv', 179, 'asset', '2019-08-12 02:12:21', '2019-08-12 02:12:48', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Serial\",\"Model\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-01\",\"\",\"\",\"\",\"Ready to Deploy\",\"\",\"Fegle Home\",\"Asus\",\"2500.00\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial\":\"serial\",\"Model\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(39, NULL, '2019-08-12-021301-export-assets-2019-08-11csv', 162, 'asset', '2019-08-12 02:13:01', '2019-08-12 02:13:18', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Serial\",\"Model\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-01\",\"\",\"\",\"\",\"\",\"\",\"Fegle Home\",\"Asus\",\"2500.00\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial\":\"serial\",\"Model\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(40, NULL, '2019-08-12-021754-export-assets-2019-08-11csv', 150, 'asset', '2019-08-12 02:17:54', '2019-08-12 02:19:07', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Serial\",\"Model\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-01\",\"\",\"\",\"\",\"\",\"\",\"\",\"Asus\",\"2500.00\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial\":\"serial\",\"Model\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(41, NULL, '2019-08-12-021918-export-assets-2019-08-11csv', 158, 'asset', '2019-08-12 02:19:18', '2019-08-12 02:19:32', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Serial Number\",\"Model Name\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-01\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"2500.00\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial Number\":\"serial\",\"Model Name\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(42, NULL, '2019-08-12-021954-export-assets-2019-08-11csv', 150, NULL, '2019-08-12 02:19:54', '2019-08-12 02:19:54', '[\"\\ufeff\\\"Item Name\\\"\",\"Asset Tag\",\"Serial Number\",\"Model Name\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-01\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', NULL),
(43, NULL, '2019-08-12-022053-export-assets-2019-08-11csv', 142, 'asset', '2019-08-12 02:20:53', '2019-08-12 02:21:28', '[\"\\ufeffItem Name\",\"Asset Tag\",\"Serial Number\",\"Model Name\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-02\",\"\",\"\",\"\",\"\",\"\",\"\",\"\",\"\"]', '{\"\\ufeffItem Name\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial Number\":\"serial\",\"Model Name\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(45, NULL, '2019-08-12-022215-export-assets-2019-08-11csv', 150, 'asset', '2019-08-12 02:22:15', '2019-08-12 02:22:29', '[\"\\ufeffItem Name\",\"Asset Tag\",\"Serial Number\",\"Model Name\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-02\",\"\",\"Predator\",\"\",\"\",\"\",\"\",\"\",\"\"]', '{\"\\ufeffItem Name\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial Number\":\"serial\",\"Model Name\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(46, NULL, '2019-08-12-023043-export-assets-2019-08-11csv', 150, 'asset', '2019-08-12 02:30:43', '2019-08-12 02:30:58', '[\"\\ufeffItem Name\",\"Asset Tag\",\"Serial Number\",\"Model Name\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-03\",\"\",\"Predator\",\"\",\"\",\"\",\"\",\"\",\"\"]', '{\"\\ufeffItem Name\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial Number\":\"serial\",\"Model Name\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(47, NULL, '2019-08-12-023211-export-assets-2019-08-11csv', 155, 'asset', '2019-08-12 02:32:11', '2019-08-12 02:32:35', '[\"\\ufeffItem Name\",\"Asset Tag\",\"Serial Number\",\"Model Name\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-04\",\"\",\"Predator 2018\",\"\",\"\",\"\",\"\",\"\",\"\"]', '{\"\\ufeffItem Name\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial Number\":\"serial\",\"Model Name\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(48, NULL, '2019-08-12-024244-export-assets-2019-08-11csv', 155, 'asset', '2019-08-12 02:42:44', '2019-08-12 02:43:06', '[\"\\ufeffItem Name\",\"Asset Tag\",\"Serial Number\",\"Model Name\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-04\",\"\",\"Predator 2018\",\"\",\"\",\"\",\"\",\"\",\"\"]', '{\"\\ufeffItem Name\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial Number\":\"serial\",\"Model Name\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(49, NULL, '2019-08-12-024335-export-assets-2019-08-11csv', 164, 'asset', '2019-08-12 02:43:35', '2019-08-12 02:43:47', '[\"\\ufeffItem Name\",\"Asset Tag\",\"Serial Number\",\"Model Name\",\"Category\",\"Status\",\"Checked Out To\",\"Location\",\"Manufacturer\",\"Purchase Cost\"]', '[\"\",\"15385-zzz-DXRM-04\",\"\",\"Predator 2018\",\"\",\"\",\"\",\"\",\"Dell 2018\",\"\"]', '{\"\\ufeffItem Name\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Serial Number\":\"serial\",\"Model Name\":\"asset_model\",\"Category\":\"category\",\"Status\":\"status\",\"Checked Out To\":\"checkout_to\",\"Location\":\"location\",\"Manufacturer\":\"manufacturer\",\"Purchase Cost\":\"purchase_cost\"}'),
(50, NULL, '2019-08-14-122053-export-assets-2019-08-11csv', 555, 'asset', '2019-08-14 00:20:53', '2019-08-14 00:22:37', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Status\"]', '[\"Alien 17 inch\",\"15385-xxx-DXRM-01\",\"Ready to Deploy\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Status\":\"status\"}'),
(51, NULL, '2019-08-14-122328-export-assets-2019-08-11csv', 555, 'asset', '2019-08-14 00:23:28', '2019-08-14 00:24:34', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Status\"]', '[\"Alien 17 inch\",\"15385-xxx-DXRM-01\",\"Ready to Deploy\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"company\",\"Asset Tag\":\"company\",\"Status\":\"_snipeit_synergized_grid_enabled_archive_4\"}'),
(52, NULL, '2019-08-14-122501-export-assets-2019-08-11csv', 63, 'asset', '2019-08-14 00:25:01', '2019-08-14 00:25:10', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Status\"]', '[\"\\u00e2fafsf\",\"\",\"Ready to Deploy\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Status\":\"status\"}'),
(53, NULL, '2019-08-14-122722-export-assets-2019-08-11csv', 84, 'asset', '2019-08-14 00:27:22', '2019-08-14 00:27:31', '[\"\\ufeff\\\"Asset Name\\\"\",\"Asset Tag\",\"Status\"]', '[\"aaa\",\"\",\"Ready to Deploy\"]', '{\"\\ufeff\\\"Asset Name\\\"\":\"item_name\",\"Asset Tag\":\"asset_tag\",\"Status\":\"status\"}');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `inventory_date` date NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `object_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `inventory_date`, `name`, `notes`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `object_type`, `object_id`) VALUES
(26, '2019-07-01', 'Kiểm kê', 'Notes', 1, '2019-07-29 20:48:41', '2019-08-22 02:38:28', NULL, 'App\\Models\\Company', 5),
(27, '2019-07-03', 'Kiểm kê BD', NULL, 64, '2019-07-29 20:49:08', '2019-07-31 21:00:19', '2019-07-31 21:00:19', 'App\\Models\\Store', 17),
(28, '2019-07-03', 'Kiểm kê đợt 1', NULL, 64, '2019-07-29 20:49:36', '2019-07-29 20:49:36', NULL, 'App\\Models\\Contract', 29),
(29, '2019-07-02', 'Kiểm kê đợt 2', NULL, 64, '2019-07-29 20:50:41', '2019-07-29 20:50:41', NULL, 'App\\Models\\Contract', 33),
(30, '2019-07-04', 'Kiểm kê 3', NULL, 64, '2019-07-29 20:51:21', '2019-07-29 20:52:12', NULL, 'App\\Models\\Contract', 39),
(31, '2019-07-11', 'Name', NULL, 64, '2019-07-29 20:52:49', '2019-07-29 20:52:49', NULL, 'App\\Models\\Contract', 39),
(32, '2019-07-03', 'Inventory_Company', 'Notes', 64, '2019-07-30 03:39:42', '2019-07-30 03:40:36', NULL, 'App\\Models\\Store', 15),
(33, '2019-08-01', 'Inventory_laptop', NULL, 64, '2019-07-31 20:52:00', '2019-07-31 21:40:33', NULL, 'App\\Models\\Company', 6),
(34, '2019-08-01', 'Inventory_Laptop', NULL, 64, '2019-07-31 20:53:57', '2019-07-31 20:53:57', NULL, 'App\\Models\\Department', 9),
(35, '2019-08-01', 'Inventory_Laptop', NULL, 64, '2019-07-31 21:00:54', '2019-07-31 21:01:22', NULL, 'App\\Models\\Contract', 46),
(36, '2019-08-20', 'cv', NULL, 64, '2019-07-31 21:45:02', '2019-08-08 19:27:14', NULL, 'App\\Models\\Store', 17),
(37, '2019-08-01', '', NULL, 64, '2019-07-31 23:40:08', '2019-07-31 23:40:28', '2019-07-31 23:40:28', 'App\\Models\\Company', 5),
(38, '2019-08-01', 'Kiem ke 4', NULL, 64, '2019-08-04 21:59:50', '2019-08-04 21:59:50', NULL, 'App\\Models\\Store', 12),
(39, '2019-08-01', 'Kiem ke HT', NULL, 59, '2019-08-05 03:09:47', '2019-08-05 03:09:47', NULL, 'App\\Models\\Store', 17),
(40, '2019-07-05', 'Kiểm kê lần 1 wasaco', NULL, 63, '2019-08-09 00:01:11', '2019-08-09 00:02:38', NULL, 'App\\Models\\Location', 11),
(41, '2019-08-10', 'Kiểm kê lần 1', NULL, 59, '2019-08-09 01:34:51', '2019-08-09 01:34:51', NULL, 'App\\Models\\Contract', 59),
(42, '2019-08-01', 'A', NULL, 64, '2019-08-21 01:23:48', '2019-08-21 01:23:48', NULL, 'App\\Models\\Location', 12);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_results`
--

CREATE TABLE `inventory_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  `checked_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `familiar` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_results`
--

INSERT INTO `inventory_results` (`id`, `inventory_id`, `asset_id`, `checked_time`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `status_id`, `familiar`) VALUES
(60, 22, 1, '2019-07-17 03:28:18', 65, '2019-07-17 03:28:05', '2019-07-17 03:28:18', NULL, 1, 1),
(61, 22, 2, '2019-07-17 18:40:44', 59, '2019-07-17 18:40:44', '2019-07-17 18:40:44', NULL, 1, 1),
(62, 23, 2, '2019-07-17 19:53:35', 64, '2019-07-17 19:53:35', '2019-07-17 19:53:35', NULL, 6, 1),
(63, 23, 1, '2019-07-17 19:55:25', 64, '2019-07-17 19:55:25', '2019-07-17 19:55:25', NULL, 1, 0),
(64, 26, 1, '2019-07-29 20:53:09', 64, '2019-07-29 20:53:09', '2019-07-29 20:53:09', NULL, 1, 1),
(65, 26, 28, '2019-07-29 20:53:19', 64, '2019-07-29 20:53:19', '2019-07-29 20:53:19', NULL, 3, 0),
(66, 28, 2, '2019-07-29 20:53:48', 64, '2019-07-29 20:53:48', '2019-07-29 20:53:48', NULL, 1, 1),
(67, 28, 4, '2019-07-29 20:53:55', 64, '2019-07-29 20:53:55', '2019-07-29 20:53:55', NULL, 1, 0),
(68, 32, 4, '2019-07-30 03:44:43', 64, '2019-07-30 03:44:43', '2019-07-30 03:44:43', NULL, 1, 1),
(69, 32, 21, '2019-08-01 01:06:37', 64, '2019-07-30 03:45:59', '2019-07-31 18:06:37', '2019-07-31 18:06:37', 1, 0),
(70, 33, 1, '2019-07-31 20:58:04', 64, '2019-07-31 20:58:04', '2019-07-31 20:58:04', NULL, 1, 1),
(71, 27, 1, '2019-08-01 03:59:31', 64, '2019-07-31 20:58:45', '2019-07-31 20:59:31', '2019-07-31 20:59:31', 1, 1),
(72, 27, 3, '2019-08-01 03:59:36', 64, '2019-07-31 20:59:12', '2019-07-31 20:59:36', '2019-07-31 20:59:36', 7, 0),
(73, 35, 6, '2019-08-01 04:01:59', 64, '2019-07-31 21:01:33', '2019-07-31 21:01:59', '2019-07-31 21:01:59', 1, 1),
(74, 35, 3, '2019-08-01 04:01:55', 64, '2019-07-31 21:01:40', '2019-07-31 21:01:55', '2019-07-31 21:01:55', 1, 0),
(76, 31, 2, '2019-08-01 04:37:39', 1, '2019-08-16 00:00:00', '2019-08-20 00:00:00', NULL, 1, 1),
(77, 31, 7, '2019-08-01 04:37:51', 1, NULL, NULL, NULL, 7, 0),
(78, 29, 3, '2019-08-01 06:27:34', 64, '2019-07-31 21:59:59', '2019-07-31 23:27:34', '2019-07-31 23:27:34', 1, 0),
(79, 34, 1, '2019-08-01 06:33:36', 64, '2019-07-31 23:29:43', '2019-07-31 23:33:36', '2019-07-31 23:33:36', 1, 0),
(80, 29, 1, '2019-07-31 23:31:52', 64, '2019-07-31 23:31:52', '2019-07-31 23:31:52', NULL, 1, 0),
(81, 36, 1, '2019-07-31 23:41:01', 64, '2019-07-31 23:41:01', '2019-07-31 23:41:01', NULL, 1, 1),
(82, 35, 4, '2019-07-31 23:41:43', 64, '2019-07-31 23:41:43', '2019-07-31 23:41:43', NULL, 1, 0),
(83, 29, 2, '2019-08-04 18:17:35', 59, '2019-08-04 18:17:35', '2019-08-04 18:17:35', NULL, 1, 0),
(84, 29, 3, '2019-08-04 21:55:03', 64, '2019-08-04 21:55:03', '2019-08-04 21:55:03', NULL, 1, 0),
(85, 39, 2, '2019-08-05 03:15:37', 59, '2019-08-05 03:15:37', '2019-08-05 03:15:37', NULL, 1, 1),
(86, 39, 6, '2019-08-05 03:15:47', 59, '2019-08-05 03:15:47', '2019-08-05 03:15:47', NULL, 1, 1),
(87, 39, 59, '2019-08-05 03:16:48', 59, '2019-08-05 03:16:48', '2019-08-05 03:16:48', NULL, 1, 0),
(88, 41, 1391, '2019-08-09 15:41:51', 59, '2019-08-09 01:43:34', '2019-08-09 01:43:34', NULL, NULL, 1),
(89, 41, 1393, '2019-08-09 15:42:17', 59, '2019-08-09 01:43:35', '2019-08-09 01:43:35', NULL, 7, 1),
(90, 41, 1397, '2019-08-09 15:41:09', 59, '2019-08-09 01:43:36', '2019-08-09 01:43:36', NULL, NULL, 0),
(91, 36, 14, '2019-08-11 18:12:22', 63, '2019-08-11 18:12:22', '2019-08-11 18:12:22', NULL, 1, 0),
(92, 36, 2, '2019-08-11 18:12:27', 63, '2019-08-11 18:12:27', '2019-08-11 18:12:27', NULL, 1, 1),
(93, 41, 2, '2019-08-11 18:12:50', 63, '2019-08-11 18:12:50', '2019-08-11 18:12:50', NULL, 1, 0),
(94, 26, 1391, '2019-08-12 20:57:05', 59, '2019-08-12 06:59:47', '2019-08-12 06:59:47', NULL, NULL, 0),
(95, 26, 1392, '2019-08-12 21:23:08', 59, '2019-08-12 07:22:46', '2019-08-12 07:23:33', NULL, 6, 0),
(96, 32, 2, '2019-08-12 23:43:43', 59, '2019-08-12 23:43:43', '2019-08-12 23:43:43', NULL, 7, 1),
(97, 26, 1393, '2019-08-22 02:37:14', 1, '2019-08-22 02:37:14', '2019-08-22 02:37:14', NULL, 1, 1),
(98, 26, 2, '2019-08-22 02:37:28', 1, '2019-08-22 02:37:28', '2019-08-22 02:37:28', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `licenses`
--

CREATE TABLE `licenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `purchase_cost` decimal(20,2) DEFAULT NULL,
  `order_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seats` int(11) NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `depreciation_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `license_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `license_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `depreciate` tinyint(1) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `purchase_order` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `maintained` tinyint(1) DEFAULT NULL,
  `reassignable` tinyint(1) NOT NULL DEFAULT '1',
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `licenses`
--

INSERT INTO `licenses` (`id`, `name`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `seats`, `notes`, `user_id`, `depreciation_id`, `created_at`, `updated_at`, `deleted_at`, `license_name`, `license_email`, `depreciate`, `supplier_id`, `expiration_date`, `purchase_order`, `termination_date`, `maintained`, `reassignable`, `company_id`, `manufacturer_id`, `category_id`) VALUES
(1, 'Photoshop', '1b54595e-4df6-3097-821d-d5c5c628f9e1', '2018-12-08', '299.99', '12103989', 10, 'Created by DB seeder', 1, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, 'Dr. Kitty Rogahn III', 'sidney35@example.net', NULL, 4, '2020-02-22', '13503Q', '2019-03-28', 1, 0, NULL, 9, 14),
(2, 'Acrobat', '58e71064-ecd1-3588-bf7d-dca5bd8cdb73', '2018-10-08', '29.99', '40591445', 10, 'Created by DB seeder', 1, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, 'Dayna Hackett', 'cloyd47@example.net', NULL, 5, '2021-08-22', NULL, '2019-03-30', NULL, 1, NULL, 9, 14),
(3, 'InDesign', 'afe8a6e3-948a-3422-8613-7bafaa018b7e', '2019-01-25', '199.99', '37320235', 10, 'Created by DB seeder', 1, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, 'Sabina Rohan', 'vallie41@example.net', NULL, 4, '2020-07-30', NULL, '2019-01-05', NULL, 0, NULL, 9, 14),
(4, 'Office', '6fe49ad9-2a2d-3970-ab2d-52659aaf9f24', '2018-12-03', '49.99', '21530987', 20, 'Created by DB seeder', 1, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, 'Jaeden Zemlak', 'adams.cassandra@example.com', NULL, 2, '2019-12-06', NULL, '2019-03-05', NULL, 0, NULL, 2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `license_seats`
--

CREATE TABLE `license_seats` (
  `id` int(10) UNSIGNED NOT NULL,
  `license_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `license_seats`
--

INSERT INTO `license_seats` (`id`, `license_id`, `assigned_to`, `notes`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `asset_id`) VALUES
(1, 1, 62, NULL, 59, '2019-06-11 01:52:59', '2019-07-17 19:42:54', NULL, NULL),
(2, 1, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(3, 1, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(4, 1, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(5, 1, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(6, 1, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(7, 1, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(8, 1, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(9, 1, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(10, 1, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(11, 2, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(12, 2, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(13, 2, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(14, 2, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(15, 2, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(16, 2, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(17, 2, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(18, 2, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(19, 2, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(20, 2, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(21, 3, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(22, 3, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(23, 3, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(24, 3, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(25, 3, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(26, 3, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(27, 3, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(28, 3, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(29, 3, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(30, 3, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(31, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(32, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(33, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(34, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(35, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(36, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(37, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(38, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(39, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(40, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(41, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(42, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(43, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(44, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(45, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(46, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(47, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(48, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(49, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL),
(50, 4, NULL, NULL, NULL, '2019-06-11 01:52:59', '2019-06-11 01:52:59', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_ou` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `city`, `state`, `country`, `created_at`, `updated_at`, `user_id`, `address`, `address2`, `zip`, `deleted_at`, `parent_id`, `currency`, `ldap_ou`, `manager_id`, `image`) VALUES
(1, 'Lake Demetrius', 'Kulasmouth', 'CO', 'LV', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, '1621 Cleveland Neck Apt. 506', 'Suite 881', '07982', NULL, NULL, 'JOD', NULL, NULL, '2.jpg'),
(2, 'Raeganport', 'Stoneland', 'RI', 'UZ', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, '6329 Karolann Bridge', 'Suite 568', '44228', NULL, NULL, 'MOP', NULL, NULL, '4.jpg'),
(3, 'North Morganborough', 'East Leannside', 'WA', 'KN', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, '266 Cooper Isle', 'Apt. 881', '34992', NULL, NULL, 'BND', NULL, NULL, '1.jpg'),
(4, 'Port Adalberto', 'East Nicholaschester', 'GA', 'LY', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, '1895 Oberbrunner Harbors Apt. 748', 'Suite 097', '22182-9412', NULL, NULL, 'BTN', NULL, NULL, '1.jpg'),
(5, 'Eichmannbury', 'West Benedictbury', 'CO', 'NE', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, '541 Abel Roads Suite 796', 'Suite 807', '87611-0059', NULL, NULL, 'RWF', NULL, NULL, '5.jpg'),
(6, 'Gersonberg', 'South Kaelastad', 'VT', 'GY', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, '831 White Springs Suite 215', 'Suite 585', '83145', NULL, NULL, 'KPW', NULL, NULL, '6.jpg'),
(7, 'North Ernestinafort', 'North Erick', 'MO', 'ER', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, '393 Kunze Port', 'Apt. 998', '38289', NULL, NULL, 'ALL', NULL, NULL, '3.jpg'),
(8, 'Mitchelbury', 'Leifton', 'KS', 'CF', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, '853 Alexis Throughway Suite 237', 'Apt. 752', '96567-8262', NULL, NULL, 'VEF', NULL, NULL, '5.jpg'),
(9, 'South Bernardomouth', 'Port Julioland', 'MD', 'MM', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, '725 Zoe Drive', 'Suite 770', '85438', NULL, NULL, 'KHR', NULL, NULL, '9.jpg'),
(10, 'Macejkovicstad', 'Lake Kristin', 'NY', 'FJ', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, '2174 Terry Unions', 'Suite 959', '48966-9951', NULL, NULL, 'LRD', NULL, NULL, '7.jpg'),
(11, 'Waseco Building', 'Ho Chi Minh', NULL, 'VN', '2019-06-27 00:07:17', '2019-07-05 03:48:57', 59, '10 phổ quang P.2 Q.TB tp.HCM', NULL, NULL, NULL, NULL, NULL, NULL, 59, '11-wasecojpeg.jpeg'),
(12, '123 Thu Dau 1, BInh Duong', NULL, NULL, NULL, '2019-07-17 21:21:56', '2019-07-17 21:21:56', 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wsRjytKbiBvAFV8cj4d0Cz8Ru.jpeg'),
(13, 'Nhà bé Thanh', 'Ho Chi Minh City', NULL, 'VN', '2019-08-09 01:12:15', '2019-08-09 01:12:49', 59, '123 Trường Chinh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'Fegle Home', '', '', '', '2019-08-11 23:43:12', '2019-08-11 23:43:12', 59, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Phòng 304', NULL, NULL, NULL, '2019-08-12 04:38:40', '2019-08-12 04:38:40', 59, NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL),
(16, 'Phòng 101', 'Hồ Chí Minh', NULL, 'VN', '2019-08-19 18:48:18', '2019-08-19 18:51:35', 64, 'Số 10, Phổ Quang', 'Tân Bình', NULL, NULL, 11, 'A', NULL, 62, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remote_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `successful` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `username`, `remote_ip`, `user_agent`, `successful`, `created_at`, `updated_at`) VALUES
(1, 'ha.tb', '172.29.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1, '2019-06-11 01:51:23', NULL),
(2, 'ha.tb', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.114 Chrome/73.0.3683.114 Safari/537.36', 0, '2019-06-11 20:08:09', NULL),
(3, 'ha.tb', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.114 Chrome/73.0.3683.114 Safari/537.36', 0, '2019-06-11 20:08:20', NULL),
(4, 'ha.tb', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.114 Chrome/73.0.3683.114 Safari/537.36', 0, '2019-06-11 20:08:57', NULL),
(5, 'ha.tb@vn.vinx.asia', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.114 Chrome/73.0.3683.114 Safari/537.36', 0, '2019-06-11 20:26:16', NULL),
(6, 'ha.tb', '172.18.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) coc_coc_browser/79.0.114 Chrome/73.0.3683.114 Safari/537.36', 1, '2019-06-11 20:28:54', NULL),
(7, 'ha.tb', '192.168.0.37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 0, '2019-06-24 19:04:51', NULL),
(8, 'ha.tb', '192.168.0.37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 0, '2019-06-24 19:05:10', NULL),
(9, 'ha.tb', '192.168.0.37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1, '2019-06-24 19:05:40', NULL),
(10, 'ha.tb', '192.168.0.37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 0, '2019-06-25 20:47:44', NULL),
(11, 'ha.tb', '192.168.0.37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1, '2019-06-25 20:47:51', NULL),
(12, 'snipeit', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-06-25 21:03:16', NULL),
(13, 'snipeit', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-06-25 21:03:40', NULL),
(14, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-06-25 21:04:09', NULL),
(15, 'ha.tb', '192.168.0.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/75.0.3770.90 Chrome/75.0.3770.90 Safari/537.36', 1, '2019-06-25 23:44:23', NULL),
(16, 'ha.tb', '192.168.0.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1, '2019-06-26 19:16:24', NULL),
(17, 'admin', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-06-26 23:25:36', NULL),
(18, 'admin', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-06-26 23:37:01', NULL),
(19, 'admin', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-06-26 23:37:57', NULL),
(20, 'admin', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-06-26 23:38:28', NULL),
(21, 'admin', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-06-26 23:38:59', NULL),
(22, 'ha.tb', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-06-26 23:40:30', NULL),
(23, 'ha.tb', '192.168.0.95', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 0, '2019-07-02 23:46:42', NULL),
(24, 'ha.tb', '192.168.0.95', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1, '2019-07-02 23:47:00', NULL),
(25, 'ha.tb', '192.168.0.37', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1, '2019-07-02 23:57:17', NULL),
(26, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-03 18:53:23', NULL),
(27, 'ha.tb', '192.168.0.70', 'Mozilla/5.0 (Linux; Android 9; SM-G960N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.101 Mobile Safari/537.36', 1, '2019-07-04 20:39:34', NULL),
(28, 'ha.tb', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-07-04 20:54:12', NULL),
(29, 'ha.tb', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-04 20:54:33', NULL),
(30, 'ha.tb', '192.168.0.92', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-05 00:25:06', NULL),
(31, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-05 00:26:47', NULL),
(32, 'ha.tb', '192.168.0.103', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', 1, '2019-07-05 00:29:23', NULL),
(33, 'ha.tb', '192.168.0.103', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', 1, '2019-07-05 01:09:22', NULL),
(34, 'ha.tb', '192.168.0.88', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 0, '2019-07-05 01:53:33', NULL),
(35, 'ha.tb', '192.168.0.88', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1, '2019-07-05 01:53:48', NULL),
(36, 'ha.tb', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-07 18:11:48', NULL),
(37, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-07 18:39:57', NULL),
(38, 'ha.tb', '192.168.0.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/75.0.3770.90 Chrome/75.0.3770.90 Safari/537.36', 1, '2019-07-08 00:17:51', NULL),
(39, 'ha.tb', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-08 00:20:26', NULL),
(40, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-08 19:36:28', NULL),
(41, 'thonglt', '192.168.0.41', 'Mozilla/5.0 (Linux; U; Android 7.0; en-us; Redmi Note 4 Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/61.0.3163.128 Mobile Safari/537.36 XiaoMi/MiuiBrowser/10.8.3-g', 0, '2019-07-09 00:56:34', NULL),
(42, 'TidusLee', '192.168.0.41', 'Mozilla/5.0 (Linux; U; Android 7.0; en-us; Redmi Note 4 Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/61.0.3163.128 Mobile Safari/537.36 XiaoMi/MiuiBrowser/10.8.3-g', 1, '2019-07-09 00:56:53', NULL),
(43, 'ha.tb', '192.168.0.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1, '2019-07-09 01:06:00', NULL),
(44, 'TidusLee', '192.168.0.88', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1, '2019-07-09 01:39:59', NULL),
(45, 'tiduslee', '192.168.0.88', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-07-09 01:42:08', NULL),
(46, 'TidusLee', '192.168.0.88', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-09 01:42:17', NULL),
(47, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-10 23:54:35', NULL),
(48, 'ha.tb', '192.168.0.95', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1, '2019-07-11 19:47:44', NULL),
(49, 'thonglt', '192.168.0.88', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 0, '2019-07-15 20:52:32', NULL),
(50, 'thonglt', '192.168.0.88', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 0, '2019-07-15 20:52:41', NULL),
(51, 'ha.tb', '192.168.0.88', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 0, '2019-07-15 20:53:15', NULL),
(52, 'ha.tb', '192.168.0.88', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, '2019-07-15 20:53:37', NULL),
(53, 'ha.tb', '192.168.0.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1, '2019-07-15 20:53:48', NULL),
(54, 'ha.tb', '192.168.0.56', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, '2019-07-16 00:13:22', NULL),
(55, 'ha.tb', '192.168.0.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/75.0.3770.90 Chrome/75.0.3770.90 Safari/537.36', 1, '2019-07-16 01:52:19', NULL),
(56, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-16 02:08:27', NULL),
(57, 'ha.tb', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-16 18:54:51', NULL),
(58, 'ha.tb', '192.168.0.88', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-16 19:30:39', NULL),
(59, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-16 19:50:06', NULL),
(60, 'sutu9578', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-16 20:07:27', NULL),
(61, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-16 20:08:40', NULL),
(62, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-16 20:09:50', NULL),
(63, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-16 20:10:43', NULL),
(64, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-16 20:13:18', NULL),
(65, 'lntduong', '192.168.0.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/75.0.3770.90 Chrome/75.0.3770.90 Safari/537.36', 1, '2019-07-16 20:13:21', NULL),
(66, 'ha.tb', '192.168.0.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/75.0.3770.90 Chrome/75.0.3770.90 Safari/537.36', 1, '2019-07-16 20:13:35', NULL),
(67, 'lntduong', '192.168.0.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/75.0.3770.90 Chrome/75.0.3770.90 Safari/537.36', 1, '2019-07-16 20:14:41', NULL),
(68, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-16 20:15:29', NULL),
(69, 'ha.tb', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-17 00:33:17', NULL),
(70, 'ha.tb', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-17 02:56:08', NULL),
(71, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-17 18:05:36', NULL),
(72, 'lntduong', '192.168.0.92', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-07-17 20:47:57', NULL),
(73, 'lntduong', '192.168.0.92', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-07-17 20:48:09', NULL),
(74, 'duong.lnt', '192.168.0.92', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 0, '2019-07-17 20:48:34', NULL),
(75, 'lntduong', '192.168.0.92', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', 1, '2019-07-17 20:48:49', NULL),
(76, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-24 03:41:07', NULL),
(77, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-24 18:33:38', NULL),
(78, 'ha.tb', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-28 20:15:39', NULL),
(79, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-07-29 01:01:04', NULL),
(80, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-29 01:01:14', NULL),
(81, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-29 20:10:41', NULL),
(82, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-30 18:26:29', NULL),
(83, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-07-31 18:56:18', NULL),
(84, 'ha.tb', '192.168.0.88', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, '2019-07-31 21:10:02', NULL),
(85, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) snap Chromium/76.0.3809.87 Chrome/76.0.3809.87 Safari/537.36', 1, '2019-08-02 00:14:33', NULL),
(86, 'diem.gtn', '192.168.0.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/75.0.3770.90 Chrome/75.0.3770.90 Safari/537.36', 1, '2019-08-02 01:30:24', NULL),
(87, 'lntduong', '192.168.0.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/75.0.3770.90 Chrome/75.0.3770.90 Safari/537.36', 1, '2019-08-02 01:45:36', NULL),
(88, 'lntduong', '192.168.0.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/75.0.3770.90 Chrome/75.0.3770.90 Safari/537.36', 1, '2019-08-02 01:45:36', NULL),
(89, 'ha.tb', '192.168.0.92', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/75.0.3770.90 Chrome/75.0.3770.90 Safari/537.36', 1, '2019-08-02 01:45:52', NULL),
(90, 'diem-gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-04 21:02:09', NULL),
(91, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-04 21:02:25', NULL),
(92, 'ha.tb', '192.168.0.144', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', 1, '2019-08-04 21:57:33', NULL),
(93, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-05 21:39:34', NULL),
(94, 'ha.vvc', '192.168.0.56', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:54.0) Gecko/20100101 Firefox/54.0', 1, '2019-08-06 02:04:59', NULL),
(95, 'ha.vvc', '192.168.0.56', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:54.0) Gecko/20100101 Firefox/54.0', 1, '2019-08-06 02:07:17', NULL),
(96, 'diem-gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-06 18:25:24', NULL),
(97, 'diem-gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-06 18:25:31', NULL),
(98, 'diem-gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-06 18:25:39', NULL),
(99, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-06 18:25:49', NULL),
(100, 'diem.gtn', '192.168.0.84', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', 1, '2019-08-07 19:30:51', NULL),
(101, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-08 19:26:29', NULL),
(102, 'ha.tb', '192.168.0.70', 'Mozilla/5.0 (Linux; Android 9; SM-G960N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36', 1, '2019-08-08 19:45:37', NULL),
(103, 'trang.dtp', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 0, '2019-08-08 23:44:47', NULL),
(104, 'trang.dtp', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 0, '2019-08-08 23:45:07', NULL),
(105, 'trang.dtp', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 0, '2019-08-08 23:45:25', NULL),
(106, 'trang.dtp', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 0, '2019-08-08 23:52:38', NULL),
(107, 'sutu9578', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-08 23:55:45', NULL),
(108, 'sutu9578', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-08 23:55:57', NULL),
(109, 'sutu9578', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-08 23:59:40', NULL),
(110, 'sutu9578', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-08 23:59:48', NULL),
(111, 'diem.gtn', '192.168.0.44', 'Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36', 1, '2019-08-09 01:08:01', NULL),
(112, 'trang.dtp', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 0, '2019-08-11 18:42:54', NULL),
(113, 'trang.dtp', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 0, '2019-08-11 18:43:31', NULL),
(114, 'admin', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, '2019-08-11 18:43:54', NULL),
(115, 'trang.dtp', '192.168.0.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, '2019-08-11 18:44:50', NULL),
(116, 'trang.dtp', '192.168.0.56', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:54.0) Gecko/20100101 Firefox/54.0', 1, '2019-08-12 00:04:52', NULL),
(117, 'admin', '192.168.0.92', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-12 03:05:22', NULL),
(118, 'trang.dtp', '192.168.0.144', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, '2019-08-12 05:43:39', NULL),
(119, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-12 18:21:55', NULL),
(120, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-12 18:22:05', NULL),
(121, 'admin', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-12 19:34:53', NULL),
(122, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-13 19:35:24', NULL),
(123, 'ha.tb', '192.168.0.144', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, '2019-08-13 19:35:58', NULL),
(124, 'diem-gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-18 18:53:10', NULL),
(125, 'diem-gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-18 18:53:18', NULL),
(126, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-18 18:53:32', NULL),
(127, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-19 18:22:38', NULL),
(128, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-19 18:46:58', NULL),
(129, 'ha.tb', '192.168.0.67', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 0, '2019-08-20 02:23:36', NULL),
(130, 'ha.tb', '192.168.0.67', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36', 1, '2019-08-20 02:23:47', NULL),
(131, 'trang.dtp', '192.168.0.56', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:54.0) Gecko/20100101 Firefox/54.0', 1, '2019-08-20 19:18:43', NULL),
(132, 'sutu9570', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-20 19:22:24', NULL),
(133, 'admin', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-20 19:28:26', NULL),
(134, 'sutu9570', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-20 19:31:48', NULL),
(135, 'sutu9570', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-20 19:35:49', NULL),
(136, 'sutu9570', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-20 19:35:56', NULL),
(137, 'sutu9570', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 0, '2019-08-20 19:38:07', NULL),
(138, 'sutu9570', '192.168.0.124', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-20 19:38:16', NULL),
(139, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-21 01:22:46', NULL),
(140, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-21 20:27:27', NULL),
(141, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-22 01:40:18', NULL),
(142, 'diem.gtn', '192.168.0.112', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:68.0) Gecko/20100101 Firefox/68.0', 1, '2019-08-22 18:15:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `support_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `created_at`, `updated_at`, `user_id`, `deleted_at`, `url`, `support_url`, `support_phone`, `support_email`, `image`) VALUES
(1, 'Apple', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://apple.com', 'https://support.apple.com', '+1-328-617-0126', 'bayer.jaqueline@example.com', 'apple.jpg'),
(2, 'Microsoft', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://microsoft.com', 'https://support.microsoft.com', '1-574-559-7343 x2281', 'maggie.kovacek@example.net', 'microsoft.png'),
(3, 'Dell', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://dell.com', 'https://support.dell.com', '(280) 510-6152', 'imertz@example.com', 'dell.png'),
(4, 'Asus', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://asus.com', 'https://support.asus.com', '864-695-4846 x1966', 'wbergstrom@example.net', 'asus.png'),
(5, 'HP', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://hp.com', 'https://support.hp.com', '1-969-635-6175', 'preynolds@example.org', 'hp.png'),
(6, 'Lenovo', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://lenovo.com', 'https://support.lenovo.com', '(536) 648-4879 x5095', 'hellen03@example.net', 'lenovo.jpg'),
(7, 'LG', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://lg.com', 'https://support.lg.com', '+1-984-984-5485', 'sjast@example.org', 'lg.jpg'),
(8, 'Polycom', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://polycom.com', 'https://support.polycom.com', '903.836.3172 x7248', 'glover.erick@example.com', 'polycom.png'),
(9, 'Adobe', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://adobe.com', 'https://support.adobe.com', '+1-203-710-8799', 'west.odie@example.org', 'adobe.jpg'),
(10, 'Avery', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://avery.com', 'https://support.avery.com', '+1 (252) 796-0405', 'hackett.lafayette@example.org', 'avery.png'),
(11, 'Crucial', '2019-06-11 01:52:40', '2019-06-11 01:52:40', 1, NULL, 'https://crucial.com', 'https://support.crucial.com', '(240) 567-4361', 'rodrick27@example.net', 'crucial.jpg'),
(12, 'Dell 2018', '2019-08-12 02:43:47', '2019-08-12 02:43:47', 59, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2012_12_06_225921_migration_cartalyst_sentry_install_users', 1),
(2, '2012_12_06_225929_migration_cartalyst_sentry_install_groups', 1),
(3, '2012_12_06_225945_migration_cartalyst_sentry_install_users_groups_pivot', 1),
(4, '2012_12_06_225988_migration_cartalyst_sentry_install_throttle', 1),
(5, '2013_03_23_193214_update_users_table', 1),
(6, '2013_11_13_075318_create_models_table', 1),
(7, '2013_11_13_075335_create_categories_table', 1),
(8, '2013_11_13_075347_create_manufacturers_table', 1),
(9, '2013_11_15_015858_add_user_id_to_categories', 1),
(10, '2013_11_15_112701_add_user_id_to_manufacturers', 1),
(11, '2013_11_15_190327_create_assets_table', 1),
(12, '2013_11_15_190357_create_licenses_table', 1),
(13, '2013_11_15_201848_add_license_name_to_licenses', 1),
(14, '2013_11_16_040323_create_depreciations_table', 1),
(15, '2013_11_16_042851_add_depreciation_id_to_models', 1),
(16, '2013_11_16_084923_add_user_id_to_models', 1),
(17, '2013_11_16_103258_create_locations_table', 1),
(18, '2013_11_16_103336_add_location_id_to_assets', 1),
(19, '2013_11_16_103407_add_checkedout_to_to_assets', 1),
(20, '2013_11_16_103425_create_history_table', 1),
(21, '2013_11_17_054359_drop_licenses_table', 1),
(22, '2013_11_17_054526_add_physical_to_assets', 1),
(23, '2013_11_17_055126_create_settings_table', 1),
(24, '2013_11_17_062634_add_license_to_assets', 1),
(25, '2013_11_18_134332_add_contacts_to_users', 1),
(26, '2013_11_18_142847_add_info_to_locations', 1),
(27, '2013_11_18_152942_remove_location_id_from_asset', 1),
(28, '2013_11_18_164423_set_nullvalues_for_user', 1),
(29, '2013_11_19_013337_create_asset_logs_table', 1),
(30, '2013_11_19_061409_edit_added_on_asset_logs_table', 1),
(31, '2013_11_19_062250_edit_location_id_asset_logs_table', 1),
(32, '2013_11_20_055822_add_soft_delete_on_assets', 1),
(33, '2013_11_20_121404_add_soft_delete_on_locations', 1),
(34, '2013_11_20_123137_add_soft_delete_on_manufacturers', 1),
(35, '2013_11_20_123725_add_soft_delete_on_categories', 1),
(36, '2013_11_20_130248_create_status_labels', 1),
(37, '2013_11_20_130830_add_status_id_on_assets_table', 1),
(38, '2013_11_20_131544_add_status_type_on_status_labels', 1),
(39, '2013_11_20_134103_add_archived_to_assets', 1),
(40, '2013_11_21_002321_add_uploads_table', 1),
(41, '2013_11_21_024531_remove_deployable_boolean_from_status_labels', 1),
(42, '2013_11_22_075308_add_option_label_to_settings_table', 1),
(43, '2013_11_22_213400_edits_to_settings_table', 1),
(44, '2013_11_25_013244_create_licenses_table', 1),
(45, '2013_11_25_031458_create_license_seats_table', 1),
(46, '2013_11_25_032022_add_type_to_actionlog_table', 1),
(47, '2013_11_25_033008_delete_bad_licenses_table', 1),
(48, '2013_11_25_033131_create_new_licenses_table', 1),
(49, '2013_11_25_033534_add_licensed_to_licenses_table', 1),
(50, '2013_11_25_101308_add_warrantee_to_assets_table', 1),
(51, '2013_11_25_104343_alter_warranty_column_on_assets', 1),
(52, '2013_11_25_150450_drop_parent_from_categories', 1),
(53, '2013_11_25_151920_add_depreciate_to_assets', 1),
(54, '2013_11_25_152903_add_depreciate_to_licenses_table', 1),
(55, '2013_11_26_211820_drop_license_from_assets_table', 1),
(56, '2013_11_27_062510_add_note_to_asset_logs_table', 1),
(57, '2013_12_01_113426_add_filename_to_asset_log', 1),
(58, '2013_12_06_094618_add_nullable_to_licenses_table', 1),
(59, '2013_12_10_084038_add_eol_on_models_table', 1),
(60, '2013_12_12_055218_add_manager_to_users_table', 1),
(61, '2014_01_28_031200_add_qr_code_to_settings_table', 1),
(62, '2014_02_13_183016_add_qr_text_to_settings_table', 1),
(63, '2014_05_24_093839_alter_default_license_depreciation_id', 1),
(64, '2014_05_27_231658_alter_default_values_licenses', 1),
(65, '2014_06_19_191508_add_asset_name_to_settings', 1),
(66, '2014_06_20_004847_make_asset_log_checkedout_to_nullable', 1),
(67, '2014_06_20_005050_make_asset_log_purchasedate_to_nullable', 1),
(68, '2014_06_24_003011_add_suppliers', 1),
(69, '2014_06_24_010742_add_supplier_id_to_asset', 1),
(70, '2014_06_24_012839_add_zip_to_supplier', 1),
(71, '2014_06_24_033908_add_url_to_supplier', 1),
(72, '2014_07_08_054116_add_employee_id_to_users', 1),
(73, '2014_07_09_134316_add_requestable_to_assets', 1),
(74, '2014_07_17_085822_add_asset_to_software', 1),
(75, '2014_07_17_161625_make_asset_id_in_logs_nullable', 1),
(76, '2014_08_12_053504_alpha_0_4_2_release', 1),
(77, '2014_08_17_083523_make_location_id_nullable', 1),
(78, '2014_10_16_200626_add_rtd_location_to_assets', 1),
(79, '2014_10_24_000417_alter_supplier_state_to_32', 1),
(80, '2014_10_24_015641_add_display_checkout_date', 1),
(81, '2014_10_28_222654_add_avatar_field_to_users_table', 1),
(82, '2014_10_29_045924_add_image_field_to_models_table', 1),
(83, '2014_11_01_214955_add_eol_display_to_settings', 1),
(84, '2014_11_04_231416_update_group_field_for_reporting', 1),
(85, '2014_11_05_212408_add_fields_to_licenses', 1),
(86, '2014_11_07_021042_add_image_to_supplier', 1),
(87, '2014_11_20_203007_add_username_to_user', 1),
(88, '2014_11_20_223947_add_auto_to_settings', 1),
(89, '2014_11_20_224421_add_prefix_to_settings', 1),
(90, '2014_11_21_104401_change_licence_type', 1),
(91, '2014_12_09_082500_add_fields_maintained_term_to_licenses', 1),
(92, '2015_02_04_155757_increase_user_field_lengths', 1),
(93, '2015_02_07_013537_add_soft_deleted_to_log', 1),
(94, '2015_02_10_040958_fix_bad_assigned_to_ids', 1),
(95, '2015_02_10_053310_migrate_data_to_new_statuses', 1),
(96, '2015_02_11_044104_migrate_make_license_assigned_null', 1),
(97, '2015_02_11_104406_migrate_create_requests_table', 1),
(98, '2015_02_12_001312_add_mac_address_to_asset', 1),
(99, '2015_02_12_024100_change_license_notes_type', 1),
(100, '2015_02_17_231020_add_localonly_to_settings', 1),
(101, '2015_02_19_222322_add_logo_and_colors_to_settings', 1),
(102, '2015_02_24_072043_add_alerts_to_settings', 1),
(103, '2015_02_25_022931_add_eula_fields', 1),
(104, '2015_02_25_204513_add_accessories_table', 1),
(105, '2015_02_26_091228_add_accessories_user_table', 1),
(106, '2015_02_26_115128_add_deleted_at_models', 1),
(107, '2015_02_26_233005_add_category_type', 1),
(108, '2015_03_01_231912_update_accepted_at_to_acceptance_id', 1),
(109, '2015_03_05_011929_add_qr_type_to_settings', 1),
(110, '2015_03_18_055327_add_note_to_user', 1),
(111, '2015_04_29_234704_add_slack_to_settings', 1),
(112, '2015_05_04_085151_add_parent_id_to_locations_table', 1),
(113, '2015_05_22_124421_add_reassignable_to_licenses', 1),
(114, '2015_06_10_003314_fix_default_for_user_notes', 1),
(115, '2015_06_10_003554_create_consumables', 1),
(116, '2015_06_15_183253_move_email_to_username', 1),
(117, '2015_06_23_070346_make_email_nullable', 1),
(118, '2015_06_26_213716_create_asset_maintenances_table', 1),
(119, '2015_07_04_212443_create_custom_fields_table', 1),
(120, '2015_07_09_014359_add_currency_to_settings_and_locations', 1),
(121, '2015_07_21_122022_add_expected_checkin_date_to_asset_logs', 1),
(122, '2015_07_24_093845_add_checkin_email_to_category_table', 1),
(123, '2015_07_25_055415_remove_email_unique_constraint', 1),
(124, '2015_07_29_230054_add_thread_id_to_asset_logs_table', 1),
(125, '2015_07_31_015430_add_accepted_to_assets', 1),
(126, '2015_09_09_195301_add_custom_css_to_settings', 1),
(127, '2015_09_21_235926_create_custom_field_custom_fieldset', 1),
(128, '2015_09_22_000104_create_custom_fieldsets', 1),
(129, '2015_09_22_003321_add_fieldset_id_to_assets', 1),
(130, '2015_09_22_003413_migrate_mac_address', 1),
(131, '2015_09_28_003314_fix_default_purchase_order', 1),
(132, '2015_10_01_024551_add_accessory_consumable_price_info', 1),
(133, '2015_10_12_192706_add_brand_to_settings', 1),
(134, '2015_10_22_003314_fix_defaults_accessories', 1),
(135, '2015_10_23_182625_add_checkout_time_and_expected_checkout_date_to_assets', 1),
(136, '2015_11_05_061015_create_companies_table', 1),
(137, '2015_11_05_061115_add_company_id_to_consumables_table', 1),
(138, '2015_11_05_183749_image', 1),
(139, '2015_11_06_092038_add_company_id_to_accessories_table', 1),
(140, '2015_11_06_100045_add_company_id_to_users_table', 1),
(141, '2015_11_06_134742_add_company_id_to_licenses_table', 1),
(142, '2015_11_08_035832_add_company_id_to_assets_table', 1),
(143, '2015_11_08_222305_add_ldap_fields_to_settings', 1),
(144, '2015_11_15_151803_add_full_multiple_companies_support_to_settings_table', 1),
(145, '2015_11_26_195528_import_ldap_settings', 1),
(146, '2015_11_30_191504_remove_fk_company_id', 1),
(147, '2015_12_21_193006_add_ldap_server_cert_ignore_to_settings_table', 1),
(148, '2015_12_30_233509_add_timestamp_and_userId_to_custom_fields', 1),
(149, '2015_12_30_233658_add_timestamp_and_userId_to_custom_fieldsets', 1),
(150, '2016_01_28_041048_add_notes_to_models', 1),
(151, '2016_02_19_070119_add_remember_token_to_users_table', 1),
(152, '2016_02_19_073625_create_password_resets_table', 1),
(153, '2016_03_02_193043_add_ldap_flag_to_users', 1),
(154, '2016_03_02_220517_update_ldap_filter_to_longer_field', 1),
(155, '2016_03_08_225351_create_components_table', 1),
(156, '2016_03_09_024038_add_min_stock_to_tables', 1),
(157, '2016_03_10_133849_add_locale_to_users', 1),
(158, '2016_03_10_135519_add_locale_to_settings', 1),
(159, '2016_03_11_185621_add_label_settings_to_settings', 1),
(160, '2016_03_22_125911_fix_custom_fields_regexes', 1),
(161, '2016_04_28_141554_add_show_to_users', 1),
(162, '2016_05_16_164733_add_model_mfg_to_consumable', 1),
(163, '2016_05_19_180351_add_alt_barcode_settings', 1),
(164, '2016_05_19_191146_add_alter_interval', 1),
(165, '2016_05_19_192226_add_inventory_threshold', 1),
(166, '2016_05_20_024859_remove_option_keys_from_settings_table', 1),
(167, '2016_05_20_143758_remove_option_value_from_settings_table', 1),
(168, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(169, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(170, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(171, '2016_06_01_000004_create_oauth_clients_table', 1),
(172, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(173, '2016_06_01_140218_add_email_domain_and_format_to_settings', 1),
(174, '2016_06_22_160725_add_user_id_to_maintenances', 1),
(175, '2016_07_13_150015_add_is_ad_to_settings', 1),
(176, '2016_07_14_153609_add_ad_domain_to_settings', 1),
(177, '2016_07_22_003348_fix_custom_fields_regex_stuff', 1),
(178, '2016_07_22_054850_one_more_mac_addr_fix', 1),
(179, '2016_07_22_143045_add_port_to_ldap_settings', 1),
(180, '2016_07_22_153432_add_tls_to_ldap_settings', 1),
(181, '2016_07_27_211034_add_zerofill_to_settings', 1),
(182, '2016_08_02_124944_add_color_to_statuslabel', 1),
(183, '2016_08_04_134500_add_disallow_ldap_pw_sync_to_settings', 1),
(184, '2016_08_09_002225_add_manufacturer_to_licenses', 1),
(185, '2016_08_12_121613_add_manufacturer_to_accessories_table', 1),
(186, '2016_08_23_143353_add_new_fields_to_custom_fields', 1),
(187, '2016_08_23_145619_add_show_in_nav_to_status_labels', 1),
(188, '2016_08_30_084634_make_purchase_cost_nullable', 1),
(189, '2016_09_01_141051_add_requestable_to_asset_model', 1),
(190, '2016_09_02_001448_create_checkout_requests_table', 1),
(191, '2016_09_04_180400_create_actionlog_table', 1),
(192, '2016_09_04_182149_migrate_asset_log_to_action_log', 1),
(193, '2016_09_19_235935_fix_fieldtype_for_target_type', 1),
(194, '2016_09_23_140722_fix_modelno_in_consumables_to_string', 1),
(195, '2016_09_28_231359_add_company_to_logs', 1),
(196, '2016_10_14_130709_fix_order_number_to_varchar', 1),
(197, '2016_10_16_015024_rename_modelno_to_model_number', 1),
(198, '2016_10_16_015211_rename_consumable_modelno_to_model_number', 1),
(199, '2016_10_16_143235_rename_model_note_to_notes', 1),
(200, '2016_10_16_165052_rename_component_total_qty_to_qty', 1),
(201, '2016_10_19_145520_fix_order_number_in_components_to_string', 1),
(202, '2016_10_27_151715_add_serial_to_components', 1),
(203, '2016_10_27_213251_increase_serial_field_capacity', 1),
(204, '2016_10_29_002724_enable_2fa_fields', 1),
(205, '2016_10_29_082408_add_signature_to_acceptance', 1),
(206, '2016_11_01_030818_fix_forgotten_filename_in_action_logs', 1),
(207, '2016_11_13_020954_rename_component_serial_number_to_serial', 1),
(208, '2016_11_16_172119_increase_purchase_cost_size', 1),
(209, '2016_11_17_161317_longer_state_field_in_location', 1),
(210, '2016_11_17_193706_add_model_number_to_accessories', 1),
(211, '2016_11_24_160405_add_missing_target_type_to_logs_table', 1),
(212, '2016_12_07_173720_increase_size_of_state_in_suppliers', 1),
(213, '2016_12_19_004212_adjust_locale_length_to_10', 1),
(214, '2016_12_19_133936_extend_phone_lengths_in_supplier_and_elsewhere', 1),
(215, '2016_12_27_212631_make_asset_assigned_to_polymorphic', 1),
(216, '2017_01_09_040429_create_locations_ldap_query_field', 1),
(217, '2017_01_14_002418_create_imports_table', 1),
(218, '2017_01_25_063357_fix_utf8_custom_field_column_names', 1),
(219, '2017_03_03_154632_add_time_date_display_to_settings', 1),
(220, '2017_03_10_210807_add_fields_to_manufacturer', 1),
(221, '2017_05_08_195520_increase_size_of_field_values_in_custom_fields', 1),
(222, '2017_05_22_204422_create_departments', 1),
(223, '2017_05_22_233509_add_manager_to_locations_table', 1),
(224, '2017_06_14_122059_add_next_autoincrement_to_settings', 1),
(225, '2017_06_18_151753_add_header_and_first_row_to_importer_table', 1),
(226, '2017_07_07_191533_add_login_text', 1),
(227, '2017_07_25_130710_add_thumbsize_to_settings', 1),
(228, '2017_08_03_160105_set_asset_archived_to_zero_default', 1),
(229, '2017_08_22_180636_add_secure_password_options', 1),
(230, '2017_08_25_074822_add_auditing_tables', 1),
(231, '2017_08_25_101435_add_auditing_to_settings', 1),
(232, '2017_09_18_225619_fix_assigned_type_not_being_nulled', 1),
(233, '2017_10_03_015503_drop_foreign_keys', 1),
(234, '2017_10_10_123504_allow_nullable_depreciation_id_in_models', 1),
(235, '2017_10_17_133709_add_display_url_to_settings', 1),
(236, '2017_10_19_120002_add_custom_forgot_password_url', 1),
(237, '2017_10_19_130406_add_image_and_supplier_to_accessories', 1),
(238, '2017_10_20_234129_add_location_indices_to_assets', 1),
(239, '2017_10_25_202930_add_images_uploads_to_locations_manufacturers_etc', 1),
(240, '2017_10_27_180947_denorm_asset_locations', 1),
(241, '2017_10_27_192423_migrate_denormed_asset_locations', 1),
(242, '2017_10_30_182938_add_address_to_user', 1),
(243, '2017_11_08_025918_add_alert_menu_setting', 1),
(244, '2017_11_08_123942_labels_display_company_name', 1),
(245, '2017_12_12_010457_normalize_asset_last_audit_date', 1),
(246, '2017_12_12_033618_add_actionlog_meta', 1),
(247, '2017_12_26_170856_re_normalize_last_audit', 1),
(248, '2018_01_17_184354_add_archived_in_list_setting', 1),
(249, '2018_01_19_203121_add_dashboard_message_to_settings', 1),
(250, '2018_01_24_062633_add_footer_settings_to_settings', 1),
(251, '2018_01_24_093426_add_modellist_preferenc', 1),
(252, '2018_02_22_160436_add_remote_user_settings', 1),
(253, '2018_03_03_011032_add_theme_to_settings', 1),
(254, '2018_03_06_054937_add_default_flag_on_statuslabels', 1),
(255, '2018_03_23_212048_add_display_in_email_to_custom_fields', 1),
(256, '2018_03_24_030738_add_show_images_in_email_setting', 1),
(257, '2018_03_24_050108_add_cc_alerts', 1),
(258, '2018_03_29_053618_add_canceled_at_and_fulfilled_at_in_requests', 1),
(259, '2018_03_29_070121_add_drop_unique_requests', 1),
(260, '2018_03_29_070511_add_new_index_requestable', 1),
(261, '2018_04_02_150700_labels_display_model_name', 1),
(262, '2018_04_16_133902_create_custom_field_default_values_table', 1),
(263, '2018_05_04_073223_add_category_to_licenses', 1),
(264, '2018_05_04_075235_add_update_license_category', 1),
(265, '2018_05_08_031515_add_gdpr_privacy_footer', 1),
(266, '2018_05_14_215229_add_indexes', 1),
(267, '2018_05_14_223646_add_indexes_to_assets', 1),
(268, '2018_05_14_233638_denorm_counters_on_assets', 1),
(269, '2018_05_16_153409_add_first_counter_totals_to_assets', 1),
(270, '2018_06_21_134622_add_version_footer', 1),
(271, '2018_07_05_215440_add_unique_serial_option_to_settings', 1),
(272, '2018_07_17_005911_create_login_attempts_table', 1),
(273, '2018_07_24_154348_add_logo_to_print_assets', 1),
(274, '2019_02_14_154310_change_auto_increment_prefix_to_nullable', 1),
(275, '2019_02_16_143518_auto_increment_back_to_string', 1),
(276, '2019_02_20_234421_make_serial_nullable', 1),
(277, '2019_02_21_224703_make_fields_nullable_for_integrity', 1),
(278, '2019_06_26_030727_create_store', 2),
(279, '2019_06_18_031653_create_store_table', 3),
(280, '2019_06_18_034212_update_department_table', 3),
(281, '2019_06_18_043828_create_contract_assets_table', 3),
(282, '2019_06_24_015250_create_inventories', 3),
(283, '2019_06_24_015823_create_inventory_results', 3),
(284, '2019_06_28_042301_create_contracts_table', 3),
(285, '2019_07_05_081442_add_delete_column', 3),
(286, '2019_07_08_015025_modify_contact_id_1_column', 4),
(287, '2019_07_09_062125_billing_date_column', 5),
(288, '2019_07_09_063847_repair_inventory_result', 5),
(289, '2019_07_18_234145_edit_status_id_from_inventory_result', 6),
(290, '2019_07_12_023629_update_contracts_table', 7),
(291, '2019_07_19_024604_update_inventory_11-7', 8),
(292, '2019_08_06_090020_create_unique_contraint_contracts', 9),
(293, '2019_08_06_091051_create_unique_contraint_store', 9),
(294, '2019_08_09_044511_update_inventory_name', 10);

-- --------------------------------------------------------

--
-- Table structure for table `models`
--

CREATE TABLE `models` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `depreciation_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `eol` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_mac_address` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `fieldset_id` int(11) DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `requestable` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `models`
--

INSERT INTO `models` (`id`, `name`, `model_number`, `manufacturer_id`, `category_id`, `created_at`, `updated_at`, `depreciation_id`, `user_id`, `eol`, `image`, `deprecated_mac_address`, `deleted_at`, `fieldset_id`, `notes`, `requestable`) VALUES
(1, 'Macbook Pro 13\"', '5329910039426666', 1, 1, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 36, 'mbp.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(2, 'Macbook Air', '4556515987480784', 1, 1, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 36, 'macbookair.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(3, 'Surface', '4916173186608667', 2, 1, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 36, 'surface.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(4, 'XPS 13', '4485988828190449', 3, 1, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 36, 'xps.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(5, 'Spectre', '348580353471297', 5, 1, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 36, 'spectre.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(6, 'ZenBook UX310', '2380008416170016', 4, 1, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 36, 'zenbook.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(7, 'Yoga 910', '4024007117960640', 6, 1, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 36, 'yoga.png', 0, NULL, NULL, 'Created by demo seeder', 0),
(8, 'iMac Pro', '4532116569643110', 1, 2, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 24, 'imacpro.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(9, 'Lenovo Intel Core i5', '5400100828763758', 6, 2, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 24, 'lenovoi5.png', 0, NULL, NULL, 'Created by demo seeder', 0),
(10, 'OptiPlex', '5040 (MRR81)', 3, 2, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 24, 'optiplex.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(11, 'SoundStation 2', '2221913095371491', 8, 6, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 12, 'soundstation.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(12, 'Polycom CX3000 IP Conference Phone', '342695449122401', 8, 6, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 12, 'cx3000.png', 0, NULL, NULL, 'Created by demo seeder', 0),
(13, 'iPad Pro', '6011832093872968', 1, 3, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 12, 'ipad.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(14, 'Tab3', '4024007155828865', 6, 3, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 12, 'tab3.png', 0, NULL, NULL, 'Created by demo seeder', 0),
(15, 'iPhone 6s', '4716198503713', 1, 4, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 3, 1, 12, 'iphone6.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(16, 'iPhone 7', '4485688846059697', 1, 4, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 1, 1, 12, 'iphone7.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(17, 'Ultrafine 4k', '6011408587536425', 7, 5, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 2, 1, 12, 'ultrafine.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(18, 'Ultrasharp U2415', '6011471135264387', 3, 5, '2019-06-11 01:52:41', '2019-06-11 01:52:41', 2, 1, 12, 'ultrasharp.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(19, 'POS Marchine', NULL, 3, 16, '2019-07-17 21:17:09', '2019-07-17 21:37:24', NULL, NULL, 36, '19-pjpeg.jpeg', 0, NULL, NULL, NULL, 0),
(20, 'XPS 13', NULL, 3, 1, '2019-08-07 20:48:17', '2019-08-07 20:48:17', NULL, 59, NULL, NULL, 0, NULL, NULL, NULL, 0),
(21, 'Alienware', NULL, 3, 1, '2019-08-09 00:19:43', '2019-08-09 00:19:43', 2, 59, 24, 'alienjpeg.jpeg', 0, NULL, NULL, NULL, 0),
(22, 'Predator', NULL, 4, 1, '2019-08-12 02:06:05', '2019-08-12 02:06:05', NULL, 59, NULL, NULL, 0, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `models_custom_fields`
--

CREATE TABLE `models_custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_model_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `default_value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Snipe-IT Personal Access Client', 'aM8SD15qDixdDM5yOM7ItExBfLLgE5sifBPumUXI', 'http://localhost', 1, 0, 0, '2019-06-11 01:50:35', '2019-06-11 01:50:35'),
(2, NULL, 'Snipe-IT Password Grant Client', 'TbX69MiFhjuyX8jR5GqwskU6KaLGCqzlOMOLAkdY', 'http://localhost', 0, 1, 0, '2019-06-11 01:50:35', '2019-06-11 01:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-06-11 01:50:35', '2019-06-11 01:50:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requested_assets`
--

CREATE TABLE `requested_assets` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `accepted_at` datetime DEFAULT NULL,
  `denied_at` datetime DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE `requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `request_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `per_page` int(11) NOT NULL DEFAULT '20',
  `site_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Snipe IT Asset Management',
  `qr_code` int(11) DEFAULT NULL,
  `qr_text` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_asset_name` int(11) DEFAULT NULL,
  `display_checkout_date` int(11) DEFAULT NULL,
  `display_eol` int(11) DEFAULT NULL,
  `auto_increment_assets` int(11) NOT NULL DEFAULT '0',
  `auto_increment_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `load_remote` tinyint(1) NOT NULL DEFAULT '1',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alert_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alerts_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `default_eula_text` longtext COLLATE utf8mb4_unicode_ci,
  `barcode_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'QRCODE',
  `slack_endpoint` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_channel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slack_botname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_currency` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_css` text COLLATE utf8mb4_unicode_ci,
  `brand` tinyint(4) NOT NULL DEFAULT '1',
  `ldap_enabled` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_server` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_uname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_pword` longtext COLLATE utf8mb4_unicode_ci,
  `ldap_basedn` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_filter` text COLLATE utf8mb4_unicode_ci,
  `ldap_username_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'samaccountname',
  `ldap_lname_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'sn',
  `ldap_fname_field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'givenname',
  `ldap_auth_filter_query` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'uid=samaccountname',
  `ldap_version` int(11) DEFAULT '3',
  `ldap_active_flag` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_emp_num` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_multiple_companies_support` tinyint(1) NOT NULL DEFAULT '0',
  `ldap_server_cert_ignore` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `labels_per_page` tinyint(4) NOT NULL DEFAULT '30',
  `labels_width` decimal(6,5) NOT NULL DEFAULT '2.62500',
  `labels_height` decimal(6,5) NOT NULL DEFAULT '1.00000',
  `labels_pmargin_left` decimal(6,5) NOT NULL DEFAULT '0.21975',
  `labels_pmargin_right` decimal(6,5) NOT NULL DEFAULT '0.21975',
  `labels_pmargin_top` decimal(6,5) NOT NULL DEFAULT '0.50000',
  `labels_pmargin_bottom` decimal(6,5) NOT NULL DEFAULT '0.50000',
  `labels_display_bgutter` decimal(6,5) NOT NULL DEFAULT '0.07000',
  `labels_display_sgutter` decimal(6,5) NOT NULL DEFAULT '0.05000',
  `labels_fontsize` tinyint(4) NOT NULL DEFAULT '9',
  `labels_pagewidth` decimal(7,5) NOT NULL DEFAULT '8.50000',
  `labels_pageheight` decimal(7,5) NOT NULL DEFAULT '11.00000',
  `labels_display_name` tinyint(4) NOT NULL DEFAULT '0',
  `labels_display_serial` tinyint(4) NOT NULL DEFAULT '1',
  `labels_display_tag` tinyint(4) NOT NULL DEFAULT '1',
  `alt_barcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `alt_barcode_enabled` tinyint(1) DEFAULT '1',
  `alert_interval` int(11) DEFAULT '30',
  `alert_threshold` int(11) DEFAULT '5',
  `email_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'filastname',
  `username_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'filastname',
  `is_ad` tinyint(1) NOT NULL DEFAULT '0',
  `ad_domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ldap_port` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '389',
  `ldap_tls` tinyint(1) NOT NULL DEFAULT '0',
  `zerofill_count` int(11) NOT NULL DEFAULT '5',
  `ldap_pw_sync` tinyint(1) NOT NULL DEFAULT '1',
  `two_factor_enabled` tinyint(4) DEFAULT NULL,
  `require_accept_signature` tinyint(1) NOT NULL DEFAULT '0',
  `date_display_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y-m-d',
  `time_display_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'h:i A',
  `next_auto_tag_base` bigint(20) NOT NULL DEFAULT '1',
  `login_note` text COLLATE utf8mb4_unicode_ci,
  `thumbnail_max_h` int(11) DEFAULT '50',
  `pwd_secure_uncommon` tinyint(1) NOT NULL DEFAULT '0',
  `pwd_secure_complexity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwd_secure_min` int(11) NOT NULL DEFAULT '8',
  `audit_interval` int(11) DEFAULT NULL,
  `audit_warning_days` int(11) DEFAULT NULL,
  `show_url_in_emails` tinyint(1) NOT NULL DEFAULT '0',
  `custom_forgot_pass_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_alerts_in_menu` tinyint(1) NOT NULL DEFAULT '1',
  `labels_display_company_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_archived_in_list` tinyint(1) NOT NULL DEFAULT '0',
  `dashboard_message` text COLLATE utf8mb4_unicode_ci,
  `support_footer` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `modellist_displays` char(191) COLLATE utf8mb4_unicode_ci DEFAULT 'image,category,manufacturer,model_number',
  `login_remote_user_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `login_common_disabled` tinyint(1) NOT NULL DEFAULT '0',
  `login_remote_user_custom_logout_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `skin` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_images_in_email` tinyint(1) NOT NULL DEFAULT '1',
  `admin_cc_email` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `labels_display_model` tinyint(1) NOT NULL DEFAULT '0',
  `privacy_policy_link` char(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version_footer` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'on',
  `unique_serial` tinyint(1) NOT NULL DEFAULT '0',
  `logo_print_assets` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `user_id`, `per_page`, `site_name`, `qr_code`, `qr_text`, `display_asset_name`, `display_checkout_date`, `display_eol`, `auto_increment_assets`, `auto_increment_prefix`, `load_remote`, `logo`, `header_color`, `alert_email`, `alerts_enabled`, `default_eula_text`, `barcode_type`, `slack_endpoint`, `slack_channel`, `slack_botname`, `default_currency`, `custom_css`, `brand`, `ldap_enabled`, `ldap_server`, `ldap_uname`, `ldap_pword`, `ldap_basedn`, `ldap_filter`, `ldap_username_field`, `ldap_lname_field`, `ldap_fname_field`, `ldap_auth_filter_query`, `ldap_version`, `ldap_active_flag`, `ldap_emp_num`, `ldap_email`, `full_multiple_companies_support`, `ldap_server_cert_ignore`, `locale`, `labels_per_page`, `labels_width`, `labels_height`, `labels_pmargin_left`, `labels_pmargin_right`, `labels_pmargin_top`, `labels_pmargin_bottom`, `labels_display_bgutter`, `labels_display_sgutter`, `labels_fontsize`, `labels_pagewidth`, `labels_pageheight`, `labels_display_name`, `labels_display_serial`, `labels_display_tag`, `alt_barcode`, `alt_barcode_enabled`, `alert_interval`, `alert_threshold`, `email_domain`, `email_format`, `username_format`, `is_ad`, `ad_domain`, `ldap_port`, `ldap_tls`, `zerofill_count`, `ldap_pw_sync`, `two_factor_enabled`, `require_accept_signature`, `date_display_format`, `time_display_format`, `next_auto_tag_base`, `login_note`, `thumbnail_max_h`, `pwd_secure_uncommon`, `pwd_secure_complexity`, `pwd_secure_min`, `audit_interval`, `audit_warning_days`, `show_url_in_emails`, `custom_forgot_pass_url`, `show_alerts_in_menu`, `labels_display_company_name`, `show_archived_in_list`, `dashboard_message`, `support_footer`, `footer_text`, `modellist_displays`, `login_remote_user_enabled`, `login_common_disabled`, `login_remote_user_custom_logout_url`, `skin`, `show_images_in_email`, `admin_cc_email`, `labels_display_model`, `privacy_policy_link`, `version_footer`, `unique_serial`, `logo_print_assets`) VALUES
(1, '2019-06-11 01:51:23', '2019-08-18 18:35:49', 1, 20, '資産管理', 1, NULL, NULL, NULL, NULL, 0, 'vvc://', 1, 'logo.png', 'rgba(0,125,255,0.74)', 'ha.tb@vn.vinx.asia', 1, NULL, 'QRCODE', NULL, NULL, NULL, 'USD', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'samaccountname', 'sn', 'givenname', 'uid=samaccountname', 3, NULL, NULL, NULL, 1, 0, 'en-GB', 30, '2.62500', '1.00000', '0.21975', '0.21975', '0.50000', '0.50000', '0.07000', '0.05000', 9, '8.50000', '11.00000', 0, 1, 1, 'C128', 1, 30, 5, 'vn.vinx.asia', 'filastname', 'filastname', 0, NULL, '389', 0, 5, 1, NULL, 1, 'Y-m-d', 'g:iA', 1404, NULL, 50, 0, NULL, 10, NULL, NULL, 0, NULL, 1, 0, 0, NULL, 'off', NULL, 'image,category,manufacturer,model_number', 0, 0, '', NULL, 1, NULL, 0, NULL, 'off', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `status_labels`
--

CREATE TABLE `status_labels` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deployable` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `default_label` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_labels`
--

INSERT INTO `status_labels` (`id`, `name`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `deployable`, `pending`, `archived`, `notes`, `color`, `show_in_nav`, `default_label`) VALUES
(1, 'Ready to Deploy', 1, '2006-11-09 15:16:57', '1978-11-13 00:40:34', NULL, 1, 0, 0, 'Consequatur aut velit eum porro qui expedita aspernatur.', NULL, 0, 1),
(2, 'Pending', 1, '2002-09-15 00:32:36', '2019-02-15 01:06:55', NULL, 0, 1, 0, 'Odio inventore ullam perferendis.', NULL, 0, 1),
(3, 'Archived', 1, '1995-09-17 09:17:59', '1988-08-03 23:35:41', NULL, 0, 0, 1, 'These assets are permanently undeployable', NULL, 0, 0),
(4, 'Out for Diagnostics', 1, '2017-05-02 14:58:52', '2005-08-06 13:57:17', NULL, 0, 0, 0, '', NULL, 0, 0),
(5, 'Out for Repair', 1, '1979-04-25 17:08:07', '1999-09-28 03:41:02', NULL, 0, 0, 0, '', NULL, 0, 0),
(6, 'Broken - Not Fixable', 1, '1971-05-21 14:38:17', '2009-04-07 14:34:14', NULL, 0, 0, 0, '', NULL, 0, 0),
(7, 'Lost/Stolen', 1, '1994-06-23 15:43:19', '1975-08-20 10:46:22', NULL, 0, 0, 0, '', NULL, 0, 0),
(8, 'Ready to Deploy Deployed', NULL, '2019-08-07 20:20:57', '2019-08-07 20:20:57', NULL, 1, 0, 0, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`id`, `company_id`, `name`, `location_id`, `image`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 'Wintheiser', 1, 'zKPfjsMWn18ugezQKU1R0EcNk.jpg', 59, '2019-07-05 01:52:19', '2019-07-16 02:19:55', NULL),
(2, 5, 'Vinx', 11, NULL, 59, '2019-07-05 02:19:43', '2019-07-08 01:55:59', NULL),
(3, 2, '!!!!!!!!!', 5, NULL, 59, '2019-07-05 02:36:19', '2019-07-05 02:36:19', NULL),
(4, 5, 'Store_1', NULL, NULL, 59, '2019-07-05 02:37:54', '2019-07-08 00:20:41', '2019-07-08 00:20:41'),
(5, 5, 'cd', NULL, NULL, 59, '2019-07-08 02:02:02', '2019-07-16 20:08:13', '2019-07-16 20:08:13'),
(6, 4, 'Việt Nam', 10, NULL, 59, '2019-07-08 02:02:55', '2019-07-08 02:02:55', NULL),
(7, 5, 'Việt Nam', 10, NULL, 59, '2019-07-08 02:03:08', '2019-08-22 18:42:08', '2019-08-22 18:42:08'),
(8, 5, 'Store1', 1, NULL, 59, '2019-07-08 20:39:04', '2019-07-08 20:48:52', '2019-07-08 20:48:52'),
(9, 5, 'Store fruit', 11, 'Zcph9ocnkdN7mbBDgpQNcBhQy.jpeg', 59, '2019-07-16 02:18:40', '2019-07-16 20:08:56', NULL),
(10, 5, 'Store flower', 5, 'ZWWvCse8Ib86VN5SdxC4LITdX.jpeg', 59, '2019-07-16 19:27:30', '2019-07-16 19:27:30', NULL),
(11, 5, 'Store Cri', NULL, NULL, 63, '2019-07-16 20:09:58', '2019-07-16 21:07:38', NULL),
(12, 5, 'store cake', NULL, 'Xv0e2B1TPrxRhPLEKUfyasgjw.jpg', 64, '2019-07-16 20:46:20', '2019-07-16 21:54:52', NULL),
(13, 5, 'store_test_edit', 8, 'TuC0oMXIOGiAD3LNnuzHKEobx.jpg', 64, '2019-07-16 21:50:28', '2019-07-16 21:54:00', '2019-07-16 21:54:00'),
(14, 5, 'store cake 99', NULL, NULL, 59, '2019-07-17 03:12:45', '2019-07-17 03:12:45', NULL),
(15, 5, 'bookstore', 11, 'LtXbE6cElRallssywk8qsDBOE.jpeg', 64, '2019-07-17 18:18:22', '2019-07-17 18:20:07', NULL),
(16, 5, 'VVC Phổ Quang', 11, '8afhcC9XCSKpkOVRSIPK5ofME.jpg', 59, '2019-07-17 21:07:14', '2019-07-17 21:08:59', NULL),
(17, 6, 'Aeon Mall Binh Duong', 12, 'jU92Lw9QVhrnZVNab6pznBWni.jpeg', 59, '2019-07-17 21:22:11', '2019-07-17 21:22:11', NULL),
(18, 5, 'store Phổ Quang', NULL, 'yzKFhkkpDG27e1IxOJdXFPwOb.jpg', 64, '2019-07-30 02:28:18', '2019-07-30 02:30:41', NULL),
(19, 5, 'store Cộng Hòa', 15, NULL, 64, '2019-07-30 02:32:19', '2019-08-13 23:33:55', NULL),
(20, 5, 'store Phan Văn Trị', 11, 'vg2MHNs0rHllwhehFJs2hnVf4.jpg', 64, '2019-07-31 19:02:18', '2019-07-31 19:03:11', NULL),
(21, 4, 'store Phổ Quang', 11, NULL, 64, '2019-07-31 19:04:24', '2019-07-31 19:05:04', '2019-07-31 19:05:04'),
(22, 5, 'HT Store', 12, NULL, 59, '2019-08-05 02:41:39', '2019-08-05 02:41:39', NULL),
(23, 7, 'ông già số 1', 13, NULL, 59, '2019-08-09 01:13:58', '2019-08-09 01:13:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `address`, `address2`, `city`, `state`, `country`, `phone`, `fax`, `email`, `contact`, `notes`, `created_at`, `updated_at`, `user_id`, `deleted_at`, `zip`, `url`, `image`) VALUES
(1, 'Keebler Group', '7063 Kohler Cliffs Apt. 305', 'Apt. 555', 'Veronaville', 'MI', 'YT', '1-750-682-8487', '225.985.6667 x983', 'edwin41@example.net', 'Lois Murphy', 'Ullam laudantium occaecati sed voluptatum dolor est. Tempora sint laborum quos ex. In nihil harum et pariatur at culpa quibusdam molestias.', '2019-06-11 01:52:41', '2019-06-11 01:52:41', NULL, NULL, '16922-8843', 'https://homenick.com/explicabo-officia-voluptas-pariatur-aut-dicta-velit.html', NULL),
(2, 'Labadie, Bernier and Streich', '9876 Wintheiser Prairie Suite 375', 'Apt. 931', 'Carlottaburgh', 'PA', 'IQ', '615-950-7340 x903', '431-306-2784', 'cremin.casandra@example.net', 'Miss Bernice Bartell I', 'Distinctio harum ex voluptatem quaerat. At est dolor soluta eum soluta. Blanditiis ipsam sed debitis asperiores. Rerum laboriosam alias voluptatem consequatur aut voluptas dolore.', '2019-06-11 01:52:41', '2019-06-11 01:52:41', NULL, NULL, '30326', 'https://www.runte.com/amet-molestiae-nihil-aut-impedit-quis-nobis-voluptatem', NULL),
(3, 'Corwin Inc', '7969 Terrill Avenue Suite 742', 'Apt. 564', 'Port Melbaland', 'OR', 'MC', '1-409-480-1121', '+14349918018', 'bahringer.rose@example.net', 'Minerva Aufderhar', 'Id voluptatem repellat dicta quasi voluptates rem. Dicta iure ipsum reiciendis occaecati eligendi. Corporis ea id repellendus rerum dolorem a consequatur.', '2019-06-11 01:52:41', '2019-06-11 01:52:41', NULL, NULL, '74064-9866', 'https://www.bergnaum.net/qui-perspiciatis-explicabo-enim-debitis-est-provident', NULL),
(4, 'Schoen-Wolff', '9031 Feeney Views Apt. 469', 'Apt. 893', 'South Maxwellland', 'AR', 'MS', '(385) 724-2600', '+1 (712) 883-0831', 'rowe.elyssa@example.com', 'Prof. Stefanie Ryan DDS', 'At sint error laborum rerum et ea qui. Neque eveniet culpa sit officia quasi officiis. Sint dolorum animi voluptas iste sed ipsum repellendus cum.', '2019-06-11 01:52:41', '2019-06-11 01:52:41', NULL, NULL, '13267-7681', 'http://durgan.com/porro-enim-qui-a-sit-doloremque-tempore-totam', NULL),
(5, 'Thompson, Huel and Kuphal', '37134 Hodkiewicz Cliff', 'Apt. 785', 'Sanfordchester', 'NY', 'BV', '889.799.5027 x14678', '(543) 515-6862', 'adolphus.kohler@example.net', 'Cesar McGlynn MD', 'Quia accusantium ex ratione dolor facere voluptatem et. Eos veniam laboriosam quibusdam libero.', '2019-06-11 01:52:41', '2019-06-11 01:52:41', NULL, NULL, '51325', 'http://wyman.com/deserunt-consequatur-voluptatem-delectus-non-cupiditate-ut-maxime', NULL),
(6, 'Phong Vu', 'Tầng 7, 198 Nguyễn Thị Minh Khai, Phường 6, Quận 3', NULL, 'Ho Chi Minh City', NULL, 'VN', '111-111-111', '111-111-111', 'cskh@phongvu.vn', 'Phong Vu Computer', NULL, '2019-08-09 00:09:58', '2019-08-09 00:14:19', 59, NULL, NULL, 'https://phongvu.vn/', 'yF9s14g1bqx36RtvMAIK1R5Ht.png');

-- --------------------------------------------------------

--
-- Table structure for table `throttle`
--

CREATE TABLE `throttle` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `banned_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gravatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobtitle` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `employee_num` text COLLATE utf8mb4_unicode_ci,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` text COLLATE utf8mb4_unicode_ci,
  `ldap_import` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'en',
  `show_in_list` tinyint(1) NOT NULL DEFAULT '1',
  `two_factor_secret` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_enrolled` tinyint(1) NOT NULL DEFAULT '0',
  `two_factor_optin` tinyint(1) NOT NULL DEFAULT '0',
  `department_id` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `permissions`, `activated`, `activation_code`, `activated_at`, `last_login`, `persist_code`, `reset_password_code`, `first_name`, `last_name`, `created_at`, `updated_at`, `deleted_at`, `website`, `country`, `gravatar`, `location_id`, `phone`, `jobtitle`, `manager_id`, `employee_num`, `avatar`, `username`, `notes`, `company_id`, `remember_token`, `ldap_import`, `locale`, `show_in_list`, `two_factor_secret`, `two_factor_enrolled`, `two_factor_optin`, `department_id`, `address`, `city`, `state`, `zip`) VALUES
(1, 'danyka92@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"superuser\":\"1\"}', 1, NULL, NULL, '2019-08-20 19:28:26', NULL, NULL, 'Admin', 'User', '2019-06-11 01:52:40', '2019-08-20 19:28:26', NULL, NULL, 'New Caledonia', NULL, 1, '221-435-4375', 'Farm and Home Management Advisor', NULL, '5399', 'admin-user.jpg', 'admin', 'Created by DB seeder', 2, 'NxdTre994rRrfPcwr4AucdB4M7197BQzNHVygvqplcQxpTQSaCFNBkuhHBiK', 0, 'en', 1, NULL, 0, 0, 3, '90538 Kirlin Springs Apt. 160\nElainaland, KS 58378-4997', 'West Kirstenville', 'IL', '26290-3701'),
(2, 'snipe@snipe.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"superuser\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Snipe E.', 'Head', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Armenia', NULL, 4, '+1 (347) 476-2377', 'Battery Repairer', NULL, '14897', NULL, 'snipe', 'Created by DB seeder', 3, NULL, 0, 'ug_CN', 1, NULL, 0, 0, 6, '173 Audra Glens\nLake Clara, CO 19450-1212', 'Nametown', 'DE', '00447'),
(3, 'ernest57@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"superuser\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Oral', 'Green', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Jordan', NULL, 1, '736-731-2156 x80240', 'Plumber OR Pipefitter OR Steamfitter', NULL, '15980', NULL, 'eichmann.mylene', 'Created by DB seeder', 4, NULL, 0, 'bo_CN', 1, NULL, 0, 0, 1, '743 Nikolaus Land\nMarcellaview, NE 24446', 'Port Zoey', 'SC', '51514-9253'),
(4, 'leola.casper@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"superuser\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Peter', 'Denesik', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Lithuania', NULL, 2, '894.836.8155 x91127', 'Well and Core Drill Operator', NULL, '30563', NULL, 'trinity09', 'Created by DB seeder', 3, NULL, 0, 'sid_ET', 1, NULL, 0, 0, 5, '96139 Jennings Track\nLake Melisamouth, NV 57347', 'Port Tito', 'IN', '86933'),
(5, 'gblick@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"superuser\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Scarlett', 'Gottlieb', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Kazakhstan', NULL, 4, '(216) 701-0127', 'Tank Car', NULL, '14399', NULL, 'obradtke', 'Created by DB seeder', 4, NULL, 0, 'st_ZA', 1, NULL, 0, 0, 4, '80271 Erik Skyway Apt. 106\nNorth Kip, MS 53460-9377', 'Reginaldberg', 'ID', '96105'),
(6, 'ward.estefania@example.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"admin\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Hadley', 'Denesik', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Bahamas', NULL, 2, '(585) 950-7960 x18548', 'Grinder OR Polisher', 1, '28781', NULL, 'considine.winston', 'Created by DB seeder', 1, NULL, 0, 'nso_ZA', 1, NULL, 0, 0, 6, '80450 Kling Wells\nFrederiqueside, MT 37829-3614', 'North Anselhaven', 'WV', '58010-1240'),
(7, 'stewart31@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"admin\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Gordon', 'Champlin', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Brunei Darussalam', NULL, 2, '(938) 373-0197', 'Electrical Engineer', 2, '12306', NULL, 'kkautzer', 'Created by DB seeder', 1, NULL, 0, 'bs_BA', 1, NULL, 0, 0, 6, '4255 Frami Pike\nKautzerborough, ND 36618-8557', 'Lake Micheleport', 'VA', '10819'),
(8, 'darwin.murphy@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"admin\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Jabari', 'Stoltenberg', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Serbia', NULL, 2, '347.460.6923 x67286', 'Health Services Manager', 2, '23641', NULL, 'watsica.leopoldo', 'Created by DB seeder', 3, NULL, 0, 'en_VI', 1, NULL, 0, 0, 6, '491 Davonte Ridge Suite 591\nPort Imaniberg, MT 26731', 'O\'Connerside', 'IL', '03072-6782'),
(9, 'jeanie.feest@example.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Cleve', 'Vandervort', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Guernsey', NULL, 2, '(272) 601-0270', 'Buffing and Polishing Operator', NULL, '21227', NULL, 'ymohr', 'Created by DB seeder', 1, NULL, 0, 'es_DO', 1, NULL, 0, 0, 2, '96293 Ernestina Isle Suite 467\nSanfordberg, MS 51346', 'Codyberg', 'NM', '33263'),
(10, 'rowena.bailey@example.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Kara', 'Hoeger', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Aruba', NULL, 4, '343.519.8055 x297', 'Marketing Manager', NULL, '20797', NULL, 'otorp', 'Created by DB seeder', 4, NULL, 0, 'syr_SY', 1, NULL, 0, 0, 5, '958 Nathan Point Apt. 534\nMaudechester, CO 09849-6650', 'Beattyborough', 'TN', '63497'),
(11, 'murphy.henriette@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Noelia', 'Zieme', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Cyprus', NULL, 4, '1-748-262-0197 x994', 'Coaches and Scout', NULL, '25092', NULL, 'dhackett', 'Created by DB seeder', 1, NULL, 0, 'zh_SG', 1, NULL, 0, 0, 2, '339 Lucius Oval\nOrnberg, NJ 90209-3102', 'New Piercemouth', 'CO', '02258-2508'),
(12, 'lind.nathanael@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Duane', 'Goldner', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Luxembourg', NULL, 4, '(863) 700-5111', 'Plating Operator', NULL, '25420', NULL, 'kaleb.mertz', 'Created by DB seeder', 4, NULL, 0, 'hr_HR', 1, NULL, 0, 0, 1, '904 O\'Connell Ford Suite 713\nNorth Edwardochester, AR 75153-9727', 'North Raquel', 'SD', '73872-8122'),
(13, 'merritt.brakus@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Virginia', 'Abshire', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Burundi', NULL, 3, '720-747-1660 x584', 'Stationary Engineer', NULL, '7144', NULL, 'myron.turcotte', 'Created by DB seeder', 1, NULL, 0, 'nl_BE', 1, NULL, 0, 0, 5, '500 Spencer Highway\nErlingmouth, ID 12128-9920', 'Nienowton', 'MA', '02367-4346'),
(14, 'jaida10@example.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Shawn', 'Yost', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Canada', NULL, 1, '1-228-845-4461 x5367', 'Computer-Controlled Machine Tool Operator', NULL, '21645', NULL, 'jamil68', 'Created by DB seeder', 2, NULL, 0, 'en_MT', 1, NULL, 0, 0, 4, '6596 Swaniawski Dale Suite 759\nVivianestad, NH 96740-0636', 'New Wilmafurt', 'GA', '84503'),
(15, 'jordy56@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Raphael', 'Brakus', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Niue', NULL, 1, '515.724.3316 x479', 'Medical Transcriptionist', NULL, '13164', NULL, 'savanna.fadel', 'Created by DB seeder', 1, NULL, 0, 'en_UM', 1, NULL, 0, 0, 6, '977 Timmothy Dam\nLake Nolanville, ID 22840-3267', 'Kiehnfurt', 'ND', '10146-6481'),
(16, 'douglas.rosario@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Murphy', 'Crist', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'United States Virgin Islands', NULL, 2, '564.310.9912 x70593', 'Soldering Machine Setter', NULL, '6464', NULL, 'iroob', 'Created by DB seeder', 2, NULL, 0, 'ku_IR', 1, NULL, 0, 0, 1, '41935 Danial Unions Suite 635\nConnmouth, LA 35196-4571', 'Borerburgh', 'AL', '25842-1618'),
(17, 'rollin97@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Macie', 'Von', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Nauru', NULL, 5, '1-950-846-4230 x69391', 'Coating Machine Operator', NULL, '34621', NULL, 'ogerlach', 'Created by DB seeder', 2, NULL, 0, 'gv_GB', 1, NULL, 0, 0, 4, '91859 Pfeffer Track Suite 508\nLake Jacklyn, DC 17743', 'Strackeport', 'FL', '51179'),
(18, 'jaiden10@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Maxime', 'Nicolas', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Romania', NULL, 1, '781-651-1970 x215', 'Postmasters', NULL, '9427', NULL, 'watson.mcclure', 'Created by DB seeder', 4, NULL, 0, 'en_PK', 1, NULL, 0, 0, 3, '7359 Turner Land\nGorczanymouth, SD 60500-1429', 'Port Vilmamouth', 'SD', '64615'),
(19, 'loberbrunner@example.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Molly', 'Murray', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Kiribati', NULL, 2, '439.554.2117', 'Child Care', NULL, '3729', NULL, 'rwyman', 'Created by DB seeder', 4, NULL, 0, 'es_BO', 1, NULL, 0, 0, 4, '21519 Kayden Unions Suite 874\nBartellport, CO 50793-4037', 'Earlinetown', 'NH', '98891'),
(20, 'bogan.brionna@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Rahsaan', 'Predovic', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Falkland Islands (Malvinas)', NULL, 5, '1-629-721-0058 x19366', 'Electrical and Electronics Drafter', NULL, '13139', NULL, 'esawayn', 'Created by DB seeder', 4, NULL, 0, 'bn_BD', 1, NULL, 0, 0, 3, '53729 Janis Flats Suite 520\nStarktown, WA 41962-3870', 'North Hoythaven', 'MT', '76367-0938'),
(21, 'fhills@example.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Valentin', 'Herzog', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Hungary', NULL, 2, '372-330-8532 x249', 'Office Machine and Cash Register Servicer', NULL, '11080', NULL, 'lauriane86', 'Created by DB seeder', 3, NULL, 0, 'es_HN', 1, NULL, 0, 0, 4, '34179 Mitchell Locks Apt. 369\nNew Horacechester, WI 51938', 'Port Kellenstad', 'NE', '86507'),
(22, 'mraz.ambrose@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Jan', 'Rutherford', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Gabon', NULL, 2, '1-667-993-5090', 'Ship Engineer', NULL, '5545', NULL, 'ethel12', 'Created by DB seeder', 2, NULL, 0, 'om_ET', 1, NULL, 0, 0, 3, '925 Estelle Mountains\nLake Kittystad, OH 52586', 'West Hendersonmouth', 'NY', '94987-2158'),
(23, 'hamill.carissa@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Emile', 'Russel', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Guinea', NULL, 1, '317-941-8542', 'Medical Equipment Preparer', NULL, '10630', NULL, 'ruthe28', 'Created by DB seeder', 1, NULL, 0, 'gsw_CH', 1, NULL, 0, 0, 3, '235 Kilback Ferry\nWainoton, KY 60891-1718', 'South Jaylanbury', 'VT', '55552-4965'),
(24, 'wendell.breitenberg@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Yvette', 'Satterfield', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Tokelau', NULL, 4, '262.229.5113', 'Interpreter OR Translator', NULL, '13793', NULL, 'marty45', 'Created by DB seeder', 3, NULL, 0, 'th_TH', 1, NULL, 0, 0, 5, '56294 Will Greens\nGrimesport, IN 45389-6063', 'Kaciefurt', 'MI', '83910-1528'),
(25, 'farrell.rossie@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Willard', 'Sauer', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Romania', NULL, 4, '585-414-3417', 'Foundry Mold and Coremaker', NULL, '16292', NULL, 'bode.abbie', 'Created by DB seeder', 4, NULL, 0, 'kcg_NG', 1, NULL, 0, 0, 5, '96918 Camron Overpass\nPort Hilton, TX 70858', 'Hillsbury', 'WY', '77557-6717'),
(26, 'mueller.beatrice@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Mario', 'Walker', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'United States Virgin Islands', NULL, 4, '470-835-7193', 'Political Science Teacher', NULL, '30926', NULL, 'sterling63', 'Created by DB seeder', 4, NULL, 0, 'es_UY', 1, NULL, 0, 0, 2, '16959 Evelyn Freeway\nNew Mckenzie, TN 24817-7173', 'New Ahmedview', 'OK', '47416-0388'),
(27, 'roman58@example.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Eula', 'Goyette', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'South Georgia and the South Sandwich Islands', NULL, 2, '1-560-306-1616 x2741', 'Forging Machine Setter', NULL, '28206', NULL, 'jkihn', 'Created by DB seeder', 1, NULL, 0, 'en_JM', 1, NULL, 0, 0, 4, '9399 Nikolaus Ways Apt. 223\nPort Chesley, VT 76804-7621', 'Lake Kacie', 'WA', '89948'),
(28, 'werner61@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Kimberly', 'Bins', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Canada', NULL, 4, '1-718-409-7819 x6502', 'Food Scientists and Technologist', NULL, '25675', NULL, 'bchristiansen', 'Created by DB seeder', 4, NULL, 0, 'ny_MW', 1, NULL, 0, 0, 4, '87215 Wiegand Skyway Apt. 140\nBonitaville, MN 46672', 'Bernhardport', 'CA', '06861'),
(29, 'hermiston.leora@example.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Rene', 'Ullrich', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Azerbaijan', NULL, 1, '+16153747538', 'Avionics Technician', NULL, '23434', NULL, 'adaline61', 'Created by DB seeder', 1, NULL, 0, 'de_AT', 1, NULL, 0, 0, 2, '90790 Sandra Passage Suite 425\nNew Alizeside, NC 38711-8271', 'East Javontetown', 'AL', '63113'),
(30, 'alberta01@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Jaden', 'Goodwin', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Zambia', NULL, 4, '458-976-2548 x2404', 'Paralegal', NULL, '8535', NULL, 'feil.alycia', 'Created by DB seeder', 2, NULL, 0, 'af_NA', 1, NULL, 0, 0, 2, '77515 Murl Shores Apt. 725\nShaniahaven, MN 89837-3702', 'Delphiaville', 'SC', '84202-2824'),
(31, 'christiansen.brayan@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Rachel', 'Hahn', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Dominica', NULL, 1, '603.328.4173 x5483', 'Gas Distribution Plant Operator', NULL, '24349', NULL, 'xkeebler', 'Created by DB seeder', 2, NULL, 0, 'cy_GB', 1, NULL, 0, 0, 6, '41270 Magnolia Lodge Apt. 403\nNorth Sibylburgh, RI 71560-0233', 'East Minniemouth', 'UT', '86745-2185'),
(32, 'ukris@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Vella', 'Lockman', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Croatia', NULL, 3, '740.344.1561 x0361', 'Separating Machine Operators', NULL, '13872', NULL, 'stokes.cade', 'Created by DB seeder', 3, NULL, 0, 'ta_IN', 1, NULL, 0, 0, 3, '44934 Amira Estates\nNew Felipa, IA 93063', 'Rauborough', 'CO', '71583'),
(33, 'rozella.shanahan@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Rylee', 'Mante', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Mali', NULL, 5, '+1-956-405-6791', 'Transportation Attendant', NULL, '17414', NULL, 'odie.stanton', 'Created by DB seeder', 4, NULL, 0, 'ar_OM', 1, NULL, 0, 0, 4, '697 Ressie River\nNew Johnny, WI 69042', 'New Anthonychester', 'RI', '84960'),
(34, 'crist.christian@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Domenic', 'Nolan', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Gambia', NULL, 4, '(458) 569-0343 x2052', 'Cutting Machine Operator', NULL, '30103', NULL, 'maryjane.gleichner', 'Created by DB seeder', 1, NULL, 0, 'es_PE', 1, NULL, 0, 0, 2, '338 Kunde Walk\nFidelland, NC 39897-6821', 'New Jeremymouth', 'ND', '77681'),
(35, 'joseph70@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Wilfredo', 'Stoltenberg', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Bangladesh', NULL, 3, '+1 (764) 650-1608', 'Chemical Equipment Controller', NULL, '21806', NULL, 'wpaucek', 'Created by DB seeder', 3, NULL, 0, 've_ZA', 1, NULL, 0, 0, 1, '1455 Adell Fork Suite 838\nLizziefurt, GA 00392', 'Dietrichberg', 'AZ', '51239'),
(36, 'tracey.kozey@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Abigale', 'Farrell', '2019-06-11 01:52:40', '2019-08-08 23:39:39', NULL, NULL, 'Sierra Leone', NULL, 4, '(449) 975-4734 x42804', 'Insurance Investigator', NULL, '15529', NULL, 'hyatt.mireya', 'Created by DB seeder', 2, NULL, 0, 'kok_IN', 1, NULL, 0, 0, 6, '4983 Taryn Passage Suite 927\nEichmannborough, AL 23739-7548', 'Altenwerthfurt', 'SD', '21300-8833'),
(37, 'xcrist@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Adela', 'Quigley', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Dominican Republic', NULL, 2, '415.295.1794 x012', 'Surveying Technician', NULL, '22567', NULL, 'haylie14', 'Created by DB seeder', 1, NULL, 0, 'es_AR', 1, NULL, 0, 0, 1, '915 Marilou Cliff\nWest Alexane, RI 38268', 'Darronstad', 'HI', '32171-7695'),
(38, 'nwindler@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Geoffrey', 'Feest', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Equatorial Guinea', NULL, 5, '+1-383-893-7092', 'Clerk', NULL, '17489', NULL, 'ilakin', 'Created by DB seeder', 2, NULL, 0, 'en_JM', 1, NULL, 0, 0, 1, '286 Thiel Wells\nLucileland, IA 71874-5153', 'North Madelynnville', 'CT', '83653'),
(39, 'erin.schulist@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Dolly', 'Osinski', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Georgia', NULL, 2, '(356) 505-3568 x2510', 'Ship Carpenter and Joiner', NULL, '10590', NULL, 'ratke.granville', 'Created by DB seeder', 1, NULL, 0, 'bg_BG', 1, NULL, 0, 0, 1, '703 Travon Cliff\nLake Brennaburgh, NH 79026', 'Jenkinstown', 'OR', '97898-1915'),
(40, 'neva86@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Lauren', 'Jacobson', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Panama', NULL, 3, '1-210-323-6353', 'Loan Counselor', NULL, '28260', NULL, 'lmills', 'Created by DB seeder', 2, NULL, 0, 'en_MH', 1, NULL, 0, 0, 3, '76203 Kira Meadow\nWest Minniemouth, WA 57604-6066', 'Leilatown', 'WI', '42996'),
(41, 'casper.kathleen@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Frankie', 'Reinger', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Mayotte', NULL, 3, '1-526-256-3585 x0012', 'Editor', NULL, '24555', NULL, 'jakubowski.ralph', 'Created by DB seeder', 4, NULL, 0, 'so_ET', 1, NULL, 0, 0, 5, '5822 Bernier Pine Apt. 978\nAuerton, RI 97337', 'Douglaston', 'MI', '75227-2241'),
(42, 'kiehn.rashawn@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Kiera', 'Johnston', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Russian Federation', NULL, 5, '803-286-1620 x0311', 'Radiation Therapist', NULL, '21637', NULL, 'saige18', 'Created by DB seeder', 1, NULL, 0, 'sh_YU', 1, NULL, 0, 0, 2, '81194 Maggio Branch Suite 337\nEast Alanafort, KS 17649', 'Lucieton', 'RI', '48280'),
(43, 'marcel.crona@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Madelyn', 'Herman', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Taiwan', NULL, 2, '668-772-1268 x9642', 'Janitor', NULL, '21698', NULL, 'rabbott', 'Created by DB seeder', 3, NULL, 0, 'to_TO', 1, NULL, 0, 0, 2, '2702 Lakin Trail Apt. 313\nCummerataport, ID 71043-5769', 'Carminefort', 'ME', '13334-6217'),
(44, 'jeanie22@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Delores', 'Lang', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Tonga', NULL, 3, '(957) 569-1812', 'Flight Attendant', NULL, '21228', NULL, 'alayna.hilpert', 'Created by DB seeder', 3, NULL, 0, 'es_MX', 1, NULL, 0, 0, 2, '2129 Terry Green Suite 813\nGloverview, FL 83631', 'North Lucianochester', 'IL', '54082-9500'),
(45, 'mellie56@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Aileen', 'Schiller', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Latvia', NULL, 4, '+1 (685) 618-2142', 'Detective', NULL, '6761', NULL, 'hlynch', 'Created by DB seeder', 2, NULL, 0, 'gsw_CH', 1, NULL, 0, 0, 1, '8073 Fisher Terrace\nLake Jackson, MN 85198', 'North Merlinchester', 'NV', '27608'),
(46, 'yconsidine@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Zula', 'Hoppe', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Ecuador', NULL, 3, '(417) 663-7699', 'Fish Game Warden', NULL, '16809', NULL, 'oreilly.jordane', 'Created by DB seeder', 4, NULL, 0, 'ln_CG', 1, NULL, 0, 0, 3, '63609 Kautzer Drives\nBartolettihaven, IL 67069-5931', 'Lake Mollie', 'NH', '26997'),
(47, 'reanna53@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Adaline', 'Murray', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Isle of Man', NULL, 4, '276.609.9525', 'Housekeeping Supervisor', NULL, '21877', NULL, 'cleveland19', 'Created by DB seeder', 3, NULL, 0, 'lo_LA', 1, NULL, 0, 0, 4, '68240 Pfeffer Run Suite 685\nStanleyberg, NC 70750', 'Leannonchester', 'NV', '50392-4203'),
(48, 'hfritsch@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Darrick', 'Mann', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Saint Lucia', NULL, 4, '405-330-0219 x20815', 'Cabinetmaker', NULL, '27118', NULL, 'yoshiko59', 'Created by DB seeder', 1, NULL, 0, 'de_LI', 1, NULL, 0, 0, 1, '97103 Hills Place\nDareton, WY 58869-3579', 'West Steve', 'WA', '03388-9104'),
(49, 'kristopher.klocko@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Gideon', 'Kozey', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Malaysia', NULL, 4, '778-257-5716', 'Nursery Worker', NULL, '27428', NULL, 'stanton.kieran', 'Created by DB seeder', 4, NULL, 0, 'en_AS', 1, NULL, 0, 0, 2, '48261 Osinski Street Suite 038\nSporerville, ME 28288-8134', 'North Dion', 'CO', '21642-2447'),
(50, 'yhand@example.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Lelah', 'Glover', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Myanmar', NULL, 1, '224-908-8097 x3111', 'Armored Assault Vehicle Crew Member', NULL, '4987', NULL, 'eula.oreilly', 'Created by DB seeder', 1, NULL, 0, 'en_AS', 1, NULL, 0, 0, 4, '7494 Schaden Lights\nEusebioborough, VT 47256', 'Port Nicolas', 'NH', '89376-7133'),
(51, 'benny40@example.org', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Maybell', 'Effertz', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Latvia', NULL, 5, '889.517.9049 x5670', 'Gaming Manager', NULL, '21021', NULL, 'richmond98', 'Created by DB seeder', 3, NULL, 0, 'or_IN', 1, NULL, 0, 0, 3, '347 Michaela Flats\nWest Giovanimouth, WY 76357-5653', 'Lake Emilioville', 'TN', '42765'),
(52, 'jamey.kunze@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Leola', 'Wuckert', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Turkmenistan', NULL, 2, '+1.249.651.5366', 'Video Editor', NULL, '8558', NULL, 'jwyman', 'Created by DB seeder', 1, NULL, 0, 'as_IN', 1, NULL, 0, 0, 4, '73180 Avery Pines\nSouth Keenanbury, PA 58448-1591', 'New Asa', 'NE', '91865-2089'),
(53, 'ygleason@example.net', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Selina', 'Goldner', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Colombia', NULL, 3, '460.200.1054 x49665', 'Correctional Officer', NULL, '33124', NULL, 'adolfo.thiel', 'Created by DB seeder', 4, NULL, 0, 'vi_VN', 1, NULL, 0, 0, 2, '67529 Anabel Landing\nHirthemouth, NJ 75973', 'Port Brandy', 'IN', '53040'),
(54, 'liliana14@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Ryleigh', 'Maggio', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Christmas Island', NULL, 4, '507.781.5886 x3638', 'Product Promoter', NULL, '13058', NULL, 'darrin.dibbert', 'Created by DB seeder', 2, NULL, 0, 'de_CH', 1, NULL, 0, 0, 6, '586 Bosco Mountain Apt. 178\nWest Eunice, NE 89455', 'Mitchellmouth', 'NE', '10519-6369'),
(55, 'tre08@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Rasheed', 'Streich', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Aruba', NULL, 4, '352.229.2360 x28827', 'Marine Architect', NULL, '7546', NULL, 'deon66', 'Created by DB seeder', 4, NULL, 0, 'ku_SY', 1, NULL, 0, 0, 2, '913 Corkery Pass Suite 099\nSouth Lambertborough, OR 45438', 'Weissnatville', 'MN', '10980'),
(56, 'jvolkman@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Adan', 'Lubowitz', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Saint Pierre and Miquelon', NULL, 1, '305-620-7110 x53093', 'Graphic Designer', NULL, '33235', NULL, 'tevin82', 'Created by DB seeder', 3, NULL, 0, 'ka_GE', 1, NULL, 0, 0, 1, '3050 Yost Ferry Apt. 278\nRobertomouth, CT 96948', 'Maeganport', 'SC', '96967-9842'),
(57, 'qschuster@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Stanley', 'Schinner', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Antigua and Barbuda', NULL, 4, '353.458.5396', 'Information Systems Manager', NULL, '20707', NULL, 'west.nathen', 'Created by DB seeder', 1, NULL, 0, 'en_CA', 1, NULL, 0, 0, 4, '46692 Arvilla Rue Apt. 822\nDulceborough, MS 41061', 'New Eugenia', 'KY', '63901'),
(58, 'bahringer.frida@example.com', '$2y$10$G5XP.jKKW5OCMGm4f2Y0UuZw8Pt2sOmV6fBAZ/6VCWE3J69QbV8/O', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Isac', 'Jaskolski', '2019-06-11 01:52:40', '2019-06-11 01:52:40', NULL, NULL, 'Eritrea', NULL, 5, '968.614.9793 x340', 'Pediatricians', NULL, '19433', NULL, 'lherzog', 'Created by DB seeder', 3, NULL, 0, 'es_PE', 1, NULL, 0, 0, 4, '8922 Alana Turnpike Suite 424\nVerlamouth, NJ 03010', 'North Lizethton', 'OR', '21628-3367'),
(59, 'ha.tb@vn.vinx.asia', '$2y$10$MIukzuXzO0rB93OBrzYIuOzD3ug8lgL5IaiqJkkeoo.hYh2XcB7e6', '{\"superuser\":\"1\",\"admin\":\"1\",\"import\":\"0\",\"reports.view\":\"1\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"1\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, '2019-08-20 02:23:47', NULL, NULL, 'Ha', 'Trinh', '2019-06-11 20:28:45', '2019-08-20 02:23:47', NULL, NULL, NULL, NULL, 11, NULL, NULL, NULL, NULL, NULL, 'ha.tb', NULL, 5, '0KcThNT05cnJM9GlPW7QndXqukvpCaxrAD2OsdD23OZOoZlM2G4q2ACiW9FN', 0, 'en', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(60, NULL, '$2y$10$Sdi2TqGUYIWMFMr0K8bbieS/nLEKxlzrVi./rOrZ4sr5hsEwJCH0K', NULL, 0, NULL, NULL, NULL, NULL, NULL, 'User', 'Test', '2019-07-05 03:36:21', '2019-07-05 03:36:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'snipeit', NULL, NULL, NULL, 0, 'en', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(61, NULL, '$2y$10$cRPY8LCftLoLFPxK3/28W.49hoHZNKFBOrZahzwEbWYKan8ltsyra', '{\"superuser\":\"1\",\"admin\":\"1\",\"import\":\"1\",\"reports.view\":\"1\",\"assets.view\":\"1\",\"assets.create\":\"1\",\"assets.edit\":\"1\",\"assets.delete\":\"1\",\"assets.checkin\":\"1\",\"assets.checkout\":\"1\",\"assets.audit\":\"1\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"1\",\"accessories.create\":\"1\",\"accessories.edit\":\"1\",\"accessories.delete\":\"1\",\"accessories.checkout\":\"1\",\"accessories.checkin\":\"1\",\"consumables.view\":\"1\",\"consumables.create\":\"1\",\"consumables.edit\":\"1\",\"consumables.delete\":\"1\",\"consumables.checkout\":\"1\",\"licenses.view\":\"1\",\"licenses.create\":\"1\",\"licenses.edit\":\"1\",\"licenses.delete\":\"1\",\"licenses.checkout\":\"1\",\"licenses.keys\":\"1\",\"components.view\":\"1\",\"components.create\":\"1\",\"components.edit\":\"1\",\"components.delete\":\"1\",\"components.checkout\":\"1\",\"components.checkin\":\"1\",\"users.view\":\"1\",\"users.create\":\"1\",\"users.edit\":\"1\",\"users.delete\":\"1\",\"models.view\":\"1\",\"models.create\":\"1\",\"models.edit\":\"1\",\"models.delete\":\"1\",\"categories.view\":\"1\",\"categories.create\":\"1\",\"categories.edit\":\"1\",\"categories.delete\":\"1\",\"departments.view\":\"1\",\"departments.create\":\"1\",\"departments.edit\":\"1\",\"departments.delete\":\"1\",\"statuslabels.view\":\"1\",\"statuslabels.create\":\"1\",\"statuslabels.edit\":\"1\",\"statuslabels.delete\":\"1\",\"customfields.view\":\"1\",\"customfields.create\":\"1\",\"customfields.edit\":\"1\",\"customfields.delete\":\"1\",\"suppliers.view\":\"1\",\"suppliers.create\":\"1\",\"suppliers.edit\":\"1\",\"suppliers.delete\":\"1\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"1\",\"manufacturers.edit\":\"1\",\"manufacturers.delete\":\"1\",\"depreciations.view\":\"1\",\"depreciations.create\":\"1\",\"depreciations.edit\":\"1\",\"depreciations.delete\":\"1\",\"locations.view\":\"1\",\"locations.create\":\"1\",\"locations.edit\":\"1\",\"locations.delete\":\"1\",\"companies.view\":\"1\",\"companies.create\":\"1\",\"companies.edit\":\"1\",\"companies.delete\":\"1\",\"self.two_factor\":\"1\",\"self.api\":\"1\",\"self.edit_location\":\"1\"}', 1, NULL, NULL, '2019-07-09 01:42:17', NULL, NULL, 'Thong', 'Ly Thinh', '2019-07-07 19:32:24', '2019-07-09 01:42:17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TidusLee', NULL, 5, NULL, 0, 'en', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(62, 'kitagawa153@gmail.com', '$2y$10$wGl3A4XbHFGByLCEzUTvA.VUMiQKfWpygmwZH28lcYL39ngOLcvU6', '{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Trịnh', 'Bắc Hà', '2019-07-09 23:28:39', '2019-07-09 23:28:39', NULL, NULL, 'VN', NULL, 11, NULL, 'Programmer', 59, '037118006', NULL, 'fegle', NULL, 5, NULL, 0, 'vi', 1, NULL, 0, 0, 7, NULL, NULL, NULL, NULL),
(63, 'dangcntt2801@gmail.com', '$2y$10$hItIyR7EiABgpgOAIrkzUuEvc9ElxU3ZSZvUmQTf8pae8SxSGURsq', '{\"superuser\":\"1\",\"admin\":\"1\",\"import\":\"1\",\"reports.view\":\"1\",\"assets.view\":\"1\",\"assets.create\":\"1\",\"assets.edit\":\"1\",\"assets.delete\":\"1\",\"assets.checkin\":\"1\",\"assets.checkout\":\"1\",\"assets.audit\":\"1\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"1\",\"accessories.create\":\"1\",\"accessories.edit\":\"1\",\"accessories.delete\":\"1\",\"accessories.checkout\":\"1\",\"accessories.checkin\":\"1\",\"consumables.view\":\"1\",\"consumables.create\":\"1\",\"consumables.edit\":\"1\",\"consumables.delete\":\"1\",\"consumables.checkout\":\"1\",\"licenses.view\":\"1\",\"licenses.create\":\"1\",\"licenses.edit\":\"1\",\"licenses.delete\":\"1\",\"licenses.checkout\":\"1\",\"licenses.keys\":\"1\",\"components.view\":\"1\",\"components.create\":\"1\",\"components.edit\":\"1\",\"components.delete\":\"1\",\"components.checkout\":\"1\",\"components.checkin\":\"1\",\"users.view\":\"1\",\"users.create\":\"1\",\"users.edit\":\"1\",\"users.delete\":\"1\",\"models.view\":\"1\",\"models.create\":\"1\",\"models.edit\":\"1\",\"models.delete\":\"1\",\"categories.view\":\"1\",\"categories.create\":\"1\",\"categories.edit\":\"1\",\"categories.delete\":\"1\",\"departments.view\":\"1\",\"departments.create\":\"1\",\"departments.edit\":\"1\",\"departments.delete\":\"1\",\"statuslabels.view\":\"1\",\"statuslabels.create\":\"1\",\"statuslabels.edit\":\"1\",\"statuslabels.delete\":\"1\",\"customfields.view\":\"1\",\"customfields.create\":\"1\",\"customfields.edit\":\"1\",\"customfields.delete\":\"1\",\"suppliers.view\":\"1\",\"suppliers.create\":\"1\",\"suppliers.edit\":\"1\",\"suppliers.delete\":\"1\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"1\",\"manufacturers.edit\":\"1\",\"manufacturers.delete\":\"1\",\"depreciations.view\":\"1\",\"depreciations.create\":\"1\",\"depreciations.edit\":\"1\",\"depreciations.delete\":\"1\",\"locations.view\":\"1\",\"locations.create\":\"1\",\"locations.edit\":\"1\",\"locations.delete\":\"1\",\"companies.view\":\"1\",\"companies.create\":\"1\",\"companies.edit\":\"1\",\"companies.delete\":\"1\",\"self.two_factor\":\"1\",\"self.api\":\"1\",\"self.edit_location\":\"1\"}', 1, NULL, NULL, '2019-08-08 23:59:48', NULL, NULL, 'dang', 'huynh', '2019-07-16 20:06:25', '2019-08-08 23:59:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, 'sutu9578', NULL, 2, 'QT3tXD3IOWFzc1gGOH0Y7UTMNXDP3AV6FoxX1Jor3qsaOaX7AKXuQsecQy84', 0, 'en', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(64, NULL, '$2y$10$Mf9gkXA28GyNYUKXWVg73eqbttU7JNgGwIFU9jycH6e0su.tIj0E6', '{\"superuser\":\"1\",\"admin\":\"1\",\"import\":\"1\",\"reports.view\":\"1\",\"assets.view\":\"1\",\"assets.create\":\"1\",\"assets.edit\":\"1\",\"assets.delete\":\"1\",\"assets.checkin\":\"1\",\"assets.checkout\":\"1\",\"assets.audit\":\"1\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"1\",\"accessories.create\":\"1\",\"accessories.edit\":\"1\",\"accessories.delete\":\"1\",\"accessories.checkout\":\"1\",\"accessories.checkin\":\"1\",\"consumables.view\":\"1\",\"consumables.create\":\"1\",\"consumables.edit\":\"1\",\"consumables.delete\":\"1\",\"consumables.checkout\":\"1\",\"licenses.view\":\"1\",\"licenses.create\":\"1\",\"licenses.edit\":\"1\",\"licenses.delete\":\"1\",\"licenses.checkout\":\"1\",\"licenses.keys\":\"1\",\"components.view\":\"1\",\"components.create\":\"1\",\"components.edit\":\"1\",\"components.delete\":\"1\",\"components.checkout\":\"1\",\"components.checkin\":\"1\",\"users.view\":\"1\",\"users.create\":\"1\",\"users.edit\":\"1\",\"users.delete\":\"1\",\"models.view\":\"1\",\"models.create\":\"1\",\"models.edit\":\"1\",\"models.delete\":\"1\",\"categories.view\":\"1\",\"categories.create\":\"1\",\"categories.edit\":\"1\",\"categories.delete\":\"1\",\"departments.view\":\"1\",\"departments.create\":\"1\",\"departments.edit\":\"1\",\"departments.delete\":\"1\",\"statuslabels.view\":\"1\",\"statuslabels.create\":\"1\",\"statuslabels.edit\":\"1\",\"statuslabels.delete\":\"1\",\"customfields.view\":\"1\",\"customfields.create\":\"1\",\"customfields.edit\":\"1\",\"customfields.delete\":\"1\",\"suppliers.view\":\"1\",\"suppliers.create\":\"1\",\"suppliers.edit\":\"1\",\"suppliers.delete\":\"1\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"1\",\"manufacturers.edit\":\"1\",\"manufacturers.delete\":\"1\",\"depreciations.view\":\"1\",\"depreciations.create\":\"1\",\"depreciations.edit\":\"1\",\"depreciations.delete\":\"1\",\"locations.view\":\"1\",\"locations.create\":\"1\",\"locations.edit\":\"1\",\"locations.delete\":\"1\",\"companies.view\":\"1\",\"companies.create\":\"1\",\"companies.edit\":\"1\",\"companies.delete\":\"1\",\"stores.view\":\"0\",\"stores.create\":\"0\",\"stores.edit\":\"0\",\"stores.delete\":\"0\",\"contracts.view\":\"0\",\"contracts.create\":\"0\",\"contracts.edit\":\"0\",\"contracts.delete\":\"0\",\"inventories.view\":\"0\",\"inventories.create\":\"0\",\"inventories.edit\":\"0\",\"inventories.delete\":\"0\",\"inventoryresults.view\":\"0\",\"inventoryresults.create\":\"0\",\"inventoryresults.edit\":\"0\",\"inventoryresults.delete\":\"0\",\"self.two_factor\":\"1\",\"self.api\":\"1\",\"self.edit_location\":\"1\"}', 1, NULL, NULL, '2019-08-22 18:15:39', NULL, NULL, 'Diem', 'GTN', '2019-07-16 20:08:07', '2019-08-22 18:15:39', NULL, NULL, NULL, NULL, 16, NULL, NULL, NULL, NULL, NULL, 'diem.gtn', NULL, NULL, 'Ag2Puk5PW5ckmgQfrpRGKKA4SjxKt0uB2M9sRX3nq7CXkaDjitSCDEm0Aclv', 0, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(65, 'duong.lnt@vn.vinx.asia', '$2y$10$nJ2R9HxXrPx3RCi/zjoFoO4o0kyxvPTGiC.gpAA17BLbI595epW.q', '{\"superuser\":\"1\",\"admin\":\"1\",\"import\":\"1\",\"reports.view\":\"1\",\"assets.view\":\"1\",\"assets.create\":\"1\",\"assets.edit\":\"1\",\"assets.delete\":\"1\",\"assets.checkin\":\"1\",\"assets.checkout\":\"1\",\"assets.audit\":\"1\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"1\",\"accessories.create\":\"1\",\"accessories.edit\":\"1\",\"accessories.delete\":\"1\",\"accessories.checkout\":\"1\",\"accessories.checkin\":\"1\",\"consumables.view\":\"1\",\"consumables.create\":\"1\",\"consumables.edit\":\"1\",\"consumables.delete\":\"1\",\"consumables.checkout\":\"1\",\"licenses.view\":\"1\",\"licenses.create\":\"1\",\"licenses.edit\":\"1\",\"licenses.delete\":\"1\",\"licenses.checkout\":\"1\",\"licenses.keys\":\"1\",\"components.view\":\"1\",\"components.create\":\"1\",\"components.edit\":\"1\",\"components.delete\":\"1\",\"components.checkout\":\"1\",\"components.checkin\":\"1\",\"users.view\":\"1\",\"users.create\":\"1\",\"users.edit\":\"1\",\"users.delete\":\"1\",\"models.view\":\"1\",\"models.create\":\"1\",\"models.edit\":\"1\",\"models.delete\":\"1\",\"categories.view\":\"1\",\"categories.create\":\"1\",\"categories.edit\":\"1\",\"categories.delete\":\"1\",\"departments.view\":\"1\",\"departments.create\":\"1\",\"departments.edit\":\"1\",\"departments.delete\":\"1\",\"statuslabels.view\":\"1\",\"statuslabels.create\":\"1\",\"statuslabels.edit\":\"1\",\"statuslabels.delete\":\"1\",\"customfields.view\":\"1\",\"customfields.create\":\"1\",\"customfields.edit\":\"1\",\"customfields.delete\":\"1\",\"suppliers.view\":\"1\",\"suppliers.create\":\"1\",\"suppliers.edit\":\"1\",\"suppliers.delete\":\"1\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"1\",\"manufacturers.edit\":\"1\",\"manufacturers.delete\":\"1\",\"depreciations.view\":\"1\",\"depreciations.create\":\"1\",\"depreciations.edit\":\"1\",\"depreciations.delete\":\"1\",\"locations.view\":\"1\",\"locations.create\":\"1\",\"locations.edit\":\"1\",\"locations.delete\":\"1\",\"companies.view\":\"1\",\"companies.create\":\"1\",\"companies.edit\":\"1\",\"companies.delete\":\"1\",\"self.two_factor\":\"1\",\"self.api\":\"1\",\"self.edit_location\":\"1\"}', 1, NULL, NULL, '2019-08-02 01:45:36', NULL, NULL, 'LE', 'DUONG', '2019-07-16 20:12:19', '2019-08-02 01:45:36', NULL, NULL, NULL, NULL, 1, NULL, NULL, 62, NULL, NULL, 'lntduong', NULL, 5, 'tQxaVdyFU9cmTBMC4znjBjZLr21QsId2ienjwIisRcfqrkHJfUgN3R1JZ0Lc', 0, 'en', 1, NULL, 0, 0, 7, NULL, NULL, NULL, NULL),
(66, NULL, '$2y$10$kt7EocG6A5m/s.cVFE58qu5KnL6FqC4myFeO8/PabuoV84CsOIG4q', '{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"1\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, '2019-08-06 02:07:17', NULL, NULL, 'ha', 'vvc', '2019-08-06 02:04:32', '2019-08-06 02:07:37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ha.vvc', NULL, 5, 'RJzYJOoAMRJpxx2MvBDmuJDKOrHrj4uEW1XNOImNX7ExrNgBaEYOiA5NllH9', 0, 'en', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` (`id`, `email`, `password`, `permissions`, `activated`, `activation_code`, `activated_at`, `last_login`, `persist_code`, `reset_password_code`, `first_name`, `last_name`, `created_at`, `updated_at`, `deleted_at`, `website`, `country`, `gravatar`, `location_id`, `phone`, `jobtitle`, `manager_id`, `employee_num`, `avatar`, `username`, `notes`, `company_id`, `remember_token`, `ldap_import`, `locale`, `show_in_list`, `two_factor_secret`, `two_factor_enrolled`, `two_factor_optin`, `department_id`, `address`, `city`, `state`, `zip`) VALUES
(67, 'trang.dtp@vn.vinx.asia', '$2y$10$cmtdoAzhFf3//qm6GZogtu4GXFZ/6fw1ejmwiqal3t4WdMbYt07/u', '{\"superuser\":\"-1\",\"admin\":\"0\",\"import\":\"1\",\"reports.view\":\"1\",\"assets.view\":\"-1\",\"assets.create\":\"-1\",\"assets.edit\":\"-1\",\"assets.delete\":\"-1\",\"assets.checkin\":\"-1\",\"assets.checkout\":\"-1\",\"assets.audit\":\"-1\",\"assets.view.requestable\":\"-1\",\"accessories.view\":\"1\",\"accessories.create\":\"1\",\"accessories.edit\":\"1\",\"accessories.delete\":\"1\",\"accessories.checkout\":\"1\",\"accessories.checkin\":\"1\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"1\",\"licenses.create\":\"1\",\"licenses.edit\":\"1\",\"licenses.delete\":\"1\",\"licenses.checkout\":\"1\",\"licenses.keys\":\"1\",\"components.view\":\"1\",\"components.create\":\"1\",\"components.edit\":\"1\",\"components.delete\":\"1\",\"components.checkout\":\"1\",\"components.checkin\":\"1\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"1\",\"models.create\":\"1\",\"models.edit\":\"1\",\"models.delete\":\"1\",\"categories.view\":\"1\",\"categories.create\":\"1\",\"categories.edit\":\"1\",\"categories.delete\":\"1\",\"departments.view\":\"1\",\"departments.create\":\"1\",\"departments.edit\":\"1\",\"departments.delete\":\"1\",\"statuslabels.view\":\"1\",\"statuslabels.create\":\"1\",\"statuslabels.edit\":\"1\",\"statuslabels.delete\":\"1\",\"customfields.view\":\"1\",\"customfields.create\":\"1\",\"customfields.edit\":\"1\",\"customfields.delete\":\"1\",\"suppliers.view\":\"1\",\"suppliers.create\":\"1\",\"suppliers.edit\":\"1\",\"suppliers.delete\":\"1\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"1\",\"manufacturers.edit\":\"1\",\"manufacturers.delete\":\"1\",\"depreciations.view\":\"1\",\"depreciations.create\":\"1\",\"depreciations.edit\":\"1\",\"depreciations.delete\":\"1\",\"locations.view\":\"1\",\"locations.create\":\"1\",\"locations.edit\":\"1\",\"locations.delete\":\"1\",\"companies.view\":\"1\",\"companies.create\":\"1\",\"companies.edit\":\"1\",\"companies.delete\":\"1\",\"stores.view\":\"1\",\"stores.create\":\"1\",\"stores.edit\":\"1\",\"stores.delete\":\"1\",\"contracts.view\":\"1\",\"contracts.create\":\"1\",\"contracts.edit\":\"1\",\"contracts.delete\":\"1\",\"inventories.view\":\"1\",\"inventories.create\":\"1\",\"inventories.edit\":\"1\",\"inventories.delete\":\"1\",\"inventoryresults.view\":\"1\",\"inventoryresults.create\":\"1\",\"inventoryresults.edit\":\"1\",\"inventoryresults.delete\":\"1\",\"self.two_factor\":\"1\",\"self.api\":\"1\",\"self.edit_location\":\"1\"}', 1, NULL, NULL, '2019-08-20 19:18:43', NULL, NULL, 'Trang', 'Đinh', '2019-08-08 19:15:57', '2019-08-20 20:46:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'trang.dtp', NULL, 5, '7oYTz2nHRcg3sHD1T2Hn8N7wHM8J5p2x9TF1hYMXhPpxCEsW9sOAwkAl6mKL', 0, 'en', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(68, '', '$2y$10$4rcepdblYwTBOqJCRnlhwu0S6AhAp/xkSKo/1nk4cW4PxQtUHaHd6', '{\"superuser\":\"0\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Bé Thanh', 'vvc', '2019-08-09 01:16:49', '2019-08-09 01:16:49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'thanh.ntn', NULL, 7, NULL, 0, 'en', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(70, NULL, '$2y$10$BVci8XQIOgQMfYklW4ZsHOQjRbgn8offMPRQEzLuiWL5ZClqkBpea', '{\"superuser\":\"-1\",\"admin\":\"0\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"1\",\"assets.create\":\"1\",\"assets.edit\":\"1\",\"assets.delete\":\"1\",\"assets.checkin\":\"1\",\"assets.checkout\":\"1\",\"assets.audit\":\"1\",\"assets.view.requestable\":\"1\",\"accessories.view\":\"-1\",\"accessories.create\":\"-1\",\"accessories.edit\":\"-1\",\"accessories.delete\":\"-1\",\"accessories.checkout\":\"-1\",\"accessories.checkin\":\"-1\",\"consumables.view\":\"-1\",\"consumables.create\":\"-1\",\"consumables.edit\":\"-1\",\"consumables.delete\":\"-1\",\"consumables.checkout\":\"-1\",\"licenses.view\":\"-1\",\"licenses.create\":\"-1\",\"licenses.edit\":\"-1\",\"licenses.delete\":\"-1\",\"licenses.checkout\":\"-1\",\"licenses.keys\":\"-1\",\"components.view\":\"1\",\"components.create\":\"1\",\"components.edit\":\"1\",\"components.delete\":\"1\",\"components.checkout\":\"1\",\"components.checkin\":\"1\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"1\",\"models.create\":\"1\",\"models.edit\":\"1\",\"models.delete\":\"1\",\"categories.view\":\"1\",\"categories.create\":\"1\",\"categories.edit\":\"1\",\"categories.delete\":\"1\",\"departments.view\":\"1\",\"departments.create\":\"1\",\"departments.edit\":\"1\",\"departments.delete\":\"1\",\"statuslabels.view\":\"1\",\"statuslabels.create\":\"1\",\"statuslabels.edit\":\"1\",\"statuslabels.delete\":\"1\",\"customfields.view\":\"1\",\"customfields.create\":\"1\",\"customfields.edit\":\"1\",\"customfields.delete\":\"1\",\"suppliers.view\":\"1\",\"suppliers.create\":\"1\",\"suppliers.edit\":\"1\",\"suppliers.delete\":\"1\",\"manufacturers.view\":\"1\",\"manufacturers.create\":\"1\",\"manufacturers.edit\":\"1\",\"manufacturers.delete\":\"1\",\"depreciations.view\":\"1\",\"depreciations.create\":\"1\",\"depreciations.edit\":\"1\",\"depreciations.delete\":\"1\",\"locations.view\":\"1\",\"locations.create\":\"1\",\"locations.edit\":\"1\",\"locations.delete\":\"1\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"stores.view\":\"-1\",\"stores.create\":\"-1\",\"stores.edit\":\"-1\",\"stores.delete\":\"-1\",\"contracts.view\":\"-1\",\"contracts.create\":\"-1\",\"contracts.edit\":\"-1\",\"contracts.delete\":\"-1\",\"inventories.view\":\"0\",\"inventories.create\":\"0\",\"inventories.edit\":\"0\",\"inventories.delete\":\"0\",\"inventoryresults.view\":\"0\",\"inventoryresults.create\":\"0\",\"inventoryresults.edit\":\"0\",\"inventoryresults.delete\":\"0\",\"self.two_factor\":\"1\",\"self.api\":\"1\",\"self.edit_location\":\"1\"}', 1, NULL, NULL, '2019-08-20 19:38:16', NULL, NULL, 'da', NULL, '2019-08-20 19:37:56', '2019-08-20 21:52:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sutu9570', NULL, NULL, NULL, 0, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(71, '', '$2y$10$Y.VMmEURfYVrlVpWHwqd../1mfIBLM/6boPVIxUys/d.mcLtG6TqK', '{\"admin\":\"1\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"stores.view\":\"0\",\"stores.create\":\"0\",\"stores.edit\":\"0\",\"stores.delete\":\"0\",\"contracts.view\":\"0\",\"contracts.create\":\"0\",\"contracts.edit\":\"0\",\"contracts.delete\":\"0\",\"inventories.view\":\"0\",\"inventories.create\":\"0\",\"inventories.edit\":\"0\",\"inventories.delete\":\"0\",\"inventoryresults.view\":\"0\",\"inventoryresults.create\":\"0\",\"inventoryresults.edit\":\"0\",\"inventoryresults.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, NULL, NULL, NULL, 'dang', NULL, '2019-08-20 20:18:01', '2019-08-20 20:18:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sutu95700', NULL, NULL, NULL, 0, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL),
(72, '', '$2y$10$I5Vki9e9B3k/1SYIGxr6ou2F7vS8D41Xw4RFrVBkxjY.bFS9D2rWC', '{\"admin\":\"1\",\"import\":\"0\",\"reports.view\":\"0\",\"assets.view\":\"0\",\"assets.create\":\"0\",\"assets.edit\":\"0\",\"assets.delete\":\"0\",\"assets.checkin\":\"0\",\"assets.checkout\":\"0\",\"assets.audit\":\"0\",\"assets.view.requestable\":\"0\",\"accessories.view\":\"0\",\"accessories.create\":\"0\",\"accessories.edit\":\"0\",\"accessories.delete\":\"0\",\"accessories.checkout\":\"0\",\"accessories.checkin\":\"0\",\"consumables.view\":\"0\",\"consumables.create\":\"0\",\"consumables.edit\":\"0\",\"consumables.delete\":\"0\",\"consumables.checkout\":\"0\",\"licenses.view\":\"0\",\"licenses.create\":\"0\",\"licenses.edit\":\"0\",\"licenses.delete\":\"0\",\"licenses.checkout\":\"0\",\"licenses.keys\":\"0\",\"components.view\":\"0\",\"components.create\":\"0\",\"components.edit\":\"0\",\"components.delete\":\"0\",\"components.checkout\":\"0\",\"components.checkin\":\"0\",\"users.view\":\"0\",\"users.create\":\"0\",\"users.edit\":\"0\",\"users.delete\":\"0\",\"models.view\":\"0\",\"models.create\":\"0\",\"models.edit\":\"0\",\"models.delete\":\"0\",\"categories.view\":\"0\",\"categories.create\":\"0\",\"categories.edit\":\"0\",\"categories.delete\":\"0\",\"departments.view\":\"0\",\"departments.create\":\"0\",\"departments.edit\":\"0\",\"departments.delete\":\"0\",\"statuslabels.view\":\"0\",\"statuslabels.create\":\"0\",\"statuslabels.edit\":\"0\",\"statuslabels.delete\":\"0\",\"customfields.view\":\"0\",\"customfields.create\":\"0\",\"customfields.edit\":\"0\",\"customfields.delete\":\"0\",\"suppliers.view\":\"0\",\"suppliers.create\":\"0\",\"suppliers.edit\":\"0\",\"suppliers.delete\":\"0\",\"manufacturers.view\":\"0\",\"manufacturers.create\":\"0\",\"manufacturers.edit\":\"0\",\"manufacturers.delete\":\"0\",\"depreciations.view\":\"0\",\"depreciations.create\":\"0\",\"depreciations.edit\":\"0\",\"depreciations.delete\":\"0\",\"locations.view\":\"0\",\"locations.create\":\"0\",\"locations.edit\":\"0\",\"locations.delete\":\"0\",\"companies.view\":\"0\",\"companies.create\":\"0\",\"companies.edit\":\"0\",\"companies.delete\":\"0\",\"stores.view\":\"0\",\"stores.create\":\"0\",\"stores.edit\":\"0\",\"stores.delete\":\"0\",\"contracts.view\":\"0\",\"contracts.create\":\"0\",\"contracts.edit\":\"0\",\"contracts.delete\":\"0\",\"inventories.view\":\"0\",\"inventories.create\":\"0\",\"inventories.edit\":\"0\",\"inventories.delete\":\"0\",\"inventoryresults.view\":\"0\",\"inventoryresults.create\":\"0\",\"inventoryresults.edit\":\"0\",\"inventoryresults.delete\":\"0\",\"self.two_factor\":\"0\",\"self.api\":\"0\",\"self.edit_location\":\"0\"}', 1, NULL, NULL, NULL, NULL, NULL, 'dang', NULL, '2019-08-20 20:19:24', '2019-08-20 20:19:24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sutu95799', NULL, NULL, NULL, 0, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`user_id`, `group_id`) VALUES
(70, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accessories_users`
--
ALTER TABLE `accessories_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `action_logs`
--
ALTER TABLE `action_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_logs_thread_id_index` (`thread_id`),
  ADD KEY `action_logs_target_id_target_type_index` (`target_id`,`target_type`),
  ADD KEY `action_logs_created_at_index` (`created_at`),
  ADD KEY `action_logs_item_type_item_id_action_type_index` (`item_type`,`item_id`,`action_type`),
  ADD KEY `action_logs_target_type_target_id_action_type_index` (`target_type`,`target_id`,`action_type`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assets_rtd_location_id_index` (`rtd_location_id`),
  ADD KEY `assets_assigned_type_assigned_to_index` (`assigned_type`,`assigned_to`),
  ADD KEY `assets_created_at_index` (`created_at`),
  ADD KEY `assets_deleted_at_status_id_index` (`deleted_at`,`status_id`),
  ADD KEY `assets_deleted_at_model_id_index` (`deleted_at`,`model_id`),
  ADD KEY `assets_deleted_at_assigned_type_assigned_to_index` (`deleted_at`,`assigned_type`,`assigned_to`),
  ADD KEY `assets_deleted_at_supplier_id_index` (`deleted_at`,`supplier_id`),
  ADD KEY `assets_deleted_at_location_id_index` (`deleted_at`,`location_id`),
  ADD KEY `assets_deleted_at_rtd_location_id_index` (`deleted_at`,`rtd_location_id`),
  ADD KEY `assets_deleted_at_asset_tag_index` (`deleted_at`,`asset_tag`),
  ADD KEY `assets_deleted_at_name_index` (`deleted_at`,`name`);

--
-- Indexes for table `asset_logs`
--
ALTER TABLE `asset_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_maintenances`
--
ALTER TABLE `asset_maintenances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_uploads`
--
ALTER TABLE `asset_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkout_requests`
--
ALTER TABLE `checkout_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkout_requests_user_id_requestable_id_requestable_type` (`user_id`,`requestable_id`,`requestable_type`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_name_unique` (`name`);

--
-- Indexes for table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `components_assets`
--
ALTER TABLE `components_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumables`
--
ALTER TABLE `consumables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consumables_users`
--
ALTER TABLE `consumables_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contracts_name_object_id_object_type_unique` (`name`,`object_id`,`object_type`);

--
-- Indexes for table `contract_assets`
--
ALTER TABLE `contract_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fieldsets`
--
ALTER TABLE `custom_fieldsets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `depreciations`
--
ALTER TABLE `depreciations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_results`
--
ALTER TABLE `inventory_results`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `license_seats`
--
ALTER TABLE `license_seats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `models_custom_fields`
--
ALTER TABLE `models_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `requested_assets`
--
ALTER TABLE `requested_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_labels`
--
ALTER TABLE `status_labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stores_name_company_id_unique` (`name`,`company_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_activation_code_index` (`activation_code`),
  ADD KEY `users_reset_password_code_index` (`reset_password_code`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `accessories_users`
--
ALTER TABLE `accessories_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `action_logs`
--
ALTER TABLE `action_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=811;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1404;

--
-- AUTO_INCREMENT for table `asset_logs`
--
ALTER TABLE `asset_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asset_maintenances`
--
ALTER TABLE `asset_maintenances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `asset_uploads`
--
ALTER TABLE `asset_uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `checkout_requests`
--
ALTER TABLE `checkout_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `components`
--
ALTER TABLE `components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `components_assets`
--
ALTER TABLE `components_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consumables`
--
ALTER TABLE `consumables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `consumables_users`
--
ALTER TABLE `consumables_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `contract_assets`
--
ALTER TABLE `contract_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `custom_fieldsets`
--
ALTER TABLE `custom_fieldsets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `depreciations`
--
ALTER TABLE `depreciations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `inventory_results`
--
ALTER TABLE `inventory_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `license_seats`
--
ALTER TABLE `license_seats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;

--
-- AUTO_INCREMENT for table `models`
--
ALTER TABLE `models`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `models_custom_fields`
--
ALTER TABLE `models_custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `requested_assets`
--
ALTER TABLE `requested_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `status_labels`
--
ALTER TABLE `status_labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

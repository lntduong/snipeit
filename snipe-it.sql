-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 05, 2019 lúc 06:38 PM
-- Phiên bản máy phục vụ: 10.1.40-MariaDB
-- Phiên bản PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `snipe-it`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accessories`
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
-- Đang đổ dữ liệu cho bảng `accessories`
--

INSERT INTO `accessories` (`id`, `name`, `category_id`, `user_id`, `qty`, `requestable`, `created_at`, `updated_at`, `deleted_at`, `location_id`, `purchase_date`, `purchase_cost`, `order_number`, `company_id`, `min_amt`, `manufacturer_id`, `model_number`, `image`, `supplier_id`) VALUES
(1, 'USB Keyboard', 8, 1, 15, 0, '2019-06-05 07:23:15', '2019-06-05 07:23:15', NULL, 5, NULL, NULL, NULL, NULL, 2, 1, '47966811', NULL, 5),
(2, 'Bluetooth Keyboard', 8, 1, 10, 0, '2019-06-05 07:23:15', '2019-06-05 07:23:15', NULL, 1, NULL, NULL, NULL, NULL, 2, 1, '11641055', NULL, 1),
(3, 'Magic Mouse', 9, 1, 13, 0, '2019-06-05 07:23:15', '2019-06-05 07:23:15', NULL, 5, NULL, NULL, NULL, NULL, 2, 1, '13650350', NULL, 4),
(4, 'Sculpt Comfort Mouse', 9, 1, 13, 0, '2019-06-05 07:23:16', '2019-06-05 07:23:16', NULL, 3, NULL, NULL, NULL, NULL, 2, 2, '1425014', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accessories_users`
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
-- Cấu trúc bảng cho bảng `action_logs`
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
-- Đang đổ dữ liệu cho bảng `action_logs`
--

INSERT INTO `action_logs` (`id`, `user_id`, `action_type`, `target_id`, `target_type`, `location_id`, `note`, `filename`, `item_type`, `item_id`, `expected_checkin`, `accepted_id`, `created_at`, `updated_at`, `deleted_at`, `thread_id`, `company_id`, `accept_signature`, `log_meta`) VALUES
(1, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 117, NULL, NULL, '2019-02-23 15:32:06', '2019-06-05 07:29:06', NULL, NULL, NULL, NULL, NULL),
(2, 1, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 195, NULL, NULL, '2018-12-11 03:54:04', '2019-06-05 07:29:06', NULL, NULL, NULL, NULL, NULL),
(3, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 189, NULL, NULL, '2018-08-13 14:43:12', '2019-06-05 07:29:06', NULL, NULL, NULL, NULL, NULL),
(4, 1, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 323, NULL, NULL, '2018-08-23 06:35:04', '2019-06-05 07:29:06', NULL, NULL, NULL, NULL, NULL),
(5, 2, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 726, NULL, NULL, '2018-07-22 14:37:17', '2019-06-05 07:29:06', NULL, NULL, NULL, NULL, NULL),
(6, 2, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 438, NULL, NULL, '2018-11-11 21:56:41', '2019-06-05 07:29:06', NULL, NULL, NULL, NULL, NULL),
(7, 2, 'checkout', 41, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 161, NULL, NULL, '2018-11-14 10:32:37', '2019-06-05 07:29:06', NULL, NULL, NULL, NULL, NULL),
(8, 2, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 764, NULL, NULL, '2018-08-17 11:20:12', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(9, 2, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 704, NULL, NULL, '2018-11-28 12:02:49', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(10, 1, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 199, NULL, NULL, '2018-07-20 19:10:37', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(11, 2, 'checkout', 8, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1325, NULL, NULL, '2018-07-03 12:05:22', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(12, 2, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 999, NULL, NULL, '2019-02-12 09:23:14', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(13, 2, 'checkout', 17, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 722, NULL, NULL, '2019-04-28 21:36:19', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(14, 1, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 736, NULL, NULL, '2019-05-08 14:34:16', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(15, 1, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 444, NULL, NULL, '2019-05-18 03:16:08', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(16, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 354, NULL, NULL, '2019-05-27 21:44:06', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(17, 1, 'checkout', 30, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 981, NULL, NULL, '2018-11-09 05:05:46', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(18, 1, 'checkout', 27, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 188, NULL, NULL, '2019-05-27 00:25:52', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(19, 2, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1218, NULL, NULL, '2018-11-04 05:16:51', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(20, 1, 'checkout', 1, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 120, NULL, NULL, '2018-11-30 18:46:03', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(21, 2, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 46, NULL, NULL, '2018-12-26 02:16:28', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(22, 2, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 247, NULL, NULL, '2018-09-07 03:01:33', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(23, 2, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 151, NULL, NULL, '2018-10-29 14:40:00', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(24, 1, 'checkout', 8, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 59, NULL, NULL, '2018-09-26 03:00:36', '2019-06-05 07:29:07', NULL, NULL, NULL, NULL, NULL),
(25, 2, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 274, NULL, NULL, '2018-09-18 12:15:19', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(26, 2, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 817, NULL, NULL, '2019-03-04 11:52:00', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(27, 2, 'checkout', 41, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 287, NULL, NULL, '2018-09-18 23:05:18', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(28, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 886, NULL, NULL, '2019-01-30 23:53:40', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(29, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 811, NULL, NULL, '2018-12-18 03:07:30', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(30, 2, 'checkout', 46, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 653, NULL, NULL, '2018-07-04 19:14:20', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(31, 1, 'checkout', 46, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 765, NULL, NULL, '2019-04-03 18:56:59', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(32, 2, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 584, NULL, NULL, '2018-10-20 01:24:30', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(33, 1, 'checkout', 40, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1373, NULL, NULL, '2019-02-18 20:47:12', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(34, 1, 'checkout', 12, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 943, NULL, NULL, '2019-01-05 17:14:57', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(35, 1, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 266, NULL, NULL, '2018-11-29 03:10:29', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(36, 2, 'checkout', 43, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1137, NULL, NULL, '2018-08-27 07:29:07', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(37, 2, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 32, NULL, NULL, '2018-09-16 07:08:24', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(38, 2, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 924, NULL, NULL, '2019-03-11 08:16:55', '2019-06-05 07:29:08', NULL, NULL, NULL, NULL, NULL),
(39, 1, 'checkout', 17, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 185, NULL, NULL, '2018-08-13 20:39:00', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(40, 2, 'checkout', 18, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 415, NULL, NULL, '2018-11-19 19:40:49', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(41, 2, 'checkout', 35, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 273, NULL, NULL, '2018-12-08 12:46:35', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(42, 1, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 896, NULL, NULL, '2018-10-10 01:40:58', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(43, 2, 'checkout', 20, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 334, NULL, NULL, '2018-08-30 05:36:58', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(44, 2, 'checkout', 37, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 395, NULL, NULL, '2019-04-08 03:39:50', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(45, 1, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 746, NULL, NULL, '2019-01-02 10:08:22', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(46, 2, 'checkout', 54, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 39, NULL, NULL, '2018-07-08 19:32:35', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(47, 1, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 761, NULL, NULL, '2019-03-08 10:12:56', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(48, 2, 'checkout', 20, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 747, NULL, NULL, '2018-09-22 11:58:44', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(49, 2, 'checkout', 22, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 816, NULL, NULL, '2019-05-08 14:59:29', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(50, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 239, NULL, NULL, '2019-05-23 12:04:09', '2019-06-05 07:29:09', NULL, NULL, NULL, NULL, NULL),
(51, 2, 'checkout', 49, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 275, NULL, NULL, '2019-01-12 05:34:00', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(52, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1175, NULL, NULL, '2019-05-30 15:21:31', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(53, 1, 'checkout', 51, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1339, NULL, NULL, '2019-01-04 00:20:21', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(54, 2, 'checkout', 32, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 422, NULL, NULL, '2018-11-13 17:42:25', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(55, 2, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 754, NULL, NULL, '2019-01-12 06:28:50', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(56, 1, 'checkout', 51, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 913, NULL, NULL, '2019-04-04 18:29:44', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(57, 1, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 381, NULL, NULL, '2018-10-10 07:00:17', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(58, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 36, NULL, NULL, '2018-10-06 13:28:09', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(59, 1, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 671, NULL, NULL, '2018-11-26 00:35:59', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(60, 1, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1119, NULL, NULL, '2019-03-10 02:53:39', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(61, 1, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 12, NULL, NULL, '2019-02-11 13:50:34', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(62, 1, 'checkout', 52, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 258, NULL, NULL, '2018-12-12 17:52:22', '2019-06-05 07:29:10', NULL, NULL, NULL, NULL, NULL),
(63, 1, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 492, NULL, NULL, '2019-02-09 06:41:00', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(64, 2, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 972, NULL, NULL, '2019-05-02 11:34:16', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(65, 2, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1320, NULL, NULL, '2019-01-07 19:16:09', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(66, 1, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 806, NULL, NULL, '2019-03-23 13:26:38', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(67, 2, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 631, NULL, NULL, '2018-06-06 10:23:52', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(68, 1, 'checkout', 37, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 684, NULL, NULL, '2019-05-28 16:22:19', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(69, 2, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 858, NULL, NULL, '2018-07-10 01:51:57', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(70, 2, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 124, NULL, NULL, '2019-01-08 15:42:47', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(71, 1, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 535, NULL, NULL, '2018-09-10 10:53:58', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(72, 1, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 769, NULL, NULL, '2018-08-18 08:06:32', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(73, 2, 'checkout', 11, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1171, NULL, NULL, '2018-09-05 16:03:52', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(74, 1, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 562, NULL, NULL, '2018-12-04 14:44:44', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(75, 1, 'checkout', 43, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 539, NULL, NULL, '2019-04-14 14:50:42', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(76, 1, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 144, NULL, NULL, '2018-12-25 11:40:02', '2019-06-05 07:29:11', NULL, NULL, NULL, NULL, NULL),
(77, 2, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1350, NULL, NULL, '2019-02-26 07:10:04', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(78, 2, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1237, NULL, NULL, '2018-09-27 15:53:15', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(79, 2, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 346, NULL, NULL, '2018-10-06 22:01:31', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(80, 1, 'checkout', 12, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 232, NULL, NULL, '2018-09-20 06:50:11', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(81, 1, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 893, NULL, NULL, '2019-04-20 23:40:28', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(82, 2, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 65, NULL, NULL, '2018-12-27 12:06:19', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(83, 2, 'checkout', 23, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 202, NULL, NULL, '2018-10-01 19:19:40', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(84, 1, 'checkout', 11, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 494, NULL, NULL, '2019-04-17 04:42:22', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(85, 1, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 489, NULL, NULL, '2018-07-21 15:31:02', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(86, 2, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 149, NULL, NULL, '2019-02-12 01:14:31', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(87, 1, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1200, NULL, NULL, '2018-08-22 11:23:46', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(88, 2, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1279, NULL, NULL, '2018-09-13 05:13:01', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(89, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 659, NULL, NULL, '2019-03-08 17:59:33', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(90, 2, 'checkout', 54, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1166, NULL, NULL, '2019-03-17 01:45:17', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(91, 2, 'checkout', 35, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 325, NULL, NULL, '2019-01-23 14:58:37', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(92, 1, 'checkout', 55, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1242, NULL, NULL, '2019-04-17 03:59:34', '2019-06-05 07:29:12', NULL, NULL, NULL, NULL, NULL),
(93, 2, 'checkout', 57, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 62, NULL, NULL, '2018-07-21 23:50:05', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(94, 2, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 259, NULL, NULL, '2018-06-28 13:30:16', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(95, 1, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 289, NULL, NULL, '2019-02-19 08:53:52', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(96, 1, 'checkout', 55, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 606, NULL, NULL, '2019-06-01 19:24:33', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(97, 1, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 71, NULL, NULL, '2019-02-11 08:26:10', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(98, 1, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 388, NULL, NULL, '2019-02-10 01:48:18', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(99, 1, 'checkout', 17, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1208, NULL, NULL, '2018-06-29 09:22:40', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(100, 1, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1262, NULL, NULL, '2019-04-28 20:47:45', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(101, 2, 'checkout', 8, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 900, NULL, NULL, '2018-06-10 00:09:44', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(102, 2, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 67, NULL, NULL, '2018-06-06 13:51:58', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(103, 2, 'checkout', 22, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 68, NULL, NULL, '2018-07-29 10:03:41', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(104, 2, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1210, NULL, NULL, '2019-05-14 17:32:41', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(105, 2, 'checkout', 18, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 169, NULL, NULL, '2018-09-26 21:30:18', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(106, 2, 'checkout', 57, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 368, NULL, NULL, '2018-10-25 22:16:50', '2019-06-05 07:29:13', NULL, NULL, NULL, NULL, NULL),
(107, 1, 'checkout', 52, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 729, NULL, NULL, '2018-06-29 10:51:28', '2019-06-05 07:29:14', NULL, NULL, NULL, NULL, NULL),
(108, 2, 'checkout', 27, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 866, NULL, NULL, '2018-07-11 21:26:35', '2019-06-05 07:29:14', NULL, NULL, NULL, NULL, NULL),
(109, 2, 'checkout', 32, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 798, NULL, NULL, '2019-03-30 16:34:14', '2019-06-05 07:29:14', NULL, NULL, NULL, NULL, NULL),
(110, 2, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 450, NULL, NULL, '2018-12-05 06:49:20', '2019-06-05 07:29:14', NULL, NULL, NULL, NULL, NULL),
(111, 2, 'checkout', 48, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 865, NULL, NULL, '2018-08-19 11:34:13', '2019-06-05 07:29:14', NULL, NULL, NULL, NULL, NULL),
(112, 2, 'checkout', 1, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 2, NULL, NULL, '2019-02-13 15:49:40', '2019-06-05 07:29:14', NULL, NULL, NULL, NULL, NULL),
(113, 2, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 568, NULL, NULL, '2018-09-18 05:32:02', '2019-06-05 07:29:14', NULL, NULL, NULL, NULL, NULL),
(114, 2, 'checkout', 7, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 938, NULL, NULL, '2018-07-04 18:03:42', '2019-06-05 07:29:14', NULL, NULL, NULL, NULL, NULL),
(115, 1, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 383, NULL, NULL, '2019-01-03 12:04:36', '2019-06-05 07:29:14', NULL, NULL, NULL, NULL, NULL),
(116, 2, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 139, NULL, NULL, '2019-04-23 19:48:22', '2019-06-05 07:29:14', NULL, NULL, NULL, NULL, NULL),
(117, 2, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1204, NULL, NULL, '2018-11-20 07:21:24', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(118, 2, 'checkout', 32, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1295, NULL, NULL, '2018-08-03 12:06:21', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(119, 2, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 262, NULL, NULL, '2018-06-23 22:47:41', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(120, 1, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1277, NULL, NULL, '2019-01-25 07:52:23', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(121, 1, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 104, NULL, NULL, '2018-09-24 23:56:21', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(122, 2, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 717, NULL, NULL, '2018-06-25 19:31:51', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(123, 1, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1331, NULL, NULL, '2018-11-14 23:29:43', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(124, 1, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1328, NULL, NULL, '2019-04-25 17:28:24', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(125, 1, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 934, NULL, NULL, '2018-07-03 03:22:01', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(126, 2, 'checkout', 46, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 779, NULL, NULL, '2019-05-14 14:56:09', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(127, 2, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 953, NULL, NULL, '2018-09-25 12:10:33', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(128, 1, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1168, NULL, NULL, '2019-05-06 11:49:35', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(129, 2, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 271, NULL, NULL, '2018-07-19 09:35:36', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(130, 2, 'checkout', 18, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1213, NULL, NULL, '2019-01-31 03:32:45', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(131, 1, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 176, NULL, NULL, '2018-09-26 04:07:13', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(132, 2, 'checkout', 49, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 982, NULL, NULL, '2018-07-15 09:39:20', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(133, 2, 'checkout', 21, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 526, NULL, NULL, '2018-10-03 10:45:28', '2019-06-05 07:29:15', NULL, NULL, NULL, NULL, NULL),
(134, 2, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 523, NULL, NULL, '2018-10-06 05:15:02', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(135, 1, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 198, NULL, NULL, '2018-11-25 22:26:27', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(136, 2, 'checkout', 55, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 790, NULL, NULL, '2019-03-13 22:45:34', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(137, 2, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 910, NULL, NULL, '2018-09-09 23:40:46', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(138, 1, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 35, NULL, NULL, '2019-05-20 05:08:35', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(139, 2, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 655, NULL, NULL, '2019-03-28 01:15:40', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(140, 2, 'checkout', 36, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 695, NULL, NULL, '2018-09-07 17:32:59', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(141, 2, 'checkout', 39, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 720, NULL, NULL, '2019-01-11 21:53:38', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(142, 2, 'checkout', 43, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 474, NULL, NULL, '2019-04-16 15:17:18', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(143, 2, 'checkout', 54, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 705, NULL, NULL, '2019-03-25 00:16:44', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(144, 2, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1264, NULL, NULL, '2018-11-29 15:07:55', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(145, 1, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1340, NULL, NULL, '2018-10-09 11:25:55', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(146, 2, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 643, NULL, NULL, '2018-08-31 07:35:20', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(147, 1, 'checkout', 22, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 58, NULL, NULL, '2019-04-22 15:37:20', '2019-06-05 07:29:16', NULL, NULL, NULL, NULL, NULL),
(148, 2, 'checkout', 46, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 962, NULL, NULL, '2019-01-14 17:27:52', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(149, 1, 'checkout', 30, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1259, NULL, NULL, '2019-01-16 17:22:44', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(150, 1, 'checkout', 49, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 389, NULL, NULL, '2018-11-28 21:34:54', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(151, 1, 'checkout', 14, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 304, NULL, NULL, '2018-10-03 19:44:17', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(152, 1, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 178, NULL, NULL, '2018-09-03 15:58:07', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(153, 2, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 566, NULL, NULL, '2018-08-28 13:21:12', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(154, 1, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 635, NULL, NULL, '2018-09-30 21:10:33', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(155, 1, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 672, NULL, NULL, '2019-03-22 22:26:54', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(156, 1, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1285, NULL, NULL, '2018-06-14 10:19:12', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(157, 1, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 122, NULL, NULL, '2018-10-03 19:02:06', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(158, 2, 'checkout', 51, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 403, NULL, NULL, '2018-08-30 18:51:14', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(159, 1, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 78, NULL, NULL, '2018-09-20 18:20:22', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(160, 1, 'checkout', 48, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 589, NULL, NULL, '2019-06-01 04:43:08', '2019-06-05 07:29:17', NULL, NULL, NULL, NULL, NULL),
(161, 2, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 215, NULL, NULL, '2019-03-05 21:26:34', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(162, 1, 'checkout', 20, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 689, NULL, NULL, '2018-11-23 15:05:21', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(163, 2, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1103, NULL, NULL, '2019-03-14 14:33:49', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(164, 2, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 309, NULL, NULL, '2018-10-10 09:20:09', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(165, 1, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 703, NULL, NULL, '2018-11-17 06:00:46', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(166, 2, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 721, NULL, NULL, '2018-08-06 11:49:03', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(167, 2, 'checkout', 30, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1294, NULL, NULL, '2018-07-04 15:02:02', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(168, 2, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 238, NULL, NULL, '2018-10-17 03:07:13', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(169, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 146, NULL, NULL, '2019-03-04 12:18:21', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(170, 2, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 81, NULL, NULL, '2019-05-31 23:13:18', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(171, 2, 'checkout', 14, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 13, NULL, NULL, '2019-03-04 17:47:28', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(172, 2, 'checkout', 35, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 211, NULL, NULL, '2019-05-24 15:16:34', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(173, 1, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 970, NULL, NULL, '2019-03-25 21:51:00', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(174, 2, 'checkout', 42, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 353, NULL, NULL, '2019-05-06 12:31:18', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(175, 1, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1212, NULL, NULL, '2018-07-07 05:30:19', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(176, 2, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 645, NULL, NULL, '2018-09-10 20:17:54', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(177, 1, 'checkout', 56, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 399, NULL, NULL, '2018-12-02 08:54:18', '2019-06-05 07:29:18', NULL, NULL, NULL, NULL, NULL),
(178, 2, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1158, NULL, NULL, '2018-12-04 05:32:01', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(179, 2, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 828, NULL, NULL, '2018-07-25 19:54:40', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(180, 2, 'checkout', 57, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1365, NULL, NULL, '2019-04-11 19:55:33', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(181, 2, 'checkout', 15, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1254, NULL, NULL, '2019-02-11 02:55:29', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(182, 1, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 546, NULL, NULL, '2019-03-30 05:41:45', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(183, 2, 'checkout', 53, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1249, NULL, NULL, '2018-09-16 17:13:40', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(184, 2, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1205, NULL, NULL, '2018-12-16 18:11:36', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(185, 1, 'checkout', 42, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 733, NULL, NULL, '2018-11-13 17:31:03', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(186, 1, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 966, NULL, NULL, '2019-01-12 17:39:01', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(187, 1, 'checkout', 11, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1318, NULL, NULL, '2019-06-01 07:04:34', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(188, 1, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 434, NULL, NULL, '2019-06-01 20:20:06', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(189, 1, 'checkout', 51, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 213, NULL, NULL, '2018-09-14 16:12:19', '2019-06-05 07:29:19', NULL, NULL, NULL, NULL, NULL),
(190, 1, 'checkout', 32, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1146, NULL, NULL, '2019-04-24 05:41:04', '2019-06-05 07:29:20', NULL, NULL, NULL, NULL, NULL),
(191, 2, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 686, NULL, NULL, '2019-02-20 02:12:38', '2019-06-05 07:29:20', NULL, NULL, NULL, NULL, NULL),
(192, 2, 'checkout', 40, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 698, NULL, NULL, '2019-03-05 07:40:56', '2019-06-05 07:29:20', NULL, NULL, NULL, NULL, NULL),
(193, 1, 'checkout', 48, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 378, NULL, NULL, '2018-10-16 11:29:52', '2019-06-05 07:29:20', NULL, NULL, NULL, NULL, NULL),
(194, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 214, NULL, NULL, '2018-11-07 03:32:24', '2019-06-05 07:29:20', NULL, NULL, NULL, NULL, NULL),
(195, 1, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 187, NULL, NULL, '2019-04-13 18:28:18', '2019-06-05 07:29:20', NULL, NULL, NULL, NULL, NULL),
(196, 1, 'checkout', 7, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 263, NULL, NULL, '2018-12-05 01:00:12', '2019-06-05 07:29:21', NULL, NULL, NULL, NULL, NULL),
(197, 2, 'checkout', 51, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 480, NULL, NULL, '2018-12-22 04:42:48', '2019-06-05 07:29:23', NULL, NULL, NULL, NULL, NULL),
(198, 2, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1291, NULL, NULL, '2019-03-30 03:57:49', '2019-06-05 07:29:24', NULL, NULL, NULL, NULL, NULL),
(199, 1, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 800, NULL, NULL, '2018-11-15 03:55:53', '2019-06-05 07:29:24', NULL, NULL, NULL, NULL, NULL),
(200, 1, 'checkout', 42, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1145, NULL, NULL, '2019-01-27 20:49:28', '2019-06-05 07:29:24', NULL, NULL, NULL, NULL, NULL),
(201, 2, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 840, NULL, NULL, '2018-07-17 12:30:14', '2019-06-05 07:29:24', NULL, NULL, NULL, NULL, NULL),
(202, 1, 'checkout', 47, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 513, NULL, NULL, '2018-08-05 05:45:51', '2019-06-05 07:29:24', NULL, NULL, NULL, NULL, NULL),
(203, 2, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1107, NULL, NULL, '2019-06-03 15:55:53', '2019-06-05 07:29:24', NULL, NULL, NULL, NULL, NULL),
(204, 2, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 34, NULL, NULL, '2018-08-16 00:32:06', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(205, 2, 'checkout', 49, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1160, NULL, NULL, '2019-05-23 08:16:11', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(206, 2, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 894, NULL, NULL, '2018-07-20 17:05:45', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(207, 1, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 956, NULL, NULL, '2019-02-10 06:37:18', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(208, 1, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 350, NULL, NULL, '2018-09-22 13:26:22', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(209, 2, 'checkout', 19, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1207, NULL, NULL, '2018-07-31 00:45:56', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(210, 1, 'checkout', 30, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 373, NULL, NULL, '2019-03-03 00:59:21', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(211, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1188, NULL, NULL, '2018-08-12 19:16:21', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(212, 1, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 298, NULL, NULL, '2019-01-06 23:03:17', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(213, 2, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 977, NULL, NULL, '2019-03-14 13:43:44', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(214, 2, 'checkout', 55, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 465, NULL, NULL, '2018-10-28 12:39:49', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(215, 1, 'checkout', 43, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 520, NULL, NULL, '2018-10-02 20:39:58', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(216, 2, 'checkout', 43, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 909, NULL, NULL, '2018-11-14 11:45:31', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(217, 2, 'checkout', 57, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 458, NULL, NULL, '2018-08-23 19:37:07', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(218, 2, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1128, NULL, NULL, '2018-10-06 18:15:50', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(219, 1, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1135, NULL, NULL, '2019-03-20 06:58:15', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(220, 2, 'checkout', 30, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 975, NULL, NULL, '2018-06-15 06:13:38', '2019-06-05 07:29:25', NULL, NULL, NULL, NULL, NULL),
(221, 1, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 678, NULL, NULL, '2019-01-09 04:35:00', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(222, 2, 'checkout', 51, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 954, NULL, NULL, '2019-05-26 17:10:01', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(223, 1, 'checkout', 18, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 989, NULL, NULL, '2018-10-18 02:11:37', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(224, 1, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 789, NULL, NULL, '2018-09-12 07:40:40', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(225, 2, 'checkout', 5, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 819, NULL, NULL, '2019-02-20 14:23:59', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(226, 1, 'checkout', 35, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 642, NULL, NULL, '2018-06-18 07:39:05', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(227, 1, 'checkout', 17, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 506, NULL, NULL, '2019-03-08 03:44:51', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(228, 2, 'checkout', 32, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 855, NULL, NULL, '2018-07-10 05:05:32', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(229, 2, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 268, NULL, NULL, '2019-03-18 14:22:46', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(230, 1, 'checkout', 18, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 356, NULL, NULL, '2018-09-04 21:59:25', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(231, 2, 'checkout', 22, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 102, NULL, NULL, '2018-10-28 06:02:59', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(232, 2, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 820, NULL, NULL, '2018-10-20 18:10:31', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(233, 1, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 575, NULL, NULL, '2018-10-20 19:35:55', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(234, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 216, NULL, NULL, '2018-10-04 02:36:19', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(235, 2, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 413, NULL, NULL, '2018-06-24 10:18:15', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(236, 2, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 608, NULL, NULL, '2019-06-04 05:50:51', '2019-06-05 07:29:26', NULL, NULL, NULL, NULL, NULL),
(237, 2, 'checkout', 8, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 6, NULL, NULL, '2018-12-22 00:32:05', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(238, 2, 'checkout', 37, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 854, NULL, NULL, '2019-02-05 10:49:39', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(239, 1, 'checkout', 23, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 681, NULL, NULL, '2018-10-07 15:34:03', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(240, 2, 'checkout', 27, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 576, NULL, NULL, '2019-03-29 20:51:05', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(241, 2, 'checkout', 49, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 804, NULL, NULL, '2019-04-27 18:20:10', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(242, 2, 'checkout', 20, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 931, NULL, NULL, '2019-01-31 15:46:33', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(243, 1, 'checkout', 40, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 33, NULL, NULL, '2019-05-09 14:39:35', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(244, 2, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 685, NULL, NULL, '2018-10-28 14:44:14', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(245, 2, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1369, NULL, NULL, '2018-08-01 14:08:52', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(246, 2, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 844, NULL, NULL, '2019-05-19 22:14:48', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(247, 1, 'checkout', 31, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 256, NULL, NULL, '2019-04-13 22:01:55', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(248, 2, 'checkout', 12, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 767, NULL, NULL, '2018-07-01 12:33:18', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(249, 1, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 45, NULL, NULL, '2018-10-15 15:53:04', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(250, 1, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 442, NULL, NULL, '2019-04-18 13:19:34', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(251, 1, 'checkout', 44, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 128, NULL, NULL, '2019-01-21 05:42:33', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(252, 1, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 751, NULL, NULL, '2018-10-05 16:24:54', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(253, 1, 'checkout', 24, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 114, NULL, NULL, '2018-06-19 00:43:24', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(254, 2, 'checkout', 52, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 905, NULL, NULL, '2018-08-30 11:48:58', '2019-06-05 07:29:27', NULL, NULL, NULL, NULL, NULL),
(255, 2, 'checkout', 10, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1332, NULL, NULL, '2019-05-29 07:48:04', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(256, 2, 'checkout', 16, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1104, NULL, NULL, '2018-06-28 14:05:51', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(257, 2, 'checkout', 32, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 890, NULL, NULL, '2019-01-27 15:38:37', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(258, 2, 'checkout', 29, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 283, NULL, NULL, '2018-12-19 01:12:37', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(259, 2, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 955, NULL, NULL, '2018-07-29 23:12:52', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(260, 2, 'checkout', 7, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1247, NULL, NULL, '2018-11-01 07:40:19', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(261, 2, 'checkout', 6, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 372, NULL, NULL, '2019-04-23 23:37:46', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(262, 2, 'checkout', 22, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 773, NULL, NULL, '2019-01-16 00:04:45', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(263, 1, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 774, NULL, NULL, '2018-12-08 16:57:27', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(264, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 848, NULL, NULL, '2019-04-13 10:27:19', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(265, 2, 'checkout', 50, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 296, NULL, NULL, '2019-04-07 14:03:52', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(266, 2, 'checkout', 32, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 180, NULL, NULL, '2019-03-09 14:34:19', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(267, 1, 'checkout', 8, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 538, NULL, NULL, '2018-10-10 02:05:06', '2019-06-05 07:29:28', NULL, NULL, NULL, NULL, NULL),
(268, 1, 'checkout', 40, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 301, NULL, NULL, '2018-11-12 06:02:50', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(269, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 544, NULL, NULL, '2019-03-09 17:15:11', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(270, 1, 'checkout', 55, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 976, NULL, NULL, '2018-10-24 10:43:58', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(271, 1, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 449, NULL, NULL, '2018-08-11 22:09:59', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(272, 1, 'checkout', 38, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1253, NULL, NULL, '2018-11-17 13:56:36', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(273, 1, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 611, NULL, NULL, '2018-09-26 18:40:54', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(274, 2, 'checkout', 29, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 629, NULL, NULL, '2019-05-28 01:07:44', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(275, 2, 'checkout', 45, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1229, NULL, NULL, '2018-07-01 20:54:30', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(276, 2, 'checkout', 33, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 940, NULL, NULL, '2019-01-30 01:01:07', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(277, 1, 'checkout', 18, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 897, NULL, NULL, '2019-05-16 10:41:38', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(278, 2, 'checkout', 8, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 505, NULL, NULL, '2018-07-25 14:27:43', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(279, 2, 'checkout', 35, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 918, NULL, NULL, '2018-09-04 07:48:58', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `action_logs` (`id`, `user_id`, `action_type`, `target_id`, `target_type`, `location_id`, `note`, `filename`, `item_type`, `item_id`, `expected_checkin`, `accepted_id`, `created_at`, `updated_at`, `deleted_at`, `thread_id`, `company_id`, `accept_signature`, `log_meta`) VALUES
(280, 2, 'checkout', 7, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1287, NULL, NULL, '2018-06-25 17:39:08', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(281, 2, 'checkout', 14, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 784, NULL, NULL, '2018-08-03 04:56:28', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(282, 2, 'checkout', 35, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 417, NULL, NULL, '2019-03-31 14:38:19', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(283, 1, 'checkout', 46, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 160, NULL, NULL, '2018-12-07 00:13:39', '2019-06-05 07:29:29', NULL, NULL, NULL, NULL, NULL),
(284, 2, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 551, NULL, NULL, '2019-05-27 09:34:31', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(285, 1, 'checkout', 26, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 54, NULL, NULL, '2019-04-18 01:19:29', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(286, 1, 'checkout', 25, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 433, NULL, NULL, '2019-01-08 18:00:21', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(287, 2, 'checkout', 28, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 788, NULL, NULL, '2018-07-13 11:29:42', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(288, 2, 'checkout', 58, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 101, NULL, NULL, '2018-10-03 13:53:40', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(289, 2, 'checkout', 2, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 706, NULL, NULL, '2018-10-27 09:25:27', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(290, 1, 'checkout', 4, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 548, NULL, NULL, '2018-08-18 23:05:31', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(291, 2, 'checkout', 13, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 142, NULL, NULL, '2018-09-28 12:18:57', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(292, 2, 'checkout', 46, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1180, NULL, NULL, '2018-09-25 18:24:20', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(293, 1, 'checkout', 35, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1349, NULL, NULL, '2018-10-28 16:41:53', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(294, 1, 'checkout', 39, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 1323, NULL, NULL, '2019-05-11 17:04:16', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(295, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 335, NULL, NULL, '2018-12-10 16:37:58', '2019-06-05 07:29:30', NULL, NULL, NULL, NULL, NULL),
(296, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 277, NULL, NULL, '2018-09-03 17:44:13', '2019-06-05 07:29:31', NULL, NULL, NULL, NULL, NULL),
(297, 1, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 593, NULL, NULL, '2018-10-10 14:10:18', '2019-06-05 07:29:31', NULL, NULL, NULL, NULL, NULL),
(298, 2, 'checkout', 9, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 964, NULL, NULL, '2018-11-09 05:16:19', '2019-06-05 07:29:31', NULL, NULL, NULL, NULL, NULL),
(299, 2, 'checkout', 34, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 472, NULL, NULL, '2018-09-08 14:51:18', '2019-06-05 07:29:31', NULL, NULL, NULL, NULL, NULL),
(300, 2, 'checkout', 3, 'App\\Models\\User', NULL, NULL, NULL, 'App\\Models\\Asset', 194, NULL, NULL, '2018-12-27 17:28:43', '2019-06-05 07:29:31', NULL, NULL, NULL, NULL, NULL),
(301, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 815, NULL, NULL, '2019-03-28 02:24:19', '2019-06-05 07:29:52', NULL, NULL, NULL, NULL, NULL),
(302, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 320, NULL, NULL, '2019-02-04 13:25:45', '2019-06-05 07:29:52', NULL, NULL, NULL, NULL, NULL),
(303, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1226, NULL, NULL, '2018-08-21 04:09:43', '2019-06-05 07:29:52', NULL, NULL, NULL, NULL, NULL),
(304, 2, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 615, NULL, NULL, '2019-06-02 12:54:55', '2019-06-05 07:29:52', NULL, NULL, NULL, NULL, NULL),
(305, 1, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 957, NULL, NULL, '2019-04-24 22:33:55', '2019-06-05 07:29:52', NULL, NULL, NULL, NULL, NULL),
(306, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1101, NULL, NULL, '2018-07-29 05:35:04', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(307, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 916, NULL, NULL, '2019-04-12 18:30:12', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(308, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1131, NULL, NULL, '2019-04-28 07:40:03', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(309, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1299, NULL, NULL, '2019-05-21 06:58:44', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(310, 2, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 42, NULL, NULL, '2018-08-30 05:29:47', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(311, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 675, NULL, NULL, '2018-12-28 22:59:45', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(312, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1324, NULL, NULL, '2019-04-05 17:52:20', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(313, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 549, NULL, NULL, '2019-02-18 23:43:44', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(314, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 367, NULL, NULL, '2018-12-24 22:45:48', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(315, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1347, NULL, NULL, '2019-01-14 12:18:51', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(316, 2, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 851, NULL, NULL, '2018-12-10 15:41:01', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(317, 1, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 601, NULL, NULL, '2019-05-04 02:02:00', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(318, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 500, NULL, NULL, '2018-06-27 01:43:55', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(319, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 756, NULL, NULL, '2018-10-13 17:08:38', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(320, 2, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1236, NULL, NULL, '2019-03-21 02:38:48', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(321, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 380, NULL, NULL, '2019-04-03 01:32:54', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(322, 1, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 279, NULL, NULL, '2018-12-09 06:28:36', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(323, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1197, NULL, NULL, '2018-10-05 10:22:50', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(324, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 107, NULL, NULL, '2018-10-22 18:47:48', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(325, 2, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1144, NULL, NULL, '2019-05-13 04:33:22', '2019-06-05 07:29:53', NULL, NULL, NULL, NULL, NULL),
(326, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 574, NULL, NULL, '2018-07-27 17:00:23', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(327, 2, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1105, NULL, NULL, '2018-09-13 19:34:05', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(328, 1, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 390, NULL, NULL, '2018-10-21 04:00:43', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(329, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 906, NULL, NULL, '2019-04-04 18:07:30', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(330, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 652, NULL, NULL, '2019-05-19 10:30:16', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(331, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 76, NULL, NULL, '2018-07-01 20:38:56', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(332, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 532, NULL, NULL, '2019-03-03 06:26:32', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(333, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 28, NULL, NULL, '2019-03-14 09:33:56', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(334, 1, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 220, NULL, NULL, '2018-11-26 06:52:35', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(335, 1, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 881, NULL, NULL, '2019-04-24 04:28:28', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(336, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 785, NULL, NULL, '2018-11-04 09:23:45', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(337, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 490, NULL, NULL, '2018-09-10 17:12:12', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(338, 2, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1363, NULL, NULL, '2018-10-24 17:07:11', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(339, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 856, NULL, NULL, '2018-12-06 03:50:46', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(340, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 627, NULL, NULL, '2019-02-07 09:10:48', '2019-06-05 07:29:54', NULL, NULL, NULL, NULL, NULL),
(341, 1, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 348, NULL, NULL, '2018-06-24 11:40:37', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(342, 2, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1322, NULL, NULL, '2019-01-29 21:33:50', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(343, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 572, NULL, NULL, '2019-01-11 13:25:56', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(344, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 233, NULL, NULL, '2018-12-05 22:09:16', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(345, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 709, NULL, NULL, '2018-10-22 01:13:00', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(346, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 961, NULL, NULL, '2019-04-12 20:28:57', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(347, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 582, NULL, NULL, '2019-02-07 11:24:28', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(348, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 859, NULL, NULL, '2018-10-21 14:42:07', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(349, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 963, NULL, NULL, '2018-08-28 06:16:58', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(350, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 140, NULL, NULL, '2018-07-28 19:16:42', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(351, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 244, NULL, NULL, '2018-07-18 07:25:01', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(352, 2, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 540, NULL, NULL, '2018-12-03 19:07:33', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(353, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 949, NULL, NULL, '2018-08-04 23:07:08', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(354, 2, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1121, NULL, NULL, '2018-10-26 11:43:20', '2019-06-05 07:29:55', NULL, NULL, NULL, NULL, NULL),
(355, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 996, NULL, NULL, '2018-10-02 18:28:23', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(356, 2, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 488, NULL, NULL, '2018-07-09 01:35:47', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(357, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 254, NULL, NULL, '2019-01-06 01:21:24', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(358, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 349, NULL, NULL, '2018-09-04 14:22:21', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(359, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1298, NULL, NULL, '2018-07-05 12:19:21', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(360, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 598, NULL, NULL, '2018-12-03 03:04:27', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(361, 1, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 875, NULL, NULL, '2018-06-19 06:31:31', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(362, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1126, NULL, NULL, '2018-11-15 17:48:45', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(363, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 295, NULL, NULL, '2018-09-28 11:01:29', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(364, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1192, NULL, NULL, '2018-10-10 15:58:36', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(365, 1, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 310, NULL, NULL, '2018-11-22 07:09:51', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(366, 2, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 43, NULL, NULL, '2019-02-05 19:13:17', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(367, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 864, NULL, NULL, '2018-06-06 13:45:15', '2019-06-05 07:29:56', NULL, NULL, NULL, NULL, NULL),
(368, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 862, NULL, NULL, '2019-02-08 17:24:58', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(369, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1364, NULL, NULL, '2019-02-13 07:40:41', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(370, 1, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 300, NULL, NULL, '2019-02-28 04:43:41', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(371, 1, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 23, NULL, NULL, '2019-03-27 17:36:06', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(372, 1, 'checkout', 8, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 297, NULL, NULL, '2018-08-03 15:10:03', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(373, 1, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1151, NULL, NULL, '2019-02-24 21:51:06', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(374, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 796, NULL, NULL, '2018-09-21 19:14:57', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(375, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 728, NULL, NULL, '2019-04-24 16:26:23', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(376, 1, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 248, NULL, NULL, '2018-10-07 22:06:50', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(377, 2, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 847, NULL, NULL, '2018-11-21 11:56:31', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(378, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1176, NULL, NULL, '2019-01-28 22:11:13', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(379, 2, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 805, NULL, NULL, '2019-02-01 11:23:59', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(380, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1352, NULL, NULL, '2019-04-26 00:02:31', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(381, 1, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 586, NULL, NULL, '2019-03-21 09:13:41', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(382, 1, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1260, NULL, NULL, '2019-01-10 03:16:10', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(383, 1, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 518, NULL, NULL, '2018-09-10 11:35:34', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(384, 2, 'checkout', 6, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 467, NULL, NULL, '2019-01-28 02:11:12', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(385, 1, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 735, NULL, NULL, '2018-12-03 19:22:26', '2019-06-05 07:29:57', NULL, NULL, NULL, NULL, NULL),
(386, 2, 'checkout', 4, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 376, NULL, NULL, '2018-07-05 07:43:46', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(387, 2, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 846, NULL, NULL, '2019-04-29 01:20:02', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(388, 1, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 495, NULL, NULL, '2018-11-25 14:36:53', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(389, 2, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 841, NULL, NULL, '2019-01-30 03:11:39', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(390, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 208, NULL, NULL, '2018-12-07 23:33:00', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(391, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 766, NULL, NULL, '2019-02-17 20:16:27', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(392, 2, 'checkout', 1, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1106, NULL, NULL, '2019-05-17 12:00:43', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(393, 2, 'checkout', 2, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 528, NULL, NULL, '2019-02-13 15:41:07', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(394, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 619, NULL, NULL, '2019-04-25 15:47:54', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(395, 1, 'checkout', 5, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 409, NULL, NULL, '2018-12-30 06:20:44', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(396, 1, 'checkout', 7, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1335, NULL, NULL, '2018-07-24 12:11:40', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(397, 2, 'checkout', 9, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1201, NULL, NULL, '2019-05-21 05:28:53', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(398, 1, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 218, NULL, NULL, '2018-08-01 03:28:26', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(399, 2, 'checkout', 3, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 802, NULL, NULL, '2018-10-20 11:12:24', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(400, 2, 'checkout', 10, 'App\\Models\\Location', NULL, NULL, NULL, 'App\\Models\\Asset', 1130, NULL, NULL, '2018-08-07 07:01:08', '2019-06-05 07:29:58', NULL, NULL, NULL, NULL, NULL),
(401, 1, 'create', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1374, NULL, NULL, '2019-06-05 08:23:17', '2019-06-05 08:23:17', NULL, NULL, 7, NULL, NULL),
(402, 1, 'update', NULL, NULL, NULL, NULL, NULL, 'App\\Models\\Asset', 1374, NULL, NULL, '2019-06-05 08:24:18', '2019-06-05 08:24:18', NULL, NULL, 7, NULL, '{\"_snipeit_rating_5\":{\"old\":\"\\u2b50\\u2b50\\u2b50\\u2b50\",\"new\":\"\\u2b50\\u2b50\\u2b50\"}}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `assets`
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
  `_snipeit_rating_5` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `assets`
--

INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_rating_5`) VALUES
(1, NULL, '323285181', 1, '03db8516-b3ea-3b6e-add4-845e8065f7c0', '2019-05-10', '2266.18', '41174470', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:17', '2019-06-05 07:30:19', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(2, NULL, '1484483931', 1, '73d77220-d6b4-36bf-a0f0-d630d12e9322', '2019-05-06', '1618.72', '22035602', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:17', '2019-06-05 07:32:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(3, NULL, '991151804', 1, '53fb4036-2ab1-3497-a6ee-83c96ca9ea9e', '2018-08-08', '427.00', '12960905', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:17', '2019-06-05 07:30:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(4, NULL, '1173683165', 1, 'acc60494-06fe-3f8d-87d8-19739fd28ceb', '2019-04-11', '2522.33', '9107402', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:18', '2019-06-05 07:30:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(5, NULL, '859336263', 1, '5471bb04-8a98-311b-9f17-a31fc9211dc2', '2018-12-10', '1862.80', '42077842', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:18', '2019-06-05 07:30:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(6, NULL, '1198491686', 1, '55fa88d2-42b5-3be2-90ca-4f74d2f139cb', '2018-12-18', '1222.57', '19485260', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:18', '2019-06-05 07:32:45', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(7, NULL, '14644901', 1, '861249ad-04cb-3e04-bef3-81461f55ab65', '2019-04-11', '1436.56', '27205071', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:18', '2019-06-05 07:30:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(8, NULL, '261353255', 1, 'bc67cc19-b807-399b-836d-6039aeb4ada3', '2019-05-13', '759.40', '19579073', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:18', '2019-06-05 07:30:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(9, NULL, '1226580565', 1, '874109ff-219b-3d26-97aa-306a9890bb33', '2018-08-05', '1362.45', '43704074', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:19', '2019-06-05 07:30:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(10, NULL, '835382213', 1, 'b95884db-b25a-3c9b-b9c0-22c1b8905902', '2018-11-09', '2649.07', '4471156', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:19', '2019-06-05 07:30:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(11, NULL, '20764532', 1, '5b385a7d-8245-3b71-95e8-cfc7e5ad30cf', '2018-07-10', '2955.46', '13623290', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:19', '2019-06-05 07:30:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(12, NULL, '1540701444', 1, '56187208-7304-3124-a134-32ac274080c4', '2018-10-16', '1605.08', '26784309', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:19', '2019-06-05 07:32:45', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(13, NULL, '1022161354', 1, 'ffe2f8ad-eece-35fe-afb9-8f6fc82c3d27', '2018-09-17', '1014.29', '23585551', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:20', '2019-06-05 07:28:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(14, NULL, '402777054', 1, 'd0ba0255-82fa-3c1f-86d1-1ff2560c05d3', '2018-06-05', '1301.88', '39051884', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:20', '2019-06-05 07:30:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(15, NULL, '1351502401', 1, '3753ca9d-af89-3f56-8f10-e913eccda39b', '2018-12-14', '450.05', '30213356', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:20', '2019-06-05 07:30:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(16, NULL, '1137029893', 1, 'c3213cb3-760b-3718-8a72-bfe44cbdf869', '2018-12-13', '431.97', '48814665', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:20', '2019-06-05 07:30:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(17, NULL, '132215132', 1, '9d03c34f-0723-3f29-80ac-a4977884b883', '2018-11-24', '1826.39', '38175918', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:20', '2019-06-05 07:30:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(18, NULL, '467528602', 1, '66a31d2c-e8a6-3af0-8a8e-e25a9f41cb09', '2018-08-05', '1932.14', '3164728', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:20', '2019-06-05 07:30:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(19, NULL, '1488404958', 1, 'cd84852d-a843-3e81-baeb-d66d4aa0f6a9', '2018-06-21', '2012.66', '26013928', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:21', '2019-06-05 07:30:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(20, NULL, '267130986', 1, '7cbd6236-12e8-373a-8652-f1d8b320b94b', '2018-12-29', '2794.48', '17783493', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:21', '2019-06-05 07:30:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(21, NULL, '1039959273', 1, '7710fd44-06ca-30f3-85aa-05ccddfc6838', '2018-12-25', '437.99', '6158715', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:21', '2019-06-05 07:30:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(22, NULL, '986121715', 1, '24010c21-1f68-33d9-98c9-b1ddcfdf149c', '2019-05-04', '2118.57', '24456408', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:21', '2019-06-05 07:30:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(23, NULL, '1534189524', 1, '5646faab-8951-3dc7-8b93-b6284d7f88da', '2019-06-04', '2857.84', '41959817', 7, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:22', '2019-06-05 07:29:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(24, NULL, '1260908862', 1, '8cb1a270-057c-3113-940f-901a6116ca57', '2018-09-05', '1900.68', '20349337', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:22', '2019-06-05 07:30:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(25, NULL, '263206299', 1, 'e7762e56-3719-332e-9d7b-96d4ccfcdb73', '2019-06-05', '428.82', '42722385', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:22', '2019-06-05 07:30:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(26, NULL, '1449143990', 1, '91ef7dbd-7618-3e7d-88b4-6112afdc318a', '2019-03-31', '1752.18', '38091790', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:22', '2019-06-05 07:30:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(27, NULL, '575476118', 1, 'a6d67905-82da-30ee-b52d-3f770604cc97', '2019-05-25', '1843.97', '16656801', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:22', '2019-06-05 07:30:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(28, NULL, '943081531', 1, '924f2da6-7715-3e9a-a037-c8391c146c37', '2018-12-21', '2403.42', '49495430', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:23', '2019-06-05 07:29:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(29, NULL, '716148071', 1, 'fe7c28d3-8db6-37f5-847e-3dd61758ac9c', '2019-04-23', '507.55', '40983671', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:23', '2019-06-05 07:30:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(30, NULL, '1390061454', 1, '0ea57674-67b8-3fd5-81c5-6de074f0c7c8', '2019-05-26', '2091.83', '18848569', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:23', '2019-06-05 07:30:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(31, NULL, '1406142389', 1, 'b08e64b9-ac27-33c2-9626-9b46411d2206', '2018-09-05', '2623.86', '26489625', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:23', '2019-06-05 07:30:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(32, NULL, '271775632', 1, 'ddf507e8-f3a1-3986-b705-1143739d3e0f', '2019-01-25', '1951.84', '10851701', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:23', '2019-06-05 07:32:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(33, NULL, '103651842', 1, '3a529abd-16f6-3554-8769-3875c6404049', '2018-09-24', '1207.22', '3165944', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:24', '2019-06-05 07:32:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(34, NULL, '1102139061', 1, 'e78803e9-b5e0-3f17-87f7-3f8da3d1bcc2', '2019-04-06', '1183.14', '47324687', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:24', '2019-06-05 07:28:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(35, NULL, '313001499', 1, 'aaf3b104-35ee-3da9-963a-28f0788e03aa', '2018-07-24', '1712.19', '13030856', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:24', '2019-06-05 07:28:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(36, NULL, '22769007', 1, '931af05c-3536-34e3-9840-a608fc5d04c8', '2018-12-27', '1313.67', '29118595', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:24', '2019-06-05 07:32:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(37, NULL, '203564177', 1, 'ad62d9a9-bd4d-37e1-8cb1-184e309dc414', '2019-01-28', '547.03', '48840678', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:25', '2019-06-05 07:30:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(38, NULL, '630491373', 1, '4e0ee231-bbfc-37df-9fbb-f08f9432c076', '2018-12-13', '2187.51', '35368314', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:25', '2019-06-05 07:30:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(39, NULL, '1151580630', 1, '2f86c575-6597-3987-8dfa-73c9fd891e42', '2019-03-28', '2687.09', '48262496', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:25', '2019-06-05 07:32:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(40, NULL, '525362493', 1, 'a8a7d565-3f98-30a9-8c33-12a42c6647ae', '2018-06-17', '1497.06', '16904309', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:25', '2019-06-05 07:30:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(41, NULL, '938453928', 1, 'b08b6f26-3339-363e-94d6-b6a664f0f116', '2018-08-03', '2923.48', '38207743', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:25', '2019-06-05 07:30:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(42, NULL, '833795887', 1, '08d58c1c-7f3a-33af-87d3-c40cd81dd30f', '2019-03-06', '2629.33', '46791598', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:25', '2019-06-05 07:29:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(43, NULL, '499007454', 1, 'df08c8ee-adaa-38ac-b22a-4494b78b942f', '2018-11-06', '1005.84', '14250731', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:26', '2019-06-05 07:29:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(44, NULL, '168588464', 1, 'f716c401-95c8-33b7-8380-1e2ca074177c', '2018-07-04', '1836.58', '19429282', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:26', '2019-06-05 07:30:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(45, NULL, '604262844', 1, '63fde939-cbd0-3cd3-b2f5-9da6343a750f', '2018-08-11', '846.61', '7329462', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:26', '2019-06-05 07:28:55', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(46, NULL, '52422146', 1, '01724359-7142-3075-83c9-1df0d55635c5', '2018-07-05', '1956.17', '27544419', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:26', '2019-06-05 07:32:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(47, NULL, '1281094055', 1, '14ea1458-211a-3042-8629-5f25e7e9becf', '2018-11-20', '2253.86', '25909293', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:26', '2019-06-05 07:30:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(48, NULL, '314474956', 1, 'f51095d6-584c-311b-8cd2-7c598f7e67ca', '2019-02-25', '2855.89', '19517426', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:27', '2019-06-05 07:30:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(49, NULL, '1483945995', 1, '2388b097-88e1-39cf-af32-fd0a743be239', '2018-07-10', '2829.62', '9692962', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:27', '2019-06-05 07:30:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(50, NULL, '298727913', 1, '6f22b0e2-b257-39e5-9883-b036cf0e1d39', '2018-11-22', '1337.94', '15719857', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:27', '2019-06-05 07:30:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(51, NULL, '866996410', 1, 'ca50a847-338e-39f3-be6a-80c7914a2738', '2019-05-24', '2137.48', '42479495', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:27', '2019-06-05 07:30:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(52, NULL, '140164105', 1, '6a84814a-f0f3-3e8a-b74b-be3fa28d3b07', '2018-06-09', '1382.64', '33551712', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:27', '2019-06-05 07:30:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(53, NULL, '664452351', 1, '7b3d1838-4bc1-3366-8e2a-0eb62425f448', '2018-07-26', '1585.41', '27224730', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:28', '2019-06-05 07:30:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(54, NULL, '35874609', 1, '5e0dc7c9-8fb1-3f58-9f1b-f2b9c604b883', '2018-12-12', '2348.76', '9631957', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:28', '2019-06-05 07:32:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(55, NULL, '579545470', 1, '502ce33f-49d3-3ea2-9592-0fe2449dcdef', '2019-05-19', '590.80', '45458438', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:28', '2019-06-05 07:30:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(56, NULL, '1356886386', 1, '0f21034a-3d9c-3d68-bead-440e0c2210e7', '2019-03-15', '512.08', '10566315', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:28', '2019-06-05 07:30:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(57, NULL, '831889132', 1, 'aa3c36d7-4e35-3a49-942d-fd2d71b17a14', '2019-03-18', '1407.48', '34506794', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:29', '2019-06-05 07:30:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(58, NULL, '1243502967', 1, '1df96447-357a-39f1-be7c-2afed0eeaddc', '2018-09-10', '1311.13', '29792019', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:29', '2019-06-05 07:28:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(59, NULL, '1138790693', 1, '2e7736ab-8cb5-34a4-9320-f2a86a4f9bd8', '2018-07-28', '689.29', '1696523', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:29', '2019-06-05 07:32:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(60, NULL, '383371081', 1, 'b882141a-bc23-300e-b74b-32df3ff912bb', '2019-01-13', '1503.87', '45203060', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:30:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(61, NULL, '341859631', 1, '6d7bf818-56e5-3aad-ab23-c8308ec56260', '2019-01-03', '619.69', '2966638', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:30:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(62, NULL, '1383042348', 1, 'de5cea86-bbfd-3b4f-a342-9a892490b727', '2018-09-16', '1617.02', '27353598', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:28:19', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(63, NULL, '716107122', 1, 'd663628a-4e1f-3cc5-9302-5f95f9d955a1', '2018-12-02', '1005.30', '24355872', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:30:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(64, NULL, '502145145', 1, '57df1c0b-c512-380a-b043-258928122df3', '2018-08-03', '1665.91', '9709903', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:30:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(65, NULL, '280863619', 1, '627392fa-048e-3fa4-8935-06349a3547a9', '2019-05-26', '1570.86', '45446467', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:32:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(66, NULL, '681696679', 1, 'be597ccc-5051-3c58-85c7-79b3cbed72bb', '2018-06-24', '1056.14', '31362973', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:30:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(67, NULL, '1382063546', 1, '0388f15d-ac34-39e0-96e7-dc9a852448b0', '2019-05-10', '441.59', '44903497', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:28:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(68, NULL, '218502725', 1, 'a51401f1-5fdf-3559-b013-5fb03a63cc44', '2019-01-14', '1619.19', '26845616', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:28:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(69, NULL, '331363710', 1, '41049a8a-054a-3300-b3be-1bf029821a90', '2018-10-12', '991.61', '18715062', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:30:25', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(70, NULL, '428186071', 1, '5411e8be-64e2-3193-930c-3803313c1011', '2018-10-15', '1002.32', '34104506', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:30', '2019-06-05 07:30:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(71, NULL, '291875893', 1, 'd14ed8bb-0e66-33d2-933e-97445769d8df', '2019-02-25', '2659.14', '8725819', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:31', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(72, NULL, '637650193', 1, '6166467e-87be-3e8a-83ce-4cb4c64dc6d1', '2019-05-09', '1018.19', '26756356', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:31', '2019-06-05 07:30:25', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(73, NULL, '930193399', 1, '453c1097-0c7d-383d-9dec-40598a2c47c4', '2018-12-20', '1153.25', '18249397', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:31', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(74, NULL, '763579132', 1, '8f5d186a-0a56-3901-a8c2-8c4e643e3adc', '2018-09-09', '2213.38', '26366584', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:31', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(75, NULL, '708830307', 1, '88d54c9e-f8f2-3767-baa7-5588cafe2a70', '2018-10-13', '1192.54', '6455024', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:31', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(76, NULL, '1242552538', 1, '047fe9ba-1d20-3ea2-a06d-e7ce01bc872e', '2018-08-04', '2183.45', '44336171', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:31', '2019-06-05 07:29:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(77, NULL, '974228541', 1, 'f2c70b2e-c4c5-3161-8e52-8de799f4cf8e', '2019-01-23', '2222.61', '8353875', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:31', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(78, NULL, '140258701', 1, 'a9079abe-ea99-3ac4-b192-f1034be870cd', '2019-05-26', '650.66', '19222424', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:32', '2019-06-05 07:32:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(79, NULL, '1323754295', 1, '3e8a301e-f884-3127-b8da-709927b1251f', '2019-01-03', '820.92', '8522329', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:32', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(80, NULL, '1356259465', 1, '2e359bb8-f588-31f7-bfac-09eee99d6a35', '2018-10-09', '2469.94', '21078677', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:32', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(81, NULL, '1392437901', 1, '0c9aa2e3-f78f-3eb6-a860-713a24425af6', '2019-01-05', '1808.62', '9665034', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:32', '2019-06-05 07:32:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(82, NULL, '13713047', 1, '5af16761-20e3-3d74-93cb-67189882ac95', '2019-01-20', '961.36', '17675796', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:32', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(83, NULL, '1556572451', 1, 'a0cb9fd0-f1b0-38fe-8087-eaeb90d15b90', '2019-01-20', '2302.15', '12682800', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:32', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(84, NULL, '1390825975', 1, '799f7883-6391-37c7-b715-022016775d38', '2018-09-11', '1043.10', '30838929', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:32', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(85, NULL, '1249728686', 1, 'd3b6f8b4-7542-3c4e-bbdb-2a6481ce679a', '2018-06-28', '428.47', '38881914', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:33', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(86, NULL, '1267194886', 1, 'f2c97a69-af67-317a-8bd3-659129819853', '2018-11-20', '2630.89', '34511776', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:33', '2019-06-05 07:30:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(87, NULL, '937487888', 1, 'd9341988-b226-3c10-8272-cd9dd455e0df', '2019-05-08', '1266.86', '31209755', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:33', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(88, NULL, '862514001', 1, '927c6ce8-0b35-3a47-9f4f-f7ef37a36f47', '2019-04-07', '1364.69', '46265398', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:35', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(89, NULL, '1161133592', 1, '28b3a10d-c072-31d6-96be-24d43a44b28e', '2018-10-27', '1059.36', '18399910', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:36', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(90, NULL, '363494191', 1, '68ac08ab-22f4-390b-b3de-e6b5e75b320b', '2018-10-21', '953.20', '9515764', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:36', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(91, NULL, '649305024', 1, 'fe549ed4-023b-375d-a685-397340d88e52', '2019-06-02', '543.60', '33435005', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:36', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(92, NULL, '150767301', 1, '830d843f-71a6-36f7-a15f-4e3e8ef88b6b', '2018-07-13', '1586.92', '46414215', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:36', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(93, NULL, '477850485', 1, '6017ff10-1204-3def-9172-19360ed9f95c', '2018-11-06', '658.20', '42698503', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:36', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(94, NULL, '698230218', 1, 'eb4aa4ae-ed4a-301f-8a4a-d7b8316372aa', '2019-05-22', '818.24', '48134757', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:37', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(95, NULL, '522440520', 1, '6291f586-110b-38f4-abbc-ac8e139a788d', '2019-01-21', '471.63', '15689478', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:37', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(96, NULL, '1186226856', 1, 'f39ff09d-733d-39c1-8f3e-4770847dab7f', '2018-09-09', '1667.71', '42073251', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:37', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(97, NULL, '1456659659', 1, '23228dd7-18fc-3248-974a-7b0ff9cf46ea', '2019-04-24', '2728.04', '21576582', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:37', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(98, NULL, '975054236', 1, '9a48d540-61a9-3424-ae95-c8386a30c958', '2019-04-15', '2002.95', '17984032', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:37', '2019-06-05 07:30:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(99, NULL, '139002677', 1, 'c1da698f-ae5a-3b39-b2f1-1ee1785e6c84', '2019-03-16', '1042.27', '1130051', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:37', '2019-06-05 07:30:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(100, NULL, '238769924', 1, '95adec0f-62cf-3198-9586-bc6283660b05', '2018-09-14', '994.75', '23137844', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:38', '2019-06-05 07:30:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(101, NULL, '233837443', 1, '8c4b752c-a2c7-3f49-b86b-b142fcbb56c2', '2018-10-12', '2329.72', '18863970', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:38', '2019-06-05 07:32:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(102, NULL, '30184190', 1, '90585357-4b95-3210-b701-35eb5d8ab3c6', '2019-04-04', '1800.14', '44122558', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:38', '2019-06-05 07:28:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(103, NULL, '1046813269', 1, '4d6d7d6e-96dc-3ece-82e4-3af62fa3627b', '2018-06-27', '457.34', '8519839', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:38', '2019-06-05 07:30:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(104, NULL, '318754151', 1, '5cd4086a-3c67-3d57-aacc-250b1800fd68', '2019-05-16', '2451.49', '17442618', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:38', '2019-06-05 07:32:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(105, NULL, '939685773', 1, '4a2e3530-1548-3eea-9dd2-9527dab113cf', '2018-08-09', '674.94', '12653363', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:38', '2019-06-05 07:30:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(106, NULL, '39951183', 1, '5f1d29a1-1343-3a22-bbf8-a1fbf8572c6d', '2018-10-06', '2960.61', '21622660', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:38', '2019-06-05 07:30:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(107, NULL, '1052565801', 1, 'b45685b1-c4df-3c78-bb6d-a4d5066fd2cf', '2019-04-19', '1512.04', '6930933', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:38', '2019-06-05 07:29:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(108, NULL, '335970421', 1, 'edd609a9-fd11-3c98-963a-bc5014a515f3', '2018-09-15', '2212.89', '6260998', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:39', '2019-06-05 07:30:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(109, NULL, '309646313', 1, '5dc73454-ad72-3fd0-a906-7df5236c20db', '2019-03-02', '466.93', '5061174', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:39', '2019-06-05 07:30:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(110, NULL, '939554363', 1, '2be49441-bd45-3f79-afd2-f7daac80e90f', '2018-12-18', '744.35', '7850154', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:39', '2019-06-05 07:30:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(111, NULL, '948396861', 1, '81813403-6f64-3135-a3cf-3ea7b68ad117', '2018-10-08', '1355.61', '38649460', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:39', '2019-06-05 07:30:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(112, NULL, '326556649', 1, 'e17fd243-020c-3516-b752-a82c24d69ac5', '2019-02-26', '1577.85', '27180090', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:39', '2019-06-05 07:30:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(113, NULL, '757736235', 1, 'f97b0b1b-8651-395d-974e-d7721bbca30f', '2019-01-26', '313.24', '6845783', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:39', '2019-06-05 07:30:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(114, NULL, '838818629', 1, '1cf651fe-aa2d-34b0-a5a8-83dc184667cf', '2018-08-20', '1533.39', '39655953', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:39', '2019-06-05 07:32:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(115, NULL, '731766703', 1, 'e2f52faf-752b-3152-9a9f-7b5df1b4d0a9', '2019-01-08', '2335.13', '9010992', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:39', '2019-06-05 07:30:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(116, NULL, '852283421', 1, '30edb538-d843-307a-a5fd-58cb6d9306f4', '2018-07-14', '2924.38', '4427256', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:39', '2019-06-05 07:30:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(117, NULL, '1180933055', 1, '00b3286f-26c8-3d48-ac8d-a7622c46324d', '2018-10-12', '1548.91', '48634311', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:40', '2019-06-05 07:32:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(118, NULL, '48682498', 1, '76f078f7-de90-3a28-a7a6-6d268c0aa82c', '2019-01-29', '2436.08', '41410794', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:40', '2019-06-05 07:30:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(119, NULL, '213338497', 1, '6266d973-0490-30cf-a15b-89e932600b76', '2019-02-24', '517.76', '28000541', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:40', '2019-06-05 07:30:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(120, NULL, '318929219', 1, '2a019c81-d5e9-3824-8f79-64c1628151e0', '2018-12-17', '1341.19', '7923882', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:40', '2019-06-05 07:32:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(121, NULL, '1068171925', 1, 'cddbcbd9-d040-37a7-be7d-4662f925c421', '2018-09-25', '461.26', '44636554', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:40', '2019-06-05 07:30:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(122, NULL, '234079985', 1, '96f5d078-b90e-311f-9d39-49186c0e851e', '2018-09-13', '1484.35', '41315552', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:40', '2019-06-05 07:32:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(123, NULL, '424983459', 1, '612e8963-0303-3255-9a22-bfe324eae384', '2018-09-14', '1641.56', '16940522', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:40', '2019-06-05 07:30:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(124, NULL, '143498540', 1, '95fea1bc-59cf-330b-b47e-78dd844753d8', '2019-05-30', '1358.43', '27554266', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:40', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(125, NULL, '1281130753', 1, '1b932a17-53c2-3bfe-a94e-5d208392c047', '2019-04-03', '2033.59', '41704864', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:41', '2019-06-05 07:30:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(126, NULL, '5138649', 1, '004dba47-78ed-34f0-ad18-b26a5b15908a', '2019-05-28', '2601.84', '47319446', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:41', '2019-06-05 07:30:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(127, NULL, '1208742027', 1, '4c6f98ca-44ca-3ddb-abbc-552ce26a71a5', '2019-01-24', '494.99', '46594657', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:41', '2019-06-05 07:30:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(128, NULL, '1556474038', 1, 'b7ee74c0-986d-3fde-94b6-a2e9c34e21c1', '2018-11-06', '1528.02', '7172009', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:41', '2019-06-05 07:28:55', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(129, NULL, '155674141', 1, '17153709-ed69-35f3-9769-a316551b7ed7', '2019-04-11', '1674.04', '43672975', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:41', '2019-06-05 07:30:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(130, NULL, '1351365066', 1, 'e0910479-6e30-3d50-b8c5-b55584f675ee', '2018-10-28', '364.30', '38494278', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:41', '2019-06-05 07:30:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(131, NULL, '257755488', 1, 'fce29638-05ba-3ff8-9c2c-2a1308935de6', '2018-07-28', '1819.52', '15387832', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:41', '2019-06-05 07:30:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(132, NULL, '1165387163', 1, 'b37bcfc6-733f-3c2e-8707-58b202a8828d', '2018-09-22', '2828.92', '25048483', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:41', '2019-06-05 07:30:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(133, NULL, '973829216', 1, '5a045077-66d3-37db-9de7-956298a0f4a7', '2018-09-13', '2321.74', '32274782', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:41', '2019-06-05 07:30:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(134, NULL, '43775454', 1, 'c02440a0-e6ed-30b7-b261-4fdfa66645ae', '2018-11-26', '1378.43', '14828102', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:41', '2019-06-05 07:30:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(135, NULL, '677002285', 1, '36048809-aa91-3f0c-bd0b-b5870c664609', '2018-09-29', '1862.12', '35824209', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:42', '2019-06-05 07:30:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(136, NULL, '1432494953', 1, '698dec5d-1a73-34c4-8980-e1926c19377c', '2019-01-20', '2548.32', '25842411', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:42', '2019-06-05 07:30:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(137, NULL, '1494089666', 1, '75dcec3c-711d-31b4-ac8b-ee3a16edc03b', '2019-01-21', '2716.52', '3879531', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:42', '2019-06-05 07:30:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(138, NULL, '1133902407', 1, 'c1dc14e6-8aef-3037-894d-681f736e1859', '2019-01-19', '747.00', '7840635', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:42', '2019-06-05 07:30:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(139, NULL, '650870934', 1, 'bf664cf2-7209-3cfc-8526-1164aef096d7', '2018-09-24', '2285.44', '11461164', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:42', '2019-06-05 07:28:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(140, NULL, '39496689', 1, 'd8c4ff1d-22d5-331c-a021-90c1cc116bb2', '2019-03-07', '487.04', '45316043', 8, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:42', '2019-06-05 07:29:41', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(141, NULL, '487231123', 1, 'a56eeab4-6611-3937-9352-23ab972dbb08', '2018-12-06', '1647.35', '42796057', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:42', '2019-06-05 07:30:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(142, NULL, '1531550808', 1, 'd3f2afde-aa56-3cf8-96b0-1e788351bd39', '2019-05-11', '1190.72', '38911191', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:42', '2019-06-05 07:32:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(143, NULL, '543647656', 1, '62477ae6-3a9f-3ebe-8f31-48a6d162a62d', '2018-08-24', '2048.03', '9996256', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:43', '2019-06-05 07:30:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(144, NULL, '755460872', 1, 'c494e71a-2a0c-33da-ab2f-d71503d0c335', '2018-07-25', '2265.41', '36957646', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:43', '2019-06-05 07:32:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(145, NULL, '402788161', 1, '7320319d-f11d-3d28-97d6-d945ad6866a1', '2019-01-26', '1874.67', '29789110', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:43', '2019-06-05 07:30:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(146, NULL, '1417006630', 1, '4eee8249-0b36-3f5e-84ce-445539726004', '2018-08-29', '559.42', '39427322', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:43', '2019-06-05 07:32:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(147, NULL, '730058017', 1, '59598cfe-1328-37ef-b79e-c94399b91035', '2018-07-04', '1863.11', '22470410', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:43', '2019-06-05 07:30:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(148, NULL, '742439594', 1, '7229d107-b9ac-34f9-b58c-b02d5b4c0238', '2019-04-24', '942.72', '12257730', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:43', '2019-06-05 07:30:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(149, NULL, '647208678', 1, '8abd2953-8490-33a9-977c-0217e8565322', '2018-06-08', '1875.00', '39736361', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:43', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(150, NULL, '400765842', 1, 'a3956703-c0b4-36b1-a24d-c227c3b7ecae', '2019-03-14', '2464.08', '21680567', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:43', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(151, NULL, '1327490352', 1, '3519d5ea-b29c-3b8e-b8a8-abb410239b4b', '2019-01-27', '2323.31', '31650104', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:44', '2019-06-05 07:32:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(152, NULL, '397067567', 1, 'b7dca080-b82c-33f1-8d94-42b537ddd390', '2019-05-24', '696.27', '9490941', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:44', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(153, NULL, '844437336', 1, 'ec474688-b65b-3111-9b80-04469be3ab79', '2019-04-23', '597.40', '48764782', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:44', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(154, NULL, '606098202', 1, 'fba126c8-e97e-3932-94c6-f20dc3fe908e', '2018-09-24', '1527.46', '43858146', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:44', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(155, NULL, '1196533642', 1, '85ff2bc3-4013-3610-a4de-c208a853ee0a', '2018-10-02', '2845.38', '43597320', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:44', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(156, NULL, '1242812668', 1, 'c119285a-03fc-348c-8ae6-19837bfb2efc', '2018-12-05', '504.98', '46801750', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:44', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(157, NULL, '290160683', 1, 'f3ecf232-d5b5-306a-bbf8-d9e7e9372325', '2019-03-05', '1878.57', '39196865', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:44', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(158, NULL, '1358134871', 1, '1e54d590-47f9-3699-bbb4-6656e68b686e', '2018-08-11', '1237.07', '47168125', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:44', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(159, NULL, '1413720207', 1, '74a515e2-0c45-331f-9da1-099d2ef93764', '2018-12-16', '1220.03', '15677226', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:44', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(160, NULL, '1367836673', 1, 'dacc7759-706f-3327-940b-8f83b0ad3e0f', '2019-04-17', '1958.48', '34178014', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:45', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(161, NULL, '83976689', 1, '6f9b7b7b-0258-3e14-aa62-441453e6a78b', '2019-03-23', '2219.32', '47262559', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:45', '2019-06-05 07:27:58', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(162, NULL, '415129830', 1, '13242f67-e484-3347-b247-45032d2e38c0', '2018-11-08', '2670.38', '32765570', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:45', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(163, NULL, '486525149', 1, '05867099-602d-3f8f-aa88-dc683f23f39e', '2018-10-17', '2876.16', '7219941', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:45', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(164, NULL, '504268714', 1, '7e42eeb4-731e-337a-8423-79a22d639faf', '2018-12-06', '1034.90', '6781128', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:45', '2019-06-05 07:30:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(165, NULL, '734885002', 1, '98362164-d830-3ebb-adcb-65ed6d92acf0', '2018-09-13', '2168.20', '4838506', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:45', '2019-06-05 07:30:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(166, NULL, '4583821', 1, '02b88ebb-0a43-3ecc-a146-c044729ee7b0', '2019-01-13', '1710.37', '49226044', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:45', '2019-06-05 07:30:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(167, NULL, '778417426', 1, '26bf0146-9037-38d4-93ae-58479bed0b4a', '2019-03-18', '2583.02', '40036951', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:45', '2019-06-05 07:30:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(168, NULL, '132918075', 1, 'a7cf531a-c41a-3635-9a99-8db52c2676a3', '2019-05-28', '2093.08', '22084885', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:46', '2019-06-05 07:30:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(169, NULL, '1084252487', 1, '948b6ea0-21e0-3c6f-bf2a-1a1fd9beab24', '2019-04-27', '2038.91', '30934159', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:46', '2019-06-05 07:28:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(170, NULL, '681898841', 1, '5cb5db3b-4a1a-3e31-9e7d-6ac1be3ecbd8', '2018-08-26', '906.46', '28464029', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:46', '2019-06-05 07:30:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(171, NULL, '1197565119', 1, 'd86e784a-b47e-3c16-8489-2642df7795fc', '2018-09-09', '1174.05', '30184131', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:46', '2019-06-05 07:30:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_rating_5`) VALUES
(172, NULL, '99343794', 1, '0856af19-1147-3d2b-a4fc-a92065ec79c1', '2019-04-13', '2924.60', '33454527', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:46', '2019-06-05 07:30:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(173, NULL, '482541994', 1, '77b4ce91-f801-3324-b99c-020913ced2e8', '2018-06-29', '1562.97', '4929446', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:47', '2019-06-05 07:30:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(174, NULL, '561174640', 1, '7989e986-d262-3a47-9630-ae2129da86bd', '2019-04-17', '2013.49', '18952019', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:47', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(175, NULL, '683357236', 1, 'e84927e2-993c-3f9c-a44a-96a2fe5b30f6', '2018-11-10', '2203.32', '43938867', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:47', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(176, NULL, '1146138595', 1, 'bd2568de-d8ea-32e5-95f7-7d1fdd8f5264', '2019-02-23', '727.56', '31548901', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:47', '2019-06-05 07:32:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(177, NULL, '1113809891', 1, '7c5c6911-26d6-36f7-8453-24326841088d', '2019-01-02', '627.07', '6601948', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:47', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(178, NULL, '1364011319', 1, '456e9bca-1da1-3e7b-9d79-ab61ba0f040b', '2019-04-04', '1800.80', '22741393', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:47', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(179, NULL, '340442052', 1, '332c88b7-95fd-3ea7-8a1b-079ff74095a7', '2018-10-12', '1956.16', '11481855', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:48', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(180, NULL, '116678433', 1, '248c09b8-be62-3272-830b-3d36880c3651', '2018-12-19', '1180.66', '17193122', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:48', '2019-06-05 07:28:59', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(181, NULL, '1546670536', 1, '723b71d3-584f-38a1-8829-40b1e019ef9a', '2018-08-08', '898.24', '6566403', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:48', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(182, NULL, '445400903', 1, '9d112d4c-dd58-35e7-8acb-308fdcee32eb', '2019-03-22', '1796.51', '3343374', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:48', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(183, NULL, '517651051', 1, '1497c05e-f8c5-3122-a52a-16f324dad091', '2019-02-15', '437.42', '1455501', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:48', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(184, NULL, '923295764', 1, '3255357e-7f0c-3b51-81c6-6c60b5c4ab23', '2018-08-31', '1427.27', '32803306', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:49', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(185, NULL, '802243701', 1, '72249899-11b8-378c-8e1b-b88738688aef', '2019-03-31', '1964.21', '5897863', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:49', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(186, NULL, '611356669', 1, '40ce26cb-d989-3d12-a048-e8a3af9312d6', '2019-02-20', '2949.91', '20886931', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:49', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(187, NULL, '680016827', 1, '64dfe0ce-8bfd-3dea-91f9-1873c91e1c5d', '2019-05-12', '438.42', '43180411', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:49', '2019-06-05 07:32:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(188, NULL, '666496278', 1, 'e4b0a360-ec68-3251-80aa-ec454191cd21', '2018-10-06', '1136.19', '34518489', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:50', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(189, NULL, '1013655969', 1, '79247a0e-7c3d-3356-9912-fe3224ddf9f2', '2018-11-22', '2784.31', '30277060', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:50', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(190, NULL, '814847761', 1, '3753c6d8-8c49-3045-8624-9583f8bddff5', '2019-02-16', '2869.57', '48628833', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:50', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(191, NULL, '1496609779', 1, 'e3413144-92eb-3ecb-bd7f-9c8b7ef78f84', '2018-06-12', '2329.08', '28184973', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:50', '2019-06-05 07:30:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(192, NULL, '1251653497', 1, 'eb665faf-0406-339a-8846-0c5ef01ef6a8', '2018-11-20', '863.24', '16603528', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:50', '2019-06-05 07:30:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(193, NULL, '1495514404', 1, 'd257ca11-d062-344a-a272-62a06845acc6', '2018-08-24', '2723.07', '32487487', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:51', '2019-06-05 07:30:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(194, NULL, '885927437', 1, '4921a93a-713a-36cf-8a76-b203f6e315ed', '2019-04-10', '2969.21', '47382934', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:51', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(195, NULL, '411084773', 1, '47ab1d64-8a9c-3773-af9c-bba695cbd408', '2018-07-11', '2075.73', '4185330', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:51', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(196, NULL, '533321865', 1, 'b9442cfc-a5e3-3730-88a3-272e14d9c2f2', '2018-10-13', '1348.31', '42145833', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:51', '2019-06-05 07:30:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(197, NULL, '899416336', 1, 'd3658645-0e7b-3d7f-bec3-6b9db23e4194', '2018-07-01', '1913.36', '46011293', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:51', '2019-06-05 07:30:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(198, NULL, '1187850004', 1, '3e895268-f33e-3e3c-bcef-f1d73526ef01', '2018-11-01', '2678.78', '14354190', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:51', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(199, NULL, '142804171', 1, '4889d188-11d0-3a63-b7fe-f1a51b34b6bc', '2019-03-20', '1861.21', '43597631', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:52', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(200, NULL, '74697265', 1, '71d4494b-9a35-3d19-8441-de53de54dbc7', '2018-12-12', '1888.65', '18971688', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:52', '2019-06-05 07:30:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(201, NULL, '454829518', 1, '06c2a882-c166-3aeb-9923-ed567f26a69f', '2019-05-22', '2906.31', '43709494', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:52', '2019-06-05 07:30:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(202, NULL, '108934488', 1, 'd4b0faef-0bb0-344e-b56d-58bf38dbbb5a', '2019-03-13', '439.48', '39071640', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:53', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(203, NULL, '679830140', 1, 'ebb1ff3d-1068-3e0f-b1fa-9fdd1f00e5df', '2019-03-14', '1293.54', '6573120', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:53', '2019-06-05 07:30:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(204, NULL, '1428445011', 1, '56124ae4-315a-33b6-a49b-21d291c098c2', '2018-10-24', '2863.50', '33416211', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:53', '2019-06-05 07:30:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(205, NULL, '919689659', 1, '143f1e78-a6e3-3007-a285-387620b99653', '2018-10-06', '2570.95', '27039849', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:53', '2019-06-05 07:30:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(206, NULL, '885094541', 1, 'd8ae5499-74bb-30f3-bc26-3a9cc3b37cc1', '2018-09-02', '2075.59', '9575953', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:53', '2019-06-05 07:30:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(207, NULL, '308770797', 1, '401b266d-6071-37fe-8c80-5e1b9c7842b0', '2019-04-11', '350.13', '44035153', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:54', '2019-06-05 07:30:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(208, NULL, '1497259529', 1, 'c6c02f1f-1a65-3ae2-ab0a-2573a7568376', '2018-10-12', '2079.47', '35392927', 9, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:54', '2019-06-05 07:29:50', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(209, NULL, '532828404', 1, '3dff6aeb-d966-3765-abde-16f30a6d8e3c', '2018-12-07', '2848.17', '31484007', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:54', '2019-06-05 07:30:37', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(210, NULL, '412295564', 1, '777ff7ad-27df-3a8b-8d1a-a5974ebc42e7', '2019-05-22', '1944.44', '3840218', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:54', '2019-06-05 07:30:37', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(211, NULL, '543889129', 1, '4a74f306-5f7a-3627-9b9a-f52217810115', '2019-05-01', '2897.71', '40895772', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:54', '2019-06-05 07:32:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(212, NULL, '412040371', 1, 'e857bc7c-9ffe-3892-8db2-91a15826e182', '2018-11-23', '833.47', '17688270', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:55', '2019-06-05 07:30:37', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(213, NULL, '615283551', 1, '72a6ed3e-9817-3fb8-b541-3716cc72d0e1', '2019-01-17', '545.98', '8976716', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:55', '2019-06-05 07:28:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(214, NULL, '258904045', 1, '6f95a4a0-b3e2-37b4-a2c4-68a2650ceff4', '2019-01-20', '1425.75', '15574975', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:55', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(215, NULL, '928504877', 1, '7c4949b5-cb26-34f1-b804-38e182c3342c', '2018-09-13', '427.94', '24189896', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:55', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(216, NULL, '1222012525', 1, '38b23ee5-0d1e-306d-8837-bae67fd57e52', '2019-05-20', '2599.83', '11162220', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:56', '2019-06-05 07:32:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(217, NULL, '724117104', 1, 'a4f097e0-298a-3eac-8f30-7be8448f5622', '2018-09-16', '1898.20', '35305593', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:56', '2019-06-05 07:30:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(218, NULL, '184855811', 1, '040ada48-cb12-328d-919e-f317757b0463', '2018-12-04', '940.98', '35901652', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:56', '2019-06-05 07:29:51', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(219, NULL, '1145870963', 1, '438c2c35-547e-3415-b418-30657f1f7c79', '2018-12-04', '1333.95', '34791679', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:57', '2019-06-05 07:30:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(220, NULL, '948192067', 1, '5630b52a-118a-3854-b66f-a15f7040cd73', '2018-10-07', '507.47', '26190590', 9, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:57', '2019-06-05 07:29:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(221, NULL, '180746309', 1, '77eaed86-9094-3cf5-8919-fad68c0ca9e4', '2018-10-18', '684.25', '38662277', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:57', '2019-06-05 07:30:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(222, NULL, '1445179493', 1, '8590c021-0d52-3f8b-8399-b041ea6eff41', '2019-04-02', '844.71', '39191025', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:58', '2019-06-05 07:30:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(223, NULL, '1314612251', 1, '883f9b95-f3ac-3bca-971e-594a3eb866ac', '2018-07-30', '1964.12', '5440498', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:58', '2019-06-05 07:30:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(224, NULL, '771879153', 1, '3888ae0f-38cf-3a25-b1d0-57acb369e871', '2018-09-01', '1959.37', '10987010', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:58', '2019-06-05 07:30:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(225, NULL, '661376146', 1, '363db6aa-8870-3e70-ba7b-5f3cabce5335', '2018-09-22', '1129.01', '26159853', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:58', '2019-06-05 07:30:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(226, NULL, '204887287', 1, '591f7bed-6f9e-306d-bcfd-5ae426c908aa', '2019-05-31', '1747.90', '28791690', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:58', '2019-06-05 07:30:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(227, NULL, '1436136632', 1, '7b33ca22-d00e-3b34-bd84-817dcccd37b2', '2018-09-10', '1851.51', '14496911', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:59', '2019-06-05 07:30:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(228, NULL, '592700344', 1, 'ee53dbd1-ff13-312d-820e-39e66632cf7a', '2018-07-21', '950.12', '25530196', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:59', '2019-06-05 07:30:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(229, NULL, '1000637735', 1, '5b86e0d1-8c72-3036-b49b-861aa808ed54', '2019-03-16', '1250.18', '43697221', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:59', '2019-06-05 07:30:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(230, NULL, '894895259', 1, '5981b593-bc56-30bf-b961-1f575c2a6387', '2018-07-04', '1023.92', '12628922', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:59', '2019-06-05 07:30:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(231, NULL, '1124625163', 1, '9d37fd83-5b84-3ac3-b273-0dffff4defaa', '2019-02-10', '1732.44', '40695596', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:59', '2019-06-05 07:30:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(232, NULL, '613714820', 1, '2629cfc9-9f1a-3c19-ab01-41813bbb7110', '2018-09-13', '2298.38', '16952041', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:23:59', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(233, NULL, '187780829', 1, 'dab80856-e6bc-3f23-8a23-92ef8964edcd', '2018-10-21', '739.72', '36931916', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:00', '2019-06-05 07:29:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(234, NULL, '649758913', 1, '2b295c96-1a20-3435-ae2f-6c5f89f2ce11', '2018-08-25', '2883.51', '36950113', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:00', '2019-06-05 07:30:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(235, NULL, '1267707644', 1, '662f19ac-f882-3a49-bca2-60b118bff354', '2019-04-26', '943.12', '33991207', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:00', '2019-06-05 07:30:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(236, NULL, '675559082', 1, '8f6b8b03-ec8a-39bb-b711-2f0fdb5e9aeb', '2018-08-07', '2109.73', '6726935', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:00', '2019-06-05 07:30:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(237, NULL, '99710495', 1, '355c9681-c6e9-3e11-82f4-24475d2cc05b', '2019-03-10', '2799.86', '42857937', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:00', '2019-06-05 07:30:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(238, NULL, '804854585', 1, '765f970a-a9e0-3b49-bf10-f40fb87449c2', '2018-11-21', '416.83', '42873009', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:00', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(239, NULL, '306132643', 1, '35ee585c-db2c-34a0-80b8-2c9df80f0a5d', '2019-04-25', '1561.74', '43986809', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:01', '2019-06-05 07:32:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(240, NULL, '1467645707', 1, '0025c7b0-3806-3195-9b07-eb5e81297510', '2018-12-08', '1387.20', '4978617', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:01', '2019-06-05 07:30:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(241, NULL, '1234876840', 1, '222ff22f-57cb-3181-924a-1f7127c37a06', '2019-02-26', '2518.67', '16252211', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:01', '2019-06-05 07:30:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(242, NULL, '943466316', 1, '7c0e8b6d-6c1f-34f3-b80a-dd5faeba63f7', '2018-08-16', '1117.31', '24236920', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:01', '2019-06-05 07:30:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(243, NULL, '1311678570', 1, 'b0fcfe66-3d38-3b6a-a9e1-9553ab022ea4', '2018-08-11', '2534.87', '46852319', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:01', '2019-06-05 07:30:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(244, NULL, '1114486439', 1, '51a9d42c-460a-33ad-989b-3ce373715f07', '2019-04-15', '2749.59', '32875822', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:02', '2019-06-05 07:29:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(245, NULL, '1039866926', 1, '1ab7d6c7-453e-3d0b-b823-5c00bfccaaaa', '2019-01-14', '1287.46', '9957646', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:02', '2019-06-05 07:30:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(246, NULL, '728838213', 1, '75736228-52d5-3613-9cf9-c32184014180', '2019-01-11', '2116.52', '16079444', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:02', '2019-06-05 07:30:41', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(247, NULL, '976112490', 1, '032a28e6-b9ad-3531-940d-8a94b44d0d88', '2018-12-24', '1187.94', '22198625', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:02', '2019-06-05 07:28:02', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(248, NULL, '146647232', 1, '479b7a87-4eab-3a1b-9229-e5455ca18a43', '2019-01-10', '2487.61', '43655005', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:02', '2019-06-05 07:29:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(249, NULL, '587056080', 1, 'db039b17-8f28-3e19-bad4-9d736bb1070b', '2019-02-09', '2854.97', '14360132', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:03', '2019-06-05 07:30:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(250, NULL, '1324146278', 1, '7ff976d6-0fea-3b7f-9722-59b6ee966171', '2018-10-11', '2007.37', '6518827', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:03', '2019-06-05 07:30:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(251, NULL, '323312504', 1, '3e7050ed-a939-329c-bb26-fbda898d0bb0', '2018-08-12', '1040.18', '24090408', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:04', '2019-06-05 07:30:41', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(252, NULL, '46831634', 1, 'b3d12e66-0f9f-3787-b382-a427b28c0187', '2018-10-21', '534.42', '1326359', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:04', '2019-06-05 07:30:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(253, NULL, '64937779', 1, '29bfa1ed-0316-3b97-bb59-f9809ba12502', '2018-08-23', '2830.50', '15100331', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:04', '2019-06-05 07:30:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(254, NULL, '1299616720', 1, 'd7b4eddd-ec65-3c60-9374-f30ac38d9c14', '2018-07-16', '635.30', '1456403', 8, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:04', '2019-06-05 07:29:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(255, NULL, '1075915726', 1, 'c102c6de-cfd4-3116-b9e2-b3bdaa377b1e', '2019-05-26', '2278.45', '46794623', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:05', '2019-06-05 07:30:41', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(256, NULL, '62309301', 1, '0a9c6449-9d88-3410-b5c9-367552b88d76', '2019-03-27', '319.98', '39193370', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:05', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(257, NULL, '427575635', 1, 'cfd838b0-606e-3558-9e2b-56e3b457cf71', '2019-06-04', '1427.83', '25290828', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:05', '2019-06-05 07:30:42', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(258, NULL, '1168541065', 1, '68d3d1ba-fe0f-353f-be24-096b42230753', '2019-03-07', '958.83', '25025877', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:05', '2019-06-05 07:32:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(259, NULL, '680411646', 1, '6fffec69-4372-3062-8746-848b0f69b1a1', '2018-06-19', '2632.74', '26544102', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:06', '2019-06-05 07:28:19', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(260, NULL, '1269078311', 1, '854fc27e-c639-387d-9cae-f67d0d41d97a', '2018-06-14', '1814.94', '23085937', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:06', '2019-06-05 07:30:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(261, NULL, '1526248951', 1, '6b41cf31-f319-3974-a8b5-6080f12a43b6', '2018-09-30', '699.06', '5886870', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:06', '2019-06-05 07:30:42', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(262, NULL, '296320571', 1, 'c8461e34-8cd8-3352-a319-724c4f39acf7', '2018-12-27', '1254.94', '36844575', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:06', '2019-06-05 07:32:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(263, NULL, '1130937485', 1, '152b1a7a-6950-3e30-9604-0cf5d66d6b14', '2019-03-06', '536.00', '17308193', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:06', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(264, NULL, '840552745', 1, '033a3d27-186f-3a46-a932-f48e2cec30b7', '2018-09-03', '1874.25', '18460746', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:06', '2019-06-05 07:30:42', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(265, NULL, '1500026169', 1, 'c489f083-4194-35ec-97f3-5ac5b7e96b84', '2018-12-01', '481.79', '23382734', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:07', '2019-06-05 07:30:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(266, NULL, '1118175273', 1, 'a9158765-b89a-347a-9435-b61294dad4f1', '2018-11-30', '1598.49', '19861484', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:07', '2019-06-05 07:32:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(267, NULL, '1405766296', 1, 'e32613e2-f122-3c62-a81c-2d588d5ebe24', '2018-12-16', '642.93', '44044469', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:07', '2019-06-05 07:30:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(268, NULL, '1486126595', 1, 'ab599a7a-f4eb-3bad-9708-8f04aa2f7ffa', '2018-06-28', '2996.87', '12267152', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:07', '2019-06-05 07:28:50', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(269, NULL, '790664288', 1, 'd175b65d-d33f-305c-b790-ae48c4821a9b', '2018-12-08', '2140.02', '42361821', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:07', '2019-06-05 07:30:43', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(270, NULL, '190671898', 1, '48f12db7-99b0-30be-ab74-659229ac1c90', '2018-08-20', '1646.33', '45921088', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:08', '2019-06-05 07:30:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(271, NULL, '594849240', 1, '4c9f4301-b75f-3026-8052-e94e34ba59d9', '2018-11-16', '667.10', '1654002', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:08', '2019-06-05 07:32:48', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(272, NULL, '472151580', 1, '125ec9d5-48e6-3ae8-ad40-045693fd30c3', '2018-06-27', '1748.27', '47720732', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:08', '2019-06-05 07:30:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(273, NULL, '202162941', 1, '428ae730-c284-326c-843c-1fbdd210ae91', '2018-12-12', '2197.50', '10407581', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:08', '2019-06-05 07:32:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(274, NULL, '1208619165', 1, '4c1c1082-4998-377e-a588-320ec22c4536', '2018-09-13', '2720.78', '42358250', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:08', '2019-06-05 07:32:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(275, NULL, '792495981', 1, 'c5e047d1-cdd8-32f5-8874-1db856347816', '2018-11-29', '841.30', '11954729', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:09', '2019-06-05 07:28:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(276, NULL, '84418136', 1, '66ab4eda-b923-3d4d-92ff-4d11cec6f80b', '2018-12-03', '2050.23', '46206255', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:09', '2019-06-05 07:30:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(277, NULL, '908970006', 1, '7e148350-2728-3ebd-9310-cc9cecd04d24', '2018-06-12', '2840.66', '9192513', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:09', '2019-06-05 07:32:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(278, NULL, '889983944', 1, 'd722dce2-a5cd-332b-b858-afa25281c61f', '2018-06-08', '1330.45', '12477301', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:09', '2019-06-05 07:30:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(279, NULL, '1388104434', 1, '5d2e6542-d38e-30a3-9968-70839853730d', '2018-10-19', '568.08', '35614313', 7, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:09', '2019-06-05 07:29:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(280, NULL, '1424518931', 1, '82e0b722-6eee-3180-a9d3-1e0864be53f7', '2019-02-08', '2485.89', '21584598', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:10', '2019-06-05 07:30:43', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(281, NULL, '1024813204', 1, '2227d3ec-abd5-3ed6-aa28-f212a08490cc', '2019-01-25', '544.53', '13329377', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:10', '2019-06-05 07:30:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(282, NULL, '1014348748', 1, 'd3dd97ab-d437-384f-89d5-455804fccc50', '2019-02-04', '763.45', '3367224', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:10', '2019-06-05 07:30:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(283, NULL, '199477910', 1, '96e79a87-5fca-3574-8437-9756553e83fe', '2019-03-08', '1731.16', '14443624', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:10', '2019-06-05 07:28:57', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(284, NULL, '431330003', 1, 'dc36ae9a-8a71-319e-ab3b-e0548ac5ae62', '2019-04-09', '318.55', '33916333', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:10', '2019-06-05 07:30:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(285, NULL, '1076840969', 1, '3a9bd3e8-3b50-3c2e-9977-308227298538', '2018-12-07', '2885.12', '7450969', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:10', '2019-06-05 07:30:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(286, NULL, '1301940274', 1, '5cd89847-47b8-3d77-b463-8c7416d9ffd9', '2018-08-05', '516.12', '16811096', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:10', '2019-06-05 07:30:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(287, NULL, '1196241319', 1, '2123bdbb-9dd6-337e-a27b-f006793bad30', '2019-02-21', '2081.16', '12748557', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:11', '2019-06-05 07:28:03', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(288, NULL, '30485318', 1, '0c0fe454-fe67-36a1-80a6-66c2715d471e', '2018-10-01', '2948.98', '29879178', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:11', '2019-06-05 07:30:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(289, NULL, '559939748', 1, '139edb01-1620-37b8-be4b-95ee8dc931a5', '2018-09-15', '2906.41', '28679657', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:11', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(290, NULL, '1502273600', 1, '2a40d4ad-04af-348a-943a-545674a7db16', '2018-07-26', '1437.35', '40428668', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:11', '2019-06-05 07:30:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(291, NULL, '1271385718', 1, 'a739927a-a4c0-3b02-8759-0233c04b757d', '2018-07-23', '329.30', '15041993', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:11', '2019-06-05 07:30:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(292, NULL, '1418201033', 1, '49b2439f-211d-36a2-baac-75456a4e1bd4', '2018-11-28', '2813.32', '44729672', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:11', '2019-06-05 07:30:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(293, NULL, '1202968786', 1, 'c2a19e59-7dbb-383a-accd-055e6af69b01', '2019-06-03', '761.68', '21075671', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:11', '2019-06-05 07:30:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(294, NULL, '1524042295', 1, '6ca977c7-301c-3234-af6a-3d356543a5e1', '2018-08-23', '583.37', '45516522', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:11', '2019-06-05 07:30:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(295, NULL, '1330520305', 1, '8023853e-8093-333f-913d-95cdc38fa9f5', '2018-11-29', '423.07', '45848657', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:12', '2019-06-05 07:29:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(296, NULL, '527356683', 1, '63fba59c-83b7-39da-9bad-36b7ce1e6648', '2019-05-25', '2280.15', '3502068', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:12', '2019-06-05 07:28:58', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(297, NULL, '1367195474', 1, 'd4e3eb69-e292-39cc-9261-8ff07c65490e', '2018-09-12', '2151.62', '8529487', 8, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:12', '2019-06-05 07:29:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(298, NULL, '1367769469', 1, 'aa5cd1b3-1bd6-3b10-a187-6a4d0ecf193f', '2019-05-16', '2615.59', '10344387', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:12', '2019-06-05 07:28:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(299, NULL, '507561399', 1, '684759fa-d228-376b-b81f-9aa2959aba15', '2019-01-12', '2250.04', '17915237', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:12', '2019-06-05 07:30:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(300, NULL, '1181059386', 1, '9a078de2-93b5-3c51-8f00-ea3a636e6638', '2018-12-07', '2509.59', '33376001', 9, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:12', '2019-06-05 07:29:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(301, NULL, '617870641', 1, 'a6c87d06-ccc5-30ea-aa11-6e88b14a84d8', '2018-09-07', '1441.48', '29679207', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:12', '2019-06-05 07:32:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(302, NULL, '7924375', 1, '27438734-48ec-39d0-84fe-8ac37cac2c67', '2018-09-26', '2828.37', '27823063', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:13', '2019-06-05 07:30:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(303, NULL, '103833550', 1, '9150bf77-c329-36ac-8f99-8f1e780bdea9', '2018-06-21', '2307.57', '2604068', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:13', '2019-06-05 07:30:45', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(304, NULL, '888058559', 1, '0cbf087c-254f-3e2c-bfa5-e29a0a1017fc', '2018-08-19', '1970.63', '24714071', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:13', '2019-06-05 07:28:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(305, NULL, '366776913', 1, '032b8e6e-9754-39a6-9839-3d764f76e7b4', '2019-01-30', '667.99', '22907083', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:13', '2019-06-05 07:30:45', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(306, NULL, '41282684', 1, 'a568adae-7cdc-3948-880a-4b7cf1e8b6b4', '2018-12-19', '875.98', '17728793', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:13', '2019-06-05 07:30:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(307, NULL, '1163545128', 1, '93c62e9b-0f69-3bcd-b6db-8abe4d9225c4', '2019-04-03', '981.94', '5859334', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:13', '2019-06-05 07:30:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(308, NULL, '1217139730', 1, '2fb33207-9fc1-3975-b7b2-7bf38bccc53b', '2018-10-18', '349.45', '35597650', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:13', '2019-06-05 07:30:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(309, NULL, '494288347', 1, 'aa16ccd5-3d79-38a7-90b0-7a3aec444d5d', '2018-12-20', '1355.35', '36094977', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:13', '2019-06-05 07:28:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(310, NULL, '977815863', 1, '37e9f42f-60c5-3dc4-adbb-96afada0b51a', '2018-06-28', '2185.29', '4567608', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:13', '2019-06-05 07:29:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(311, NULL, '423367190', 1, 'b090d3cd-a402-34cb-b8bb-f1d67b5a729b', '2018-09-09', '2775.76', '20930855', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:14', '2019-06-05 07:30:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(312, NULL, '836759356', 1, '657574ea-8ecf-33b9-8eb0-f51f23cfc43f', '2018-12-06', '1390.21', '49349769', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:14', '2019-06-05 07:30:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(313, NULL, '577393352', 1, '33bf07f4-3974-35f8-9761-02e8da77088c', '2018-11-23', '2560.55', '37808883', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:14', '2019-06-05 07:30:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(314, NULL, '373302062', 1, '0bdc5e84-055d-31d8-b327-427e239f3921', '2018-12-19', '1364.31', '4719847', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:14', '2019-06-05 07:30:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(315, NULL, '342578686', 1, '320703dc-420a-3435-af82-be317f80e7df', '2018-11-11', '2661.06', '43387878', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:14', '2019-06-05 07:30:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(316, NULL, '482629179', 1, 'f1768ad1-9d0a-3b24-a80c-9107b6b7b66b', '2019-05-15', '909.70', '45021458', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:14', '2019-06-05 07:30:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(317, NULL, '1229032259', 1, '835f1b04-8e39-3075-8b70-7b047c287314', '2018-06-24', '1105.89', '36366149', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:14', '2019-06-05 07:30:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(318, NULL, '974257360', 1, 'b5e9d9de-45cd-38e5-b6fc-d75d679392bd', '2019-04-09', '997.24', '20446421', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:15', '2019-06-05 07:30:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(319, NULL, '1344517681', 1, 'f84551a9-32ec-3099-88f2-c94c0db88675', '2019-04-13', '2066.69', '5079886', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:15', '2019-06-05 07:30:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(320, NULL, '531033933', 1, '4f2d2c51-2147-300b-b527-150a70381efa', '2019-04-23', '2905.68', '5260990', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:15', '2019-06-05 07:29:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(321, NULL, '1105806363', 1, 'a01e8a53-78d6-3bc8-adb1-d1ccf056d714', '2018-06-20', '2285.44', '1798455', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:15', '2019-06-05 07:30:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(322, NULL, '307206846', 1, 'e6230da1-4d26-33c8-a0b0-e1fcc7ac3961', '2018-06-14', '2104.37', '12231052', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:15', '2019-06-05 07:30:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(323, NULL, '460096953', 1, 'ad4ccc36-57ed-3fb0-ac12-d895b54e8cba', '2018-09-18', '2339.69', '42336668', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:15', '2019-06-05 07:27:57', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(324, NULL, '1312192450', 1, '70075bb2-31b7-3761-bdb2-46d5b7d09bd4', '2018-11-09', '1590.66', '7849420', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:15', '2019-06-05 07:30:48', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(325, NULL, '1389128700', 1, 'e97aa8fe-daad-33f3-b8eb-46d965a87a77', '2018-12-23', '1451.34', '11899618', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:16', '2019-06-05 07:32:48', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(326, NULL, '805581485', 1, '4b567639-4be0-3866-a9a3-3e75d246a691', '2018-09-27', '533.67', '42855910', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:16', '2019-06-05 07:30:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(327, NULL, '1244172979', 1, '014019e8-ca6d-3bb7-a655-2469134cea5d', '2019-01-12', '2766.83', '30044334', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:16', '2019-06-05 07:30:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(328, NULL, '1326104181', 1, '2a63e583-4e13-3daa-9045-dc635babea50', '2018-12-14', '1878.96', '30379973', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:16', '2019-06-05 07:30:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(329, NULL, '965468484', 1, '5adb8799-a8d3-36f9-a9fb-65d51763f477', '2019-02-09', '330.96', '29122213', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:16', '2019-06-05 07:30:48', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(330, NULL, '346004421', 1, 'bab2cda7-c72c-30f1-86b0-fa4dae2b5ae7', '2018-10-16', '1326.19', '35335713', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:16', '2019-06-05 07:30:48', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(331, NULL, '552951750', 1, '31c710a2-595c-379d-961b-0b60c1505994', '2018-12-15', '2931.75', '6930279', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:16', '2019-06-05 07:30:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(332, NULL, '1388095243', 1, 'e51254f6-c8b7-3d04-9c47-a3a85f08eacc', '2018-08-05', '2765.16', '28294665', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:17', '2019-06-05 07:30:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(333, NULL, '1274604321', 1, 'ac577cdd-613b-307a-8b8e-e4223578cad7', '2019-05-21', '351.95', '26082524', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:17', '2019-06-05 07:30:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(334, NULL, '1470424321', 1, '778c4051-fa94-3983-a4a6-cea83e4d6ae8', '2019-04-27', '698.69', '3291068', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:17', '2019-06-05 07:32:48', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(335, NULL, '943569181', 1, '33c7e151-bb66-30d2-9a97-c73364f44633', '2019-05-30', '1490.21', '18895558', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:17', '2019-06-05 07:32:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(336, NULL, '1022983789', 1, '7cb7f5bd-93ce-3c7f-890b-7cc5958d253d', '2018-07-17', '706.92', '29214827', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:17', '2019-06-05 07:30:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(337, NULL, '1277413005', 1, '211f4d9c-ff3e-38c6-bf2c-c9281a0cb5e1', '2018-09-01', '946.49', '40600112', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:17', '2019-06-05 07:30:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(338, NULL, '1465956131', 1, '822558c5-dd7b-3ac2-b84e-4aa57d379f17', '2019-02-09', '432.66', '45600571', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:17', '2019-06-05 07:30:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(339, NULL, '403920830', 1, 'f06cdb67-ca9d-3b81-9475-879819c02343', '2018-07-20', '2229.59', '27356642', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:17', '2019-06-05 07:30:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(340, NULL, '265317133', 1, '76c595ff-9fad-3da3-a30c-213f5c66fac0', '2018-10-02', '2573.09', '17028439', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:18', '2019-06-05 07:30:50', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(341, NULL, '934907798', 1, '72ebb668-4bf0-3b2e-940c-4e1344ec8997', '2018-08-25', '2209.47', '23298444', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:18', '2019-06-05 07:30:50', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_rating_5`) VALUES
(342, NULL, '798441611', 1, 'aa34783d-60d1-31b0-8e22-161b0a63419e', '2018-12-08', '1876.23', '4438587', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:18', '2019-06-05 07:30:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(343, NULL, '546111642', 1, '2bed730c-64c3-3f21-812c-b404e4a4de22', '2019-03-26', '2688.22', '4845139', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:18', '2019-06-05 07:30:50', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(344, NULL, '384606935', 1, '0c5586a2-c68b-33f6-a619-d96e736e17fa', '2019-04-03', '1460.58', '18983270', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:18', '2019-06-05 07:30:51', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(345, NULL, '638060282', 1, '30e823d0-552d-3537-9554-dd6ce0183915', '2019-05-22', '704.98', '35269866', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:18', '2019-06-05 07:30:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(346, NULL, '765537576', 1, '0d145204-74d6-3e33-b173-c264cd04149a', '2019-05-30', '891.26', '5810393', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:18', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(347, NULL, '496593294', 1, 'f797a1de-2843-3749-b819-6f8a4003f12f', '2018-09-23', '1174.55', '39392144', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:19', '2019-06-05 07:30:51', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(348, NULL, '833721047', 1, 'c67ed435-2dff-3cd9-b616-3f80b496e58e', '2018-11-24', '2905.50', '37898579', 9, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:19', '2019-06-05 07:29:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(349, NULL, '1098231874', 1, '1059446b-9330-397e-9f86-76e5110fa5ac', '2018-09-13', '873.76', '45834181', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:19', '2019-06-05 07:29:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(350, NULL, '335588267', 1, 'febb582e-3b75-3f88-9ee1-adda7ae280c5', '2018-11-12', '2502.35', '20618691', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:19', '2019-06-05 07:32:48', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(351, NULL, '971807930', 1, 'f49b7238-585f-38a2-9d60-03f9cbe218a9', '2019-05-24', '1541.06', '7515445', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:20', '2019-06-05 07:30:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(352, NULL, '1397308537', 1, 'd464372b-027f-3f19-ae4d-121d0f89fc3f', '2019-02-20', '1805.45', '25598619', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:20', '2019-06-05 07:30:51', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(353, NULL, '410511363', 1, '41f9468b-7224-34b2-83aa-0ed29fc7d0e7', '2019-05-24', '1212.97', '33337350', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:20', '2019-06-05 07:32:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(354, NULL, '67358733', 1, 'c087da5b-5e6e-3434-aa1c-b29193a066f7', '2019-06-03', '2385.69', '46037645', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:21', '2019-06-05 07:32:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(355, NULL, '1291182579', 1, '4e81f8e7-553d-3a9e-8785-5474aa82e4d1', '2018-10-26', '738.53', '29802423', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:22', '2019-06-05 07:30:52', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(356, NULL, '944016037', 1, 'cb224770-5b31-3691-8935-56937ff66fd9', '2018-06-07', '1362.72', '23749529', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:23', '2019-06-05 07:28:50', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(357, NULL, '1043143839', 1, 'f59af360-8c9e-3db0-9d1e-c5d128a1afa2', '2018-09-29', '1836.80', '47331515', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:23', '2019-06-05 07:30:52', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(358, NULL, '1238196888', 1, '7b84b427-1cb8-3686-a2b7-b27150e057fc', '2018-10-30', '1211.89', '41687688', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:24', '2019-06-05 07:30:52', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(359, NULL, '1369096131', 1, 'f811e06c-30ac-320a-951e-5828a0edbc76', '2018-09-03', '1734.48', '10196633', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:24', '2019-06-05 07:30:52', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(360, NULL, '414677197', 1, '136d94bc-e49f-3fcb-9a59-91ed5545e94d', '2019-04-05', '2276.75', '27910289', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:24', '2019-06-05 07:30:52', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(361, NULL, '311102457', 1, 'e38f5607-78d4-3a4a-a8d6-88f96d81cde1', '2019-02-17', '1693.34', '20510068', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:24', '2019-06-05 07:30:52', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(362, NULL, '1382004982', 1, '35dddc69-db6c-3562-8817-7fe91937df83', '2018-10-06', '2166.24', '32676315', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:24', '2019-06-05 07:30:52', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(363, NULL, '1226737627', 1, '6898e2fd-46a2-373f-bc9c-9f001635dbd7', '2019-03-02', '1872.29', '47557440', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:25', '2019-06-05 07:30:52', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(364, NULL, '1234476348', 1, '848b638a-a803-3e1c-9d23-15c4e1b507f5', '2019-04-23', '1416.99', '13410486', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:25', '2019-06-05 07:30:52', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(365, NULL, '1188563098', 1, 'd8c7a682-7d3c-3e49-a5b0-10ec4ded6078', '2018-06-11', '1670.78', '15439214', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:25', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(366, NULL, '1369339906', 1, '4c663052-5f60-3568-8151-cfdb6ca6997b', '2018-06-14', '2851.61', '8476752', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:25', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(367, NULL, '1488076845', 1, 'dbc70b87-e29d-3da2-8e82-fe6e00cacbbf', '2018-11-12', '680.17', '22022726', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:25', '2019-06-05 07:29:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(368, NULL, '1457820742', 1, '01aa1e3d-8578-35ed-9816-38ef4f1f304b', '2019-03-06', '2942.36', '49577275', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:25', '2019-06-05 07:28:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(369, NULL, '811367407', 1, 'f4eccfe5-71d2-34bb-a3bf-8d28add8f433', '2018-06-16', '1754.32', '48212361', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:25', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(370, NULL, '899443852', 1, '005a5122-9863-3776-bff4-4b5ed5a18117', '2018-10-14', '2571.83', '43840789', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:26', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(371, NULL, '265985841', 1, '9cd8f01e-3716-369c-bd56-3d1efa42680a', '2019-03-07', '672.50', '17917494', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:26', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(372, NULL, '274845665', 1, 'f2515734-5ac7-3bee-bcec-21689b12d314', '2019-01-02', '1177.05', '38644752', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:26', '2019-06-05 07:32:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(373, NULL, '123090813', 1, 'd7080d96-dcb8-33e5-bb3e-a232ee0ba5f8', '2018-08-18', '1149.30', '46294287', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:26', '2019-06-05 07:28:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(374, NULL, '1269445267', 1, '762fe6aa-6d41-3a58-aacb-60bde0bc7818', '2018-07-27', '1065.69', '14476367', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:26', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(375, NULL, '943032468', 1, 'fcaf6d59-6298-3108-8c48-475b73379f79', '2019-05-04', '2798.66', '12595355', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:26', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(376, NULL, '1272182201', 1, '5dd452fd-6ee4-31c8-a294-a6e25b1afcf7', '2018-11-23', '1824.21', '27625363', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:26', '2019-06-05 07:29:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(377, NULL, '523662459', 1, 'd1d743e5-aa86-329f-9868-fc91328b44a0', '2018-11-05', '2017.51', '45385838', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:26', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(378, NULL, '1407298556', 1, '5e196c66-b04e-331e-8eae-b61a4cceee73', '2019-05-08', '2540.66', '32127148', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:26', '2019-06-05 07:32:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(379, NULL, '1059936063', 1, 'aaeeb98b-18f8-3f8f-b609-05b30c461ba8', '2018-06-08', '2438.53', '43609148', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:27', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(380, NULL, '1186730935', 1, '5814ef30-6a18-3115-b664-9321a8098400', '2018-12-09', '2596.33', '11987039', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:27', '2019-06-05 07:29:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(381, NULL, '1171301464', 1, '75798a51-6fdb-3a03-b856-b5c50eab7cb4', '2018-07-12', '2648.38', '20039841', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:27', '2019-06-05 07:32:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(382, NULL, '1216769952', 1, '21d8bfc3-8d2c-3503-980a-4a97eba1da2f', '2019-02-13', '1669.84', '41452686', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:27', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(383, NULL, '1495223850', 1, '0e4da5c0-b72c-35cb-8a29-3d737a348f06', '2018-08-02', '308.62', '21107864', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:27', '2019-06-05 07:32:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(384, NULL, '1468179997', 1, 'fa74bf5a-65ec-3abd-b765-07b25663a5ee', '2019-05-23', '1106.13', '4961753', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:27', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(385, NULL, '16463343', 1, 'd9b7d3a3-6c24-3e4b-8c15-31c336cb480b', '2018-12-08', '1610.46', '43315644', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:27', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(386, NULL, '1218192602', 1, 'ad0f3f4c-bc12-370f-8aab-61d6ad16f4f3', '2018-11-10', '623.31', '28819959', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:27', '2019-06-05 07:30:53', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(387, NULL, '1475022539', 1, '651a30fc-f26d-3ebe-84e2-5ae23e5207e3', '2019-02-13', '2147.62', '13401515', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:28', '2019-06-05 07:30:54', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(388, NULL, '1153026456', 1, 'f26d5a25-fe95-3ef5-89e2-4703fb808982', '2019-03-02', '1603.54', '4979506', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:28', '2019-06-05 07:28:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(389, NULL, '1543961050', 1, '8fc255c7-cf9f-31a4-9f12-9041fc244877', '2019-02-24', '2231.71', '47371789', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:28', '2019-06-05 07:28:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(390, NULL, '187563492', 1, '8619c710-9700-355b-a39e-cf454fb39c91', '2019-06-01', '1048.37', '26139857', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:28', '2019-06-05 07:29:37', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(391, NULL, '189732348', 1, 'c0008259-5c8c-3b93-9056-4dd1e39cb560', '2018-06-08', '2260.31', '24735941', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:28', '2019-06-05 07:30:54', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(392, NULL, '183782399', 1, 'c9360e6c-2892-32f1-8f19-0251dcf4d599', '2019-03-31', '1497.05', '40342892', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:28', '2019-06-05 07:30:54', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(393, NULL, '502636557', 1, 'c79a7887-fd5b-3a66-8748-eeddcd66f837', '2019-05-18', '1811.15', '34804725', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:28', '2019-06-05 07:30:54', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(394, NULL, '686197730', 1, '868c2329-7951-3450-b6ec-25dfa73149eb', '2018-10-26', '953.05', '44279862', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:29', '2019-06-05 07:30:54', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(395, NULL, '165511016', 1, 'ab7005f6-63e9-34be-b366-a1dad5621e59', '2018-07-18', '1519.14', '19388517', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:29', '2019-06-05 07:32:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(396, NULL, '723239196', 1, '4c440087-c333-31a8-b7d2-80d57363161f', '2018-08-07', '472.77', '45376868', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:29', '2019-06-05 07:30:54', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(397, NULL, '1511935795', 1, '0d92f99d-e086-30e7-8c02-6e5e79679a03', '2018-11-08', '739.42', '32678914', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:29', '2019-06-05 07:30:54', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(398, NULL, '793342557', 1, 'bc5d0ce3-d422-396c-919c-1769dba96c1b', '2018-07-19', '797.68', '6622824', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:29', '2019-06-05 07:30:54', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(399, NULL, '715885803', 1, 'e7f4e15e-f694-36b6-961f-e3d4c5163920', '2019-04-27', '2833.59', '41074664', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:29', '2019-06-05 07:32:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(400, NULL, '716734403', 1, 'ec8aa72a-6629-30b5-9190-67b39f0bf1a7', '2019-05-30', '646.97', '45517890', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:30', '2019-06-05 07:30:54', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(401, NULL, '501503691', 1, '7ff64ea8-80d5-38a7-a625-8d63f950c7f1', '2018-06-18', '2799.86', '27652999', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:30', '2019-06-05 07:30:54', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(402, NULL, '570766515', 1, '5038420f-5aa3-3c24-b4ab-47b45bcef2ff', '2018-10-11', '1079.18', '39487966', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:30', '2019-06-05 07:30:55', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(403, NULL, '10916342', 1, '437b9752-16af-346a-b0df-2b725b8f055c', '2019-01-26', '2345.55', '19092278', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:30', '2019-06-05 07:28:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(404, NULL, '262559665', 1, '829a0d03-507b-3bef-9cae-a91c285d41f5', '2018-07-14', '1010.88', '26009967', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:30', '2019-06-05 07:30:55', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(405, NULL, '826945069', 1, 'df98df63-a497-3be7-a79a-26ab42b416e3', '2019-03-08', '539.15', '16826150', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:30', '2019-06-05 07:30:55', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(406, NULL, '1091393519', 1, 'e994b694-2fb7-3ccd-851a-86a293f900e4', '2019-01-26', '837.33', '20690786', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:31', '2019-06-05 07:30:55', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(407, NULL, '953985118', 1, '9aab9e5c-03ae-3b71-8acf-b08b2f424562', '2018-12-19', '972.15', '14360962', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:31', '2019-06-05 07:30:55', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(408, NULL, '977578481', 1, '15cb091c-1eab-3d51-ae42-132eb34ff7fb', '2019-05-09', '1482.54', '41872855', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:31', '2019-06-05 07:30:55', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(409, NULL, '835127943', 1, 'e58924cb-7b42-3dce-80c4-304f15c37cd5', '2018-08-14', '2846.86', '6985184', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:31', '2019-06-05 07:29:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(410, NULL, '888905002', 1, '6eb7b97b-0849-3453-9760-50604f416260', '2018-07-06', '2344.65', '25014617', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:31', '2019-06-05 07:30:55', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(411, NULL, '755777902', 1, 'c7201220-e168-3cde-b8c5-4ea47d9b4853', '2018-09-22', '624.22', '12262086', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:31', '2019-06-05 07:30:55', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(412, NULL, '1296130990', 1, 'df4654d4-c7f2-3b69-86ac-a9874c23eed6', '2018-12-25', '1013.01', '11082936', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:32', '2019-06-05 07:30:55', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(413, NULL, '682943850', 1, 'f17212e0-5721-3308-bae7-1bcebf59b1b9', '2019-02-05', '1044.60', '41138765', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:32', '2019-06-05 07:28:52', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(414, NULL, '905925796', 1, '92cb7bb3-edc1-3be2-92a5-c50249e0d82f', '2018-11-16', '1773.03', '4687880', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:32', '2019-06-05 07:30:56', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(415, NULL, '1185072136', 1, 'd7bcd64e-d789-3d0e-9f23-07f07bb9b60d', '2018-06-28', '657.74', '46750365', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:32', '2019-06-05 07:28:06', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(416, NULL, '311968020', 1, '672953c2-88ca-3461-875f-65df3514b124', '2018-08-26', '2365.11', '3639004', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:32', '2019-06-05 07:30:56', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(417, NULL, '948948584', 1, '4f1e50a4-96b6-3a61-808a-74ae6cb92d96', '2019-05-03', '2337.42', '43947292', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:33', '2019-06-05 07:32:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(418, NULL, '1062441178', 1, '3ed4d8a8-281c-3ad8-be3a-ca664a08ab31', '2018-07-25', '1936.40', '4429414', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:33', '2019-06-05 07:30:56', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(419, NULL, '1017008672', 1, 'a375c229-381d-3f10-8665-4d39c4fa444f', '2018-07-03', '2653.11', '10934539', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:33', '2019-06-05 07:30:56', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(420, NULL, '1064034770', 1, 'c6ce8b62-72f4-3aab-913e-60f1cd3cf2da', '2018-07-25', '439.41', '6057067', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:33', '2019-06-05 07:30:56', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(421, NULL, '834869550', 1, '0f9a1a1c-3ccc-3706-bd37-dee9877fbb98', '2018-12-10', '415.70', '29693521', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:33', '2019-06-05 07:30:56', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(422, NULL, '1278240685', 1, 'd4b55585-8f92-33f1-a1ac-c92469a6ac00', '2019-05-19', '2431.73', '45979691', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:34', '2019-06-05 07:28:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(423, NULL, '206589911', 1, 'fa1230f0-7693-3e43-8625-4ba41104d33c', '2019-05-18', '1038.22', '21090462', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:34', '2019-06-05 07:30:56', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(424, NULL, '439374984', 1, '527cb43a-ca32-3407-8f13-c38e7131aa5b', '2019-01-10', '2245.18', '39575814', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:34', '2019-06-05 07:30:56', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(425, NULL, '509454081', 1, '547c05fc-c823-3683-b6da-b5fa8aec6c64', '2018-08-31', '1865.56', '42934061', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:34', '2019-06-05 07:30:56', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(426, NULL, '1089930019', 1, 'd0b72c33-8c88-373e-a535-78353bc5f4d6', '2019-02-24', '949.49', '29330728', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:34', '2019-06-05 07:30:57', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(427, NULL, '407989053', 1, 'be042cbc-11ac-3866-8446-ad3a779d5a16', '2018-12-04', '869.89', '36721041', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:35', '2019-06-05 07:30:57', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(428, NULL, '316925217', 1, '758e3b91-691b-35ce-b172-b9f18c674e20', '2019-04-08', '1146.52', '12049332', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:35', '2019-06-05 07:30:57', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(429, NULL, '1463647517', 1, '0e482718-d87e-352a-88f0-580f3b27959f', '2018-07-05', '878.79', '40040924', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:35', '2019-06-05 07:30:57', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(430, NULL, '824820203', 1, '884bb9c0-adc1-399d-b997-923ecdc7dd6a', '2019-04-13', '1110.88', '44275350', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:35', '2019-06-05 07:30:57', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(431, NULL, '1333982729', 1, '66e19d4b-507e-37f5-9718-c71788798059', '2018-08-09', '854.49', '48586550', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:36', '2019-06-05 07:30:58', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(432, NULL, '946254024', 1, 'e0de6e14-cb43-3c4c-bebe-10a7646f27f4', '2019-03-24', '1125.54', '48704274', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:36', '2019-06-05 07:30:58', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(433, NULL, '606375319', 1, 'f364e54e-f4db-3fd2-9580-fbb7607e668f', '2018-11-11', '2796.11', '40313360', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:36', '2019-06-05 07:32:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(434, NULL, '1345091670', 1, '2b510e87-e27d-3397-8f7a-683d7cf0788d', '2018-12-14', '2067.24', '47667083', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:36', '2019-06-05 07:32:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(435, NULL, '490133280', 1, 'c22292bb-8ade-3bc0-8233-0ffd5357afe0', '2019-01-07', '709.07', '1043198', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:37', '2019-06-05 07:30:58', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(436, NULL, '990610833', 1, 'd3ccb3e4-ca41-3df8-ab64-ee0b234f85ad', '2019-04-05', '1630.38', '40874142', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:37', '2019-06-05 07:30:58', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(437, NULL, '630708916', 1, '4a43fbe2-c6a3-3a50-a689-07c2427d0707', '2018-11-21', '791.28', '16799890', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:37', '2019-06-05 07:30:58', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(438, NULL, '863539155', 1, '4cd1e78c-ef88-30ed-b245-00bf04d90562', '2019-04-16', '702.46', '38091267', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:37', '2019-06-05 07:27:58', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(439, NULL, '1426195652', 1, '7fe44756-7128-32ce-8918-af40c784870d', '2019-05-25', '1940.59', '31129372', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:37', '2019-06-05 07:30:58', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(440, NULL, '857568278', 1, 'f583c02f-2f78-31b4-86e9-681cae915f3d', '2018-12-16', '1303.00', '37765970', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:38', '2019-06-05 07:30:59', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(441, NULL, '44535152', 1, '399c04f9-3d97-32d5-9d23-05f20df6ce1d', '2018-08-13', '365.95', '1288070', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:38', '2019-06-05 07:30:59', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(442, NULL, '197461666', 1, '3fb3087c-8a20-368c-bdd0-f072c5fd9319', '2018-12-01', '676.85', '15128290', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:38', '2019-06-05 07:32:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(443, NULL, '684201624', 1, '7f711fba-55fd-3807-a852-2cd1c3d7d905', '2018-10-02', '514.16', '27071559', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:38', '2019-06-05 07:30:59', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(444, NULL, '1390885770', 1, '5d7e3747-a798-33b6-a777-41cbe439d413', '2018-10-17', '1062.52', '15316794', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:38', '2019-06-05 07:28:00', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(445, NULL, '436570859', 1, '6a9e0def-2452-332b-be68-f147a82cb494', '2018-07-16', '2943.96', '29453680', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:39', '2019-06-05 07:30:59', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(446, NULL, '80186125', 1, '2d8dff14-9c02-3a76-8c31-09f6b1d32df1', '2018-08-03', '1345.31', '40719730', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:39', '2019-06-05 07:30:59', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(447, NULL, '1208187613', 1, '57af7e02-7782-3c5a-9976-3b64b72bbbd4', '2018-12-06', '1422.36', '35810857', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:39', '2019-06-05 07:30:59', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(448, NULL, '671506408', 1, '0784460b-0572-33de-b456-91103b1ac1c4', '2019-04-20', '2611.91', '46891472', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:39', '2019-06-05 07:30:59', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(449, NULL, '1504701904', 1, '31a0f5f7-b0e1-3926-a2bc-0d3cdfe77740', '2019-05-19', '1141.51', '40739273', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:39', '2019-06-05 07:32:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(450, NULL, '274485139', 1, 'c4133eeb-8101-317e-aa45-9f13b894659f', '2018-06-21', '937.22', '42081768', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:40', '2019-06-05 07:28:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(451, NULL, '1289984646', 1, '6f411a0f-4ec0-349d-aaac-7e0d2a86df3f', '2019-05-19', '2665.93', '21139928', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:40', '2019-06-05 07:31:00', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(452, NULL, '701801293', 1, '2c6f0c69-f270-35c4-a01a-dc518cf1f871', '2019-03-29', '1207.42', '46520544', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:40', '2019-06-05 07:31:00', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(453, NULL, '31427794', 1, '5363cd3a-b00f-3378-8650-bbf9e6a67334', '2019-04-09', '2480.93', '30867537', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:40', '2019-06-05 07:31:00', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(454, NULL, '1121717142', 1, '6fd7fffd-e86f-36d6-92ee-26529519b4f1', '2018-08-18', '1724.29', '23641103', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:41', '2019-06-05 07:31:01', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(455, NULL, '718936698', 1, '6e74241a-c37c-31a0-96c4-a71228ac684f', '2018-07-07', '1293.60', '47967414', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:41', '2019-06-05 07:31:02', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(456, NULL, '1172193671', 1, '0f7aed3f-884b-3a60-bc40-078bd29c3b87', '2019-01-29', '2913.97', '1556892', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:41', '2019-06-05 07:31:02', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(457, NULL, '1213425343', 1, 'a1b4f535-d0a1-3841-bb88-4b88de435ba5', '2018-11-27', '2100.67', '46261964', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:41', '2019-06-05 07:31:02', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(458, NULL, '360698631', 1, 'e3246266-5525-3810-a220-44a4db92494f', '2019-02-24', '861.13', '40497635', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:42', '2019-06-05 07:28:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(459, NULL, '762134165', 1, '9d0b94f5-3635-3d01-80d5-f70ea310a604', '2019-01-16', '2690.86', '42018420', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:42', '2019-06-05 07:31:02', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(460, NULL, '138211265', 1, '25f26e4d-8f24-32f1-a8c6-750185be4553', '2018-09-13', '1955.47', '38490963', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:42', '2019-06-05 07:31:03', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(461, NULL, '626263619', 1, '46c4f6c8-dae0-3b75-8cc2-981235c79bd6', '2018-09-25', '2106.92', '11274398', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:42', '2019-06-05 07:31:03', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(462, NULL, '281243085', 1, '49acb4b6-e36a-303e-8f16-a1a71954aebd', '2018-12-24', '1216.87', '9625291', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:42', '2019-06-05 07:31:03', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(463, NULL, '582470012', 1, '1cfa1fc7-4bba-3fa8-8b0a-a09b24c2e799', '2018-09-08', '1138.68', '14084497', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:43', '2019-06-05 07:31:03', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(464, NULL, '758740829', 1, 'bef9c35e-ad4d-347b-a576-59860d41764a', '2019-03-02', '987.88', '8185955', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:43', '2019-06-05 07:31:03', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(465, NULL, '1150833688', 1, 'e5ead1e2-5c71-35b5-a266-81bde645d266', '2018-11-02', '2455.73', '23772651', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:43', '2019-06-05 07:28:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(466, NULL, '669888523', 1, '07a6c6a1-cd51-3b61-a280-8606316ae59e', '2019-05-30', '2145.60', '49175064', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:43', '2019-06-05 07:31:03', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(467, NULL, '1399777755', 1, '23e674b2-4e11-3ecb-88a2-df8249e97266', '2019-04-23', '2945.10', '15744878', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:43', '2019-06-05 07:29:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(468, NULL, '113941485', 1, '39ff811e-34cf-30d5-9d77-735ac3240e4f', '2018-09-09', '1375.42', '38135480', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:43', '2019-06-05 07:31:03', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(469, NULL, '619113889', 1, '410f1cf4-2d89-3090-aedd-646f69cef5ef', '2019-01-13', '1653.09', '43734185', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:44', '2019-06-05 07:31:04', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(470, NULL, '962167977', 1, '1545654f-8374-3335-8a37-6d7c1318ff72', '2018-07-23', '1746.70', '44428016', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:44', '2019-06-05 07:31:04', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(471, NULL, '99189562', 1, '0c942587-906c-31de-91da-616bffc145ba', '2018-10-07', '1348.88', '4927902', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:44', '2019-06-05 07:31:04', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(472, NULL, '561249126', 1, '87b82b9a-11d3-39c6-b712-be19caffdee3', '2018-11-26', '1958.46', '8888634', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:44', '2019-06-05 07:29:05', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(473, NULL, '1128612314', 1, '0977678f-806c-32eb-bcc5-b662beddd28d', '2018-11-28', '2566.56', '19450466', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:44', '2019-06-05 07:31:04', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(474, NULL, '566124049', 1, '87aeccde-b6bd-3668-9554-61aceb760780', '2019-02-04', '1179.46', '47084463', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:45', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(475, NULL, '878178538', 1, '72e8a8e4-618c-3dc8-8804-8f187b6a0eb0', '2018-07-05', '1920.43', '10266277', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:45', '2019-06-05 07:31:04', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(476, NULL, '1092968039', 1, '11b3e5fb-c6de-3941-9183-bcd18738c4fd', '2019-02-18', '639.42', '16444484', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:45', '2019-06-05 07:31:04', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(477, NULL, '632889784', 1, '3f8b6cf4-ad18-3646-b751-9ed41c13acaa', '2018-06-28', '1485.22', '35308263', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:45', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(478, NULL, '902481098', 1, '4b1e64dd-4604-3f61-aa6d-814e47f39b1d', '2019-01-12', '2347.42', '24274618', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:45', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(479, NULL, '1368458553', 1, '9e6af9b9-1053-3fd7-bc1f-1ceac4659f81', '2019-02-25', '1556.73', '48718779', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:45', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(480, NULL, '569559697', 1, 'fe0233e5-0c4e-398a-9891-bb5734419352', '2019-01-05', '333.94', '36684855', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:46', '2019-06-05 07:28:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(481, NULL, '242770809', 1, '29f5e770-5680-37a2-a9f7-528c978ccbaf', '2018-06-20', '2770.97', '2929884', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:46', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(482, NULL, '752792303', 1, 'fc17e171-1415-3747-9cbf-c9db3df04017', '2018-12-06', '2373.68', '14990987', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:46', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(483, NULL, '961963541', 1, '7ce0b2dd-b3d1-3bb1-8456-f0eee88ab0f5', '2019-06-01', '1654.80', '43139905', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:47', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(484, NULL, '917620412', 1, '31a027ac-7705-3b7d-b7bc-f60265b106cf', '2018-11-24', '2815.65', '40788883', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:47', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(485, NULL, '1353291622', 1, '364104a1-cb2e-3e33-9b7c-6aba8191001e', '2018-08-10', '2281.12', '27268636', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:47', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(486, NULL, '728885593', 1, 'c57fe3e8-de53-3fa1-99c6-8cd172cedd13', '2019-01-16', '1056.09', '49361206', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:47', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(487, NULL, '300086350', 1, '7f0bd494-715b-35d2-b4e5-2153c9aa5fac', '2018-12-18', '2377.13', '39333850', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:47', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(488, NULL, '882168136', 1, '69a98a9a-b7c7-3238-ac00-55a2430e6c7f', '2018-06-24', '723.88', '34154140', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:47', '2019-06-05 07:29:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(489, NULL, '667093307', 1, '535cbc95-9161-3a9a-b150-f1f675a35e66', '2018-10-11', '693.67', '8212686', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:48', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(490, NULL, '75823202', 1, 'fe61d62c-5434-300c-9224-2e44581b4bb8', '2018-09-04', '918.42', '21159598', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:48', '2019-06-05 07:29:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(491, NULL, '1039626219', 1, '2911910a-ffd4-3eb7-91e3-88e4f3795215', '2018-07-18', '1154.35', '47946943', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:48', '2019-06-05 07:31:05', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(492, NULL, '603771386', 1, '9e406d36-3a44-35ad-9df7-15decb2db043', '2018-08-27', '570.05', '46354224', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:48', '2019-06-05 07:32:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(493, NULL, '51689535', 1, '3079387f-b95b-3cfa-aa19-109e4ceb60e8', '2019-01-16', '1760.07', '39835635', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:49', '2019-06-05 07:31:06', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(494, NULL, '573373751', 1, '8f7b5822-09ef-382c-8e47-e3880e359f73', '2019-05-06', '2813.69', '21724343', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:49', '2019-06-05 07:32:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(495, NULL, '374004187', 1, 'b1e8df2a-3ed0-36c0-8a1b-56856bf7f112', '2018-12-14', '797.71', '44645045', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:49', '2019-06-05 07:29:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(496, NULL, '1372602497', 1, '8d9df25d-f7ed-3c90-93a2-9dad71e6f65f', '2018-10-12', '2076.98', '44469812', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:49', '2019-06-05 07:31:06', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(497, NULL, '957433922', 1, '24c1bc08-5c61-372c-8ae0-971fdf51fd59', '2018-07-11', '1095.58', '9957183', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:49', '2019-06-05 07:31:06', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(498, NULL, '730055814', 1, '16a53398-16ab-3625-ad82-a55007eb7420', '2018-06-21', '654.05', '41869179', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:49', '2019-06-05 07:31:06', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(499, NULL, '1521863640', 1, 'fb61163c-20a7-3574-8840-e780097f86c6', '2018-10-28', '1769.23', '4839608', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:50', '2019-06-05 07:31:06', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(500, NULL, '559227756', 1, '3dbb4603-1569-3e3f-89f0-7ca75df14600', '2018-06-07', '1245.32', '5763306', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:50', '2019-06-05 07:29:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(501, NULL, '1427798062', 1, 'ad7a8983-eedb-337a-a3e7-bb38d8c29cbb', '2019-03-16', '1253.80', '30860113', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:50', '2019-06-05 07:31:06', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(502, NULL, '411439892', 1, 'bb0393ac-1a69-36bc-828e-f3b93fc86130', '2018-06-25', '2875.10', '37618342', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:50', '2019-06-05 07:31:06', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(503, NULL, '1435543128', 1, 'bafd3e8e-c532-371f-ad2d-d43143bf0bb5', '2019-01-06', '2936.96', '37655838', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:50', '2019-06-05 07:31:06', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(504, NULL, '1157494632', 1, '330310ab-d0ce-3ce3-88f2-4ee6b47d0332', '2018-09-14', '1174.13', '32973604', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:51', '2019-06-05 07:31:06', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(505, NULL, '458533132', 1, 'cb90b12f-2437-376a-ba0a-e5b528631bf3', '2018-07-28', '2769.66', '38810201', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:51', '2019-06-05 07:32:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(506, NULL, '543766091', 1, 'c01dd38d-956e-30da-970b-1e5f0042876b', '2018-07-30', '1014.06', '13126279', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:51', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(507, NULL, '1320938461', 1, 'b8218dfc-dad7-3594-902d-1a2f3d649c81', '2018-09-24', '1022.62', '32722008', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:51', '2019-06-05 07:31:06', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(508, NULL, '420743895', 1, 'be9d19e8-50ba-386f-877f-8a456dfe5043', '2018-11-24', '1500.98', '23603190', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:51', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(509, NULL, '54905470', 1, 'ac4f38d7-d956-3910-93be-70f00a0a0b77', '2019-04-05', '1373.92', '12733763', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:51', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(510, NULL, '278095165', 1, '2dfccbe5-5336-3062-ba36-d1ae85b39a06', '2019-06-02', '1857.13', '30996041', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:52', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(511, NULL, '1472372547', 1, 'ea3e90e8-fa6f-34b8-85ab-f558188c1a8e', '2019-01-11', '2903.12', '14802126', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:52', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_rating_5`) VALUES
(512, NULL, '605070060', 1, '0e44ee19-93cd-3960-998a-c112ca529f3e', '2018-11-04', '1232.29', '11204330', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:52', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(513, NULL, '1001603860', 1, '6e0443cf-d23f-3c7d-bae3-2c3b79cbd24d', '2018-12-18', '334.43', '13535371', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:52', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(514, NULL, '1275608790', 1, 'f61c1ecf-da65-3cad-8d00-222babf04736', '2018-06-29', '2119.49', '39239610', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:53', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(515, NULL, '1354298304', 1, '04bf65b7-bf30-3baa-b0c3-e76a20b269d2', '2018-10-16', '550.78', '10442341', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:53', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(516, NULL, '954544160', 1, 'f184d5d4-edfa-3f8b-b0c8-eb11da6d38e9', '2018-11-26', '838.97', '21924415', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:53', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(517, NULL, '852763222', 1, 'fc286abc-f8e5-3f97-a0e7-e594996932e8', '2018-11-24', '1832.37', '18738370', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:53', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(518, NULL, '301191331', 1, '3471f82c-c259-38d5-85e8-8a4633a0ef5e', '2019-05-24', '2627.84', '3590764', 9, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:53', '2019-06-05 07:29:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(519, NULL, '1021850489', 1, '227d693e-8142-3082-819f-93ef2c24a037', '2018-10-10', '1981.42', '21806972', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:53', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(520, NULL, '729182086', 1, 'b389a859-f7e5-3337-9a1e-e65c04a82006', '2018-11-28', '2951.18', '8938491', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:54', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(521, NULL, '23152330', 1, 'e37a657f-3e7c-357c-9de4-90dd58e61640', '2019-04-19', '551.09', '37141092', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:54', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(522, NULL, '1164988845', 1, '37169071-5a6a-3752-87a7-d49ca82b6edc', '2019-03-06', '2379.16', '38174809', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:54', '2019-06-05 07:31:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(523, NULL, '373857830', 1, '0df6a54e-dbf6-3f60-9018-f135558b0660', '2019-04-26', '1093.60', '15383500', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:54', '2019-06-05 07:28:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(524, NULL, '758833912', 1, '32cf4ded-998f-3969-a7c8-0439827337a6', '2019-03-23', '1953.93', '21649643', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:54', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(525, NULL, '900197981', 1, '87b4416e-da9c-3ac1-8e89-87ed9dbef819', '2018-06-27', '548.72', '39969505', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:55', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(526, NULL, '869935290', 1, 'c4a6ef03-dbcc-3467-94c7-10e3911cb2f5', '2019-06-03', '1278.07', '46363256', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:55', '2019-06-05 07:28:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(527, NULL, '579709536', 1, '409d7690-36c2-384f-98d8-6f0395ee5eef', '2018-09-07', '680.43', '1833170', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:55', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(528, NULL, '1352193637', 1, '12dbda88-5f1b-3f9e-8415-44d6f1de0f41', '2019-01-22', '2967.06', '41630653', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:55', '2019-06-05 07:29:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(529, NULL, '1377844504', 1, '58bff5ff-a66b-305f-b61f-0056c4a90260', '2018-06-26', '2822.72', '13119819', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:55', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(530, NULL, '1108251419', 1, 'f9242897-7831-329c-a15c-d9623e164450', '2018-09-25', '2835.68', '34478958', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:55', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(531, NULL, '170300007', 1, 'b2ed31dd-a0b9-365e-8aba-d56f764270ef', '2019-05-12', '1961.18', '23057709', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:56', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(532, NULL, '1230774168', 1, 'ad6fef71-2111-32a4-9080-61856a00ceae', '2019-01-20', '2524.03', '46476204', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:56', '2019-06-05 07:29:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(533, NULL, '377298741', 1, '6f34ff22-a94c-3cf3-baed-8aceb98f4b49', '2018-06-16', '1508.75', '39875483', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:56', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(534, NULL, '467338919', 1, '46411814-b78b-383f-89c6-9bc5ffb66b9c', '2019-04-14', '2034.08', '37726488', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:56', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(535, NULL, '37258901', 1, 'fa7fabe7-4e59-380d-a2fa-22cc2414a4ee', '2018-10-24', '1243.72', '19540036', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:56', '2019-06-05 07:32:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(536, NULL, '841168008', 1, '98a6e4c1-13e4-39db-8783-09a975b8765f', '2019-05-08', '541.41', '49358481', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:57', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(537, NULL, '650766676', 1, '338f5306-0e3b-38bf-9343-6f1337d928d5', '2018-08-10', '1791.73', '1175538', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:57', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(538, NULL, '294151489', 1, '78eef0a3-12fc-304b-a1d0-155a31db0694', '2018-08-03', '1125.12', '22734171', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:57', '2019-06-05 07:32:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(539, NULL, '667230202', 1, 'fb171cec-32ea-3571-9773-3e57885fc79a', '2019-01-02', '1872.45', '7066243', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:57', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(540, NULL, '550422768', 1, '0566559e-15a6-38e6-a295-b229057ce40c', '2019-05-15', '2260.80', '25094631', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:58', '2019-06-05 07:29:42', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(541, NULL, '222226019', 1, '691d6b5d-83ca-345a-8fd9-646b0b7014a1', '2018-10-15', '1669.55', '36311582', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:58', '2019-06-05 07:31:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(542, NULL, '347252914', 1, '8c27b8e4-7edb-305c-89d4-f87106186f34', '2019-02-25', '1943.70', '27889718', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:58', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(543, NULL, '1387292719', 1, '9abae0a5-83a1-3c78-8325-253246353aa4', '2019-02-07', '2767.67', '18124882', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:58', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(544, NULL, '808334666', 1, 'e3a856cd-056a-3bb8-aae3-3c1726110ac2', '2019-02-05', '1035.15', '13593130', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:58', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(545, NULL, '1045095460', 1, '5f387977-b0d9-3a02-bb0f-a47d1066ff7b', '2018-10-04', '424.74', '34780719', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:58', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(546, NULL, '634764105', 1, '69b28b41-125d-369e-b6c5-44ebe5af178e', '2018-06-09', '1117.97', '48973236', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:59', '2019-06-05 07:28:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(547, NULL, '138029687', 1, 'dcec4a4e-78ee-3d73-afa5-59537e36938e', '2019-03-19', '2066.08', '45990746', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:59', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(548, NULL, '109689911', 1, 'ecb81e9c-abdf-3131-ab5f-9603ca8dd3ad', '2018-08-07', '2039.99', '2025421', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:59', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(549, NULL, '1156416589', 1, '07f20645-6a6d-381e-be84-e727b0104b1e', '2019-04-19', '1781.31', '49646077', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:59', '2019-06-05 07:29:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(550, NULL, '599609520', 1, '197add78-e76c-36e9-ad6b-8d590d51a76e', '2018-09-16', '1202.04', '42511167', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:24:59', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(551, NULL, '728341213', 1, 'ca6c2c6e-49ee-37a6-9ab4-ef96906216dd', '2018-12-22', '752.24', '8454855', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:00', '2019-06-05 07:32:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(552, NULL, '412871504', 1, '3c41060c-da44-30bb-bdde-f9bc997744cf', '2019-05-26', '433.41', '47079977', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:00', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(553, NULL, '953953050', 1, '4ca5e62d-54df-321a-a985-b7023b0d2c12', '2018-08-10', '2065.28', '36213843', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:00', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(554, NULL, '991493303', 1, 'd39c208d-f40f-31ae-8cfa-7e510e295f8c', '2018-10-14', '447.56', '20709954', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:00', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(555, NULL, '231634019', 1, 'db825599-d725-3d3f-abb4-24e0724dc52e', '2019-04-08', '1015.55', '22931596', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:00', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(556, NULL, '307002233', 1, '1362b0b7-5d06-3f64-add2-c652df2059f5', '2019-03-31', '2400.22', '47318167', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:00', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(557, NULL, '1290450402', 1, '6c62b49a-098c-38af-acd3-30ea1141e902', '2019-01-16', '1384.16', '36789007', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:01', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(558, NULL, '1349418941', 1, '86d701b7-82e0-3396-b3fc-b0dc66be1193', '2019-02-24', '1319.47', '24143024', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:01', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(559, NULL, '188071747', 1, 'ce29cc13-17a2-3788-8365-b1815f98bc24', '2018-06-07', '2518.29', '34307622', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:01', '2019-06-05 07:31:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(560, NULL, '1081472254', 1, '04689547-9164-3b5c-a785-7ef0ffbe95df', '2019-02-19', '1159.68', '25561344', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:01', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(561, NULL, '670605913', 1, '73c4bba1-aacb-37a7-a24f-544b0252cd77', '2018-10-09', '592.54', '5201350', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:01', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(562, NULL, '1418508810', 1, '216304c3-ee39-35a7-8bbe-8e0fc26e99ce', '2019-01-03', '2243.17', '7030949', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:02', '2019-06-05 07:32:50', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(563, NULL, '29297970', 1, 'abfd8864-ce9e-3d69-be65-fc7ce951dc26', '2019-01-16', '2008.55', '35780833', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:02', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(564, NULL, '1296260771', 1, '63df591a-47b3-319c-aa6b-be3ad33e144b', '2018-09-13', '569.95', '21477799', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:02', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(565, NULL, '1202758961', 1, '238f62c4-433b-3c10-8835-06578e78d419', '2019-03-04', '2797.96', '23517518', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:02', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(566, NULL, '1528003082', 1, 'd955f646-9be0-3b25-a25f-b1c0e9d1bb72', '2018-12-12', '671.34', '45674386', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:02', '2019-06-05 07:28:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(567, NULL, '154414049', 1, '8bfbec37-1e0b-3c75-bbb4-1efe2edc8d8f', '2018-07-16', '1544.97', '29062207', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:03', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(568, NULL, '763110639', 1, 'ab7e32cf-d6eb-3ded-8dba-887b40956fd6', '2019-01-01', '1876.60', '43640181', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:03', '2019-06-05 07:28:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(569, NULL, '1103513708', 1, '72506709-aca2-3793-b45c-dc888b38660f', '2019-02-20', '559.31', '22944115', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:03', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(570, NULL, '422748570', 1, 'd6fc052f-2b5d-31b1-9791-74924e203268', '2018-12-28', '2024.14', '25920578', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:03', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(571, NULL, '334621967', 1, '865a61e0-65ef-3dd7-8f26-1cc9c33b4a89', '2018-09-14', '588.42', '29283734', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:04', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(572, NULL, '1089253733', 1, '7dc6dfa4-9e81-3759-8ea7-17bb54f04150', '2019-04-15', '2871.88', '6318879', 9, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:04', '2019-06-05 07:29:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(573, NULL, '676189906', 1, 'ac396a36-fb37-335e-8914-4ba7e6959ed7', '2019-05-25', '926.03', '32418839', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:04', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(574, NULL, '529040818', 1, 'a8eba2a4-acaa-3266-a807-e34566c036f2', '2018-10-12', '2628.51', '25908231', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:04', '2019-06-05 07:29:37', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(575, NULL, '1066196836', 1, 'e31f5cc7-5b64-35b9-b719-0680b4f653ad', '2018-10-03', '1102.80', '15281281', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:05', '2019-06-05 07:32:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(576, NULL, '592058101', 1, '2288a489-cc05-3cd1-b84e-6cfbcb69d3d0', '2019-03-06', '1861.46', '25281040', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:05', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(577, NULL, '947477827', 1, '548a85b3-3856-3254-923e-d0a2ec296111', '2018-12-29', '897.20', '6876039', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:05', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(578, NULL, '258549912', 1, 'b6dc5dc1-7d06-341b-ae52-9e7a8ba244e8', '2018-10-03', '2621.98', '23913523', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:05', '2019-06-05 07:31:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(579, NULL, '1246362124', 1, '7b254116-77f9-3be3-b340-da96007e4eb3', '2018-12-03', '1826.94', '26126272', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:05', '2019-06-05 07:31:11', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(580, NULL, '984149178', 1, '4a4b703f-9017-3d0f-ac44-5dd58394b342', '2018-11-23', '2488.91', '29034769', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:05', '2019-06-05 07:31:11', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(581, NULL, '988366705', 1, 'b125db42-c010-3352-8061-7bcd88ea1c07', '2019-06-02', '2037.33', '47023672', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:06', '2019-06-05 07:31:11', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(582, NULL, '901724895', 1, '6e896721-ed04-3e5a-a221-1f3076bc6938', '2019-02-06', '1338.03', '23705532', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:06', '2019-06-05 07:29:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(583, NULL, '1454622669', 1, 'aab5322e-bbac-32a5-abfc-eb56e1eb6ba1', '2019-05-27', '1799.92', '1762047', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:06', '2019-06-05 07:31:11', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(584, NULL, '934217563', 1, 'c6b994a5-7643-3074-a229-913c5a2969cb', '2019-03-17', '2383.22', '27758525', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:06', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(585, NULL, '824749789', 1, 'da15a02e-eb62-35c8-b504-181cd9a958fe', '2018-11-25', '809.44', '19655918', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:06', '2019-06-05 07:31:11', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(586, NULL, '1360657729', 1, '9da1c36f-e7c4-3063-ae31-fdcd37d0a17a', '2018-11-11', '1979.21', '3075561', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:06', '2019-06-05 07:29:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(587, NULL, '1306849135', 1, 'a289a683-0b39-31da-8bc5-be6231b2f57b', '2019-05-06', '645.54', '16072022', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:07', '2019-06-05 07:31:11', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(588, NULL, '1413094714', 1, '22938e1e-c931-3234-904f-954944e062d0', '2018-07-31', '2529.20', '1496877', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:07', '2019-06-05 07:31:11', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(589, NULL, '765828430', 1, '0854ad0e-5cee-3711-8a72-227b565d2273', '2019-04-04', '2025.99', '37996149', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:07', '2019-06-05 07:32:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(590, NULL, '645318814', 1, '6b0c1a15-1abe-3108-8a69-9a863d2f5834', '2018-08-13', '2922.41', '30767200', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:07', '2019-06-05 07:31:11', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(591, NULL, '255262582', 1, 'dc29de96-3616-3794-98e6-bffec2ae5d75', '2018-08-01', '2465.10', '48582753', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:08', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(592, NULL, '623302338', 1, '6f8d3fac-73d5-3284-8d4b-4f21af62bf25', '2018-12-13', '603.92', '31513437', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:08', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(593, NULL, '1074019312', 1, 'c6b33ad0-e02c-3092-9526-f3774551e0da', '2019-01-15', '773.69', '48686026', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:08', '2019-06-05 07:32:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(594, NULL, '371918926', 1, 'dfc66328-405c-33c6-8a8e-6052fef9b524', '2018-09-11', '2294.61', '12574143', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:09', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(595, NULL, '659266204', 1, '65308b97-39b9-3302-9ea0-cd5998795576', '2018-06-21', '2667.11', '37210857', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:09', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(596, NULL, '1434337989', 1, '65eef7bb-1e25-3701-a03c-56935a5f08f4', '2019-03-19', '469.68', '29818908', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:09', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(597, NULL, '711542940', 1, '5be260e9-135d-31f6-b402-fa5cd6eebd82', '2019-05-17', '2293.53', '21854752', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:10', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(598, NULL, '327888862', 1, 'ece9fe98-a3bc-3bf6-a7dc-907ab0ba75ea', '2018-12-14', '554.09', '28170007', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:10', '2019-06-05 07:29:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(599, NULL, '1185774195', 1, '72863da3-7e48-3d4a-9c59-26da7f477696', '2019-05-15', '2928.18', '20830805', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:10', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(600, NULL, '1321435465', 1, '458c5243-dc6c-397c-82ab-13d6176d3e11', '2019-04-02', '439.42', '3657108', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:10', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(601, NULL, '173913505', 1, '34d4716c-c489-3b69-bafb-3f1902e79ef7', '2019-02-07', '1948.82', '35767984', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:11', '2019-06-05 07:29:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(602, NULL, '406067464', 1, 'b0dc9691-614c-3910-a4c6-26d17d0a370a', '2019-03-14', '1520.39', '10445272', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:11', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(603, NULL, '393195558', 1, '5de69ba3-3158-383f-8449-7a59e01d2755', '2019-01-04', '1916.49', '15751791', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:11', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(604, NULL, '486802178', 1, '2cafe935-09d7-30d0-aee1-6823adda85df', '2018-06-12', '2288.86', '43060996', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:11', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(605, NULL, '946606640', 1, '54a7ce61-7f0e-3883-ba38-08564d8ad454', '2018-10-16', '2269.13', '15930138', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:11', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(606, NULL, '459226973', 1, '8ac958a8-e3ed-3b2f-b477-d54e06efb1f8', '2019-02-20', '2880.94', '36805738', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:11', '2019-06-05 07:28:19', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(607, NULL, '876842218', 1, '983a708b-775b-35fe-9256-3e802ce75789', '2019-01-01', '2939.83', '24041946', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:12', '2019-06-05 07:31:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(608, NULL, '980693199', 1, '687f2842-67a3-33ff-8a92-6304651be0c0', '2019-02-17', '1366.07', '23710342', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:12', '2019-06-05 07:28:52', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(609, NULL, '1324679784', 1, '90ce41a2-b754-3bac-bd48-f2ce51e38b8c', '2018-08-28', '2897.47', '40051382', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:12', '2019-06-05 07:31:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(610, NULL, '894337265', 1, '9ff6788f-6e15-38b1-b54d-bab40654f4a7', '2018-12-11', '949.32', '44485503', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:12', '2019-06-05 07:31:13', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(611, NULL, '178395692', 1, 'a1fb8ed4-b2ce-3ee6-9d6a-36ecceca37ff', '2019-04-16', '936.30', '28584436', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:12', '2019-06-05 07:32:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(612, NULL, '45470470', 1, 'f5b05ee7-7a02-343e-ada7-c4c8326050c6', '2018-08-16', '843.01', '29307221', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:13', '2019-06-05 07:31:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(613, NULL, '647391250', 1, 'd70a16ed-cda9-3917-b84a-2b5314622aa4', '2018-09-23', '1823.30', '39368878', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:13', '2019-06-05 07:31:13', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(614, NULL, '690059504', 1, '5f0a9ffe-1ece-3da9-b95b-bafb2913dd4f', '2018-10-26', '1593.47', '29464178', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:13', '2019-06-05 07:31:13', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(615, NULL, '277328991', 1, '1a5d4f6b-d7e0-30be-b537-60236dbbec6c', '2018-07-30', '611.99', '47811665', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:13', '2019-06-05 07:29:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(616, NULL, '732118205', 1, 'b71e2f3a-6d5c-3788-930c-315b5f702c38', '2019-04-25', '2749.95', '28916920', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:13', '2019-06-05 07:31:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(617, NULL, '1313479786', 1, '264692ff-6ce2-3981-8f9d-8546b39e3f6f', '2019-04-02', '1841.59', '18203966', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:14', '2019-06-05 07:31:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(618, NULL, '597049650', 1, '9a0b3628-6926-33b0-be2a-1f13c3d0623c', '2018-10-02', '333.35', '20210747', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:14', '2019-06-05 07:31:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(619, NULL, '1154814002', 1, '3c3b1761-f503-3fc2-a44d-48feb02ea990', '2019-02-04', '376.59', '40929466', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:14', '2019-06-05 07:29:51', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(620, NULL, '1011464309', 1, 'c6e8afa0-e186-3e83-9194-8050acb48c0c', '2019-02-14', '2610.08', '22754353', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:14', '2019-06-05 07:31:13', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(621, NULL, '1177999684', 1, '99d55315-5f30-377f-8dae-8c4d66bf2aad', '2018-07-02', '2320.33', '3094573', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:14', '2019-06-05 07:31:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(622, NULL, '766161716', 1, '73d6367c-d4b5-36d9-a5cd-a5472fa70ec5', '2018-08-20', '1351.15', '5836139', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:15', '2019-06-05 07:31:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(623, NULL, '1177985905', 1, 'a77f69d1-86f6-335c-926c-11e7a7e76e6f', '2018-07-22', '2290.89', '34656907', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:15', '2019-06-05 07:31:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(624, NULL, '1493228469', 1, '2f52d3aa-29e4-36b4-baa9-3ed21ba425c8', '2018-12-23', '2265.90', '24406464', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:15', '2019-06-05 07:31:14', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(625, NULL, '56091457', 1, 'ebb65279-39eb-3c2e-8be5-e375c1897bf2', '2018-10-21', '2949.74', '39559538', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:15', '2019-06-05 07:31:14', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(626, NULL, '727397677', 1, '37dc3ed6-1790-3dba-bd7f-c96db69294a6', '2019-04-07', '2516.62', '38230340', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:16', '2019-06-05 07:31:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(627, NULL, '658726455', 1, '218b2fa7-a9a6-3687-ac61-ab63b8aa3b27', '2018-12-16', '843.21', '49832588', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:16', '2019-06-05 07:29:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(628, NULL, '441238616', 1, '84b3a674-6d84-3d67-8fd8-14fc28f5dea3', '2018-09-30', '1877.16', '35849742', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:16', '2019-06-05 07:31:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(629, NULL, '677161113', 1, '1c6f2f90-def9-363f-a884-50459d2b8483', '2019-01-09', '1396.33', '5405820', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:16', '2019-06-05 07:29:00', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(630, NULL, '22530485', 1, 'd4b83f2c-3224-3403-b173-bf7e3692f9c4', '2019-04-05', '1218.60', '23277121', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:17', '2019-06-05 07:31:14', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(631, NULL, '168305722', 1, '233f1e8f-7e72-376f-b505-142d002ba1d8', '2019-01-16', '1983.54', '35481453', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:17', '2019-06-05 07:32:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(632, NULL, '511933350', 1, '706a2d1c-af92-3534-a672-9e8f7253bba5', '2018-06-25', '2089.05', '12777146', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:17', '2019-06-05 07:31:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(633, NULL, '615134079', 1, '46a110d1-0eca-3d5a-ab97-e683b3de7d7e', '2018-10-04', '1898.09', '9650431', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:17', '2019-06-05 07:31:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(634, NULL, '231095736', 1, '387ff41f-83db-3f23-81cd-8084b4ed113f', '2019-05-29', '316.86', '36282477', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:17', '2019-06-05 07:31:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(635, NULL, '107755647', 1, '3ca5ca08-bbff-3aac-8aaf-e47f0becb431', '2019-02-23', '1281.58', '14298171', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:17', '2019-06-05 07:28:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(636, NULL, '1559062993', 1, 'a53abd41-520f-3e7c-9cc3-40337d54001b', '2019-05-11', '1499.29', '3939001', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:18', '2019-06-05 07:31:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(637, NULL, '1205935755', 1, 'c0a961bd-38ad-3889-9af7-dc6b97800bd1', '2018-06-23', '2980.53', '44129511', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:18', '2019-06-05 07:31:15', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(638, NULL, '1290702699', 1, '90391af2-b009-34a2-b9e1-b0fc665d1d25', '2019-04-19', '2209.37', '28088193', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:18', '2019-06-05 07:31:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(639, NULL, '1395197133', 1, 'a3134c07-8a52-327f-95fd-edf6e0ef3ffa', '2018-11-14', '2633.28', '14287436', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:18', '2019-06-05 07:31:15', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(640, NULL, '294357689', 1, '2e0eb984-273a-3622-a004-c1be7045b8c0', '2018-06-29', '1474.19', '13783611', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:18', '2019-06-05 07:31:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(641, NULL, '197163879', 1, 'd58e0af0-9ca7-3a72-a243-ebdfe36acdc4', '2019-03-20', '1991.24', '48655480', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:18', '2019-06-05 07:31:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(642, NULL, '26676387', 1, 'd4e47efd-4686-3c86-874a-e28873efe312', '2019-03-20', '807.52', '25924088', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:18', '2019-06-05 07:32:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(643, NULL, '1237401950', 1, 'db305aeb-ab2b-3646-ab12-742e86eaa32a', '2018-06-10', '762.03', '27256254', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:19', '2019-06-05 07:32:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(644, NULL, '111906126', 1, '29be94da-f307-3bbe-b1b9-34bbd95f3018', '2019-05-08', '2242.46', '21904721', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:19', '2019-06-05 07:31:16', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(645, NULL, '1222295341', 1, '2ba3d164-98e2-3697-a61b-a1c24843ab3d', '2019-04-25', '1253.60', '17728635', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:19', '2019-06-05 07:32:50', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(646, NULL, '41555672', 1, 'ec93dae1-ca79-3308-ad75-e5a6330f2b5e', '2019-02-28', '2494.79', '32045264', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:19', '2019-06-05 07:31:16', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(647, NULL, '1154941262', 1, 'b550892d-f45b-3844-b8e6-a28947099e6f', '2018-10-29', '2405.90', '43500885', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:19', '2019-06-05 07:31:16', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(648, NULL, '438875858', 1, '36394a5c-c21b-31b9-8f05-093ade057839', '2019-04-17', '1206.11', '40586260', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:19', '2019-06-05 07:31:16', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(649, NULL, '4240298', 1, '1d2db047-9eaa-3780-91bf-00016f7ec730', '2018-12-11', '815.58', '28342300', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:19', '2019-06-05 07:31:16', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(650, NULL, '532963061', 1, 'b0ec8474-e09f-3a0e-b8f8-55f0df954631', '2018-10-12', '2989.12', '1167473', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:20', '2019-06-05 07:31:16', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(651, NULL, '1430444615', 1, '5a3408c4-1cb5-3c1e-9076-7db819cb2a67', '2018-11-02', '2193.35', '22840008', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:20', '2019-06-05 07:31:16', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(652, NULL, '1181978547', 1, '28b40d64-991e-3bfb-a3d9-a83358a9f8c4', '2019-06-01', '930.41', '30155329', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:20', '2019-06-05 07:29:37', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(653, NULL, '1364640023', 1, '7933fd2d-43de-3c52-89f1-2de4f3516401', '2018-07-21', '573.56', '15674183', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:20', '2019-06-05 07:32:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(654, NULL, '790680618', 1, '8de4111d-3816-3051-b60b-6e96473c046b', '2019-02-01', '1716.85', '10758857', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:20', '2019-06-05 07:31:17', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(655, NULL, '159937447', 1, 'a55d3868-eb58-301a-943d-8dbffbf16c12', '2019-03-28', '1929.41', '48004545', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:20', '2019-06-05 07:32:37', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(656, NULL, '277085665', 1, '2d661cc2-5b80-3708-995a-e4c09a55bcfb', '2019-02-25', '2010.96', '25878137', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:20', '2019-06-05 07:31:17', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(657, NULL, '1488264634', 1, '693aca25-d2ee-3266-abb9-7fddfaad813f', '2018-06-14', '1828.00', '14677077', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:20', '2019-06-05 07:31:17', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(658, NULL, '864703662', 1, '661654c6-73a7-3c05-b4bc-dba3de33c4eb', '2019-02-17', '1733.71', '49775101', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:21', '2019-06-05 07:31:17', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(659, NULL, '1528322745', 1, '8cc1ea6e-b6a7-3e23-b03f-820a31b3616c', '2019-02-14', '1766.12', '29631994', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:21', '2019-06-05 07:32:37', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(660, NULL, '1312462736', 1, '68d9351a-8a1d-3ee6-9261-c74f07b62752', '2018-09-16', '1088.24', '29100300', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:21', '2019-06-05 07:31:17', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(661, NULL, '1273458223', 1, '5afd921f-dd33-385a-a14e-c1fc85e0ad58', '2018-10-31', '2795.67', '14096536', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:21', '2019-06-05 07:31:18', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(662, NULL, '367757999', 1, 'e491ce76-a5e2-31a7-9a48-a684455e0682', '2019-01-15', '1744.69', '4375620', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:21', '2019-06-05 07:31:18', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(663, NULL, '898579923', 1, '90f49852-396a-3fd2-84bd-0f8d9e84119d', '2019-04-08', '2369.44', '43748103', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:21', '2019-06-05 07:31:18', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(664, NULL, '942647641', 1, '255cd6a0-a79c-3861-ac4b-43d6b6f5d081', '2019-04-18', '1477.18', '38289376', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:21', '2019-06-05 07:31:18', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(665, NULL, '623796920', 1, '6868a7e0-588c-3ed6-a9fd-b4531ad91484', '2018-12-13', '509.76', '36958329', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:22', '2019-06-05 07:31:18', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(666, NULL, '871265189', 1, '80df8f27-dade-389a-9ec2-ab8f00d4f630', '2019-06-05', '1917.88', '5423822', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:22', '2019-06-05 07:31:18', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(667, NULL, '701305607', 1, '08b27194-4b81-3da1-b95c-7d739594eff6', '2018-07-04', '1308.85', '15757778', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:22', '2019-06-05 07:31:19', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(668, NULL, '49507364', 1, '8cd2f562-94cd-3953-8e4d-9e7077981e66', '2019-03-06', '1227.12', '47000290', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:22', '2019-06-05 07:31:19', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(669, NULL, '320507195', 1, '0521892b-4cf0-3de1-ac31-54e7a4b2ab41', '2019-05-25', '2877.92', '48373213', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:22', '2019-06-05 07:31:19', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(670, NULL, '409734515', 1, '8c911333-b268-3317-bdc8-d15272a2cfa0', '2018-07-16', '1910.50', '7729101', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:22', '2019-06-05 07:31:19', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(671, NULL, '368647690', 1, 'c473ebc1-c958-3d3e-ade9-552068621815', '2018-09-02', '457.44', '24950554', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:23', '2019-06-05 07:32:37', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(672, NULL, '385720883', 1, '55379c8d-fa27-30dd-a1d4-dbdfa038dca5', '2019-05-09', '2157.34', '36893654', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:23', '2019-06-05 07:28:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(673, NULL, '109237515', 1, 'faa182bb-e1d4-329c-b810-5dda2dc57586', '2019-03-09', '2531.26', '27916595', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:23', '2019-06-05 07:31:19', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(674, NULL, '1342321214', 1, '8d0bd24c-d1eb-32df-aa06-c9bc5823c4d0', '2018-09-29', '863.50', '25471564', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:23', '2019-06-05 07:31:19', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(675, NULL, '564932403', 1, 'ef5326e6-ed49-3655-8940-3af196b5300c', '2019-03-21', '2506.35', '39115081', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:23', '2019-06-05 07:29:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(676, NULL, '67899731', 1, '8629f684-cd32-3210-a82d-1948702f94c2', '2018-06-23', '504.93', '3128431', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:23', '2019-06-05 07:31:19', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(677, NULL, '782494652', 1, 'e3abf516-75c1-302a-aa29-3c091f4359bc', '2018-12-23', '1643.62', '28461647', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:23', '2019-06-05 07:31:19', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(678, NULL, '760588025', 1, 'a10e75e3-cd78-3701-94a4-728dccf91f54', '2018-12-23', '2065.93', '23326344', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:23', '2019-06-05 07:32:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(679, NULL, '11283184', 1, '21d082de-d979-3ab8-8f6e-432f8064fcc5', '2018-12-11', '1981.27', '29364546', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:24', '2019-06-05 07:31:19', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(680, NULL, '1533709322', 1, 'd4cd113b-6635-3290-a31d-0a8c959c252e', '2019-02-14', '892.52', '46886742', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:24', '2019-06-05 07:31:19', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(681, NULL, '1490951760', 1, '0b24fb1e-41d8-3db6-aec4-96f18e89b872', '2019-01-12', '2582.80', '21071108', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:24', '2019-06-05 07:32:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_rating_5`) VALUES
(682, NULL, '1128167668', 1, '006b9ad3-0f43-384d-9424-3e548681c997', '2018-09-25', '1188.87', '49207490', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:24', '2019-06-05 07:31:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(683, NULL, '328118138', 1, '2c1a1f6d-084b-31ca-8b86-a39c7bac314a', '2018-09-11', '2311.58', '13603585', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:24', '2019-06-05 07:31:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(684, NULL, '404702624', 1, 'c00a8502-ba3d-3fb5-b996-2ee8c64374a2', '2018-12-15', '1624.06', '17166898', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:24', '2019-06-05 07:32:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(685, NULL, '1212338728', 1, 'e3fde0d0-486d-3668-b718-4b5e9ba5920b', '2018-07-19', '1786.58', '45182646', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:25', '2019-06-05 07:32:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(686, NULL, '1527069161', 1, '2b44df3e-531f-3330-9905-278f558cfbfe', '2018-08-24', '2225.67', '43883126', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:25', '2019-06-05 07:28:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(687, NULL, '974464683', 1, 'cca957d9-7e62-32bd-97fa-1ecf0dea9801', '2019-02-27', '1319.36', '32000583', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:25', '2019-06-05 07:31:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(688, NULL, '673852548', 1, '2c426fc6-47dd-307b-861a-ad115dd965b7', '2018-07-18', '2906.99', '41906266', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:25', '2019-06-05 07:31:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(689, NULL, '509922749', 1, '290533f6-cfd1-3dcf-8b9b-8d2f83223ab9', '2019-02-17', '1970.56', '20308496', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:25', '2019-06-05 07:32:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(690, NULL, '1427624797', 1, 'd0a2e1a4-050b-3a2d-abda-02412ecc6e78', '2018-06-08', '2805.96', '27087838', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:25', '2019-06-05 07:31:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(691, NULL, '948211607', 1, '18722569-413b-34f8-908d-d19363029a39', '2019-03-26', '1721.14', '22535976', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:25', '2019-06-05 07:31:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(692, NULL, '274681560', 1, 'bc500f97-9520-3395-a21e-2511e5d4b5a8', '2019-01-04', '2099.41', '2968156', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:26', '2019-06-05 07:31:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(693, NULL, '351471727', 1, '5a01882c-ea32-3ea4-8543-2612f4ede394', '2018-09-11', '597.32', '33166361', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:26', '2019-06-05 07:31:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(694, NULL, '887263990', 1, 'ac5921a8-6027-3376-af72-b57577a273d6', '2019-01-27', '900.23', '39887877', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:26', '2019-06-05 07:31:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(695, NULL, '259080148', 1, '9cfa9b06-e01a-3273-8b02-336f692937eb', '2018-09-18', '955.32', '10115530', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:26', '2019-06-05 07:32:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(696, NULL, '385507322', 1, '2ea1a907-b1bd-33b3-a1dc-47c0aac89e56', '2018-08-03', '2741.60', '22715727', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:26', '2019-06-05 07:31:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(697, NULL, '1335988873', 1, 'ddb2aa10-0e0a-304a-886e-d9a162a8f8df', '2019-01-26', '1793.40', '31746353', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:26', '2019-06-05 07:31:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(698, NULL, '327221153', 1, 'c9f45f95-fb09-3de0-b5b2-0bb9353617dd', '2018-11-20', '752.43', '15256772', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:26', '2019-06-05 07:32:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(699, NULL, '692072937', 1, 'c88f63df-5655-38ba-bbc1-a6c0e7a99111', '2018-09-18', '773.19', '23829846', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:26', '2019-06-05 07:31:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(700, NULL, '789050692', 1, '5de3a186-0f14-344c-8fef-3da274a3554f', '2018-08-20', '2615.10', '19894495', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:27', '2019-06-05 07:31:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(701, NULL, '297206104', 1, '57caeffa-d34e-393c-9daf-cd2c4f54ca94', '2018-07-20', '1803.07', '33963321', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:27', '2019-06-05 07:31:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(702, NULL, '102520673', 1, '018ecd4a-fe4d-324a-8bbf-9c9a976dbb0d', '2018-07-23', '2769.76', '13132320', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:27', '2019-06-05 07:31:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(703, NULL, '1103787817', 1, '7fe5ae58-65cb-3616-a257-3990826482ce', '2019-02-27', '902.00', '10293586', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:27', '2019-06-05 07:32:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(704, NULL, '1543588107', 1, '3b69973c-0ab7-3573-99f5-7975c093baae', '2018-09-03', '2024.84', '39402168', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:27', '2019-06-05 07:32:51', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(705, NULL, '1298546272', 1, 'c3f78c5c-9b0a-392e-8b2b-ba1b30dcabc3', '2018-07-12', '1208.28', '48549634', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:27', '2019-06-05 07:32:51', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(706, NULL, '223490787', 1, '171f4815-171d-3137-95ab-9a897c597dfc', '2018-07-04', '1796.64', '21922262', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:27', '2019-06-05 07:32:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(707, NULL, '1161930720', 1, '182008df-70ea-3b56-bf7d-4c046af31746', '2018-06-21', '770.60', '37002013', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:28', '2019-06-05 07:31:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(708, NULL, '714821035', 1, '46a34e8b-260f-39ef-9a4b-0858c5d6ac3b', '2019-03-18', '1219.33', '34504144', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:28', '2019-06-05 07:31:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(709, NULL, '1108734433', 1, '5bdb5cef-24e2-3c7a-8be0-2cbf2faf8d12', '2018-08-17', '2584.91', '25760228', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:28', '2019-06-05 07:29:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(710, NULL, '999528614', 1, '8e3d27d2-7302-3648-9d9c-5dd107c1d42f', '2019-01-28', '2706.90', '43806128', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:28', '2019-06-05 07:31:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(711, NULL, '1229409460', 1, '375a5ec7-eba9-3271-8717-3d4d2a58df9f', '2018-10-29', '2340.62', '14107147', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:28', '2019-06-05 07:31:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(712, NULL, '147219579', 1, '0b85cedd-bcae-33f1-946b-363f9e7bf7d0', '2019-03-23', '1953.90', '49470659', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:28', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(713, NULL, '1510849629', 1, '2a047e1e-5fd1-30eb-a057-37becae0e93c', '2018-08-29', '510.80', '6180887', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:29', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(714, NULL, '583300586', 1, '324d5b24-9d3d-380f-a458-1fff85f1a2f5', '2018-06-15', '2258.22', '27984621', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:29', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(715, NULL, '155528762', 1, 'f8510bb0-65b1-3826-807a-dd8ec635751c', '2019-03-17', '2093.69', '13805316', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:29', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(716, NULL, '1430690755', 1, '6953de53-36ef-3711-90e4-c498f514f5c7', '2019-01-16', '525.08', '46640931', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:29', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(717, NULL, '1108506532', 1, '86a394e3-2dd4-3a54-9242-0cb3e2b45881', '2018-08-24', '1894.81', '8798817', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:30', '2019-06-05 07:32:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(718, NULL, '1067018571', 1, 'be26655f-77ee-3584-ba05-3ebb4166c6fa', '2018-11-23', '428.39', '17154267', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:30', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(719, NULL, '857998178', 1, 'b6acfb0f-085b-3d41-8cce-05dcdac47d7e', '2018-06-22', '804.25', '24208019', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:30', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(720, NULL, '18077831', 1, 'feaf2c41-c595-36f1-adb7-b571e3de65ba', '2018-06-22', '2749.98', '32378651', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:30', '2019-06-05 07:32:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(721, NULL, '585232824', 1, 'ae306ea6-4bad-315f-aa8d-c9fbb6556588', '2019-03-17', '2103.26', '47943778', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:30', '2019-06-05 07:32:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(722, NULL, '476922766', 1, '432d0560-f37e-30e0-b54d-5775d6461174', '2019-02-23', '2552.09', '23509455', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:31', '2019-06-05 07:32:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(723, NULL, '431629211', 1, '556242e4-f22d-3289-b86d-caaad61ef9db', '2018-11-23', '814.03', '20263659', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:31', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(724, NULL, '598785466', 1, 'c919fa24-5ed6-309d-ab15-732dd43963bf', '2018-09-16', '2096.43', '1435141', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:31', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(725, NULL, '450142732', 1, '65eefd07-ac33-3287-adbc-c5d91c329986', '2018-12-21', '2803.97', '42955239', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:31', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(726, NULL, '954216597', 1, '077739a0-91a5-3be6-9be9-79ce08e3345f', '2019-03-05', '1364.45', '23531710', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:31', '2019-06-05 07:27:58', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(727, NULL, '1554358342', 1, 'e774f481-c027-391b-a7c2-b6379e4c7b1e', '2018-10-21', '2644.89', '13331069', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:32', '2019-06-05 07:31:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(728, NULL, '180438875', 1, '2de1e1bb-4d8c-30b1-a76d-ddee126329d6', '2019-05-22', '2401.21', '35690873', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:32', '2019-06-05 07:29:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(729, NULL, '702426730', 1, '5bfb1d56-5024-32f3-b102-07bd2fcec257', '2018-10-02', '678.19', '33441027', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:32', '2019-06-05 07:32:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(730, NULL, '627417252', 1, 'a96338f2-92a9-3335-9698-741ae2408775', '2018-11-09', '1733.04', '44816825', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:32', '2019-06-05 07:31:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(731, NULL, '1224913961', 1, 'fbc6708a-b5fb-3fbe-9dd2-3d73257d7f77', '2019-01-21', '2389.78', '4398289', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:33', '2019-06-05 07:31:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(732, NULL, '131387413', 1, '08aa970a-85ae-31ac-baa2-d3c7843dc450', '2018-09-10', '2510.55', '25425305', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:33', '2019-06-05 07:31:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(733, NULL, '272321383', 1, '9b14078a-7532-39c4-a433-e366ae50a627', '2018-12-21', '2942.69', '27061222', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:33', '2019-06-05 07:32:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(734, NULL, '57425118', 1, 'e056e877-9b9f-3542-86e9-26d76a32550a', '2018-08-26', '1116.80', '27002806', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:33', '2019-06-05 07:31:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(735, NULL, '941184666', 1, '0b1fc79b-c58e-3b19-80a6-c1b9c143b979', '2018-07-05', '1573.30', '17317110', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:33', '2019-06-05 07:29:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(736, NULL, '697401171', 1, '9973ce27-645b-3b63-a8a8-94260dc5685f', '2019-05-16', '1820.23', '4294034', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:34', '2019-06-05 07:28:00', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(737, NULL, '1315848939', 1, 'ebd300e4-0869-3964-b774-66d6cca7427b', '2018-10-23', '1001.35', '6072387', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:34', '2019-06-05 07:31:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(738, NULL, '1151744521', 1, '0ff2e32b-11b1-304b-aade-93d09b0e634c', '2018-07-11', '2671.21', '15463223', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:34', '2019-06-05 07:31:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(739, NULL, '347344658', 1, '06939d0a-ff8f-305f-8a25-87bb893f75bd', '2019-02-21', '1109.04', '30178062', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:34', '2019-06-05 07:31:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(740, NULL, '1258862142', 1, 'ecd47c64-6720-34dd-8180-9a544f04b875', '2018-08-16', '670.03', '32859435', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:35', '2019-06-05 07:31:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(741, NULL, '1499239688', 1, 'f42931a8-d3e6-379d-92ca-34c0d2a7b32a', '2018-08-21', '1968.86', '3285359', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:35', '2019-06-05 07:31:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(742, NULL, '81804330', 1, '54373721-7816-3a11-9f6d-48de07929654', '2019-05-25', '2023.07', '39747074', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:36', '2019-06-05 07:31:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(743, NULL, '154141020', 1, 'dfeae033-0ec9-3335-ae34-40aeb6d92e03', '2018-11-10', '2712.21', '38237114', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:36', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(744, NULL, '653629768', 1, 'e1ba92f5-ed8d-3f12-b29b-5acd98da11c9', '2018-12-04', '601.86', '1406538', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:36', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(745, NULL, '1184528107', 1, 'ee56d534-27ed-35dc-ad46-d18b26c846e0', '2018-07-05', '2913.66', '25026622', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:36', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(746, NULL, '803709924', 1, 'b36adac5-c0ab-3637-9f67-65d80d0df6f0', '2019-05-20', '1331.07', '4903819', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:37', '2019-06-05 07:28:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(747, NULL, '1219543312', 1, 'd581962c-5013-350e-8770-52d291f25f50', '2018-12-31', '1034.00', '31917349', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:38', '2019-06-05 07:32:51', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(748, NULL, '365561540', 1, '9e888931-25a5-3323-bde0-24e8a08a0de0', '2019-03-13', '2236.57', '28311078', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:38', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(749, NULL, '55405758', 1, '34501310-df7a-3be4-afc6-be55df35d287', '2019-04-01', '1922.66', '40299665', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:38', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(750, NULL, '473798831', 1, '54420885-2f12-3a7b-9d13-3b04ccee645d', '2018-11-06', '1059.61', '47962481', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:38', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(751, NULL, '332544474', 1, '0f612b8a-8533-36ec-a157-65acd54fa203', '2019-05-17', '2449.62', '2600318', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:39', '2019-06-05 07:28:55', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(752, NULL, '886928194', 1, 'ef0c8db2-6315-35fa-8350-460d85109c7f', '2019-01-11', '2985.76', '38904805', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:39', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(753, NULL, '1017547590', 1, '240ca743-0d0c-393a-b779-9d526b95d854', '2019-01-04', '1887.08', '7485128', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:39', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(754, NULL, '1189103133', 1, 'd7854390-04c3-383a-8785-e77bc316c94b', '2018-07-04', '792.01', '41489641', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:39', '2019-06-05 07:28:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(755, NULL, '1512821343', 1, 'b4d38721-63b7-338e-9574-acd9f6509d6d', '2018-10-09', '1591.80', '23872859', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:39', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(756, NULL, '277512247', 1, 'e8f5c20d-989c-32cc-81e6-ccfebe6e4638', '2018-10-07', '813.67', '6836011', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:40', '2019-06-05 07:29:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(757, NULL, '1465990597', 1, '9650d232-2fe5-3935-b335-3b433bce7f5e', '2018-06-21', '441.90', '9259803', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:40', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(758, NULL, '451114063', 1, '25c13c75-0392-3ae4-8786-5dcb1b2c26cc', '2018-09-02', '1359.49', '17248178', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:40', '2019-06-05 07:31:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(759, NULL, '1519522219', 1, 'eafc7a65-3cc0-3606-8016-b082c7ffa5d9', '2018-07-23', '2359.10', '25300104', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:40', '2019-06-05 07:31:25', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(760, NULL, '590642755', 1, '2afd9bb8-ac66-3f02-9fd4-6a944db234cb', '2019-03-18', '1426.66', '4009123', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:41', '2019-06-05 07:31:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(761, NULL, '186970834', 1, 'c4b08a13-c20c-3d22-9c90-8d58fc30ca00', '2018-11-29', '438.64', '22896536', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:41', '2019-06-05 07:32:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(762, NULL, '146848378', 1, 'b8e6d7b4-9095-37ef-88b2-395becad0318', '2019-02-26', '308.36', '43442468', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:41', '2019-06-05 07:31:25', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(763, NULL, '954155377', 1, '62d30207-0bac-3d29-84bc-e9dcd501c289', '2019-03-20', '2034.57', '6659582', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:42', '2019-06-05 07:31:25', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(764, NULL, '497617050', 1, 'd97dce65-c15f-3949-9c81-7ca68335de2c', '2018-10-13', '1126.15', '18219397', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:42', '2019-06-05 07:32:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(765, NULL, '952196394', 1, '87e5da05-26e9-3220-9e2f-33c471ad8341', '2019-01-01', '2124.89', '3456750', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:42', '2019-06-05 07:32:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(766, NULL, '302151388', 1, 'a12df153-5ed8-3ed2-b459-d610629466f8', '2019-04-05', '2323.19', '48482132', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:42', '2019-06-05 07:29:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(767, NULL, '1151999044', 1, '592d2dae-e07d-3483-909d-ae1d8a344e1d', '2019-03-17', '2573.10', '39718289', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:42', '2019-06-05 07:32:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(768, NULL, '154815314', 1, 'e779aae5-f35d-3085-bbff-9d0cea1dd1f0', '2019-06-03', '2745.43', '19948392', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:43', '2019-06-05 07:31:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(769, NULL, '956486302', 1, 'a94bca41-085f-3be6-8bc4-4f18df0a1a5f', '2019-04-09', '2080.74', '39877926', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:43', '2019-06-05 07:32:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(770, NULL, '1374249242', 1, 'd7837f66-695a-3101-b18c-2508a90c2b89', '2019-02-23', '1134.51', '37707285', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:43', '2019-06-05 07:31:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(771, NULL, '645248903', 1, '803cdc18-3e6c-396f-af1f-5acae4e4ec03', '2019-05-30', '617.55', '33138348', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:43', '2019-06-05 07:31:25', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(772, NULL, '398984702', 1, 'dbaa39a0-c5df-3b37-a007-dd275a659d13', '2018-09-27', '2516.92', '25499230', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:44', '2019-06-05 07:31:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(773, NULL, '1330463326', 1, 'c40eff84-d148-30a9-b58c-91fd95ec5c4b', '2019-01-27', '2677.25', '35659386', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:44', '2019-06-05 07:28:58', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(774, NULL, '1243951561', 1, '4b8fd141-3b5c-3fe4-a7e4-636e81a93f73', '2019-04-29', '2476.51', '16450947', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:44', '2019-06-05 07:32:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(775, NULL, '1337389996', 1, 'ad78e462-965a-3607-ad28-ce50f9f01f4e', '2018-07-01', '2304.56', '17460057', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:44', '2019-06-05 07:31:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(776, NULL, '373181698', 1, '53e3ce4d-15f1-325b-8c69-d22c413a1fd1', '2018-10-19', '1592.83', '40039787', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:44', '2019-06-05 07:31:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(777, NULL, '738336641', 1, 'a14f50c1-e30d-39fa-8545-de76c80b5403', '2018-07-24', '389.49', '7149030', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:44', '2019-06-05 07:31:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(778, NULL, '932335597', 1, '924e69e4-265e-34cc-8670-6fa77f52dc5d', '2019-05-21', '1112.52', '11508132', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:45', '2019-06-05 07:31:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(779, NULL, '207936780', 1, '956b0683-c4b3-3747-9eb0-0e35c1c60f8c', '2018-11-17', '1563.16', '23139136', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:45', '2019-06-05 07:32:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(780, NULL, '1300061770', 1, '3f8efe00-50e8-351d-83bb-722ab91bd678', '2019-05-02', '1784.82', '47484468', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:45', '2019-06-05 07:31:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(781, NULL, '352145755', 1, 'a92873e2-38e3-3ea7-a121-97848c4c5d51', '2018-07-09', '1995.40', '40426285', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:45', '2019-06-05 07:31:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(782, NULL, '263489549', 1, 'cdfab255-bf3d-3f06-a0e5-63ee714b0535', '2019-06-05', '2911.93', '41732627', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:46', '2019-06-05 07:31:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(783, NULL, '103014894', 1, '14431e01-9753-39ce-b1e5-e60430168cfb', '2018-06-23', '2252.18', '25923844', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:46', '2019-06-05 07:31:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(784, NULL, '746585573', 1, '61d4a76f-0e34-37ba-931b-ac5c6e695884', '2018-06-27', '1913.19', '2236642', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:46', '2019-06-05 07:29:02', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(785, NULL, '484276090', 1, '5e8e4a83-6a4f-31fc-a332-da1b7ea1fde6', '2018-10-27', '2548.08', '12990870', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:46', '2019-06-05 07:29:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(786, NULL, '727000827', 1, '9db92fa5-5caf-306b-b370-93a7e3fd98b3', '2018-11-18', '2870.82', '4520050', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:47', '2019-06-05 07:31:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(787, NULL, '983638825', 1, '10c2897e-c835-3254-a872-c22b6709a174', '2018-10-23', '1201.61', '38386788', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:47', '2019-06-05 07:31:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(788, NULL, '1495872787', 1, '7175e5d2-a8c6-319e-bb8b-41d24ce2e3e8', '2019-03-23', '1898.02', '49375174', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:47', '2019-06-05 07:29:03', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(789, NULL, '872553219', 1, '98b09871-955b-33d1-b195-bbfe81a4e0be', '2019-03-02', '945.80', '19253479', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:47', '2019-06-05 07:32:52', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(790, NULL, '1234032795', 1, 'f6425df6-2675-358a-835e-5a7ae9511239', '2018-07-27', '1570.98', '30110754', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:47', '2019-06-05 07:28:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(791, NULL, '682997179', 1, '098bf579-9ac8-371d-9a00-205835cdbcf8', '2018-08-08', '2370.80', '16377949', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:47', '2019-06-05 07:31:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(792, NULL, '662076938', 1, 'dad60e6b-c659-3736-a725-f36a776618e9', '2018-06-21', '2203.24', '34861964', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:48', '2019-06-05 07:31:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(793, NULL, '1213728106', 1, '4bdace5e-01c1-34ce-b018-3b2b9b07295a', '2018-07-04', '2539.42', '12479358', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:48', '2019-06-05 07:31:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(794, NULL, '406248629', 1, 'dcb07b8e-7864-3b5c-be25-33de37353853', '2018-10-02', '2010.90', '41594557', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:48', '2019-06-05 07:31:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(795, NULL, '1069918941', 1, 'f65b037a-368a-3eea-8edb-10cb5e0666d7', '2018-06-23', '1852.58', '27227318', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:48', '2019-06-05 07:31:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(796, NULL, '1523724740', 1, '0c2d0b86-b8cf-3817-ac87-f7991efa53c5', '2018-06-30', '2000.70', '28530564', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:48', '2019-06-05 07:29:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(797, NULL, '1474221542', 1, '0494eb1d-6ca2-351a-9fd5-a0207efd581f', '2019-02-28', '2409.87', '30695817', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:49', '2019-06-05 07:31:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(798, NULL, '1049613690', 1, 'd8e82b86-ee08-3878-935d-a18cc6308da2', '2018-12-28', '1878.15', '5381956', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:49', '2019-06-05 07:28:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(799, NULL, '768118612', 1, '0bdcef80-b2b0-3b60-9eab-64a4363cfde9', '2018-10-30', '1226.49', '14597773', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:49', '2019-06-05 07:31:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(800, NULL, '844250725', 1, '181c40a1-ad6d-3194-ae7e-18f0da537a99', '2019-02-09', '2821.56', '16665815', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:49', '2019-06-05 07:28:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(801, NULL, '639542829', 1, '15ec39f5-0943-3fa6-b8b2-8474391d0314', '2019-01-23', '2306.55', '7095259', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:49', '2019-06-05 07:31:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(802, NULL, '1207595939', 1, 'e00d8c22-2618-3b6d-8eb8-889b2a28decb', '2018-07-21', '1602.49', '32469726', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:49', '2019-06-05 07:29:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(803, NULL, '446963024', 1, 'c1a5212f-11a0-3003-8ff9-0cbfc3dde031', '2019-03-03', '1527.53', '10848600', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:50', '2019-06-05 07:31:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(804, NULL, '1246084735', 1, '71e2fd40-cdc4-32ae-9b8c-5b2f603ab69e', '2019-03-30', '417.97', '9314554', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:50', '2019-06-05 07:28:53', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(805, NULL, '707331046', 1, '66c59e51-d9dd-3d0d-b11b-79bb4fc99ea9', '2019-01-15', '2913.28', '3425766', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:50', '2019-06-05 07:29:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(806, NULL, '1365750817', 1, '04af4451-a350-368f-96af-285e9374a463', '2018-07-23', '2049.41', '46667834', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:50', '2019-06-05 07:32:52', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(807, NULL, '368096769', 1, '0d9e8840-7aad-3ed0-aff6-988845a85d6b', '2018-10-24', '2091.61', '3730404', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:50', '2019-06-05 07:31:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(808, NULL, '270844975', 1, '2afd66bb-0aaa-310e-88f1-e0ce6b49625e', '2018-12-24', '1407.66', '23403824', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:51', '2019-06-05 07:31:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(809, NULL, '41080830', 1, 'f4fb098d-1fa4-3872-a090-ba25c95fc1b5', '2019-04-25', '1710.47', '14591303', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:51', '2019-06-05 07:31:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(810, NULL, '738558059', 1, '9dc78de4-eda4-3510-a070-e7a70147b529', '2019-04-14', '1668.62', '36391789', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:51', '2019-06-05 07:31:28', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(811, NULL, '1370784226', 1, '19aea1c6-3125-3895-9a71-99394cbeaec5', '2018-12-27', '435.02', '29293469', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:51', '2019-06-05 07:32:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(812, NULL, '172163713', 1, 'a89bec59-db66-3520-b7a4-c58f45a36649', '2018-08-05', '2420.26', '15045857', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:51', '2019-06-05 07:31:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(813, NULL, '904965908', 1, '7191371e-2f06-3bc6-acb7-7206c3113169', '2019-03-11', '1256.04', '8933053', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:52', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(814, NULL, '960556802', 1, '6ebc237c-360e-3f95-8855-02c2def8d741', '2018-12-14', '886.36', '6439864', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:52', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(815, NULL, '815784725', 1, '226ce6c4-066f-3e99-815e-aff3dd3ee68c', '2018-07-08', '1930.18', '14151875', 8, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:52', '2019-06-05 07:29:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(816, NULL, '1492760458', 1, '8efebb6e-928c-32b5-95de-c320fee7a7d2', '2019-02-13', '1366.02', '4991426', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:52', '2019-06-05 07:28:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(817, NULL, '1179268076', 1, 'dc366c58-ab4c-32ec-b58e-e1365366e4e5', '2018-10-29', '577.29', '28873609', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:52', '2019-06-05 07:32:52', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(818, NULL, '72652975', 1, 'b2b5822d-ad95-35f5-a5f0-44b919d74916', '2019-03-08', '2360.53', '32537767', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:53', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(819, NULL, '775971868', 1, '9e2fbab7-e4e5-3410-a2b7-0f7dbf75a6a7', '2019-03-29', '517.91', '40826196', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:53', '2019-06-05 07:32:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(820, NULL, '714344366', 1, '8035d4d1-a068-356b-b874-363229c85f23', '2019-04-22', '752.19', '42194880', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:53', '2019-06-05 07:32:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(821, NULL, '635790696', 1, '315346ac-6556-3a3c-a1d5-09eca1eb75fc', '2019-04-07', '1126.95', '41678972', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:53', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(822, NULL, '864943188', 1, '5c75c49e-9bf5-337b-a1d1-355e33b17c91', '2018-06-13', '2735.16', '28785275', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:53', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(823, NULL, '7522032', 1, '10fb5a8b-4f90-3347-b819-bdbdd9890068', '2019-01-13', '2221.27', '15265109', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:54', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(824, NULL, '765832225', 1, 'feb28db7-a66c-35e4-b533-c8c70e1ebf89', '2019-03-20', '384.59', '46510281', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:54', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(825, NULL, '218687412', 1, 'a2ceda6d-925f-3553-825b-3e0a3aa3b027', '2019-04-22', '1200.68', '8371853', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:54', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(826, NULL, '1256453770', 1, 'a63d3c81-e988-38e2-944b-417e752c6417', '2019-05-17', '369.12', '40640336', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:54', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(827, NULL, '822447825', 1, '360533fc-c7df-3212-b037-91d6cda15ec9', '2019-01-07', '1183.63', '10234677', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:55', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(828, NULL, '992020519', 1, 'fa992226-362c-3410-b2b2-451147a55cd9', '2019-04-10', '2454.74', '5431463', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:55', '2019-06-05 07:28:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(829, NULL, '973839844', 1, 'fd96cd8d-e981-3477-8dbc-14b6c26ba947', '2018-12-02', '1337.08', '41133992', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:55', '2019-06-05 07:31:29', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(830, NULL, '754670225', 1, 'c250c31d-361c-378f-9c28-62061f5b0147', '2019-05-05', '2681.49', '41129702', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:55', '2019-06-05 07:31:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(831, NULL, '1372729344', 1, '99972281-f88e-3f05-a2dc-c341b9051ede', '2019-01-15', '2368.15', '12566028', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:55', '2019-06-05 07:31:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(832, NULL, '1443966948', 1, 'c5b0e400-db76-3381-a9c8-6eee2f0d14ef', '2018-08-14', '2914.90', '2306630', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:56', '2019-06-05 07:31:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(833, NULL, '629552035', 1, '36c2d006-3b95-3042-a3ef-0dca5983b0f5', '2019-01-23', '2050.57', '1853848', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:56', '2019-06-05 07:31:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(834, NULL, '78058260', 1, '19cfad6e-b513-3885-b398-6d429b5d5e47', '2018-12-31', '2318.18', '46467032', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:56', '2019-06-05 07:31:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(835, NULL, '942019358', 1, '8195fcbb-3e76-3c55-ae84-c9d3ed54ac29', '2019-03-18', '2903.22', '21513414', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:56', '2019-06-05 07:31:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(836, NULL, '1437746330', 1, '363a41d3-2894-33d3-9c03-04019df4a32d', '2018-09-21', '695.00', '20724241', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:57', '2019-06-05 07:31:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(837, NULL, '1034050803', 1, '572cb60f-28f5-3fc9-adb5-01e21a80b25f', '2018-09-17', '2753.78', '36516038', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:57', '2019-06-05 07:31:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(838, NULL, '732801095', 1, 'a13b2e1c-d35a-3b4f-ad15-b7bdc33f8472', '2018-07-24', '1555.97', '42473125', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:57', '2019-06-05 07:31:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(839, NULL, '583741823', 1, '899a4580-c5b4-340d-946b-3d53175c737a', '2019-05-22', '2214.54', '45962092', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:57', '2019-06-05 07:31:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(840, NULL, '313705979', 1, '5beb86ac-e1d8-3ad4-bc2b-298e64bb48a4', '2018-10-20', '1694.43', '35049842', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:57', '2019-06-05 07:28:45', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(841, NULL, '144618486', 1, '846f83b8-1a56-30e3-a0ab-d0e4d79f2261', '2018-06-20', '2631.66', '3178355', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:58', '2019-06-05 07:29:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(842, NULL, '1262568881', 1, 'ea8ecee1-b0c6-3c24-96ab-a3b678626977', '2019-05-15', '577.62', '12129297', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:58', '2019-06-05 07:31:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(843, NULL, '1539657575', 1, 'b777ddb8-cf77-3df7-b370-e29be5ac52b3', '2018-10-31', '706.71', '24913639', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:58', '2019-06-05 07:31:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(844, NULL, '240508943', 1, 'c1869a54-16dc-3fa2-9698-6ffeb8981569', '2018-11-20', '2491.90', '19202682', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:58', '2019-06-05 07:28:54', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(845, NULL, '1328391511', 1, 'dd61a465-7f06-337f-a692-5cb36292abce', '2018-11-27', '583.24', '10607659', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:58', '2019-06-05 07:31:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(846, NULL, '1321636677', 1, 'e4ee5eda-b19f-3d0d-b44c-c0deab5e07e5', '2019-05-17', '1065.85', '49481340', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:59', '2019-06-05 07:29:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(847, NULL, '98504588', 1, '0423e61a-9652-35eb-8968-4dbfd1dff347', '2019-02-16', '1574.64', '31914180', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:59', '2019-06-05 07:29:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(848, NULL, '50937118', 1, '90af88f4-e7f0-366f-a50d-22b860272d26', '2018-12-29', '1532.77', '22215731', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:59', '2019-06-05 07:28:58', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(849, NULL, '1549925714', 1, 'c9a1419f-5769-3f41-add6-e0197b1442f9', '2018-10-15', '2770.23', '10814392', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:59', '2019-06-05 07:31:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(850, NULL, '291727432', 1, '08c44422-d519-3d52-bae9-b959b851fc80', '2018-06-05', '588.93', '33449913', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:59', '2019-06-05 07:31:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(851, NULL, '680370943', 1, '435b3b80-dc66-3dec-afb5-d26b541e673d', '2019-04-11', '670.96', '40250547', 7, 'Created by DB seeder', NULL, 1, '2019-06-05 07:25:59', '2019-06-05 07:29:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_rating_5`) VALUES
(852, NULL, '1221883393', 1, '15f47d5c-f9d9-33ad-b4dc-aecad333da56', '2018-07-08', '949.05', '45624566', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:00', '2019-06-05 07:31:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(853, NULL, '1134960557', 1, '4f161928-f745-3d2e-889b-cebef0dcca45', '2018-08-27', '2726.30', '24766483', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:00', '2019-06-05 07:31:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(854, NULL, '565237546', 1, '6f0266a4-3420-3cdc-bead-004aa5519a6a', '2019-05-25', '1371.29', '12231379', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:01', '2019-06-05 07:32:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(855, NULL, '9916617', 1, 'f982d6cb-8704-3a9b-91be-01d50f376db5', '2019-03-11', '2788.00', '43555584', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:05', '2019-06-05 07:28:50', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(856, NULL, '987884682', 1, 'b0d7fa93-f0b3-3bd6-bcee-05780274eb41', '2018-07-16', '2373.13', '12887107', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:05', '2019-06-05 07:29:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(857, NULL, '1221511536', 1, 'd299366a-fa3c-3286-ad96-c5b4c5ae1175', '2019-01-12', '2391.91', '5834574', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:05', '2019-06-05 07:31:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(858, NULL, '948157674', 1, 'c7c26e65-5e9d-32ac-a566-85de59ebcef4', '2018-10-22', '2365.78', '18048783', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:05', '2019-06-05 07:32:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(859, NULL, '761927341', 1, '99beee45-098a-3b67-96bc-7a6e93962e69', '2019-05-23', '2033.55', '28189848', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:06', '2019-06-05 07:29:41', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(860, NULL, '1440148382', 1, '241b20d5-bc60-3c32-898c-6548edba7533', '2018-07-11', '739.02', '23440130', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:06', '2019-06-05 07:31:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(861, NULL, '1107889096', 1, '943b5ab4-dc61-3976-9aae-f4e5eaaa2213', '2019-03-09', '2746.38', '5630657', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:06', '2019-06-05 07:31:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(862, NULL, '623131684', 1, '842088bf-76be-3ced-8509-299d360f7fc9', '2018-10-03', '494.06', '13155933', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:06', '2019-06-05 07:29:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(863, NULL, '674353819', 1, 'be1d09b6-2519-365b-9f2b-048d0256c486', '2018-09-17', '477.87', '5159965', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:06', '2019-06-05 07:31:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(864, NULL, '798572500', 1, '23304221-db81-3520-8129-6e32410c0b13', '2018-12-22', '864.50', '40070761', 8, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:07', '2019-06-05 07:29:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(865, NULL, '1024514988', 1, 'b3b6cb26-be15-334c-89be-db3ed062de31', '2019-01-01', '1705.70', '21863633', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:07', '2019-06-05 07:32:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(866, NULL, '1338850866', 1, 'ad3792d8-487c-367f-8d5a-aa2e5c42ff1c', '2019-01-16', '2683.51', '36566641', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:07', '2019-06-05 07:32:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(867, NULL, '862427087', 1, 'e9ab54d9-a954-379f-b40e-d7b148c7684d', '2019-03-28', '905.88', '28321867', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:07', '2019-06-05 07:31:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(868, NULL, '977973259', 1, 'efae7557-0935-33c8-b5cd-2806fcab9a5f', '2018-09-16', '1360.83', '29861132', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:07', '2019-06-05 07:31:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(869, NULL, '1125312544', 1, 'd174184d-44ed-39ea-ba29-462bc9d473e0', '2019-01-28', '2658.40', '14192296', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:08', '2019-06-05 07:31:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(870, NULL, '542087928', 1, 'e832fe82-fdab-313e-9e42-c5d458603b50', '2019-03-23', '1744.29', '31925124', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:08', '2019-06-05 07:31:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(871, NULL, '842892469', 1, '4cb1d7f1-a654-36a5-85fc-9027b69e59ea', '2018-11-06', '1647.23', '3232177', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:08', '2019-06-05 07:31:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(872, NULL, '254944255', 1, '301081d1-dfed-38b2-88dc-fa0f2344f74e', '2018-11-13', '1346.61', '19766698', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:08', '2019-06-05 07:31:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(873, NULL, '84247165', 1, 'df3f19e4-4b2d-38cf-8658-99687b77333c', '2019-03-20', '2570.85', '25050331', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:08', '2019-06-05 07:31:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(874, NULL, '1469007445', 1, 'be3fa403-1bb9-376e-9a6e-ba0df2ca0f44', '2019-03-27', '1316.82', '39709462', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:08', '2019-06-05 07:31:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(875, NULL, '443973584', 1, '99dcf226-2208-35e0-b323-b36cffc92179', '2018-06-13', '1836.56', '32983825', 7, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:09', '2019-06-05 07:29:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(876, NULL, '1336588706', 1, '527dbb7b-833f-32c4-9c0d-7f2d90a747a0', '2018-10-21', '2150.79', '30155649', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:09', '2019-06-05 07:31:34', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(877, NULL, '451495274', 1, '24d16800-e286-309e-aa9c-9ea39a8304e8', '2019-03-07', '898.38', '43745271', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:09', '2019-06-05 07:31:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(878, NULL, '487440916', 1, '1c67b4b6-a5f0-39ca-ac07-972f56b73f5c', '2018-09-12', '2300.16', '32535074', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:09', '2019-06-05 07:31:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(879, NULL, '5125945', 1, '10ff2f2d-8aca-34ef-8abe-d6a196beabd2', '2018-12-29', '964.31', '15050149', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:09', '2019-06-05 07:31:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(880, NULL, '300665220', 1, '5163d9de-c94a-313e-ba8e-cb0007b17134', '2019-02-12', '377.55', '38354660', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:10', '2019-06-05 07:31:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(881, NULL, '1166085256', 1, '1a721d00-ffe3-3a76-be40-8781f29670b6', '2019-03-15', '963.65', '19358935', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:10', '2019-06-05 07:29:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(882, NULL, '761159770', 1, '67e48778-221f-3a47-b63c-430eca5c2d12', '2018-09-26', '2608.67', '25231538', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:10', '2019-06-05 07:31:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(883, NULL, '216600167', 1, '805d39ee-c292-325c-9ef2-4683582ab221', '2019-01-03', '2705.01', '47245962', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:10', '2019-06-05 07:31:35', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(884, NULL, '392710041', 1, 'e6d3434e-7b00-321b-9b70-dceb7bb10896', '2018-10-05', '450.35', '45156952', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:10', '2019-06-05 07:31:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(885, NULL, '1071716533', 1, '121a7902-d6b1-384b-af67-0acd625c7325', '2018-07-31', '2665.06', '17046910', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:11', '2019-06-05 07:31:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(886, NULL, '1395518871', 1, '380ef67d-b50c-3dd2-a9df-c2ebe9740335', '2019-05-20', '1065.58', '10469235', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:11', '2019-06-05 07:32:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(887, NULL, '325198832', 1, '44372db4-bbbd-340d-b1b9-62995e1c8934', '2018-12-16', '1004.64', '9485275', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:11', '2019-06-05 07:31:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(888, NULL, '244251025', 1, '977ce988-9ae5-3a2e-b5c8-1e88118064bd', '2018-10-19', '2650.01', '37231703', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:11', '2019-06-05 07:31:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(889, NULL, '939890639', 1, '1018fdb3-eac2-3bcc-9728-48cf179c369d', '2019-03-14', '1913.90', '25237560', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:11', '2019-06-05 07:31:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(890, NULL, '576890251', 1, 'fce0eae7-adef-32d8-a74a-84ff3e9faf1a', '2019-04-18', '2358.07', '28349919', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:12', '2019-06-05 07:28:56', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(891, NULL, '760347446', 1, 'dfb3b78e-cbd9-3fef-a897-10ff1809e5ec', '2019-03-05', '2384.76', '36554182', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:12', '2019-06-05 07:31:37', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(892, NULL, '561137465', 1, '829ece98-ffb4-357f-b827-1e32b927c5bc', '2018-11-25', '1528.99', '45798357', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:12', '2019-06-05 07:31:37', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(893, NULL, '952962699', 1, '6ca5318e-546a-3778-8d79-f0a21dd9d879', '2019-06-03', '2467.27', '26694543', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:12', '2019-06-05 07:28:16', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(894, NULL, '502562303', 1, 'f848f45e-4ee5-3dce-82de-995ceed066e1', '2018-09-24', '2774.40', '5994321', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:12', '2019-06-05 07:28:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(895, NULL, '1455636650', 1, '6e93b40b-4508-3fe1-a5fe-d9461b529e97', '2018-12-04', '2952.95', '32471837', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:13', '2019-06-05 07:31:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(896, NULL, '1080650304', 1, 'b74b8eba-4c06-3701-bca2-b5b8c01b8773', '2019-04-02', '2537.73', '17054723', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:13', '2019-06-05 07:32:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(897, NULL, '1437782036', 1, '997b8dce-04af-3c69-8185-ccc954572bea', '2018-11-05', '2834.22', '36506206', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:13', '2019-06-05 07:29:01', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(898, NULL, '988266217', 1, 'f6d85558-ba80-319f-baed-cdc386e97187', '2018-09-24', '1105.50', '20960559', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:13', '2019-06-05 07:31:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(899, NULL, '151243655', 1, 'b6a7e6eb-fbb0-3ac4-b12e-1769e734132e', '2018-11-11', '2135.71', '16602730', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:13', '2019-06-05 07:31:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(900, NULL, '924904539', 1, '2717b410-20a1-34a4-b37c-fb7cf184dceb', '2019-05-13', '1438.41', '1648154', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:14', '2019-06-05 07:28:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(901, NULL, '1542873714', 1, '74ad55cf-124c-3cf9-877b-45cc635760d0', '2018-10-14', '2504.05', '3086442', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:14', '2019-06-05 07:31:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(902, NULL, '1139753369', 1, '2a5f06ef-97db-30e6-be52-b9369d055015', '2019-01-06', '441.03', '25497922', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:14', '2019-06-05 07:31:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(903, NULL, '1372875621', 1, '90af27a7-0e72-32c0-9369-410651e965a4', '2018-06-06', '1092.99', '8160354', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:14', '2019-06-05 07:31:38', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(904, NULL, '240360625', 1, '84fdd853-fa41-3a6c-8ecd-99b2582dd3b6', '2019-04-01', '1969.49', '31292667', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:14', '2019-06-05 07:31:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(905, NULL, '1293010818', 1, '6d749edc-06b4-3e56-b3bd-46b890863921', '2018-06-28', '338.95', '35644987', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:14', '2019-06-05 07:28:56', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(906, NULL, '1519936600', 1, '794eb3c0-15c8-34f6-84fd-99507e682c64', '2018-10-01', '433.22', '34187320', 8, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:15', '2019-06-05 07:29:37', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(907, NULL, '617271548', 1, 'b97465de-e5fa-39c7-85d7-1a96731f9d27', '2018-06-12', '2804.09', '7980128', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:15', '2019-06-05 07:31:38', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(908, NULL, '272481086', 1, '7ef74cb0-1fb7-3f7f-b1a7-88dd29f76924', '2018-10-22', '2555.52', '17635481', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:15', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(909, NULL, '44553623', 1, 'dd1d7a85-65f1-3960-bd44-11cb18b34894', '2019-01-25', '915.45', '41144699', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:15', '2019-06-05 07:32:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(910, NULL, '935970639', 1, 'eedfa65b-4230-3768-aeb1-a268c9b35235', '2019-03-20', '1398.10', '44775842', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:15', '2019-06-05 07:28:28', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(911, NULL, '764274748', 1, 'feb1f8d0-3edf-36f5-a069-cf3fdf93eef7', '2019-04-14', '2554.29', '34616185', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:16', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(912, NULL, '1250887408', 1, '0e15cd11-d316-348b-a078-1cafa0f4ec0e', '2019-02-02', '356.63', '43211169', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:16', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(913, NULL, '1398889725', 1, '781aaf1f-b8f5-3cb1-916e-d6f4d3431149', '2019-01-06', '1381.11', '47731195', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:16', '2019-06-05 07:28:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(914, NULL, '502215813', 1, '4ae06562-3c27-3ab8-9a3f-eca4f77f9585', '2018-10-28', '542.07', '26298732', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:16', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(915, NULL, '1019124687', 1, 'ed429a08-7efd-30bf-8586-954cbebc401c', '2019-06-04', '507.33', '45453006', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:16', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(916, NULL, '286736100', 1, '62899638-c354-31c0-8e30-807f762cbf45', '2018-08-12', '874.36', '37592023', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:17', '2019-06-05 07:29:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(917, NULL, '305773028', 1, '8807fa4c-816d-3a5f-b889-94a5f125dd0f', '2018-11-22', '2814.37', '6452283', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:17', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(918, NULL, '577391577', 1, '15879924-4656-3d76-b2e6-510e0cc0a07f', '2018-09-13', '381.16', '45025293', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:17', '2019-06-05 07:29:01', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(919, NULL, '352592397', 1, 'a59b5e0e-0539-3bcd-95cc-9cc0d263722c', '2019-05-06', '652.98', '29068109', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:17', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(920, NULL, '1374649009', 1, 'dcdaf000-c358-3587-90fb-bd060ee2a55c', '2018-11-19', '2373.38', '4081219', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:17', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(921, NULL, '339016183', 1, '049c503d-26b8-3dba-856c-4687f7a50757', '2019-04-11', '1298.12', '26833048', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:18', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(922, NULL, '270158885', 1, '95dd127b-265c-3efe-aff9-3cbf3e707a86', '2019-02-08', '1882.60', '2595264', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:18', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(923, NULL, '1509657956', 1, '9b57b3c1-a067-3d88-9c7c-850bbf81c7dc', '2018-10-31', '1608.06', '1831617', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:18', '2019-06-05 07:31:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(924, NULL, '177753498', 1, '83018692-729c-3760-9587-1f44a0e71943', '2019-02-07', '2309.84', '8159261', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:18', '2019-06-05 07:32:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(925, NULL, '630034484', 1, 'f79d6541-68b3-38fa-a895-1e66cdc1cd70', '2019-04-06', '351.49', '1016444', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:19', '2019-06-05 07:31:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(926, NULL, '899038876', 1, '0cde0d64-ab33-39f2-b349-559cd501e4b4', '2018-09-11', '2366.68', '35194669', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:19', '2019-06-05 07:31:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(927, NULL, '355192147', 1, '4ec4818f-b818-37a1-b886-2c6e015367d8', '2019-02-05', '1206.59', '3464999', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:19', '2019-06-05 07:31:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(928, NULL, '1169025194', 1, '8d141dd1-0bb7-3050-bd82-b8f3835fe621', '2019-04-18', '384.80', '26030085', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:19', '2019-06-05 07:31:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(929, NULL, '1446950645', 1, '1567c4cf-ee2f-39c6-baea-666c720c0e06', '2018-12-25', '1699.66', '22053038', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:19', '2019-06-05 07:31:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(930, NULL, '1495791052', 1, 'ca704562-6f16-38e2-a42e-7535f7dfed01', '2019-01-03', '2088.81', '21948979', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:20', '2019-06-05 07:31:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(931, NULL, '548535262', 1, 'c69213c4-65a2-33c4-bffe-f77ead5fd42c', '2018-06-19', '416.11', '35545482', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:20', '2019-06-05 07:28:53', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(932, NULL, '606908116', 1, 'daffce67-1e0a-3e9d-b086-14af23e7a551', '2018-12-14', '333.70', '11871806', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:20', '2019-06-05 07:31:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(933, NULL, '1524198642', 1, '583f3661-0d0a-3e24-b82e-4aa63f6cfb4e', '2018-11-11', '526.75', '17107647', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:20', '2019-06-05 07:31:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(934, NULL, '151431844', 1, '61155051-8fde-3f70-aa62-99322955f304', '2019-03-07', '829.66', '12335347', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:20', '2019-06-05 07:32:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(935, NULL, '239042386', 1, '95a2ec6d-355a-350a-99b7-455eeb89e365', '2018-06-22', '2560.58', '43887171', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:20', '2019-06-05 07:31:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(936, NULL, '1107556592', 1, 'cada6cb3-269c-3e65-a44a-98f385b6f06a', '2018-06-15', '2158.80', '49351881', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:21', '2019-06-05 07:31:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(937, NULL, '838885027', 1, '282c4bb3-9563-3732-9c2c-e562937279e0', '2019-03-23', '1257.46', '38934691', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:21', '2019-06-05 07:31:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(938, NULL, '1066499648', 1, 'a0372c52-4cfc-36cd-8abf-e82cfcce3077', '2018-11-18', '668.01', '45422423', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:21', '2019-06-05 07:32:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(939, NULL, '337489616', 1, 'b96c3c68-af36-3ec4-9fcc-f99a8be943c9', '2019-03-15', '2898.48', '9866897', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:21', '2019-06-05 07:31:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(940, NULL, '1199813921', 1, '551e203b-58e0-33c8-b856-ca8e6366eb81', '2018-10-11', '2325.18', '6289576', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:21', '2019-06-05 07:29:01', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(941, NULL, '1550591724', 1, '69157c4d-661a-3232-903c-cd39df65ffcf', '2018-09-25', '2977.66', '16508424', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:21', '2019-06-05 07:31:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(942, NULL, '158052854', 1, 'f89a3720-a7fe-3a8a-93ec-7bd5cb838784', '2018-12-01', '1269.97', '28678612', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:22', '2019-06-05 07:31:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(943, NULL, '1060481608', 1, 'd09ccf83-a681-3f0b-985e-4711ec5a13ac', '2018-06-18', '1591.40', '43762198', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:22', '2019-06-05 07:32:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(944, NULL, '1064942835', 1, '9cffab7c-14c7-3ecf-9cd3-756e79936b9c', '2019-05-18', '2152.11', '8712877', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:22', '2019-06-05 07:31:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(945, NULL, '533101525', 1, 'd025503d-275b-31ad-b8d1-c591b407f68c', '2019-04-07', '2805.51', '10774520', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:22', '2019-06-05 07:31:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(946, NULL, '723752119', 1, '2dbe09e8-21bf-330c-b619-7738161412d4', '2018-10-01', '1799.53', '24315524', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:22', '2019-06-05 07:31:42', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(947, NULL, '1051054859', 1, 'e6b69aa2-f9e5-3bcb-85fe-b647d417814f', '2019-03-17', '2066.26', '20251248', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:22', '2019-06-05 07:31:42', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(948, NULL, '182086425', 1, 'a7611ea2-94f4-3dba-b54d-b2225f4b696d', '2019-06-01', '1112.44', '7472016', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:23', '2019-06-05 07:31:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(949, NULL, '1268116255', 1, 'c203a27d-62ab-3b36-9809-b39859e5bc46', '2019-05-11', '2782.34', '37212562', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:23', '2019-06-05 07:29:42', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(950, NULL, '105323155', 1, '3801d811-75de-3fbd-982a-5e2b70c5088e', '2018-09-07', '2560.73', '27712700', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:23', '2019-06-05 07:31:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(951, NULL, '419019904', 1, '8926e404-fecb-3899-972f-ed2042c7d1e6', '2018-09-13', '445.06', '12264827', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:23', '2019-06-05 07:31:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(952, NULL, '486024418', 1, 'f615ce5f-27cd-30e5-8cb3-033c24139a12', '2019-02-16', '612.73', '4051482', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:23', '2019-06-05 07:31:42', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(953, NULL, '943678773', 1, '9abda5ee-e44e-371b-956f-c2be6c77d12f', '2018-10-29', '869.62', '9977172', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:24', '2019-06-05 07:28:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(954, NULL, '31134303', 1, '301e8378-b0a6-3cff-967f-178f0590b9d6', '2019-01-15', '2454.77', '24363074', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:24', '2019-06-05 07:28:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(955, NULL, '612536082', 1, '01f47838-054d-303d-b07f-3caeed52517e', '2019-03-09', '2755.35', '29864177', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:24', '2019-06-05 07:28:57', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(956, NULL, '1062725135', 1, '2d68508e-3c71-34cb-9e92-1080e8ea0b16', '2018-06-08', '2033.72', '39223470', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:24', '2019-06-05 07:32:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(957, NULL, '682694395', 1, '206110d6-8b69-3557-8939-a35e542e0d66', '2018-09-12', '1415.89', '27910021', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:24', '2019-06-05 07:29:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(958, NULL, '782157381', 1, '7d715661-811a-3568-9d91-6b40d79a6ebd', '2019-02-16', '2922.30', '34227453', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:25', '2019-06-05 07:31:43', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(959, NULL, '479421721', 1, '4df29542-bbfb-3c38-ad96-d4bf89141a2c', '2018-08-06', '1557.19', '10755729', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:25', '2019-06-05 07:31:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(960, NULL, '353254533', 1, '39c70c56-4e2a-307d-8813-9b5a0ec5241e', '2018-07-03', '907.70', '16727839', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:25', '2019-06-05 07:31:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(961, NULL, '614059725', 1, '79946545-7926-388e-a2a4-5d3236e83979', '2019-02-22', '888.56', '43152093', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:25', '2019-06-05 07:29:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(962, NULL, '1065095726', 1, '76f3c3ee-8576-3520-9586-e2162a3bb9ec', '2019-05-26', '781.23', '44114388', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:25', '2019-06-05 07:32:31', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(963, NULL, '668996885', 1, '47c57933-b812-367d-adc3-6d4d8da59201', '2019-04-08', '2451.86', '22623263', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:25', '2019-06-05 07:29:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(964, NULL, '667972835', 1, '4c83a297-231c-3acd-95ef-06f4912078e1', '2018-06-27', '1404.33', '22940126', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:26', '2019-06-05 07:32:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(965, NULL, '918346941', 1, '02658473-c139-30dd-a0f9-53502351adc0', '2018-12-15', '1362.45', '12678465', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:26', '2019-06-05 07:31:43', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(966, NULL, '1176229998', 1, 'a84bba2c-54f6-39fe-80fa-d2ac158b8533', '2018-11-30', '461.28', '9694407', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:26', '2019-06-05 07:32:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(967, NULL, '1482269315', 1, '3903d28d-0d44-3b66-8dee-310131d98ea2', '2018-08-23', '1807.44', '4871854', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:26', '2019-06-05 07:31:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(968, NULL, '462336903', 1, '9580e6a6-1edd-3c1f-9f98-0afbbf4cbda5', '2018-09-05', '491.30', '8817422', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:26', '2019-06-05 07:31:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(969, NULL, '1106580637', 1, '7b60d37a-6131-3f96-ab7b-bdbc81d70482', '2018-10-13', '1408.65', '13960968', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:27', '2019-06-05 07:31:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(970, NULL, '387268715', 1, '34d371a2-eabb-3a47-b33b-2ac02ad7d14c', '2019-05-14', '1435.39', '9036625', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:27', '2019-06-05 07:32:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(971, NULL, '358522597', 1, '3c11bfdc-9c42-333a-84f6-4e2612bd8bab', '2018-09-12', '1910.03', '46020712', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:27', '2019-06-05 07:31:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(972, NULL, '1424196058', 1, '010544b7-7758-3708-ad15-1c895aecd4fd', '2019-02-10', '1527.69', '33672769', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:27', '2019-06-05 07:28:12', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(973, NULL, '1286987270', 1, '906ef842-e6f3-3f17-9215-6316050b293a', '2019-05-04', '1623.66', '20903713', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:27', '2019-06-05 07:31:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(974, NULL, '1320487240', 1, 'b87a91cd-7601-3ab4-af8c-708fddb558cb', '2019-02-09', '2687.50', '6394351', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:27', '2019-06-05 07:31:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(975, NULL, '499491839', 1, '48a97b32-3792-3d32-920a-0d6ee079c96c', '2019-02-14', '1859.82', '38902814', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:28', '2019-06-05 07:28:48', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(976, NULL, '153774777', 1, 'c2223e55-eb53-3c61-9973-091409420812', '2019-04-18', '1817.80', '41843108', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:28', '2019-06-05 07:28:59', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(977, NULL, '664403597', 1, '456a17a6-c68c-32d0-98c5-e08dced458d2', '2018-10-05', '1720.66', '37736454', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:28', '2019-06-05 07:28:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(978, NULL, '647097959', 1, '7adb07f6-3654-3426-b2bb-08d0ef5ba891', '2019-02-01', '2045.44', '11445432', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:28', '2019-06-05 07:31:45', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(979, NULL, '534493095', 1, '34c6779d-a65a-375c-8f88-c5a26541a3bb', '2019-02-19', '1321.39', '2179233', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:28', '2019-06-05 07:31:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(980, NULL, '361541338', 1, '752eab37-9efe-304a-906d-f3682ef52743', '2019-05-03', '1214.05', '19725910', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:29', '2019-06-05 07:31:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(981, NULL, '899701369', 1, 'd405a40e-1cbc-30e2-af69-05b4c82671b0', '2019-02-26', '691.45', '29074140', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:29', '2019-06-05 07:28:01', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(982, NULL, '1274776594', 1, '6af43e6f-15aa-3cf0-8b8a-fad330b72036', '2018-08-23', '1496.34', '38788476', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:29', '2019-06-05 07:28:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(983, NULL, '1154832240', 1, 'e5c8adb8-b364-343b-b328-3cb6857c54ac', '2019-03-07', '1609.66', '44006606', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:29', '2019-06-05 07:31:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(984, NULL, '454117623', 1, 'b36c8bed-e504-38ad-9578-96d10bb92db9', '2019-05-16', '1999.54', '39860622', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:29', '2019-06-05 07:31:45', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(985, NULL, '161910170', 1, '956d61df-dc77-3d12-bd5d-1b805bbff949', '2018-11-04', '2868.25', '17624540', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:29', '2019-06-05 07:31:45', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(986, NULL, '1119273377', 1, '88ac2a57-1b81-3a83-baf2-161c821678bc', '2018-10-09', '800.60', '36627952', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:29', '2019-06-05 07:31:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(987, NULL, '945052976', 1, 'ad00bcc3-5ce1-3b31-9551-539d7ccdf6b2', '2019-02-15', '2613.84', '14125320', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:29', '2019-06-05 07:31:45', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(988, NULL, '174703933', 1, 'f69dbb87-cad2-3f6e-adc4-cd38749fd1a6', '2019-04-27', '2076.46', '31634902', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:30', '2019-06-05 07:31:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(989, NULL, '1240953730', 1, 'b93e9453-49db-3b51-9e1f-04d649be3368', '2018-12-28', '1491.65', '41004295', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:30', '2019-06-05 07:28:49', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(990, NULL, '787154526', 1, 'ab5fb9ba-359f-359f-bf6e-5e6bde4099a2', '2019-02-09', '1498.12', '42264557', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:30', '2019-06-05 07:31:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(991, NULL, '525210531', 1, 'b9bc35aa-84cf-3cc3-b70f-d11c3894ee78', '2018-08-19', '1010.36', '27821351', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:30', '2019-06-05 07:31:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(992, NULL, '1522527202', 1, 'fddc9000-1481-3496-b42f-6c769de5f2fe', '2018-09-29', '2624.21', '22560633', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:30', '2019-06-05 07:31:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(993, NULL, '651251492', 1, 'e78515b3-42a7-3bf5-8d39-e2786af209cc', '2018-06-29', '2040.80', '8976517', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:31', '2019-06-05 07:31:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(994, NULL, '1000632199', 1, 'fbb894a2-1fee-3d9b-9f24-554e275d745f', '2018-07-24', '2291.84', '35842602', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:31', '2019-06-05 07:31:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(995, NULL, '1325047674', 1, 'c29f4091-f371-36b9-b91b-dbe6b2c90384', '2018-07-19', '1638.85', '28606445', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:31', '2019-06-05 07:31:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(996, NULL, '39139002', 1, '5270a0cc-c857-38b1-9371-8ef78c2c87ea', '2019-03-18', '2484.65', '42249753', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:31', '2019-06-05 07:29:43', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(997, NULL, '1202186067', 1, 'f7ac1ada-1a6a-3756-99fe-74c2f93e046f', '2019-01-13', '1062.38', '29567523', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:31', '2019-06-05 07:31:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(998, NULL, '1057684926', 1, 'acac064b-cc11-34e4-b901-c97a2463d626', '2018-12-14', '875.01', '21909554', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:32', '2019-06-05 07:31:47', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(999, NULL, '1122922307', 1, '22203750-8fc0-37ee-a91d-aadd241bb3b2', '2019-04-26', '906.38', '29380018', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:32', '2019-06-05 07:27:59', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1000, NULL, '1220602398', 1, '905f253d-68e8-3d9a-924a-dba60d7a41ee', '2018-10-11', '2667.29', '11033844', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:32', '2019-06-05 07:31:48', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1001, NULL, '1287461205', 1, '2a69ae82-1a88-38d2-bd4c-e6bd03751d12', '2019-01-24', '1540.20', '42241106', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:32', '2019-06-05 07:31:48', 1, NULL, 2, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1002, NULL, '1028144972', 1, 'c533c97c-34e3-3c8e-8a40-546804b69c09', '2018-10-02', '2397.75', '21553469', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:32', '2019-06-05 07:31:48', 1, NULL, 2, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1003, NULL, '1332389519', 1, '6161693a-fc06-387a-b9c5-ba7b3ed8ad16', '2019-04-13', '2324.08', '23698627', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:32', '2019-06-05 07:31:48', 1, NULL, 2, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1004, NULL, '163297987', 1, '949cc733-268e-3945-adde-3e73d1bf5e3b', '2018-09-01', '1271.37', '22451492', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:33', '2019-06-05 07:31:48', 1, NULL, 2, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1005, NULL, '461800420', 1, 'ef09e9b7-f091-3b31-9bad-eb5884e600ee', '2018-12-31', '859.53', '1252698', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:33', '2019-06-05 07:31:49', 1, NULL, 2, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1006, NULL, '583287123', 1, 'f05c2f52-0b59-3578-8731-302cb71b0122', '2018-09-11', '2878.74', '5019035', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:33', '2019-06-05 07:31:49', 1, NULL, 2, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1007, NULL, '361506843', 1, '925b299a-9c52-3a76-8993-56da27e0df0e', '2019-05-09', '1873.72', '26546255', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:33', '2019-06-05 07:31:49', 1, NULL, 2, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1008, NULL, '132448145', 1, '00596e56-af4c-3037-a1be-6e87a5e2672b', '2018-09-30', '1145.76', '40354019', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:33', '2019-06-05 07:31:49', 1, NULL, 2, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1009, NULL, '51201995', 1, '18e2d5aa-6b6f-3a61-9248-3a6e9e154c07', '2018-06-26', '878.24', '34302942', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:34', '2019-06-05 07:31:49', 1, NULL, 2, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1010, NULL, '220108186', 1, '2cf3bea1-f992-37e8-a7e6-c583f90810f1', '2018-08-23', '2051.91', '20417375', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:34', '2019-06-05 07:31:49', 1, NULL, 2, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1011, NULL, '1121094649', 1, '69bcfc7f-4888-3c22-97bb-f98688a01d0a', '2019-05-13', '2228.85', '21958309', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:34', '2019-06-05 07:31:49', 1, NULL, 2, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1012, NULL, '145196440', 1, 'b40d29a9-3d56-3fd7-adf5-07e093b7d70e', '2019-03-27', '2796.12', '27208755', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:34', '2019-06-05 07:31:50', 1, NULL, 2, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1013, NULL, '751345571', 1, 'bbf2db03-fcdd-39dd-90fc-daccc9adee0f', '2019-02-08', '1611.16', '18021920', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:34', '2019-06-05 07:31:50', 1, NULL, 2, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1014, NULL, '588935345', 1, '9192d76e-7466-38e8-8348-0685d7f11e9c', '2019-01-02', '1746.61', '28735789', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:35', '2019-06-05 07:31:50', 1, NULL, 2, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1015, NULL, '1292767120', 1, '40cef509-73be-3eb9-80b1-547a99a00afe', '2019-05-27', '754.80', '45392814', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:35', '2019-06-05 07:31:50', 1, NULL, 2, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1016, NULL, '1098314846', 1, '0cc0975e-f9f8-3063-9fa0-248e55a9ec17', '2019-02-04', '1512.90', '35098630', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:35', '2019-06-05 07:31:50', 1, NULL, 2, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1017, NULL, '894698709', 1, 'c5054761-55ed-38a3-afb4-4a01567f5e02', '2018-10-19', '380.46', '18292818', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:35', '2019-06-05 07:31:50', 1, NULL, 2, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1018, NULL, '892551597', 1, 'cf57c7f1-4599-3b70-8790-26ab38cde83f', '2019-04-14', '2010.92', '42088798', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:35', '2019-06-05 07:31:50', 1, NULL, 2, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1019, NULL, '1386999535', 1, '3d2fc027-16b2-3c35-9737-d9f193887531', '2019-05-10', '2869.51', '37509260', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:36', '2019-06-05 07:31:50', 1, NULL, 2, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1020, NULL, '888400118', 1, 'e0d5d7dc-6839-3b00-9717-0fed9e28aad3', '2019-05-19', '854.43', '32965093', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:36', '2019-06-05 07:31:51', 1, NULL, 2, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1021, NULL, '207300290', 1, '6674be4f-06bd-3574-a81b-13d591671291', '2019-03-09', '444.47', '46683919', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:36', '2019-06-05 07:31:51', 1, NULL, 2, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_rating_5`) VALUES
(1022, NULL, '917468368', 1, 'd5b4c9bb-50ff-3f61-9eca-6cd854cc7de4', '2019-06-04', '2057.96', '9533254', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:36', '2019-06-05 07:31:51', 1, NULL, 2, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1023, NULL, '873004420', 1, 'd4c06da8-c0c4-34e6-93c6-57506f80e75a', '2019-03-07', '2224.19', '47555250', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:37', '2019-06-05 07:31:51', 1, NULL, 2, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1024, NULL, '1492335666', 1, '8b2d5fe3-c2fa-36ce-8c92-0aa1b718136f', '2018-11-17', '386.89', '2033027', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:37', '2019-06-05 07:31:51', 1, NULL, 2, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1025, NULL, '679710198', 1, '21802d42-b8e1-3809-8456-2964b0a50718', '2019-03-13', '2067.72', '48354240', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:37', '2019-06-05 07:31:51', 1, NULL, 2, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1026, NULL, '53070319', 1, 'a55e4e67-ecd3-3d9b-9370-7d568f2c99bc', '2019-01-04', '504.46', '14412231', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:37', '2019-06-05 07:31:51', 1, NULL, 2, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1027, NULL, '294060424', 1, '295d73ed-b5db-31b4-b1b1-054096d3c71d', '2019-06-02', '636.94', '24601624', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:37', '2019-06-05 07:31:51', 1, NULL, 2, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1028, NULL, '727441998', 1, '4fda0b28-3b1a-37ec-ae01-b75d3b0cb832', '2019-01-12', '1725.71', '17526783', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:37', '2019-06-05 07:31:51', 1, NULL, 2, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1029, NULL, '1040258270', 1, 'c7caa5d3-345d-3dea-956f-19d56a7cddec', '2018-08-23', '1841.93', '39620395', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:38', '2019-06-05 07:31:51', 1, NULL, 2, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1030, NULL, '264490797', 1, '48fed7fa-4a5b-35bb-9096-ea2626e69801', '2019-05-21', '1014.40', '42186368', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:38', '2019-06-05 07:31:52', 1, NULL, 2, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1031, NULL, '403952615', 1, '4912108c-e1cb-31e3-b300-5bdc7ce645c0', '2019-02-27', '710.23', '29764819', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:38', '2019-06-05 07:31:52', 1, NULL, 2, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1032, NULL, '93418467', 1, '53fb60c4-5e2b-3052-8f41-a2688e0a7d0e', '2018-09-28', '672.66', '6064197', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:38', '2019-06-05 07:31:52', 1, NULL, 2, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1033, NULL, '241096474', 1, 'd265c51b-98ef-31f3-b7d0-6605c5d44d00', '2018-09-22', '2987.82', '24437836', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:38', '2019-06-05 07:31:52', 1, NULL, 2, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1034, NULL, '1189417475', 1, '7dfb978b-7f33-3688-81c4-e8fb847c22f8', '2018-07-15', '1645.44', '45948203', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:38', '2019-06-05 07:31:52', 1, NULL, 2, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1035, NULL, '1345531371', 1, '54cd5b4b-82d5-30ed-ad3c-00e951db31ba', '2018-08-15', '305.23', '25659942', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:38', '2019-06-05 07:31:52', 1, NULL, 2, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1036, NULL, '1088979395', 1, '3599f24f-0195-375e-86c9-a3bf15599035', '2019-04-17', '2694.42', '5906603', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:38', '2019-06-05 07:31:52', 1, NULL, 2, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1037, NULL, '252722282', 1, '0a047d61-968a-3cf7-9ac4-e411744fb0ee', '2019-04-23', '1581.24', '25303270', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:39', '2019-06-05 07:31:52', 1, NULL, 2, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1038, NULL, '228242000', 1, 'cbaa9185-6c86-3bc3-bc24-e56026bb4f0c', '2018-10-02', '2228.54', '43258908', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:39', '2019-06-05 07:31:52', 1, NULL, 2, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1039, NULL, '1267422582', 1, 'fd108d62-48ee-31de-8c70-8d156e491f26', '2018-09-27', '1684.91', '1835191', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:39', '2019-06-05 07:31:52', 1, NULL, 2, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1040, NULL, '1558311902', 1, '84d648e1-4bcf-36a8-8284-0eae232e01c9', '2018-07-28', '2587.74', '8496643', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:39', '2019-06-05 07:31:53', 1, NULL, 2, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1041, NULL, '343499011', 1, '50b5451f-ab87-3544-b617-8080c1c4525b', '2018-11-14', '1645.69', '17940755', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:39', '2019-06-05 07:31:53', 1, NULL, 2, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1042, NULL, '397214308', 1, 'c4b50da5-3f4f-3113-a2e7-371ab2d82699', '2018-12-06', '778.47', '41861169', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:39', '2019-06-05 07:31:53', 1, NULL, 2, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1043, NULL, '134204129', 1, '1b455bf0-7609-36e0-976a-acb21cb96298', '2018-07-27', '1993.34', '47825786', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:39', '2019-06-05 07:31:53', 1, NULL, 2, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1044, NULL, '1073079927', 1, 'dff4c077-c9af-3733-afc5-e08c5dad54db', '2019-05-28', '1279.47', '47416968', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:39', '2019-06-05 07:31:53', 1, NULL, 2, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1045, NULL, '1080991819', 1, 'c9d8aad4-c7b5-3be0-90ee-c30c178c5135', '2018-08-24', '408.96', '21543603', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:40', '2019-06-05 07:31:53', 1, NULL, 2, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1046, NULL, '581083610', 1, '9f2a57bd-a150-3c43-a2b2-e74520b30c06', '2019-03-20', '2320.93', '15257699', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:40', '2019-06-05 07:31:53', 1, NULL, 2, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1047, NULL, '1058002191', 1, '9a8d26f6-57ce-36ca-8d42-165a653b1fd0', '2019-02-15', '1824.02', '47390048', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:40', '2019-06-05 07:31:53', 1, NULL, 2, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1048, NULL, '1250091586', 1, '464aaf59-bf16-3e25-8e19-339079452008', '2018-07-11', '2711.40', '22764853', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:40', '2019-06-05 07:31:53', 1, NULL, 2, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1049, NULL, '1043662514', 1, '5488a779-eb41-38b6-91b4-d7992378d536', '2019-01-04', '1637.96', '19767462', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:40', '2019-06-05 07:31:53', 1, NULL, 2, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1050, NULL, '1375503665', 1, '3bec69c1-c213-3485-a379-8aa784943eff', '2019-05-21', '1685.20', '21390684', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:40', '2019-06-05 07:31:54', 1, NULL, 2, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1051, NULL, '1156996884', 1, 'f749bf65-a6ab-342d-89ca-496ca1e87283', '2019-04-26', '1745.30', '9987202', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:40', '2019-06-05 07:31:54', 1, NULL, 3, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1052, NULL, '63453453', 1, '3596fd66-8e6e-3699-bf7f-555b3098593c', '2019-05-28', '1542.25', '42304585', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:40', '2019-06-05 07:31:54', 1, NULL, 3, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1053, NULL, '468400309', 1, 'a6d56600-8ec3-3f7d-a6d3-1336d35e4612', '2018-12-19', '875.06', '49688467', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:41', '2019-06-05 07:31:54', 1, NULL, 3, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1054, NULL, '531900109', 1, 'f3e072dc-0573-30ab-b40d-88de4e35c1e0', '2018-10-01', '1028.82', '2092625', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:41', '2019-06-05 07:31:54', 1, NULL, 3, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1055, NULL, '1022780720', 1, '1cfe653d-a6f2-3158-8009-8909b5c9c63a', '2018-07-27', '2423.73', '15028657', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:41', '2019-06-05 07:31:54', 1, NULL, 3, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1056, NULL, '848729198', 1, '2f24de10-c841-3756-811c-faaa9d56d1e3', '2018-12-30', '1748.97', '9915835', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:41', '2019-06-05 07:31:54', 1, NULL, 3, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1057, NULL, '873971317', 1, '96ea2abf-4602-313e-a198-fb7b2ce0caa7', '2018-06-23', '1260.36', '22236317', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:41', '2019-06-05 07:31:54', 1, NULL, 3, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1058, NULL, '989506109', 1, '52d1c9d0-e7a7-3fa6-869d-3767781aed70', '2018-06-20', '671.00', '31339662', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:41', '2019-06-05 07:31:54', 1, NULL, 3, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1059, NULL, '1363303786', 1, '2c6c98bb-6ae2-31f4-a725-6b53b7648560', '2018-07-24', '2520.26', '46088687', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:41', '2019-06-05 07:31:54', 1, NULL, 3, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1060, NULL, '552847909', 1, '8764809f-5012-392e-996c-50576ed7ccb1', '2018-07-23', '2563.67', '18246559', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:42', '2019-06-05 07:31:54', 1, NULL, 3, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1061, NULL, '55379031', 1, '7a516bab-0969-3577-a236-1bcd3424dc26', '2018-11-19', '2622.29', '25516458', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:42', '2019-06-05 07:31:55', 1, NULL, 3, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1062, NULL, '487404125', 1, 'cb8a0d80-3eac-3d89-908c-cb54661dba85', '2018-09-19', '1253.10', '27281558', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:42', '2019-06-05 07:31:55', 1, NULL, 3, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1063, NULL, '854104203', 1, 'e9694902-b939-3509-a1ae-3181f9793f35', '2018-10-14', '2765.44', '22515819', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:42', '2019-06-05 07:31:55', 1, NULL, 3, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1064, NULL, '223488301', 1, '47f4ca27-8b09-37ac-a240-ebd50b8034c9', '2018-07-21', '588.97', '39181356', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:42', '2019-06-05 07:31:55', 1, NULL, 3, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1065, NULL, '35651285', 1, 'deb1b477-9e11-375d-bb56-a4710e2fe7d6', '2018-07-28', '1962.42', '9592838', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:42', '2019-06-05 07:31:55', 1, NULL, 3, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1066, NULL, '960138490', 1, '3afbd3fb-1bd3-3a69-84d3-0f97492d76af', '2019-03-28', '1720.06', '37388482', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:42', '2019-06-05 07:31:55', 1, NULL, 3, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1067, NULL, '1225046097', 1, 'ea6d6026-535a-3629-a160-d1cd74640d94', '2019-01-03', '1842.16', '3740904', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:42', '2019-06-05 07:31:55', 1, NULL, 3, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1068, NULL, '725866525', 1, '40f76617-6320-34f4-b4bc-98bdd9bba76b', '2018-11-02', '2387.60', '33052043', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:43', '2019-06-05 07:31:55', 1, NULL, 3, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1069, NULL, '455791645', 1, '405ff02d-2695-3d54-987d-f133c2c47987', '2019-02-04', '589.02', '29497521', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:43', '2019-06-05 07:31:55', 1, NULL, 3, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1070, NULL, '128603048', 1, '92fb34e8-0318-3fdb-8891-539f1a464221', '2019-03-24', '363.66', '6697169', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:43', '2019-06-05 07:31:56', 1, NULL, 3, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1071, NULL, '192815074', 1, '2ad66c7d-50ad-3422-b54f-33d44c7d4711', '2019-01-23', '2758.51', '18335010', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:43', '2019-06-05 07:31:56', 1, NULL, 3, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1072, NULL, '1398154966', 1, '474a2473-a9d8-3121-9d7e-1daebe16adf7', '2018-10-16', '1295.00', '26132193', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:43', '2019-06-05 07:31:56', 1, NULL, 3, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1073, NULL, '860391713', 1, 'c4d3acbe-9b34-3083-ac22-39b4a1b022f4', '2018-09-10', '2251.18', '45075217', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:43', '2019-06-05 07:31:57', 1, NULL, 3, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1074, NULL, '1536973272', 1, '78708cae-6980-3cb7-bf73-6eb8e236c944', '2019-02-26', '2135.78', '11536790', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:43', '2019-06-05 07:31:57', 1, NULL, 3, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1075, NULL, '1371806666', 1, '25339dc3-945f-380c-bf04-ab4e2d61462a', '2018-12-22', '1283.11', '26484614', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:43', '2019-06-05 07:31:58', 1, NULL, 3, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1076, NULL, '869838119', 1, '48dc6e92-b9e8-387f-8b4a-3ee7fcc66172', '2019-04-08', '2198.73', '12876325', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:44', '2019-06-05 07:31:58', 1, NULL, 3, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1077, NULL, '945706374', 1, '559af1e3-655c-3598-b27b-90d8f9bbe1f6', '2019-05-11', '2668.17', '26416603', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:44', '2019-06-05 07:31:58', 1, NULL, 3, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1078, NULL, '1204074228', 1, '6a621ce6-3543-36b2-8e50-c56fc59aff78', '2019-05-10', '324.97', '28491810', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:44', '2019-06-05 07:31:59', 1, NULL, 3, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1079, NULL, '32552615', 1, '3950f035-9d5e-3039-b4a4-3d4815cdddd4', '2018-08-29', '339.16', '49145766', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:44', '2019-06-05 07:31:59', 1, NULL, 3, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1080, NULL, '823557219', 1, '086f6a77-ed01-3bc2-b493-48245d5b8d98', '2019-02-26', '1885.86', '17999782', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:44', '2019-06-05 07:31:59', 1, NULL, 3, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1081, NULL, '257844577', 1, 'be937cb0-d3fe-312e-9ffd-2a4dd2b8650c', '2019-03-06', '1228.17', '27363280', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:44', '2019-06-05 07:31:59', 1, NULL, 3, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1082, NULL, '921271275', 1, '594c0daa-5213-3c08-8c4d-b4397e21c9a2', '2018-09-30', '1777.75', '3241738', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:44', '2019-06-05 07:31:59', 1, NULL, 3, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1083, NULL, '188798846', 1, '119db7ed-dfff-3d14-9616-e0fdf84a0e6f', '2018-12-12', '2676.37', '6001492', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:44', '2019-06-05 07:31:59', 1, NULL, 3, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1084, NULL, '611534637', 1, 'e25db30f-45e5-3459-8073-e12917e5c79a', '2018-06-26', '1197.15', '2385448', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:44', '2019-06-05 07:31:59', 1, NULL, 3, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1085, NULL, '1365225927', 1, '178b680c-7465-3dde-ba30-101ecc40cc00', '2019-06-04', '634.49', '13545716', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:44', '2019-06-05 07:31:59', 1, NULL, 3, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1086, NULL, '1366150278', 1, '5f7d1b99-64f2-30f0-a8bd-94a425687dbb', '2019-06-01', '1589.89', '26683148', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:45', '2019-06-05 07:31:59', 1, NULL, 3, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1087, NULL, '607188144', 1, '8a0dc4d6-67ae-345c-b12f-ec1287be755c', '2018-11-18', '704.10', '10965806', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:45', '2019-06-05 07:32:00', 1, NULL, 3, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1088, NULL, '1512435817', 1, '8bde6206-e202-3d24-b3e7-dbdc3ebb7923', '2018-08-04', '1431.39', '13708030', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:45', '2019-06-05 07:32:00', 1, NULL, 3, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1089, NULL, '737179149', 1, 'e97fb5ba-23b7-3545-9a32-51bf91eebce3', '2019-02-04', '1242.96', '5690206', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:45', '2019-06-05 07:32:00', 1, NULL, 3, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1090, NULL, '1537364235', 1, 'b352b901-d2b1-330d-9f57-e4887ac4b494', '2019-05-05', '2583.49', '21053466', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:45', '2019-06-05 07:32:00', 1, NULL, 3, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1091, NULL, '1065558070', 1, 'cf6ad6c7-a62c-31d8-ab37-66b77353763c', '2018-09-21', '1802.61', '10689149', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:45', '2019-06-05 07:32:00', 1, NULL, 3, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1092, NULL, '197073251', 1, 'fc877907-bde6-3935-9f26-e40867cecc2f', '2018-08-22', '2452.83', '11798925', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:45', '2019-06-05 07:32:00', 1, NULL, 3, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1093, NULL, '1228144093', 1, '7c3c3155-91f5-39e0-be7b-b0e29c43fa66', '2018-12-26', '1703.96', '46940109', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:45', '2019-06-05 07:32:00', 1, NULL, 3, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1094, NULL, '1343795376', 1, 'a2bcd7df-c05f-36e8-871a-3116abc71f63', '2019-02-19', '2874.83', '19985594', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:46', '2019-06-05 07:32:00', 1, NULL, 3, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1095, NULL, '64321444', 1, '1935aca6-efb3-3e8f-b9f1-fe5337aef6c1', '2018-12-16', '2214.68', '19273949', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:46', '2019-06-05 07:32:01', 1, NULL, 3, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1096, NULL, '430766658', 1, 'd717eb07-38bf-30b5-9061-618e62756912', '2018-09-02', '1031.55', '41874653', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:46', '2019-06-05 07:32:01', 1, NULL, 3, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1097, NULL, '1324326902', 1, 'fefa2a2a-bfce-3ca0-b4ad-ce5f3b916360', '2019-05-31', '770.70', '37479112', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:46', '2019-06-05 07:32:01', 1, NULL, 3, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1098, NULL, '294113981', 1, '526628a2-718b-3012-a04b-3dff47623e26', '2018-11-17', '2259.55', '10522614', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:46', '2019-06-05 07:32:01', 1, NULL, 3, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1099, NULL, '508394409', 1, 'cbb6bc51-cd36-3da6-b8f7-3d0818fba125', '2019-01-18', '2113.86', '29363424', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:46', '2019-06-05 07:32:01', 1, NULL, 3, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1100, NULL, '403867579', 1, '982232aa-b3fe-3961-9846-f91174ae6700', '2019-05-22', '1339.44', '48795287', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:46', '2019-06-05 07:32:01', 1, NULL, 3, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1101, NULL, '299468216', 2, '4e23c768-8ea4-35a5-a6dc-54bf5ac261e9', '2018-10-07', '1307.32', '45436818', 9, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:46', '2019-06-05 07:29:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1102, NULL, '429370068', 2, 'dc62d1f8-2f92-360c-8cce-595b34106c19', '2019-03-07', '2577.55', '13107728', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:47', '2019-06-05 07:32:02', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1103, NULL, '188107087', 2, 'd4abf8a7-5d91-3444-9ad8-1781c2d371e8', '2018-08-12', '2511.76', '23265231', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:47', '2019-06-05 07:28:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1104, NULL, '1008181882', 2, '50a48de6-ebbc-3a23-aaa4-d6abaa4b9ab5', '2018-09-03', '1036.35', '43887948', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:47', '2019-06-05 07:32:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1105, NULL, '1216570846', 2, 'be11f349-07f2-3a7c-b7ea-9949137765bb', '2018-11-18', '1279.07', '20199715', 7, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:47', '2019-06-05 07:29:37', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1106, NULL, '415987045', 2, '0dace0f3-4f5a-359a-83cf-c0019501ebdb', '2018-07-09', '2798.86', '26995281', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:47', '2019-06-05 07:29:50', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1107, NULL, '49056232', 2, '292481d5-2b74-39f8-be3d-ab921f4a36fe', '2019-02-16', '946.25', '19373672', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:47', '2019-06-05 07:32:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1108, NULL, '264574472', 2, 'a9a59a80-c428-356b-960b-a6e124c464bc', '2018-06-09', '1157.27', '44723866', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:47', '2019-06-05 07:32:02', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1109, NULL, '138124222', 2, '8b87f4f8-c55c-3e1a-8d22-2aeb65643291', '2019-04-29', '599.20', '38715306', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:47', '2019-06-05 07:32:02', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1110, NULL, '50905059', 2, 'c4719d61-cda2-3777-85fd-833cfa2d6d1f', '2019-04-23', '973.63', '42017280', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:48', '2019-06-05 07:32:02', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1111, NULL, '826279715', 2, 'd506e7de-de3b-3ae6-b6d1-1cf0e075d211', '2018-06-20', '2248.27', '7190364', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:48', '2019-06-05 07:32:02', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1112, NULL, '877786051', 2, '0fc5466e-721d-3dd6-b450-80fe6347323c', '2019-03-30', '956.87', '5369021', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:48', '2019-06-05 07:32:03', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1113, NULL, '21088601', 2, '9f327847-fd10-3a17-ab7c-beadeac57095', '2018-09-22', '2852.30', '10325741', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:48', '2019-06-05 07:32:03', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1114, NULL, '1151902779', 2, '57f4019f-1ffd-387b-a60a-166ca0f19719', '2018-08-27', '583.21', '45049848', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:48', '2019-06-05 07:32:03', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1115, NULL, '554833096', 2, '9fcb045a-c305-39c2-a055-14fc6be27a6b', '2018-06-29', '726.66', '11916867', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:48', '2019-06-05 07:32:03', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1116, NULL, '1343081725', 2, 'd364b689-6135-3b38-bf2c-883ebea5ff83', '2018-09-26', '1996.71', '43254055', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:48', '2019-06-05 07:32:04', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1117, NULL, '1214524017', 2, '4c4aa73e-0c84-37e4-bd87-0c84d4625c92', '2019-04-08', '2151.20', '48946798', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:48', '2019-06-05 07:32:04', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1118, NULL, '1321085510', 2, '2e1f3069-c824-3f22-afb8-2828b4b68965', '2019-03-20', '2997.83', '49690382', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:49', '2019-06-05 07:32:04', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1119, NULL, '1449647136', 2, 'ac30bcf4-9b83-3faa-842c-3109b69931c0', '2019-03-07', '1139.44', '21666306', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:49', '2019-06-05 07:28:11', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1120, NULL, '905581482', 2, '8b69d277-9d14-3963-bb4e-88590da7f3c6', '2018-06-07', '2115.40', '29618055', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:49', '2019-06-05 07:32:04', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1121, NULL, '1528378659', 2, '87c9beb3-a876-319b-8b29-673a714ba934', '2018-08-15', '1199.48', '32432112', 7, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:49', '2019-06-05 07:29:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1122, NULL, '1405322457', 2, 'c697d4c0-cda7-3a0a-937f-692ef8b7ed17', '2018-09-07', '2722.98', '39788148', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:50', '2019-06-05 07:32:04', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1123, NULL, '964211827', 2, 'e303bb59-d1df-37e2-885c-663c932899ff', '2018-06-27', '2082.86', '40572340', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:50', '2019-06-05 07:32:04', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1124, NULL, '170487993', 2, 'a7919711-6136-3c9c-81d9-2cf2358d43c0', '2019-04-26', '1712.53', '48470733', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:50', '2019-06-05 07:32:04', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1125, NULL, '915116897', 2, '1202227d-3208-3c31-9174-6179dee6abbd', '2019-02-11', '2868.90', '10405198', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:51', '2019-06-05 07:32:04', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1126, NULL, '231503523', 2, 'cee63eca-375b-3497-b2c8-bbdb8a9b9c3d', '2018-11-04', '2601.00', '13985122', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:51', '2019-06-05 07:29:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1127, NULL, '1121876747', 2, 'b1a6729a-a4cd-34e8-bba7-276b2368d149', '2018-12-12', '1037.57', '49958877', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:51', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1128, NULL, '1427305937', 2, 'a6bfb05d-bfa0-3714-9423-aa7ea4d3cb6f', '2018-08-04', '1519.75', '7256838', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:51', '2019-06-05 07:28:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1129, NULL, '1516417186', 2, '7afe7a9a-147a-3ef5-9666-73a3aee0bedc', '2018-12-01', '2264.23', '19083738', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:51', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1130, NULL, '770410732', 2, '1add25a8-9141-3681-9891-e5f35d5b68e8', '2018-08-09', '2690.48', '33269581', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:52', '2019-06-05 07:29:52', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1131, NULL, '820823836', 2, '0b7e90ce-5843-337a-aa1c-6b5fc20fb8b8', '2018-07-20', '422.06', '6334878', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:52', '2019-06-05 07:29:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1132, NULL, '700955631', 2, 'ccdef4fa-a191-3591-863c-21792187b721', '2018-10-20', '2010.25', '39487406', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:52', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1133, NULL, '753120170', 2, 'a69b35d1-9e24-3797-9599-f045ca6008fb', '2019-02-25', '1627.18', '7963972', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:52', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1134, NULL, '528785834', 2, '80ca1bed-19d8-361b-a654-5d6f08b5d6f9', '2018-08-31', '538.56', '34198114', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:52', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1135, NULL, '1369154212', 2, '5e3677a7-2b3e-31f1-bdc6-7c2c54ed2bed', '2018-08-06', '1115.62', '7707160', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:52', '2019-06-05 07:32:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1136, NULL, '363465999', 2, '59128caa-b429-367d-98fc-0d8ba82c009f', '2019-04-27', '1575.86', '19129963', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:53', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1137, NULL, '1284095760', 2, '332e5aa9-65d9-3d9a-8bc4-2819acbbc338', '2018-11-24', '2759.83', '16663510', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:53', '2019-06-05 07:32:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1138, NULL, '1144244673', 2, '91cb507a-3711-3d83-995d-5e7943fb82dd', '2019-06-04', '2347.90', '48569663', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:53', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1139, NULL, '1027978452', 2, '43e68bd2-fc06-3ae4-9632-14e3f92f19d4', '2019-04-10', '2659.93', '20207403', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:53', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1140, NULL, '1409157569', 2, 'e39c6826-01c7-3453-92ea-e49a2b56ee97', '2018-11-17', '2536.48', '7756159', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:54', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1141, NULL, '1039577073', 2, 'c9522691-4c0d-3f25-9e67-99bbd559221f', '2019-01-12', '436.11', '19320583', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:54', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1142, NULL, '1240181943', 2, '5b6cbddb-06d8-3173-aaae-12382fc638d1', '2019-03-15', '2835.15', '2904701', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:54', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1143, NULL, '52878598', 2, '73da80f1-6caf-3e9f-9c49-cd2284664781', '2018-08-15', '2145.68', '13484589', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:54', '2019-06-05 07:32:05', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1144, NULL, '1497291067', 2, '766ffe23-8e80-3863-bef7-d181428142d3', '2018-10-01', '568.08', '4759757', 7, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:54', '2019-06-05 07:29:36', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1145, NULL, '501829962', 2, '0af62c9b-24c1-3d3b-a9a2-334f51f06158', '2019-04-30', '1088.76', '27754936', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:55', '2019-06-05 07:32:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(1146, NULL, '1348273615', 2, '4acfe6f7-c9de-32aa-a8cb-9a7272e257b6', '2018-07-26', '2121.30', '29799503', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:55', '2019-06-05 07:28:43', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1147, NULL, '1432851945', 2, 'b9ec9d1a-625f-33a3-8211-23bea98920b5', '2018-10-30', '1624.96', '13478319', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:55', '2019-06-05 07:32:06', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1148, NULL, '132534072', 2, 'db499bb9-70c0-3a17-9f9e-a4139d6b0762', '2019-02-16', '2668.05', '19090750', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:56', '2019-06-05 07:32:06', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1149, NULL, '193305142', 2, 'c037f7e0-3920-34b9-8b96-25ff3f089d0b', '2019-01-18', '2747.30', '21884643', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:56', '2019-06-05 07:32:06', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1150, NULL, '392522029', 2, 'ea08be71-275e-3e46-88af-99b1f6a247e4', '2019-03-21', '2374.78', '11876572', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:56', '2019-06-05 07:32:06', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1151, NULL, '1238816957', 3, 'c56dc212-5624-3222-8a4f-13b58723f809', '2018-11-02', '2915.01', '46993847', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:57', '2019-06-05 07:29:47', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1152, NULL, '1009409525', 3, 'f5131bac-010b-3841-9348-633135b3055a', '2019-04-12', '1280.55', '38814766', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:57', '2019-06-05 07:32:06', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1153, NULL, '781713512', 3, 'cc9bf75e-f0c9-36d6-9042-0f93a2c97d0f', '2019-05-25', '401.42', '27588479', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:57', '2019-06-05 07:32:06', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1154, NULL, '1537342953', 3, '5ea2c3b3-7429-3167-abd9-0b2e15fc570b', '2019-04-08', '1218.26', '22181278', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:57', '2019-06-05 07:32:06', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1155, NULL, '993981032', 3, 'fe316efd-dc21-3688-85fd-1aadff8b1231', '2018-11-12', '1593.75', '22191678', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:58', '2019-06-05 07:32:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1156, NULL, '750763692', 4, '93f4cf23-d424-3d09-aebc-d194591e8087', '2018-06-21', '2030.71', '34307104', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:58', '2019-06-05 07:32:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1157, NULL, '1182750118', 4, '45fe77d3-423b-3f26-87d1-b4255b00f67f', '2019-01-31', '926.09', '26590799', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:58', '2019-06-05 07:32:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1158, NULL, '1103486884', 4, 'a96391fd-f865-3364-b821-5e786c34993a', '2018-10-14', '1451.74', '47116426', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:59', '2019-06-05 07:28:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1159, NULL, '57625395', 4, 'cf01ad21-7f1b-31c9-9acc-0c90893ed490', '2018-09-26', '837.28', '13943686', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:59', '2019-06-05 07:32:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1160, NULL, '222838407', 4, 'a745cc7a-cc54-3aaa-816d-e6d4acba8174', '2018-09-12', '2999.72', '6758378', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:59', '2019-06-05 07:28:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1161, NULL, '1386145835', 5, 'c1b09b74-b1a5-3492-b303-488a65785244', '2019-04-11', '1700.25', '15826700', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:59', '2019-06-05 07:32:07', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1162, NULL, '453873753', 5, '5e447909-6a58-33be-8020-f6c2b7794c09', '2018-11-17', '680.66', '10899002', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:59', '2019-06-05 07:32:07', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1163, NULL, '571845852', 5, 'de5f355b-c199-3fb8-9f23-75f7ef9d522a', '2018-11-12', '1878.61', '3412181', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:26:59', '2019-06-05 07:32:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1164, NULL, '1115212787', 5, '64af2788-8213-3ef0-b8f8-57787a9303fd', '2018-06-20', '970.94', '49936521', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:00', '2019-06-05 07:32:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1165, NULL, '322797152', 5, '51e6c137-98e4-3d7e-8264-b57bbb2ed9c1', '2018-06-26', '1108.51', '3192122', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:00', '2019-06-05 07:32:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1166, NULL, '754697401', 6, 'a550234b-6cac-339c-994e-571eda585d52', '2018-09-18', '606.44', '39961709', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:00', '2019-06-05 07:28:18', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1167, NULL, '451173743', 6, 'b6a8acff-b65d-33fe-8422-bee72773fb9f', '2019-06-02', '1783.99', '3577275', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:00', '2019-06-05 07:32:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1168, NULL, '1266579005', 6, '8343e1ab-b305-3cec-bc72-f2d90aa31634', '2019-01-29', '494.52', '35225824', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:01', '2019-06-05 07:32:42', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1169, NULL, '702516714', 6, 'fef23d20-658c-3614-a9a0-d1c4cf87462d', '2019-05-28', '1304.18', '30190362', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:01', '2019-06-05 07:32:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1170, NULL, '1428946811', 6, '8c095f82-c0eb-3d11-bbb6-f82a91b03b84', '2019-02-01', '1253.34', '22000721', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:01', '2019-06-05 07:32:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1171, NULL, '1110428959', 7, '7a086599-ff46-3893-a2f5-cac44162bcd7', '2018-08-20', '1155.29', '17688969', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:01', '2019-06-05 07:28:14', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1172, NULL, '197793884', 7, 'f07509c0-98d8-368a-ad2b-9454f364b6ec', '2018-09-18', '1814.93', '5243061', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:02', '2019-06-05 07:32:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1173, NULL, '936381835', 7, 'f21664fb-240c-300b-8655-dd878ecf0f21', '2019-02-11', '767.93', '42955597', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:02', '2019-06-05 07:32:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1174, NULL, '987780604', 8, 'd212c33c-ee23-3cde-89bd-58a1293c0f18', '2019-02-06', '472.02', '33443235', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:03', '2019-06-05 07:32:08', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1175, NULL, '1383758606', 8, 'b7d69c1c-b866-36cd-9c74-959a2795026b', '2018-09-09', '1968.13', '8717170', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:03', '2019-06-05 07:32:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1176, NULL, '455559325', 8, 'c61c60c9-5e18-36f6-a97a-ed7f612b0f0f', '2018-09-12', '2609.07', '18174204', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:03', '2019-06-05 07:29:48', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1177, NULL, '1536407857', 8, '8b984c99-d34b-3431-a660-ce975970332c', '2018-08-19', '1007.73', '13674759', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:04', '2019-06-05 07:32:08', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1178, NULL, '284724439', 8, 'a0baefa4-0acd-3a46-b036-e0dcf03fddd8', '2019-01-01', '2873.38', '37907311', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:04', '2019-06-05 07:32:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1179, NULL, '164040738', 8, '31befbd5-fb76-3c09-aea0-62f73d081973', '2019-03-03', '1496.64', '32396024', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:04', '2019-06-05 07:32:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1180, NULL, '1401681153', 8, '31870d1e-d3ed-38ff-976a-d0759ffa936a', '2018-08-08', '2819.15', '36880662', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:04', '2019-06-05 07:32:32', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(1181, NULL, '1054705519', 8, '5ed57d1c-e99c-3285-b690-3c19e6425ca3', '2018-11-26', '2218.33', '1869420', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:04', '2019-06-05 07:32:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1182, NULL, '381436900', 8, '51dbd178-ee41-395d-846a-abb4c438124a', '2018-10-31', '1262.21', '40378996', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:05', '2019-06-05 07:32:09', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1183, NULL, '341019069', 8, 'f7b2dd3f-47b9-33d5-877f-8ed222a45b26', '2019-01-29', '2101.17', '28750974', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:05', '2019-06-05 07:32:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1184, NULL, '5179313', 8, '96ddf2f8-b22b-325f-aa73-39caac62c5d3', '2018-12-16', '541.23', '47516383', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:05', '2019-06-05 07:32:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1185, NULL, '562916202', 8, '07ad7cc5-3430-3e9e-9f8d-b709a146747f', '2019-05-19', '1107.03', '8578522', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:05', '2019-06-05 07:32:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1186, NULL, '192113054', 8, '151c6ac8-9755-3f07-be9d-c862b0819deb', '2019-01-05', '2308.10', '37347321', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:05', '2019-06-05 07:32:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1187, NULL, '1201884821', 8, '9b451a3c-a782-31ba-b931-e4ddf434b74d', '2018-12-26', '2606.32', '14109540', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:05', '2019-06-05 07:32:09', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1188, NULL, '1018320366', 8, '3c1a9134-fc95-33ab-8f12-99bc4c605038', '2018-12-24', '914.19', '24414728', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:05', '2019-06-05 07:32:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1189, NULL, '1365455513', 8, '247d5f2d-7194-3d85-935f-0fe0b73b5c39', '2018-07-29', '1149.99', '49791791', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:06', '2019-06-05 07:32:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1190, NULL, '771450111', 8, '605e823f-f7b9-3282-a9c6-59186139784e', '2019-05-19', '2227.92', '30501244', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:06', '2019-06-05 07:32:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1191, NULL, '1509202944', 8, '00156832-33fd-3189-878f-2380970c6cf7', '2018-10-19', '2265.74', '7735843', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:06', '2019-06-05 07:32:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1192, NULL, '876392687', 8, '101394fe-27f7-3492-be53-855240fc91e5', '2018-06-19', '1925.36', '12749436', 8, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:06', '2019-06-05 07:29:45', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_rating_5`) VALUES
(1193, NULL, '482164324', 8, '14e06c2f-d478-3a08-92bb-bb4f508a0cdd', '2019-05-23', '2522.98', '11718084', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:06', '2019-06-05 07:32:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1194, NULL, '1100290687', 8, '70b97c09-59d0-3f66-b6af-ee1065c74c59', '2018-09-07', '1541.32', '38876494', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:06', '2019-06-05 07:32:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1195, NULL, '1079550267', 8, '3b19ab00-ddd3-33ef-8d71-a49c169304e9', '2018-11-05', '1969.90', '28505317', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:07', '2019-06-05 07:32:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1196, NULL, '462932640', 8, '31063d7e-3457-3383-b78e-86de87530c19', '2018-12-13', '1867.57', '2894069', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:07', '2019-06-05 07:32:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1197, NULL, '1105397992', 8, 'ac660535-a5e6-35ff-83fd-4bd38638da8c', '2018-11-14', '956.72', '38023172', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:07', '2019-06-05 07:29:36', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1198, NULL, '1159237644', 8, 'ac0bd020-737c-34ab-bb82-53827a634cdc', '2019-01-16', '2102.76', '48760891', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:07', '2019-06-05 07:32:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1199, NULL, '723859152', 8, 'fe49c1b3-f2cd-3891-b763-c018eb05be92', '2018-07-31', '2966.99', '24240010', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:07', '2019-06-05 07:32:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1200, NULL, '302803801', 8, '582418fe-a5d9-3d5d-83cf-f8cd343f1713', '2018-10-25', '1501.58', '13838718', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:08', '2019-06-05 07:28:18', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1201, NULL, '1502742630', 8, '418e8c8d-488b-3eaa-8789-6487d8906edb', '2018-08-21', '2020.45', '46884288', 9, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:08', '2019-06-05 07:29:51', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1202, NULL, '981917545', 8, '4b43e51f-c13a-3e2a-9c6d-e0563ee00309', '2018-07-15', '1286.68', '47708362', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:08', '2019-06-05 07:32:10', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1203, NULL, '122429918', 8, 'ed279130-9236-38d4-80db-40cd1447e2c5', '2018-09-11', '2639.26', '44633229', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:08', '2019-06-05 07:32:11', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1204, NULL, '1281911591', 9, '9f3b81f1-8173-3eb5-b344-fbce299bcadf', '2018-08-12', '1898.50', '26076048', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:09', '2019-06-05 07:32:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(1205, NULL, '670456364', 9, '5bb310c3-d605-3334-ac50-b3469c7216a1', '2019-05-08', '1070.24', '26938780', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:09', '2019-06-05 07:28:41', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1206, NULL, '703406750', 9, 'b934a07f-7f03-381e-ac2e-b31c663a8fd9', '2018-12-05', '2264.00', '30562129', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:09', '2019-06-05 07:32:11', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1207, NULL, '1387998146', 9, '1dc87b29-2cac-3d81-8daf-cab690f7e05d', '2018-09-29', '2319.91', '47236361', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:09', '2019-06-05 07:28:46', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1208, NULL, '407402090', 9, '632b1b3b-a24c-3ce7-957c-85364ec386d0', '2018-06-23', '2457.00', '28112119', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:09', '2019-06-05 07:32:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1209, NULL, '467153474', 9, '935f6b84-5238-3c43-b92c-36c9e0386d4a', '2019-05-14', '1696.13', '6948573', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:09', '2019-06-05 07:32:11', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1210, NULL, '683606543', 9, '9f052645-bc5d-3030-9954-018f7fa75b61', '2018-07-14', '702.18', '20731951', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:10', '2019-06-05 07:28:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1211, NULL, '239014765', 9, '333a658e-dd5c-3058-bf34-5bc117cf67e3', '2018-07-07', '444.81', '28487611', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:10', '2019-06-05 07:32:11', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1212, NULL, '183990606', 9, 'a260decc-ae13-30b4-bd99-65b1ce21c370', '2018-09-24', '2793.77', '34357582', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:10', '2019-06-05 07:32:43', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1213, NULL, '493931270', 9, '52d0726a-ad3c-372b-a2bc-5f6741268e0a', '2018-12-03', '1312.31', '30379875', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:10', '2019-06-05 07:28:27', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1214, NULL, '683327583', 9, 'f0c1ceab-06da-3548-a036-895468735d43', '2019-04-20', '2286.69', '49871505', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:10', '2019-06-05 07:32:11', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1215, NULL, '532030774', 9, 'd5ece505-4609-37ba-a797-55fdcc36fb42', '2018-12-28', '888.60', '22271181', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:10', '2019-06-05 07:32:11', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1216, NULL, '539729552', 9, '16856123-a428-3394-bcc1-1580f5582238', '2019-05-24', '2713.53', '49413702', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:11', '2019-06-05 07:32:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1217, NULL, '1527684832', 9, '9674f3f7-3c9a-3104-8f72-b4a723b95336', '2019-02-02', '821.37', '32195517', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:11', '2019-06-05 07:32:12', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1218, NULL, '1281212553', 9, 'eef985fa-0260-3c2c-8fc1-6dbc7b6fe00f', '2019-06-04', '354.01', '33211957', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:11', '2019-06-05 07:32:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1219, NULL, '1552651964', 9, '11091b4a-de6d-3120-a73d-096fe182ca86', '2018-08-20', '2504.84', '25304323', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:11', '2019-06-05 07:32:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1220, NULL, '744793192', 9, 'd16ecbe7-e43a-3d8a-a454-35f614166b8d', '2018-08-23', '549.74', '40526303', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:11', '2019-06-05 07:32:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1221, NULL, '985328850', 9, '4ef1483a-65df-3327-9f15-5968b8f58fc5', '2019-01-30', '1023.41', '22661270', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:12', '2019-06-05 07:32:12', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1222, NULL, '1043856959', 9, 'b678afc0-6f5c-359a-a6c5-a8b7e4537f14', '2018-09-17', '1497.07', '37989312', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:12', '2019-06-05 07:32:12', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1223, NULL, '830129638', 9, '1cc7af91-6797-37b3-9476-188ff69b4959', '2018-12-26', '1142.43', '38943988', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:12', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1224, NULL, '541856525', 9, '42925444-09d2-3f36-a593-e9ede4687fcd', '2018-08-19', '2711.76', '47182657', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:12', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1225, NULL, '1404036601', 9, 'a5e2187b-a793-3ef2-b866-230b65a02f29', '2018-07-07', '1722.71', '24967809', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:13', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1226, NULL, '214003243', 9, '9f0b928c-205b-32b6-b013-252b30b27c7c', '2018-11-30', '2680.64', '14745713', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:13', '2019-06-05 07:29:32', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1227, NULL, '1210603716', 9, 'fc9ae414-94cf-3e33-995a-139d42ca73ab', '2018-11-05', '2126.25', '5887364', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:13', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1228, NULL, '153002219', 9, '14df2bf4-4791-3fae-a456-73e41e18dd4d', '2018-09-27', '2982.12', '47571888', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:14', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1229, NULL, '92835664', 9, '256475d1-e315-3ea5-afc6-13ca7021da6f', '2018-12-16', '2140.27', '47892532', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:14', '2019-06-05 07:29:00', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1230, NULL, '25924773', 9, 'e9ae713e-b10b-3e6e-bf15-7695ccb0d19e', '2018-09-12', '583.23', '24481352', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:14', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1231, NULL, '245439553', 9, '711aeeb2-f05f-3978-8898-bdb5c347246c', '2018-10-19', '1277.35', '37301803', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:14', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1232, NULL, '1193808475', 9, 'a207657f-def8-3971-9103-6d8c2f248611', '2018-07-06', '2499.47', '44717562', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:15', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1233, NULL, '24214524', 9, '581d6761-fdea-3f92-8d47-c79e132f6324', '2019-02-02', '2607.62', '47571600', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:15', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1234, NULL, '1302134080', 10, 'bb00a849-fb6f-3f25-aa21-2c32fca0aad9', '2019-01-22', '2140.47', '10390645', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:15', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1235, NULL, '849682738', 10, '5a528f83-b39e-3102-9a92-97ac562ced37', '2018-08-22', '2113.59', '20487005', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:15', '2019-06-05 07:32:13', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1236, NULL, '1470253613', 10, 'a7bb59dc-6f94-3e10-80ff-164baa6bd34d', '2018-09-04', '2233.76', '5839264', 8, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:15', '2019-06-05 07:29:35', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1237, NULL, '902655776', 10, '574de69f-b20c-36c9-921a-d826753937f6', '2018-09-15', '1619.91', '15610219', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:15', '2019-06-05 07:28:16', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1238, NULL, '913561674', 10, '8ea19eeb-25c7-3b22-b952-87ec88e8e36d', '2018-12-31', '1631.78', '31745675', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:16', '2019-06-05 07:32:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1239, NULL, '911187938', 10, '262143ce-ca54-3f95-8c17-2ae5181cb34d', '2018-10-28', '1165.73', '4789792', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:16', '2019-06-05 07:32:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1240, NULL, '376210472', 10, '79f6a099-6329-3e43-bace-a9f3eeae1b9c', '2018-09-04', '1856.38', '29193411', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:16', '2019-06-05 07:32:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1241, NULL, '336395634', 10, '4ef1f787-6f0e-358d-97e6-21474db1bebe', '2018-12-28', '2574.03', '32834686', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:16', '2019-06-05 07:32:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1242, NULL, '1234022446', 10, '909a4bf5-b6f2-37d8-afce-67b371147c9e', '2019-04-06', '2354.34', '7369485', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:16', '2019-06-05 07:28:19', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1243, NULL, '1111317555', 10, '18d1a58c-02ec-3f5a-85d5-e94e94d8d604', '2018-08-28', '1320.28', '31283335', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:17', '2019-06-05 07:32:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1244, NULL, '670528808', 10, 'e92e8c39-f79d-3b77-a744-82257f9b0957', '2019-03-23', '2357.22', '26603821', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:17', '2019-06-05 07:32:14', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1245, NULL, '1482500004', 10, 'dc72e384-df21-3fab-8110-b9b19ca95dba', '2018-11-26', '1709.57', '7156820', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:17', '2019-06-05 07:32:14', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1246, NULL, '532181544', 10, 'b8891315-ab93-3d84-8208-df8a8b316124', '2018-12-24', '1382.53', '32193844', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:17', '2019-06-05 07:32:14', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1247, NULL, '613424938', 10, '2cd793e8-f5ef-35e9-ae47-a2a58a0264ec', '2019-05-09', '1631.10', '20945274', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:17', '2019-06-05 07:32:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(1248, NULL, '1456616083', 10, 'adbda4fe-dcbe-3648-b026-8a45ac73feed', '2019-05-31', '2353.49', '17579623', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:18', '2019-06-05 07:32:14', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1249, NULL, '397430950', 10, '8412a9bc-6759-3972-a130-b0e13a19fc4f', '2019-02-27', '978.70', '23204852', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:18', '2019-06-05 07:32:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1250, NULL, '1446409385', 10, 'ee86e09f-6d32-3199-8a9f-c52a85bdb207', '2019-02-02', '811.32', '34345390', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:18', '2019-06-05 07:32:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1251, NULL, '1432129130', 10, 'd20da18a-2e6d-3035-9fbe-bdfbbb7e9e51', '2018-11-25', '1914.05', '36652877', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:18', '2019-06-05 07:32:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1252, NULL, '1069889307', 10, '194c7f67-72df-391f-a6f2-780c3ec62791', '2019-05-19', '1873.73', '11954725', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:19', '2019-06-05 07:32:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1253, NULL, '1179440416', 10, '6c994517-b68b-32fc-8b13-16d27f8d9dfa', '2018-06-15', '440.67', '16680093', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:19', '2019-06-05 07:29:00', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1254, NULL, '242442202', 10, '85941161-165d-39b6-b34b-c57939f0c526', '2018-06-23', '819.53', '17679023', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:19', '2019-06-05 07:28:41', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1255, NULL, '968580610', 10, 'bc504f2c-d6e9-32cc-aabc-02f8d8a01d84', '2019-01-19', '2312.44', '42295816', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:19', '2019-06-05 07:32:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1256, NULL, '805637361', 10, 'b411a6c1-7236-3cda-8b39-1fd6cab1f19d', '2018-08-08', '2241.43', '10752281', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:20', '2019-06-05 07:32:15', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1257, NULL, '1376978438', 10, 'aef6092b-e042-3499-935e-133207248697', '2019-05-19', '2585.39', '23785632', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:20', '2019-06-05 07:32:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1258, NULL, '224027557', 10, '64551440-a8fd-3d9c-aa2c-d40adc71d63f', '2019-01-18', '2719.33', '21001546', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:20', '2019-06-05 07:32:15', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1259, NULL, '1559343876', 10, '6346ac74-0a7f-3803-819b-5563727119c1', '2018-08-15', '305.66', '34308051', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:20', '2019-06-05 07:28:31', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1260, NULL, '928525652', 10, '069fd7ae-c9e3-3194-a39b-85987d21de7b', '2018-07-12', '2883.71', '10857345', 6, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:20', '2019-06-05 07:29:49', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1261, NULL, '296497213', 10, 'da8a23f3-5b11-3a43-956b-b43c8f74f772', '2019-03-12', '2967.36', '48544493', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:21', '2019-06-05 07:32:16', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1262, NULL, '1538119867', 10, 'dddab0c1-7988-3f31-9c1d-c55d8e39dda6', '2018-07-12', '1254.82', '16756406', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:21', '2019-06-05 07:28:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1263, NULL, '1501314372', 10, '20499af4-cd78-3d3f-890d-d8ac802e9d14', '2019-02-24', '2208.97', '13625093', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:21', '2019-06-05 07:32:16', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1264, NULL, '550173683', 11, 'ab1c685c-5f33-3026-b3c3-3bc95af4e24f', '2019-02-21', '330.81', '1132367', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:21', '2019-06-05 07:28:30', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1265, NULL, '1529830742', 11, 'ba626011-b88d-3956-9f01-4528cc384e03', '2018-12-09', '1630.64', '32333785', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:21', '2019-06-05 07:32:16', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1266, NULL, '391373677', 11, '596398a0-e536-3f55-b8d3-a34816ca31d9', '2019-03-07', '1223.44', '14313142', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:22', '2019-06-05 07:32:16', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1267, NULL, '543727940', 11, '9c29f9a2-8b04-3534-a4f5-65ed805afeea', '2018-10-18', '496.89', '23994203', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:22', '2019-06-05 07:32:16', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1268, NULL, '1535741727', 11, 'b722820b-e558-30c1-a29d-20c74ffa8680', '2018-11-25', '840.63', '42930923', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:22', '2019-06-05 07:32:16', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1269, NULL, '808988888', 12, 'b85b1243-b6e9-38db-a852-abc023377124', '2019-02-06', '566.88', '30400024', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:23', '2019-06-05 07:32:16', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1270, NULL, '219196689', 12, '5335f8dd-6747-3409-95c3-067f51001e96', '2018-11-03', '1311.28', '2431162', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:23', '2019-06-05 07:32:16', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1271, NULL, '1112167362', 13, '990f7653-e586-3a4f-b435-1ba9f4c75d9c', '2019-04-21', '562.73', '23128287', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:23', '2019-06-05 07:32:17', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1272, NULL, '934614851', 13, 'ae716a1b-46ea-30e7-bba5-1b3d1c6469bc', '2018-09-10', '543.56', '19759928', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:23', '2019-06-05 07:32:17', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1273, NULL, '914394838', 13, '2334f3ea-2caa-393a-a036-121161e62d5c', '2019-02-21', '1033.84', '12205455', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:23', '2019-06-05 07:32:17', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1274, NULL, '138238681', 13, '639206b3-d8e9-3554-825e-bc0f30443ba7', '2018-07-23', '1734.11', '14191613', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:24', '2019-06-05 07:32:17', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1275, NULL, '1395606837', 13, 'e6458365-c9f1-3d07-8ed5-1b96d92f23a3', '2019-04-19', '544.60', '16366295', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:24', '2019-06-05 07:32:17', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1276, NULL, '78078877', 13, '94b9ab2d-8d57-3014-ac82-a001e2184204', '2018-06-29', '1151.28', '37184671', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:24', '2019-06-05 07:32:18', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1277, NULL, '268275914', 13, '2711d75e-e8aa-3326-aa8a-f491b0a6d9bc', '2019-03-25', '922.63', '36730171', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:24', '2019-06-05 07:28:25', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1278, NULL, '258826366', 13, '929694bd-2221-37b1-88fd-3d4075b829db', '2019-01-25', '1717.35', '23395651', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:25', '2019-06-05 07:32:18', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1279, NULL, '1222133643', 13, 'c84221e4-7b0d-304c-a9b5-8d32bd2e6ec0', '2018-07-01', '855.10', '17272506', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:25', '2019-06-05 07:28:18', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1280, NULL, '1400029555', 13, '2fbb3ec5-c92f-38ff-80d5-87c9a9c4830e', '2019-06-02', '2083.47', '10655611', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:25', '2019-06-05 07:32:19', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1281, NULL, '912093238', 13, 'a53999f1-32a0-3a14-a499-1bade57c958b', '2018-11-26', '962.87', '4836427', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:25', '2019-06-05 07:32:19', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1282, NULL, '1353758604', 13, '8471896c-e9b6-3581-bddb-a95e1c5fc505', '2018-09-20', '342.28', '10008283', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:25', '2019-06-05 07:32:19', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1283, NULL, '1127581234', 14, '87e66d57-b67d-37f4-b93b-3574b8807e74', '2019-01-06', '2987.67', '31508964', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:26', '2019-06-05 07:32:19', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1284, NULL, '175967663', 14, 'ad7b214e-b7ac-3ee0-a23f-406c87b8359b', '2019-04-05', '2431.92', '45215976', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:26', '2019-06-05 07:32:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1285, NULL, '447013685', 14, '8228f818-5342-3951-97c3-53ece2d4da1f', '2018-07-21', '2952.16', '38914334', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:26', '2019-06-05 07:28:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1286, NULL, '361436110', 14, 'cbd1ef41-4d9e-38cf-9d7a-0d0a48b9afe0', '2018-11-16', '401.19', '42437595', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:26', '2019-06-05 07:32:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1287, NULL, '219824338', 15, 'dc8d0022-366a-3444-873e-f389b7afccc8', '2019-04-12', '2401.28', '40476749', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:27', '2019-06-05 07:32:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(1288, NULL, '104702691', 15, '14913fb3-5107-32c6-83e9-5183c8eff847', '2018-09-13', '1842.37', '31026596', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:27', '2019-06-05 07:32:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1289, NULL, '733043526', 15, '1d706350-51a6-3a87-a8db-c3528cbd6b1a', '2018-10-17', '2813.87', '17166564', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:27', '2019-06-05 07:32:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1290, NULL, '880725236', 15, '865428c1-b4fd-3968-ab81-8504f47e33bb', '2018-07-23', '1189.35', '11230365', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:27', '2019-06-05 07:32:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1291, NULL, '456626036', 15, 'd714f200-d82f-3212-828d-23a20e952f5e', '2018-09-16', '650.21', '43154197', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:27', '2019-06-05 07:28:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1292, NULL, '310050214', 15, 'f40c840a-ea38-36be-83f5-ba14f15d427a', '2018-12-04', '899.55', '34525945', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:28', '2019-06-05 07:32:20', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1293, NULL, '226376636', 15, '676a1c3f-5eee-34a9-9609-dfa6b459562c', '2019-04-08', '1974.87', '22991982', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:28', '2019-06-05 07:32:20', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1294, NULL, '211258245', 15, '2242f821-92c9-3392-b470-5a53657b5d4f', '2019-02-05', '2710.11', '35136789', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:28', '2019-06-05 07:28:37', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1295, NULL, '802630090', 15, '3fa5109d-5254-3f79-9ca9-185064991333', '2018-08-10', '1613.47', '32172366', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:28', '2019-06-05 07:28:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1296, NULL, '1457595284', 15, '79505894-e545-3c0d-a751-e8cefdc02d6b', '2018-06-20', '2243.34', '33742077', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:29', '2019-06-05 07:32:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1297, NULL, '1144938486', 15, '330b76fc-8647-317f-96ba-de9ad3eb0daa', '2018-07-05', '2488.56', '33709195', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:29', '2019-06-05 07:32:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1298, NULL, '514147310', 15, '33acf743-7689-399b-b747-3fe8fa619979', '2018-09-07', '2043.69', '38906713', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:29', '2019-06-05 07:29:45', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1299, NULL, '69498646', 15, 'e9cc4c8b-60b4-3ae3-aebd-b902f0c1897f', '2018-12-30', '1145.77', '37543839', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:29', '2019-06-05 07:29:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1300, NULL, '741778210', 15, 'fe97847b-67af-38dd-886f-819cdbabcfb8', '2018-10-01', '2689.10', '26537239', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:30', '2019-06-05 07:32:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1301, NULL, '1428452540', 15, '6ff9fea8-439e-3a4b-b9a5-7b82b735990a', '2019-05-07', '2386.75', '16344809', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:30', '2019-06-05 07:32:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1302, NULL, '360440872', 15, '2468781c-97ca-3bc5-aa2c-54bd6db52838', '2018-11-11', '2407.76', '37096461', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:30', '2019-06-05 07:32:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1303, NULL, '391348138', 15, 'c0146124-416c-37b4-946b-bb006151fb24', '2019-02-02', '945.73', '26265685', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:30', '2019-06-05 07:32:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1304, NULL, '1148141211', 15, 'ccab7c05-e5b8-374d-b2f6-3d3f16591d80', '2018-08-17', '908.36', '47277798', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:31', '2019-06-05 07:32:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1305, NULL, '1172033797', 15, 'ea72fbe6-996b-3e8d-9ad1-321eb6b5a512', '2018-10-03', '859.67', '20356013', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:31', '2019-06-05 07:32:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1306, NULL, '305063054', 15, '78006494-eac8-338f-aa7d-decd509f7644', '2018-06-05', '1459.77', '27521561', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:31', '2019-06-05 07:32:21', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1307, NULL, '661138861', 15, 'f59c0a11-7b48-352d-9487-29391d17f82f', '2019-04-12', '884.34', '36586093', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:31', '2019-06-05 07:32:21', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1308, NULL, '139606197', 15, '7aa15794-1262-3394-b8d7-2401f80e336a', '2018-12-20', '717.95', '22473323', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:32', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1309, NULL, '1317538397', 15, 'e0831b81-df6a-3ed2-b8d7-5e4d373eb9e5', '2019-03-26', '1319.55', '46340890', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:32', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1310, NULL, '1405535361', 15, '610f91d0-5a96-3330-a42a-9dc7e0a5ca21', '2019-04-01', '1924.63', '28308404', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:32', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1311, NULL, '1410406203', 15, '12064618-5085-3614-a63a-fe0b00eed876', '2018-07-01', '957.19', '8479854', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:32', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1312, NULL, '1037457011', 15, '183eac96-fe5f-39a3-bc52-c5ad17ff9038', '2018-07-12', '2830.65', '13840373', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:33', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1313, NULL, '676952814', 15, 'b241be3a-b54e-383d-ad87-6be95351ea6f', '2018-08-20', '1844.62', '47713752', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:33', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1314, NULL, '482175148', 16, 'c3a56272-2ffe-33d0-9c83-529f6442ddec', '2019-05-31', '2057.03', '46172895', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:34', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1315, NULL, '440372547', 16, '73e16dc9-c869-3827-9bc0-e88dcd950aad', '2018-07-28', '478.26', '49928862', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:34', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1316, NULL, '878468119', 16, '52f916b3-5f16-310c-be38-7e3cdc2b51ed', '2018-07-17', '2348.61', '47380783', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:34', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1317, NULL, '704297187', 16, 'f8097261-942f-3afe-95ce-fea369c72cbb', '2018-09-13', '934.30', '32395254', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:34', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1318, NULL, '1499043556', 16, 'd7f1c580-ff94-3f92-b7ee-d37a156037fa', '2018-11-07', '576.35', '4271978', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:35', '2019-06-05 07:28:42', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1319, NULL, '944762540', 16, '8c629571-9c7d-3967-a038-29fc97f633c2', '2018-10-18', '2483.17', '8452495', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:35', '2019-06-05 07:32:22', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1320, NULL, '979698905', 16, '53a2d2c9-1f98-3b52-b7ed-b280069b1c99', '2018-09-20', '1507.19', '14356833', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:36', '2019-06-05 07:28:12', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1321, NULL, '1298849760', 16, 'bdb01d01-5e12-3a4a-aa3a-b6a339d3abb4', '2019-01-05', '2704.62', '2689467', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:36', '2019-06-05 07:32:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1322, NULL, '415832202', 16, '3e75a73e-9019-37a9-af17-828887c31893', '2018-08-04', '649.78', '5998491', 7, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:36', '2019-06-05 07:29:40', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1323, NULL, '995242751', 16, 'f2cff777-378b-3e4d-a1db-3dc31979b25d', '2018-11-06', '2025.77', '5943984', 1, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:36', '2019-06-05 07:32:33', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 3, 0, 0, 0, NULL),
(1324, NULL, '1395581710', 16, 'c82c3c5a-1307-3b31-ad0f-62ba4ff91cd5', '2018-09-10', '1087.97', '36369201', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:36', '2019-06-05 07:29:33', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1325, NULL, '1098029420', 16, '027a25a0-f6a5-3991-931e-07191b634621', '2019-05-11', '1278.88', '14533801', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:36', '2019-06-05 07:27:59', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1326, NULL, '460560391', 16, 'e74578e6-0894-338a-9fc8-82faf17639d2', '2018-11-05', '2470.09', '6715006', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:37', '2019-06-05 07:32:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1327, NULL, '1452114494', 16, 'ec2f1658-c1b5-337c-b43c-27e414a67416', '2018-09-10', '2926.27', '22462458', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:37', '2019-06-05 07:32:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1328, NULL, '95296299', 16, 'e74c20a7-a0a5-39fc-be7b-57c8636b9e4e', '2019-02-16', '402.60', '28607715', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:37', '2019-06-05 07:32:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1329, NULL, '667227627', 16, '7942d789-fa08-35e6-abfe-56fc09a7b1d4', '2018-08-11', '1709.88', '30863933', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:37', '2019-06-05 07:32:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1330, NULL, '1031605186', 16, '4597f323-357a-3160-996d-fb0b1cc1fc99', '2018-09-11', '455.74', '34032634', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:37', '2019-06-05 07:32:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1331, NULL, '122986383', 16, 'c77a1260-c85a-370e-be20-00ced1c86a1e', '2019-04-14', '1804.29', '47045214', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:37', '2019-06-05 07:32:44', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1332, NULL, '1510631104', 16, 'd19251b5-bbc7-322e-9493-4145b7345815', '2019-03-06', '1971.84', '11068921', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:37', '2019-06-05 07:28:56', 1, NULL, 1, 0, NULL, NULL, 1, 0, 8, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1333, NULL, '563342384', 16, '4e28c4a3-b1fa-316f-9d40-2a3c3d231edd', '2019-05-30', '1710.19', '42648247', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:38', '2019-06-05 07:32:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1334, NULL, '735238779', 16, 'e233e137-ccf4-33ff-aaac-0c57f0c73c09', '2018-07-21', '2336.82', '16203175', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:38', '2019-06-05 07:32:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, NULL),
(1335, NULL, '1458061586', 16, '94b5dcbe-9937-3980-89a6-64c794408a4a', '2018-12-24', '1821.14', '26669556', 7, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:38', '2019-06-05 07:29:51', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1336, NULL, '856120193', 16, 'a01fe712-d691-334a-b073-2d49192a8c66', '2019-02-16', '1336.64', '17257603', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:38', '2019-06-05 07:32:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1337, NULL, '1071505940', 16, '134501f2-48aa-37db-bce2-c72b9dfa0bb5', '2018-06-25', '2569.41', '12962910', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:38', '2019-06-05 07:32:23', 1, NULL, 1, 0, NULL, NULL, 1, 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1338, NULL, '929672922', 16, '2afc0e6f-9f0c-3d5a-8554-06d31ccc67de', '2018-11-26', '2165.32', '25420096', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:39', '2019-06-05 07:32:23', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1339, NULL, '1333349973', 16, 'e51ca532-2299-363c-a5bb-6ace633d29dc', '2019-02-19', '2314.71', '34853855', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:39', '2019-06-05 07:28:10', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1340, NULL, '906494705', 16, 'e75ad602-13b5-3ecf-93bd-3b9a9445b9f6', '2018-11-08', '1814.57', '32082333', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:39', '2019-06-05 07:28:30', 1, NULL, 1, 0, NULL, NULL, 1, 0, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1341, NULL, '345750658', 16, '00c96430-8061-3b1d-8c13-851f168d801d', '2019-03-06', '764.70', '3961174', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:39', '2019-06-05 07:32:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1342, NULL, '327005834', 16, '783df67b-5fbe-3d30-a0bb-495713119e8c', '2018-09-29', '1095.90', '29968002', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:39', '2019-06-05 07:32:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1343, NULL, '811127452', 16, '0cd9179e-e021-3604-821d-8f2d3fdb144a', '2018-10-25', '961.85', '11748963', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:39', '2019-06-05 07:32:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1344, NULL, '990920790', 16, 'ea5915bd-bbc7-38b3-b5fe-4d6b8364c421', '2019-05-24', '373.89', '11845266', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:40', '2019-06-05 07:32:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1345, NULL, '403121143', 16, '7add4e92-d0ba-3e90-aba8-4edc692d64ca', '2019-03-17', '2505.92', '14674110', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:40', '2019-06-05 07:32:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1346, NULL, '630718431', 16, '7d98d521-6357-33f6-9fe7-5351e7066d3d', '2018-09-20', '1126.31', '18734229', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:40', '2019-06-05 07:32:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1347, NULL, '1388140792', 16, 'cc88235a-09a4-3d00-9748-90ec868e6080', '2019-02-21', '776.90', '49220054', 4, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:41', '2019-06-05 07:29:34', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1348, NULL, '222015241', 16, '245cfd05-fa92-3299-a6c8-4bf2be20295c', '2019-04-14', '2172.52', '37211158', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:42', '2019-06-05 07:32:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1349, NULL, '858516856', 16, '3fa6135b-af4e-3038-b120-d90d9b7d45a6', '2018-08-25', '812.96', '41544570', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:42', '2019-06-05 07:29:04', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1350, NULL, '715329607', 16, '1e0f5ac7-0556-394d-a717-6a78ae7f09ca', '2018-06-10', '1944.77', '7768006', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:42', '2019-06-05 07:28:15', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1351, NULL, '679121013', 16, '71cef847-4a3a-36f0-91a5-5e7947fcad6f', '2019-02-09', '1358.59', '8340727', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:43', '2019-06-05 07:32:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1352, NULL, '209517824', 16, 'edda8db9-c2e2-361f-a25c-e2f233181c4e', '2018-09-11', '1218.23', '25626738', 3, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:43', '2019-06-05 07:29:48', 1, NULL, 1, 0, NULL, NULL, 1, 0, 1, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1353, NULL, '571627893', 16, 'be51b30e-3780-32d3-bdba-9ce891979a4a', '2018-09-06', '714.57', '37588684', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:43', '2019-06-05 07:32:24', 1, NULL, 1, 0, NULL, NULL, 1, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1354, NULL, '1329163443', 17, 'a962d76a-07a4-3680-b279-aef9e8cf89dd', '2018-08-31', '1031.54', '2267317', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:43', '2019-06-05 07:32:24', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1355, NULL, '884104839', 17, '77961055-5309-304f-ab36-90f37790eb11', '2019-03-27', '2898.17', '38567942', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:43', '2019-06-05 07:32:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 0, 0, NULL),
(1356, NULL, '1281509227', 17, '21110bbc-f54b-3930-a5d7-e38ee9584fe2', '2018-10-17', '2567.06', '37647232', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:43', '2019-06-05 07:32:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 0, NULL),
(1357, NULL, '1549838983', 17, 'b4e94e5d-9059-3440-976a-5024c7bd608a', '2019-05-10', '2139.60', '49733027', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:44', '2019-06-05 07:32:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, NULL),
(1358, NULL, '675898392', 17, '2c282432-8783-3bee-930a-a5eaa4fa3c9d', '2019-01-29', '807.99', '44233873', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:44', '2019-06-05 07:32:25', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 0, 0, NULL),
(1359, NULL, '1161784690', 17, '5738560f-c0f0-35a6-9df0-76362e9b5f29', '2019-05-01', '2697.25', '23851840', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:44', '2019-06-05 07:32:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1360, NULL, '1334190551', 17, '632a0f14-606a-369b-9374-18892a9dbd3b', '2018-11-23', '848.18', '1175095', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:44', '2019-06-05 07:32:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1361, NULL, '703831674', 17, '20f3f650-cd34-3a03-9a48-074cba612ceb', '2019-04-29', '1723.46', '36844586', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:45', '2019-06-05 07:32:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL);
INSERT INTO `assets` (`id`, `name`, `asset_tag`, `model_id`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `assigned_to`, `notes`, `image`, `user_id`, `created_at`, `updated_at`, `physical`, `deleted_at`, `status_id`, `archived`, `warranty_months`, `depreciate`, `supplier_id`, `requestable`, `rtd_location_id`, `accepted`, `last_checkout`, `expected_checkin`, `company_id`, `assigned_type`, `last_audit_date`, `next_audit_date`, `location_id`, `checkin_counter`, `checkout_counter`, `requests_counter`, `_snipeit_rating_5`) VALUES
(1362, NULL, '1166593627', 17, 'a050cef1-5ce1-3b28-b6cd-cae4a221ee55', '2019-05-03', '492.29', '34932432', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:45', '2019-06-05 07:32:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1363, NULL, '1476941925', 17, '5c06307d-edc6-31d0-a10d-7dd34adc7df8', '2019-02-01', '1485.80', '42237798', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:45', '2019-06-05 07:29:39', 1, NULL, 1, 0, NULL, NULL, 1, 1, 5, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1364, NULL, '363054755', 18, '84316208-aa95-300b-aaf3-ba0f5aa97ba9', '2019-01-18', '1071.98', '49203465', 10, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:45', '2019-06-05 07:29:46', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, 'App\\Models\\Location', NULL, NULL, NULL, 0, 0, 0, NULL),
(1365, NULL, '196691463', 18, '72f1b969-593f-3a58-9374-4948e64ec007', '2019-01-27', '2685.27', '1837195', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:45', '2019-06-05 07:28:40', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1366, NULL, '1042718130', 18, 'ebfe9181-1de5-3665-affa-c36cba755ee6', '2018-08-24', '2118.49', '1716394', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:46', '2019-06-05 07:32:26', 1, NULL, 1, 0, NULL, NULL, 1, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1367, NULL, '270828180', 18, '9fb153fb-3d11-388c-8c56-8fbe3e051b6d', '2019-04-13', '394.92', '42749326', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:46', '2019-06-05 07:32:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, NULL),
(1368, NULL, '1386620250', 18, '0dc7a2ad-b18a-3795-9736-04f4bc3cf1fb', '2018-10-15', '2532.15', '7519973', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:46', '2019-06-05 07:32:26', 1, NULL, 1, 0, NULL, NULL, 1, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, 0, 0, NULL),
(1369, NULL, '1006023632', 18, 'a58f95b5-9459-3226-98e5-4e80cf31b679', '2019-01-22', '1500.01', '48379985', 5, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:46', '2019-06-05 07:28:54', 1, NULL, 1, 0, NULL, NULL, 1, 1, 4, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, NULL, 0, 0, 0, NULL),
(1370, NULL, '908760410', 18, '5629ded7-9f29-31e7-91b2-3ee9df4f0672', '2018-09-22', '1794.57', '43660825', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:47', '2019-06-05 07:32:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, 0, 0, NULL),
(1371, NULL, '842123992', 18, '54a28529-aff2-3e97-a3e2-6cac6fbf2cbb', '2018-08-30', '1930.65', '23724443', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:47', '2019-06-05 07:32:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, NULL),
(1372, NULL, '1121142958', 18, 'be009b1a-e834-3c5a-a139-aba3e3fd393c', '2019-01-17', '917.77', '36627286', NULL, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:47', '2019-06-05 07:32:27', 1, NULL, 1, 0, NULL, NULL, 1, 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, NULL),
(1373, NULL, '626269146', 18, '26c63db6-52e4-36fb-b094-59033b1659db', '2018-12-23', '1980.53', '20509180', 2, 'Created by DB seeder', NULL, 1, '2019-06-05 07:27:47', '2019-06-05 07:32:44', 1, NULL, 1, 0, NULL, NULL, 1, 0, 5, NULL, NULL, NULL, NULL, 'App\\Models\\User', NULL, NULL, 2, 0, 0, 0, NULL),
(1374, NULL, '123456789', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2019-06-05 08:23:17', '2019-06-05 08:24:18', 1, NULL, 1, 0, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 0, 0, 0, '⭐⭐⭐');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `asset_logs`
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
-- Cấu trúc bảng cho bảng `asset_maintenances`
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `asset_uploads`
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
-- Cấu trúc bảng cho bảng `categories`
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
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `user_id`, `deleted_at`, `eula_text`, `use_default_eula`, `require_acceptance`, `category_type`, `checkin_email`, `image`) VALUES
(1, 'Laptops', '2019-06-05 07:22:59', '2019-06-05 07:22:59', 1, NULL, 'Voluptatum ut odit consectetur placeat aut. Provident distinctio occaecati dolorum vitae temporibus eligendi asperiores ducimus. Quam tempore alias sed dicta at eius dolorem. Error in sint dolores.', 0, 1, 'asset', 1, NULL),
(2, 'Desktops', '2019-06-05 07:22:59', '2019-06-05 07:22:59', 1, NULL, 'Corporis non amet ratione sit omnis deleniti perferendis. Sequi nisi sit maiores saepe enim. Ea quis necessitatibus et sit accusamus.', 1, 0, 'asset', 1, NULL),
(3, 'Tablets', '2019-06-05 07:22:59', '2019-06-05 07:22:59', 1, NULL, 'Odit delectus sit et officia. Minima neque reprehenderit consequuntur iusto nisi.', 0, 0, 'asset', 0, NULL),
(4, 'Mobile Phones', '2019-06-05 07:22:59', '2019-06-05 07:22:59', 1, NULL, 'Voluptate sequi sapiente ut doloribus. Sed et omnis eius dolorum delectus. Sed necessitatibus totam iste libero fugit. Itaque vero tenetur enim sed earum alias.', 0, 0, 'asset', 0, NULL),
(5, 'Displays', '2019-06-05 07:22:59', '2019-06-05 07:22:59', 1, NULL, 'Dolorum doloribus in dolorem laborum alias incidunt. Temporibus cumque esse sunt. Suscipit veniam earum ea ullam voluptate nobis.', 1, 0, 'asset', 1, NULL),
(6, 'VOIP Phones', '2019-06-05 07:22:59', '2019-06-05 07:22:59', 1, NULL, 'Est asperiores voluptatem quia officiis. Veritatis saepe non ullam eos ea perferendis.', 0, 0, 'asset', 1, NULL),
(7, 'Conference Phones', '2019-06-05 07:23:00', '2019-06-05 07:23:00', 1, NULL, 'Optio doloremque mollitia illum ut eveniet quis saepe. Earum aut et minima consequatur nesciunt amet id. Tempora explicabo perferendis voluptatem est.', 1, 0, 'asset', 1, NULL),
(8, 'Keyboards', '2019-06-05 07:23:00', '2019-06-05 07:23:00', 1, NULL, 'Similique autem sequi incidunt nostrum et cupiditate. Veritatis iste voluptates fugiat quia totam.', 1, 0, 'accessory', 1, NULL),
(9, 'Mouse', '2019-06-05 07:23:00', '2019-06-05 07:23:00', 1, NULL, 'Quaerat doloribus est sit voluptatum. Aut labore doloremque consequatur sunt sint dicta. A et expedita omnis. Ex est harum porro enim.', 0, 0, 'accessory', 0, NULL),
(10, 'Printer Paper', '2019-06-05 07:23:00', '2019-06-05 07:23:00', 1, NULL, 'Voluptas recusandae est qui eveniet eos non. Recusandae suscipit blanditiis nemo. Hic quia odit quia voluptatem odit.', 1, 0, 'consumable', 0, NULL),
(11, 'Printer Ink', '2019-06-05 07:23:00', '2019-06-05 07:23:00', 1, NULL, 'Dolores nesciunt neque deleniti labore. Maxime architecto sequi vero aliquam ipsa sed. Qui adipisci voluptates vero quo dolor velit dolore.', 0, 0, 'consumable', 0, NULL),
(12, 'HDD/SSD', '2019-06-05 07:23:00', '2019-06-05 07:23:00', 1, NULL, 'Aut voluptas eius mollitia veniam rerum totam sequi. Voluptatem facilis soluta in corrupti eius possimus quo. Quis ut blanditiis est debitis et odit rerum. Facilis deleniti libero velit corporis excepturi dolorum neque necessitatibus.', 1, 0, 'component', 1, NULL),
(13, 'RAM', '2019-06-05 07:23:00', '2019-06-05 07:23:00', 1, NULL, 'Temporibus fuga accusantium et assumenda nesciunt qui non. Error dolor dolorem rerum. Qui tempora accusantium occaecati placeat odit.', 0, 0, 'component', 0, NULL),
(14, 'Graphics Software', '2019-06-05 07:23:00', '2019-06-05 07:23:00', 1, NULL, 'Id est est voluptates mollitia cum quia nulla. Minima ab quam ducimus nemo architecto molestiae. Quo vel minus inventore qui voluptatem dolorum labore perspiciatis.', 0, 0, 'license', 1, NULL),
(15, 'Office Software', '2019-06-05 07:23:00', '2019-06-05 07:23:00', 1, NULL, 'Et qui aliquid laborum veniam. Alias ipsa minima ratione omnis. Ipsa iure quis nesciunt voluptas voluptates aut expedita.', 1, 0, 'license', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `checkout_requests`
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `companies`
--

INSERT INTO `companies` (`id`, `name`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Pacocha, Fahey and Kirlin', '2019-06-05 07:22:59', '2019-06-05 07:22:59', NULL),
(2, 'Metz Group', '2019-06-05 07:22:59', '2019-06-05 07:22:59', NULL),
(3, 'Marks, Dickinson and Kshlerin', '2019-06-05 07:22:59', '2019-06-05 07:22:59', NULL),
(4, 'Fadel-Strosin', '2019-06-05 07:22:59', '2019-06-05 07:22:59', NULL),
(5, 'Little, Metz and Metz', '2019-06-05 07:27:53', '2019-06-05 07:27:53', NULL),
(6, 'Howe, Goldner and Leffler', '2019-06-05 07:27:53', '2019-06-05 07:27:53', NULL),
(7, 'Hagenes, Bartoletti and Batz', '2019-06-05 07:27:54', '2019-06-05 07:27:54', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `components`
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
-- Đang đổ dữ liệu cho bảng `components`
--

INSERT INTO `components` (`id`, `name`, `category_id`, `location_id`, `company_id`, `user_id`, `qty`, `order_number`, `purchase_date`, `purchase_cost`, `created_at`, `updated_at`, `deleted_at`, `min_amt`, `serial`, `image`) VALUES
(1, 'Crucial 4GB DDR3L-1600 SODIMM', 13, 3, 2, NULL, 10, '15956643', '1994-04-30', '125716.73', '2019-06-05 07:27:52', '2019-06-05 07:27:52', NULL, 2, '981104f7-72aa-3cc8-a35f-94bddb08c240', NULL),
(2, 'Crucial 8GB DDR3L-1600 SODIMM Memory for Mac', 13, 1, 5, NULL, 10, '4175968', '2010-04-10', '53224.38', '2019-06-05 07:27:53', '2019-06-05 07:27:53', NULL, 2, '2f3998a8-063d-327c-ac0d-2568efea58b9', NULL),
(3, 'Crucial BX300 120GB SATA Internal SSD', 12, 1, 6, NULL, 10, '45686866', '1982-09-22', '33.38', '2019-06-05 07:27:53', '2019-06-05 07:27:53', NULL, 2, '1b027654-00c4-3feb-ab74-912776840af2', NULL),
(4, 'Crucial BX300 240GB SATA Internal SSD', 12, 1, 7, NULL, 10, '8088805', '2015-09-17', '104137.49', '2019-06-05 07:27:54', '2019-06-05 07:27:54', NULL, 2, '2258297c-0f72-3e1d-9eaa-d05f4172fcfa', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `components_assets`
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
-- Cấu trúc bảng cho bảng `consumables`
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
-- Đang đổ dữ liệu cho bảng `consumables`
--

INSERT INTO `consumables` (`id`, `name`, `category_id`, `location_id`, `user_id`, `qty`, `requestable`, `created_at`, `updated_at`, `deleted_at`, `purchase_date`, `purchase_cost`, `order_number`, `company_id`, `min_amt`, `model_number`, `manufacturer_id`, `item_no`, `image`) VALUES
(1, 'Cardstock (White)', 10, NULL, 1, 10, 0, '2019-06-05 07:27:55', '2019-06-05 07:27:55', NULL, '2019-04-22', '49.36', '16075445', 3, 2, NULL, 10, '7760654', NULL),
(2, 'Laserjet Paper (Ream)', 10, NULL, 1, 20, 0, '2019-06-05 07:27:55', '2019-06-05 07:27:55', NULL, '2019-02-10', '23.61', '31456351', NULL, 2, NULL, 10, '35184116', NULL),
(3, 'Laserjet Toner (black)', 11, NULL, 1, 20, 0, '2019-06-05 07:27:55', '2019-06-05 07:27:55', NULL, '2018-08-07', '23.57', '24755356', NULL, 2, NULL, 5, '43937184', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `consumables_users`
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
-- Cấu trúc bảng cho bảng `custom_fields`
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
-- Đang đổ dữ liệu cho bảng `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `name`, `format`, `element`, `created_at`, `updated_at`, `user_id`, `field_values`, `field_encrypted`, `db_column`, `help_text`, `show_in_email`) VALUES
(5, 'Rating', '', 'listbox', '2019-06-05 08:20:32', '2019-06-05 08:20:32', NULL, '&#11088;\r\n&#11088;&#11088;\r\n&#11088;&#11088;&#11088;\r\n&#11088;&#11088;&#11088;&#11088;', 0, '_snipeit_rating_5', 'Rating for this asset', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `custom_fieldsets`
--

CREATE TABLE `custom_fieldsets` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `custom_fieldsets`
--

INSERT INTO `custom_fieldsets` (`id`, `name`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Choose star', '2019-06-05 08:20:45', '2019-06-05 08:20:45', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `custom_field_custom_fieldset`
--

CREATE TABLE `custom_field_custom_fieldset` (
  `custom_field_id` int(11) NOT NULL,
  `custom_fieldset_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `custom_field_custom_fieldset`
--

INSERT INTO `custom_field_custom_fieldset` (`custom_field_id`, `custom_fieldset_id`, `order`, `required`) VALUES
(5, 1, 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `departments`
--

INSERT INTO `departments` (`id`, `name`, `user_id`, `company_id`, `location_id`, `manager_id`, `notes`, `created_at`, `updated_at`, `deleted_at`, `image`) VALUES
(1, 'Human Resources', 1, NULL, 1, NULL, NULL, '2019-06-05 07:23:05', '2019-06-05 07:23:05', NULL, NULL),
(2, 'Engineering', 1, NULL, 1, NULL, NULL, '2019-06-05 07:23:05', '2019-06-05 07:23:05', NULL, NULL),
(3, 'Marketing', 1, NULL, 2, NULL, NULL, '2019-06-05 07:23:06', '2019-06-05 07:23:06', NULL, NULL),
(4, 'Client Services', 1, NULL, 5, NULL, NULL, '2019-06-05 07:23:06', '2019-06-05 07:23:06', NULL, NULL),
(5, 'Product Management', 1, NULL, 1, NULL, NULL, '2019-06-05 07:23:06', '2019-06-05 07:23:06', NULL, NULL),
(6, 'Dept of Silly Walks', 1, NULL, 1, NULL, NULL, '2019-06-05 07:23:06', '2019-06-05 07:23:06', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `depreciations`
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
-- Đang đổ dữ liệu cho bảng `depreciations`
--

INSERT INTO `depreciations` (`id`, `name`, `months`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Computer Depreciation', 36, '2019-06-05 07:23:13', '2019-06-05 07:23:13', 1),
(2, 'Display Depreciation', 12, '2019-06-05 07:23:13', '2019-06-05 07:23:13', 1),
(3, 'Mobile Phone Depreciation', 24, '2019-06-05 07:23:13', '2019-06-05 07:23:13', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `imports`
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `licenses`
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
-- Đang đổ dữ liệu cho bảng `licenses`
--

INSERT INTO `licenses` (`id`, `name`, `serial`, `purchase_date`, `purchase_cost`, `order_number`, `seats`, `notes`, `user_id`, `depreciation_id`, `created_at`, `updated_at`, `deleted_at`, `license_name`, `license_email`, `depreciate`, `supplier_id`, `expiration_date`, `purchase_order`, `termination_date`, `maintained`, `reassignable`, `company_id`, `manufacturer_id`, `category_id`) VALUES
(1, 'Photoshop', 'e8ebfea1-098d-3515-9f83-6ed91e489055', '2018-09-17', '299.99', '45015140', 10, 'Created by DB seeder', 1, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, 'Sage Zboncak', 'cara87@example.com', NULL, 5, '2020-04-07', '13503Q', '2019-03-09', 1, 1, NULL, 9, 14),
(2, 'Acrobat', '72f22041-6e30-376d-8fe1-4ec454bbed3b', '2019-04-10', '29.99', '34002889', 10, 'Created by DB seeder', 1, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, 'Santa Armstrong', 'brice83@example.com', NULL, 5, '2021-12-22', NULL, '2019-05-14', NULL, 0, NULL, 9, 14),
(3, 'InDesign', 'a728db90-0579-3045-a942-99cd597d0fea', '2018-12-27', '199.99', '43348846', 10, 'Created by DB seeder', 1, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, 'Domingo Walker', 'marietta.klein@example.org', NULL, 1, '2020-01-26', NULL, '2018-08-26', NULL, 0, NULL, 9, 14),
(4, 'Office', 'f69dd549-fbf9-3fc3-bddd-e0c2e6cbd63e', '2019-05-06', '49.99', '42100255', 20, 'Created by DB seeder', 1, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, 'Irma Jast MD', 'alyson.jerde@example.net', NULL, 5, '2021-02-01', NULL, '2018-10-18', NULL, 1, NULL, 2, 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `license_seats`
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
-- Đang đổ dữ liệu cho bảng `license_seats`
--

INSERT INTO `license_seats` (`id`, `license_id`, `assigned_to`, `notes`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `asset_id`) VALUES
(1, 1, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(2, 1, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(3, 1, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(4, 1, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(5, 1, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(6, 1, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(7, 1, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(8, 1, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(9, 1, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(10, 1, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(11, 2, NULL, NULL, NULL, '2019-06-05 07:27:49', '2019-06-05 07:27:49', NULL, NULL),
(12, 2, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(13, 2, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(14, 2, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(15, 2, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(16, 2, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(17, 2, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(18, 2, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(19, 2, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(20, 2, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(21, 3, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(22, 3, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(23, 3, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(24, 3, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(25, 3, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(26, 3, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(27, 3, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(28, 3, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(29, 3, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(30, 3, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(31, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(32, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(33, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(34, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(35, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(36, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(37, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(38, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(39, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(40, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(41, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(42, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(43, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(44, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(45, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(46, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(47, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(48, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(49, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL),
(50, 4, NULL, NULL, NULL, '2019-06-05 07:27:50', '2019-06-05 07:27:50', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `locations`
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
-- Đang đổ dữ liệu cho bảng `locations`
--

INSERT INTO `locations` (`id`, `name`, `city`, `state`, `country`, `created_at`, `updated_at`, `user_id`, `address`, `address2`, `zip`, `deleted_at`, `parent_id`, `currency`, `ldap_ou`, `manager_id`, `image`) VALUES
(1, 'Lake Bridgetteport', 'Lake Madisen', 'ME', 'AG', '2019-06-05 07:23:08', '2019-06-05 07:23:08', NULL, '8671 Greenfelder Route', 'Suite 310', '71201-5066', NULL, NULL, 'TTD', NULL, NULL, '3.jpg'),
(2, 'West Jenifer', 'Lindgrenton', 'KY', 'RS', '2019-06-05 07:23:08', '2019-06-05 07:23:08', NULL, '764 Keaton Neck', 'Suite 799', '77406', NULL, NULL, 'ETB', NULL, NULL, '1.jpg'),
(3, 'Imogenetown', 'Reaganberg', 'NE', 'CD', '2019-06-05 07:23:09', '2019-06-05 07:23:09', NULL, '484 Ward Burg', 'Apt. 979', '76243', NULL, NULL, 'TTD', NULL, NULL, '4.jpg'),
(4, 'New Reece', 'Kareemburgh', 'TX', 'AF', '2019-06-05 07:23:09', '2019-06-05 07:23:09', NULL, '82042 Anderson Falls Apt. 377', 'Apt. 338', '00046', NULL, NULL, 'CUP', NULL, NULL, '1.jpg'),
(5, 'New Gaston', 'Janymouth', 'VA', 'BT', '2019-06-05 07:23:09', '2019-06-05 07:23:09', NULL, '1152 Dedrick Springs Suite 918', 'Apt. 270', '65133-6722', NULL, NULL, 'AOA', NULL, NULL, '6.jpg'),
(6, 'Clayland', 'Port Hermannside', 'AL', 'SS', '2019-06-05 07:23:09', '2019-06-05 07:23:09', NULL, '960 Fahey Locks Apt. 252', 'Suite 991', '62843-4968', NULL, NULL, 'SGD', NULL, NULL, '3.jpg'),
(7, 'Frederickborough', 'Waterstown', 'MT', 'TZ', '2019-06-05 07:23:09', '2019-06-05 07:23:09', NULL, '2679 Davis Glens Apt. 891', 'Suite 931', '91180', NULL, NULL, 'OMR', NULL, NULL, '9.jpg'),
(8, 'East Christy', 'Hendersonmouth', 'IA', 'JP', '2019-06-05 07:23:09', '2019-06-05 07:23:09', NULL, '8095 Leora Course', 'Apt. 064', '97425', NULL, NULL, 'KRW', NULL, NULL, '5.jpg'),
(9, 'West Emmetton', 'Eddmouth', 'WV', 'JM', '2019-06-05 07:23:09', '2019-06-05 07:23:09', NULL, '330 Jazmin Neck', 'Apt. 079', '67879-6294', NULL, NULL, 'XAF', NULL, NULL, '2.jpg'),
(10, 'South Devonteberg', 'Port Cathrine', 'CO', 'SB', '2019-06-05 07:23:09', '2019-06-05 07:23:09', NULL, '81963 Chanel Valley', 'Suite 433', '15428', NULL, NULL, 'SGD', NULL, NULL, '9.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login_attempts`
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
-- Đang đổ dữ liệu cho bảng `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `username`, `remote_ip`, `user_agent`, `successful`, `created_at`, `updated_at`) VALUES
(1, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 0, '2019-06-05 07:51:39', NULL),
(2, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', 1, '2019-06-05 07:51:45', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturers`
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
-- Đang đổ dữ liệu cho bảng `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `created_at`, `updated_at`, `user_id`, `deleted_at`, `url`, `support_url`, `support_phone`, `support_email`, `image`) VALUES
(1, 'Apple', '2019-06-05 07:23:06', '2019-06-05 07:23:06', 1, NULL, 'https://apple.com', 'https://support.apple.com', '+1.515.253.0159', 'julianne.gleason@example.net', 'apple.jpg'),
(2, 'Microsoft', '2019-06-05 07:23:06', '2019-06-05 07:23:06', 1, NULL, 'https://microsoft.com', 'https://support.microsoft.com', '(721) 220-2394 x5189', 'chance65@example.net', 'microsoft.png'),
(3, 'Dell', '2019-06-05 07:23:06', '2019-06-05 07:23:06', 1, NULL, 'https://dell.com', 'https://support.dell.com', '879.782.8045 x20274', 'virginie65@example.com', 'dell.png'),
(4, 'Asus', '2019-06-05 07:23:07', '2019-06-05 07:23:07', 1, NULL, 'https://asus.com', 'https://support.asus.com', '(390) 965-4442 x77521', 'vjast@example.org', 'asus.png'),
(5, 'HP', '2019-06-05 07:23:07', '2019-06-05 07:23:07', 1, NULL, 'https://hp.com', 'https://support.hp.com', '441-205-6896', 'dritchie@example.com', 'hp.png'),
(6, 'Lenovo', '2019-06-05 07:23:07', '2019-06-05 07:23:07', 1, NULL, 'https://lenovo.com', 'https://support.lenovo.com', '509.898.5541 x3161', 'jrice@example.net', 'lenovo.jpg'),
(7, 'LG', '2019-06-05 07:23:07', '2019-06-05 07:23:07', 1, NULL, 'https://lg.com', 'https://support.lg.com', '1-567-239-5665 x8851', 'sven75@example.org', 'lg.jpg'),
(8, 'Polycom', '2019-06-05 07:23:07', '2019-06-05 07:23:07', 1, NULL, 'https://polycom.com', 'https://support.polycom.com', '941.322.6530', 'murphy.vida@example.net', 'polycom.png'),
(9, 'Adobe', '2019-06-05 07:23:07', '2019-06-05 07:23:07', 1, NULL, 'https://adobe.com', 'https://support.adobe.com', '+1 (319) 480-7386', 'mann.sammy@example.org', 'adobe.jpg'),
(10, 'Avery', '2019-06-05 07:23:07', '2019-06-05 07:23:07', 1, NULL, 'https://avery.com', 'https://support.avery.com', '625-473-8342 x21410', 'thiel.nona@example.net', 'avery.png'),
(11, 'Crucial', '2019-06-05 07:23:07', '2019-06-05 07:23:07', 1, NULL, 'https://crucial.com', 'https://support.crucial.com', '831-945-1974', 'schroeder.manuela@example.net', 'crucial.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
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
(277, '2019_02_21_224703_make_fields_nullable_for_integrity', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `models`
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
-- Đang đổ dữ liệu cho bảng `models`
--

INSERT INTO `models` (`id`, `name`, `model_number`, `manufacturer_id`, `category_id`, `created_at`, `updated_at`, `depreciation_id`, `user_id`, `eol`, `image`, `deprecated_mac_address`, `deleted_at`, `fieldset_id`, `notes`, `requestable`) VALUES
(1, 'Macbook Pro 13\"', '5540470857965561', 1, 1, '2019-06-05 07:23:10', '2019-06-05 08:21:35', 1, 1, 36, 'mbp.jpg', 0, NULL, 1, 'Created by demo seeder', 0),
(2, 'Macbook Air', '5369984087141932', 1, 1, '2019-06-05 07:23:10', '2019-06-05 08:21:35', 1, 1, 36, 'macbookair.jpg', 0, NULL, 1, 'Created by demo seeder', 0),
(3, 'Surface', '4485747585435995', 2, 1, '2019-06-05 07:23:11', '2019-06-05 08:21:35', 1, 1, 36, 'surface.jpg', 0, NULL, 1, 'Created by demo seeder', 0),
(4, 'XPS 13', '4556190975293050', 3, 1, '2019-06-05 07:23:11', '2019-06-05 08:21:35', 1, 1, 36, 'xps.jpg', 0, NULL, 1, 'Created by demo seeder', 0),
(5, 'Spectre', '5154814426933575', 5, 1, '2019-06-05 07:23:11', '2019-06-05 08:21:35', 1, 1, 36, 'spectre.jpg', 0, NULL, 1, 'Created by demo seeder', 0),
(6, 'ZenBook UX310', '371220866819068', 4, 1, '2019-06-05 07:23:11', '2019-06-05 08:21:35', 1, 1, 36, 'zenbook.jpg', 0, NULL, 1, 'Created by demo seeder', 0),
(7, 'Yoga 910', '4539442949113530', 6, 1, '2019-06-05 07:23:11', '2019-06-05 08:21:35', 1, 1, 36, 'yoga.png', 0, NULL, 1, 'Created by demo seeder', 0),
(8, 'iMac Pro', '4556696234035', 1, 2, '2019-06-05 07:23:11', '2019-06-05 07:23:11', 1, 1, 24, 'imacpro.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(9, 'Lenovo Intel Core i5', '4916352141595', 6, 2, '2019-06-05 07:23:11', '2019-06-05 07:23:11', 1, 1, 24, 'lenovoi5.png', 0, NULL, NULL, 'Created by demo seeder', 0),
(10, 'OptiPlex', '5040 (MRR81)', 3, 2, '2019-06-05 07:23:11', '2019-06-05 07:23:11', 1, 1, 24, 'optiplex.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(11, 'SoundStation 2', '4539561251768993', 8, 6, '2019-06-05 07:23:11', '2019-06-05 07:23:11', 1, 1, 12, 'soundstation.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(12, 'Polycom CX3000 IP Conference Phone', '4716912590573062', 8, 6, '2019-06-05 07:23:12', '2019-06-05 07:23:12', 1, 1, 12, 'cx3000.png', 0, NULL, NULL, 'Created by demo seeder', 0),
(13, 'iPad Pro', '2720665794929450', 1, 3, '2019-06-05 07:23:12', '2019-06-05 07:23:12', 1, 1, 12, 'ipad.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(14, 'Tab3', '5100552159304110', 6, 3, '2019-06-05 07:23:12', '2019-06-05 07:23:12', 1, 1, 12, 'tab3.png', 0, NULL, NULL, 'Created by demo seeder', 0),
(15, 'iPhone 6s', '4024007111595418', 1, 4, '2019-06-05 07:23:12', '2019-06-05 07:23:12', 3, 1, 12, 'iphone6.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(16, 'iPhone 7', '4137224194602235', 1, 4, '2019-06-05 07:23:12', '2019-06-05 07:23:12', 1, 1, 12, 'iphone7.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(17, 'Ultrafine 4k', '4716816748616139', 7, 5, '2019-06-05 07:23:12', '2019-06-05 07:23:12', 2, 1, 12, 'ultrafine.jpg', 0, NULL, NULL, 'Created by demo seeder', 0),
(18, 'Ultrasharp U2415', '370225607058406', 3, 5, '2019-06-05 07:23:12', '2019-06-05 07:23:12', 2, 1, 12, 'ultrasharp.jpg', 0, NULL, NULL, 'Created by demo seeder', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `models_custom_fields`
--

CREATE TABLE `models_custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_model_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `default_value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_access_tokens`
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
-- Cấu trúc bảng cho bảng `oauth_auth_codes`
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
-- Cấu trúc bảng cho bảng `oauth_clients`
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
-- Đang đổ dữ liệu cho bảng `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Snipe-IT Personal Access Client', 'I0swv84FypEDIuKqlejlTTEOYfUQ0X92TvzRk3bs', 'http://localhost', 1, 0, 0, '2019-06-05 07:51:49', '2019-06-05 07:51:49'),
(2, NULL, 'Snipe-IT Password Grant Client', 'HZhYIT8QhVAVDFlK7W6hbbVMdPhyijoSc2waglMM', 'http://localhost', 0, 1, 0, '2019-06-05 07:51:49', '2019-06-05 07:51:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-06-05 07:51:49', '2019-06-05 07:51:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `requested_assets`
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
-- Cấu trúc bảng cho bảng `requests`
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
-- Cấu trúc bảng cho bảng `settings`
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
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `created_at`, `updated_at`, `user_id`, `per_page`, `site_name`, `qr_code`, `qr_text`, `display_asset_name`, `display_checkout_date`, `display_eol`, `auto_increment_assets`, `auto_increment_prefix`, `load_remote`, `logo`, `header_color`, `alert_email`, `alerts_enabled`, `default_eula_text`, `barcode_type`, `slack_endpoint`, `slack_channel`, `slack_botname`, `default_currency`, `custom_css`, `brand`, `ldap_enabled`, `ldap_server`, `ldap_uname`, `ldap_pword`, `ldap_basedn`, `ldap_filter`, `ldap_username_field`, `ldap_lname_field`, `ldap_fname_field`, `ldap_auth_filter_query`, `ldap_version`, `ldap_active_flag`, `ldap_emp_num`, `ldap_email`, `full_multiple_companies_support`, `ldap_server_cert_ignore`, `locale`, `labels_per_page`, `labels_width`, `labels_height`, `labels_pmargin_left`, `labels_pmargin_right`, `labels_pmargin_top`, `labels_pmargin_bottom`, `labels_display_bgutter`, `labels_display_sgutter`, `labels_fontsize`, `labels_pagewidth`, `labels_pageheight`, `labels_display_name`, `labels_display_serial`, `labels_display_tag`, `alt_barcode`, `alt_barcode_enabled`, `alert_interval`, `alert_threshold`, `email_domain`, `email_format`, `username_format`, `is_ad`, `ad_domain`, `ldap_port`, `ldap_tls`, `zerofill_count`, `ldap_pw_sync`, `two_factor_enabled`, `require_accept_signature`, `date_display_format`, `time_display_format`, `next_auto_tag_base`, `login_note`, `thumbnail_max_h`, `pwd_secure_uncommon`, `pwd_secure_complexity`, `pwd_secure_min`, `audit_interval`, `audit_warning_days`, `show_url_in_emails`, `custom_forgot_pass_url`, `show_alerts_in_menu`, `labels_display_company_name`, `show_archived_in_list`, `dashboard_message`, `support_footer`, `footer_text`, `modellist_displays`, `login_remote_user_enabled`, `login_common_disabled`, `login_remote_user_custom_logout_url`, `skin`, `show_images_in_email`, `admin_cc_email`, `labels_display_model`, `privacy_policy_link`, `version_footer`, `unique_serial`, `logo_print_assets`) VALUES
(1, '2019-06-05 07:30:19', '2019-06-05 08:23:17', 1, 20, 'Omnis sed voluptatem repellendus impedit.', NULL, NULL, NULL, NULL, NULL, 0, NULL, 1, NULL, NULL, 'itoy@example.net', 1, NULL, 'QRCODE', NULL, NULL, NULL, 'TMT', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'samaccountname', 'sn', 'givenname', 'uid=samaccountname', 3, NULL, NULL, NULL, 0, 0, 'es_PY', 30, '2.62500', '1.00000', '0.21975', '0.21975', '0.50000', '0.50000', '0.07000', '0.05000', 9, '8.50000', '11.00000', 0, 1, 1, 'C128', 1, 30, 5, 'test.com', 'filastname', 'filastname', 0, NULL, '389', 0, 5, 1, NULL, 0, 'Y-m-d', 'h:i A', 2, NULL, 50, 0, NULL, 10, NULL, NULL, 0, NULL, 1, 0, 0, NULL, 'on', NULL, 'image,category,manufacturer,model_number', 0, 0, '', NULL, 1, NULL, 0, NULL, 'on', 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status_labels`
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
-- Đang đổ dữ liệu cho bảng `status_labels`
--

INSERT INTO `status_labels` (`id`, `name`, `user_id`, `created_at`, `updated_at`, `deleted_at`, `deployable`, `pending`, `archived`, `notes`, `color`, `show_in_nav`, `default_label`) VALUES
(1, 'Ready to Deploy', 1, '1984-12-25 18:03:15', '1972-11-03 12:29:24', NULL, 1, 0, 0, 'Voluptatibus consequatur asperiores architecto perspiciatis temporibus perspiciatis.', NULL, 0, 1),
(2, 'Pending', 1, '2009-12-10 03:18:22', '2004-12-16 06:01:50', NULL, 0, 1, 0, 'Quibusdam eum suscipit culpa iusto consequuntur.', NULL, 0, 1),
(3, 'Archived', 1, '2010-05-22 17:51:35', '2003-01-07 02:27:09', NULL, 0, 0, 1, 'These assets are permanently undeployable', NULL, 0, 0),
(4, 'Out for Diagnostics', 1, '1982-12-28 02:09:08', '2018-01-08 02:57:00', NULL, 0, 0, 0, '', NULL, 0, 0),
(5, 'Out for Repair', 1, '1997-10-18 00:47:16', '1971-08-17 00:13:00', NULL, 0, 0, 0, '', NULL, 0, 0),
(6, 'Broken - Not Fixable', 1, '1976-10-11 23:38:59', '1974-03-21 12:08:51', NULL, 0, 0, 0, '', NULL, 0, 0),
(7, 'Lost/Stolen', 1, '1980-01-14 05:07:24', '1999-09-29 19:01:50', NULL, 0, 0, 0, '', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
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
-- Đang đổ dữ liệu cho bảng `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `address`, `address2`, `city`, `state`, `country`, `phone`, `fax`, `email`, `contact`, `notes`, `created_at`, `updated_at`, `user_id`, `deleted_at`, `zip`, `url`, `image`) VALUES
(1, 'Nolan, Kris and Johnson', '4829 Zola Spurs Apt. 243', 'Apt. 907', 'Fritschside', 'NM', 'MG', '573.628.3448', '379.855.1523 x84212', 'daphne91@example.net', 'Dorcas Kautzer', 'Sed vero sit ratione enim. Non aut sint sed. Temporibus est blanditiis quas reiciendis. Velit cupiditate rerum provident repellat veritatis qui.', '2019-06-05 07:23:10', '2019-06-05 07:23:10', NULL, NULL, '13878', 'http://welch.net/hic-omnis-nemo-nisi-error-et-odit-autem-aliquam', NULL),
(2, 'Aufderhar, Fahey and Schinner', '448 Napoleon Street Suite 649', 'Apt. 327', 'West Marley', 'VT', 'SC', '637-296-0418 x91434', '363.892.7998 x5527', 'hoberbrunner@example.org', 'Taurean Simonis', 'Tempora sit officiis eos molestias. Reprehenderit eos veritatis unde aut. Aut aperiam suscipit ipsam eligendi placeat maiores.', '2019-06-05 07:23:10', '2019-06-05 07:23:10', NULL, NULL, '91366', 'http://www.murray.com/et-esse-hic-natus-facilis-veniam-autem', NULL),
(3, 'Herzog-Prohaska', '5368 Michel Freeway Suite 126', 'Apt. 123', 'Jamaalside', 'OH', 'AZ', '1-218-504-3279 x438', '(321) 858-3110', 'turner.jamil@example.net', 'Miss Cecile Beer', 'Aut laboriosam molestiae modi corporis. Et ullam possimus consequuntur placeat maiores ut qui. Et sed exercitationem deleniti nobis dicta nulla dolores.', '2019-06-05 07:23:10', '2019-06-05 07:23:10', NULL, NULL, '28323-2755', 'http://ohara.com/', NULL),
(4, 'Donnelly Group', '32626 Telly Turnpike', 'Suite 513', 'Kilbackborough', 'UT', 'AR', '+15643049591', '+1-897-877-4469', 'schowalter.viva@example.com', 'Karina Mann', 'Omnis et sint nobis quisquam. Sint illum dignissimos quo dolores. Autem assumenda repellat ipsam temporibus.', '2019-06-05 07:23:10', '2019-06-05 07:23:10', NULL, NULL, '29479-3409', 'http://corwin.net/aspernatur-error-in-expedita-rerum.html', NULL),
(5, 'Brakus LLC', '6076 Malvina Brooks', 'Suite 360', 'Vitoborough', 'TN', 'QA', '749.905.9960 x7015', '1-690-954-8261', 'samantha.murazik@example.org', 'Lyric Thompson', 'Voluptatem quia laboriosam dolores sequi accusamus maiores. Voluptas assumenda eaque nam enim nemo. Sit illo deserunt et non libero vero quod quibusdam.', '2019-06-05 07:23:10', '2019-06-05 07:23:10', NULL, NULL, '47862', 'https://schoen.com/et-quam-incidunt-nobis-quae.html', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `throttle`
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
-- Cấu trúc bảng cho bảng `users`
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
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `permissions`, `activated`, `activation_code`, `activated_at`, `last_login`, `persist_code`, `reset_password_code`, `first_name`, `last_name`, `created_at`, `updated_at`, `deleted_at`, `website`, `country`, `gravatar`, `location_id`, `phone`, `jobtitle`, `manager_id`, `employee_num`, `avatar`, `username`, `notes`, `company_id`, `remember_token`, `ldap_import`, `locale`, `show_in_list`, `two_factor_secret`, `two_factor_enrolled`, `two_factor_optin`, `department_id`, `address`, `city`, `state`, `zip`) VALUES
(1, 'ladarius.wehner@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"superuser\":\"1\"}', 1, NULL, NULL, '2019-06-05 07:51:45', NULL, NULL, 'Admin', 'User', '2019-06-05 07:23:01', '2019-06-05 07:51:45', NULL, NULL, 'Faroe Islands', NULL, 3, '(570) 823-9937 x21378', 'Electronic Drafter', NULL, '28534', NULL, 'admin', 'Created by DB seeder', 1, NULL, 0, 'gaa_GH', 1, NULL, 0, 0, 6, '17999 Cortney Stravenue Apt. 743\nLorenberg, AK 99084-9406', 'North Jessieland', 'ME', '11826'),
(2, 'snipe@snipe.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"superuser\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Snipe E.', 'Head', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'Bangladesh', NULL, 2, '1-220-568-9437 x3360', 'Pharmacy Technician', NULL, '8398', NULL, 'snipe', 'Created by DB seeder', 4, NULL, 0, 'yo_NG', 1, NULL, 0, 0, 2, '3189 Sonny Squares\nBreitenbergside, TN 73595', 'East Valentine', 'OK', '38264'),
(3, 'marvin.nick@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"superuser\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Brandt', 'Jast', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'Niue', NULL, 2, '689-963-9091', 'Pesticide Sprayer', NULL, '31328', NULL, 'cartwright.leonard', 'Created by DB seeder', 1, NULL, 0, 'en_BW', 1, NULL, 0, 0, 6, '306 Rebekah Wall Apt. 643\nMercedesburgh, IA 90385', 'New Sylvester', 'NY', '01003-9045'),
(4, 'yost.sonia@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"superuser\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Denis', 'Spinka', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'India', NULL, 2, '487.797.7235 x0778', 'Natural Sciences Manager', NULL, '16313', NULL, 'welch.ron', 'Created by DB seeder', 3, NULL, 0, 'syr_SY', 1, NULL, 0, 0, 1, '44996 Parker Mall Apt. 442\nNew Forrest, FL 40576-7254', 'West Aileen', 'AK', '87108-4151'),
(5, 'america51@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"superuser\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Maureen', 'Prosacco', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'Cyprus', NULL, 1, '(756) 376-1205', 'Press Machine Setter, Operator', NULL, '24513', NULL, 'drau', 'Created by DB seeder', 2, NULL, 0, 'ga_IE', 1, NULL, 0, 0, 5, '34635 Grayson Harbor Suite 570\nNorth Leonie, UT 87439-9101', 'Port Deanside', 'NH', '25542-6672'),
(6, 'grayson.klocko@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"admin\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Niko', 'Collins', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'Brunei Darussalam', NULL, 3, '1-771-764-0664 x0219', 'Substance Abuse Social Worker', 2, '26119', NULL, 'casper.orlo', 'Created by DB seeder', 4, NULL, 0, 'nr_ZA', 1, NULL, 0, 0, 3, '6993 Elmira Harbor Apt. 554\nLake Jayson, MI 06521-3179', 'Willmsfurt', 'NC', '19792'),
(7, 'bernice.conroy@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"admin\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Angelica', 'Champlin', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'Vanuatu', NULL, 1, '+1 (470) 683-1811', 'Mold Maker', 2, '32401', NULL, 'elias.corwin', 'Created by DB seeder', 3, NULL, 0, 'fr_FR', 1, NULL, 0, 0, 1, '73758 Gage Haven Apt. 133\nSchmidtfurt, WA 22092', 'Jakubowskifort', 'LA', '22926-9528'),
(8, 'barton.serena@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"admin\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Leonardo', 'Reilly', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'Macao', NULL, 3, '1-645-292-5701 x424', 'Gas Plant Operator', 2, '27840', NULL, 'narciso.king', 'Created by DB seeder', 2, NULL, 0, 'fr_CH', 1, NULL, 0, 0, 4, '83454 Beatty Underpass Suite 626\nNew Maddison, KY 90592', 'South Laurianeton', 'DE', '62424'),
(9, 'hyman93@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Liliane', 'Gislason', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'Tokelau', NULL, 1, '297-379-9885 x0179', 'Industrial Engineer', NULL, '6383', NULL, 'dianna.rippin', 'Created by DB seeder', 4, NULL, 0, 'es_ES', 1, NULL, 0, 0, 5, '65090 Jenkins Inlet Apt. 366\nZiemeland, RI 16639-2903', 'South Kelton', 'SD', '21913'),
(10, 'noe.connelly@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Robert', 'Johns', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'Algeria', NULL, 4, '1-708-234-5578', 'Health Specialties Teacher', NULL, '34958', NULL, 'rogelio65', 'Created by DB seeder', 1, NULL, 0, 'de_LU', 1, NULL, 0, 0, 4, '11470 Alena Lake\nMullershire, VT 94264', 'Boyerchester', 'WA', '54664-4302'),
(11, 'eddie26@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Josianne', 'Lueilwitz', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'Cyprus', NULL, 3, '691.392.6723 x991', 'Physicist', NULL, '3638', NULL, 'herman.meaghan', 'Created by DB seeder', 3, NULL, 0, 'sv_FI', 1, NULL, 0, 0, 2, '68973 Carmen Squares Suite 918\nReillymouth, AZ 19795-3265', 'Millstown', 'MS', '55783-8017'),
(12, 'rmohr@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Marielle', 'Marquardt', '2019-06-05 07:23:01', '2019-06-05 07:23:01', NULL, NULL, 'New Zealand', NULL, 1, '1-229-776-0954', 'Cement Mason and Concrete Finisher', NULL, '27523', NULL, 'yyundt', 'Created by DB seeder', 1, NULL, 0, 'de_LU', 1, NULL, 0, 0, 1, '905 Krystal Circles\nLarueville, OH 28993', 'Bergnaumshire', 'OR', '88849-1168'),
(13, 'chase.sauer@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Pamela', 'Mayer', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'South Africa', NULL, 3, '892.679.7809', 'Aircraft Engine Specialist', NULL, '15942', NULL, 'glittle', 'Created by DB seeder', 3, NULL, 0, 'sq_AL', 1, NULL, 0, 0, 4, '40594 Casandra Row Suite 709\nMohrberg, WI 08837-5573', 'Florianmouth', 'MD', '27607'),
(14, 'jaleel48@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Aisha', 'Ferry', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'British Virgin Islands', NULL, 4, '(539) 756-8409 x348', 'Food Servers', NULL, '32468', NULL, 'zswaniawski', 'Created by DB seeder', 2, NULL, 0, 'en_AS', 1, NULL, 0, 0, 2, '3184 Lafayette Junction Apt. 989\nMedhurstland, OK 79752-1415', 'South Vidal', 'GA', '89258'),
(15, 'schneider.amiya@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Kris', 'Langosh', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Tunisia', NULL, 3, '1-710-303-8124 x6450', 'Sociologist', NULL, '11606', NULL, 'hpouros', 'Created by DB seeder', 2, NULL, 0, 'fa_AF', 1, NULL, 0, 0, 4, '335 Annette Summit\nPort Jaydenport, HI 71767-2716', 'Casimerhaven', 'CA', '13785'),
(16, 'davis.jerrod@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Logan', 'Harber', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Timor-Leste', NULL, 2, '1-230-528-7049', 'Mechanical Engineer', NULL, '27116', NULL, 'sim.daugherty', 'Created by DB seeder', 1, NULL, 0, 'es_PR', 1, NULL, 0, 0, 2, '1664 Mueller Crossroad Suite 688\nKrajcikland, MI 17197-2600', 'Mayertborough', 'CA', '63670'),
(17, 'raina.maggio@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Garnet', 'Friesen', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Saint Martin', NULL, 2, '851.605.8225', 'GED Teacher', NULL, '15290', NULL, 'wrice', 'Created by DB seeder', 3, NULL, 0, 'aa_ET', 1, NULL, 0, 0, 3, '175 Parker Mountains\nAnibalmouth, AL 12877', 'Balistrerifort', 'NE', '12306'),
(18, 'hgusikowski@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Leta', 'Leuschke', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Georgia', NULL, 4, '1-767-457-1426 x0609', 'Structural Iron and Steel Worker', NULL, '9476', NULL, 'germaine82', 'Created by DB seeder', 1, NULL, 0, 'ja_JP', 1, NULL, 0, 0, 5, '580 Hirthe Courts Apt. 893\nDaytonside, MA 49627-3851', 'Lake Stefan', 'KY', '66973-9966'),
(19, 'nyah.cremin@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Hellen', 'Bayer', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Saint Helena', NULL, 3, '+1-534-361-5466', 'Health Services Manager', NULL, '34147', NULL, 'ankunding.kiara', 'Created by DB seeder', 2, NULL, 0, 'ps_AF', 1, NULL, 0, 0, 4, '48232 Maeve Vista\nLake Lesleyport, NH 55215', 'Londonhaven', 'IL', '07402'),
(20, 'meghan.haag@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Esta', 'Watsica', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Sierra Leone', NULL, 3, '415.601.5323', 'Real Estate Appraiser', NULL, '16347', NULL, 'jess.bode', 'Created by DB seeder', 2, NULL, 0, 'gu_IN', 1, NULL, 0, 0, 4, '8182 Cecelia Forest\nJastville, NC 84890-5574', 'Lisaland', 'DC', '38452-1967'),
(21, 'hilma57@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Gustave', 'Klein', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Slovakia (Slovak Republic)', NULL, 4, '(351) 644-3951 x81919', 'Personal Care Worker', NULL, '16477', NULL, 'jlueilwitz', 'Created by DB seeder', 4, NULL, 0, 'aa_ER', 1, NULL, 0, 0, 2, '87071 Hansen Forest Suite 106\nFunkfurt, MN 97959', 'West Isabell', 'MI', '91471-6948'),
(22, 'weissnat.ashley@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Jo', 'Larson', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Lesotho', NULL, 5, '273-384-6493 x2982', 'Dental Hygienist', NULL, '3818', NULL, 'qtillman', 'Created by DB seeder', 4, NULL, 0, 'tg_TJ', 1, NULL, 0, 0, 3, '44107 Windler Trafficway\nPeggieshire, DC 79509-7272', 'West Haley', 'DC', '55939-9539'),
(23, 'kub.clarabelle@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Phoebe', 'Dietrich', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Benin', NULL, 2, '1-494-901-6606 x440', 'Health Services Manager', NULL, '30465', NULL, 'roosevelt66', 'Created by DB seeder', 2, NULL, 0, 'ar_SY', 1, NULL, 0, 0, 6, '842 Greenholt Hollow\nJustinahaven, DC 75117-7495', 'Raphaellemouth', 'WY', '87407-1616'),
(24, 'berry37@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Quentin', 'Denesik', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Palau', NULL, 3, '1-828-989-9993 x514', 'Sales and Related Workers', NULL, '20534', NULL, 'janick31', 'Created by DB seeder', 4, NULL, 0, 'kaj_NG', 1, NULL, 0, 0, 1, '7144 Roob Mill Suite 220\nPort Catharinemouth, MN 89311', 'New Irma', 'ID', '53148'),
(25, 'chance96@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Richmond', 'Kuhlman', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'New Caledonia', NULL, 3, '770.529.3022 x44463', 'Human Resource Director', NULL, '7800', NULL, 'kihn.merlin', 'Created by DB seeder', 2, NULL, 0, 'rw_RW', 1, NULL, 0, 0, 4, '752 Jodie Orchard\nEast Nya, CA 86968', 'South Elta', 'CA', '89364-5742'),
(26, 'minerva.kilback@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Abby', 'Toy', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Holy See (Vatican City State)', NULL, 3, '1-331-816-0096 x836', 'Biological Science Teacher', NULL, '15029', NULL, 'shany02', 'Created by DB seeder', 3, NULL, 0, 'bs_BA', 1, NULL, 0, 0, 6, '882 Abbigail Extensions\nNew Allan, OH 00705', 'Selmerville', 'DE', '35404-9930'),
(27, 'fferry@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Penelope', 'Zieme', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Latvia', NULL, 2, '357.372.0933', 'Environmental Engineering Technician', NULL, '30584', NULL, 'istamm', 'Created by DB seeder', 3, NULL, 0, 'lv_LV', 1, NULL, 0, 0, 4, '70686 Schneider Isle\nClydefort, DC 00279-5470', 'Thompsonberg', 'LA', '84105-6834'),
(28, 'bkoss@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Wendell', 'Hodkiewicz', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Holy See (Vatican City State)', NULL, 5, '(601) 904-6396 x930', 'Educational Counselor OR Vocationall Counselor', NULL, '9866', NULL, 'ozella82', 'Created by DB seeder', 2, NULL, 0, 'fa_AF', 1, NULL, 0, 0, 5, '24545 Doyle Forks\nSouth Zella, MT 35557', 'Luettgenland', 'CO', '27521-8126'),
(29, 'bmckenzie@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Nels', 'Williamson', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Niger', NULL, 4, '(376) 724-8559 x416', 'Fish Game Warden', NULL, '8570', NULL, 'clement.johns', 'Created by DB seeder', 3, NULL, 0, 'ti_ER', 1, NULL, 0, 0, 6, '660 Vanessa Tunnel\nEast Alexa, CT 33604-9656', 'Ernserchester', 'HI', '74167'),
(30, 'dion73@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Hosea', 'Quigley', '2019-06-05 07:23:02', '2019-06-05 07:23:02', NULL, NULL, 'Grenada', NULL, 4, '+1-657-490-6068', 'Preschool Education Administrators', NULL, '30232', NULL, 'rogahn.selina', 'Created by DB seeder', 3, NULL, 0, 'fa_AF', 1, NULL, 0, 0, 4, '2265 Zion Brooks\nNorth Nat, WV 74023', 'South Mitchel', 'NV', '87746-7210'),
(31, 'njohnson@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Elinor', 'Schaefer', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Sierra Leone', NULL, 1, '674.639.9627 x54998', 'Milling Machine Operator', NULL, '11795', NULL, 'wschmeler', 'Created by DB seeder', 3, NULL, 0, 'it_IT', 1, NULL, 0, 0, 2, '93044 Theo Brook\nPort Roman, WV 96454', 'East Lavonport', 'PA', '95768-5919'),
(32, 'lyda45@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Lyric', 'Wolf', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Aruba', NULL, 4, '+1.752.277.4899', 'Sheet Metal Worker', NULL, '31216', NULL, 'nyasia22', 'Created by DB seeder', 1, NULL, 0, 'gez_ET', 1, NULL, 0, 0, 1, '7886 Dicki Loaf Suite 058\nSerenastad, VA 43103-8919', 'Bartonchester', 'TX', '69966'),
(33, 'jeffrey11@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Edwina', 'Hand', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Slovenia', NULL, 4, '(679) 880-8694', 'Solderer', NULL, '33758', NULL, 'bobby85', 'Created by DB seeder', 2, NULL, 0, 'pa_IN', 1, NULL, 0, 0, 2, '179 Bruen Motorway\nEast Rosalee, MI 54581-3910', 'Port Leann', 'OR', '08863-3791'),
(34, 'sheridan74@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Ewald', 'Toy', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Poland', NULL, 5, '1-250-490-2701', 'Prosthodontist', NULL, '7863', NULL, 'feest.sincere', 'Created by DB seeder', 3, NULL, 0, 'to_TO', 1, NULL, 0, 0, 4, '153 Rosalyn Streets Apt. 739\nParisianfort, MI 25002', 'Lake Berniceport', 'IL', '30392'),
(35, 'ruecker.quincy@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Verlie', 'Schinner', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Vietnam', NULL, 3, '402.601.9016 x02562', 'Aircraft Assembler', NULL, '34712', NULL, 'leuschke.mona', 'Created by DB seeder', 3, NULL, 0, 'syr_SY', 1, NULL, 0, 0, 4, '3587 Kling Unions\nLabadiefurt, GA 85221-9647', 'Bernitaton', 'WA', '09509-3647'),
(36, 'snitzsche@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Melissa', 'Labadie', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Liechtenstein', NULL, 3, '742-573-1779 x14733', 'Teller', NULL, '8178', NULL, 'stamm.dejon', 'Created by DB seeder', 4, NULL, 0, 'om_ET', 1, NULL, 0, 0, 2, '31859 Wilkinson Mount Suite 534\nLake Annamarie, NM 41170', 'Binsfurt', 'KS', '55827'),
(37, 'effertz.kailee@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Arno', 'Schuppe', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Cocos (Keeling) Islands', NULL, 1, '(876) 557-3790 x524', 'Postal Service Mail Carrier', NULL, '7895', NULL, 'rogers64', 'Created by DB seeder', 1, NULL, 0, 'as_IN', 1, NULL, 0, 0, 5, '837 Ward Cove\nWest Rogers, WA 80152', 'Streichmouth', 'AZ', '03723-1840'),
(38, 'zelma.veum@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Alfredo', 'Bashirian', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Guadeloupe', NULL, 4, '441-649-2802', 'Media and Communication Worker', NULL, '3653', NULL, 'dejuan.parker', 'Created by DB seeder', 3, NULL, 0, 'bn_BD', 1, NULL, 0, 0, 2, '96542 Stokes Rue Apt. 408\nLake Brooklyn, NY 36499-9078', 'North Amandashire', 'WY', '25349'),
(39, 'rconn@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Dawn', 'Zulauf', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'United Arab Emirates', NULL, 1, '421-339-9657 x80508', 'Nursery Manager', NULL, '22453', NULL, 'dickens.cynthia', 'Created by DB seeder', 1, NULL, 0, 'en_GB', 1, NULL, 0, 0, 4, '69401 Witting Cliffs\nZorafurt, IN 23679-0015', 'Danykaside', 'SD', '50082'),
(40, 'delia.barton@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Greta', 'Denesik', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Qatar', NULL, 2, '1-889-924-8799', 'Brazer', NULL, '9250', NULL, 'deon97', 'Created by DB seeder', 1, NULL, 0, 'aa_ET', 1, NULL, 0, 0, 4, '1623 Ross Loop\nShaunland, DC 35776', 'East Alfonzo', 'CT', '21434-2862'),
(41, 'melany.ryan@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Tyson', 'Kuhlman', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Guinea-Bissau', NULL, 4, '1-502-603-9859', 'Tank Car', NULL, '29351', NULL, 'raphael12', 'Created by DB seeder', 1, NULL, 0, 'kcg_NG', 1, NULL, 0, 0, 4, '516 Brakus Walks\nNorth Shea, SD 90206', 'East Tiffanychester', 'PA', '46332-5183'),
(42, 'jacky38@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Piper', 'Grady', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Saint Vincent and the Grenadines', NULL, 1, '1-838-729-6465', 'Security Systems Installer OR Fire Alarm Systems Installer', NULL, '34763', NULL, 'fmayert', 'Created by DB seeder', 4, NULL, 0, 'id_ID', 1, NULL, 0, 0, 2, '6331 Calista Hills\nMatildemouth, WA 85583', 'Lake Carmineburgh', 'PA', '65311-3329'),
(43, 'dooley.pearl@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Dorcas', 'Johnson', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Azerbaijan', NULL, 2, '587-756-4106 x89268', 'Manager of Food Preparation', NULL, '25518', NULL, 'lindsey.satterfield', 'Created by DB seeder', 1, NULL, 0, 'es_GT', 1, NULL, 0, 0, 3, '170 Ondricka Spurs Suite 907\nSouth Ezekielborough, AZ 90204-9744', 'New Dagmar', 'NH', '19818'),
(44, 'nels21@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Trisha', 'Bechtelar', '2019-06-05 07:23:03', '2019-06-05 07:23:03', NULL, NULL, 'Congo', NULL, 4, '501-247-8644', 'Surgeon', NULL, '4229', NULL, 'bert.padberg', 'Created by DB seeder', 4, NULL, 0, 'en_AS', 1, NULL, 0, 0, 5, '639 Santa Courts\nJuniorport, NC 26860', 'Lake Greg', 'OK', '55152'),
(45, 'mbeatty@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Noel', 'Witting', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Kyrgyz Republic', NULL, 5, '1-574-444-6697 x759', 'Travel Guide', NULL, '31532', NULL, 'mohr.thora', 'Created by DB seeder', 3, NULL, 0, 'fi_FI', 1, NULL, 0, 0, 1, '35982 Roselyn Curve Apt. 953\nThielbury, NM 56213', 'Kuhicbury', 'MA', '35704-1905'),
(46, 'dooley.rosina@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Niko', 'Gorczany', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'South Africa', NULL, 1, '+1.853.348.2794', 'Entertainer and Performer', NULL, '13447', NULL, 'predovic.rosella', 'Created by DB seeder', 2, NULL, 0, 'ar_QA', 1, NULL, 0, 0, 3, '952 Meda Neck\nPinkiestad, IN 43229-7529', 'Joshuaborough', 'NE', '94380-0817'),
(47, 'mohamed.runte@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Luis', 'Lindgren', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Burkina Faso', NULL, 2, '+1.876.365.6878', 'Astronomer', NULL, '21552', NULL, 'zieme.lulu', 'Created by DB seeder', 2, NULL, 0, 'ar_BH', 1, NULL, 0, 0, 2, '689 Kristofer Shoals\nDavemouth, CT 55994-4808', 'North Margefort', 'IA', '29842'),
(48, 'xstrosin@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Connor', 'Bednar', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'United Kingdom', NULL, 2, '880.852.3095 x3142', 'Soldering Machine Setter', NULL, '27128', NULL, 'konopelski.gilbert', 'Created by DB seeder', 1, NULL, 0, 'ro_RO', 1, NULL, 0, 0, 5, '79730 Leopoldo Rapids\nDanielview, DC 22998-6489', 'Victoriaton', 'ME', '92633-5883'),
(49, 'carey99@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Brando', 'Donnelly', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Fiji', NULL, 5, '1-852-359-3620 x9440', 'Veterinarian', NULL, '25216', NULL, 'olson.agustina', 'Created by DB seeder', 1, NULL, 0, 'en_JM', 1, NULL, 0, 0, 3, '306 Funk Hills Apt. 037\nSouth Viola, CT 35246-1719', 'Bartellhaven', 'VT', '89738'),
(50, 'kuphal.dolores@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Yoshiko', 'Jast', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Seychelles', NULL, 5, '1-663-754-3665 x6337', 'Manicurists', NULL, '10442', NULL, 'maverick06', 'Created by DB seeder', 3, NULL, 0, 'nr_ZA', 1, NULL, 0, 0, 1, '409 Keebler Mills\nNorth Hannahville, ND 93527-0673', 'Port Carlos', 'ME', '38943-4954'),
(51, 'julie11@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Willie', 'Parker', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Norway', NULL, 4, '293.422.1214 x6395', 'Stationary Engineer OR Boiler Operator', NULL, '27528', NULL, 'noelia.legros', 'Created by DB seeder', 3, NULL, 0, 'es_CR', 1, NULL, 0, 0, 2, '6696 Jeffry Stream Apt. 110\nNorth Fermintown, FL 90177-4187', 'Demetriusshire', 'NC', '66036'),
(52, 'farrell.estevan@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Sebastian', 'Gottlieb', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Gibraltar', NULL, 3, '+1-589-403-5705', 'Motion Picture Projectionist', NULL, '12567', NULL, 'merdman', 'Created by DB seeder', 4, NULL, 0, 'fil_PH', 1, NULL, 0, 0, 4, '1045 Gleason Crescent Suite 195\nRomainestad, OK 85579', 'Port Dexter', 'VT', '53604-8298'),
(53, 'kiara.okuneva@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Charley', 'Hoeger', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Peru', NULL, 2, '(807) 931-0141', 'Product Specialist', NULL, '4635', NULL, 'phill', 'Created by DB seeder', 1, NULL, 0, 'es_VE', 1, NULL, 0, 0, 5, '367 Juana Summit Suite 675\nEast Consueloville, IN 04300-2683', 'Satterfieldborough', 'IA', '49696'),
(54, 'qgoyette@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Clare', 'Moen', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Falkland Islands (Malvinas)', NULL, 3, '667-349-8620 x94430', 'Stringed Instrument Repairer and Tuner', NULL, '15301', NULL, 'trudie.price', 'Created by DB seeder', 4, NULL, 0, 'om_KE', 1, NULL, 0, 0, 1, '8718 Adan Crossroad Suite 478\nRodriguezfurt, KY 96761', 'Kianatown', 'OK', '50309-6931'),
(55, 'lemke.margaretta@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Beau', 'King', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Timor-Leste', NULL, 5, '350.522.9278 x5916', 'Cutting Machine Operator', NULL, '19674', NULL, 'jerry59', 'Created by DB seeder', 1, NULL, 0, 'gu_IN', 1, NULL, 0, 0, 2, '78794 Roxane Rapids Apt. 902\nKeyonville, AK 21597-9853', 'Croninview', 'SD', '64479-5413'),
(56, 'nikolaus.rozella@example.com', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Americo', 'Dietrich', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Sri Lanka', NULL, 3, '897.871.7423 x66771', 'Public Health Social Worker', NULL, '31602', NULL, 'hupton', 'Created by DB seeder', 3, NULL, 0, 'rw_RW', 1, NULL, 0, 0, 1, '1363 Emmet Walk Suite 118\nSchaeferchester, UT 29478-8781', 'South Candelarioborough', 'AR', '09934'),
(57, 'reichel.rory@example.net', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Drake', 'Casper', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Svalbard & Jan Mayen Islands', NULL, 5, '675.934.2458 x27856', 'Homeland Security', NULL, '25823', NULL, 'laisha.nitzsche', 'Created by DB seeder', 1, NULL, 0, 'eu_ES', 1, NULL, 0, 0, 1, '37064 Becker Lock Apt. 473\nEast Monicatown, NE 55332', 'Gaetanobury', 'WV', '37331-2403'),
(58, 'unikolaus@example.org', '$2y$10$JOUsiy2uNZEwbTEo6bIRkObwgwZGPVjP4ZEHN4RaYJ6vVX.Bu6QWa', '{\"assets.view\":\"1\"}', 1, NULL, NULL, NULL, NULL, NULL, 'Frederic', 'Goodwin', '2019-06-05 07:23:04', '2019-06-05 07:23:04', NULL, NULL, 'Norfolk Island', NULL, 1, '1-873-347-1290 x241', 'Scientific Photographer', NULL, '11589', NULL, 'liliana52', 'Created by DB seeder', 2, NULL, 0, 'oc_FR', 1, NULL, 0, 0, 4, '58499 Fausto Hollow Suite 596\nNorth Jessica, NE 63384', 'Lake Rebekah', 'AR', '99312-4497');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `accessories_users`
--
ALTER TABLE `accessories_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `action_logs`
--
ALTER TABLE `action_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_logs_thread_id_index` (`thread_id`),
  ADD KEY `action_logs_target_id_target_type_index` (`target_id`,`target_type`),
  ADD KEY `action_logs_created_at_index` (`created_at`),
  ADD KEY `action_logs_item_type_item_id_action_type_index` (`item_type`,`item_id`,`action_type`),
  ADD KEY `action_logs_target_type_target_id_action_type_index` (`target_type`,`target_id`,`action_type`);

--
-- Chỉ mục cho bảng `assets`
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
-- Chỉ mục cho bảng `asset_logs`
--
ALTER TABLE `asset_logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `asset_maintenances`
--
ALTER TABLE `asset_maintenances`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `asset_uploads`
--
ALTER TABLE `asset_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `checkout_requests`
--
ALTER TABLE `checkout_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkout_requests_user_id_requestable_id_requestable_type` (`user_id`,`requestable_id`,`requestable_type`);

--
-- Chỉ mục cho bảng `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_name_unique` (`name`);

--
-- Chỉ mục cho bảng `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `components_assets`
--
ALTER TABLE `components_assets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `consumables`
--
ALTER TABLE `consumables`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `consumables_users`
--
ALTER TABLE `consumables_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `custom_fieldsets`
--
ALTER TABLE `custom_fieldsets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `depreciations`
--
ALTER TABLE `depreciations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `license_seats`
--
ALTER TABLE `license_seats`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `models_custom_fields`
--
ALTER TABLE `models_custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Chỉ mục cho bảng `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Chỉ mục cho bảng `requested_assets`
--
ALTER TABLE `requested_assets`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `status_labels`
--
ALTER TABLE `status_labels`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `throttle`
--
ALTER TABLE `throttle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `throttle_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_activation_code_index` (`activation_code`),
  ADD KEY `users_reset_password_code_index` (`reset_password_code`);

--
-- Chỉ mục cho bảng `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accessories`
--
ALTER TABLE `accessories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `accessories_users`
--
ALTER TABLE `accessories_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `action_logs`
--
ALTER TABLE `action_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT cho bảng `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1375;

--
-- AUTO_INCREMENT cho bảng `asset_logs`
--
ALTER TABLE `asset_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `asset_maintenances`
--
ALTER TABLE `asset_maintenances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `asset_uploads`
--
ALTER TABLE `asset_uploads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `checkout_requests`
--
ALTER TABLE `checkout_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `components`
--
ALTER TABLE `components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `components_assets`
--
ALTER TABLE `components_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `consumables`
--
ALTER TABLE `consumables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `consumables_users`
--
ALTER TABLE `consumables_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `custom_fieldsets`
--
ALTER TABLE `custom_fieldsets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `depreciations`
--
ALTER TABLE `depreciations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `licenses`
--
ALTER TABLE `licenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `license_seats`
--
ALTER TABLE `license_seats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT cho bảng `models`
--
ALTER TABLE `models`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `models_custom_fields`
--
ALTER TABLE `models_custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `requested_assets`
--
ALTER TABLE `requested_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `status_labels`
--
ALTER TABLE `status_labels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `throttle`
--
ALTER TABLE `throttle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

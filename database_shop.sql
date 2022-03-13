-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 13, 2022 at 12:24 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `pty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `product_id`, `pty`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 1, 35000000, NULL, NULL),
(2, 1, 7, 3, 35000000, NULL, NULL),
(3, 2, 6, 1, 35000000, NULL, NULL),
(4, 3, 7, 1, 35000000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `slug`, `active`, `created_at`, `updated_at`) VALUES
(14, 'Điện thoại', 0, 'dien-thoai', 1, '2022-03-10 03:40:51', '2022-03-10 03:40:51'),
(15, 'Tablet', 0, 'tablet', 1, '2022-03-10 03:40:55', '2022-03-10 03:40:55'),
(18, 'Laptop', 0, 'laptop', 1, '2022-03-12 03:52:28', '2022-03-12 03:52:28'),
(19, 'Apple', 14, 'apple', 1, '2022-03-12 03:53:32', '2022-03-12 03:53:32'),
(20, 'Samsung', 14, 'samsung', 1, '2022-03-12 03:53:41', '2022-03-12 03:53:41'),
(21, 'Xiaomi', 14, 'xiaomi', 1, '2022-03-12 03:53:53', '2022-03-12 03:53:53'),
(22, 'Ipad Pro', 15, 'ipad-pro', 1, '2022-03-12 03:55:36', '2022-03-12 03:55:36'),
(23, 'Ipad Air', 15, 'ipad-air', 1, '2022-03-12 03:55:46', '2022-03-12 03:55:46'),
(24, 'Mac', 18, 'mac', 1, '2022-03-12 03:58:47', '2022-03-12 03:58:47'),
(25, 'Dell', 18, 'dell', 1, '2022-03-12 03:58:53', '2022-03-12 03:58:53'),
(26, 'HP', 18, 'hp', 1, '2022-03-12 03:58:59', '2022-03-12 03:58:59');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `email`, `content`, `created_at`, `updated_at`) VALUES
(1, 'aaaaaaaaaa', '111111111111', 'aaaaaaaaaaa', 'aaaaaaaaa', 'aaaaaaaaaa', '2022-03-13 03:28:01', '2022-03-13 03:28:01'),
(2, 'qewqeqw', 'ewqeqweqw', 'eqweqweqw', 'phieuphieu11@gmail.com', 'asdsadas', '2022-03-13 04:35:21', '2022-03-13 04:35:21'),
(3, 'asdas', 'dsadasd', 'ddsad', 'ducduonghan@gmail.com', 'dsadasd', '2022-03-13 04:52:12', '2022-03-13 04:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '304a881a-0a3e-4cc4-8632-f1796d55ff44', 'database', 'default', '{\"uuid\":\"304a881a-0a3e-4cc4-8632-f1796d55ff44\",\"displayName\":\"App\\\\Jobs\\\\SendMail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMail\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendMail\\\":11:{s:8:\\\"\\u0000*\\u0000email\\\";s:22:\\\"phieuphieu11@gmail.com\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";O:25:\\\"Illuminate\\\\Support\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-03-13 11:35:23.535782\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'Illuminate\\Queue\\MaxAttemptsExceededException: App\\Jobs\\SendMail has been attempted too many times or run too long. The job may have previously timed out. in E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php:750\nStack trace:\n#0 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(504): Illuminate\\Queue\\Worker->maxAttemptsExceededException(Object(Illuminate\\Queue\\Jobs\\DatabaseJob))\n#1 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(418): Illuminate\\Queue\\Worker->markJobAsFailedIfAlreadyExceedsMaxAttempts(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), 1)\n#2 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(378): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#3 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(172): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#4 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(117): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#5 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(101): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#6 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#7 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#8 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#9 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#10 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(653): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#11 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#12 E:\\laragon\\www\\shop\\vendor\\symfony\\console\\Command\\Command.php(298): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#13 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#14 E:\\laragon\\www\\shop\\vendor\\symfony\\console\\Application.php(1015): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#15 E:\\laragon\\www\\shop\\vendor\\symfony\\console\\Application.php(299): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#16 E:\\laragon\\www\\shop\\vendor\\symfony\\console\\Application.php(171): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#17 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(94): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#18 E:\\laragon\\www\\shop\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#19 E:\\laragon\\www\\shop\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#20 {main}', '2022-03-13 04:50:20');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2014_10_12_000000_create_users_table', 1),
(7, '2014_10_12_100000_create_password_resets_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_03_08_110009_create_categories_table', 1),
(11, '2022_03_11_020052_create_products_table', 2),
(12, '2022_03_12_023801_create_slides_table', 3),
(13, '2022_03_13_100003_create_customers_table', 4),
(14, '2022_03_13_100022_create_carts_table', 4),
(15, '2022_03_13_113240_create_jobs_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `price_sale` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `desc`, `content`, `thumb`, `price`, `price_sale`, `category_id`, `active`, `created_at`, `updated_at`) VALUES
(5, 'iPhone 13 Pro Max 512GB', 'Điện thoại iPhone 13 Pro Max 512GB với bộ nhớ lưu trữ ấn tượng cùng dung lượng pin cao góp phần mang đến những trải nghiệm vượt trội cho người dùng. Cùng với hiệu năng hoạt động mạnh mẽ góp phần gia tăng trải nghiệm vượt trội cho người dùng', '<p>&nbsp;</p>\r\n\r\n<p>Hiệu năng vượt trội - Chip Apple A15 Bionic mạnh mẽ, hỗ trợ mạng 5G tốc độ cao</p>\r\n\r\n<p>Kh&ocirc;ng gian hiển thị sống động - M&agrave;n h&igrave;nh 6.7&quot; Super Retina XDR độ s&aacute;ng cao, sắc n&eacute;t</p>\r\n\r\n<p>Trải nghiệm điện ảnh đỉnh cao - Cụm 3 camera 12MP, hỗ trợ ổn định h&igrave;nh ảnh quang học</p>\r\n\r\n<p>Tối ưu điện năng - Sạc nhanh 20 W, đầy 50% pin trong khoảng 30 ph&uacute;t</p>', '/storage/uploads/2022/03/12/iphone_13-_pro-3_2_1_1.jpg', 2200000, 2000000, 19, 1, '2022-03-12 04:06:21', '2022-03-12 04:06:21'),
(6, 'iPhone 13 Pro 512GB', 'Điện thoại iPhone 13 Pro 512GB được thiết kế với dung lượng bộ nhớ cao, lên đến 512GB giúp người dùng có thể thoải mái lưu trữ dữ liệu, thông tin. Cùng với con chip A15 Bionic mạnh mẽ, góp phần gia tăng khả năng xử lý đồ họa một cách ấn tượng, góp phần tạo nên điểm nhấn độc đáo cho người dùng.\r\nHãy cùng tham khảo thêm thông tin về iPhone 13 Pro 1TB ấn tượng, đẳng cấp cùng khả năng xử lý vượt trội', '<p><strong><a href=\"https://cellphones.com.vn/iphone-13-pro.html\" target=\"_blank\">Điện thoại iPhone 13 Pro</a>&nbsp;512GB</strong>&nbsp;được thiết kế với dung lượng bộ nhớ cao, l&ecirc;n đến 512GB gi&uacute;p người d&ugrave;ng c&oacute; thể thoải m&aacute;i lưu trữ dữ liệu, th&ocirc;ng tin. C&ugrave;ng với con chip A15 Bionic mạnh mẽ, g&oacute;p phần gia tăng khả năng xử l&yacute; đồ họa một c&aacute;ch ấn tượng, g&oacute;p phần tạo n&ecirc;n điểm nhấn độc đ&aacute;o cho người d&ugrave;ng.<br />\r\nH&atilde;y c&ugrave;ng tham khảo th&ecirc;m th&ocirc;ng tin về&nbsp;<a href=\"https://cellphones.com.vn/iphone-13-pro-1tb.html\" target=\"_blank\">iPhone 13 Pro 1TB</a>&nbsp;ấn tượng, đẳng cấp c&ugrave;ng khả năng xử l&yacute; vượt trội</p>', '/storage/uploads/2022/03/12/iphone_13-_pro-2_1_1.jpg', 38000000, 35000000, 19, 1, '2022-03-12 04:07:56', '2022-03-12 04:07:56'),
(7, 'iPhone 13 512GB', 'Điện thoại iPhone 13 512GB được nhiều khách hàng, người dùng yêu thích nhờ bộ nhớ cao, dung lượng pin lớn cùng tốc độ vượt trội giúp gia tăng khả năng xử lý của điện thoại một cách đáng kể, mang lại trải nghiệm ấn tượng cho người dùng.', '<p><strong><a href=\"https://cellphones.com.vn/iphone-13.html\" target=\"_blank\">Điện thoại iPhone 13</a>&nbsp;512GB</strong>&nbsp;được nhiều kh&aacute;ch h&agrave;ng, người d&ugrave;ng y&ecirc;u th&iacute;ch nhờ bộ nhớ cao, dung lượng pin lớn c&ugrave;ng tốc độ vượt trội gi&uacute;p gia tăng khả năng xử l&yacute; của điện thoại một c&aacute;ch đ&aacute;ng kể, mang lại trải nghiệm ấn tượng cho người d&ugrave;ng.</p>\r\n\r\n<p><strong><a href=\"https://cellphones.com.vn/iphone-13.html\" target=\"_blank\">Điện thoại iPhone 13</a>&nbsp;512GB</strong>&nbsp;được nhiều kh&aacute;ch h&agrave;ng, người d&ugrave;ng y&ecirc;u th&iacute;ch nhờ bộ nhớ cao, dung lượng pin lớn c&ugrave;ng tốc độ vượt trội gi&uacute;p gia tăng khả năng xử l&yacute; của điện thoại một c&aacute;ch đ&aacute;ng kể, mang lại trải nghiệm ấn tượng cho người d&ugrave;ng.</p>\r\n\r\n<p><strong><a href=\"https://cellphones.com.vn/iphone-13.html\" target=\"_blank\">Điện thoại iPhone 13</a>&nbsp;512GB</strong>&nbsp;được nhiều kh&aacute;ch h&agrave;ng, người d&ugrave;ng y&ecirc;u th&iacute;ch nhờ bộ nhớ cao, dung lượng pin lớn c&ugrave;ng tốc độ vượt trội gi&uacute;p gia tăng khả năng xử l&yacute; của điện thoại một c&aacute;ch đ&aacute;ng kể, mang lại trải nghiệm ấn tượng cho người d&ugrave;ng.</p>\r\n\r\n<p><strong><a href=\"https://cellphones.com.vn/iphone-13.html\" target=\"_blank\">Điện thoại iPhone 13</a>&nbsp;512GB</strong>&nbsp;được nhiều kh&aacute;ch h&agrave;ng, người d&ugrave;ng y&ecirc;u th&iacute;ch nhờ bộ nhớ cao, dung lượng pin lớn c&ugrave;ng tốc độ vượt trội gi&uacute;p gia tăng khả năng xử l&yacute; của điện thoại một c&aacute;ch đ&aacute;ng kể, mang lại trải nghiệm ấn tượng cho người d&ugrave;ng.</p>\r\n\r\n<p><strong><a href=\"https://cellphones.com.vn/iphone-13.html\" target=\"_blank\">Điện thoại iPhone 13</a>&nbsp;512GB</strong>&nbsp;được nhiều kh&aacute;ch h&agrave;ng, người d&ugrave;ng y&ecirc;u th&iacute;ch nhờ bộ nhớ cao, dung lượng pin lớn c&ugrave;ng tốc độ vượt trội gi&uacute;p gia tăng khả năng xử l&yacute; của điện thoại một c&aacute;ch đ&aacute;ng kể, mang lại trải nghiệm ấn tượng cho người d&ugrave;ng.</p>', '/storage/uploads/2022/03/12/iphone-13-02_4.jpg', 38000000, 35000000, 19, 1, '2022-03-12 04:09:01', '2022-03-12 04:09:01'),
(8, 'Samsung Galaxy S22 Plus (8GB + 128GB)', 'Tiếp nối sự thành công của Galaxy S21 Plus thì Samsung lại chuẩn bị ra mắt siêu phẩm mới trong năm 2022, đó chính là Samsung S22 Plus. Đây được coi là một kỳ quan mà người dùng có thể trải nghiệm thiết kế ấn tượng, hiệu năng mạnh mẽ với những công nghệ hàng đầu, cùng với đó là camera vô cùng độc đáo mà bạn chưa từng được chiêm ngưỡng.', '<h2><strong>Điện thoại Samsung Galaxy S22 Plus</strong><strong>&nbsp;</strong><strong>&ndash; Hiệu năng ấn tượng</strong></h2>\r\n\r\n<p>Tiếp nối sự th&agrave;nh c&ocirc;ng của Galaxy S21 Plus th&igrave; Samsung lại chuẩn bị ra mắt si&ecirc;u phẩm mới trong năm 2022, đ&oacute; ch&iacute;nh l&agrave;&nbsp;<strong>Samsung S22 Plus</strong>. Đ&acirc;y được coi l&agrave; một kỳ quan m&agrave; người d&ugrave;ng c&oacute; thể trải nghiệm thiết kế ấn tượng, hiệu năng mạnh mẽ với những c&ocirc;ng nghệ h&agrave;ng đầu, c&ugrave;ng với đ&oacute; l&agrave; camera v&ocirc; c&ugrave;ng độc đ&aacute;o m&agrave; bạn chưa từng được chi&ecirc;m ngưỡng.</p>\r\n\r\n<h3><strong>Thiết kế ấn tượng, tinh tế</strong></h3>\r\n\r\n<p>Galaxy S22 Plus sở hữu thiết kế v&ocirc; c&ugrave;ng ấn tượng tương tự như tr&ecirc;n phi&ecirc;n bản S21 Plus trước đ&oacute;. Với thiết kế khung viền Armor Aluminum chất lượng cao, mặt k&iacute;nh Corning&reg; Gorilla&reg; Glass Victus&reg;+ từng chi tiết được ho&agrave;n thiện một c&aacute;ch tỉ mỉ v&agrave; tinh tế. N&oacute; mang đến sự mềm mại v&agrave; v&ocirc; c&ugrave;ng kh&eacute;o l&eacute;o ở mọi g&oacute;c cạnh, vừa tăng độ sang trọng, vừa bảo vệ m&aacute;y được an to&agrave;n hơn.</p>', '/storage/uploads/2022/03/12/s22_4_1.jpg', 38000000, 35000000, 20, 1, '2022-03-12 04:10:40', '2022-03-12 04:10:40'),
(9, 'Samsung Galaxy S22 (8GB - 128GB)', 'Samsung S22 là một trong những cái tên đáng được mong chờ nhất trong thời điểm hiện tại dự kiến sẽ trình làng trong thời gian sắp tới. Sở hữu thiết kế mỏng cùng hiệu năng mạnh mẽ hứa hẹn đây sẽ là chiếc smartphone làm mưa làm gió trên thị trường ngay từ khi được ra mắt. Đây sẽ là sự lựa chọn không thể nào thích hợp hơn dành cho bạn.', '<h2><strong>Điện thoại Samsung Galaxy S22 - Sang trọng, hi&ecirc;̣u năng khủng</strong></h2>\r\n\r\n<p><strong>Samsung S22</strong>&nbsp;là m&ocirc;̣t trong những cái t&ecirc;n đáng được mong chờ nh&acirc;́t trong thời đi&ecirc;̉m hi&ecirc;̣n tại dự ki&ecirc;́n sẽ tr&igrave;nh làng trong thời gian sắp tới. Sở hữu thi&ecirc;́t k&ecirc;́ mỏng cùng hi&ecirc;̣u năng mạnh mẽ hứa hẹn đ&acirc;y sẽ là chi&ecirc;́c smartphone làm mưa làm gió tr&ecirc;n thị trường ngay từ khi được ra mắt. Đ&acirc;y sẽ là sự lựa chọn kh&ocirc;ng th&ecirc;̉ nào thích hợp hơn dành cho bạn.</p>\r\n\r\n<p>B&ecirc;n cạnh Galaxy S22 ti&ecirc;u chuẩn, g&atilde; khổng lồ H&agrave;n Quốc c&ograve;n cho ra mắt th&ecirc;m 2 phi&ecirc;n bản cao cấp hơn đ&oacute; l&agrave; Galaxy S22 Plus v&agrave;&nbsp;<a href=\"https://cellphones.com.vn/samsung-galaxy-s22-ultra.html\">Galaxy S22 Ultra</a>&nbsp;với nhiều cải tiến về thiết kế, cấu h&igrave;nh lẫn camera.</p>\r\n\r\n<h3><strong>Thi&ecirc;́t k&ecirc;́ nguy&ecirc;n kh&ocirc;́i, màn hình Dynamic AMOLED 6.1 sắc nét</strong></h3>\r\n\r\n<p>Điện thoại Galaxy S22 sở hữu thi&ecirc;́t k&ecirc;́ nguy&ecirc;n kh&ocirc;́i cứng cáp và b&ecirc;̀n bỉ tuy nhi&ecirc;n mỏng hơn người đàn anh ti&ecirc;̀n nghi&ecirc;̣m của mình là Galaxy S21. Tuy nhi&ecirc;n các đường nét thi&ecirc;́t k&ecirc;́ được thừa hưởng v&acirc;̃n kh&ocirc;ng khác nhau là m&acirc;́y. Các chi ti&ecirc;́t được hoàn thi&ecirc;̣n tỉ mỉ chính xác và trau chu&ocirc;́t từng góc cạnh mang lại m&ocirc;̣t t&ocirc;̉ng th&ecirc;̉ sang trọng bắt mắt và tinh t&ecirc;́.</p>\r\n\r\n<p>Mặt lưng có thi&ecirc;́t k&ecirc;́ bóng b&acirc;̉y d&ecirc;̃ dàng thu hút người dùng ngay từ cái nhìn đ&acirc;̀u ti&ecirc;n nhìn vào Samsung Galaxy S22.</p>', '/storage/uploads/2022/03/12/sm-s901_galaxys22_front_pinkgold_211122.jpg', 38000000, 35000000, 20, 1, '2022-03-12 04:12:17', '2022-03-12 04:12:17'),
(10, 'Xiaomi Mi 11 Lite 5G', 'Mi 11 Lite 5G và 4G là bộ đôi vừa được Xiaomi trình làng. So sánh nhanh thì cả hai máy sở hữu cùng kích thước màn hình, thông số cụm camera sau và dung lượng pin. Nhưng bên cạnh đó thì phiên bản 5G vẫn còn một số điểm khác biệt so với bản 4G.', '<h2><strong>So s&aacute;nh nhanh Xiaomi Mi 11 Lite 5G v&agrave; phi&ecirc;n bản 4G</strong></h2>\r\n\r\n<p><strong>Mi 11 Lite 5G</strong>&nbsp;v&agrave; 4G l&agrave; bộ đ&ocirc;i vừa được Xiaomi tr&igrave;nh l&agrave;ng. So s&aacute;nh nhanh th&igrave; cả hai m&aacute;y sở hữu c&ugrave;ng k&iacute;ch thước m&agrave;n h&igrave;nh, th&ocirc;ng số cụm camera sau v&agrave; dung lượng pin. Nhưng b&ecirc;n cạnh đ&oacute; th&igrave; phi&ecirc;n bản 5G vẫn c&ograve;n một số điểm kh&aacute;c biệt so với bản 4G.</p>', '/storage/uploads/2022/03/12/xiaomi-mi-11-lite-5g-2_10.png', 38000000, 20000000, 21, 1, '2022-03-12 04:14:00', '2022-03-12 04:14:00'),
(11, 'Apple iPad Pro 11 2021 M1 WiFi 128GB', 'Như thường lệ hằng năm Apple lại cho ra mắt chiếc máy tính bảng của mình. iPad Pro 2021 phiên bản 11 inch hứa hẹn mang đến một trải nghiệm mạnh vẽ với nhiều tính năng nổi bật.', '<h2><strong>iPad Pro 2021 11 inch &ndash; Tablet cấu m&igrave;nh mạnh với chip M1 mới</strong></h2>\r\n\r\n<p>Như thường lệ hằng năm Apple lại cho ra mắt chiếc m&aacute;y t&iacute;nh bảng của m&igrave;nh.&nbsp;<strong>iPad Pro&nbsp;2021&nbsp;</strong>phi&ecirc;n bản&nbsp;11 inch hứa hẹn mang đến một trải nghiệm mạnh vẽ với nhiều t&iacute;nh năng nổi bật.</p>\r\n\r\n<h3><strong>Thiết kế vu&ocirc;ng vức sang trọng, m&agrave;n h&igrave;nh 11 inch</strong></h3>\r\n\r\n<p>iPad Pro 11 inch 2021 sở hữu ngoại h&igrave;nh mang nhiều điểm tương tự về ngoại h&igrave;nh với chiếc iPad Pro trước đ&oacute;.&nbsp;<a href=\"https://cellphones.com.vn/tablet/ipad-pro.html\">Apple iPad Pro 2021</a>&nbsp;sử dụng m&agrave;n h&igrave;nh k&iacute;ch thước 11 inch v&agrave; sử dụng m&agrave;n h&igrave;nh LCD truyền thống.&nbsp; M&agrave;n h&igrave;nh tr&ecirc;n iPad Pro 2021 n&agrave;y với c&ocirc;ng nghệ m&agrave;u&nbsp;ProMotion c&ugrave;ng độ ph&acirc;n giải cao&nbsp;264 pixel mỗi inch. M&agrave;n h&igrave;nh n&agrave;y cũng được trang bị lớp phủ chống b&aacute;m v&acirc;n tay v&agrave; chống phản xạ, n&acirc;ng cao trải nghiệm cho người d&ugrave;ng.</p>', '/storage/uploads/2022/03/12/ipad-pro-11-2021-1_2.jpg', 27500000, 20000000, 22, 1, '2022-03-12 04:15:47', '2022-03-12 04:15:47'),
(12, 'iPad Air 10.9 2020 WiFi 64GB', 'Apple luôn khiến cho cộng đồng công nghệ đứng ngồi không yên mỗi khi cho giới thiệu sản phẩm mới. iPad Air 4 được ra mắt tại sự kiện mà các tín đồ công nghệ nghĩ rằng Apple sẽ trình làng dòng điện thoại iPhone 12 2020, nhưng chiếc tablet này mới chính là nhân vật chính. iPad Air thế hệ 2020 mang những thay đổi về mặt thiết kế cũng như những tính năng mới được tích hợp để tối ưu hóa về hiệu năng, mang đến cho người dùng những trải nghiệm tốt hơn. ', '<h2><strong>iPad Air 4 2020 &ndash; Chip A14 mạnh mẽ cho trải nghiệm ho&agrave;n hảo</strong></h2>\r\n\r\n<p>Apple lu&ocirc;n khiến cho cộng đồng c&ocirc;ng nghệ đứng ngồi kh&ocirc;ng y&ecirc;n mỗi khi cho giới thiệu sản phẩm mới.&nbsp;<strong>iPad Air 4</strong>&nbsp;được ra mắt tại sự kiện m&agrave; c&aacute;c t&iacute;n đồ c&ocirc;ng nghệ nghĩ rằng Apple sẽ tr&igrave;nh l&agrave;ng d&ograve;ng&nbsp;<a href=\"https://cellphones.com.vn/iphone-12.html\">điện thoại iPhone 12 2020</a>,&nbsp;nhưng chiếc tablet n&agrave;y mới ch&iacute;nh l&agrave; nh&acirc;n vật ch&iacute;nh. iPad Air thế hệ 2020&nbsp;mang những thay đổi về mặt thiết kế cũng như những t&iacute;nh năng mới được t&iacute;ch hợp để tối ưu h&oacute;a về hiệu năng, mang đến cho người d&ugrave;ng những trải nghiệm tốt hơn.&nbsp;</p>\r\n\r\n<p>Ngo&agrave;i ra, bạn cũng c&oacute; thể tham khảo th&ecirc;m&nbsp;<a href=\"https://cellphones.com.vn/ipad-air-5.html\">iPad Air 5</a>&nbsp;sắp ra mắt dự kiến sẽ c&oacute; nhiều n&acirc;ng cấp ấn tượng.</p>\r\n\r\n<h3><strong>Thiết kế tinh tế, m&agrave;u sắc thời thượng với độ mỏng 6.1mm</strong></h3>\r\n\r\n<p>M&aacute;y t&iacute;nh bảng iPad Air 2020 sẽ c&oacute; thiết kế ho&agrave;n to&agrave;n mới với kiểu d&aacute;ng tương tự với iPad Pro 2020 nhưng với k&iacute;ch thước nhỏ gọn hơn 247.6 x 178.5 mm v&agrave; độ mỏng chỉ 6.1 mm c&ugrave;ng trọng lượng chưa đến 500g gi&uacute;p bạn dễ d&agrave;ng mang theo iPad để sử dụng ở bất cứ đ&acirc;u.</p>\r\n\r\n<p>Thiết kế nguy&ecirc;n khối mang đến tổng thể sang trọng cho&nbsp;<a href=\"https://cellphones.com.vn/tablet/ipad-air.html\">iPad Air</a>&nbsp;4 c&ugrave;ng với gam m&agrave;u mới thời thượng, n&uacute;t home được loại bỏ để tạo n&ecirc;n kh&ocirc;ng gian hiển thị rộng hơn.</p>', '/storage/uploads/2022/03/12/ipad-air-2020-green.jpg', 38000000, 30000000, 23, 1, '2022-03-12 04:17:35', '2022-03-12 04:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_by` int(11) NOT NULL,
  `active` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `name`, `url`, `thumb`, `sort_by`, `active`, `created_at`, `updated_at`) VALUES
(6, 'Điện thoại', 'aaaaaaaaaaaaaaa', '/storage/uploads/2022/03/12/pngtree-cool-new-mobile-phone-promotion-purple-banner-image_183067.jpg', 1, 1, '2022-03-12 04:58:10', '2022-03-12 05:14:59'),
(7, 'Tablet', 'bbbbbbbbbbbbbbbb', '/storage/uploads/2022/03/12/06152021_galaxy_STORY_LEVEL_BANNER_1600x483.jpg', 2, 1, '2022-03-12 04:58:24', '2022-03-12 05:16:06'),
(8, 'Laptop', 'ggggggggggggg', '/storage/uploads/2022/03/12/images.jpg', 3, 1, '2022-03-12 04:58:39', '2022-03-12 05:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@localhost.com', NULL, '$2y$10$SKrNN2IjjMZePK0MTf.sAOnLLAGL.pohmrdNIQX1HlDFGoqKchqCW', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
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
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

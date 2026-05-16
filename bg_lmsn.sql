-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2026 at 02:26 AM
-- Server version: 12.1.2-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bg_lmsn`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_address`
--

CREATE TABLE `accounts_address` (
  `id` bigint(20) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `user_id` uuid NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_address`
--

INSERT INTO `accounts_address` (`id`, `country`, `address_line_1`, `city`, `state`, `is_default`, `user_id`) VALUES
(1, 'USA', '1st okuta avenue', 'Port-Harcourt', 'Rivers', 0, '739e68c0-c463-422d-b7f1-023f79566e65'),
(2, 'Nigeria', 'Plot 6 avenue GRA', 'Lagos', 'Lagos', 0, '83e3be64-d57e-4c22-9d79-54cb2c806868');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_customuser`
--

CREATE TABLE `accounts_customuser` (
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `id` uuid NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `full_name` varchar(60) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_client` tinyint(1) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL,
  `is_online` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `assigned_to_id` uuid DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_customuser`
--

INSERT INTO `accounts_customuser` (`password`, `last_login`, `is_superuser`, `id`, `email`, `username`, `first_name`, `last_name`, `full_name`, `mobile`, `is_active`, `is_staff`, `is_client`, `is_subscribed`, `is_online`, `date_joined`, `ip_address`, `region`, `profile_image`, `assigned_to_id`, `department_id`, `position_id`) VALUES
('pbkdf2_sha256$1200000$aaEnznYg0ZVITenKeUpg4X$SSqW4NCL0p0hkzuzoDLWp4mn0egN3X15zw/5GO2ajJo=', '2026-05-10 22:58:39.187400', 0, '739e68c0-c463-422d-b7f1-023f79566e65', 'techwiszard@gmail.com', 'Inimoney234', 'inimoney', 'okun uya', 'inimoney okun uya', '+234 7047137084', 1, 0, 1, 1, 1, '2026-04-23 08:05:16.996069', NULL, NULL, '', NULL, NULL, NULL),
('pbkdf2_sha256$1200000$QHP1OyhkMnyHtFCIwhO9A4$WRuvamdJ/7DP+Z8PixVcT9Fl0oMFXoXybrdwO+6XYAo=', '2026-05-10 12:26:00.442812', 1, '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360', 'belldivine070@gmail.com', 'belldivine070', 'DIVINE', 'BELL-GAM', 'DIVINE BELL-GAM', NULL, 1, 1, 0, 1, 1, '2026-03-24 16:09:16.890728', NULL, NULL, '', NULL, 1, 1),
('pbkdf2_sha256$1200000$967lIusdIX8gY8MELyFeAD$vQZtnyySv8WlIp9BLEI4/sCZhBloUkIfHTNOQ3XDC/c=', '2026-05-10 22:58:24.975807', 0, '83e3be64-d57e-4c22-9d79-54cb2c806868', 'chisom119@gmail.com', 'chisom119', 'chisom', 'Bell-Gam', 'chisom Bell-Gam', '4567890', 1, 0, 1, 1, 1, '2026-04-26 00:05:34.713682', NULL, NULL, '', NULL, NULL, NULL),
('pbkdf2_sha256$1200000$MmhZRnhj3ao2w8oZqgRYK7$vicXe82xHmopJGKYwjoTo7zcU9tvXQ8c0CZSM28R74Y=', NULL, 0, '6609cdaa-a903-47bd-b7a5-7e4a60f2774b', 'belldivine080@gmail.com', '', 'jfdb', 'vjdfb', 'jfdb vjdfb', '456789', 1, 0, 1, 1, 0, '2026-04-25 23:53:00.696817', NULL, NULL, '', NULL, NULL, NULL),
('pbkdf2_sha256$1200000$o2Mh4wicfYS2o6OhHFt6g4$WiYS10awWE+26G02LKG+KgQq7kPVSUPu165M1srSRKM=', '2026-05-10 19:09:27.726206', 0, '9e52070e-7516-4433-9cfc-8244e6580ab8', 'favourbell@gmail.com', 'favourite02', 'Favour', 'Bell-Gam', 'Favour Bell-Gam', '456789', 1, 0, 1, 1, 0, '2026-05-10 18:35:03.355529', NULL, NULL, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_customuser_groups`
--

CREATE TABLE `accounts_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` uuid NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_customuser_user_permissions`
--

CREATE TABLE `accounts_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` uuid NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_department`
--

CREATE TABLE `accounts_department` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `contact_email` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_department`
--

INSERT INTO `accounts_department` (`id`, `name`, `slug`, `contact_email`) VALUES
(1, 'Administration', 'administration', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_department_permissions`
--

CREATE TABLE `accounts_department_permissions` (
  `id` bigint(20) NOT NULL,
  `department_id` bigint(20) NOT NULL,
  `rolepermission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_position`
--

CREATE TABLE `accounts_position` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_position`
--

INSERT INTO `accounts_position` (`id`, `name`, `slug`, `description`) VALUES
(1, 'Super Admin', 'super_admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_position_permissions`
--

CREATE TABLE `accounts_position_permissions` (
  `id` bigint(20) NOT NULL,
  `position_id` bigint(20) NOT NULL,
  `rolepermission_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_rolepermission`
--

CREATE TABLE `accounts_rolepermission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_variables`
--

CREATE TABLE `app_variables` (
  `ID` int(11) NOT NULL,
  `var_name` varchar(55) NOT NULL,
  `var_value` varchar(95) NOT NULL,
  `description` varchar(120) NOT NULL,
  `isreadonly` tinyint(1) NOT NULL DEFAULT 0,
  `lastupdated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `app_variables`
--

INSERT INTO `app_variables` (`ID`, `var_name`, `var_value`, `description`, `isreadonly`, `lastupdated`) VALUES
(1, 'APP_NAME', 'LSMN LIMITED', '', 0, '2018-08-27 22:29:10'),
(2, 'SLOGAN', '', '', 0, '2018-08-27 22:29:10'),
(3, 'APP_PORTAL', 'https://www.lmsnlimited.com/login', '', 0, '2018-08-27 22:33:03'),
(4, 'APP_SHORTCODE', 'LMSN', '', 0, '2018-08-27 22:24:27'),
(5, 'APP_SMSEMAIL', 'info@lmsnlimited.com', '', 0, '2018-08-27 22:24:27'),
(6, 'APP_SMSAPI', 'LMSNAPI', '', 0, '2018-08-27 22:25:28'),
(7, 'APP_SMSPWD', 'ClarkKent#93', '', 0, '2018-08-27 22:29:10'),
(8, 'APP_SMSNAME', 'LMSN', '', 0, '2018-08-27 22:29:10'),
(9, 'APP_EMAIL', 'admin@lmsnlimited.com', 'Email Address That Will Be Used To Send Messages To Clients', 0, '2018-08-27 22:29:10'),
(10, 'APP_EMAILPWD', 'LMSltd#Z4A18', '', 0, '2018-08-27 22:29:10'),
(11, 'APP_MOBILE', '+234 810 545 2468', '', 0, '2018-08-27 22:29:10'),
(12, 'CONTACT_ADDRESS', '39 Shedrack Avenue, Elelewon, PHC', 'Buguma Address', 0, '2018-08-27 22:29:10'),
(13, 'OFFICIAL_EMAIL', 'info@flocareintschool.com', '', 0, '2018-08-27 22:24:27'),
(14, 'FACEBOOK', 'javascript:;', 'Facebook Handle', 0, '2018-08-27 22:29:10'),
(15, 'INSTAGRAM', 'javascript:;', 'Instagram Handle', 0, '2018-08-27 22:29:10'),
(16, 'YOUTUBE', 'javascript:;', 'Youtube Handle', 0, '2018-08-27 22:24:27'),
(17, 'CONTACT_PERSON1', '+234 810 545 2468', '', 0, '2018-08-27 22:29:10'),
(18, 'CONTACT_PERSON2', '+2347072596564', '', 0, '2018-08-27 22:29:10'),
(19, 'CONTACT_PERSON3', '', '', 0, '2018-08-27 22:24:27'),
(20, 'SITE_HITS', '25946', 'Number Of Times The Site Has Been Visited', 0, '2018-08-27 22:24:27'),
(21, 'TWITTER', 'javascript:;', 'Twitter Handle', 0, '2018-08-27 22:29:10'),
(22, 'LINKEDIN', 'javascript:;', 'Linkedin Handle', 0, '2018-08-27 22:24:27'),
(23, 'CONTACT_PERSON4', '+2348105452468', 'For Whatsapp Link', 0, '2018-08-27 22:24:27'),
(24, 'SITE_URL', 'https://www.lmsnlimited.com', 'website', 0, '2018-08-27 22:24:27'),
(25, 'GOOGLE', '', 'Your google handle link', 0, '2026-04-20 15:50:03');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add attachment', 1, 'add_attachment'),
(2, 'Can change attachment', 1, 'change_attachment'),
(3, 'Can delete attachment', 1, 'delete_attachment'),
(4, 'Can view attachment', 1, 'view_attachment'),
(5, 'Can add department', 4, 'add_department'),
(6, 'Can change department', 4, 'change_department'),
(7, 'Can delete department', 4, 'delete_department'),
(8, 'Can view department', 4, 'view_department'),
(9, 'Can add User Role', 5, 'add_position'),
(10, 'Can change User Role', 5, 'change_position'),
(11, 'Can delete User Role', 5, 'delete_position'),
(12, 'Can view User Role', 5, 'view_position'),
(13, 'Can add role permission', 6, 'add_rolepermission'),
(14, 'Can change role permission', 6, 'change_rolepermission'),
(15, 'Can delete role permission', 6, 'delete_rolepermission'),
(16, 'Can view role permission', 6, 'view_rolepermission'),
(17, 'Can add custom user', 3, 'add_customuser'),
(18, 'Can change custom user', 3, 'change_customuser'),
(19, 'Can delete custom user', 3, 'delete_customuser'),
(20, 'Can view custom user', 3, 'view_customuser'),
(21, 'Can add address', 2, 'add_address'),
(22, 'Can change address', 2, 'change_address'),
(23, 'Can delete address', 2, 'delete_address'),
(24, 'Can view address', 2, 'view_address'),
(25, 'Can add payment', 7, 'add_payment'),
(26, 'Can change payment', 7, 'change_payment'),
(27, 'Can delete payment', 7, 'delete_payment'),
(28, 'Can view payment', 7, 'view_payment'),
(29, 'Can add payment history', 8, 'add_paymenthistory'),
(30, 'Can change payment history', 8, 'change_paymenthistory'),
(31, 'Can delete payment history', 8, 'delete_paymenthistory'),
(32, 'Can view payment history', 8, 'view_paymenthistory'),
(33, 'Can add refund', 9, 'add_refund'),
(34, 'Can change refund', 9, 'change_refund'),
(35, 'Can delete refund', 9, 'delete_refund'),
(36, 'Can view refund', 9, 'view_refund'),
(37, 'Can add Brand', 10, 'add_brand'),
(38, 'Can change Brand', 10, 'change_brand'),
(39, 'Can delete Brand', 10, 'delete_brand'),
(40, 'Can view Brand', 10, 'view_brand'),
(41, 'Can add Product Category', 12, 'add_productcategory'),
(42, 'Can change Product Category', 12, 'change_productcategory'),
(43, 'Can delete Product Category', 12, 'delete_productcategory'),
(44, 'Can view Product Category', 12, 'view_productcategory'),
(45, 'Can add product', 11, 'add_product'),
(46, 'Can change product', 11, 'change_product'),
(47, 'Can delete product', 11, 'delete_product'),
(48, 'Can view product', 11, 'view_product'),
(49, 'Can add product media', 14, 'add_productmedia'),
(50, 'Can change product media', 14, 'change_productmedia'),
(51, 'Can delete product media', 14, 'delete_productmedia'),
(52, 'Can view product media', 14, 'view_productmedia'),
(53, 'Can add product variant', 16, 'add_productvariant'),
(54, 'Can change product variant', 16, 'change_productvariant'),
(55, 'Can delete product variant', 16, 'delete_productvariant'),
(56, 'Can view product variant', 16, 'view_productvariant'),
(57, 'Can add product inventory', 13, 'add_productinventory'),
(58, 'Can change product inventory', 13, 'change_productinventory'),
(59, 'Can delete product inventory', 13, 'delete_productinventory'),
(60, 'Can view product inventory', 13, 'view_productinventory'),
(61, 'Can add Supplier', 17, 'add_supplier'),
(62, 'Can change Supplier', 17, 'change_supplier'),
(63, 'Can delete Supplier', 17, 'delete_supplier'),
(64, 'Can view Supplier', 17, 'view_supplier'),
(65, 'Can add product review', 15, 'add_productreview'),
(66, 'Can change product review', 15, 'change_productreview'),
(67, 'Can delete product review', 15, 'delete_productreview'),
(68, 'Can view product review', 15, 'view_productreview'),
(69, 'Can add variant attribute', 18, 'add_variantattribute'),
(70, 'Can change variant attribute', 18, 'change_variantattribute'),
(71, 'Can delete variant attribute', 18, 'delete_variantattribute'),
(72, 'Can view variant attribute', 18, 'view_variantattribute'),
(73, 'Can add order', 19, 'add_order'),
(74, 'Can change order', 19, 'change_order'),
(75, 'Can delete order', 19, 'delete_order'),
(76, 'Can view order', 19, 'view_order'),
(77, 'Can add order item', 20, 'add_orderitem'),
(78, 'Can change order item', 20, 'change_orderitem'),
(79, 'Can delete order item', 20, 'delete_orderitem'),
(80, 'Can view order item', 20, 'view_orderitem'),
(81, 'Can add wishlist', 23, 'add_wishlist'),
(82, 'Can change wishlist', 23, 'change_wishlist'),
(83, 'Can delete wishlist', 23, 'delete_wishlist'),
(84, 'Can view wishlist', 23, 'view_wishlist'),
(85, 'Can add cart', 21, 'add_cart'),
(86, 'Can change cart', 21, 'change_cart'),
(87, 'Can delete cart', 21, 'delete_cart'),
(88, 'Can view cart', 21, 'view_cart'),
(89, 'Can add cart item', 22, 'add_cartitem'),
(90, 'Can change cart item', 22, 'change_cartitem'),
(91, 'Can delete cart item', 22, 'delete_cartitem'),
(92, 'Can view cart item', 22, 'view_cartitem'),
(93, 'Can add System Setting', 25, 'add_appvariable'),
(94, 'Can change System Setting', 25, 'change_appvariable'),
(95, 'Can delete System Setting', 25, 'delete_appvariable'),
(96, 'Can view System Setting', 25, 'view_appvariable'),
(97, 'Can add Content Type (Category)', 28, 'add_category'),
(98, 'Can change Content Type (Category)', 28, 'change_category'),
(99, 'Can delete Content Type (Category)', 28, 'delete_category'),
(100, 'Can view Content Type (Category)', 28, 'view_category'),
(101, 'Can add contact us', 30, 'add_contactus'),
(102, 'Can change contact us', 30, 'change_contactus'),
(103, 'Can delete contact us', 30, 'delete_contactus'),
(104, 'Can view contact us', 30, 'view_contactus'),
(105, 'Can add external subscriber', 31, 'add_externalsubscriber'),
(106, 'Can change external subscriber', 31, 'change_externalsubscriber'),
(107, 'Can delete external subscriber', 31, 'delete_externalsubscriber'),
(108, 'Can view external subscriber', 31, 'view_externalsubscriber'),
(109, 'Can add media album', 32, 'add_mediaalbum'),
(110, 'Can change media album', 32, 'change_mediaalbum'),
(111, 'Can delete media album', 32, 'delete_mediaalbum'),
(112, 'Can view media album', 32, 'view_mediaalbum'),
(113, 'Can add news post', 34, 'add_newspost'),
(114, 'Can change news post', 34, 'change_newspost'),
(115, 'Can delete news post', 34, 'delete_newspost'),
(116, 'Can view news post', 34, 'view_newspost'),
(117, 'Can add activity log', 24, 'add_activitylog'),
(118, 'Can change activity log', 24, 'change_activitylog'),
(119, 'Can delete activity log', 24, 'delete_activitylog'),
(120, 'Can view activity log', 24, 'view_activitylog'),
(121, 'Can add Media Asset', 33, 'add_mediaasset'),
(122, 'Can change Media Asset', 33, 'change_mediaasset'),
(123, 'Can delete Media Asset', 33, 'delete_mediaasset'),
(124, 'Can view Media Asset', 33, 'view_mediaasset'),
(125, 'Can add category post', 29, 'add_categorypost'),
(126, 'Can change category post', 29, 'change_categorypost'),
(127, 'Can delete category post', 29, 'delete_categorypost'),
(128, 'Can view category post', 29, 'view_categorypost'),
(129, 'Can add banner', 26, 'add_banner'),
(130, 'Can change banner', 26, 'change_banner'),
(131, 'Can delete banner', 26, 'delete_banner'),
(132, 'Can view banner', 26, 'view_banner'),
(133, 'Can add broadcast log', 27, 'add_broadcastlog'),
(134, 'Can change broadcast log', 27, 'change_broadcastlog'),
(135, 'Can delete broadcast log', 27, 'delete_broadcastlog'),
(136, 'Can view broadcast log', 27, 'view_broadcastlog'),
(137, 'Can add page', 35, 'add_page'),
(138, 'Can change page', 35, 'change_page'),
(139, 'Can delete page', 35, 'delete_page'),
(140, 'Can view page', 35, 'view_page'),
(141, 'Can add security audit log', 36, 'add_securityauditlog'),
(142, 'Can change security audit log', 36, 'change_securityauditlog'),
(143, 'Can delete security audit log', 36, 'delete_securityauditlog'),
(144, 'Can view security audit log', 36, 'view_securityauditlog'),
(145, 'Can add widget', 37, 'add_widget'),
(146, 'Can change widget', 37, 'change_widget'),
(147, 'Can delete widget', 37, 'delete_widget'),
(148, 'Can view widget', 37, 'view_widget'),
(149, 'Can add widget post', 38, 'add_widgetpost'),
(150, 'Can change widget post', 38, 'change_widgetpost'),
(151, 'Can delete widget post', 38, 'delete_widgetpost'),
(152, 'Can view widget post', 38, 'view_widgetpost'),
(153, 'Can add log entry', 39, 'add_logentry'),
(154, 'Can change log entry', 39, 'change_logentry'),
(155, 'Can delete log entry', 39, 'delete_logentry'),
(156, 'Can view log entry', 39, 'view_logentry'),
(157, 'Can add permission', 41, 'add_permission'),
(158, 'Can change permission', 41, 'change_permission'),
(159, 'Can delete permission', 41, 'delete_permission'),
(160, 'Can view permission', 41, 'view_permission'),
(161, 'Can add group', 40, 'add_group'),
(162, 'Can change group', 40, 'change_group'),
(163, 'Can delete group', 40, 'delete_group'),
(164, 'Can view group', 40, 'view_group'),
(165, 'Can add content type', 42, 'add_contenttype'),
(166, 'Can change content type', 42, 'change_contenttype'),
(167, 'Can delete content type', 42, 'delete_contenttype'),
(168, 'Can view content type', 42, 'view_contenttype'),
(169, 'Can add session', 43, 'add_session'),
(170, 'Can change session', 43, 'change_session'),
(171, 'Can delete session', 43, 'delete_session'),
(172, 'Can view session', 43, 'view_session'),
(173, 'Can add tracking status', 45, 'add_trackingstatus'),
(174, 'Can change tracking status', 45, 'change_trackingstatus'),
(175, 'Can delete tracking status', 45, 'delete_trackingstatus'),
(176, 'Can view tracking status', 45, 'view_trackingstatus'),
(177, 'Can add order tracking', 44, 'add_ordertracking'),
(178, 'Can change order tracking', 44, 'change_ordertracking'),
(179, 'Can delete order tracking', 44, 'delete_ordertracking'),
(180, 'Can view order tracking', 44, 'view_ordertracking'),
(181, 'Can add page section', 46, 'add_pagesection'),
(182, 'Can change page section', 46, 'change_pagesection'),
(183, 'Can delete page section', 46, 'delete_pagesection'),
(184, 'Can view page section', 46, 'view_pagesection'),
(185, 'Can add color', 47, 'add_color'),
(186, 'Can change color', 47, 'change_color'),
(187, 'Can delete color', 47, 'delete_color'),
(188, 'Can view color', 47, 'view_color'),
(189, 'Can add size', 48, 'add_size'),
(190, 'Can change size', 48, 'change_size'),
(191, 'Can delete size', 48, 'delete_size'),
(192, 'Can view size', 48, 'view_size');

-- --------------------------------------------------------

--
-- Table structure for table `cart_cart`
--

CREATE TABLE `cart_cart` (
  `id` bigint(20) NOT NULL,
  `session_key` varchar(40) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` uuid DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_cart`
--

INSERT INTO `cart_cart` (`id`, `session_key`, `created_at`, `updated_at`, `user_id`) VALUES
(20, NULL, '2026-05-10 22:10:46.025973', '2026-05-10 22:10:46.026031', '83e3be64-d57e-4c22-9d79-54cb2c806868'),
(21, NULL, '2026-05-10 22:25:00.816580', '2026-05-10 22:25:00.816626', '739e68c0-c463-422d-b7f1-023f79566e65');

-- --------------------------------------------------------

--
-- Table structure for table `cart_cartitem`
--

CREATE TABLE `cart_cartitem` (
  `id` bigint(20) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `price_at_addition` decimal(10,2) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `cart_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `variant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_cartitem`
--

INSERT INTO `cart_cartitem` (`id`, `quantity`, `price_at_addition`, `added_at`, `cart_id`, `product_id`, `variant_id`) VALUES
(40, 1, 2500.00, '2026-05-10 12:24:49.257772', 17, 7, NULL),
(41, 3, 100000.00, '2026-05-10 12:24:57.195034', 17, 14, 123);

-- --------------------------------------------------------

--
-- Table structure for table `cart_wishlist`
--

CREATE TABLE `cart_wishlist` (
  `id` bigint(20) NOT NULL,
  `added_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` uuid NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_wishlist`
--

INSERT INTO `cart_wishlist` (`id`, `added_at`, `product_id`, `user_id`) VALUES
(1, '2026-05-06 16:35:13.206080', 14, '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360'),
(2, '2026-05-08 08:44:37.619620', 7, '739e68c0-c463-422d-b7f1-023f79566e65'),
(3, '2026-05-08 09:55:24.146925', 7, '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360'),
(4, '2026-05-08 10:44:00.940587', 14, '739e68c0-c463-422d-b7f1-023f79566e65'),
(5, '2026-05-09 07:43:02.453125', 7, '83e3be64-d57e-4c22-9d79-54cb2c806868'),
(6, '2026-05-09 07:43:04.525156', 14, '83e3be64-d57e-4c22-9d79-54cb2c806868');

-- --------------------------------------------------------

--
-- Table structure for table `core_activitylog`
--

CREATE TABLE `core_activitylog` (
  `id` bigint(20) NOT NULL,
  `activity_type` varchar(20) NOT NULL,
  `description` longtext NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `user_agent` longtext DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` uuid NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_activitylog`
--

INSERT INTO `core_activitylog` (`id`, `activity_type`, `description`, `ip_address`, `user_agent`, `timestamp`, `user_id`) VALUES
(1, 'update', 'Updated category: Eva bottled water (No Asset)', '127.0.0.1', NULL, '2026-03-24 16:10:28.483784', '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360'),
(2, 'update', 'Updated category: Eva bottled water (Asset ID: 6)', '127.0.0.1', NULL, '2026-03-24 16:14:09.776678', '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360'),
(3, 'update', 'Updated widget: fhcdfhjh (Asset ID: 6)', '127.0.0.1', NULL, '2026-03-27 00:06:46.145806', '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360'),
(4, 'update', 'Updated widget: efeafwedsfd (Asset ID: 6)', '127.0.0.1', NULL, '2026-03-27 00:08:32.412197', '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360'),
(5, 'update', 'Updated category: chjghgcghgjh (Asset ID: 225)', '127.0.0.1', NULL, '2026-04-24 11:50:03.749181', '739e68c0-c463-422d-b7f1-023f79566e65'),
(6, 'update', 'Updated category: chjghgcghgjh (No Asset)', '127.0.0.1', NULL, '2026-04-24 11:50:19.537749', '739e68c0-c463-422d-b7f1-023f79566e65'),
(7, 'update', 'Updated widget: gfdfhgjnm (Asset ID: 224)', '127.0.0.1', NULL, '2026-04-24 11:51:35.012475', '739e68c0-c463-422d-b7f1-023f79566e65'),
(8, 'update', 'Updated category: Privacy Policy (No Asset)', '127.0.0.1', NULL, '2026-04-25 08:04:32.396843', '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360'),
(9, 'update', 'Updated category: Terms of Use (No Asset)', '127.0.0.1', NULL, '2026-04-25 08:09:05.191438', '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360'),
(10, 'update', 'Updated category: FAQ (No Asset)', '127.0.0.1', NULL, '2026-04-25 08:16:08.357109', '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360'),
(11, 'update', 'Updated category: Frequently asked question (No Asset)', '127.0.0.1', NULL, '2026-04-25 08:19:03.263109', '2f4e91bc-8ca5-4fbb-aab4-3224eaee5360');

-- --------------------------------------------------------

--
-- Table structure for table `core_appvariable`
--

CREATE TABLE `core_appvariable` (
  `id` bigint(20) NOT NULL,
  `var_name` varchar(100) NOT NULL,
  `var_value` longtext DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `isreadonly` tinyint(1) NOT NULL,
  `lastupdated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_appvariable`
--

INSERT INTO `core_appvariable` (`id`, `var_name`, `var_value`, `description`, `isreadonly`, `lastupdated`) VALUES
(1, 'APP_EMAIL', 'belldivine070@gmail.com', 'Email Address That Will Be Used To Send Messages To Clients', 0, '2025-11-20 22:44:00.000000'),
(2, 'APP_EMAILPWD', 'belldivine070', '', 0, '2025-11-20 22:44:00.000000'),
(3, 'APP_MOBILE', '', '', 0, '2025-11-20 22:44:00.000000'),
(4, 'APP_NAME', 'BG TECH', '', 0, '2025-11-20 22:44:00.000000'),
(5, 'APP_PORTAL', '', '', 0, '2025-11-20 22:44:00.000000'),
(6, 'APP_SHORTCODE', '', '', 0, '2025-11-20 22:44:00.000000'),
(7, 'APP_SMSAPI', '2345678', '', 0, '2025-11-20 22:44:00.000000'),
(8, 'APP_SMSEMAIL', '', '', 0, '2025-11-20 22:44:00.000000'),
(9, 'APP_SMSNAME', '', '', 0, '2025-11-20 22:44:00.000000'),
(10, 'APP_SMSPWD', '', '', 0, '2025-11-20 22:44:00.000000'),
(11, 'CONTACT_ADDRESS', '203 Fake St. Mountain View, San Francisco, California, USA', '203 Fake St. Mountain View, San Francisco, California, USA', 0, '2025-11-20 22:44:00.000000'),
(12, 'CONTACT_PERSON1', '+234 7047137084', '07047137084', 0, '2025-11-20 22:44:00.000000'),
(13, 'CONTACT_PERSON2', '+1 (541) 563 7484', '', 0, '2025-11-20 22:44:00.000000'),
(14, 'CONTACT_PERSON3', '', '', 0, '2018-08-27 23:24:27.000000'),
(15, 'CONTACT_PERSON4', '', 'For Whatsapp Link', 0, '2025-11-20 22:44:00.000000'),
(16, 'FACEBOOK', 'belldivine070', 'Facebook Handle', 0, '2025-11-20 22:44:00.000000'),
(17, 'INSTAGRAM', 'https://www.instagram.com/belldivine080?igsh=a2hiNnU4cnljNGVj&utm_source=qr', 'Instagram Handle', 0, '2025-11-20 22:44:00.000000'),
(18, 'LINKEDIN', 'https://www.linkedin.com/in/bell-gam-404152221', 'Linkedin Handle', 0, '2025-11-20 22:44:00.000000'),
(19, 'OFFICIAL_EMAIL', 'belldivine070@gmail.com', '', 0, '2025-11-20 22:44:00.000000'),
(20, 'SITE_HITS', '', 'Number Of Times The Site Has Been Visited', 0, '2025-11-20 22:44:00.000000'),
(21, 'SLOGAN', 'Far far away, behind the word mountains, far from the countries.', '', 0, '2018-08-27 23:29:10.000000'),
(22, 'TWITTER', 'https://x.com/belldivine080?s=21', 'Twitter Handle', 0, '2025-11-20 22:44:00.000000'),
(23, 'YOUTUBE', 'belldivine070', 'Youtube Handle', 0, '2025-11-20 22:44:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `core_banner`
--

CREATE TABLE `core_banner` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `link_url` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `order` int(10) UNSIGNED NOT NULL CHECK (`order` >= 0),
  `image_asset_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_broadcastlog`
--

CREATE TABLE `core_broadcastlog` (
  `id` bigint(20) NOT NULL,
  `recipient_email` varchar(254) NOT NULL,
  `status` varchar(20) NOT NULL,
  `sent_at` datetime(6) NOT NULL,
  `news_post_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_category`
--

CREATE TABLE `core_category` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `excerpt` longtext DEFAULT NULL,
  `child_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`child_fields`)),
  `media_asset_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_category`
--

INSERT INTO `core_category` (`id`, `title`, `slug`, `excerpt`, `child_fields`, `media_asset_id`) VALUES
(3, 'Privacy Policy', 'privacy-policy', '', '[\"content\", \"title\", \"slug\"]', NULL),
(4, 'Terms of Use', 'terms-of-use', '', '[\"content\", \"title\", \"slug\"]', NULL),
(5, 'Frequently asked question', 'frequently-asked-question', '', '[\"title\", \"slug\", \"excerpt\", \"content\"]', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core_categorypost`
--

CREATE TABLE `core_categorypost` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` longtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `shortcodes` longtext DEFAULT NULL,
  `icon` varchar(70) DEFAULT NULL,
  `image_align` varchar(50) DEFAULT NULL,
  `btn_text` varchar(100) DEFAULT NULL,
  `btn_url` varchar(200) DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  `addfield1` varchar(255) DEFAULT NULL,
  `addfield2` varchar(255) DEFAULT NULL,
  `addfield3` varchar(255) DEFAULT NULL,
  `addfield4` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` uuid DEFAULT NULL,
  `category_id` bigint(20) NOT NULL,
  `featured_audio_id` bigint(20) DEFAULT NULL,
  `featured_image_id` bigint(20) DEFAULT NULL,
  `featured_video_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_contactus`
--

CREATE TABLE `core_contactus` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` longtext NOT NULL,
  `submitted_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_contactus`
--

INSERT INTO `core_contactus` (`id`, `fullname`, `email`, `subject`, `message`, `submitted_at`) VALUES
(1, 'Divine sabinus', 'belldivine080@gmail.com', 'The frist test', 'form.save()', '2026-04-26 15:39:43.881498'),
(2, 'Divine sabinus', 'belldivine080@gmail.com', 'Refund compliant', 'I wasn\'t refunded after i sent the package', '2026-04-26 15:40:12.408668'),
(3, 'Divine sabinus', 'ygujhy@gmail.com', 'Testing Mail TimeZone', 'Testing', '2026-04-26 15:45:32.331404');

-- --------------------------------------------------------

--
-- Table structure for table `core_externalsubscriber`
--

CREATE TABLE `core_externalsubscriber` (
  `id` bigint(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `date_subscribed` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_externalsubscriber`
--

INSERT INTO `core_externalsubscriber` (`id`, `email`, `ip_address`, `region`, `date_subscribed`) VALUES
(1, 'success@gmail.com', '127.0.0.1', NULL, '2026-04-25 09:31:26.343249'),
(2, 'favour01@gmail.com', '127.0.0.1', 'Unknown', '2026-04-26 15:10:43.453242'),
(3, 'esther@gmsil.com', '127.0.0.1', 'Unknown', '2026-04-26 15:11:13.081638'),
(4, 'fghdsdfc@gmail.com', '127.0.0.1', 'Unknown', '2026-04-27 19:07:02.939213');

-- --------------------------------------------------------

--
-- Table structure for table `core_mediaalbum`
--

CREATE TABLE `core_mediaalbum` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_mediaalbum`
--

INSERT INTO `core_mediaalbum` (`id`, `name`, `slug`) VALUES
(1, 'Main Album', 'main-album'),
(2, 'Product', 'product');

-- --------------------------------------------------------

--
-- Table structure for table `core_mediaasset`
--

CREATE TABLE `core_mediaasset` (
  `id` bigint(20) NOT NULL,
  `file` varchar(500) NOT NULL,
  `title` varchar(255) NOT NULL,
  `file_type` varchar(10) NOT NULL,
  `file_size` int(10) UNSIGNED DEFAULT NULL CHECK (`file_size` >= 0),
  `uploaded_at` datetime(6) NOT NULL,
  `mediacat_id` bigint(20) DEFAULT NULL,
  `replace_existing` tinyint(1) NOT NULL,
  `duration` double DEFAULT NULL,
  `extension` varchar(10) NOT NULL,
  `height` int(10) UNSIGNED DEFAULT NULL CHECK (`height` >= 0),
  `width` int(10) UNSIGNED DEFAULT NULL CHECK (`width` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_mediaasset`
--

INSERT INTO `core_mediaasset` (`id`, `file`, `title`, `file_type`, `file_size`, `uploaded_at`, `mediacat_id`, `replace_existing`, `duration`, `extension`, `height`, `width`) VALUES
(1, 'media_library/product/Dettol_meduim.jpg', 'Dettol meduim.jpg', 'image', 55166, '2026-04-22 12:12:02.019737', 2, 0, NULL, '.jpg', 600, 540),
(2, 'media_library/product/Buter_beans.jpg', 'Buter beans.jpg', 'image', 94377, '2026-04-22 12:12:02.038811', 2, 0, NULL, '.jpg', 600, 540),
(3, 'media_library/product/Ani_basmati_rice_2kg.jpg', 'Ani basmati rice 2kg.jpg', 'image', 86880, '2026-04-22 12:12:02.054133', 2, 0, NULL, '.jpg', 600, 540),
(4, 'media_library/product/Eric_oat_flour.jpg', 'Eric oat flour.jpg', 'image', 88389, '2026-04-22 12:12:02.070318', 2, 0, NULL, '.jpg', 600, 540),
(5, 'media_library/product/Clasic_makeup_1.jpg', 'Clasic makeup 1.jpg', 'image', 65937, '2026-04-22 12:12:02.085160', 2, 0, NULL, '.jpg', 600, 540),
(6, 'media_library/product/Powdered_dry_pepper_500g.jpg', 'Powdered dry pepper 500g.jpg', 'image', 88592, '2026-04-22 12:12:02.096956', 2, 0, NULL, '.jpg', 600, 540),
(7, 'media_library/product/Powdered_dry_pepper.jpg', 'Powdered dry pepper.jpg', 'image', 93055, '2026-04-22 12:12:02.133226', 2, 0, NULL, '.jpg', 600, 540),
(8, 'media_library/product/Mozzarealla_cheese.jpg', 'Mozzarealla cheese.jpg', 'image', 48348, '2026-04-22 12:12:02.175194', 2, 0, NULL, '.jpg', 600, 540),
(9, 'media_library/product/Children_cloth_2.jpg', 'Children cloth 2.jpg', 'image', 79343, '2026-04-22 12:12:02.204211', 2, 0, NULL, '.jpg', 600, 540),
(10, 'media_library/product/Children_cloth_1.jpg', 'Children cloth 1.jpg', 'image', 53489, '2026-04-22 12:12:02.228197', 2, 0, NULL, '.jpg', 600, 540),
(11, 'media_library/product/MJ_chicken_spring_rolls.jpg', 'M&J chicken spring rolls.jpg', 'image', 87087, '2026-04-22 12:12:02.256271', 2, 0, NULL, '.jpg', 600, 540),
(12, 'media_library/product/Turkey_1kg.jpg', 'Turkey 1kg.jpg', 'image', 72992, '2026-04-22 12:12:02.302479', 2, 0, NULL, '.jpg', 600, 540),
(13, 'media_library/product/Ama_wonda_fried_rice_spice_100g.jpg', 'Ama wonda fried rice spice 100g.jpg', 'image', 104667, '2026-04-22 12:12:02.334782', 2, 0, NULL, '.jpg', 600, 540),
(14, 'media_library/product/Ama_wonda_fried_rice_spice.jpg', 'Ama wonda fried rice spice.jpg', 'image', 101430, '2026-04-22 12:12:02.359062', 2, 0, NULL, '.jpg', 600, 540),
(15, 'media_library/product/Sonia_tomato_mix_2.2g.jpg', 'Sonia tomato mix 2.2g.jpg', 'image', 75485, '2026-04-22 12:12:02.390425', 2, 0, NULL, '.jpg', 600, 540),
(16, 'media_library/product/Maharam_basmatic_rice_5kg.jpg', 'Maharam basmatic rice 5kg.jpg', 'image', 115462, '2026-04-22 12:12:02.408719', 2, 0, NULL, '.jpg', 600, 540),
(17, 'media_library/product/Spicity_stew_and_jellof.jpg', 'Spicity stew and jellof.jpg', 'image', 137867, '2026-04-22 12:12:02.427854', 2, 0, NULL, '.jpg', 600, 540),
(18, 'media_library/product/Pam_original.jpg', 'Pam original.jpg', 'image', 48603, '2026-04-22 12:12:02.441391', 2, 0, NULL, '.jpg', 600, 540),
(19, 'media_library/product/Ayoola_pounded_yam_flour_9.1kg.jpg', 'Ayoola pounded yam flour 9.1kg.jpg', 'image', 101721, '2026-04-22 12:12:02.459067', 2, 0, NULL, '.jpg', 600, 540),
(20, 'media_library/product/Frozen_peeled_shrimps.jpg', 'Frozen peeled shrimps.jpg', 'image', 88075, '2026-04-22 12:12:02.474927', 2, 0, NULL, '.jpg', 600, 540),
(21, 'media_library/product/Goden_penny_pasta_twist_macaroni.jpg', 'Go;den penny pasta twist macaroni.jpg', 'image', 94210, '2026-04-22 12:12:02.489843', 2, 0, NULL, '.jpg', 600, 540),
(22, 'media_library/product/Smoked_chicken_laps.jpg', 'Smoked chicken laps.jpg', 'image', 96971, '2026-04-22 12:12:02.505218', 2, 0, NULL, '.jpg', 600, 540),
(23, 'media_library/product/Thyme_250g.jpg', 'Thyme 250g.jpg', 'image', 99250, '2026-04-22 12:12:02.521244', 2, 0, NULL, '.jpg', 600, 540),
(24, 'media_library/product/Chicken_thighs.jpg', 'Chicken thighs.jpg', 'image', 96862, '2026-04-22 12:12:02.537082', 2, 0, NULL, '.jpg', 600, 540),
(25, 'media_library/product/Frozen_Salmon_fish.jpg', 'Frozen Salmon fish.jpg', 'image', 84538, '2026-04-22 12:12:02.552995', 2, 0, NULL, '.jpg', 600, 540),
(26, 'media_library/product/Soya_milk.jpg', 'Soya milk.jpg', 'image', 49554, '2026-04-22 12:12:02.575745', 2, 0, NULL, '.jpg', 600, 540),
(27, 'media_library/product/Socks.jpg', 'Socks.jpg', 'image', 70412, '2026-04-22 12:12:02.620007', 2, 0, NULL, '.jpg', 600, 540),
(28, 'media_library/product/Guinness_bottle_drink.jpg', 'Guinness bottle drink.jpg', 'image', 49841, '2026-04-22 12:12:02.639007', 2, 0, NULL, '.jpg', 600, 540),
(29, 'media_library/product/Hero_drink.jpg', 'Hero drink.jpg', 'image', 113154, '2026-04-22 12:12:02.660273', 2, 0, NULL, '.jpg', 900, 810),
(30, 'media_library/product/Frozen_chicken_burgers.jpg', 'Frozen chicken burgers.jpg', 'image', 107669, '2026-04-22 12:12:02.685104', 2, 0, NULL, '.jpg', 600, 540),
(31, 'media_library/product/Toy_1.3.jpg', 'Toy 1.3.jpg', 'image', 113577, '2026-04-22 12:12:02.705593', 2, 0, NULL, '.jpg', 600, 540),
(32, 'media_library/product/Teddy_with_brown.jpg', 'Teddy with brown.jpg', 'image', 97197, '2026-04-22 12:12:02.722982', 2, 0, NULL, '.jpg', 600, 540),
(33, 'media_library/product/Toy_1.2.jpg', 'Toy 1.2.jpg', 'image', 100235, '2026-04-22 12:12:02.740547', 2, 0, NULL, '.jpg', 600, 540),
(34, 'media_library/product/Teddy_with_yellow_4.jpg', 'Teddy with yellow 4.jpg', 'image', 65815, '2026-04-22 12:12:02.760995', 2, 0, NULL, '.jpg', 600, 540),
(35, 'media_library/product/MJ_samosa_beef.jpg', 'M&J samosa beef.jpg', 'image', 85673, '2026-04-22 12:12:02.778255', 2, 0, NULL, '.jpg', 600, 540),
(36, 'media_library/product/Toy_1.jpg', 'Toy 1.jpg', 'image', 110388, '2026-04-22 12:12:02.796086', 2, 0, NULL, '.jpg', 600, 540),
(37, 'media_library/product/Blue_bullet.jpg', 'Blue bullet.jpg', 'image', 59822, '2026-04-22 12:12:02.815692', 2, 0, NULL, '.jpg', 600, 540),
(38, 'media_library/product/Mimosa.jpg', 'Mimosa.jpg', 'image', 94723, '2026-04-22 12:12:02.839436', 2, 0, NULL, '.jpg', 600, 540),
(39, 'media_library/product/Teddy_with_yellow.jpg', 'Teddy with yellow.jpg', 'image', 78557, '2026-04-22 12:12:02.858941', 2, 0, NULL, '.jpg', 600, 540),
(40, 'media_library/product/Teddy_with_brown_2.jpg', 'Teddy with brown 2.jpg', 'image', 82355, '2026-04-22 12:12:02.890301', 2, 0, NULL, '.jpg', 600, 540),
(41, 'media_library/product/Teddy_with_bow_large_3.jpg', 'Teddy with bow large 3.jpg', 'image', 57989, '2026-04-22 12:12:02.925162', 2, 0, NULL, '.jpg', 600, 540),
(42, 'media_library/product/7Up_40cl.jpg', '7Up 40cl.jpg', 'image', 48553, '2026-04-22 12:12:02.944690', 2, 0, NULL, '.jpg', 600, 540),
(43, 'media_library/product/Black_bullet.jpg', 'Black bullet.jpg', 'image', 55393, '2026-04-22 12:12:02.987412', 2, 0, NULL, '.jpg', 600, 540),
(44, 'media_library/product/Monster_111.jpg', 'Monster 111.jpg', 'image', 62686, '2026-04-22 12:12:03.058341', 2, 0, NULL, '.jpg', 631, 568),
(45, 'media_library/product/Teddy_with_bow_large.jpg', 'Teddy with bow large.jpg', 'image', 77165, '2026-04-22 12:12:03.110867', 2, 0, NULL, '.jpg', 600, 540),
(46, 'media_library/product/Teddy_with_yellow_2.jpg', 'Teddy with yellow 2.jpg', 'image', 67116, '2026-04-22 12:12:03.144959', 2, 0, NULL, '.jpg', 600, 540),
(47, 'media_library/product/Williams_bear.jpg', 'Williams bear.jpg', 'image', 42829, '2026-04-22 12:12:03.188692', 2, 0, NULL, '.jpg', 600, 540),
(48, 'media_library/product/Green_peas.jpg', 'Green peas.jpg', 'image', 105010, '2026-04-22 12:12:03.227188', 2, 0, NULL, '.jpg', 600, 540),
(49, 'media_library/product/Teddy_with_bow_large_back_1.jpg', 'Teddy with bow large back 1.jpg', 'image', 86418, '2026-04-22 12:12:03.256219', 2, 0, NULL, '.jpg', 600, 540),
(50, 'media_library/product/Teddy_with_yellow_1.jpg', 'Teddy with yellow 1.jpg', 'image', 59244, '2026-04-22 12:12:03.292366', 2, 0, NULL, '.jpg', 600, 540),
(51, 'media_library/product/Teddy_with_brown_1.jpg', 'Teddy with brown 1.jpg', 'image', 83864, '2026-04-22 12:12:03.329255', 2, 0, NULL, '.jpg', 600, 540),
(52, 'media_library/product/Desparados.jpg', 'Desparados.jpg', 'image', 48400, '2026-04-22 12:12:03.350116', 2, 0, NULL, '.jpg', 600, 540),
(53, 'media_library/product/Teddy_with_bow_large_2.jpg', 'Teddy with bow large 2.jpg', 'image', 56252, '2026-04-22 12:12:03.369457', 2, 0, NULL, '.jpg', 600, 540),
(54, 'media_library/product/Teddy_with_bow_large_1.jpg', 'Teddy with bow large 1.jpg', 'image', 59354, '2026-04-22 12:12:03.394854', 2, 0, NULL, '.jpg', 600, 540),
(55, 'media_library/product/Teddy_bear_1.jpg', 'Teddy bear 1.jpg', 'image', 53752, '2026-04-22 12:12:03.444397', 2, 0, NULL, '.jpg', 600, 540),
(56, 'media_library/product/Bama_mayonnaise.jpg', 'Bama mayonnaise.jpg', 'image', 71789, '2026-04-22 12:12:03.486125', 2, 0, NULL, '.jpg', 600, 540),
(57, 'media_library/product/Adult_diaper.jpg', 'Adult diaper.jpg', 'image', 104549, '2026-04-22 12:12:03.505362', 2, 0, NULL, '.jpg', 600, 540),
(58, 'media_library/product/Nasco_conflaskes.jpg', 'Nasco conflaskes.jpg', 'image', 91367, '2026-04-22 12:12:03.522057', 2, 0, NULL, '.jpg', 600, 540),
(59, 'media_library/product/Easy_on_starch.jpg', 'Easy on starch.jpg', 'image', 52064, '2026-04-22 12:12:03.544824', 2, 0, NULL, '.jpg', 600, 540),
(60, 'media_library/product/Mimisa.jpg', 'Mimisa.jpg', 'image', 83082, '2026-04-22 12:12:03.573812', 2, 0, NULL, '.jpg', 600, 540),
(61, 'media_library/product/Snirnoff_ice_original_can.jpg', 'Snirnoff ice original can.jpg', 'image', 67065, '2026-04-22 12:12:03.592418', 2, 0, NULL, '.jpg', 600, 540),
(62, 'media_library/product/Star.jpg', 'Star.jpg', 'image', 56385, '2026-04-22 12:12:03.610336', 2, 0, NULL, '.jpg', 600, 540),
(63, 'media_library/product/Pepsi_plastic.jpg', 'Pepsi plastic.jpg', 'image', 46106, '2026-04-22 12:12:03.629180', 2, 0, NULL, '.jpg', 600, 540),
(64, 'media_library/product/Checkers_milk_custard.jpg', 'Checkers milk custard.jpg', 'image', 89876, '2026-04-22 12:12:03.656457', 2, 0, NULL, '.jpg', 600, 540),
(65, 'media_library/product/Raid_Insect_killer.jpg', 'Raid Insect killer.jpg', 'image', 53814, '2026-04-22 12:12:03.677667', 2, 0, NULL, '.jpg', 600, 540),
(66, 'media_library/product/Peak_milk_sachet_500g.jpg', 'Peak milk sachet 500g.jpg', 'image', 92449, '2026-04-22 12:12:03.712511', 2, 0, NULL, '.jpg', 600, 540),
(67, 'media_library/product/Rolled_oats.jpg', 'Rolled oats.jpg', 'image', 98407, '2026-04-22 12:12:03.742214', 2, 0, NULL, '.jpg', 600, 540),
(68, 'media_library/product/hite_beans.jpg', 'hite beans.jpg', 'image', 103986, '2026-04-22 12:12:03.761422', 2, 0, NULL, '.jpg', 600, 540),
(69, 'media_library/product/Egg_noodle.jpg', 'Egg noodle.jpg', 'image', 120887, '2026-04-22 12:12:03.791480', 2, 0, NULL, '.jpg', 600, 540),
(70, 'media_library/product/Musk_white_peff.jpg', 'Musk white peff.jpg', 'image', 53875, '2026-04-22 12:12:03.816195', 2, 0, NULL, '.jpg', 600, 540),
(71, 'media_library/product/Brut_paris.jpg', 'Brut paris.jpg', 'image', 47879, '2026-04-22 12:12:03.842698', 2, 0, NULL, '.jpg', 600, 540),
(72, 'media_library/product/Unruly_hero.jpg', 'Unruly hero.jpg', 'image', 42906, '2026-04-22 12:12:03.862987', 2, 0, NULL, '.jpg', 600, 540),
(73, 'media_library/product/Body_philosophy_follow_my_way.jpg', 'Body philosophy follow my way.jpg', 'image', 44598, '2026-04-22 12:12:03.888320', 2, 0, NULL, '.jpg', 600, 540),
(74, 'media_library/product/Closeup_toothpaste.jpg', 'Closeup toothpaste.jpg', 'image', 59230, '2026-04-22 12:12:03.928016', 2, 0, NULL, '.jpg', 600, 540),
(75, 'media_library/product/Nivea_men_dry_impact.jpg', 'Nivea men dry impact.jpg', 'image', 49078, '2026-04-22 12:12:03.976565', 2, 0, NULL, '.jpg', 600, 540),
(76, 'media_library/product/Gillette_rollon.jpg', 'Gillette rollon.jpg', 'image', 55294, '2026-04-22 12:12:04.007036', 2, 0, NULL, '.jpg', 600, 540),
(77, 'media_library/product/Super_clean_toothbrush.jpg', 'Super clean toothbrush.jpg', 'image', 59154, '2026-04-22 12:12:04.055462', 2, 0, NULL, '.jpg', 600, 540),
(78, 'media_library/product/Axe_48hrs.jpg', 'Axe 48hrs.jpg', 'image', 56203, '2026-04-22 12:12:04.077196', 2, 0, NULL, '.jpg', 600, 540),
(79, 'media_library/product/Riggs_london.jpg', 'Riggs london.jpg', 'image', 44182, '2026-04-22 12:12:04.093942', 2, 0, NULL, '.jpg', 600, 540),
(80, 'media_library/product/Bismid_cream.jpg', 'Bismid cream.jpg', 'image', 42477, '2026-04-22 12:12:04.110325', 2, 0, NULL, '.jpg', 600, 540),
(81, 'media_library/product/Lait_peff.jpg', 'Lait peff.jpg', 'image', 48312, '2026-04-22 12:12:04.128416', 2, 0, NULL, '.jpg', 600, 540),
(82, 'media_library/product/SK_duchess_glow.jpg', 'SK duchess glow.jpg', 'image', 51363, '2026-04-22 12:12:04.145241', 2, 0, NULL, '.jpg', 600, 540),
(83, 'media_library/product/Demond_glow.jpg', 'Demond glow.jpg', 'image', 46643, '2026-04-22 12:12:04.173244', 2, 0, NULL, '.jpg', 600, 540),
(84, 'media_library/product/Voilet_glow.jpg', 'Voilet glow.jpg', 'image', 56883, '2026-04-22 12:12:04.188506', 2, 0, NULL, '.jpg', 600, 540),
(85, 'media_library/product/Just_like_skin_liploss.jpg', 'Just like skin liploss.jpg', 'image', 38602, '2026-04-22 12:12:04.204646', 2, 0, NULL, '.jpg', 600, 540),
(86, 'media_library/product/Merry_colour__makeUp.jpg', 'Merry colour  makeUp.jpg', 'image', 83190, '2026-04-22 12:12:04.221573', 2, 0, NULL, '.jpg', 600, 540),
(87, 'media_library/product/Ever_beauty_chocolate.jpg', 'Ever beauty chocolate.jpg', 'image', 79693, '2026-04-22 12:12:04.237545', 2, 0, NULL, '.jpg', 600, 540),
(88, 'media_library/product/Perfurm_3.jpg', 'Perfurm 3.jpg', 'image', 32375, '2026-04-22 12:12:04.252229', 2, 0, NULL, '.jpg', 600, 540),
(89, 'media_library/product/24k_Gold_liploss.jpg', '24k Gold liploss.jpg', 'image', 43087, '2026-04-22 12:12:04.269197', 2, 0, NULL, '.jpg', 600, 540),
(90, 'media_library/product/Perfurm_2.jpg', 'Perfurm 2.jpg', 'image', 48999, '2026-04-22 12:12:04.285013', 2, 0, NULL, '.jpg', 600, 540),
(91, 'media_library/product/Narciso_rodrigues_peff_-_Copy.jpg', 'Narciso rodrigues peff - Copy.jpg', 'image', 49306, '2026-04-22 12:12:04.301752', 2, 0, NULL, '.jpg', 600, 540),
(92, 'media_library/product/Narciso_rodrigues_peff.jpg', 'Narciso rodrigues peff.jpg', 'image', 49306, '2026-04-22 12:12:04.318945', 2, 0, NULL, '.jpg', 600, 540),
(93, 'media_library/product/Narciso_rodrigues_for_her.jpg', 'Narciso rodrigues for her.jpg', 'image', 50776, '2026-04-22 12:12:04.337341', 2, 0, NULL, '.jpg', 600, 540),
(94, 'media_library/product/Dairy_notebook_2.jpg', 'Dairy notebook 2.jpg', 'image', 98062, '2026-04-22 12:12:04.353600', 2, 0, NULL, '.jpg', 600, 540),
(95, 'media_library/product/Dairy_notebook_1.jpg', 'Dairy notebook 1.jpg', 'image', 62765, '2026-04-22 12:12:04.371802', 2, 0, NULL, '.jpg', 600, 540),
(96, 'media_library/product/Mathematical_sets.jpg', 'Mathematical sets.jpg', 'image', 58915, '2026-04-22 12:12:04.391818', 2, 0, NULL, '.jpg', 600, 540),
(97, 'media_library/product/Board_pin_1.jpg', 'Board pin 1.jpg', 'image', 78117, '2026-04-22 12:12:04.473970', 2, 0, NULL, '.jpg', 600, 540),
(98, 'media_library/product/Board_pin.jpg', 'Board pin.jpg', 'image', 89573, '2026-04-22 12:12:04.494410', 2, 0, NULL, '.jpg', 599, 540),
(99, 'media_library/product/Office_pin.jpg', 'Office pin.jpg', 'image', 70289, '2026-04-22 12:12:04.512687', 2, 0, NULL, '.jpg', 600, 540),
(100, 'media_library/product/Peakmax_scapler.jpg', 'Peakmax scapler.jpg', 'image', 52036, '2026-04-22 12:12:04.533249', 2, 0, NULL, '.jpg', 600, 540),
(101, 'media_library/product/Heavy_duty_punch.jpg', 'Heavy duty punch.jpg', 'image', 94976, '2026-04-22 12:12:04.556864', 2, 0, NULL, '.jpg', 600, 540),
(102, 'media_library/product/Korean_Glass_Skin.jpg', 'Korean Glass Skin.jpg', 'image', 55448, '2026-04-22 12:12:04.576988', 2, 0, NULL, '.jpg', 600, 540),
(103, 'media_library/product/Banana_and_mango_extra_whitening_shower_bath.jpg', 'Banana and mango extra whitening shower bath.jpg', 'image', 60113, '2026-04-22 12:12:04.595177', 2, 0, NULL, '.jpg', 600, 540),
(104, 'media_library/product/Dairy_notebook.jpg', 'Dairy notebook.jpg', 'image', 86928, '2026-04-22 12:12:04.617560', 2, 0, NULL, '.jpg', 600, 540),
(105, 'media_library/product/Ducros_curry_powder.jpg', 'Ducros curry powder.jpg', 'image', 101436, '2026-04-22 12:12:04.638124', 2, 0, NULL, '.jpg', 600, 540),
(106, 'media_library/product/Mr_chief_salt_500g.jpg', 'Mr chief salt 500g.jpg', 'image', 95073, '2026-04-22 12:12:04.662983', 2, 0, NULL, '.jpg', 600, 540),
(107, 'media_library/product/Calculate_1.2.jpg', 'Calculate 1.2.jpg', 'image', 62435, '2026-04-22 12:12:04.694325', 2, 0, NULL, '.jpg', 600, 540),
(108, 'media_library/product/Diary_notebook_1.jpg', 'Diary notebook 1.jpg', 'image', 107615, '2026-04-22 12:12:04.729877', 2, 0, NULL, '.jpg', 600, 540),
(109, 'media_library/product/Calculate_1.jpg', 'Calculate 1.jpg', 'image', 61148, '2026-04-22 12:12:04.758509', 2, 0, NULL, '.jpg', 600, 540),
(110, 'media_library/product/B_pencile_packs_of_6.jpg', 'B pencile packs of 6.jpg', 'image', 56852, '2026-04-22 12:12:04.779593', 2, 0, NULL, '.jpg', 600, 540),
(111, 'media_library/product/Digital_scale_mini.jpg', 'Digital scale mini.jpg', 'image', 61368, '2026-04-22 12:12:04.808352', 2, 0, NULL, '.jpg', 600, 540),
(112, 'media_library/product/Ayoola_poundo_yam_flour_4.5kg.jpg', 'Ayoola poundo yam flour 4.5kg.jpg', 'image', 108874, '2026-04-22 12:12:04.833573', 2, 0, NULL, '.jpg', 600, 540),
(113, 'media_library/product/Aani_basmati_rice_2kg.jpg', 'Aani basmati rice 2kg.jpg', 'image', 102777, '2026-04-22 12:12:04.857934', 2, 0, NULL, '.jpg', 600, 540),
(114, 'media_library/product/Frozen_Seses_fish.jpg', 'Frozen Seses fish.jpg', 'image', 41570, '2026-04-22 12:12:04.890726', 2, 0, NULL, '.jpg', 600, 540),
(115, 'media_library/product/Eric_oat_flour_1.3kg.jpg', 'Eric oat flour 1.3kg.jpg', 'image', 100992, '2026-04-22 12:12:04.920773', 2, 0, NULL, '.jpg', 600, 540),
(116, 'media_library/product/De_Hero.jpg', 'De Hero.jpg', 'image', 66476, '2026-04-22 12:12:04.945818', 2, 0, NULL, '.jpg', 600, 540),
(117, 'media_library/product/Euroma_Bay_leave.jpg', 'Euroma Bay leave.jpg', 'image', 105724, '2026-04-22 12:12:04.977040', 2, 0, NULL, '.jpg', 600, 540),
(118, 'media_library/product/Amoy_chilli_sauce.jpg', 'Amoy chilli sauce.jpg', 'image', 53858, '2026-04-22 12:12:05.002652', 2, 0, NULL, '.jpg', 600, 540),
(119, 'media_library/product/Honey_beans.jpg', 'Honey beans.jpg', 'image', 115758, '2026-04-22 12:12:05.023045', 2, 0, NULL, '.jpg', 600, 540),
(120, 'media_library/product/checkers_custard_powder_700g.jpg', 'checkers custard powder 700g.jpg', 'image', 113182, '2026-04-22 12:12:05.043708', 2, 0, NULL, '.jpg', 600, 540),
(121, 'media_library/product/checkers_custard_powder_200g.jpg', 'checkers custard powder 200g.jpg', 'image', 96046, '2026-04-22 12:12:05.078937', 2, 0, NULL, '.jpg', 600, 540),
(122, 'media_library/product/Tuna_Chunks.jpg', 'Tuna Chunks.jpg', 'image', 61539, '2026-04-22 12:12:05.106125', 2, 0, NULL, '.jpg', 600, 540),
(123, 'media_library/product/Amoy_red_vinegar.jpg', 'Amoy red vinegar.jpg', 'image', 46585, '2026-04-22 12:12:05.124561', 2, 0, NULL, '.jpg', 600, 540),
(124, 'media_library/product/Nescafe_classic.jpg', 'Nescafe classic.jpg', 'image', 61299, '2026-04-22 12:12:05.144033', 2, 0, NULL, '.jpg', 600, 540),
(125, 'media_library/product/Buter_beans_2kg.jpg', 'Buter beans 2kg.jpg', 'image', 94003, '2026-04-22 12:12:05.167359', 2, 0, NULL, '.jpg', 600, 540),
(126, 'media_library/product/Nestle_Milo_40g.jpg', 'Nestle Milo 40g.jpg', 'image', 109400, '2026-04-22 12:12:05.191315', 2, 0, NULL, '.jpg', 600, 540),
(127, 'media_library/product/Elite_care_superclean_toothbrushes.jpg', 'Elite care superclean toothbrushes.jpg', 'image', 69185, '2026-04-22 12:12:05.207014', 2, 0, NULL, '.jpg', 600, 540),
(128, 'media_library/product/Dabur_Herbal.jpg', 'Dabur Herbal.jpg', 'image', 54490, '2026-04-22 12:12:05.223026', 2, 0, NULL, '.jpg', 600, 540),
(129, 'media_library/product/Cleaning_charcoal_toothpaste_and_1_free_toothbrush.jpg', 'Cleaning charcoal toothpaste and 1 free toothbrush.jpg', 'image', 58672, '2026-04-22 12:12:05.238657', 2, 0, NULL, '.jpg', 600, 540),
(130, 'media_library/product/Oral-B_toothbrush.jpg', 'Oral-B toothbrush.jpg', 'image', 62052, '2026-04-22 12:12:05.258023', 2, 0, NULL, '.jpg', 600, 540),
(131, 'media_library/product/Si.jpg', 'Si.jpg', 'image', 46768, '2026-04-22 12:12:05.274571', 2, 0, NULL, '.jpg', 600, 540),
(132, 'media_library/product/Clube_de_nuit.jpg', 'Clube de nuit.jpg', 'image', 61746, '2026-04-22 12:12:05.294988', 2, 0, NULL, '.jpg', 600, 540),
(133, 'media_library/product/Chloe.jpg', 'Chloe.jpg', 'image', 60576, '2026-04-22 12:12:05.317957', 2, 0, NULL, '.jpg', 600, 540),
(134, 'media_library/product/Khamrah.jpg', 'Khamrah.jpg', 'image', 86078, '2026-04-22 12:12:05.337103', 2, 0, NULL, '.jpg', 600, 540),
(135, 'media_library/product/Olay_regenerist.jpg', 'Olay regenerist.jpg', 'image', 41707, '2026-04-22 12:12:05.355369', 2, 0, NULL, '.jpg', 600, 540),
(136, 'media_library/product/Jergens_hydrating_coconut.jpg', 'Jergens hydrating coconut.jpg', 'image', 44911, '2026-04-22 12:12:05.370885', 2, 0, NULL, '.jpg', 600, 540),
(137, 'media_library/product/Cetaphil_moisturizing_cream.jpg', 'Cetaphil moisturizing cream.jpg', 'image', 54404, '2026-04-22 12:12:05.386845', 2, 0, NULL, '.jpg', 600, 540),
(138, 'media_library/product/Listerine_multi_protect.jpg', 'Listerine multi protect.jpg', 'image', 57867, '2026-04-22 12:12:05.402658', 2, 0, NULL, '.jpg', 600, 540),
(139, 'media_library/product/Cool_mint_listerine.jpg', 'Cool mint listerine.jpg', 'image', 60268, '2026-04-22 12:12:05.418034', 2, 0, NULL, '.jpg', 600, 540),
(140, 'media_library/product/Tooth_picks.jpg_packs.jpg', 'Tooth picks.jpg packs.jpg', 'image', 61148, '2026-04-22 12:12:05.435016', 2, 0, NULL, '.jpg', 600, 540),
(141, 'media_library/product/Tooth_picks.jpg', 'Tooth picks.jpg', 'image', 52374, '2026-04-22 12:12:05.462969', 2, 0, NULL, '.jpg', 600, 540),
(142, 'media_library/product/Oral_dental_floss.jpg', 'Oral dental floss.jpg', 'image', 108767, '2026-04-22 12:12:05.482740', 2, 0, NULL, '.jpg', 600, 540),
(143, 'media_library/product/Dove_original.jpg', 'Dove original.jpg', 'image', 36225, '2026-04-22 12:12:05.496546', 2, 0, NULL, '.jpg', 600, 540),
(144, 'media_library/product/Axe_apollo.jpg', 'Axe apollo.jpg', 'image', 65834, '2026-04-22 12:12:05.518317', 2, 0, NULL, '.jpg', 600, 540),
(145, 'media_library/product/Dove_advance_care.jpg', 'Dove advance care.jpg', 'image', 42560, '2026-04-22 12:12:05.537687', 2, 0, NULL, '.jpg', 600, 540),
(146, 'media_library/product/Nivea_fresh_natural.jpg', 'Nivea fresh natural.jpg', 'image', 41819, '2026-04-22 12:12:05.556742', 2, 0, NULL, '.jpg', 600, 540),
(147, 'media_library/product/Nivea_men_deep_black_carbon.jpg', 'Nivea men deep black carbon.jpg', 'image', 43811, '2026-04-22 12:12:05.605564', 2, 0, NULL, '.jpg', 600, 540),
(148, 'media_library/product/Ginger_with_honey_tea.jpg', 'Ginger with honey tea.jpg', 'image', 118019, '2026-04-22 12:12:05.629845', 2, 0, NULL, '.jpg', 600, 540),
(149, 'media_library/product/Carex_antiseptic_liquid.jpg', 'Carex antiseptic liquid.jpg', 'image', 67137, '2026-04-22 12:12:05.659113', 2, 0, NULL, '.jpg', 600, 540),
(150, 'media_library/product/Apple_cider_vinegar.jpg', 'Apple cider vinegar.jpg', 'image', 71070, '2026-04-22 12:12:05.677391', 2, 0, NULL, '.jpg', 600, 540),
(151, 'media_library/product/Dettol_liquid_antiseptic_meduim.jpg', 'Dettol liquid antiseptic meduim.jpg', 'image', 62754, '2026-04-22 12:12:05.699641', 2, 0, NULL, '.jpg', 600, 540),
(152, 'media_library/product/Molped_pads.jpg', 'Molped pads.jpg', 'image', 106171, '2026-04-22 12:12:05.723138', 2, 0, NULL, '.jpg', 600, 540),
(153, 'media_library/product/Corned_beef_Exeter_340g.jpg', 'Corned beef Exeter 340g.jpg', 'image', 98838, '2026-04-22 12:12:05.743573', 2, 0, NULL, '.jpg', 600, 540),
(154, 'media_library/product/Green_Giant_sweet_corn.jpg', 'Green Giant sweet corn.jpg', 'image', 85398, '2026-04-22 12:12:05.772631', 2, 0, NULL, '.jpg', 600, 540),
(155, 'media_library/product/Soya_beans_and_pap_powder_450g.jpg', 'Soya beans and pap powder 450g.jpg', 'image', 87870, '2026-04-22 12:12:05.794547', 2, 0, NULL, '.jpg', 600, 540),
(156, 'media_library/product/Softcare_sanitary_pad.jpg', 'Softcare sanitary pad.jpg', 'image', 91193, '2026-04-22 12:12:05.822729', 2, 0, NULL, '.jpg', 600, 540),
(157, 'media_library/product/Fanillia_ultra_toilet_rolls.jpg', 'Fanillia ultra toilet rolls.jpg', 'image', 103959, '2026-04-22 12:12:05.844440', 2, 0, NULL, '.jpg', 600, 540),
(158, 'media_library/product/Famillia_toilet_rolls.jpg', 'Famillia toilet rolls.jpg', 'image', 82087, '2026-04-22 12:12:05.873694', 2, 0, NULL, '.jpg', 600, 540),
(159, 'media_library/product/molped_pad.jpg', 'molped pad.jpg', 'image', 108901, '2026-04-22 12:12:05.903708', 2, 0, NULL, '.jpg', 600, 540),
(160, 'media_library/product/Aroma_diaffuser1.jpg', 'Aroma diaffuser1.jpg', 'image', 51138, '2026-04-22 12:12:05.926118', 2, 0, NULL, '.jpg', 600, 540),
(161, 'media_library/product/Aroma_diaffuser.jpg', 'Aroma diaffuser.jpg', 'image', 46259, '2026-04-22 12:12:05.959363', 2, 0, NULL, '.jpg', 600, 540),
(162, 'media_library/product/Sniper.jpg', 'Sniper.jpg', 'image', 61058, '2026-04-22 12:12:06.007187', 2, 0, NULL, '.jpg', 600, 540),
(163, 'media_library/product/Peak_full_cream.jpg', 'Peak full cream.jpg', 'image', 82490, '2026-04-22 12:12:06.028881', 2, 0, NULL, '.jpg', 600, 540),
(164, 'media_library/product/Golden_aroma_juicy_cherry.jpg', 'Golden aroma juicy cherry.jpg', 'image', 61203, '2026-04-22 12:12:06.055097', 2, 0, NULL, '.jpg', 600, 540),
(165, 'media_library/product/Raid_multipurpose_insect_killer.jpg', 'Raid multipurpose insect killer.jpg', 'image', 57196, '2026-04-22 12:12:06.074990', 2, 0, NULL, '.jpg', 600, 540),
(166, 'media_library/product/BNC_mosquito_spray_400ml.jpg', 'BNC mosquito spray 400ml.jpg', 'image', 61581, '2026-04-22 12:12:06.107117', 2, 0, NULL, '.jpg', 600, 540),
(167, 'media_library/product/BNC_mosquito_spray.jpg', 'BNC mosquito spray.jpg', 'image', 62424, '2026-04-22 12:12:06.124830', 2, 0, NULL, '.jpg', 600, 540),
(168, 'media_library/product/Awiss_tangerine_airfreshner.jpg', 'Awiss tangerine airfreshner.jpg', 'image', 98034, '2026-04-22 12:12:06.144190', 2, 0, NULL, '.jpg', 600, 540),
(169, 'media_library/product/Faultless_niagara_lemon_scent.jpg', 'Faultless niagara lemon scent.jpg', 'image', 51773, '2026-04-22 12:12:06.161116', 2, 0, NULL, '.jpg', 600, 540),
(170, 'media_library/product/Soya_beans_and_pap_powder.jpg', 'Soya beans and pap powder.jpg', 'image', 79422, '2026-04-22 12:12:06.176944', 2, 0, NULL, '.jpg', 600, 540),
(171, 'media_library/product/Glade_elegant_amber__oud.jpg', 'Glade elegant amber & oud.jpg', 'image', 53955, '2026-04-22 12:12:06.195266', 2, 0, NULL, '.jpg', 600, 540),
(172, 'media_library/product/Just_mackerel.jpg', 'Just mackerel.jpg', 'image', 68593, '2026-04-22 12:12:06.212948', 2, 0, NULL, '.jpg', 507, 456),
(173, 'media_library/product/Estus_maquereau.jpg', 'Estus maquereau.jpg', 'image', 97371, '2026-04-22 12:12:06.229563', 2, 0, NULL, '.jpg', 600, 540),
(174, 'media_library/product/Todays_sardines.jpg', 'Todays sardines.jpg', 'image', 92994, '2026-04-22 12:12:06.248658', 2, 0, NULL, '.jpg', 600, 540),
(175, 'media_library/product/Erica_chicken_luncheon_meat.jpg', 'Erica chicken luncheon meat.jpg', 'image', 100677, '2026-04-22 12:12:06.265538', 2, 0, NULL, '.jpg', 600, 540),
(176, 'media_library/product/Immaculate_marrow_fat_processed_peas.jpg', 'Immaculate marrow fat processed peas.jpg', 'image', 90851, '2026-04-22 12:12:06.283759', 2, 0, NULL, '.jpg', 600, 540),
(177, 'media_library/product/Immaculate_marrow_fat_proocessed_peas.jpg', 'Immaculate marrow fat proocessed peas.jpg', 'image', 86667, '2026-04-22 12:12:06.299991', 2, 0, NULL, '.jpg', 601, 540),
(178, 'media_library/product/Heinz_tomato_ketchup_1.25kg.jpg', 'Heinz tomato ketchup 1.25kg.jpg', 'image', 73469, '2026-04-22 12:12:06.318720', 2, 0, NULL, '.jpg', 600, 540),
(179, 'media_library/product/Heinz_tomato_ketchup.jpg', 'Heinz tomato ketchup.jpg', 'image', 73890, '2026-04-22 12:12:06.336400', 2, 0, NULL, '.jpg', 600, 540),
(180, 'media_library/product/Corned_beef_exeter.jpg', 'Corned beef exeter.jpg', 'image', 110515, '2026-04-22 12:12:06.354593', 2, 0, NULL, '.jpg', 600, 540),
(181, 'media_library/product/Lucky_whole_green_olives.jpg', 'Lucky whole green olives.jpg', 'image', 89388, '2026-04-22 12:12:06.377472', 2, 0, NULL, '.jpg', 600, 540),
(182, 'media_library/product/Blue_band_original_1.jpg', 'Blue band original 1.jpg', 'image', 106052, '2026-04-22 12:12:06.399631', 2, 0, NULL, '.jpg', 600, 540),
(183, 'media_library/product/Heinz_vinegar_568ml.jpg', 'Heinz vinegar 568ml.jpg', 'image', 60552, '2026-04-22 12:12:06.419172', 2, 0, NULL, '.jpg', 600, 540),
(184, 'media_library/product/Blue_band_original.jpg', 'Blue band original.jpg', 'image', 75306, '2026-04-22 12:12:06.438361', 2, 0, NULL, '.jpg', 600, 540),
(185, 'media_library/product/Golden_penny_butter_900g.jpg', 'Golden penny butter 900g.jpg', 'image', 137116, '2026-04-22 12:12:06.459900', 2, 0, NULL, '.jpg', 600, 540),
(186, 'media_library/product/Blue_band_butter_1.jpg', 'Blue band butter 1.jpg', 'image', 91714, '2026-04-22 12:12:06.482888', 2, 0, NULL, '.jpg', 600, 540),
(187, 'media_library/product/Blue_band_butter.jpg', 'Blue band butter.jpg', 'image', 104096, '2026-04-22 12:12:06.502958', 2, 0, NULL, '.jpg', 600, 540),
(188, 'media_library/product/Sara_hotdogs.jpg', 'Sara hotdogs.jpg', 'image', 100833, '2026-04-22 12:12:06.521918', 2, 0, NULL, '.jpg', 600, 540),
(189, 'media_library/product/Frolic_tomato_ketchup.jpg', 'Frolic tomato ketchup.jpg', 'image', 55560, '2026-04-22 12:12:06.542760', 2, 0, NULL, '.jpg', 600, 540),
(190, 'media_library/product/Pepsi_can_drink.jpg', 'Pepsi can drink.jpg', 'image', 65692, '2026-04-22 12:12:06.559657', 2, 0, NULL, '.jpg', 600, 540),
(191, 'media_library/product/7UP_soft_can_drink.jpg', '7UP soft can drink.jpg', 'image', 61450, '2026-04-22 12:12:06.576494', 2, 0, NULL, '.jpg', 600, 540),
(192, 'media_library/product/Indomie_belleful.jpg', 'Indomie belleful.jpg', 'image', 112847, '2026-04-22 12:12:06.593075', 2, 0, NULL, '.jpg', 600, 540),
(193, 'media_library/product/Barilla_spaghetti.jpg', 'Barilla spaghetti.jpg', 'image', 62026, '2026-04-22 12:12:06.609680', 2, 0, NULL, '.jpg', 600, 540),
(194, 'media_library/product/Turkey_gizzard.jpg', 'Turkey gizzard.jpg', 'image', 83944, '2026-04-22 12:12:06.632193', 2, 0, NULL, '.jpg', 600, 540),
(195, 'media_library/product/Indomie_hungry_man_size.jpg', 'Indomie hungry man size.jpg', 'image', 135985, '2026-04-22 12:12:06.676724', 2, 0, NULL, '.jpg', 600, 540),
(196, 'media_library/product/Zartech_chickeen_breast_fillets.jpg', 'Zartech chickeen breast fillets.jpg', 'image', 90720, '2026-04-22 12:12:06.707538', 2, 0, NULL, '.jpg', 600, 540),
(197, 'media_library/product/Mozzarella_butter.jpg', 'Mozzarella butter.jpg', 'image', 51942, '2026-04-22 12:12:06.734037', 2, 0, NULL, '.jpg', 600, 540),
(198, 'media_library/product/Polar_tomato_paste_tin_2200g.jpg', 'Polar tomato paste tin 2200g.jpg', 'image', 94657, '2026-04-22 12:12:06.758002', 2, 0, NULL, '.jpg', 600, 540),
(199, 'media_library/product/Simas_butter.jpg', 'Simas butter.jpg', 'image', 135642, '2026-04-22 12:12:06.779456', 2, 0, NULL, '.jpg', 600, 540),
(200, 'media_library/product/Chicken_thigh_drumstick.jpg', 'Chicken thigh drumstick.jpg', 'image', 78727, '2026-04-22 12:12:06.804568', 2, 0, NULL, '.jpg', 600, 540),
(201, 'media_library/product/Sonia_tomato_tin.jpg', 'Sonia tomato tin.jpg', 'image', 86361, '2026-04-22 12:12:06.828678', 2, 0, NULL, '.jpg', 600, 540),
(202, 'media_library/product/Jumbo_tiger_prawns.jpg', 'Jumbo tiger prawns.jpg', 'image', 106029, '2026-04-22 12:12:06.852930', 2, 0, NULL, '.jpg', 600, 540),
(203, 'media_library/product/Zartech_golden_frozen_whole_chicken.jpg', 'Zartech golden frozen whole chicken.jpg', 'image', 85041, '2026-04-22 12:12:06.874062', 2, 0, NULL, '.jpg', 600, 540),
(204, 'media_library/product/Frozn_Turkey.jpg', 'Frozn Turkey.jpg', 'image', 72406, '2026-04-22 12:12:06.895232', 2, 0, NULL, '.jpg', 600, 540),
(205, 'media_library/product/Olive_oil_cooking_spray.jpg', 'Olive oil cooking spray.jpg', 'image', 53384, '2026-04-22 12:12:06.924368', 2, 0, NULL, '.jpg', 600, 540),
(206, 'media_library/product/Devrica_tomato_mix.jpg', 'Devrica tomato mix.jpg', 'image', 87439, '2026-04-22 12:12:06.960926', 2, 0, NULL, '.jpg', 600, 540),
(207, 'media_library/product/Golden_penny_paste_twist_macaroni.jpg', 'Golden penny paste twist macaroni.jpg', 'image', 114852, '2026-04-22 12:12:06.989190', 2, 0, NULL, '.jpg', 600, 540),
(208, 'media_library/product/Antonio_amato_macaroni.jpg', 'Antonio amato macaroni.jpg', 'image', 107360, '2026-04-22 12:12:07.020340', 2, 0, NULL, '.jpg', 600, 540),
(209, 'media_library/product/Aeroplane_Rice_La_taste.jpg', 'Aeroplane Rice La taste.jpg', 'image', 111062, '2026-04-22 12:12:07.041219', 2, 0, NULL, '.jpg', 600, 540),
(210, 'media_library/product/Zer_Macaroni_makarna.jpg', 'Zer Macaroni makarna.jpg', 'image', 96292, '2026-04-22 12:12:07.058839', 2, 0, NULL, '.jpg', 600, 540),
(211, 'media_library/product/Golden_penny_pasta_spaghetti.jpg', 'Golden penny pasta spaghetti.jpg', 'image', 67671, '2026-04-22 12:12:07.077942', 2, 0, NULL, '.jpg', 600, 540),
(212, 'media_library/product/Maharani_suitable_for_diabetis.jpg', 'Maharani suitable for diabetis.jpg', 'image', 117319, '2026-04-22 12:12:07.101446', 2, 0, NULL, '.jpg', 600, 540),
(213, 'media_library/product/Antonio_amato_spaghetti.jpg', 'Antonio amato spaghetti.jpg', 'image', 61882, '2026-04-22 12:12:07.127464', 2, 0, NULL, '.jpg', 600, 540),
(214, 'media_library/product/Ayoola_pounded_yam_flour.jpg', 'Ayoola pounded yam flour.jpg', 'image', 108121, '2026-04-22 12:12:07.150390', 2, 0, NULL, '.jpg', 600, 540),
(215, 'media_library/product/Cardela_Fiyonl.jpg', 'Cardela Fiyonl.jpg', 'image', 116217, '2026-04-22 12:12:07.171464', 2, 0, NULL, '.jpg', 600, 540),
(216, 'media_library/product/Aani_Basmati_Rice.jpg', 'Aani Basmati Rice.jpg', 'image', 100872, '2026-04-22 12:12:07.190738', 2, 0, NULL, '.jpg', 600, 540),
(217, 'media_library/product/Elkris_Oat_Flour.jpg', 'Elkris Oat Flour.jpg', 'image', 87858, '2026-04-22 12:12:07.212197', 2, 0, NULL, '.jpg', 600, 540),
(218, 'media_library/product/Chicken_thigh.jpg', 'Chicken thigh.jpg', 'image', 73584, '2026-04-22 12:12:07.236948', 2, 0, NULL, '.jpg', 1080, 810),
(219, 'media_library/product/Yellow_garri.jpg', 'Yellow garri.jpg', 'image', 108970, '2026-04-22 12:12:07.259861', 2, 0, NULL, '.jpg', 1080, 987),
(220, 'media_library/product/Ayoola_Plantain_Flour.jpg', 'Ayoola Plantain Flour.jpg', 'image', 119017, '2026-04-22 12:12:07.287569', 2, 0, NULL, '.jpg', 1080, 810),
(221, 'media_library/product/henesy.jpg', 'henesy.jpg', 'image', 226093, '2026-04-22 12:22:03.290122', 2, 0, NULL, '.jpg', 964, 574),
(222, 'media_library/product/whiskycat.jpg', 'whiskycat.jpg', 'image', 24100, '2026-04-22 12:22:03.306425', 2, 0, NULL, '.jpg', 168, 260),
(223, 'media_library/product/beercat.jpg', 'beercat.jpg', 'image', 187578, '2026-04-22 12:22:03.323268', 2, 0, NULL, '.jpg', 768, 766),
(224, 'media_library/product/drinkcat.jpg', 'drinkcat.jpg', 'image', 103536, '2026-04-22 12:22:03.342591', 2, 0, NULL, '.jpg', 599, 487),
(225, 'media_library/product/juice.jpg', 'juice.jpg', 'image', 11451, '2026-04-22 12:22:03.360788', 2, 0, NULL, '.jpg', 177, 285);

-- --------------------------------------------------------

--
-- Table structure for table `core_newspost`
--

CREATE TABLE `core_newspost` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `sender_email` varchar(254) DEFAULT NULL,
  `target_audience` varchar(50) NOT NULL,
  `scheduled_time` datetime(6) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_page`
--

CREATE TABLE `core_page` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `content_category_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_pagesection`
--

CREATE TABLE `core_pagesection` (
  `id` bigint(20) NOT NULL,
  `layout_type` varchar(20) NOT NULL,
  `order` int(10) UNSIGNED NOT NULL CHECK (`order` >= 0),
  `category_id` bigint(20) DEFAULT NULL,
  `page_id` bigint(20) NOT NULL,
  `widget_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_securityauditlog`
--

CREATE TABLE `core_securityauditlog` (
  `id` bigint(20) NOT NULL,
  `event` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `ip_address` char(39) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` uuid DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_widget`
--

CREATE TABLE `core_widget` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `excerpt` longtext DEFAULT NULL,
  `child_fields` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`child_fields`)),
  `media_asset_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_widget`
--

INSERT INTO `core_widget` (`id`, `title`, `slug`, `excerpt`, `child_fields`, `media_asset_id`) VALUES
(3, 'gfdfhgjnm', 'gfdfhgjnm', '', '[\"title\", \"slug\", \"featured_image\"]', 224);

-- --------------------------------------------------------

--
-- Table structure for table `core_widgetpost`
--

CREATE TABLE `core_widgetpost` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `excerpt` longtext DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `shortcodes` longtext DEFAULT NULL,
  `icon` varchar(70) DEFAULT NULL,
  `image_align` varchar(50) DEFAULT NULL,
  `btn_text` varchar(100) DEFAULT NULL,
  `btn_url` varchar(200) DEFAULT NULL,
  `event_date` datetime(6) DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  `addfield1` varchar(255) DEFAULT NULL,
  `addfield2` varchar(255) DEFAULT NULL,
  `addfield3` varchar(255) DEFAULT NULL,
  `addfield4` varchar(255) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` uuid DEFAULT NULL,
  `featured_audio_id` bigint(20) DEFAULT NULL,
  `featured_image_id` bigint(20) DEFAULT NULL,
  `featured_video_id` bigint(20) DEFAULT NULL,
  `widget_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `core_widgetpost`
--

INSERT INTO `core_widgetpost` (`id`, `title`, `slug`, `excerpt`, `content`, `tags`, `address`, `subtitle`, `shortcodes`, `icon`, `image_align`, `btn_text`, `btn_url`, `event_date`, `progress`, `addfield1`, `addfield2`, `addfield3`, `addfield4`, `is_published`, `created_at`, `updated_at`, `author_id`, `featured_audio_id`, `featured_image_id`, `featured_video_id`, `widget_id`) VALUES
(3, 'fghjkl;\'', 'fghjkl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Read More', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-24 11:52:50.943827', '2026-04-24 11:52:50.943936', '739e68c0-c463-422d-b7f1-023f79566e65', NULL, 225, NULL, 3),
(4, 'rzgxfhcjvb', 'rzgxfhcjvb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Read More', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2026-04-24 11:54:37.950242', '2026-04-24 11:54:37.950378', '739e68c0-c463-422d-b7f1-023f79566e65', NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` uuid NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'accounts', 'address'),
(3, 'accounts', 'customuser'),
(4, 'accounts', 'department'),
(5, 'accounts', 'position'),
(6, 'accounts', 'rolepermission'),
(39, 'admin', 'logentry'),
(40, 'auth', 'group'),
(41, 'auth', 'permission'),
(21, 'cart', 'cart'),
(22, 'cart', 'cartitem'),
(23, 'cart', 'wishlist'),
(42, 'contenttypes', 'contenttype'),
(24, 'core', 'activitylog'),
(25, 'core', 'appvariable'),
(26, 'core', 'banner'),
(27, 'core', 'broadcastlog'),
(28, 'core', 'category'),
(29, 'core', 'categorypost'),
(30, 'core', 'contactus'),
(31, 'core', 'externalsubscriber'),
(32, 'core', 'mediaalbum'),
(33, 'core', 'mediaasset'),
(34, 'core', 'newspost'),
(35, 'core', 'page'),
(46, 'core', 'pagesection'),
(36, 'core', 'securityauditlog'),
(37, 'core', 'widget'),
(38, 'core', 'widgetpost'),
(1, 'django_summernote', 'attachment'),
(19, 'order', 'order'),
(20, 'order', 'orderitem'),
(44, 'order', 'ordertracking'),
(45, 'order', 'trackingstatus'),
(7, 'payment', 'payment'),
(8, 'payment', 'paymenthistory'),
(9, 'payment', 'refund'),
(10, 'product', 'brand'),
(47, 'product', 'color'),
(11, 'product', 'product'),
(12, 'product', 'productcategory'),
(13, 'product', 'productinventory'),
(14, 'product', 'productmedia'),
(15, 'product', 'productreview'),
(16, 'product', 'productvariant'),
(48, 'product', 'size'),
(17, 'product', 'supplier'),
(18, 'product', 'variantattribute'),
(43, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-03-24 16:07:41.389085'),
(2, 'contenttypes', '0002_remove_content_type_name', '2026-03-24 16:07:41.575355'),
(3, 'auth', '0001_initial', '2026-03-24 16:07:42.200354'),
(4, 'auth', '0002_alter_permission_name_max_length', '2026-03-24 16:07:42.442284'),
(5, 'auth', '0003_alter_user_email_max_length', '2026-03-24 16:07:42.564619'),
(6, 'auth', '0004_alter_user_username_opts', '2026-03-24 16:07:42.699238'),
(7, 'auth', '0005_alter_user_last_login_null', '2026-03-24 16:07:42.832767'),
(8, 'auth', '0006_require_contenttypes_0002', '2026-03-24 16:07:42.871708'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2026-03-24 16:07:43.069681'),
(10, 'auth', '0008_alter_user_username_max_length', '2026-03-24 16:07:43.250133'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2026-03-24 16:07:43.534582'),
(12, 'auth', '0010_alter_group_name_max_length', '2026-03-24 16:07:43.698153'),
(13, 'auth', '0011_update_proxy_permissions', '2026-03-24 16:07:43.900147'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2026-03-24 16:07:43.939295'),
(15, 'accounts', '0001_initial', '2026-03-24 16:07:45.530047'),
(16, 'admin', '0001_initial', '2026-03-24 16:07:45.873992'),
(17, 'admin', '0002_logentry_remove_auto_add', '2026-03-24 16:07:46.219274'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2026-03-24 16:07:46.498484'),
(19, 'core', '0001_initial', '2026-03-24 16:07:49.881586'),
(20, 'core', '0002_mediaasset_replace_existing_and_more', '2026-03-24 16:07:50.224339'),
(21, 'core', '0003_mediaasset_duration_mediaasset_extension_and_more', '2026-03-24 16:07:50.787667'),
(25, 'django_summernote', '0001_initial', '2026-03-24 16:07:56.404273'),
(26, 'django_summernote', '0002_update-help_text', '2026-03-24 16:07:56.429943'),
(27, 'django_summernote', '0003_alter_attachment_id', '2026-03-24 16:07:56.789292'),
(33, 'sessions', '0001_initial', '2026-03-24 16:07:58.914709'),
(45, 'core', '0004_alter_mediaasset_file', '2026-04-22 11:20:33.732210'),
(46, 'core', '0005_pagesection', '2026-04-25 21:41:15.926892'),
(50, 'accounts', '0002_rename_full_name_address_country', '2026-04-26 00:25:06.077166'),
(51, 'accounts', '0003_rename_country_address_country', '2026-04-26 00:31:52.089696'),
(63, 'product', '0001_initial', '2026-05-02 09:55:06.107615'),
(64, 'order', '0001_initial', '2026-05-02 09:55:10.845445'),
(65, 'order', '0002_initial', '2026-05-02 09:55:11.349315'),
(66, 'cart', '0001_initial', '2026-05-02 09:55:15.643650'),
(67, 'cart', '0002_initial', '2026-05-02 09:55:16.150747'),
(68, 'payment', '0001_initial', '2026-05-02 09:55:20.556092'),
(69, 'product', '0002_alter_productvariant_weight', '2026-05-02 23:30:12.127432'),
(70, 'product', '0003_alter_productinventory_quantity_and_more', '2026-05-06 01:28:39.765458'),
(71, 'order', '0003_alter_orderitem_variant', '2026-05-10 14:21:44.410198'),
(72, 'order', '0004_order_note', '2026-05-10 14:29:30.487292'),
(73, 'order', '0005_rename_note_order_order_notes', '2026-05-10 14:52:00.533541');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1audo5khzhxdl3ljhb2qd3c8ztcf3gt8', '.eJxVy0GKwzAMQNG7eN2EyJFjK8tZdNczBFlSiGloYewUSpm7DwNdTLef_15u4aNty1HteynqZudXNIIsXRIOHa45d8wZu9F7NDYL4zS403-WWa52-7Mscj9urfbvVPvLsbdyLrbr5a62f73XD79x3dzs0oBEFhUm5pSUQxpE1uwRJkLORKwoAlmDDuhpJCVjPwIpYIiB3cntXNvC0sqjtKebIcaEECimPgKhn35-AbKPS1g:1wM3Eg:SXzvLvAjnxg2MydCYx2kyvIIBIP1aEmtM5Nd_i8KJr8', '2026-05-10 12:56:18.804067'),
('66ha53rqxwx72drg8zkn0tj230ad5oai', '.eJxVy0FqwzAQQNG7zDo20mg0krzsorucwYxGMhY1CVRyIYTevRSyaLef_56wyjn29ez1c20FFoiuulyZpuJDnUgRp1RCmjxpRo2GI0e4_GVZ9KPefq2o3s_b6PMr9fl6HqO9t3qU673U4-21_vO79B0WICRkshtzxiJVCI04ZCfWs2fDWqLVDXWzwWdfYw5KKW8-lCiUKcMFDuljFR3tq40HLDaESGRcCnPg5A1__wDMkkpG:1wM9aX:ffme-b-Cdrpwpljslu0IB4WyK1NiUKnEpBHL35PCjiU', '2026-05-10 19:43:17.771724'),
('a4mbmxcex8xv6rlbqutwz5k2cfrvunfv', '.eJxVy0FqwzAQQNG7zDo2ljQaSV52kV3OYEajMRYxCVRyIITevRSyaLaf_16w8NG35Wj6vdQCM0SnLivhUHzQAcXaIZWQBo-SrcSJIkU4_WeZ5aq3P8si9-PW2_hObbwce6_nqnu53IvuX-_1w2_cNpgBLVpCsxJlW1gZ7cTOkmPjydNEUqKR1cpqgs9eYw6CKa8-lMiYMcMJdm59Yen1UfsTZhNCdM5PPo2GApr08wvMTUo_:1wLiBX:-93uHi0hgib5Mg4Jch67Nj6XxHf79PXc6xGqo0J3ask', '2026-05-09 14:27:39.191568'),
('awhceu29abg3m1slrex64bzmlokkp7vd', '.eJxVy0FqwzAQQNG7zDo21mg0krzsIrucwYxGMhYxCVRyIITevRSyaLaf_16wyNG35Wjle6kZZgi22FSYhux8GUgRh5h9HBxpQg0TBw5w-s-S6LXc_qyo3o9bb-M7tfFy7L2ea9nz5Z7L_vVeP_wmbYMZCAmZzMqcMEsRwkksshXj2PHEmoPRFXU13iVXQvJKMa3O5yCUKMEJdml9Ee31UfsTZuN9sM74SOPEwUX8-QXMi0pF:1wLmXS:2Omh7gH-fz2oCszt0nu5h81WthgOiPb5_TZdAGY29-M', '2026-05-09 19:06:34.192124'),
('bd86051jqk2itpf13w7hcd09nqfinglo', '.eJxVy8FqwzAMgOF38bkJkmJbco877NZnCI6sELPQQu0MRum7j0IP2_Xn_x5uzkff5qPZfa7FnR1PyaIoDOrjNHiiMiy84gA0rZxCjBaDO_1lS9Yvu75sVr0d197Gd2rj5dh7_ay2l8ut2P7xXv_5LbfthdlTIciAZIYRIpYkGjghrKCygEcksKSoIoIc0GOYgHgRn0xWd3J7bn3O2ut37T_ujMziiQPRKD6i0PMXKxpIVA:1wM6Es:SlZMgjI0uOLSXRSHBb4GquNPe1kAMbKhZbDQwqab520', '2026-05-10 16:08:42.915126'),
('dw5xculwrhgqlcip3e607ku6kjisaqxw', 'e30:1wFYal:Xj7k5mMXVZ4tiatiBA-K0vlAfhea21rr1FoeJrfXK-s', '2026-04-22 15:00:15.463071'),
('dyb075a0pub1c317ujcptrmj8kinebn6', '.eJxVzEFqwzAQheG7zDo2kjyyNV5mkZ3PYEYzYyxqEojkQim9ewlk0W4f__e-YeWz7etZ7bkWhRnChkY-S5eEY4dbzh1zxm4IAY3N4jA6uPxlmeXD7i_LIo_z3mr_nmq_nEcrt2KHLg-14_pO__md6w4zJIdENqkfmVNSjsmJbDmgHwk5E7GiiM8a1WGggZSMw-BJPcYpMlzg4NpWllY-S_uC2U_TmPzroHeeYog_v7HRS0M:1wFK4m:WS9gER7rhwNDl7SgIYIdz47fzU0RJanRkrir2caLpuc', '2026-04-21 23:30:16.067034'),
('dz8qz0h7l6jx6339pvsjshmwrjwy12px', 'e30:1wFavL:7ykjlW7QCL03bDw63HlvFUPHAwBzTtKVgA4Tp7h0QI4', '2026-04-22 17:29:39.656158'),
('e66nzsm47egzz8hap10ob77n0epek0l6', '.eJxVy01qwzAQQOG7aB0b_YwsjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNYbLm9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObbAFRk7iJKGehmC3zWjy4CYEKIgkwuyJRLHgMKKjkg0NxEFMkczI7tb4Q9_qo_Wlml1LyIYUYRhctev_zC7HgS0I:1wH6cc:Csx53IJtFzAabhQFOrSA2shUXRwK0c8oFVvUUKqvrpw', '2026-04-26 21:32:34.665115'),
('eae4g7glv6w5gjvlmtzc1sbxljfenw5a', '.eJxVy8FqwzAMgOF38bkJkS3HVo477NZnCLKkELPQwuwMStm7j0EP2_Xn_55u5bPv69nsc63qFuc3NIIiQxaOA26lDMwFh-A9GpvFME_u8pcVlg-7_VoWuZ-33sZXauP1PHp9r3bo9a52vL3Wf37ntrvF5QmJLCnMzDkrxzyJbMUjzIRciFhRBIpGndBTICVjH4AUMKbI7uIObn1l6fWr9odbIKUEIeccR59CAvr-AbJqS1Y:1wGh0P:9ljp5_JVTcwvYJRnXOcYcy89WjOzsM542mrxJEMK0t4', '2026-04-25 18:11:25.299279'),
('efnfmubgkcbihxtoj8g8pigmsgwlh38v', '.eJxVy01qw0AMQOG7zDo286OxJS-76C5nMBpJxkNNAp1xIYTevRSyaLeP9z3dymff17PZ51rVLS5uYBSKDCicB9hKGZgLDClGMDbLafLu8pcVlg-7_VoWuZ-33sZXauP1PHp9r3bo9a52vL3Wf37ntrvFoQcimzVMzIjKGb3IViKEiYALESuIhKJZPURKpGQcUyANkOfM7uIObn1l6fWr9odbwjwDoEf0Y54IE33_ALJSS1k:1w5XXM:OB8aDmo3yQeNFks-AKIOU2bnQ3Mf1E4hjkuilWvW2fc', '2026-03-25 23:51:20.592590'),
('enlf5qmxgo9jl038f64ezm7cybe4kzuq', 'e30:1wGgz2:TPFhUSE1Yq584lWSEmvZjpvoiUxk83hxunlSJlvNgyY', '2026-04-25 18:10:00.066757'),
('euxdfomhz18r7blwj8crdmokfih93b1n', 'e30:1wH69K:uMglYW9OmEVxQYGz4yoW_ovsszIn9D8Z2wNheFps3lw', '2026-04-26 21:02:18.721308'),
('f8ink4bnyjk06rqh5lu6znfh4gwm86bu', '.eJxVy01qwzAQQOG7aB0bjTT6GS-76C5nMKPRGIuaBCq5EELvXgpZtNvH-55m5XPs69n1c23VLMZtqARFpiwcJtxKmZgLTt45VFYNPlpz-csKy4fefi2L3M_b6PMr9fl6HqO9Nz3q9V71eHut__zOfTeLyRaJNFWIzDlXDtmKbMUhREIuRFxRBEoN1aIjT5WUnQeqgCEFNhdzcB8ry2hfbTzMAikhJogW5uRDdPD9A7HBS0A:1w5V7h:4n3oJeO191s6fNhfH1MLF70k17kO7wqMbg2MlJjt5n4', '2026-03-25 21:16:41.752782'),
('fbw1xz7ee7i9ue0v4ny18jfk287rm0pk', 'e30:1wHH1n:LdcOgygJ19Y30T1VpBs3A_4_Dgg20-UqdQCukwQkrZU', '2026-04-27 08:39:15.662451'),
('fgx6mej6wo1n9l9uxll1gp5ogekomzk2', '.eJxVy01qw0AMQOG7zDo28yN5Rl520V3OYDSSjE1NAp1xIYTevRSyaLeP9z3dwmfflrPZ57Krm11cwShUGYowDrDWOjBXGFKMYGyGafLu8pdVlg-7_VoWuZ-33sZXauP1PPr-vtuh17va8fZa__mN2-ZmVzwQWdYwMZeijMWLrDVCmAi4ErGCSKiK6iFSIiXjmAJpAMzI7uIObn1h6fvX3h9uDjkDUSqEIyL6kL9_ALK8S1c:1w7gzn:vausAgjo7FCFRlvcDny-HMLLZfmm0B-tn11K4kY_91Q', '2026-03-31 22:21:35.807542'),
('fnwmt7yvoz1hgi1xmoy6o3um8bstv1ih', '.eJxVy8FqwzAMgOF30bkJsS07Vo477NZnCLKkELPQwuwMStm7j0EP2_Xn_56w8tn39Wz2uVaFBfyGRq7IkIXjgFspA3PBIXiPxmYxpAkuf1lh-bDbr2WR-3nrbXylNl7Po9f3aode72rH22v953duOyyQJySyWV1izlk55klkKx5dIuRCxIoirmjUCT0FUjL2wZE6jHNkuMDBra8svX7V_oDFzXOiFD36MWPMOXz_ALJ4S1c:1wFxpi:KqDPWPft9CSeaR4hzycWtSyFNOBEkxejpME7282sfP8', '2026-04-23 17:57:22.874126'),
('gbqcnhekflsx1ivahruwgzvg0mciv95o', 'e30:1wHIRx:RkssANP2t6n9-goGJcQ7ELl0CQTOiO5jSrMPkpuG3ag', '2026-04-27 10:10:21.875933'),
('ggq0ktsq25ctx0bwhticc4nlqq1omjdk', 'e30:1wGhjX:BF-3dpJ4pke_8v8S94RqLm2mtgwxrkZcybARd2HCODQ', '2026-04-25 18:58:03.475572'),
('gn0s8krgpjegnwshzj17d9ov0q188uxw', 'e30:1wM4u4:pYhqHF8axnv5cEqAUxeOHcCAHN2MFdjUN-k3zhZYeV4', '2026-05-10 14:43:08.190546'),
('gwrjlth4brqu1xaftcbve0a3h4l4zkhc', '.eJxVy01qwzAQQOG7aB0bSxr9jJddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNWULSFh8wUBlhLGYgKDN45UFINPk7m9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObPAGiJrGRKGehkCfmtTiwEYEKIgkw2yJBJnDoUVDJeYtiIaRA5mR2an0h7vVR-9PMNqXkIvqAo40-B_fzC7JvS1M:1wHEwq:D60HjJRUMoiRF4ka2ldfaDGfSYJYqKjQMR9bDB9ztP4', '2026-04-27 06:26:00.976912'),
('gyxvctz9nvfzrjvvj7378d83a4n4clb1', 'e30:1wGkGw:1DuKJeF2VA5PKDoyIowd0gW3Y3YHyCz3EdwZ_H_uuvI', '2026-04-25 21:40:42.069290'),
('hvi95395xg2h3cdaak7klr3qo68qln1d', '.eJxVy8FqwzAMgOF38bkJtiwnVo477NZnCLKkELPQwuwMStm7j0EP2_Xn_55u5bPv69nsc63qFgcbGoUiQxZOA26lDMwFhwiAxmYpTt5d_rLC8mG3X8si9_PW2_hKbbyeR6_v1Q693tWOt9f6z-_cdre47JHIZg0Tc87KKXuRrQCGiZALESuKhKJJPQJFUjKGGEgDpjmxu7iDW19Zev2q_eGWMM8TRCKA0QOQD98_se1LQA:1wCv90:9QU4kC1G9DpCTSatfCvFuj31iDHN5qGDrpeGVySvCK0', '2026-04-15 08:28:42.116838'),
('hz68vf4901sxbohjlsukbs71glpgqz72', '.eJxVy8FqwzAMgOF38bkJli3HVo477NZnCLKkkLDQwuwMStm7j0EP2_Xn_55u4bNvy9nsc9nVzS6saARVhiKcBlxrHZgrDjEENDZLcfLu8pdVlg-7_VoWuZ-33sZXauP1PPr-vtuh17va8fZa__mN2-ZmVzwSWVaYmEtRTsWLrDUgTIRciVhRBKom9RgokpJxiEAKmHJid3EHt76w9P1r7w83Q845A_kIYwkhI3z_ALICS0U:1wJ7vc:tPj4-J6MC01UnseLnH-MH4y7UQ9gtx02VmCjAOH64MM', '2026-05-02 11:20:32.088411'),
('i29zug11gkpt20ke6w3qgsdkt55m29iy', 'e30:1wFYEE:sg5OtXexTkMVRlxWB7sxLuifN4FvCk06CS4VwMLZpnI', '2026-04-22 14:36:58.189217'),
('ijqf0i3dzn3povjw5g7y7dsgaen3zq40', '.eJxVyz1qxDAQQOG7qLbNjKyfkcst0u0ZhDwaYxFnDZYUCCF3DwtbJO3jfd8qpt722KtcsWS1KD8HccQwsnHzaLTO4-o3HEHPmw_WOXFWDX_ZmvhdHk-bmM_-aHV6pTrd-9HKW5Ej388sx-21_vN7qvsTe6OzhgSoRdCBwxyIrQ8IGzCtYBA1SGBkIkJv0aCdQfuVTBDa1KCOVFtM3MpnaV9qQe_JWAMWJgxkwAyK09Xix5nLViSrpV1dfn4BaJFQAQ:1wMD8k:Q4euTlqS3kDxtdpS1tWBNj4-ErRO8vYFjQBGKojjCSc', '2026-05-10 23:30:50.276748'),
('j2xojto3dpc0zh901z5aeurqrixr70uu', 'e30:1wGlyd:-81-5O4bwGUp-50cktm2Woj3hQpQ_gA2NHw8ntHer5A', '2026-04-25 23:29:55.886660'),
('jdd179gp5kfhu1lsjl7midsjbw5z93nh', 'e30:1wEshi:jxJl-nuh1ebju-FRGd17zpCsdipWaRL9ti70Hew0T94', '2026-04-20 18:16:38.779820'),
('jlgqek1093yi1u6aeb8r5fatq8p2gbqn', '.eJxVy01qwzAQQOG7aB0bSxr9jJddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNWULSFh8wUBlhLGYgKDN45UFINPk7m9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObPAGiJrGRKGehkCfmtTiwEYEKIgkw2yJBJnDoUVDJeYtiIaRA5mR2an0h7vVR-9PMNqWUYrA5jh7AQ_75BbJuS1M:1wJJw2:oCuDjwaLKhcmV_MCN1NL02G_x2ivHANVuoB3HPgQdSk', '2026-05-03 00:09:46.772056'),
('jlk5y3zj7fa0114a8xtqpnfbah7e4t4d', 'e30:1wFBhV:eZxpTHfIM-m_txJBFNA8kYVY4svsLpgY5ob_qoTAIvU', '2026-04-21 14:33:41.094674'),
('jo0vxyjmnyzbtq8kbr1vr372u7wzclz9', 'e30:1wFq4x:lCnP_lKBxa47uRjwiQW2Xa14ii_hyvZut777zSaj1Qw', '2026-04-23 09:40:35.750746'),
('js9pxstnetp2lg8xsvina78ktqnmmib7', '.eJxVy01qwzAQQOG7aB0b_YwsjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNYbLm9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObbAFRk7iJKGehmC3zWjy4CYEKIgkwuyJRLHgMKKjkg0NxEFMkczI7tb4Q9_qo_Wlml1JKzqaQR7DeTT-_ZvRLDw:1wJ5lq:qhlKnFWpGlTJFUsedXsljyo8Zk2kCm8aOfju74vVIf8', '2026-05-02 09:02:18.505360'),
('jygy5svtr3519u56g42uf2tz36i54ke6', '.eJxVy01qwzAQQOG7aB0b_YxkjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNIVlz-s8K8VVvf5aY78ett_Gd2ng59l7PVXe53EX3r_f64Tdqm5lNtoCok7hElLNQzJZ5LR5cQqCCSALMrkgUCx4DCir54FAcxCmSOZmdWl-Ie33U_jSzmyYIOWZMYwIfbPr5BbJ1S1E:1w58pN:GZRt76tSyrcU6L9TU2s3bSOKXmX5wXUyy8JYBjduW_o', '2026-03-24 21:28:17.548777'),
('k1o80jh6g8y8z5bne4cts0i9o8vl4bnw', '.eJxVy0EKwjAQQNG7ZG3LTJpkMi5duPMMJZ1MabAomFQQ8e4iuNDt57-nGdPWlnGrehtLNntDA2uIAp24MHTO2txNNGMHdpiJfQgavNn9sinJWS8fm0Su26XV_ptqf9rWVo5F13y6Zl0P3_XPL6kuH0zOZgsJ0KpigICZo3hihBkkTuAQLSgLSowRyaNDP4ClKTrWOJudWVNtY5JW7qU9zB6JCH1Axz2T8_x6A-MjSCw:1wGlUs:oXq3mD3TL-bAsCWTYAJ5_qBdBvHtNKke5GZ5GLdNHWI', '2026-04-25 22:59:10.241195'),
('kn34jq9lno9t7or1f3gectv921s4643r', '.eJxVy8FqwzAMgOF30bkJtiPHVo477NZnCLKkELPQwuwMStm7j0EP2_Xn_56w8tn39Wz2uVaFBcKGRr7IkIXjgFspA3PBYQoBjc3iNDu4_GWF5cNuv5ZF7uett_GV2ng9j17fqx16vasdb6_1n9-57bBAdkhkSf3MnLNyzE5kKwH9TMiFiBVFfNGoDgNNpGQcJk_qMabIcIGDW19Zev2q_QGLTym7nILPY0pIlL5_ALJ3S14:1wKfi7:9-KJmnuuzq4beyQZhVSPo4aDN-RTp1xlAB9T_RD5-Bo', '2026-05-06 17:36:59.071732'),
('ko4uwofwa9lghjf7gatfcjweaslgr6tu', '.eJxVy01qwzAQQOG7aB0b_YwsjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNYbLm9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObbAFRk7iJKGehmC3zWjy4CYEKIgkwuyJRLHgMKKjkg0NxEFMkczI7tb4Q9_qo_Wlml1JyNuZsx4whoP_5BbIiS1A:1wGYQ5:O8a7_aycm4YozXoBk6Cg8Opk0UBw4VRwtH_nz0N9PLg', '2026-04-25 09:01:21.172802'),
('mac5zw6ih7kg4mp80uf9tns20gjj8z9m', '.eJxVy82qwjAQQOF3ydqWmfzNxOVd3J3PUNLJlAaLgkkFEd_9Iri4bg_ne5op732d9qa3qRZzNOSSRhYYxEc3eGvLMNOCA1i3UAoxagzm8J_NWc56edssct0vvY2f1MbTvvX6W3Urp2vR7eezfvk1t_WNydtiIQNaVYwQsSSWQAlhAeEZPKIFTYLCzEgBPQYHlmb2SXkxB7Pl1qcsvd5rf5gjErHz3gGPBAQ2vv4AKuZITQ:1wLkaj:kG5I4ahp006cS9nRH0iHpQ94gUDvlUMBby9RReuyCYw', '2026-05-09 17:01:49.183205'),
('mrnc4b3em8pjyfyl6furmsfzsi7vex58', '.eJxVy01qwzAQQOG7aB0b_YxkjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNIVlz-s8K8VVvf5aY78ett_Gd2ng59l7PVXe53EX3r_f64Tdqm5lNtoCok7hElLNQzJZ5LR5cQqCCSALMrkgUCx4DCir54FAcxCmSOZmdWl-Ie33U_jSzm6aECVNOo3eANvz8ArLLS1Y:1wFyzO:b9zNTQZF3oXvj9YRwS-VSMDjcxsnQBLcY3hNORwn638', '2026-04-23 19:11:26.426267'),
('mt05gv9m60534xgmm6b1aaokshss5lhr', 'e30:1wF6m1:JpR3urHKqw5IzI0JNxdzMhRa3yPWmjhx_WmiN3_IHdc', '2026-04-21 09:18:01.773999'),
('mw4tn3i0xc628h23jk8befqeby2khvu7', '.eJxVy8tqwzAQQNF_0To2eowe42UX3eUbzGhmjEVNApVcCKH_XgpZtNvLPU-z0jn29ez6uTYxi_EbKLrKU2GKE2y1TkQVpuA9KKnGkKy5_GWV-ENvv5aY7-dt9PmV-nw9j9Hemx5yvYseb6_1n9-p72YxxQKiZnGJqBShWCzzVj24hEAVkQSYXZUoFjwGFFTywaE4iDmSuZiD-liJR_tq42EWl3OyNuVQ5pBDCf77B7HvS0k:1wBwTy:tXyHlxwEo_QEbk2HxAkXmbxAWO_7_iusnOHT69446xQ', '2026-04-12 15:42:18.399693'),
('mww0akrbp81ninax2752bly06ixqe4kt', 'e30:1wHkLb:rCjqqHJHKqdie8cSw9ayfluCxPzVeaEunFnd4jLwrho', '2026-04-28 15:57:39.765876'),
('nlg9um8s6155822hpb90vywmco5psjj9', 'e30:1wDpEx:V_BbTJ1MNEYQufAdkwzNqG0rCQcScL5CwbRXVxLdGHU', '2026-04-17 20:22:35.162553'),
('ny45866lemt47r3w5mg53w64psbvvzpv', 'e30:1wFu1e:AwzPQ2TQOiP7FoliRKIJ8OLIryvaVe9DRFwy3DY7GQE', '2026-04-23 13:53:26.462427'),
('odtnm7jqwpdxs140056s6p317snpz0vz', '.eJxVy8FqwzAMgOF38bkJtiLHVo477NZnCLKkELPQwuwMStm7j0EP2_Xn_55u5bPv69nsc63qFgcbGoUiQxaOA26lDMwFhwkAjc3iNHt3-csKy4fdfi2L3M9bb-MrtfF6Hr2-Vzv0elc73l7rP79z293iskciSxpm5pyVY_YiWwEMMyEXIlYUCUWjegSaSMkYpkAaMKbI7uIObn1l6fWr9odbQkrJA4BPY5wx-_z9A7GaS0Q:1wGCeW:2En-bUugfvgGFH5dS9tLkEXwrnBgR-ncc5xKoSfEeNg', '2026-04-24 09:46:48.061828'),
('omopgi25b6etx3p0w4iqb15t2gsetoei', 'e30:1wLFsc:w-T7FHVMzxQGcINT6zCBv1HM2hhu5Tij17ErelSOg5g', '2026-05-08 08:14:14.148840'),
('os233k9ltpirt8bmxqxuiqjsadutpugb', 'e30:1wGWTa:JS6YHTG8fP7AkC1PeSTd_5tWf8rRCHhv2XmT4H7DKlQ', '2026-04-25 06:56:50.941593'),
('pj9wb1elxd7lvltuiat8qf2zzba5jmfb', '.eJxVy01qwzAQQOG7aB0b_YxkjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNIVlz-s8K8VVvf5aY78ett_Gd2ng59l7PVXe53EX3r_f64Tdqm5lNtoCok7hElLNQzJZ5LR5cQqCCSALMrkgUCx4DCir54FAcxCmSOZmdWl-Ie33U_jSzm6aYrU8xjQ4DePz5BbIQS00:1wB5OK:3kfxIAb6wAphEUcKslwFdAwx3FYYdFp9Q00sM4yeG2Q', '2026-04-10 07:00:56.375405'),
('pju9qh9r4m4sj0eawypzjlmee3e6xhc4', '.eJxVy82qwjAQQOF3ydqWmfzMJC7v4u58hpJOpjRYFEwqiPjuF8HFdXs439NMee_rtDe9TbWYo2GXlKLAIJ7c4K0tw8wLDmDdwikQKQVz-M_mLGe9vG0Wue6X3sZPauNp33r9rbqV07Xo9vNZv_ya2_rG7G2xkAGtKhIQlhQlcEJYQOIMHtGCJkGJMSIH9BgcWJ6jTxoXczBbbn3K0uu99oc5IjMlskg8QiJw9PoDKz5IVg:1wFx27:kbpsHtLDnaamSiXntk3re2OgJOQdcMzHm58rq6mHync', '2026-04-23 17:06:07.313596'),
('pmhskkfrwj3a185gmx77y0i4qhzjby73', '.eJxVy01qwzAQQOG7aB0b_YwsjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNYbLm9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObbAFRk7iJKGehmC3zWjy4CYEKIgkwuyJRLHgMKKjkg0NxEFMkczI7tb4Q9_qo_Wlml9IUgk05jCkAIPz8ArIMS04:1wDImV:CPTH8IHsDOexGOjWMvsy_SU3WLN0FG27oYF6UrElGTw', '2026-04-16 09:43:03.852383'),
('prkstoqen9psp24bqmqa1gamb00685y2', '.eJxVy01qwzAQQOG7aB0b_YwsjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNYbLm9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObbAFRk7iJKGehmC3zWjy4CYEKIgkwuyJRLHgMKKjkg0NxEFMkczI7tb4Q9_qo_Wlml1Ly2YPLY7I5OPz5BbIcS00:1wHILS:oQoANV0mNkRrZu_ueT55pR8TpVMl_1FmUWKBGNJd5yI', '2026-04-27 10:03:38.762850'),
('q41jiw47moi61yjyi0w6g9rdff7nf5hw', 'e30:1wFqOo:CzqKqqXCGxC8BGgFkiJ5JsI7SawzHAcnHy4C33UPCmU', '2026-04-23 10:01:06.037558'),
('qgjkpmhv47duorldl2fhc1eaialn0v4p', '.eJxVy8tqwzAQQNF_0To2eowe42UX3eUbzGhmjEVNApVcCKH_XgpZtNvLPU-z0jn29ez6uTYxi_EbKLrKU2GKE2y1TkQVpuA9KKnGkKy5_GWV-ENvv5aY7-dt9PmV-nw9j9Hemx5yvYseb6_1n9-p72YxxQKiZnGJqBShWCzzVj24hEAVkQSYXZUoFjwGFFTywaE4iDmSuZiD-liJR_tq42EWl3MqydkMM_gQPXz_ALIGS0U:1wFWja:6agq6w9XVqdy5NYMcraXTeqhX77ZCROCNxWfEYyy_HY', '2026-04-22 13:01:14.426801'),
('qhm2jiyfzblff5d5phj5yrhedywfdar9', 'e30:1wHcGp:D62JDaEeyZE4Z0FRFREdndlDJz-6tvQe5g5dx9wmMpc', '2026-04-28 07:20:11.144048'),
('r5mw6zv1w46akt9tyfgizx510l5mmoek', '.eJxVy01qwzAQQOG7aB0bSxr9jJddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNWULSFh8wUBlhLGYgKDN45UFINPk7m9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObPAGiJrGRKGehkCfmtTiwEYEKIgkw2yJBJnDoUVDJeYtiIaRA5mR2an0h7vVR-9PMNqXoU4SAY8wBHPz8ArKGS1Y:1wDUfD:7oZkdaNQHXkWTIJww06RRWYZqGU-GFP0GOphai8NWDU', '2026-04-16 22:24:19.906909'),
('rnlzhufndvh0fxhm3zwmbo7e2st6b3ja', '.eJxVy01qwzAQQOG7aB0b_YwsjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNYbLm9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObbAFRk7iJKGehmC3zWjy4CYEKIgkwuyJRLHgMKKjkg0NxEFMkczI7tb4Q9_qo_Wlml1L2wTqLI9gE6H5-AbGiS0E:1wLGsn:Zwdej3XkB7DCq85VOnj6rjZmHGpHfe8YVL6nhjJuE_E', '2026-05-08 09:18:29.728665'),
('rs1ojaf1ywuzpmofvxbdbx8pe4b0bvtr', '.eJxVy0EKwjAQQNG7ZG3LzDTJJC5duPMMJZ1MabAomFQQ8e4iuNDt57-nGdPWlnGrehtLNnvDQ1QfBDqxfugsUe4mnrEDGmaOznv1zux-2ZTkrJePTSLX7dJq_021P21rK8eiaz5ds66H7_rnl1SXD2ZLmSABkip68JhjEMcRYQYJE1hEAo2CEkJAdmjRDUA8BRs1zGZn1lTbmKSVe2kPs0dmRuuihZ4iIL7e4shIFA:1wGiqC:WDPPf3FV2gS4ARXXCuL2Pvp1UU7SAWuJpZ2dx77cpJo', '2026-04-25 20:09:00.944272'),
('s8v9gr8pu2az660eb2m2d4q455xaxr9v', 'e30:1wHOTz:FvFFRB6O-a9p2EdFRcJSyLTI-jca1PCOiJwVsHuwpM8', '2026-04-27 16:36:51.026176'),
('siqdw1gwhg71brvzjb3szp88xp2k72n6', 'e30:1wH5qS:GwdTdB66pgEsG_LMcRPZ1TR-Z4GPBkRkSz6s2_JpvP8', '2026-04-26 20:42:48.342769'),
('t64k5sxeomnghy7i7sjtqe4sw2fncrn0', '.eJxVy82qwjAQQOF3ydqWmcnPJC7v4u58hpJOpjRYFEwqiPjuF8HFdXs439NMee_rtDe9TbWYo2GbNESBQVywgyMqw8wLDkB24eRD0ODN4T-bs5z18rZZ5Lpfehs_qY2nfev1t-pWTtei289n_fJrbusbs6NCkAFJFQMELCmK54SwgMQZHCKBJkGJMSJ7dOgtEM_RJY2LOZgttz5l6fVe-8MckZkpOY9-tJ7AhdcfKv5ITg:1wHLUZ:4crc6F9pz8lLKjV1WA3eL8O6YwwhSo0KF0fUUB3WXnU', '2026-04-27 13:25:15.373155'),
('t8n5g4kor7onrbo4w0bspojk7123qz10', '.eJxVy82qwjAQQOF3ydqWmcnPJC7v4u58hpJOpjRYFEwqiPjuF8HFdXs439NMee_rtDe9TbWYo2GbNESBQVywgyMqw8wLDkB24eRD0ODN4T-bs5z18rZZ5Lpfehs_qY2nfev1t-pWTtei289n_fJrbusbs6NCkAFJFQMELCmK54SwgMQZHCKBJkGJMSJ7dOgtEM_RJY2LOZgttz5l6fVe-8MckZnBBnAwBiSXXn_icUgT:1wGGFc:Blifr4lc-r13vku8u4IGuq2u-8JhNWPgikUNixnepe0', '2026-04-24 13:37:20.659353'),
('tbv0pl9lboimn7g1i0b0sfxu9wmzemoe', '.eJxVy82qwjAQQOF3ydqWmcnPJC7v4u58hpJOpjRYFEwqiPjuF8HFdXs439NMee_rtDe9TbWYo2GbNESBQVywgyMqw8wLDkB24eRD0ODN4T-bs5z18rZZ5Lpfehs_qY2nfev1t-pWTtei289n_fJrbusbs6NCkAFJFQMELCmK54SwgMQZHCKBJkGJMSJ7dOgtEM_RJY2LOZgttz5l6fVe-8MckTk6a73zYyII_vUH4vlIHw:1wM7o1:IPZMN-rs9P5oD27ZXshKiSuJ7RQfdSWWlqOapMU-fQU', '2026-05-10 17:49:05.967504'),
('tljk9wbu5ulsgw6q366ibv0lvwedwxb1', '.eJxVy82qwjAQQOF3ydqWmcnPJC7v4u58hpJOpjRYFEwqiPjuF8HFdXs439NMee_rtDe9TbWYo2GbNESBQVywgyMqw8wLDkB24eRD0ODN4T-bs5z18rZZ5Lpfehs_qY2nfev1t-pWTtei289n_fJrbusbs6NCkAFJFQMELCmK54SwgMQZHCKBJkGJMSJ7dOgtEM_RJY2LOZgttz5l6fVe-8MckZmJLEIYETkkev0BKnxISA:1wH2uo:A9F0aSvBf9q8GWKbROLSRSzzsVNYwqDVZJshpT1ev_g', '2026-04-26 17:35:06.351063'),
('u1wyigtd83yhtwv4sam17oixbpiidbo0', '.eJxVy01qwzAQQOG7aB0b_YwsjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNYbLm9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObbAFRk7iJKGehmC3zWjy4CYEKIgkwuyJRLHgMKKjkg0NxEFMkczI7tb4Q9_qo_Wlml1IK1sYQx4DBef_zC7GcSzw:1wHN3f:PxU9H8ed1MVKIgXl7X8Eb0fDP40JAtxf54o2qr5RxV0', '2026-04-27 15:05:35.439396'),
('v5ip3xcka25c0pw69rqycov5s7ejobh8', 'e30:1wKJc5:4RKa2WfTRai1zWl8-gUNbni9XweoGoBXGWK7ujkrag0', '2026-05-05 18:01:17.787080'),
('v5qpiabzwi6rdyrgzefc0r3a5e079vhc', 'e30:1wFbhg:M5SsrRC6ZcR12JcKOqrCr2YxFkosD0sxHOzBR8RaTEc', '2026-04-22 18:19:36.863653'),
('vctvi09ldsnty6cv74b2rawc2veeckfx', '.eJxVy8FqwzAMgOF38bkJkS3HVo477NZnCLKkELPQwuwMStm7j0EP2_Xn_55u5bPv69nsc63qFuc3NIIiQxaOA26lDMwFh-A9GpvFME_u8pcVlg-7_VoWuZ-33sZXauP1PHp9r3bo9a52vL3Wf37ntrvF5QmJLCnMzDkrxzyJbMUjzIRciFhRBIpGndBTICVjH4AUMKbI7uIObn1l6fWr9odbIKVIkDzQiMHPyX__ALIjS0s:1wBZC7:Sj4Q7B392SDXr9WQdVhZ-oWCehqUUWmZQjBAh1nVHek', '2026-04-11 14:50:19.453880'),
('vrv2tt8koe2rg7o9bd28r151sk1j0qgm', 'e30:1wHjvv:3_j8rMnSYF-s5zEgbE2z-L3fRfTlJgUIjtVPJh9Ctcs', '2026-04-28 15:31:07.772513'),
('vxunvxlxucp4ytvytd8rxo8qlhyf7z70', '.eJxVy8FqwzAMgOF38bkJli3HVo477NZnCLKkkLDQwuwMStm7j0EP2_Xn_55u4bNvy9nsc9nVzS6saARVhiKcBlxrHZgrDjEENDZLcfLu8pdVlg-7_VoWuZ-33sZXauP1PPr-vtuh17va8fZa__mN2-ZmVzwSWVaYmEtRTsWLrDUgTIRciVhRBKom9RgokpJxiEAKmHJid3EHt76w9P1r7w83Q87ZA5SSRgIfffz-AbHNSz8:1wG9y2:Wzu63TW0YsFGnGKKJUrffdL1nkjjmZYbE9HjAphC0vI', '2026-04-24 06:54:46.131075'),
('vy25q3e88p94univm3qk13ijbpqimr3s', '.eJxVy01qwzAQQOG7aB0bSR79jJddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUBlhLGYgKDJP3oKQapmjN6T8rxFe9_Vlivh-33sZ3auPl2Hs9V93lchfdv97rh9-obWY22QKiJnGRKGehkC3zWjy4iEAFkQSYXZEgFjxOKKjkJ4fiIKRA5mR2an0h7vVR-9PMLqUYbI7ZjzFE79PPL7JFS1A:1wE33q:b7C3_pBn7QF6NYeDDgTCJkxB_tMXFA1DiW4F_rWJkAY', '2026-04-18 11:08:02.966703'),
('w5u8p4esaekoxvv3371wh520n340un2n', 'e30:1w7gCV:HCrK5H4ZN50hZMe7SmJPfH8Rxl4Sc2c1sb7MaKOIaLs', '2026-03-31 21:30:39.610802'),
('wm24ls6kkzhpj2g6huzv4i4gt24ya0b5', '.eJxVy8FqwzAMgOF30bkJsSzLSo477NZnCLLsELPQwuwMStm7j0EP2_Xn_56w6tn39Wzlc60ZFhBffCpMQw6xDGSIw5zjPASyhCYTCwtc_rKk9lFuv1bN7uett_GV2ng9j17fazny9Z7L8fZa__ld2w4LEBIyuY05YdaihJN6ZK8ucOCJLYuzDW1zMaRQJEWjOW0hZlFKlOACh7a-qvX6VfsDFhejeBcd0SgRXZi_fwDMPUo-:1wLdWb:7nP6hJEaXpJAzpkAV0k0pTUVaxXnPcy-lP2qnySSyio', '2026-05-09 09:29:05.065369'),
('ws7fw7s76lk2viarx8tjiahsimq1tu9l', '.eJxVy8GKwjAQgOF3ydmWmWSSSTzuYW8-Q0knUxosCiYVRHz3RfCwXn_-72mmvPd12pveplrM0bBLGqLAIBTcQNaWYeYFB7Bu4eRD0ODN4T-bs5z18rZZ5Lpfehs_qY2nfev1t-pWTtei289n_fJrbusbM9liIQNaVQwQsKQonhPCAhJnIEQLmgQlxojskdA7sDxHShoXczBbbn3K0uu99oc5IjNbICAYiaJ3_PoDKnVISQ:1wGxxI:zM4Fra3V-ZgbUrTnyNcDGob8ogaowzqr0OqiTOYxCoM', '2026-04-26 12:17:20.588511'),
('wvpr0jrsr8tj7n9jn7xmeh55q2bxq404', '.eJxVy01qwzAQQOG7aB0b_YwsjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNYbLm9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObbAFRk7iJKGehmC3zWjy4CYEKIgkwuyJRLHgMKKjkg0NxEFMkczI7tb4Q9_qo_Wlml1K2IVpMI3qHMf78ArIgS1A:1wKS9S:H4RBr4eIUe1Sil_owtc4FEAG2vcUC0AjFSCPU8vD10I', '2026-05-06 03:08:18.041223'),
('wvrrvo363cahkz50o473p4bkld7x81x5', '.eJxVy01qw0AMQOG7aB2b-dHYIy-76C5nMBpJxkNNAp1xIYTevRSyaLeP9z1h5bPv69nsc60KC4QNjXyRIQunAbdSBuaCQwwBjc1SnBxc_rLC8mG3X8si9_PW2_hKbbyeR6_v1Q693tWOt9f6z-_cdlggOySyWf3EnLNyyk5kKwH9RMiFiBVFfNGkDgNFUjIO0ZN6THNiuMDBra8svX7V_oDFzzNmnyO5kUJy9P0DZzRLGw:1w6xL4:7eIhPdR_Txelp_uH4ORC7p3GRT7XW_WDY6BYbg28Kxw', '2026-03-29 21:36:30.974721'),
('x1aqz25cbv5ez1h2fi73y0uuayrnsx9n', '.eJxVy01qwzAQQOG7aB0b_YwsjZddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUB1hLGYgKDMF7UFKNYbLm9J8V4qve_iwx349bb-M7tfFy7L2eq-5yuYvuX-_1w2_UNjObbAFRk7iJKGehmC3zWjy4CYEKIgkwuyJRLHgMKKjkg0NxEFMkczI7tb4Q9_qo_Wlml1K2OYTgR0gx-vDzC7HzS0Y:1wKehQ:V2sOckRcZvcQojJOEgfzx_vxr3wXlslfsXepS-mDULA', '2026-05-06 16:32:12.560949'),
('xezpwk6mofl2k40z2wywr4nri5x6epv5', 'e30:1wEtoe:8_y4yn98EyE1ek6X6Ifx4T-3JvRl_yPjGNrJkuj8n7U', '2026-04-20 19:27:52.919805'),
('xny13q4wjthrvi8hfzz07j1as4hwor7w', 'e30:1wFnT7:-3kED8jt1Q9Hbud5MapQ3h3u_Yucl-KDYzMT07CpQAA', '2026-04-23 06:53:21.708906'),
('xpvv32js0javyvnllamg4dstfjnqskld', '.eJxVy8tqwzAQQNF_0To2eowe42UX3eUbzGhmjEVNApVcCKH_XgpZtNvLPU-z0jn29ez6uTYxi_EbKLrKU2GKE2y1TkQVpuA9KKnGkKy5_GWV-ENvv5aY7-dt9PmV-nw9j9Hemx5yvYseb6_1n9-p72YxxQKiZnGJqBShWCzzVj24hEAVkQSYXZUoFjwGFFTywaE4iDmSuZiD-liJR_tq42EWl3Mq2SK4OZRcUvj-AbJ4S1c:1wFZIj:ofMmvEqRjeDeYpEKPEWcsJJ_cSC1wpwbyNVJqYVeEpQ', '2026-04-22 15:45:41.408610'),
('xrf26hsk343h77ys36nzvvl5m58skpmd', '.eJxVy0FqwzAQQNG7zDo20mg0kr3sIrucwYxGMhYxCVRyIITevRSyaLaf_16wyNG35Wjle6kZZoiuuFSYhuxDGUgRhymHafCkCTUajhzh9J8l0Wu5_VlRvR-33sZ3auPl2Hs917Lnyz2X_eu9fvhN2gYzEBIy2ZU5YZYihEYcshPr2bNhzdHqirra4JMvMQWlKa0-5CiUKMEJdml9Ee31UfsTZhtCtCb6yYxoMDj6-QXMDkoz:1wKlGo:n3svyhRAG2g0FdZuWBZfXhpFeR5ny66qHuxCIhjlWT0', '2026-05-06 23:33:10.251217'),
('xxtr2vx9nvqxc8ecf25nuvw2ofzw126f', 'e30:1wFaEO:Kr-f3ujYcywMWE8XN5zqMfRmM5FCWkVlNVzgQw0BpwE', '2026-04-22 16:45:16.955435'),
('y1lgoevwvr16vp9y7zigtxisxf7lpnwp', 'e30:1wHgrL:9Yox9O7L7K72UKYLCLP-JHc7cup2JRira9Uebnjzgiw', '2026-04-28 12:14:11.980969'),
('y3tw1dqhoxf8hrxyyylcrgnxapjhght0', 'e30:1wHH0n:gWg1DeW-6TArYRKjMArzKk0Skm3MRsnW4eYrvkJCCQY', '2026-04-27 08:38:13.039790'),
('y5fgmkjjg1pwbvba9ckdjv9zn00tem9f', '.eJxVyz1qxDAQQOG7TG0bWRr92GWKdHsGMRqNsYizBksKhGXvHgJbJO3jfQ-I1Nsee5UrlgwrBCMmicMxWy8jstbjkv0yWuSkOSgXXIDhL0vEH3L_tcR89nur0yvV6daPVt6LHPl2ZjneXus_v1PdYQXUqB3Om3NJZxJCrchoZ2i2zjrlOIeZN83b7G2yEpJnXNJmfQ6ECRMMcFBtkbiVr9K-YZ29D2jNonBavA3KD8B0tfh55rIVybC2q8vzBzPfUfs:1wMD6P:Xd8Et2oSnpF562KdlACtGwmURIeOhurwuhvr3hnOI6M', '2026-05-10 23:28:25.068065'),
('yb3j2vdoizzex75rsec4169wc4jc210q', 'e30:1wHlal:vV0cgVFvRo91wdOE0hL1eIg1yDdG99xLhGbDD2pI_Jc', '2026-04-28 17:17:23.954996'),
('yez0urer1bgi1fzz9911ak9b4yi69y9s', '.eJxVy0GKwzAMQNG7eN2E2JFiK8tZdNczBFlSiGloYewUSpm7DwNdTLef_15u4aNty1HteynqZhdWMPJZuiSMHaw5d8wZujEEMDbDcRrc6T_LLFe7_VkWuR-3Vvt3qv3l2Fs5F9v1clfbv97rh9-4bm52aQAii-on5pSUMQ0iaw7gJwLORKwg4rOiDhBoJCXjMHpSDxiR3cntXNvC0sqjtKebfYxIAQNSH8H7CX9-AbJFS04:1wBbHn:LOZ5zFs9qdTMg23QbE6XcCvt1uPjf9hG0_Vg-9nsKYI', '2026-04-11 17:04:19.759644'),
('yhmy6jwc875ly3pw8cbgy2i61uyzlwfg', '.eJxVy8FqwzAMgOF38bkJtiw7Vo477NZnCLKkkLDQwuwMStm7j0EP2_Xn_55u4bNvy9nsc9nVzQ5WNApVhiKcBlxrHZgrDhEAjc1SzN5d_rLK8mG3X8si9_PW2_hKbbyeR9_fdzv0elc73l7rP79x29zsikcimzRk5lKUU_EiawUMmZArESuKhKpJPQJFUjKGGEgDpimxu7iDW19Y-v6194ebwzTlDDEDjDki-PL9A7HbS0M:1wEWxi:z8y0NC-_xeOJ_rKxn6Ro1uCulHqrS2ejdie9frEqoVI', '2026-04-19 19:03:42.786422'),
('yqffxt50jevwy4qim9adbaptoz30eh9n', '.eJxVy0GKwzAMQNG7eN2EWJFjK8tZdNczBFlSiGloYewUSpm7DwNdTLef_15u4aNty1HteynqZgcrGvksXRIOHa45d8wZuxEAjc3COA3u9J9llqvd_iyL3I9bq_071f5y7K2ci-16uavtX-_1w29cNze7NCCRRfUTc0rKIQ0iawb0EyFnIlYU8VmDDgg0kpIxjJ7UY4iB3cntXNvC0sqjtKebfYyYYkgJ-jgRAP78ArK0S1k:1w7CIM:qw8UtTBZRf5AeXxDDS-YqEXQyv_25rntuFqKFMxMrqU', '2026-03-30 13:34:42.805540'),
('yu3lo5w467u9hxw1zyi9iqd7ubwt50mn', '.eJxVy01qwzAQQOG7aB0bSR79jJddZJczmNHMGIuYBCo5EELvXgpZNNvH-15moaNvy9H0e6liZuNXUHSFh8wUBlhLGYgKDJP3oKQapmjN6T8rxFe9_Vlivh-33sZ3auPl2Hs9V93lchfdv97rh9-obWY22QKiJnGRKGehkC3zWjy4iEAFkQSYXZEgFjxOKKjkJ4fiIKRA5mR2an0h7vVR-9PMLqUIziYXxpBiwJ9fZuBLGQ:1wDdZj:3T5egqjuuDiszDOEjeKerGy-mZ2r0TzWiG6zhdddsc8', '2026-04-17 07:55:15.591248'),
('z3dnhwucewdb3vnzi5jvvge17syx01eq', 'e30:1wFb91:oRH6dNk6Ot6WV34mz9ZlNxADifxkeeb1h-Pvg4yOLIk', '2026-04-22 17:43:47.558673'),
('z7iri6h5xeo5q6s7qumc6z5jkvbuiukj', '.eJxVy8FqwzAMgOF38bkJkmJbco877NZnCI6sELPQQu0MRum7j0IP2_Xn_x5uzkff5qPZfa7FnR1PyaIoDOrjNHiiMiy84gA0rZxCjBaDO_1lS9Yvu75sVr0d197Gd2rj5dh7_ay2l8ut2P7xXv_5LbfthdlTIciAZIYRIpYkGjghrKCygEcksKSoIoIc0GOYgHgRn0xWd3J7bn3O2ut37T_ujMziMSShkXwgDM9fKyNIUQ:1wM3Ek:XeplGYsnjo4OU9ak5HWUFa1dSZeB637yfAbMZPXPdvU', '2026-05-10 12:56:22.399855');

-- --------------------------------------------------------

--
-- Table structure for table `django_summernote_attachment`
--

CREATE TABLE `django_summernote_attachment` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  `uploaded` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_order`
--

CREATE TABLE `order_order` (
  `id` bigint(20) NOT NULL,
  `order_number` varchar(20) NOT NULL,
  `recipient_name` varchar(100) NOT NULL,
  `recipient_email` varchar(254) NOT NULL,
  `shipping_address` longtext NOT NULL,
  `shipping_phone` varchar(20) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `shipping_fee` decimal(12,2) NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `user_id` uuid NOT NULL,
  `order_notes` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_order`
--

INSERT INTO `order_order` (`id`, `order_number`, `recipient_name`, `recipient_email`, `shipping_address`, `shipping_phone`, `subtotal`, `shipping_fee`, `total_amount`, `status`, `is_paid`, `created_at`, `user_id`, `order_notes`) VALUES
(20, 'ORD-DDFAA61A', 'Favour Bell-Gam', 'favourbell@gmail.com', '1st okuta avenue, Benin, QWEYRTUYJHTSDEWQ', '456789', 239998.00, 0.00, 239998.00, 'pending', 0, '2026-05-10 19:05:16.273178', '9e52070e-7516-4433-9cfc-8244e6580ab8', 'd5f67ghopj[k]lpkojiugyfhtcv nbuivyg'),
(22, 'ORD-31DCDC59', 'inimoney okun uya', 'techwiszard@gmail.com', 'Obidianso Sreet, Portharcourt, Rivers', '+234 7047137084', 121200.00, 0.00, 121200.00, 'processing', 1, '2026-05-10 21:18:19.447633', '739e68c0-c463-422d-b7f1-023f79566e65', 're fdbgfbv'),
(23, 'ORD-11E47594', 'chisom Bell-Gam', 'chisom119@gmail.com', '1st okuta avenue, Port-Harcourt, Rivers', '4567890', 1200.00, 0.00, 1200.00, 'processing', 1, '2026-05-10 21:19:39.909205', '83e3be64-d57e-4c22-9d79-54cb2c806868', 'This ordered for my family '),
(24, 'ORD-8C8AF465', 'chisom Bell-Gam', 'chisom119@gmail.com', '1st okuta avenue, Port-Harcourt, Rivers', '4567890', 140000.00, 0.00, 140000.00, 'processing', 1, '2026-05-10 21:21:49.329468', '83e3be64-d57e-4c22-9d79-54cb2c806868', 'th fd u dj udgjb '),
(32, 'ORD-E3D7AF49', 'inimoney okun uya', 'techwiszard@gmail.com', 'Obidianso Sreet, Portharcourt, Rivers', '+234 7047137084', 5000.00, 0.00, 5000.00, 'processing', 1, '2026-05-10 22:32:06.609144', '739e68c0-c463-422d-b7f1-023f79566e65', ''),
(33, 'ORD-97F5D055', 'chisom Bell-Gam', 'chisom119@gmail.com', 'Plot 6 avenue GRA, Lagos, Lagos', '4567890', 5000.00, 0.00, 5000.00, 'processing', 1, '2026-05-10 22:45:56.750630', '83e3be64-d57e-4c22-9d79-54cb2c806868', 'gfgkjl,nmnbcyfugjb'),
(35, 'ORD-41D06F48', 'chisom Bell-Gam', 'chisom119@gmail.com', 'Plot 6 avenue GRA, Lagos, Lagos', '4567890', 379996.00, 0.00, 379996.00, 'processing', 1, '2026-05-10 22:57:51.623314', '83e3be64-d57e-4c22-9d79-54cb2c806868', ''),
(36, 'ORD-A37CA682', 'inimoney okun uya', 'techwiszard@gmail.com', '1st okuta avenue, Port-Harcourt, Rivers', '+234 7047137084', 115000.00, 0.00, 115000.00, 'processing', 1, '2026-05-10 23:00:06.736233', '739e68c0-c463-422d-b7f1-023f79566e65', 'uyeghdjfbfv');

-- --------------------------------------------------------

--
-- Table structure for table `order_orderitem`
--

CREATE TABLE `order_orderitem` (
  `id` bigint(20) NOT NULL,
  `product_name_snapshot` varchar(255) NOT NULL,
  `price_at_purchase` decimal(12,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL CHECK (`quantity` >= 0),
  `order_id` bigint(20) NOT NULL,
  `variant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_orderitem`
--

INSERT INTO `order_orderitem` (`id`, `product_name_snapshot`, `price_at_purchase`, `quantity`, `order_id`, `variant_id`) VALUES
(45, 'Juice Youghurt', 100000.00, 1, 20, 123),
(46, 'Juice Youghurt', 69999.00, 2, 20, 127),
(48, 'Juice Youghurt', 1200.00, 1, 22, 129),
(49, 'Juice Youghurt', 100000.00, 1, 22, 123),
(50, 'Juice Youghurt', 10000.00, 2, 22, 128),
(51, 'Juice Youghurt', 1200.00, 1, 23, 129),
(52, 'Juice Youghurt', 100000.00, 1, 24, 123),
(53, 'Juice Youghurt', 10000.00, 4, 24, 128),
(61, 'Unknown Product', 2500.00, 2, 32, NULL),
(62, 'Unknown Product', 2500.00, 2, 33, NULL),
(66, 'Juice Youghurt', 100000.00, 1, 35, 123),
(67, 'Juice Youghurt', 69999.00, 4, 35, 127),
(68, 'Unknown Product', 2500.00, 2, 36, NULL),
(69, 'Juice Youghurt', 100000.00, 1, 36, 123),
(70, 'Juice Youghurt', 10000.00, 1, 36, 128);

-- --------------------------------------------------------

--
-- Table structure for table `order_ordertracking`
--

CREATE TABLE `order_ordertracking` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `status_message_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_ordertracking`
--

INSERT INTO `order_ordertracking` (`id`, `created_at`, `order_id`, `status_message_id`) VALUES
(20, '2026-05-10 19:05:16.299000', 20, 7),
(22, '2026-05-10 21:18:19.454662', 22, 7),
(23, '2026-05-10 21:19:39.924599', 23, 7),
(24, '2026-05-10 21:21:49.334544', 24, 7),
(32, '2026-05-10 22:32:06.615466', 32, 7),
(33, '2026-05-10 22:45:56.755856', 33, 7),
(35, '2026-05-10 22:57:51.627640', 35, 7),
(36, '2026-05-10 22:58:10.038548', 35, 8),
(37, '2026-05-10 23:00:06.741736', 36, 7),
(38, '2026-05-10 23:00:23.866753', 36, 8);

-- --------------------------------------------------------

--
-- Table structure for table `order_trackingstatus`
--

CREATE TABLE `order_trackingstatus` (
  `id` bigint(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_trackingstatus`
--

INSERT INTO `order_trackingstatus` (`id`, `message`, `description`) VALUES
(7, 'Processing your order...', ''),
(8, 'Payment Confirmed', 'Your payment was successfully processed. We are now preparing your items.');

-- --------------------------------------------------------

--
-- Table structure for table `payment_payment`
--

CREATE TABLE `payment_payment` (
  `id` bigint(20) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `transaction_reference` varchar(100) NOT NULL,
  `gateway_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`gateway_response`)),
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `user_id` uuid NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_payment`
--

INSERT INTO `payment_payment` (`id`, `amount`, `payment_method`, `status`, `transaction_reference`, `gateway_response`, `created_at`, `updated_at`, `order_id`, `user_id`) VALUES
(1, 121200.00, 'card', 'successful', 'vuaiibm6mi', '{\"status\": true, \"message\": \"Verification successful\", \"data\": {\"id\": 6133014218, \"domain\": \"test\", \"status\": \"success\", \"reference\": \"vuaiibm6mi\", \"receipt_number\": null, \"amount\": 12120000, \"message\": null, \"gateway_response\": \"Successful\", \"response_code\": \"00\", \"paid_at\": \"2026-05-10T21:18:37.000Z\", \"created_at\": \"2026-05-10T21:18:25.000Z\", \"channel\": \"card\", \"currency\": \"NGN\", \"ip_address\": \"197.210.53.19\", \"metadata\": {\"order_id\": \"22\"}, \"log\": {\"start_time\": 1778447908, \"time_spent\": 6, \"attempts\": 1, \"errors\": 0, \"success\": true, \"mobile\": false, \"input\": [], \"history\": [{\"type\": \"action\", \"message\": \"Attempted to pay with card\", \"time\": 5}, {\"type\": \"success\", \"message\": \"Successfully paid with card\", \"time\": 6}]}, \"fees\": 191800, \"fees_split\": null, \"authorization\": {\"authorization_code\": \"AUTH_pezbiyrsd0\", \"bin\": \"408408\", \"last4\": \"4081\", \"exp_month\": \"12\", \"exp_year\": \"2030\", \"channel\": \"card\", \"card_type\": \"visa \", \"bank\": \"TEST BANK\", \"country_code\": \"NG\", \"brand\": \"visa\", \"reusable\": true, \"signature\": \"SIG_DN9MZYcZWYzmAENnpMhg\", \"account_name\": null, \"receiver_bank_account_number\": null, \"receiver_bank\": null}, \"customer\": {\"id\": 363551444, \"first_name\": null, \"last_name\": null, \"email\": \"techwiszard@gmail.com\", \"customer_code\": \"CUS_h441lgg1fgg9v3f\", \"phone\": null, \"metadata\": null, \"risk_action\": \"default\", \"international_format_phone\": null}, \"plan\": null, \"split\": {}, \"order_id\": null, \"paidAt\": \"2026-05-10T21:18:37.000Z\", \"createdAt\": \"2026-05-10T21:18:25.000Z\", \"requested_amount\": 12120000, \"pos_transaction_data\": null, \"source\": null, \"fees_breakdown\": null, \"connect\": null, \"transaction_date\": \"2026-05-10T21:18:25.000Z\", \"plan_object\": {}, \"subaccount\": {}}}', '2026-05-10 21:18:37.568423', '2026-05-10 21:18:37.568538', 22, '739e68c0-c463-422d-b7f1-023f79566e65'),
(2, 1200.00, 'card', 'successful', '9sgsiq04qr', '{\"status\": true, \"message\": \"Verification successful\", \"data\": {\"id\": 6133016682, \"domain\": \"test\", \"status\": \"success\", \"reference\": \"9sgsiq04qr\", \"receipt_number\": null, \"amount\": 120000, \"message\": null, \"gateway_response\": \"Successful\", \"response_code\": \"00\", \"paid_at\": \"2026-05-10T21:19:58.000Z\", \"created_at\": \"2026-05-10T21:19:46.000Z\", \"channel\": \"card\", \"currency\": \"NGN\", \"ip_address\": \"197.210.53.19\", \"metadata\": {\"order_id\": \"23\"}, \"log\": {\"start_time\": 1778447990, \"time_spent\": 6, \"attempts\": 1, \"errors\": 0, \"success\": true, \"mobile\": false, \"input\": [], \"history\": [{\"type\": \"action\", \"message\": \"Attempted to pay with card\", \"time\": 4}, {\"type\": \"success\", \"message\": \"Successfully paid with card\", \"time\": 6}]}, \"fees\": 1800, \"fees_split\": null, \"authorization\": {\"authorization_code\": \"AUTH_vt2o28pbk6\", \"bin\": \"408408\", \"last4\": \"4081\", \"exp_month\": \"12\", \"exp_year\": \"2030\", \"channel\": \"card\", \"card_type\": \"visa \", \"bank\": \"TEST BANK\", \"country_code\": \"NG\", \"brand\": \"visa\", \"reusable\": true, \"signature\": \"SIG_DN9MZYcZWYzmAENnpMhg\", \"account_name\": null, \"receiver_bank_account_number\": null, \"receiver_bank\": null}, \"customer\": {\"id\": 363555857, \"first_name\": null, \"last_name\": null, \"email\": \"chisom119@gmail.com\", \"customer_code\": \"CUS_k510k9dabzqiewo\", \"phone\": null, \"metadata\": null, \"risk_action\": \"default\", \"international_format_phone\": null}, \"plan\": null, \"split\": {}, \"order_id\": null, \"paidAt\": \"2026-05-10T21:19:58.000Z\", \"createdAt\": \"2026-05-10T21:19:46.000Z\", \"requested_amount\": 120000, \"pos_transaction_data\": null, \"source\": null, \"fees_breakdown\": null, \"connect\": null, \"transaction_date\": \"2026-05-10T21:19:46.000Z\", \"plan_object\": {}, \"subaccount\": {}}}', '2026-05-10 21:20:00.504438', '2026-05-10 21:20:00.504481', 23, '83e3be64-d57e-4c22-9d79-54cb2c806868'),
(3, 140000.00, 'card', 'successful', '53pcsxjfhc', '{\"status\": true, \"message\": \"Verification successful\", \"data\": {\"id\": 6133020733, \"domain\": \"test\", \"status\": \"success\", \"reference\": \"53pcsxjfhc\", \"receipt_number\": null, \"amount\": 14000000, \"message\": \"test-3ds\", \"gateway_response\": \"[Test] Approved\", \"response_code\": \"05\", \"paid_at\": \"2026-05-10T21:22:14.000Z\", \"created_at\": \"2026-05-10T21:21:56.000Z\", \"channel\": \"card\", \"currency\": \"NGN\", \"ip_address\": \"197.210.53.19\", \"metadata\": {\"order_id\": \"24\"}, \"log\": {\"start_time\": 1778448115, \"time_spent\": 16, \"attempts\": 2, \"errors\": 1, \"success\": true, \"mobile\": false, \"input\": [], \"history\": [{\"type\": \"action\", \"message\": \"Attempted to pay with card\", \"time\": 6}, {\"type\": \"error\", \"message\": \"Error: Declined\", \"time\": 7}, {\"type\": \"action\", \"message\": \"Attempted to pay with card\", \"time\": 12}, {\"type\": \"auth\", \"message\": \"Authentication Required: 3DS\", \"time\": 13}, {\"type\": \"action\", \"message\": \"Third-party authentication window opened\", \"time\": 15}, {\"type\": \"success\", \"message\": \"Successfully paid with card\", \"time\": 16}, {\"type\": \"action\", \"message\": \"Third-party authentication window closed\", \"time\": 16}]}, \"fees\": 200000, \"fees_split\": null, \"authorization\": {\"authorization_code\": \"AUTH_k33qtrwbet\", \"bin\": \"408408\", \"last4\": \"0409\", \"exp_month\": \"01\", \"exp_year\": \"2030\", \"channel\": \"card\", \"card_type\": \"visa \", \"bank\": \"TEST BANK\", \"country_code\": \"NG\", \"brand\": \"visa\", \"reusable\": true, \"signature\": \"SIG_uOxScYiXfeBq3J6Po9cZ\", \"account_name\": null, \"receiver_bank_account_number\": null, \"receiver_bank\": null}, \"customer\": {\"id\": 363555857, \"first_name\": null, \"last_name\": null, \"email\": \"chisom119@gmail.com\", \"customer_code\": \"CUS_k510k9dabzqiewo\", \"phone\": null, \"metadata\": null, \"risk_action\": \"default\", \"international_format_phone\": null}, \"plan\": null, \"split\": {}, \"order_id\": null, \"paidAt\": \"2026-05-10T21:22:14.000Z\", \"createdAt\": \"2026-05-10T21:21:56.000Z\", \"requested_amount\": 14000000, \"pos_transaction_data\": null, \"source\": null, \"fees_breakdown\": null, \"connect\": null, \"transaction_date\": \"2026-05-10T21:21:56.000Z\", \"plan_object\": {}, \"subaccount\": {}}}', '2026-05-10 21:22:16.366975', '2026-05-10 21:22:16.367097', 24, '83e3be64-d57e-4c22-9d79-54cb2c806868'),
(4, 5000.00, 'bank', 'successful', 'ai3sr78r2e', '{\"status\": true, \"message\": \"Verification successful\", \"data\": {\"id\": 6133131058, \"domain\": \"test\", \"status\": \"success\", \"reference\": \"ai3sr78r2e\", \"receipt_number\": null, \"amount\": 500000, \"message\": \"madePayment\", \"gateway_response\": \"Approved\", \"response_code\": null, \"paid_at\": \"2026-05-10T22:33:55.000Z\", \"created_at\": \"2026-05-10T22:32:13.000Z\", \"channel\": \"bank\", \"currency\": \"NGN\", \"ip_address\": \"197.210.53.19\", \"metadata\": {\"order_id\": \"32\"}, \"log\": {\"start_time\": 1778452333, \"time_spent\": 98, \"attempts\": 1, \"errors\": 0, \"success\": true, \"mobile\": false, \"input\": [], \"history\": [{\"type\": \"action\", \"message\": \"Set payment method to: bank\", \"time\": 6}, {\"type\": \"input\", \"message\": \"Filled this field: account number\", \"time\": 47}, {\"type\": \"action\", \"message\": \"Attempted to pay with bank account\", \"time\": 47}, {\"type\": \"auth\", \"message\": \"Authentication Required: birthday\", \"time\": 48}, {\"type\": \"auth\", \"message\": \"Authentication Required: registration_token\", \"time\": 82}, {\"type\": \"auth\", \"message\": \"Authentication Required: payment_token\", \"time\": 92}, {\"type\": \"success\", \"message\": \"Successfully paid with bank account\", \"time\": 98}]}, \"fees\": 17500, \"fees_split\": null, \"authorization\": {\"authorization_code\": \"AUTH_3wxofg99ma\", \"bin\": \"000XXX\", \"last4\": \"X000\", \"exp_month\": \"12\", \"exp_year\": \"9999\", \"channel\": \"bank\", \"card_type\": \"\", \"bank\": \"Zenith Bank\", \"country_code\": \"NG\", \"brand\": \"Zenith Emandate\", \"reusable\": false, \"signature\": null, \"account_name\": null, \"receiver_bank_account_number\": null, \"receiver_bank\": null}, \"customer\": {\"id\": 363551444, \"first_name\": null, \"last_name\": null, \"email\": \"techwiszard@gmail.com\", \"customer_code\": \"CUS_h441lgg1fgg9v3f\", \"phone\": null, \"metadata\": null, \"risk_action\": \"default\", \"international_format_phone\": null}, \"plan\": null, \"split\": {}, \"order_id\": null, \"paidAt\": \"2026-05-10T22:33:55.000Z\", \"createdAt\": \"2026-05-10T22:32:13.000Z\", \"requested_amount\": 500000, \"pos_transaction_data\": null, \"source\": null, \"fees_breakdown\": null, \"connect\": null, \"transaction_date\": \"2026-05-10T22:32:13.000Z\", \"plan_object\": {}, \"subaccount\": {}}}', '2026-05-10 22:33:54.733751', '2026-05-10 22:33:54.733864', 32, '739e68c0-c463-422d-b7f1-023f79566e65'),
(5, 5000.00, 'bank_transfer', 'successful', '86vpvovonu', '{\"status\": true, \"message\": \"Verification successful\", \"data\": {\"id\": 6133146333, \"domain\": \"test\", \"status\": \"success\", \"reference\": \"86vpvovonu\", \"receipt_number\": null, \"amount\": 500000, \"message\": null, \"gateway_response\": \"Approved\", \"response_code\": null, \"paid_at\": \"2026-05-10T22:46:46.000Z\", \"created_at\": \"2026-05-10T22:46:03.000Z\", \"channel\": \"bank_transfer\", \"currency\": \"NGN\", \"ip_address\": \"197.210.53.19\", \"metadata\": {\"order_id\": \"33\"}, \"log\": {\"start_time\": 1778453164, \"time_spent\": 39, \"attempts\": 0, \"errors\": 0, \"success\": true, \"mobile\": false, \"input\": [], \"history\": [{\"type\": \"action\", \"message\": \"Set payment method to: ussd\", \"time\": 5}, {\"type\": \"action\", \"message\": \"Set payment method to: bank\", \"time\": 33}, {\"type\": \"action\", \"message\": \"Set payment method to: bank_transfer\", \"time\": 34}, {\"type\": \"success\", \"message\": \"Successfully paid with bank_transfer\", \"time\": 39}]}, \"fees\": 17500, \"fees_split\": null, \"authorization\": {\"authorization_code\": \"AUTH_5zmmvpdsn9\", \"bin\": \"123XXX\", \"last4\": \"X890\", \"exp_month\": \"05\", \"exp_year\": \"2026\", \"channel\": \"bank_transfer\", \"card_type\": \"transfer\", \"bank\": null, \"country_code\": \"NG\", \"brand\": \"Managed Account\", \"reusable\": false, \"signature\": null, \"account_name\": null, \"sender_bank\": null, \"sender_country\": \"NG\", \"sender_bank_account_number\": \"XXXXXXX890\", \"sender_name\": \"TEST PAYER\", \"narration\": \"Test transaction\", \"receiver_bank_account_number\": null, \"receiver_bank\": null}, \"customer\": {\"id\": 363555857, \"first_name\": null, \"last_name\": null, \"email\": \"chisom119@gmail.com\", \"customer_code\": \"CUS_k510k9dabzqiewo\", \"phone\": null, \"metadata\": null, \"risk_action\": \"default\", \"international_format_phone\": null}, \"plan\": null, \"split\": {}, \"order_id\": null, \"paidAt\": \"2026-05-10T22:46:46.000Z\", \"createdAt\": \"2026-05-10T22:46:03.000Z\", \"requested_amount\": 500000, \"pos_transaction_data\": null, \"source\": null, \"fees_breakdown\": null, \"connect\": null, \"transaction_date\": \"2026-05-10T22:46:03.000Z\", \"plan_object\": {}, \"subaccount\": {}}}', '2026-05-10 22:47:04.626797', '2026-05-10 22:47:04.626842', 33, '83e3be64-d57e-4c22-9d79-54cb2c806868'),
(6, 379996.00, 'card', 'successful', 'vdd96fmm9d', '{\"status\": true, \"message\": \"Verification successful\", \"data\": {\"id\": 6133158592, \"domain\": \"test\", \"status\": \"success\", \"reference\": \"vdd96fmm9d\", \"receipt_number\": null, \"amount\": 37999600, \"message\": null, \"gateway_response\": \"Successful\", \"response_code\": \"00\", \"paid_at\": \"2026-05-10T22:58:09.000Z\", \"created_at\": \"2026-05-10T22:57:58.000Z\", \"channel\": \"card\", \"currency\": \"NGN\", \"ip_address\": \"197.210.53.19\", \"metadata\": {\"order_id\": \"35\"}, \"log\": {\"start_time\": 1778453878, \"time_spent\": 8, \"attempts\": 1, \"errors\": 0, \"success\": true, \"mobile\": false, \"input\": [], \"history\": [{\"type\": \"action\", \"message\": \"Set payment method to: card\", \"time\": 4}, {\"type\": \"action\", \"message\": \"Attempted to pay with card\", \"time\": 7}, {\"type\": \"success\", \"message\": \"Successfully paid with card\", \"time\": 8}]}, \"fees\": 200000, \"fees_split\": null, \"authorization\": {\"authorization_code\": \"AUTH_prkyme5lw6\", \"bin\": \"408408\", \"last4\": \"4081\", \"exp_month\": \"12\", \"exp_year\": \"2030\", \"channel\": \"card\", \"card_type\": \"visa \", \"bank\": \"TEST BANK\", \"country_code\": \"NG\", \"brand\": \"visa\", \"reusable\": true, \"signature\": \"SIG_DN9MZYcZWYzmAENnpMhg\", \"account_name\": null, \"receiver_bank_account_number\": null, \"receiver_bank\": null}, \"customer\": {\"id\": 363555857, \"first_name\": null, \"last_name\": null, \"email\": \"chisom119@gmail.com\", \"customer_code\": \"CUS_k510k9dabzqiewo\", \"phone\": null, \"metadata\": null, \"risk_action\": \"default\", \"international_format_phone\": null}, \"plan\": null, \"split\": {}, \"order_id\": null, \"paidAt\": \"2026-05-10T22:58:09.000Z\", \"createdAt\": \"2026-05-10T22:57:58.000Z\", \"requested_amount\": 37999600, \"pos_transaction_data\": null, \"source\": null, \"fees_breakdown\": null, \"connect\": null, \"transaction_date\": \"2026-05-10T22:57:58.000Z\", \"plan_object\": {}, \"subaccount\": {}}}', '2026-05-10 22:58:10.024511', '2026-05-10 22:58:10.024556', 35, '83e3be64-d57e-4c22-9d79-54cb2c806868'),
(7, 115000.00, 'card', 'successful', 'yzideatuj9', '{\"status\": true, \"message\": \"Verification successful\", \"data\": {\"id\": 6133160808, \"domain\": \"test\", \"status\": \"success\", \"reference\": \"yzideatuj9\", \"receipt_number\": null, \"amount\": 11500000, \"message\": null, \"gateway_response\": \"Successful\", \"response_code\": \"00\", \"paid_at\": \"2026-05-10T23:00:24.000Z\", \"created_at\": \"2026-05-10T23:00:13.000Z\", \"channel\": \"card\", \"currency\": \"NGN\", \"ip_address\": \"197.210.53.19\", \"metadata\": {\"order_id\": \"36\"}, \"log\": {\"start_time\": 1778454014, \"time_spent\": 6, \"attempts\": 1, \"errors\": 0, \"success\": true, \"mobile\": false, \"input\": [], \"history\": [{\"type\": \"action\", \"message\": \"Set payment method to: card\", \"time\": 3}, {\"type\": \"action\", \"message\": \"Attempted to pay with card\", \"time\": 5}, {\"type\": \"success\", \"message\": \"Successfully paid with card\", \"time\": 6}]}, \"fees\": 182500, \"fees_split\": null, \"authorization\": {\"authorization_code\": \"AUTH_om9fsgxwfx\", \"bin\": \"408408\", \"last4\": \"4081\", \"exp_month\": \"12\", \"exp_year\": \"2030\", \"channel\": \"card\", \"card_type\": \"visa \", \"bank\": \"TEST BANK\", \"country_code\": \"NG\", \"brand\": \"visa\", \"reusable\": true, \"signature\": \"SIG_DN9MZYcZWYzmAENnpMhg\", \"account_name\": null, \"receiver_bank_account_number\": null, \"receiver_bank\": null}, \"customer\": {\"id\": 363551444, \"first_name\": null, \"last_name\": null, \"email\": \"techwiszard@gmail.com\", \"customer_code\": \"CUS_h441lgg1fgg9v3f\", \"phone\": null, \"metadata\": null, \"risk_action\": \"default\", \"international_format_phone\": null}, \"plan\": null, \"split\": {}, \"order_id\": null, \"paidAt\": \"2026-05-10T23:00:24.000Z\", \"createdAt\": \"2026-05-10T23:00:13.000Z\", \"requested_amount\": 11500000, \"pos_transaction_data\": null, \"source\": null, \"fees_breakdown\": null, \"connect\": null, \"transaction_date\": \"2026-05-10T23:00:13.000Z\", \"plan_object\": {}, \"subaccount\": {}}}', '2026-05-10 23:00:23.858899', '2026-05-10 23:00:23.858940', 36, '739e68c0-c463-422d-b7f1-023f79566e65');

-- --------------------------------------------------------

--
-- Table structure for table `payment_paymenthistory`
--

CREATE TABLE `payment_paymenthistory` (
  `id` bigint(20) NOT NULL,
  `purchase_id` varchar(255) NOT NULL,
  `product` varchar(255) NOT NULL,
  `purchase_status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `payment_id` bigint(20) NOT NULL,
  `user_id` uuid NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_paymenthistory`
--

INSERT INTO `payment_paymenthistory` (`id`, `purchase_id`, `product`, `purchase_status`, `created_at`, `payment_id`, `user_id`) VALUES
(1, '6f3920b3-42d9-42be-9642-118fd5561f9c', 'Payment for Order ORD-31DCDC59', 'successful', '2026-05-10 21:18:37.590215', 1, '739e68c0-c463-422d-b7f1-023f79566e65'),
(2, 'bacadcc5-5fbe-4f7a-a527-1f79d3ceb9ee', 'Payment for Order ORD-11E47594', 'successful', '2026-05-10 21:20:00.515110', 2, '83e3be64-d57e-4c22-9d79-54cb2c806868'),
(3, '88001953-4167-4d73-93c2-5b125dca2a0c', 'Payment for Order ORD-8C8AF465', 'successful', '2026-05-10 21:22:16.385377', 3, '83e3be64-d57e-4c22-9d79-54cb2c806868'),
(4, 'a2cd0bab-6bdd-48b4-bc64-4f8dd68e90f2', 'Payment for Order ORD-E3D7AF49', 'successful', '2026-05-10 22:33:54.752835', 4, '739e68c0-c463-422d-b7f1-023f79566e65'),
(5, '906edc37-d2f8-487e-b54e-f73a02932324', 'Payment for Order ORD-97F5D055', 'successful', '2026-05-10 22:47:04.634294', 5, '83e3be64-d57e-4c22-9d79-54cb2c806868'),
(6, '990d9fe3-bf8d-44d3-8465-0c995ae94561', 'Payment for Order ORD-41D06F48', 'successful', '2026-05-10 22:58:10.040195', 6, '83e3be64-d57e-4c22-9d79-54cb2c806868'),
(7, '2fa60ad2-8a37-499e-ad65-1bbb576831b4', 'Payment for Order ORD-A37CA682', 'successful', '2026-05-10 23:00:23.868668', 7, '739e68c0-c463-422d-b7f1-023f79566e65');

-- --------------------------------------------------------

--
-- Table structure for table `payment_refund`
--

CREATE TABLE `payment_refund` (
  `id` bigint(20) NOT NULL,
  `reason` longtext NOT NULL,
  `amount_refunded` decimal(12,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `payment_id` bigint(20) NOT NULL,
  `processed_by_id` uuid DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_brand`
--

CREATE TABLE `product_brand` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `supplier_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `hex_code` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`id`, `name`, `hex_code`) VALUES
(1, 'Black', '#0000'),
(2, 'Red', '#85955'),
(3, 'purple', '#87980'),
(4, 'green', '#67678');

-- --------------------------------------------------------

--
-- Table structure for table `product_product`
--

CREATE TABLE `product_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `uom` varchar(10) NOT NULL,
  `short_description` longtext NOT NULL,
  `description` longtext NOT NULL,
  `warranty_text` varchar(255) DEFAULT NULL,
  `cost_price` decimal(12,2) NOT NULL,
  `selling_price` decimal(12,2) NOT NULL,
  `old_price` decimal(12,2) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `product_type` varchar(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `is_locked` tinyint(1) NOT NULL,
  `is_sales` tinyint(1) NOT NULL,
  `sale_start` datetime(6) DEFAULT NULL,
  `sale_end` datetime(6) DEFAULT NULL,
  `tags` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` longtext NOT NULL,
  `meta_keywords` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `brand_id` bigint(20) DEFAULT NULL,
  `is_primary_id` bigint(20) DEFAULT NULL,
  `is_secondary_id` bigint(20) DEFAULT NULL,
  `category_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_product`
--

INSERT INTO `product_product` (`id`, `name`, `slug`, `uom`, `short_description`, `description`, `warranty_text`, `cost_price`, `selling_price`, `old_price`, `discount`, `product_type`, `is_active`, `is_featured`, `is_locked`, `is_sales`, `sale_start`, `sale_end`, `tags`, `meta_title`, `meta_description`, `meta_keywords`, `created_at`, `updated_at`, `brand_id`, `is_primary_id`, `is_secondary_id`, `category_id`, `supplier_id`) VALUES
(7, 'Bread Sardine', 'bread-sardine', 'pcs', 'Bread Sardine', 'Bread Sardine To ensure your script works perfectly for both simple and variable products while correctly displaying the Price Override (and hiding/showing the Old Price based on whether an override is active), use the code below.\r\n\r\nI have updated the variants array to correctly map your model structure (no discount/old price in Variant) and fixed the logic to update the UI.', NULL, 1000.00, 2500.00, NULL, 0, 'simple', 1, 1, 0, 0, NULL, NULL, 'hghsf, bfudjf, gfufbjjg', '', '', '', '2026-05-03 14:40:57.845882', '2026-05-08 09:40:18.559852', NULL, 201, 213, 1, NULL),
(14, 'Juice Youghurt', 'harmony', 'pcs', 'Juice Youghurt', 'To ensure your script works perfectly for both simple and variable products while correctly displaying the Price Override (and hiding/showing the Old Price based on whether an override is active), use the code below.\r\n\r\nI have updated the variants array to correctly map your model structure (no discount/old price in Variant) and fixed the logic to update the UI.', NULL, 100000.00, 100000.00, 125000.00, 20, 'variable', 1, 1, 0, 1, '2026-05-27 00:00:00.000000', '2026-06-26 00:00:00.000000', 'Bag, Shoe, T-Shirt, Phones', '', '', '', '2026-05-06 15:28:53.503087', '2026-05-08 09:53:57.252395', NULL, 225, 223, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_productcategory`
--

CREATE TABLE `product_productcategory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `image_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_productcategory`
--

INSERT INTO `product_productcategory` (`id`, `name`, `slug`, `description`, `is_featured`, `is_active`, `created_at`, `image_id`) VALUES
(1, 'Bakery', 'bakery', '', 1, 1, '2026-05-02 23:24:39.636264', 223);

-- --------------------------------------------------------

--
-- Table structure for table `product_productinventory`
--

CREATE TABLE `product_productinventory` (
  `id` bigint(20) NOT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `barcode` varchar(50) DEFAULT NULL,
  `barcode_type` varchar(20) NOT NULL,
  `barcode_image` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `low_stock_threshold` int(10) UNSIGNED NOT NULL CHECK (`low_stock_threshold` >= 0),
  `date_added` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `variant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_productinventory`
--

INSERT INTO `product_productinventory` (`id`, `sku`, `barcode`, `barcode_type`, `barcode_image`, `is_active`, `quantity`, `low_stock_threshold`, `date_added`, `product_id`, `variant_id`) VALUES
(24, 'uighdosjhjlbl', '456786756458', 'ean13', 'barcodes/bc-456786756458.png', 1, 9, 10, '2026-05-05 23:40:45.212599', 7, NULL),
(124, 'yhksbjsf', 'isvhvhss', 'code128', 'barcodes/bc-isvhvhss.png', 1, 10, 10, '2026-05-06 15:28:53.545478', 14, 123),
(128, 'hsjbvfdjbsi', 'bhjbdjkvbfj', 'code128', 'barcodes/bc-bhjbdjkvbfj.png', 1, 100, 10, '2026-05-08 09:39:15.916626', 14, 127),
(129, 'fhjsbhj', 'kbdvjhvs', 'code128', 'barcodes/bc-kbdvjhvs.png', 1, 100, 10, '2026-05-08 09:39:15.928326', 14, 128),
(130, 'UDWUHBSJ', 'NDJBjbjb', 'code128', 'barcodes/bc-NDJBjbjb.png', 1, 200, 10, '2026-05-08 09:39:15.938761', 14, 129);

-- --------------------------------------------------------

--
-- Table structure for table `product_productreview`
--

CREATE TABLE `product_productreview` (
  `id` bigint(20) NOT NULL,
  `rating` smallint(5) UNSIGNED NOT NULL CHECK (`rating` >= 0),
  `comment` longtext NOT NULL,
  `is_verified_purchase` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` uuid DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_productvariant`
--

CREATE TABLE `product_productvariant` (
  `id` bigint(20) NOT NULL,
  `weight` decimal(6,2) DEFAULT NULL,
  `price_override` decimal(12,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `color_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `size_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_productvariant`
--

INSERT INTO `product_productvariant` (`id`, `weight`, `price_override`, `is_active`, `created_at`, `color_id`, `product_id`, `size_id`) VALUES
(123, 0.00, NULL, 1, '2026-05-06 15:28:53.535249', 1, 14, 3),
(127, 0.00, 69999.00, 1, '2026-05-08 09:39:15.906090', 3, 14, 4),
(128, 0.00, 10000.00, 1, '2026-05-08 09:39:15.920621', 4, 14, 1),
(129, 0.00, 1200.00, 1, '2026-05-08 09:39:15.931327', 2, 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_product_colors`
--

CREATE TABLE `product_product_colors` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `color_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_product_colors`
--

INSERT INTO `product_product_colors` (`id`, `product_id`, `color_id`) VALUES
(37, 14, 1),
(38, 14, 2),
(39, 14, 3),
(40, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_product_gallery`
--

CREATE TABLE `product_product_gallery` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `mediaasset_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_product_gallery`
--

INSERT INTO `product_product_gallery` (`id`, `product_id`, `mediaasset_id`) VALUES
(3, 7, 223),
(1, 7, 224),
(2, 7, 225),
(10, 14, 223),
(8, 14, 224),
(9, 14, 225);

-- --------------------------------------------------------

--
-- Table structure for table `product_product_sizes`
--

CREATE TABLE `product_product_sizes` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `size_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_product_sizes`
--

INSERT INTO `product_product_sizes` (`id`, `product_id`, `size_id`) VALUES
(58, 14, 1),
(59, 14, 2),
(57, 14, 3),
(60, 14, 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

CREATE TABLE `product_size` (
  `id` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`id`, `name`) VALUES
(3, 'L'),
(4, 'S'),
(1, 'X'),
(2, 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `product_supplier`
--

CREATE TABLE `product_supplier` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `address` longtext NOT NULL,
  `description` longtext NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `image_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_appvariable`
--

CREATE TABLE `users_appvariable` (
  `id` bigint(20) NOT NULL,
  `var_name` varchar(100) NOT NULL,
  `var_value` varchar(255) DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `isreadonly` int(11) NOT NULL,
  `lastupdated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_appvariable`
--

INSERT INTO `users_appvariable` (`id`, `var_name`, `var_value`, `description`, `isreadonly`, `lastupdated`) VALUES
(1, 'APP_EMAIL', 'belldivine070@gmail.com', 'Email Address That Will Be Used To Send Messages To Clients', 0, '2025-11-20 22:44:00.000000'),
(2, 'APP_EMAILPWD', 'belldivine070', '', 0, '2025-11-20 22:44:00.000000'),
(3, 'APP_MOBILE', '', '', 0, '2025-11-20 22:44:00.000000'),
(4, 'APP_NAME', 'BG TECH', '', 0, '2025-11-20 22:44:00.000000'),
(5, 'APP_PORTAL', '', '', 0, '2025-11-20 22:44:00.000000'),
(6, 'APP_SHORTCODE', '', '', 0, '2025-11-20 22:44:00.000000'),
(7, 'APP_SMSAPI', '2345678', '', 0, '2025-11-20 22:44:00.000000'),
(8, 'APP_SMSEMAIL', '', '', 0, '2025-11-20 22:44:00.000000'),
(9, 'APP_SMSNAME', '', '', 0, '2025-11-20 22:44:00.000000'),
(10, 'APP_SMSPWD', '', '', 0, '2025-11-20 22:44:00.000000'),
(11, 'CONTACT_ADDRESS', '203 Fake St. Mountain View, San Francisco, California, USA', '203 Fake St. Mountain View, San Francisco, California, USA', 0, '2025-11-20 22:44:00.000000'),
(12, 'CONTACT_PERSON1', '+234 7047137084', '07047137084', 0, '2025-11-20 22:44:00.000000'),
(13, 'CONTACT_PERSON2', '', '', 0, '2025-11-20 22:44:00.000000'),
(14, 'CONTACT_PERSON3', '', '', 0, '2018-08-27 23:24:27.000000'),
(15, 'CONTACT_PERSON4', '', 'For Whatsapp Link', 0, '2025-11-20 22:44:00.000000'),
(16, 'FACEBOOK', 'belldivine070', 'Facebook Handle', 0, '2025-11-20 22:44:00.000000'),
(17, 'INSTAGRAM', 'https://www.instagram.com/belldivine080?igsh=a2hiNnU4cnljNGVj&utm_source=qr', 'Instagram Handle', 0, '2025-11-20 22:44:00.000000'),
(18, 'LINKEDIN', 'https://www.linkedin.com/in/bell-gam-404152221', 'Linkedin Handle', 0, '2025-11-20 22:44:00.000000'),
(19, 'OFFICIAL_EMAIL', 'belldivine070@gmail.com', '', 0, '2025-11-20 22:44:00.000000'),
(20, 'SITE_HITS', '', 'Number Of Times The Site Has Been Visited', 0, '2025-11-20 22:44:00.000000'),
(21, 'SLOGAN', 'Far far away, behind the word mountains, far from the countries.', '', 0, '2018-08-27 23:29:10.000000'),
(22, 'TWITTER', 'https://x.com/belldivine080?s=21', 'Twitter Handle', 0, '2025-11-20 22:44:00.000000'),
(23, 'YOUTUBE', 'belldivine070', 'Youtube Handle', 0, '2025-11-20 22:44:00.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_address`
--
ALTER TABLE `accounts_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_address_user_id_c8c74ddf_fk_accounts_customuser_id` (`user_id`);

--
-- Indexes for table `accounts_customuser`
--
ALTER TABLE `accounts_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `accounts_customuser_assigned_to_id_96c75501_fk_accounts_` (`assigned_to_id`),
  ADD KEY `accounts_customuser_department_id_48af25d3_fk_accounts_` (`department_id`),
  ADD KEY `accounts_customuser_position_id_06bd448f_fk_accounts_position_id` (`position_id`);

--
-- Indexes for table `accounts_customuser_groups`
--
ALTER TABLE `accounts_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq` (`customuser_id`,`group_id`),
  ADD KEY `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `accounts_customuser_user_permissions`
--
ALTER TABLE `accounts_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_customuser_user_customuser_id_permission_9632a709_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `accounts_department`
--
ALTER TABLE `accounts_department`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `accounts_department_permissions`
--
ALTER TABLE `accounts_department_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_department_perm_department_id_rolepermis_1820ab64_uniq` (`department_id`,`rolepermission_id`),
  ADD KEY `accounts_department__rolepermission_id_d68d851d_fk_accounts_` (`rolepermission_id`);

--
-- Indexes for table `accounts_position`
--
ALTER TABLE `accounts_position`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `accounts_position_permissions`
--
ALTER TABLE `accounts_position_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_position_permis_position_id_rolepermissi_2a0db9a5_uniq` (`position_id`,`rolepermission_id`),
  ADD KEY `accounts_position_pe_rolepermission_id_7127fe8c_fk_accounts_` (`rolepermission_id`);

--
-- Indexes for table `accounts_rolepermission`
--
ALTER TABLE `accounts_rolepermission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codename` (`codename`);

--
-- Indexes for table `app_variables`
--
ALTER TABLE `app_variables`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `var_name` (`var_name`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `cart_cart_session_key_bf21cb35` (`session_key`);

--
-- Indexes for table `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` (`cart_id`),
  ADD KEY `cart_cartitem_product_id_b24e265a_fk_product_product_id` (`product_id`),
  ADD KEY `cart_cartitem_variant_id_69f5d8c8_fk_product_productvariant_id` (`variant_id`);

--
-- Indexes for table `cart_wishlist`
--
ALTER TABLE `cart_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_wishlist_user_id_product_id_7cbe9579_uniq` (`user_id`,`product_id`),
  ADD KEY `cart_wishlist_product_id_f21d5cae_fk_product_product_id` (`product_id`);

--
-- Indexes for table `core_activitylog`
--
ALTER TABLE `core_activitylog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_activitylog_user_id_8705e516_fk_accounts_customuser_id` (`user_id`);

--
-- Indexes for table `core_appvariable`
--
ALTER TABLE `core_appvariable`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `var_name` (`var_name`);

--
-- Indexes for table `core_banner`
--
ALTER TABLE `core_banner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_banner_image_asset_id_e8d374ff_fk_core_mediaasset_id` (`image_asset_id`);

--
-- Indexes for table `core_broadcastlog`
--
ALTER TABLE `core_broadcastlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_broadcastlog_news_post_id_3015938b_fk_core_newspost_id` (`news_post_id`);

--
-- Indexes for table `core_category`
--
ALTER TABLE `core_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `core_category_media_asset_id_0ea769be_fk_core_mediaasset_id` (`media_asset_id`);

--
-- Indexes for table `core_categorypost`
--
ALTER TABLE `core_categorypost`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `core_categorypost_author_id_15abe82a_fk_accounts_customuser_id` (`author_id`),
  ADD KEY `core_categorypost_category_id_dfafc848_fk_core_category_id` (`category_id`),
  ADD KEY `core_categorypost_featured_audio_id_adb92b2b_fk_core_medi` (`featured_audio_id`),
  ADD KEY `core_categorypost_featured_image_id_af37ecbd_fk_core_medi` (`featured_image_id`),
  ADD KEY `core_categorypost_featured_video_id_cac59054_fk_core_medi` (`featured_video_id`);

--
-- Indexes for table `core_contactus`
--
ALTER TABLE `core_contactus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `core_externalsubscriber`
--
ALTER TABLE `core_externalsubscriber`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `core_mediaalbum`
--
ALTER TABLE `core_mediaalbum`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `core_mediaasset`
--
ALTER TABLE `core_mediaasset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_mediaasset_mediacat_id_07837aad_fk_core_mediaalbum_id` (`mediacat_id`);

--
-- Indexes for table `core_newspost`
--
ALTER TABLE `core_newspost`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `core_page`
--
ALTER TABLE `core_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `core_page_content_category_id_ea255718_fk_core_category_id` (`content_category_id`);

--
-- Indexes for table `core_pagesection`
--
ALTER TABLE `core_pagesection`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_pagesection_category_id_d7708217_fk_core_category_id` (`category_id`),
  ADD KEY `core_pagesection_page_id_f7023575_fk_core_page_id` (`page_id`),
  ADD KEY `core_pagesection_widget_id_b71a7493_fk_core_widget_id` (`widget_id`);

--
-- Indexes for table `core_securityauditlog`
--
ALTER TABLE `core_securityauditlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_securityauditlog_user_id_4c3286dd_fk_accounts_customuser_id` (`user_id`);

--
-- Indexes for table `core_widget`
--
ALTER TABLE `core_widget`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `core_widget_media_asset_id_9bea8d93_fk_core_mediaasset_id` (`media_asset_id`);

--
-- Indexes for table `core_widgetpost`
--
ALTER TABLE `core_widgetpost`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `core_widgetpost_author_id_b9ee67cb_fk_accounts_customuser_id` (`author_id`),
  ADD KEY `core_widgetpost_featured_audio_id_3c54d675_fk_core_mediaasset_id` (`featured_audio_id`),
  ADD KEY `core_widgetpost_featured_image_id_be70f1ea_fk_core_mediaasset_id` (`featured_image_id`),
  ADD KEY `core_widgetpost_featured_video_id_8e21613a_fk_core_mediaasset_id` (`featured_video_id`),
  ADD KEY `core_widgetpost_widget_id_e8d8d02a_fk_core_widget_id` (`widget_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_summernote_attachment`
--
ALTER TABLE `django_summernote_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_order`
--
ALTER TABLE `order_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `order_order_user_id_7cf9bc2b_fk_accounts_customuser_id` (`user_id`);

--
-- Indexes for table `order_orderitem`
--
ALTER TABLE `order_orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_orderitem_order_id_aba34f44_fk_order_order_id` (`order_id`),
  ADD KEY `order_orderitem_variant_id_8e6b11d0_fk_product_productvariant_id` (`variant_id`);

--
-- Indexes for table `order_ordertracking`
--
ALTER TABLE `order_ordertracking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_ordertracking_order_id_66ff4134_fk_order_order_id` (`order_id`),
  ADD KEY `order_ordertracking_status_message_id_24a59362_fk_order_tra` (`status_message_id`);

--
-- Indexes for table `order_trackingstatus`
--
ALTER TABLE `order_trackingstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_payment`
--
ALTER TABLE `payment_payment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transaction_reference` (`transaction_reference`),
  ADD KEY `payment_payment_order_id_22b45881_fk_order_order_id` (`order_id`),
  ADD KEY `payment_payment_user_id_f428ca02_fk_accounts_customuser_id` (`user_id`);

--
-- Indexes for table `payment_paymenthistory`
--
ALTER TABLE `payment_paymenthistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_paymenthistory_payment_id_4bdec8c7_fk_payment_payment_id` (`payment_id`),
  ADD KEY `payment_paymenthisto_user_id_f7d99375_fk_accounts_` (`user_id`);

--
-- Indexes for table `payment_refund`
--
ALTER TABLE `payment_refund`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_id` (`payment_id`),
  ADD KEY `payment_refund_processed_by_id_af29b581_fk_accounts_` (`processed_by_id`);

--
-- Indexes for table `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `product_brand_supplier_id_926b2526_fk_product_supplier_id` (`supplier_id`),
  ADD KEY `product_brand_image_id_a7ba5791_fk_core_mediaasset_id` (`image_id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `product_product`
--
ALTER TABLE `product_product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `product_product_supplier_id_22a3a2e5_fk_product_supplier_id` (`supplier_id`),
  ADD KEY `product_product_brand_id_fcf1b3f3_fk_product_brand_id` (`brand_id`),
  ADD KEY `product_product_is_primary_id_3bc049de_fk_core_mediaasset_id` (`is_primary_id`),
  ADD KEY `product_product_is_secondary_id_cf1d075f_fk_core_mediaasset_id` (`is_secondary_id`),
  ADD KEY `product_product_category_id_0c725779_fk_product_p` (`category_id`);

--
-- Indexes for table `product_productcategory`
--
ALTER TABLE `product_productcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `product_productcategory_image_id_95ac0b87_fk_core_mediaasset_id` (`image_id`);

--
-- Indexes for table `product_productinventory`
--
ALTER TABLE `product_productinventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD UNIQUE KEY `variant_id` (`variant_id`),
  ADD KEY `product_productinven_product_id_660eda66_fk_product_p` (`product_id`);

--
-- Indexes for table `product_productreview`
--
ALTER TABLE `product_productreview`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_productreview_product_id_user_id_5b444879_uniq` (`product_id`,`user_id`),
  ADD KEY `product_productreview_user_id_994d1d73_fk_accounts_customuser_id` (`user_id`);

--
-- Indexes for table `product_productvariant`
--
ALTER TABLE `product_productvariant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_productvariant_product_id_color_id_size_id_ed6d0770_uniq` (`product_id`,`color_id`,`size_id`),
  ADD KEY `product_productvariant_color_id_4483a637_fk_product_color_id` (`color_id`),
  ADD KEY `product_productvariant_size_id_a214d148_fk_product_size_id` (`size_id`),
  ADD KEY `product_productvariant_product_id_43c5a310` (`product_id`);

--
-- Indexes for table `product_product_colors`
--
ALTER TABLE `product_product_colors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_product_colors_product_id_color_id_dcc69581_uniq` (`product_id`,`color_id`),
  ADD KEY `product_product_colors_color_id_78697fd1_fk_product_color_id` (`color_id`);

--
-- Indexes for table `product_product_gallery`
--
ALTER TABLE `product_product_gallery`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_product_gallery_product_id_mediaasset_id_d171c3be_uniq` (`product_id`,`mediaasset_id`),
  ADD KEY `product_product_gall_mediaasset_id_09029416_fk_core_medi` (`mediaasset_id`);

--
-- Indexes for table `product_product_sizes`
--
ALTER TABLE `product_product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_product_sizes_product_id_size_id_6b6ba0f1_uniq` (`product_id`,`size_id`),
  ADD KEY `product_product_sizes_size_id_b1a42167_fk_product_size_id` (`size_id`);

--
-- Indexes for table `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `product_supplier_image_id_51d99062_fk_core_mediaasset_id` (`image_id`);

--
-- Indexes for table `users_appvariable`
--
ALTER TABLE `users_appvariable`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `var_name` (`var_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_address`
--
ALTER TABLE `accounts_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `accounts_customuser_groups`
--
ALTER TABLE `accounts_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_customuser_user_permissions`
--
ALTER TABLE `accounts_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_department`
--
ALTER TABLE `accounts_department`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accounts_department_permissions`
--
ALTER TABLE `accounts_department_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_position`
--
ALTER TABLE `accounts_position`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `accounts_position_permissions`
--
ALTER TABLE `accounts_position_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_rolepermission`
--
ALTER TABLE `accounts_rolepermission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_variables`
--
ALTER TABLE `app_variables`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `cart_cart`
--
ALTER TABLE `cart_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `cart_wishlist`
--
ALTER TABLE `cart_wishlist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `core_activitylog`
--
ALTER TABLE `core_activitylog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `core_appvariable`
--
ALTER TABLE `core_appvariable`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `core_banner`
--
ALTER TABLE `core_banner`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_broadcastlog`
--
ALTER TABLE `core_broadcastlog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_category`
--
ALTER TABLE `core_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `core_categorypost`
--
ALTER TABLE `core_categorypost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_contactus`
--
ALTER TABLE `core_contactus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `core_externalsubscriber`
--
ALTER TABLE `core_externalsubscriber`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `core_mediaalbum`
--
ALTER TABLE `core_mediaalbum`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `core_mediaasset`
--
ALTER TABLE `core_mediaasset`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `core_newspost`
--
ALTER TABLE `core_newspost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_page`
--
ALTER TABLE `core_page`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_pagesection`
--
ALTER TABLE `core_pagesection`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_securityauditlog`
--
ALTER TABLE `core_securityauditlog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_widget`
--
ALTER TABLE `core_widget`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `core_widgetpost`
--
ALTER TABLE `core_widgetpost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `django_summernote_attachment`
--
ALTER TABLE `django_summernote_attachment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_order`
--
ALTER TABLE `order_order`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `order_orderitem`
--
ALTER TABLE `order_orderitem`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `order_ordertracking`
--
ALTER TABLE `order_ordertracking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `order_trackingstatus`
--
ALTER TABLE `order_trackingstatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payment_payment`
--
ALTER TABLE `payment_payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_paymenthistory`
--
ALTER TABLE `payment_paymenthistory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_refund`
--
ALTER TABLE `payment_refund`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_brand`
--
ALTER TABLE `product_brand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_product`
--
ALTER TABLE `product_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_productcategory`
--
ALTER TABLE `product_productcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_productinventory`
--
ALTER TABLE `product_productinventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `product_productreview`
--
ALTER TABLE `product_productreview`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_productvariant`
--
ALTER TABLE `product_productvariant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `product_product_colors`
--
ALTER TABLE `product_product_colors`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `product_product_gallery`
--
ALTER TABLE `product_product_gallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_product_sizes`
--
ALTER TABLE `product_product_sizes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_supplier`
--
ALTER TABLE `product_supplier`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_appvariable`
--
ALTER TABLE `users_appvariable`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_address`
--
ALTER TABLE `accounts_address`
  ADD CONSTRAINT `accounts_address_user_id_c8c74ddf_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `accounts_customuser`
--
ALTER TABLE `accounts_customuser`
  ADD CONSTRAINT `accounts_customuser_assigned_to_id_96c75501_fk_accounts_` FOREIGN KEY (`assigned_to_id`) REFERENCES `accounts_customuser` (`id`),
  ADD CONSTRAINT `accounts_customuser_department_id_48af25d3_fk_accounts_` FOREIGN KEY (`department_id`) REFERENCES `accounts_department` (`id`),
  ADD CONSTRAINT `accounts_customuser_position_id_06bd448f_fk_accounts_position_id` FOREIGN KEY (`position_id`) REFERENCES `accounts_position` (`id`);

--
-- Constraints for table `accounts_customuser_groups`
--
ALTER TABLE `accounts_customuser_groups`
  ADD CONSTRAINT `accounts_customuser__customuser_id_bc55088e_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  ADD CONSTRAINT `accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `accounts_customuser_user_permissions`
--
ALTER TABLE `accounts_customuser_user_permissions`
  ADD CONSTRAINT `accounts_customuser__customuser_id_0deaefae_fk_accounts_` FOREIGN KEY (`customuser_id`) REFERENCES `accounts_customuser` (`id`),
  ADD CONSTRAINT `accounts_customuser__permission_id_aea3d0e5_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `accounts_department_permissions`
--
ALTER TABLE `accounts_department_permissions`
  ADD CONSTRAINT `accounts_department__department_id_ca38e607_fk_accounts_` FOREIGN KEY (`department_id`) REFERENCES `accounts_department` (`id`),
  ADD CONSTRAINT `accounts_department__rolepermission_id_d68d851d_fk_accounts_` FOREIGN KEY (`rolepermission_id`) REFERENCES `accounts_rolepermission` (`id`);

--
-- Constraints for table `accounts_position_permissions`
--
ALTER TABLE `accounts_position_permissions`
  ADD CONSTRAINT `accounts_position_pe_position_id_4aadf124_fk_accounts_` FOREIGN KEY (`position_id`) REFERENCES `accounts_position` (`id`),
  ADD CONSTRAINT `accounts_position_pe_rolepermission_id_7127fe8c_fk_accounts_` FOREIGN KEY (`rolepermission_id`) REFERENCES `accounts_rolepermission` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD CONSTRAINT `cart_cart_user_id_9b4220b9_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `cart_cartitem`
--
ALTER TABLE `cart_cartitem`
  ADD CONSTRAINT `cart_cartitem_cart_id_370ad265_fk_cart_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart_cart` (`id`),
  ADD CONSTRAINT `cart_cartitem_product_id_b24e265a_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  ADD CONSTRAINT `cart_cartitem_variant_id_69f5d8c8_fk_product_productvariant_id` FOREIGN KEY (`variant_id`) REFERENCES `product_productvariant` (`id`);

--
-- Constraints for table `cart_wishlist`
--
ALTER TABLE `cart_wishlist`
  ADD CONSTRAINT `cart_wishlist_product_id_f21d5cae_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  ADD CONSTRAINT `cart_wishlist_user_id_c35eec54_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `core_activitylog`
--
ALTER TABLE `core_activitylog`
  ADD CONSTRAINT `core_activitylog_user_id_8705e516_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `core_banner`
--
ALTER TABLE `core_banner`
  ADD CONSTRAINT `core_banner_image_asset_id_e8d374ff_fk_core_mediaasset_id` FOREIGN KEY (`image_asset_id`) REFERENCES `core_mediaasset` (`id`);

--
-- Constraints for table `core_broadcastlog`
--
ALTER TABLE `core_broadcastlog`
  ADD CONSTRAINT `core_broadcastlog_news_post_id_3015938b_fk_core_newspost_id` FOREIGN KEY (`news_post_id`) REFERENCES `core_newspost` (`id`);

--
-- Constraints for table `core_category`
--
ALTER TABLE `core_category`
  ADD CONSTRAINT `core_category_media_asset_id_0ea769be_fk_core_mediaasset_id` FOREIGN KEY (`media_asset_id`) REFERENCES `core_mediaasset` (`id`);

--
-- Constraints for table `core_categorypost`
--
ALTER TABLE `core_categorypost`
  ADD CONSTRAINT `core_categorypost_author_id_15abe82a_fk_accounts_customuser_id` FOREIGN KEY (`author_id`) REFERENCES `accounts_customuser` (`id`),
  ADD CONSTRAINT `core_categorypost_category_id_dfafc848_fk_core_category_id` FOREIGN KEY (`category_id`) REFERENCES `core_category` (`id`),
  ADD CONSTRAINT `core_categorypost_featured_audio_id_adb92b2b_fk_core_medi` FOREIGN KEY (`featured_audio_id`) REFERENCES `core_mediaasset` (`id`),
  ADD CONSTRAINT `core_categorypost_featured_image_id_af37ecbd_fk_core_medi` FOREIGN KEY (`featured_image_id`) REFERENCES `core_mediaasset` (`id`),
  ADD CONSTRAINT `core_categorypost_featured_video_id_cac59054_fk_core_medi` FOREIGN KEY (`featured_video_id`) REFERENCES `core_mediaasset` (`id`);

--
-- Constraints for table `core_mediaasset`
--
ALTER TABLE `core_mediaasset`
  ADD CONSTRAINT `core_mediaasset_mediacat_id_07837aad_fk_core_mediaalbum_id` FOREIGN KEY (`mediacat_id`) REFERENCES `core_mediaalbum` (`id`);

--
-- Constraints for table `core_page`
--
ALTER TABLE `core_page`
  ADD CONSTRAINT `core_page_content_category_id_ea255718_fk_core_category_id` FOREIGN KEY (`content_category_id`) REFERENCES `core_category` (`id`);

--
-- Constraints for table `core_pagesection`
--
ALTER TABLE `core_pagesection`
  ADD CONSTRAINT `core_pagesection_category_id_d7708217_fk_core_category_id` FOREIGN KEY (`category_id`) REFERENCES `core_category` (`id`),
  ADD CONSTRAINT `core_pagesection_page_id_f7023575_fk_core_page_id` FOREIGN KEY (`page_id`) REFERENCES `core_page` (`id`),
  ADD CONSTRAINT `core_pagesection_widget_id_b71a7493_fk_core_widget_id` FOREIGN KEY (`widget_id`) REFERENCES `core_widget` (`id`);

--
-- Constraints for table `core_securityauditlog`
--
ALTER TABLE `core_securityauditlog`
  ADD CONSTRAINT `core_securityauditlog_user_id_4c3286dd_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `core_widget`
--
ALTER TABLE `core_widget`
  ADD CONSTRAINT `core_widget_media_asset_id_9bea8d93_fk_core_mediaasset_id` FOREIGN KEY (`media_asset_id`) REFERENCES `core_mediaasset` (`id`);

--
-- Constraints for table `core_widgetpost`
--
ALTER TABLE `core_widgetpost`
  ADD CONSTRAINT `core_widgetpost_author_id_b9ee67cb_fk_accounts_customuser_id` FOREIGN KEY (`author_id`) REFERENCES `accounts_customuser` (`id`),
  ADD CONSTRAINT `core_widgetpost_featured_audio_id_3c54d675_fk_core_mediaasset_id` FOREIGN KEY (`featured_audio_id`) REFERENCES `core_mediaasset` (`id`),
  ADD CONSTRAINT `core_widgetpost_featured_image_id_be70f1ea_fk_core_mediaasset_id` FOREIGN KEY (`featured_image_id`) REFERENCES `core_mediaasset` (`id`),
  ADD CONSTRAINT `core_widgetpost_featured_video_id_8e21613a_fk_core_mediaasset_id` FOREIGN KEY (`featured_video_id`) REFERENCES `core_mediaasset` (`id`),
  ADD CONSTRAINT `core_widgetpost_widget_id_e8d8d02a_fk_core_widget_id` FOREIGN KEY (`widget_id`) REFERENCES `core_widget` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `order_order`
--
ALTER TABLE `order_order`
  ADD CONSTRAINT `order_order_user_id_7cf9bc2b_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `order_orderitem`
--
ALTER TABLE `order_orderitem`
  ADD CONSTRAINT `order_orderitem_order_id_aba34f44_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  ADD CONSTRAINT `order_orderitem_variant_id_8e6b11d0_fk_product_productvariant_id` FOREIGN KEY (`variant_id`) REFERENCES `product_productvariant` (`id`);

--
-- Constraints for table `order_ordertracking`
--
ALTER TABLE `order_ordertracking`
  ADD CONSTRAINT `order_ordertracking_order_id_66ff4134_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  ADD CONSTRAINT `order_ordertracking_status_message_id_24a59362_fk_order_tra` FOREIGN KEY (`status_message_id`) REFERENCES `order_trackingstatus` (`id`);

--
-- Constraints for table `payment_payment`
--
ALTER TABLE `payment_payment`
  ADD CONSTRAINT `payment_payment_order_id_22b45881_fk_order_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`),
  ADD CONSTRAINT `payment_payment_user_id_f428ca02_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `payment_paymenthistory`
--
ALTER TABLE `payment_paymenthistory`
  ADD CONSTRAINT `payment_paymenthisto_user_id_f7d99375_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`),
  ADD CONSTRAINT `payment_paymenthistory_payment_id_4bdec8c7_fk_payment_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `payment_payment` (`id`);

--
-- Constraints for table `payment_refund`
--
ALTER TABLE `payment_refund`
  ADD CONSTRAINT `payment_refund_payment_id_2e2406f1_fk_payment_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `payment_payment` (`id`),
  ADD CONSTRAINT `payment_refund_processed_by_id_af29b581_fk_accounts_` FOREIGN KEY (`processed_by_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `product_brand`
--
ALTER TABLE `product_brand`
  ADD CONSTRAINT `product_brand_image_id_a7ba5791_fk_core_mediaasset_id` FOREIGN KEY (`image_id`) REFERENCES `core_mediaasset` (`id`),
  ADD CONSTRAINT `product_brand_supplier_id_926b2526_fk_product_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `product_supplier` (`id`);

--
-- Constraints for table `product_product`
--
ALTER TABLE `product_product`
  ADD CONSTRAINT `product_product_brand_id_fcf1b3f3_fk_product_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `product_brand` (`id`),
  ADD CONSTRAINT `product_product_category_id_0c725779_fk_product_p` FOREIGN KEY (`category_id`) REFERENCES `product_productcategory` (`id`),
  ADD CONSTRAINT `product_product_is_primary_id_3bc049de_fk_core_mediaasset_id` FOREIGN KEY (`is_primary_id`) REFERENCES `core_mediaasset` (`id`),
  ADD CONSTRAINT `product_product_is_secondary_id_cf1d075f_fk_core_mediaasset_id` FOREIGN KEY (`is_secondary_id`) REFERENCES `core_mediaasset` (`id`),
  ADD CONSTRAINT `product_product_supplier_id_22a3a2e5_fk_product_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `product_supplier` (`id`);

--
-- Constraints for table `product_productcategory`
--
ALTER TABLE `product_productcategory`
  ADD CONSTRAINT `product_productcategory_image_id_95ac0b87_fk_core_mediaasset_id` FOREIGN KEY (`image_id`) REFERENCES `core_mediaasset` (`id`);

--
-- Constraints for table `product_productinventory`
--
ALTER TABLE `product_productinventory`
  ADD CONSTRAINT `product_productinven_product_id_660eda66_fk_product_p` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  ADD CONSTRAINT `product_productinven_variant_id_5b5fd271_fk_product_p` FOREIGN KEY (`variant_id`) REFERENCES `product_productvariant` (`id`);

--
-- Constraints for table `product_productreview`
--
ALTER TABLE `product_productreview`
  ADD CONSTRAINT `product_productreview_product_id_f3a2ae11_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  ADD CONSTRAINT `product_productreview_user_id_994d1d73_fk_accounts_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_customuser` (`id`);

--
-- Constraints for table `product_productvariant`
--
ALTER TABLE `product_productvariant`
  ADD CONSTRAINT `product_productvariant_color_id_4483a637_fk_product_color_id` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`id`),
  ADD CONSTRAINT `product_productvariant_product_id_43c5a310_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  ADD CONSTRAINT `product_productvariant_size_id_a214d148_fk_product_size_id` FOREIGN KEY (`size_id`) REFERENCES `product_size` (`id`);

--
-- Constraints for table `product_product_colors`
--
ALTER TABLE `product_product_colors`
  ADD CONSTRAINT `product_product_colors_color_id_78697fd1_fk_product_color_id` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`id`),
  ADD CONSTRAINT `product_product_colors_product_id_40772714_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`);

--
-- Constraints for table `product_product_gallery`
--
ALTER TABLE `product_product_gallery`
  ADD CONSTRAINT `product_product_gall_mediaasset_id_09029416_fk_core_medi` FOREIGN KEY (`mediaasset_id`) REFERENCES `core_mediaasset` (`id`),
  ADD CONSTRAINT `product_product_gall_product_id_85a9396b_fk_product_p` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`);

--
-- Constraints for table `product_product_sizes`
--
ALTER TABLE `product_product_sizes`
  ADD CONSTRAINT `product_product_sizes_product_id_f0009a9c_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  ADD CONSTRAINT `product_product_sizes_size_id_b1a42167_fk_product_size_id` FOREIGN KEY (`size_id`) REFERENCES `product_size` (`id`);

--
-- Constraints for table `product_supplier`
--
ALTER TABLE `product_supplier`
  ADD CONSTRAINT `product_supplier_image_id_51d99062_fk_core_mediaasset_id` FOREIGN KEY (`image_id`) REFERENCES `core_mediaasset` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

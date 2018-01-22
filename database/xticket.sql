-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-01-22 06:08:26
-- 服务器版本： 5.7.13-log
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xticket`
--

-- --------------------------------------------------------

--
-- 表的结构 `commands`
--

CREATE TABLE `commands` (
  `id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `script` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `executed_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `commands`
--

INSERT INTO `commands` (`id`, `title`, `script`, `created_at`, `executed_at`) VALUES
(1, 'Framework Route List', 'php artisan route:list', '2018-01-04 00:00:00', '2018-01-04 17:58:05'),
(2, '检查硬盘占用', 'df -h', '2018-01-04 17:45:33', '2018-01-05 06:37:24'),
(3, '系统升级', 'curl http://39.77.22.153:8880/git/iot.php', '2018-01-04 17:51:06', '2018-01-05 16:35:00'),
(4, 'Queue Restart', 'php artisan queue:restart', '2018-01-05 16:34:20', '2018-01-05 16:34:22');

-- --------------------------------------------------------

--
-- 表的结构 `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `group_name` varchar(64) NOT NULL DEFAULT '' COMMENT '组名',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '父用户组id',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户所在组表';

-- --------------------------------------------------------

--
-- 表的结构 `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` tinyint(4) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL,
  `depend_permission` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `menus`
--

INSERT INTO `menus` (`id`, `name`, `display_name`, `icon`, `route`, `status`, `weight`, `level`, `parent_id`, `depend_permission`) VALUES
(1, '概览', '概览', 'wodezhuye-gongzuotai', 'dashboard', 1, 1, 0, 0, 'user-home'),
(2, '新建工单', '新建工单', 'simqiaguanlixitong', 'ticket.create', 1, 2, 0, 0, ''),
(3, '待办工单', '待办工单', 'xiaoyuanquan', 'ticket.undo', 1, 3, 0, 2, 'sim-me'),
(4, '工单列表', '工单列表', 'xiaoyuanquan', 'ticket.list', 1, 4, 0, 2, 'sim-customer'),
(5, '用户列表', '用户列表', 'dingdanguanli', 'user.list', 0, 5, 0, 0, ''),
(6, '账户信息', '账户信息', 'xiaoyuanquan', 'user.profile', 1, 1, 0, 2, 'order-purchase');

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_12_18_225912_entrust_setup_tables', 2);

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('y9902@163.com', '$2y$10$g9asyjrCLhix4CeGAEnknupynipMhA0rcZqBF7d1EQYTJMQXdmL1e', '2018-01-21 03:15:33');

-- --------------------------------------------------------

--
-- 表的结构 `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `routes` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `routes`, `description`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', '概览', 'dashboard', '登陆后的首页', 0, '2018-01-20 16:00:00', '2018-01-20 16:00:00'),
(2, 'ticket.undo', '代办工单', 'ticket.undo', '', 0, '2018-01-20 16:00:00', '2018-01-20 16:00:00'),
(3, 'ticket.list', '工单列表', 'ticket.list', '', 0, NULL, NULL),
(4, 'ticket.create', '新建工单', 'ticket.create', '', 0, NULL, NULL),
(5, 'user.list', '用户列表', 'user.list', '', 0, NULL, NULL),
(6, 'user.profile', '用户资料', 'user.profile', '', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);

-- --------------------------------------------------------

--
-- 表的结构 `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否启用: 1开启 2关闭',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ADMIN', '管理员', '', 1, '2017-12-25 16:00:00', '2017-12-25 16:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `namespace` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `serialized` tinyint(4) NOT NULL DEFAULT '0',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `setting`
--

INSERT INTO `setting` (`id`, `user_id`, `namespace`, `key`, `value`, `serialized`, `updated_at`) VALUES
(1, 1, 'CUSTOMSERVICE', 'phone', '18854200001', 0, '0000-00-00 00:00:00'),
(2, 1, 'CUSTOMSERVICE', 'email', '', 0, '0000-00-00 00:00:00'),
(3, 1, 'CUSTOMSERVICE', 'qq', '', 0, '0000-00-00 00:00:00'),
(4, 1, 'CUSTOMSERVICE', 'wechat', '', 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `ip_address` int(11) NOT NULL,
  `source` varchar(11) NOT NULL,
  `is_answered` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `body` mediumtext NOT NULL,
  `format` char(6) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ticket`
--

INSERT INTO `ticket` (`id`, `account_id`, `status_id`, `dept_id`, `topic_id`, `ip_address`, `source`, `is_answered`, `title`, `body`, `format`, `created`, `updated`) VALUES
(3, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18660225058补资料,机主：2255', '{\"phoneNumber\":\"18660225058\",\"phoneUser\":\"2255\",\"idNumber\":\"370283198210076831\",\"idCardFrontUrl\":22,\"idCardBackUrl\":23,\"idCardInHandUrl\":24,\"contactNumber\":\"13864240361\"}', 'json', '2016-09-12 18:02:17', '0000-00-00 00:00:00'),
(4, 0, 2, 2, 1, 123168, 'WEIXIN', 0, '补资料,机主：', '{\"phoneNumber\":\"\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":47,\"idCardBackUrl\":45,\"idCardInHandUrl\":46,\"contactNumber\":\"\"}', 'json', '2016-09-13 06:26:10', '0000-00-00 00:00:00'),
(5, 0, 2, 2, 1, 123168, 'WEIXIN', 0, '补资料,机主：', '{\"phoneNumber\":\"\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":69,\"idCardBackUrl\":70,\"idCardInHandUrl\":71,\"contactNumber\":\"\"}', 'json', '2016-09-13 06:42:55', '0000-00-00 00:00:00'),
(6, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '补资料,机主：', '{\"phoneNumber\":\"\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":74,\"idCardBackUrl\":75,\"idCardInHandUrl\":76,\"contactNumber\":\"\"}', 'json', '2016-09-13 06:47:00', '0000-00-00 00:00:00'),
(7, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '补资料,机主：', '{\"phoneNumber\":\"\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":78,\"idCardBackUrl\":77,\"idCardInHandUrl\":79,\"contactNumber\":\"\"}', 'json', '2016-09-13 06:48:08', '0000-00-00 00:00:00'),
(8, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364223302补资料,机主：', '{\"phoneNumber\":\"18364223302\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":80,\"idCardBackUrl\":81,\"idCardInHandUrl\":82,\"contactNumber\":\"\"}', 'json', '2016-09-14 10:41:55', '0000-00-00 00:00:00'),
(9, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '15864255666补资料,机主：巩玉峰', '{\"phoneNumber\":\"15864255666\",\"phoneUser\":\"\\u5de9\\u7389\\u5cf0\",\"idNumber\":\"370982198201057158\",\"idCardFrontUrl\":83,\"idCardBackUrl\":84,\"idCardInHandUrl\":85,\"contactNumber\":\"18888888888\"}', 'json', '2016-09-14 15:31:11', '0000-00-00 00:00:00'),
(10, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '18366206068补资料,机主：何必古', '{\"phoneNumber\":\"18366206068\",\"phoneUser\":\"\\u4f55\\u5fc5\\u53e4\",\"idNumber\":\"513432198003196937\",\"idCardFrontUrl\":88,\"idCardBackUrl\":89,\"idCardInHandUrl\":90,\"contactNumber\":\"13778665640\"}', 'json', '2016-09-15 11:16:20', '0000-00-00 00:00:00'),
(11, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18366209293补资料,机主：王玉春', '{\"phoneNumber\":\"18366209293\",\"phoneUser\":\"\\u738b\\u7389\\u6625\",\"idNumber\":\"371321198602132617\",\"idCardFrontUrl\":93,\"idCardBackUrl\":94,\"idCardInHandUrl\":95,\"contactNumber\":\"18706481167\"}', 'json', '2016-09-19 09:56:59', '0000-00-00 00:00:00'),
(12, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364238819补资料,机主：王家权', '{\"phoneNumber\":\"18364238819\",\"phoneUser\":\"\\u738b\\u5bb6\\u6743\",\"idNumber\":\"420624198103056110\",\"idCardFrontUrl\":100,\"idCardBackUrl\":101,\"idCardInHandUrl\":102,\"contactNumber\":\"15153253439\"}', 'json', '2016-09-19 11:10:23', '0000-00-00 00:00:00'),
(13, 0, 1, 2, 1, 1440, 'WEIXIN', 0, '18366231907补资料,机主：张玉芳', '{\"phoneNumber\":\"18366231907\",\"phoneUser\":\"\\u5f20\\u7389\\u82b3\",\"idNumber\":\"371482199101103247\",\"idCardFrontUrl\":108,\"idCardBackUrl\":106,\"idCardInHandUrl\":107,\"contactNumber\":\"18366231907\"}', 'json', '2016-09-20 08:10:41', '0000-00-00 00:00:00'),
(14, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18366231907补资料,机主：张玉芳', '{\"phoneNumber\":\"18366231907\",\"phoneUser\":\"\\u5f20\\u7389\\u82b3\",\"idNumber\":\"371482199101103247\",\"idCardFrontUrl\":109,\"idCardBackUrl\":110,\"idCardInHandUrl\":111,\"contactNumber\":\"18366231907\"}', 'json', '2016-09-20 09:47:59', '0000-00-00 00:00:00'),
(15, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18363961891补资料,机主：季卫星', '{\"phoneNumber\":\"18363961891\",\"phoneUser\":\"\\u5b63\\u536b\\u661f\",\"idNumber\":\"320626197010301038\",\"idCardFrontUrl\":112,\"idCardBackUrl\":113,\"idCardInHandUrl\":114,\"contactNumber\":\"18363920431\"}', 'json', '2016-09-20 09:51:43', '0000-00-00 00:00:00'),
(16, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18366231907补资料,机主：张玉芳', '{\"phoneNumber\":\"18366231907\",\"phoneUser\":\"\\u5f20\\u7389\\u82b3\",\"idNumber\":\"371482199101103247\",\"idCardFrontUrl\":115,\"idCardBackUrl\":116,\"idCardInHandUrl\":117,\"contactNumber\":\"13573276305\"}', 'json', '2016-09-20 09:59:06', '0000-00-00 00:00:00'),
(17, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18363961861补资料,机主：季卫星', '{\"phoneNumber\":\"18363961861\",\"phoneUser\":\"\\u5b63\\u536b\\u661f\",\"idNumber\":\"320626197010301038\",\"idCardFrontUrl\":119,\"idCardBackUrl\":120,\"idCardInHandUrl\":121,\"contactNumber\":\"18363920431\"}', 'json', '2016-09-20 13:27:13', '0000-00-00 00:00:00'),
(18, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364248205补资料,机主：孙朔文', '{\"phoneNumber\":\"18364248205\",\"phoneUser\":\"\\u5b59\\u6714\\u6587\",\"idNumber\":\"130828199805040051\",\"idCardFrontUrl\":125,\"idCardBackUrl\":127,\"idCardInHandUrl\":126,\"contactNumber\":\"18354233035\"}', 'json', '2016-09-20 18:52:33', '0000-00-00 00:00:00'),
(19, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18364248131补资料,机主：李善扩', '{\"phoneNumber\":\"18364248131\",\"phoneUser\":\"\\u674e\\u5584\\u6269\",\"idNumber\":\"410926200007284014\",\"idCardFrontUrl\":128,\"idCardBackUrl\":129,\"idCardInHandUrl\":130,\"contactNumber\":\"18363920431\"}', 'json', '2016-09-21 08:45:55', '0000-00-00 00:00:00'),
(20, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '18364248131补资料,机主：李善扩', '{\"phoneNumber\":\"18364248131\",\"phoneUser\":\"\\u674e\\u5584\\u6269\",\"idNumber\":\"410926200007284014\",\"idCardFrontUrl\":131,\"idCardBackUrl\":132,\"idCardInHandUrl\":133,\"contactNumber\":\"18363920431\"}', 'json', '2016-09-21 09:50:46', '0000-00-00 00:00:00'),
(21, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '18366201758补资料,机主：韩善武', '{\"phoneNumber\":\"18366201758\",\"phoneUser\":\"\\u97e9\\u5584\\u6b66\",\"idNumber\":\"370211196111110511\",\"idCardFrontUrl\":134,\"idCardBackUrl\":135,\"idCardInHandUrl\":136,\"contactNumber\":\"15666220577\"}', 'json', '2016-09-21 18:17:04', '0000-00-00 00:00:00'),
(22, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18366298905补资料,机主：邓军军', '{\"phoneNumber\":\"18366298905\",\"phoneUser\":\"\\u9093\\u519b\\u519b\",\"idNumber\":\"622723198708123417\",\"idCardFrontUrl\":138,\"idCardBackUrl\":139,\"idCardInHandUrl\":140,\"contactNumber\":\"18706481167\"}', 'json', '2016-09-21 18:42:17', '0000-00-00 00:00:00'),
(23, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '18366271621补资料,机主：周飞飞', '{\"phoneNumber\":\"18366271621\",\"phoneUser\":\"\\u5468\\u98de\\u98de\",\"idNumber\":\"410927199306019027\",\"idCardFrontUrl\":144,\"idCardBackUrl\":145,\"idCardInHandUrl\":146,\"contactNumber\":\"\"}', 'json', '2016-09-22 10:11:12', '0000-00-00 00:00:00'),
(24, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18363961423补资料,机主：王瑞娟', '{\"phoneNumber\":\"18363961423\",\"phoneUser\":\"\\u738b\\u745e\\u5a1f\",\"idNumber\":\"411425198608166942\",\"idCardFrontUrl\":157,\"idCardBackUrl\":158,\"idCardInHandUrl\":159,\"contactNumber\":\"18706481167\"}', 'json', '2016-09-23 20:12:15', '0000-00-00 00:00:00'),
(25, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13864230138补资料,机主：张伟', '{\"phoneNumber\":\"13864230138\",\"phoneUser\":\"\\u5f20\\u4f1f\",\"idNumber\":\"371323199212099118\",\"idCardFrontUrl\":160,\"idCardBackUrl\":161,\"idCardInHandUrl\":162,\"contactNumber\":\"13573276305\"}', 'json', '2016-09-24 15:04:10', '0000-00-00 00:00:00'),
(26, 0, 2, 2, 1, 123235, 'WEIXIN', 0, '18364248680补资料,机主：项志伟', '{\"phoneNumber\":\"18364248680\",\"phoneUser\":\"\\u9879\\u5fd7\\u4f1f\",\"idNumber\":\"211421197201164235\",\"idCardFrontUrl\":164,\"idCardBackUrl\":165,\"idCardInHandUrl\":166,\"contactNumber\":\"18266653252\"}', 'json', '2016-09-24 20:52:46', '0000-00-00 00:00:00'),
(27, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18364248829补资料,机主：郭全仪', '{\"phoneNumber\":\"18364248829\",\"phoneUser\":\"\\u90ed\\u5168\\u4eea\",\"idNumber\":\"\",\"idCardFrontUrl\":167,\"idCardBackUrl\":168,\"idCardInHandUrl\":169,\"contactNumber\":\"15666220577\"}', 'json', '2016-09-25 09:19:18', '0000-00-00 00:00:00'),
(28, 0, 2, 2, 1, 123235, 'WEIXIN', 0, '18364248581补资料,机主：张喜军', '{\"phoneNumber\":\"18364248581\",\"phoneUser\":\"\\u5f20\\u559c\\u519b\",\"idNumber\":\"410922198407261617\",\"idCardFrontUrl\":170,\"idCardBackUrl\":171,\"idCardInHandUrl\":172,\"contactNumber\":\"18266653252\"}', 'json', '2016-09-25 11:56:05', '0000-00-00 00:00:00'),
(29, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18364230138补资料,机主：张伟', '{\"phoneNumber\":\"18364230138\",\"phoneUser\":\"\\u5f20\\u4f1f\",\"idNumber\":\"371323199212099118\",\"idCardFrontUrl\":173,\"idCardBackUrl\":174,\"idCardInHandUrl\":175,\"contactNumber\":\"13573276305\"}', 'json', '2016-09-26 14:16:40', '0000-00-00 00:00:00'),
(30, 0, 1, 2, 1, 49223, 'WEIXIN', 0, '13792857275补资料,机主：王福城', '{\"phoneNumber\":\"13792857275\",\"phoneUser\":\"\\u738b\\u798f\\u57ce\",\"idNumber\":\"370826198506185119\",\"idCardFrontUrl\":176,\"idCardBackUrl\":177,\"idCardInHandUrl\":178,\"contactNumber\":\"15964920548\"}', 'json', '2016-09-26 14:54:47', '0000-00-00 00:00:00'),
(31, 0, 1, 2, 1, 111161, 'WEIXIN', 0, '13792857275补资料,机主：王福城', '{\"phoneNumber\":\"13792857275\",\"phoneUser\":\"\\u738b\\u798f\\u57ce\",\"idNumber\":\"370826198506185119\",\"idCardFrontUrl\":179,\"idCardBackUrl\":180,\"idCardInHandUrl\":181,\"contactNumber\":\"15964920548\"}', 'json', '2016-09-26 16:56:57', '0000-00-00 00:00:00'),
(32, 0, 2, 2, 1, 111161, 'WEIXIN', 0, '13792857275补资料,机主：王福城', '{\"phoneNumber\":\"13792857275\",\"phoneUser\":\"\\u738b\\u798f\\u57ce\",\"idNumber\":\"370826198506185119\",\"idCardFrontUrl\":184,\"idCardBackUrl\":185,\"idCardInHandUrl\":186,\"contactNumber\":\"15964920548\"}', 'json', '2016-09-26 18:39:03', '0000-00-00 00:00:00'),
(33, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13792860810补资料,机主：王永康', '{\"phoneNumber\":\"13792860810\",\"phoneUser\":\"\\u738b\\u6c38\\u5eb7\",\"idNumber\":\"410928199904275414\",\"idCardFrontUrl\":188,\"idCardBackUrl\":190,\"idCardInHandUrl\":189,\"contactNumber\":\"15964920548\"}', 'json', '2016-09-26 20:34:31', '0000-00-00 00:00:00'),
(34, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '18366200986补资料,机主：代国冲', '{\"phoneNumber\":\"18366200986\",\"phoneUser\":\"\\u4ee3\\u56fd\\u51b2\",\"idNumber\":\"370882198704145231\",\"idCardFrontUrl\":192,\"idCardBackUrl\":193,\"idCardInHandUrl\":194,\"contactNumber\":\"18266653252\"}', 'json', '2016-09-27 19:09:31', '0000-00-00 00:00:00'),
(35, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '18364248783补资料,机主：丛超杰', '{\"phoneNumber\":\"18364248783\",\"phoneUser\":\"\\u4e1b\\u8d85\\u6770\",\"idNumber\":\"\",\"idCardFrontUrl\":195,\"idCardBackUrl\":196,\"idCardInHandUrl\":197,\"contactNumber\":\"15666220577\"}', 'json', '2016-09-28 11:16:29', '0000-00-00 00:00:00'),
(36, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '补资料,机主：', '{\"phoneNumber\":\"\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":198,\"idCardBackUrl\":199,\"idCardInHandUrl\":201,\"contactNumber\":\"\"}', 'json', '2016-09-28 17:49:01', '0000-00-00 00:00:00'),
(37, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18364248783补资料,机主：丛超杰', '{\"phoneNumber\":\"18364248783\",\"phoneUser\":\"\\u4e1b\\u8d85\\u6770\",\"idNumber\":\"\",\"idCardFrontUrl\":204,\"idCardBackUrl\":205,\"idCardInHandUrl\":206,\"contactNumber\":\"15666220577\"}', 'json', '2016-09-28 17:56:13', '0000-00-00 00:00:00'),
(38, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18363956521补资料,机主：宋建利', '{\"phoneNumber\":\"18363956521\",\"phoneUser\":\"\\u5b8b\\u5efa\\u5229\",\"idNumber\":\"372321198703083552\",\"idCardFrontUrl\":207,\"idCardBackUrl\":208,\"idCardInHandUrl\":210,\"contactNumber\":\"15666220577\"}', 'json', '2016-09-29 12:37:00', '0000-00-00 00:00:00'),
(39, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364235689补资料,机主：王延安', '{\"phoneNumber\":\"18364235689\",\"phoneUser\":\"\\u738b\\u5ef6\\u5b89\",\"idNumber\":\"372928198708187219\",\"idCardFrontUrl\":213,\"idCardBackUrl\":214,\"idCardInHandUrl\":215,\"contactNumber\":\"18706481167\"}', 'json', '2016-09-29 15:47:45', '0000-00-00 00:00:00'),
(40, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18364248916补资料,机主：张吉会', '{\"phoneNumber\":\"18364248916\",\"phoneUser\":\"\\u5f20\\u5409\\u4f1a\",\"idNumber\":\"370826197610204055\",\"idCardFrontUrl\":218,\"idCardBackUrl\":219,\"idCardInHandUrl\":220,\"contactNumber\":\"15666220577\"}', 'json', '2016-09-30 16:50:46', '0000-00-00 00:00:00'),
(41, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18366229362补资料,机主：武高华', '{\"phoneNumber\":\"18366229362\",\"phoneUser\":\"\\u6b66\\u9ad8\\u534e\",\"idNumber\":\"\",\"idCardFrontUrl\":221,\"idCardBackUrl\":222,\"idCardInHandUrl\":223,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-01 13:11:42', '0000-00-00 00:00:00'),
(42, 0, 2, 2, 1, 123235, 'WEIXIN', 0, '18364248672补资料,机主：梁云峰', '{\"phoneNumber\":\"18364248672\",\"phoneUser\":\"\\u6881\\u4e91\\u5cf0\",\"idNumber\":\"232324197510053019\",\"idCardFrontUrl\":224,\"idCardBackUrl\":225,\"idCardInHandUrl\":226,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-01 19:34:56', '0000-00-00 00:00:00'),
(43, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18366258060补资料,机主：谢梅林', '{\"phoneNumber\":\"18366258060\",\"phoneUser\":\"\\u8c22\\u6885\\u6797\",\"idNumber\":\"372523195405102719\",\"idCardFrontUrl\":227,\"idCardBackUrl\":228,\"idCardInHandUrl\":229,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-01 20:05:30', '0000-00-00 00:00:00'),
(44, 0, 2, 2, 1, 180153, 'WEIXIN', 0, '18364249030补资料,机主：李宏', '{\"phoneNumber\":\"18364249030\",\"phoneUser\":\"\\u674e\\u5b8f\",\"idNumber\":\"220282199505145318\",\"idCardFrontUrl\":231,\"idCardBackUrl\":232,\"idCardInHandUrl\":234,\"contactNumber\":\"18364249030\"}', 'json', '2016-10-02 14:46:12', '0000-00-00 00:00:00'),
(45, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18364248591补资料,机主：张栋梁', '{\"phoneNumber\":\"18364248591\",\"phoneUser\":\"\\u5f20\\u680b\\u6881\",\"idNumber\":\"421083199206171237\",\"idCardFrontUrl\":235,\"idCardBackUrl\":236,\"idCardInHandUrl\":237,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-03 19:09:40', '0000-00-00 00:00:00'),
(46, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '18364248591补资料,机主：张栋梁', '{\"phoneNumber\":\"18364248591\",\"phoneUser\":\"\\u5f20\\u680b\\u6881\",\"idNumber\":\"421083199206171237\",\"idCardFrontUrl\":238,\"idCardBackUrl\":239,\"idCardInHandUrl\":240,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-03 20:30:42', '0000-00-00 00:00:00'),
(47, 0, 2, 2, 1, 219133, 'WEIXIN', 0, '18364248116补资料,机主：李纪昌', '{\"phoneNumber\":\"18364248116\",\"phoneUser\":\"\\u674e\\u7eaa\\u660c\",\"idNumber\":\"371327199001163058\",\"idCardFrontUrl\":246,\"idCardBackUrl\":247,\"idCardInHandUrl\":248,\"contactNumber\":\"18363920431\"}', 'json', '2016-10-04 07:47:14', '0000-00-00 00:00:00'),
(48, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13668867796补资料,机主：毛志荣', '{\"phoneNumber\":\"13668867796\",\"phoneUser\":\"\\u6bdb\\u5fd7\\u8363\",\"idNumber\":\"430524199604026631\",\"idCardFrontUrl\":256,\"idCardBackUrl\":257,\"idCardInHandUrl\":258,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-04 15:25:18', '0000-00-00 00:00:00'),
(49, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18366219660补资料,机主：邓清天', '{\"phoneNumber\":\"18366219660\",\"phoneUser\":\"\\u9093\\u6e05\\u5929\",\"idNumber\":\"500223198510010090\",\"idCardFrontUrl\":259,\"idCardBackUrl\":260,\"idCardInHandUrl\":261,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-04 17:45:17', '0000-00-00 00:00:00'),
(50, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '18363966715补资料,机主：王广涛', '{\"phoneNumber\":\"18363966715\",\"phoneUser\":\"\\u738b\\u5e7f\\u6d9b\",\"idNumber\":\"37040519880825063X\",\"idCardFrontUrl\":262,\"idCardBackUrl\":263,\"idCardInHandUrl\":264,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-04 20:15:12', '0000-00-00 00:00:00'),
(51, 0, 1, 2, 1, 49223, 'WEIXIN', 0, '13553067536补资料,机主：舒龙贵', '{\"phoneNumber\":\"13553067536\",\"phoneUser\":\"\\u8212\\u9f99\\u8d35\",\"idNumber\":\"342421197002122577\",\"idCardFrontUrl\":265,\"idCardBackUrl\":266,\"idCardInHandUrl\":267,\"contactNumber\":\"15930084234\"}', 'json', '2016-10-05 08:54:07', '0000-00-00 00:00:00'),
(52, 0, 1, 2, 1, 49223, 'WEIXIN', 0, '13553067536补资料,机主：舒龙贵', '{\"phoneNumber\":\"13553067536\",\"phoneUser\":\"\\u8212\\u9f99\\u8d35\",\"idNumber\":\"342421197002122577\",\"idCardFrontUrl\":270,\"idCardBackUrl\":271,\"idCardInHandUrl\":272,\"contactNumber\":\"15930084234\"}', 'json', '2016-10-05 09:18:20', '0000-00-00 00:00:00'),
(53, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13553067536补资料,机主：舒龙贵', '{\"phoneNumber\":\"13553067536\",\"phoneUser\":\"\\u8212\\u9f99\\u8d35\",\"idNumber\":\"342421197002122577\",\"idCardFrontUrl\":273,\"idCardBackUrl\":274,\"idCardInHandUrl\":275,\"contactNumber\":\"15930084234\"}', 'json', '2016-10-05 10:10:18', '0000-00-00 00:00:00'),
(54, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18364230138补资料,机主：张伟', '{\"phoneNumber\":\"18364230138\",\"phoneUser\":\"\\u5f20\\u4f1f\",\"idNumber\":\"371323199212099118\",\"idCardFrontUrl\":281,\"idCardBackUrl\":280,\"idCardInHandUrl\":279,\"contactNumber\":\"13573276305\"}', 'json', '2016-10-05 11:28:40', '0000-00-00 00:00:00'),
(55, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18363953557补资料,机主：王洪发', '{\"phoneNumber\":\"18363953557\",\"phoneUser\":\"\\u738b\\u6d2a\\u53d1\",\"idNumber\":\"222324196805213730\",\"idCardFrontUrl\":282,\"idCardBackUrl\":283,\"idCardInHandUrl\":284,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-05 11:46:31', '0000-00-00 00:00:00'),
(56, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18366203380补资料,机主：郭好令', '{\"phoneNumber\":\"18366203380\",\"phoneUser\":\"\\u90ed\\u597d\\u4ee4\",\"idNumber\":\"412723197505026859\",\"idCardFrontUrl\":285,\"idCardBackUrl\":286,\"idCardInHandUrl\":287,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-05 11:52:52', '0000-00-00 00:00:00'),
(57, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364230138补资料,机主：张伟', '{\"phoneNumber\":\"18364230138\",\"phoneUser\":\"\\u5f20\\u4f1f\",\"idNumber\":\"371323199212099118\",\"idCardFrontUrl\":288,\"idCardBackUrl\":289,\"idCardInHandUrl\":290,\"contactNumber\":\"13573276305\"}', 'json', '2016-10-05 13:06:14', '0000-00-00 00:00:00'),
(58, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18366230238补资料,机主：丁军', '{\"phoneNumber\":\"18366230238\",\"phoneUser\":\"\\u4e01\\u519b\",\"idNumber\":\"370921196812171211\",\"idCardFrontUrl\":291,\"idCardBackUrl\":292,\"idCardInHandUrl\":294,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-05 19:24:53', '0000-00-00 00:00:00'),
(59, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18363906016补资料,机主：褚吉航', '{\"phoneNumber\":\"18363906016\",\"phoneUser\":\"\\u891a\\u5409\\u822a\",\"idNumber\":\"371421199910106314\",\"idCardFrontUrl\":295,\"idCardBackUrl\":296,\"idCardInHandUrl\":298,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-05 20:03:02', '0000-00-00 00:00:00'),
(60, 0, 1, 2, 1, 3988, 'WEIXIN', 0, '18366236619补资料,机主：夏丙掌', '{\"phoneNumber\":\"18366236619\",\"phoneUser\":\"\\u590f\\u4e19\\u638c\",\"idNumber\":\"370920196312122695\",\"idCardFrontUrl\":299,\"idCardBackUrl\":300,\"idCardInHandUrl\":301,\"contactNumber\":\"15864249058\"}', 'json', '2016-10-06 17:01:11', '0000-00-00 00:00:00'),
(61, 0, 2, 2, 1, 219133, 'WEIXIN', 0, '13969626265补资料,机主：杨秀娟', '{\"phoneNumber\":\"13969626265\",\"phoneUser\":\"\\u6768\\u79c0\\u5a1f\",\"idNumber\":\"230183197605140825\",\"idCardFrontUrl\":302,\"idCardBackUrl\":303,\"idCardInHandUrl\":304,\"contactNumber\":\"18363920431\"}', 'json', '2016-10-06 21:03:49', '0000-00-00 00:00:00'),
(62, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364248052补资料,机主：李凤龙', '{\"phoneNumber\":\"18364248052\",\"phoneUser\":\"\\u674e\\u51e4\\u9f99\",\"idNumber\":\"150422199712203310\",\"idCardFrontUrl\":305,\"idCardBackUrl\":306,\"idCardInHandUrl\":307,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-07 16:56:37', '0000-00-00 00:00:00'),
(63, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18353207850补资料,机主：王迁', '{\"phoneNumber\":\"18353207850\",\"phoneUser\":\"\\u738b\\u8fc1\",\"idNumber\":\"370922198805255731\",\"idCardFrontUrl\":308,\"idCardBackUrl\":309,\"idCardInHandUrl\":310,\"contactNumber\":\"15092430041\"}', 'json', '2016-10-07 18:18:20', '0000-00-00 00:00:00'),
(64, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364248216补资料,机主：李美胜', '{\"phoneNumber\":\"18364248216\",\"phoneUser\":\"\\u674e\\u7f8e\\u80dc\",\"idNumber\":\"371725200211028772\",\"idCardFrontUrl\":311,\"idCardBackUrl\":312,\"idCardInHandUrl\":313,\"contactNumber\":\"18354233035\"}', 'json', '2016-10-07 18:46:12', '0000-00-00 00:00:00'),
(65, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18366265953补资料,机主：包布仁得力根', '{\"phoneNumber\":\"18366265953\",\"phoneUser\":\"\\u5305\\u5e03\\u4ec1\\u5f97\\u529b\\u6839\",\"idNumber\":\"152326198411116616\",\"idCardFrontUrl\":314,\"idCardBackUrl\":315,\"idCardInHandUrl\":316,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-07 21:53:41', '0000-00-00 00:00:00'),
(66, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364248056补资料,机主：邢振坤', '{\"phoneNumber\":\"18364248056\",\"phoneUser\":\"\\u90a2\\u632f\\u5764\",\"idNumber\":\"370284199502266056\",\"idCardFrontUrl\":317,\"idCardBackUrl\":318,\"idCardInHandUrl\":319,\"contactNumber\":\"13589288610\"}', 'json', '2016-10-08 08:39:08', '0000-00-00 00:00:00'),
(67, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '13668862638补资料,机主：韩乃廷', '{\"phoneNumber\":\"13668862638\",\"phoneUser\":\"\\u97e9\\u4e43\\u5ef7\",\"idNumber\":\"371121199502262813\",\"idCardFrontUrl\":322,\"idCardBackUrl\":323,\"idCardInHandUrl\":324,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-08 18:48:20', '0000-00-00 00:00:00'),
(68, 0, 2, 2, 1, 1417, 'WEIXIN', 0, '18366288759补资料,机主：孙建兵', '{\"phoneNumber\":\"18366288759\",\"phoneUser\":\"\\u5b59\\u5efa\\u5175\",\"idNumber\":\"14232519960104551X\",\"idCardFrontUrl\":325,\"idCardBackUrl\":326,\"idCardInHandUrl\":327,\"contactNumber\":\"18363920431\"}', 'json', '2016-10-08 21:19:45', '0000-00-00 00:00:00'),
(69, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18364248725补资料,机主：程龙', '{\"phoneNumber\":\"18364248725\",\"phoneUser\":\"\\u7a0b\\u9f99\",\"idNumber\":\"22012219900204701X\",\"idCardFrontUrl\":335,\"idCardBackUrl\":336,\"idCardInHandUrl\":337,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-10 07:41:33', '0000-00-00 00:00:00'),
(70, 0, 1, 2, 1, 112226, 'WEIXIN', 0, '18364248716补资料,机主：阚云宝', '{\"phoneNumber\":\"18364248716\",\"phoneUser\":\"\\u961a\\u4e91\\u5b9d\",\"idNumber\":\"232324198704273014\",\"idCardFrontUrl\":338,\"idCardBackUrl\":339,\"idCardInHandUrl\":340,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-10 11:59:38', '0000-00-00 00:00:00'),
(71, 0, 2, 2, 1, 61156, 'WEIXIN', 0, '13687673656补资料,机主：关艳霞', '{\"phoneNumber\":\"13687673656\",\"phoneUser\":\"\\u5173\\u8273\\u971e\",\"idNumber\":\"231084197808150822\",\"idCardFrontUrl\":343,\"idCardBackUrl\":344,\"idCardInHandUrl\":345,\"contactNumber\":\"15864275567\"}', 'json', '2016-10-10 14:56:37', '0000-00-00 00:00:00'),
(72, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18364248716补资料,机主：阚云宝', '{\"phoneNumber\":\"18364248716\",\"phoneUser\":\"\\u961a\\u4e91\\u5b9d\",\"idNumber\":\"232324198704273014\",\"idCardFrontUrl\":349,\"idCardBackUrl\":350,\"idCardInHandUrl\":351,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-10 20:02:04', '0000-00-00 00:00:00'),
(73, 0, 1, 2, 1, 112226, 'WEIXIN', 0, '18754283954补资料,机主：蔡浩', '{\"phoneNumber\":\"18754283954\",\"phoneUser\":\"\\u8521\\u6d69\",\"idNumber\":\"410225198107134633\",\"idCardFrontUrl\":353,\"idCardBackUrl\":354,\"idCardInHandUrl\":355,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-11 07:32:20', '0000-00-00 00:00:00'),
(74, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18363968192补资料,机主：沙之民', '{\"phoneNumber\":\"18363968192\",\"phoneUser\":\"\\u6c99\\u4e4b\\u6c11\",\"idNumber\":\"412328197402125758\",\"idCardFrontUrl\":356,\"idCardBackUrl\":357,\"idCardInHandUrl\":358,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-11 11:40:24', '0000-00-00 00:00:00'),
(75, 0, 2, 2, 1, 219133, 'WEIXIN', 0, '18364248117补资料,机主：崔国', '{\"phoneNumber\":\"18364248117\",\"phoneUser\":\"\\u5d14\\u56fd\",\"idNumber\":\"37028119781210701X\",\"idCardFrontUrl\":359,\"idCardBackUrl\":360,\"idCardInHandUrl\":361,\"contactNumber\":\"18363920431\"}', 'json', '2016-10-11 13:05:23', '0000-00-00 00:00:00'),
(76, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '18363938323补资料,机主：乔秀云', '{\"phoneNumber\":\"18363938323\",\"phoneUser\":\"\\u4e54\\u79c0\\u4e91\",\"idNumber\":\"372502197602044789\",\"idCardFrontUrl\":365,\"idCardBackUrl\":366,\"idCardInHandUrl\":367,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-11 15:19:14', '0000-00-00 00:00:00'),
(77, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364249825补资料,机主：薛隆基', '{\"phoneNumber\":\"18364249825\",\"phoneUser\":\"\\u859b\\u9686\\u57fa\",\"idNumber\":\"370982199511205277\",\"idCardFrontUrl\":373,\"idCardBackUrl\":374,\"idCardInHandUrl\":375,\"contactNumber\":\"17864208036\"}', 'json', '2016-10-11 18:25:41', '0000-00-00 00:00:00'),
(78, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18366279360补资料,机主：朱志浩', '{\"phoneNumber\":\"18366279360\",\"phoneUser\":\"\\u6731\\u5fd7\\u6d69\",\"idNumber\":\"\",\"idCardFrontUrl\":376,\"idCardBackUrl\":382,\"idCardInHandUrl\":381,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-11 19:44:08', '0000-00-00 00:00:00'),
(79, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18364258907补资料,机主：曹天宇', '{\"phoneNumber\":\"18364258907\",\"phoneUser\":\"\\u66f9\\u5929\\u5b87\",\"idNumber\":\"220282199503115318\",\"idCardFrontUrl\":383,\"idCardBackUrl\":384,\"idCardInHandUrl\":385,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-12 07:42:22', '0000-00-00 00:00:00'),
(80, 0, 2, 2, 1, 112224, 'WEIXIN', 0, '18364248850补资料,机主：信德胜', '{\"phoneNumber\":\"18364248850\",\"phoneUser\":\"\\u4fe1\\u5fb7\\u80dc\",\"idNumber\":\"130924197603030593\",\"idCardFrontUrl\":386,\"idCardBackUrl\":387,\"idCardInHandUrl\":388,\"contactNumber\":\"18563981766\"}', 'json', '2016-10-12 08:10:23', '0000-00-00 00:00:00'),
(81, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364228127补资料,机主：张宁', '{\"phoneNumber\":\"18364228127\",\"phoneUser\":\"\\u5f20\\u5b81\",\"idNumber\":\"370284198809042159\",\"idCardFrontUrl\":394,\"idCardBackUrl\":395,\"idCardInHandUrl\":396,\"contactNumber\":\"18364228127\"}', 'json', '2016-10-12 18:32:07', '0000-00-00 00:00:00'),
(82, 0, 1, 2, 1, 27223, 'WEIXIN', 0, '13730970076补资料,机主：李学超', '{\"phoneNumber\":\"13730970076\",\"phoneUser\":\"\\u674e\\u5b66\\u8d85\",\"idNumber\":\"371522198701290538\",\"idCardFrontUrl\":397,\"idCardBackUrl\":398,\"idCardInHandUrl\":399,\"contactNumber\":\"13705426740\"}', 'json', '2016-10-12 18:47:24', '0000-00-00 00:00:00'),
(83, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18364248832补资料,机主：李德爱', '{\"phoneNumber\":\"18364248832\",\"phoneUser\":\"\\u674e\\u5fb7\\u7231\",\"idNumber\":\"370724198006030761\",\"idCardFrontUrl\":400,\"idCardBackUrl\":401,\"idCardInHandUrl\":402,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-12 19:22:13', '0000-00-00 00:00:00'),
(84, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18366286028补资料,机主：张滨', '{\"phoneNumber\":\"18366286028\",\"phoneUser\":\"\\u5f20\\u6ee8\",\"idNumber\":\"372501198111119772\",\"idCardFrontUrl\":403,\"idCardBackUrl\":404,\"idCardInHandUrl\":405,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-13 07:10:37', '0000-00-00 00:00:00'),
(85, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '15554200252补资料,机主：赵长平', '{\"phoneNumber\":\"15554200252\",\"phoneUser\":\"\\u8d75\\u957f\\u5e73\",\"idNumber\":\"372323199208140617\",\"idCardFrontUrl\":406,\"idCardBackUrl\":407,\"idCardInHandUrl\":408,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-13 08:34:31', '0000-00-00 00:00:00'),
(86, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18366265059补资料,机主：', '{\"phoneNumber\":\"18366265059\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":409,\"idCardBackUrl\":410,\"idCardInHandUrl\":411,\"contactNumber\":\"\"}', 'json', '2016-10-13 09:46:37', '0000-00-00 00:00:00'),
(87, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18366265059补资料,机主：艾振涛', '{\"phoneNumber\":\"18366265059\",\"phoneUser\":\"\\u827e\\u632f\\u6d9b\",\"idNumber\":\"372930198810032215\",\"idCardFrontUrl\":414,\"idCardBackUrl\":415,\"idCardInHandUrl\":416,\"contactNumber\":\"15965444833\"}', 'json', '2016-10-13 14:24:11', '0000-00-00 00:00:00'),
(88, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18364227585补资料,机主：王久勇', '{\"phoneNumber\":\"18364227585\",\"phoneUser\":\"\\u738b\\u4e45\\u52c7\",\"idNumber\":\"\",\"idCardFrontUrl\":417,\"idCardBackUrl\":418,\"idCardInHandUrl\":419,\"contactNumber\":\"18364227585\"}', 'json', '2016-10-13 15:49:33', '0000-00-00 00:00:00'),
(89, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '15605428819补资料,机主：陈吉', '{\"phoneNumber\":\"15605428819\",\"phoneUser\":\"\\u9648\\u5409\",\"idNumber\":\"140424199405094418\",\"idCardFrontUrl\":420,\"idCardBackUrl\":421,\"idCardInHandUrl\":422,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-13 16:16:16', '0000-00-00 00:00:00'),
(90, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18364248993补资料,机主：苏蒙', '{\"phoneNumber\":\"18364248993\",\"phoneUser\":\"\\u82cf\\u8499\",\"idNumber\":\"\",\"idCardFrontUrl\":423,\"idCardBackUrl\":424,\"idCardInHandUrl\":425,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-13 19:36:41', '0000-00-00 00:00:00'),
(91, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18366207902补资料,机主：刘锋', '{\"phoneNumber\":\"18366207902\",\"phoneUser\":\"\\u5218\\u950b\",\"idNumber\":\"370403197012105237\",\"idCardFrontUrl\":426,\"idCardBackUrl\":427,\"idCardInHandUrl\":428,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-13 20:27:52', '0000-00-00 00:00:00'),
(92, 0, 2, 2, 1, 219133, 'WEIXIN', 0, '18364248138补资料,机主：赵晟勋', '{\"phoneNumber\":\"18364248138\",\"phoneUser\":\"\\u8d75\\u665f\\u52cb\",\"idNumber\":\"370211199302082019\",\"idCardFrontUrl\":429,\"idCardBackUrl\":430,\"idCardInHandUrl\":431,\"contactNumber\":\"18363920431\"}', 'json', '2016-10-14 07:43:10', '0000-00-00 00:00:00'),
(93, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18364262317补资料,机主：毛良', '{\"phoneNumber\":\"18364262317\",\"phoneUser\":\"\\u6bdb\\u826f\",\"idNumber\":\"342225199701276616\",\"idCardFrontUrl\":432,\"idCardBackUrl\":433,\"idCardInHandUrl\":434,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-14 08:01:56', '0000-00-00 00:00:00'),
(94, 0, 2, 2, 1, 22380, 'WEIXIN', 0, '18364249220补资料,机主：冯鹏鹏', '{\"phoneNumber\":\"18364249220\",\"phoneUser\":\"\\u51af\\u9e4f\\u9e4f\",\"idNumber\":\"130435199404012334\",\"idCardFrontUrl\":442,\"idCardBackUrl\":443,\"idCardInHandUrl\":444,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-14 18:03:28', '0000-00-00 00:00:00'),
(95, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '15615428658补资料,机主：冯晓琴', '{\"phoneNumber\":\"15615428658\",\"phoneUser\":\"\\u51af\\u6653\\u7434\",\"idNumber\":\"142422198701284229\",\"idCardFrontUrl\":445,\"idCardBackUrl\":446,\"idCardInHandUrl\":447,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-14 19:08:28', '0000-00-00 00:00:00'),
(96, 0, 2, 2, 1, 22380, 'WEIXIN', 0, '13553065580补资料,机主：王学靖', '{\"phoneNumber\":\"13553065580\",\"phoneUser\":\"\\u738b\\u5b66\\u9756\",\"idNumber\":\"370831198302032410\",\"idCardFrontUrl\":448,\"idCardBackUrl\":449,\"idCardInHandUrl\":450,\"contactNumber\":\"18463798226\"}', 'json', '2016-10-15 10:07:09', '0000-00-00 00:00:00'),
(97, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '18364249583补资料,机主：陈支海', '{\"phoneNumber\":\"18364249583\",\"phoneUser\":\"\\u9648\\u652f\\u6d77\",\"idNumber\":\"413026197905084216\",\"idCardFrontUrl\":451,\"idCardBackUrl\":452,\"idCardInHandUrl\":453,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-15 17:20:25', '0000-00-00 00:00:00'),
(98, 0, 2, 2, 1, 140246, 'WEIXIN', 0, '18364248217补资料,机主：苗红伟', '{\"phoneNumber\":\"18364248217\",\"phoneUser\":\"\\u82d7\\u7ea2\\u4f1f\",\"idNumber\":\"230125199308144411\",\"idCardFrontUrl\":454,\"idCardBackUrl\":455,\"idCardInHandUrl\":456,\"contactNumber\":\"18354233035\"}', 'json', '2016-10-15 18:30:07', '0000-00-00 00:00:00'),
(99, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18363976697补资料,机主：张明淑', '{\"phoneNumber\":\"18363976697\",\"phoneUser\":\"\\u5f20\\u660e\\u6dd1\",\"idNumber\":\"370284199411184143\",\"idCardFrontUrl\":457,\"idCardBackUrl\":458,\"idCardInHandUrl\":459,\"contactNumber\":\"13969615183\"}', 'json', '2016-10-15 21:54:44', '0000-00-00 00:00:00'),
(100, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364257321补资料,机主：李文涛', '{\"phoneNumber\":\"18364257321\",\"phoneUser\":\"\\u674e\\u6587\\u6d9b\",\"idNumber\":\"370883198910163955\",\"idCardFrontUrl\":460,\"idCardBackUrl\":461,\"idCardInHandUrl\":462,\"contactNumber\":\"18563981766\"}', 'json', '2016-10-16 07:22:10', '0000-00-00 00:00:00'),
(101, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '15589842267补资料,机主：魏伟', '{\"phoneNumber\":\"15589842267\",\"phoneUser\":\"\\u9b4f\\u4f1f\",\"idNumber\":\"222426198902095219\",\"idCardFrontUrl\":463,\"idCardBackUrl\":464,\"idCardInHandUrl\":465,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-16 10:51:42', '0000-00-00 00:00:00'),
(102, 0, 1, 2, 1, 112226, 'WEIXIN', 0, '18364227580补资料,机主：张良', '{\"phoneNumber\":\"18364227580\",\"phoneUser\":\"\\u5f20\\u826f\",\"idNumber\":\"370683198209272271\",\"idCardFrontUrl\":466,\"idCardBackUrl\":467,\"idCardInHandUrl\":468,\"contactNumber\":\"18364227580\"}', 'json', '2016-10-16 13:41:28', '0000-00-00 00:00:00'),
(103, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364227580补资料,机主：张良', '{\"phoneNumber\":\"18364227580\",\"phoneUser\":\"\\u5f20\\u826f\",\"idNumber\":\"370683198209272271\",\"idCardFrontUrl\":469,\"idCardBackUrl\":470,\"idCardInHandUrl\":471,\"contactNumber\":\"13210037228\"}', 'json', '2016-10-16 17:13:17', '0000-00-00 00:00:00'),
(104, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18364257270补资料,机主：张振杰', '{\"phoneNumber\":\"18364257270\",\"phoneUser\":\"\\u5f20\\u632f\\u6770\",\"idNumber\":\"\",\"idCardFrontUrl\":472,\"idCardBackUrl\":473,\"idCardInHandUrl\":474,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-16 18:38:05', '0000-00-00 00:00:00'),
(105, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '15726485927补资料,机主：王俊卿', '{\"phoneNumber\":\"15726485927\",\"phoneUser\":\"\\u738b\\u4fca\\u537f\",\"idNumber\":\"412328197502144550\",\"idCardFrontUrl\":475,\"idCardBackUrl\":476,\"idCardInHandUrl\":477,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-16 20:42:27', '0000-00-00 00:00:00'),
(106, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '18364259676补资料,机主：王文涛', '{\"phoneNumber\":\"18364259676\",\"phoneUser\":\"\\u738b\\u6587\\u6d9b\",\"idNumber\":\"230121198510042216\",\"idCardFrontUrl\":478,\"idCardBackUrl\":479,\"idCardInHandUrl\":480,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-17 08:19:48', '0000-00-00 00:00:00'),
(107, 0, 2, 2, 1, 219133, 'WEIXIN', 0, '13969626329补资料,机主：殷健', '{\"phoneNumber\":\"13969626329\",\"phoneUser\":\"\\u6bb7\\u5065\",\"idNumber\":\"370284198108276411\",\"idCardFrontUrl\":481,\"idCardBackUrl\":482,\"idCardInHandUrl\":483,\"contactNumber\":\"15264210481\"}', 'json', '2016-10-17 08:49:59', '0000-00-00 00:00:00'),
(108, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18363976697补资料,机主：张明淑', '{\"phoneNumber\":\"18363976697\",\"phoneUser\":\"\\u5f20\\u660e\\u6dd1\",\"idNumber\":\"370284199411184143\",\"idCardFrontUrl\":484,\"idCardBackUrl\":485,\"idCardInHandUrl\":486,\"contactNumber\":\"13589288610\"}', 'json', '2016-10-17 08:57:02', '0000-00-00 00:00:00'),
(109, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '18364261230补资料,机主：孔满仓', '{\"phoneNumber\":\"18364261230\",\"phoneUser\":\"\\u5b54\\u6ee1\\u4ed3\",\"idNumber\":\"152324198411301819\",\"idCardFrontUrl\":487,\"idCardBackUrl\":488,\"idCardInHandUrl\":489,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-17 14:12:16', '0000-00-00 00:00:00'),
(110, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '18364261016补资料,机主：王玉习', '{\"phoneNumber\":\"18364261016\",\"phoneUser\":\"\\u738b\\u7389\\u4e60\",\"idNumber\":\"13068219660622197X\",\"idCardFrontUrl\":493,\"idCardBackUrl\":494,\"idCardInHandUrl\":495,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-17 18:18:52', '0000-00-00 00:00:00'),
(111, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '15726279503补资料,机主：郑亚超', '{\"phoneNumber\":\"15726279503\",\"phoneUser\":\"\\u90d1\\u4e9a\\u8d85\",\"idNumber\":\"130424199203112014\",\"idCardFrontUrl\":496,\"idCardBackUrl\":497,\"idCardInHandUrl\":498,\"contactNumber\":\"18354233035\"}', 'json', '2016-10-17 18:49:36', '0000-00-00 00:00:00'),
(112, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18366201758补资料,机主：韩善武', '{\"phoneNumber\":\"18366201758\",\"phoneUser\":\"\\u97e9\\u5584\\u6b66\",\"idNumber\":\"370211196111110511\",\"idCardFrontUrl\":499,\"idCardBackUrl\":500,\"idCardInHandUrl\":501,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-17 19:03:24', '0000-00-00 00:00:00'),
(113, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13668860638补资料,机主：张宗涛', '{\"phoneNumber\":\"13668860638\",\"phoneUser\":\"\\u5f20\\u5b97\\u6d9b\",\"idNumber\":\"371421199412256571\",\"idCardFrontUrl\":502,\"idCardBackUrl\":503,\"idCardInHandUrl\":504,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-17 19:37:47', '0000-00-00 00:00:00'),
(114, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18364235837补资料,机主：李增武', '{\"phoneNumber\":\"18364235837\",\"phoneUser\":\"\\u674e\\u589e\\u6b66\",\"idNumber\":\"320825195805175712\",\"idCardFrontUrl\":505,\"idCardBackUrl\":507,\"idCardInHandUrl\":508,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-17 19:43:13', '0000-00-00 00:00:00'),
(115, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '15554200058补资料,机主：李景伟', '{\"phoneNumber\":\"15554200058\",\"phoneUser\":\"\\u674e\\u666f\\u4f1f\",\"idNumber\":\"210621196403026418\",\"idCardFrontUrl\":513,\"idCardBackUrl\":514,\"idCardInHandUrl\":515,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-18 13:22:59', '0000-00-00 00:00:00'),
(116, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '15563450236补资料,机主：刘明月', '{\"phoneNumber\":\"15563450236\",\"phoneUser\":\"\\u5218\\u660e\\u6708\",\"idNumber\":\"230223199701031440\",\"idCardFrontUrl\":518,\"idCardBackUrl\":519,\"idCardInHandUrl\":520,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-18 14:36:43', '0000-00-00 00:00:00'),
(117, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13668862285补资料,机主：马吾德', '{\"phoneNumber\":\"13668862285\",\"phoneUser\":\"\\u9a6c\\u543e\\u5fb7\",\"idNumber\":\"622921199208153938\",\"idCardFrontUrl\":521,\"idCardBackUrl\":522,\"idCardInHandUrl\":523,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-18 14:40:15', '0000-00-00 00:00:00'),
(118, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18363952076补资料,机主：韦代成', '{\"phoneNumber\":\"18363952076\",\"phoneUser\":\"\\u97e6\\u4ee3\\u6210\",\"idNumber\":\"500234199006013392\",\"idCardFrontUrl\":524,\"idCardBackUrl\":525,\"idCardInHandUrl\":526,\"contactNumber\":\"18354233035\"}', 'json', '2016-10-18 17:09:25', '0000-00-00 00:00:00'),
(119, 0, 1, 2, 4, 101226, 'WEIXIN', 0, '[未付款]13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":528,\"idCardBackUrl\":530,\"idCardInHandUrl\":529,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100}', 'json', '2016-10-18 18:00:40', '0000-00-00 00:00:00'),
(120, 0, 1, 2, 4, 101226, 'WEIXIN', 0, '[未付款]13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":528,\"idCardBackUrl\":530,\"idCardInHandUrl\":529,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100}', 'json', '2016-10-18 18:00:50', '0000-00-00 00:00:00'),
(121, 0, 1, 2, 4, 101226, 'WEIXIN', 0, '[未付款]13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":528,\"idCardBackUrl\":530,\"idCardInHandUrl\":529,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100}', 'json', '2016-10-18 18:02:53', '0000-00-00 00:00:00'),
(122, 0, 1, 2, 4, 27210, 'WEIXIN', 0, '[未付款]13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":528,\"idCardBackUrl\":530,\"idCardInHandUrl\":529,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100}', 'json', '2016-10-18 18:04:22', '0000-00-00 00:00:00'),
(123, 0, 1, 2, 4, 27210, 'WEIXIN', 0, '[未付款]13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":528,\"idCardBackUrl\":530,\"idCardInHandUrl\":529,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100}', 'json', '2016-10-18 18:08:43', '0000-00-00 00:00:00'),
(124, 0, 1, 2, 4, 27210, 'WEIXIN', 0, '[未付款]13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":531,\"idCardBackUrl\":533,\"idCardInHandUrl\":534,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100}', 'json', '2016-10-18 18:21:52', '0000-00-00 00:00:00'),
(125, 0, 1, 2, 4, 101226, 'WEIXIN', 0, '[已付款]13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":536,\"idCardBackUrl\":537,\"idCardInHandUrl\":538,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"u05a7u0279,0.01u052a,u03a2u01764001972001201610187044753535,u05a7u02b1: 20161018184305, OPENID:oy_PKwRSx5rPgLEDBgrqTBSzZnr0\"}', 'json', '2016-10-18 18:42:12', '0000-00-00 00:00:00'),
(126, 0, 1, 2, 4, 101226, 'WEIXIN', 0, '[已付款]13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":539,\"idCardBackUrl\":540,\"idCardInHandUrl\":541,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d0.01\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74001972001201610187046434202,\\u652f\\u4ed8\\u65f6\\u95f4: 20161018185505, OPENID:oy_PKwRSx5rPgLEDBgrqTBSzZnr0\"}', 'json', '2016-10-18 18:54:16', '0000-00-00 00:00:00'),
(127, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13668867087补资料,机主：刘子秀', '{\"phoneNumber\":\"13668867087\",\"phoneUser\":\"\\u5218\\u5b50\\u79c0\",\"idNumber\":\"130535197802200820\",\"idCardFrontUrl\":542,\"idCardBackUrl\":543,\"idCardInHandUrl\":544,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-18 18:56:19', '0000-00-00 00:00:00'),
(128, 0, 1, 2, 4, 117185, 'WEIXIN', 0, '[已付款]13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":546,\"idCardBackUrl\":548,\"idCardInHandUrl\":550,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d0.01\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74001972001201610187046969152,\\u652f\\u4ed8\\u65f6\\u95f4: 20161018190649, OPENID:oy_PKwRSx5rPgLEDBgrqTBSzZnr0\"}', 'json', '2016-10-18 19:06:06', '0000-00-00 00:00:00'),
(129, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13789858180补资料,机主：肖中山', '{\"phoneNumber\":\"13789858180\",\"phoneUser\":\"\\u8096\\u4e2d\\u5c71\",\"idNumber\":\"412825199004203033\",\"idCardFrontUrl\":547,\"idCardBackUrl\":549,\"idCardInHandUrl\":551,\"contactNumber\":\"13210037228\"}', 'json', '2016-10-18 19:06:44', '0000-00-00 00:00:00'),
(130, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '18363967079补资料,机主：辛卫东', '{\"phoneNumber\":\"18363967079\",\"phoneUser\":\"\\u8f9b\\u536b\\u4e1c\",\"idNumber\":\"130424199211132912\",\"idCardFrontUrl\":553,\"idCardBackUrl\":554,\"idCardInHandUrl\":552,\"contactNumber\":\"15102688115\"}', 'json', '2016-10-18 21:13:16', '0000-00-00 00:00:00'),
(131, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '15275228777补资料,机主：殷圣高', '{\"phoneNumber\":\"15275228777\",\"phoneUser\":\"\\u6bb7\\u5723\\u9ad8\",\"idNumber\":\"370283197809098717\",\"idCardFrontUrl\":555,\"idCardBackUrl\":556,\"idCardInHandUrl\":557,\"contactNumber\":\"15275228777\"}', 'json', '2016-10-19 08:56:58', '0000-00-00 00:00:00'),
(132, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15555555555补资料,机主：', '{\"phoneNumber\":\"15555555555\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":558,\"idCardBackUrl\":559,\"idCardInHandUrl\":560,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201610197084027491,\\u652f\\u4ed8\\u65f6\\u95f4: 20161019090421, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2016-10-19 09:03:20', '0000-00-00 00:00:00'),
(133, 0, 2, 2, 4, 27210, 'WEIXIN', 0, '[已付款]13000000000补资料,机主：', '{\"phoneNumber\":\"13000000000\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":561,\"idCardBackUrl\":562,\"idCardInHandUrl\":563,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74001972001201610197085987117,\\u652f\\u4ed8\\u65f6\\u95f4: 20161019094026, OPENID:oy_PKwRSx5rPgLEDBgrqTBSzZnr0\"}', 'json', '2016-10-19 09:34:01', '0000-00-00 00:00:00'),
(134, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15605427002补资料,机主：', '{\"phoneNumber\":\"15605427002\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":564,\"idCardBackUrl\":565,\"idCardInHandUrl\":566,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74003972001201610197091443391,\\u652f\\u4ed8\\u65f6\\u95f4: 20161019103214, OPENID:oy_PKwQLi-E7KjDDEg3itRNWc6Jg\"}', 'json', '2016-10-19 10:30:25', '0000-00-00 00:00:00'),
(135, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '18366270731补资料,机主：李国像', '{\"phoneNumber\":\"18366270731\",\"phoneUser\":\"\\u674e\\u56fd\\u50cf\",\"idNumber\":\"372930197910174099\",\"idCardFrontUrl\":567,\"idCardBackUrl\":568,\"idCardInHandUrl\":569,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-19 13:19:13', '0000-00-00 00:00:00'),
(136, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '18366260721补资料,机主：胡勇胜', '{\"phoneNumber\":\"18366260721\",\"phoneUser\":\"\\u80e1\\u52c7\\u80dc\",\"idNumber\":\"372930197109094130\",\"idCardFrontUrl\":570,\"idCardBackUrl\":571,\"idCardInHandUrl\":572,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-19 13:26:26', '0000-00-00 00:00:00'),
(137, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15605427969补资料,机主：', '{\"phoneNumber\":\"15605427969\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":577,\"idCardBackUrl\":578,\"idCardInHandUrl\":579,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74005572001201610197127350069,\\u652f\\u4ed8\\u65f6\\u95f4: 20161019173016, OPENID:oy_PKwSE5pkd1SJah7AmqnzU6n6U\"}', 'json', '2016-10-19 17:29:23', '0000-00-00 00:00:00'),
(138, 0, 1, 2, 1, 140246, 'WEIXIN', 0, '13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":580,\"idCardBackUrl\":581,\"idCardInHandUrl\":582,\"contactNumber\":\"\"}', 'json', '2016-10-19 22:44:37', '0000-00-00 00:00:00'),
(139, 0, 1, 2, 1, 27210, 'WEIXIN', 0, '13000000000补资料,机主：', '{\"phoneNumber\":\"13000000000\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":584,\"idCardBackUrl\":585,\"idCardInHandUrl\":586,\"contactNumber\":\"\"}', 'json', '2016-10-20 09:26:42', '0000-00-00 00:00:00'),
(140, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18364248768补资料,机主：尹志成', '{\"phoneNumber\":\"18364248768\",\"phoneUser\":\"\\u5c39\\u5fd7\\u6210\",\"idNumber\":\"220602199608052413\",\"idCardFrontUrl\":587,\"idCardBackUrl\":588,\"idCardInHandUrl\":589,\"contactNumber\":\"18364248768\"}', 'json', '2016-10-20 09:29:09', '0000-00-00 00:00:00'),
(141, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13864240163补资料,机主：', '{\"phoneNumber\":\"13864240163\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":592,\"idCardBackUrl\":594,\"idCardInHandUrl\":593,\"contactNumber\":\"\"}', 'json', '2016-10-20 09:52:01', '0000-00-00 00:00:00'),
(142, 0, 2, 2, 1, 3989, 'WEIXIN', 0, '18363925302补资料,机主：陈伟明', '{\"phoneNumber\":\"18363925302\",\"phoneUser\":\"\\u9648\\u4f1f\\u660e\",\"idNumber\":\"152322198209103373\",\"idCardFrontUrl\":597,\"idCardBackUrl\":598,\"idCardInHandUrl\":599,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-20 14:59:37', '0000-00-00 00:00:00'),
(143, 0, 2, 2, 4, 112255, 'WEIXIN', 0, '[已付款]15589848839补资料,机主：', '{\"phoneNumber\":\"15589848839\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":601,\"idCardBackUrl\":603,\"idCardInHandUrl\":604,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74001342001201610207229108540,\\u652f\\u4ed8\\u65f6\\u95f4: 20161020191728, OPENID:oy_PKweCRuQBAtLbP0dspoU8sSdU\"}', 'json', '2016-10-20 19:16:31', '0000-00-00 00:00:00'),
(144, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364249815补资料,机主：綦伟强', '{\"phoneNumber\":\"18364249815\",\"phoneUser\":\"\\u7da6\\u4f1f\\u5f3a\",\"idNumber\":\"370683199405202910\",\"idCardFrontUrl\":605,\"idCardBackUrl\":606,\"idCardInHandUrl\":607,\"contactNumber\":\"13589228610\"}', 'json', '2016-10-20 19:47:19', '0000-00-00 00:00:00'),
(145, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '13730970076补资料,机主：付正宇', '{\"phoneNumber\":\"13730970076\",\"phoneUser\":\"\\u4ed8\\u6b63\\u5b87\",\"idNumber\":\"370402199903255418\",\"idCardFrontUrl\":609,\"idCardBackUrl\":610,\"idCardInHandUrl\":611,\"contactNumber\":\"13705426740\"}', 'json', '2016-10-22 11:20:08', '0000-00-00 00:00:00'),
(146, 0, 2, 2, 1, 219133, 'WEIXIN', 0, '18363935560补资料,机主：张学萌', '{\"phoneNumber\":\"18363935560\",\"phoneUser\":\"\\u5f20\\u5b66\\u840c\",\"idNumber\":\"370902199705220617\",\"idCardFrontUrl\":615,\"idCardBackUrl\":616,\"idCardInHandUrl\":617,\"contactNumber\":\"\"}', 'json', '2016-10-22 15:32:31', '0000-00-00 00:00:00'),
(147, 0, 2, 2, 1, 113120, 'WEIXIN', 0, '18364236039补资料,机主：', '{\"phoneNumber\":\"18364236039\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":619,\"idCardBackUrl\":620,\"idCardInHandUrl\":621,\"contactNumber\":\"15588661239\"}', 'json', '2016-10-22 16:35:29', '0000-00-00 00:00:00'),
(148, 0, 2, 2, 1, 183232, 'WEIXIN', 0, '13792862051补资料,机主：宋国成', '{\"phoneNumber\":\"13792862051\",\"phoneUser\":\"\\u5b8b\\u56fd\\u6210\",\"idNumber\":\"371424198602065439\",\"idCardFrontUrl\":622,\"idCardBackUrl\":623,\"idCardInHandUrl\":624,\"contactNumber\":\"15964920548\"}', 'json', '2016-10-22 17:30:38', '0000-00-00 00:00:00'),
(149, 0, 2, 2, 4, 22380, 'WEIXIN', 0, '[已付款]15610042027补资料,机主：', '{\"phoneNumber\":\"15610042027\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":625,\"idCardBackUrl\":626,\"idCardInHandUrl\":627,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000312001201610227434358040,\\u652f\\u4ed8\\u65f6\\u95f4: 20161022211145, OPENID:oy_PKwU2Z6u4cEtjeOcF0Y-Kx_LI\"}', 'json', '2016-10-22 21:10:49', '0000-00-00 00:00:00'),
(150, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '15712751460补资料,机主：陈超', '{\"phoneNumber\":\"15712751460\",\"phoneUser\":\"\\u9648\\u8d85\",\"idNumber\":\"370284199608104813\",\"idCardFrontUrl\":628,\"idCardBackUrl\":629,\"idCardInHandUrl\":630,\"contactNumber\":\"13589288610\"}', 'json', '2016-10-23 18:10:53', '0000-00-00 00:00:00');
INSERT INTO `ticket` (`id`, `account_id`, `status_id`, `dept_id`, `topic_id`, `ip_address`, `source`, `is_answered`, `title`, `body`, `format`, `created`, `updated`) VALUES
(151, 0, 2, 2, 1, 123234, 'WEIXIN', 0, '13553063325补资料,机主：王国瑞', '{\"phoneNumber\":\"13553063325\",\"phoneUser\":\"\\u738b\\u56fd\\u745e\",\"idNumber\":\"370982198912202013\",\"idCardFrontUrl\":633,\"idCardBackUrl\":631,\"idCardInHandUrl\":632,\"contactNumber\":\"13553063325\"}', 'json', '2016-10-23 19:13:23', '0000-00-00 00:00:00'),
(152, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364249773补资料,机主：陈超', '{\"phoneNumber\":\"18364249773\",\"phoneUser\":\"\\u9648\\u8d85\",\"idNumber\":\"370284199608104813\",\"idCardFrontUrl\":636,\"idCardBackUrl\":637,\"idCardInHandUrl\":638,\"contactNumber\":\"13589288610\"}', 'json', '2016-10-23 19:27:43', '0000-00-00 00:00:00'),
(153, 0, 2, 2, 1, 123235, 'WEIXIN', 0, '18363961289补资料,机主：纪成翠', '{\"phoneNumber\":\"18363961289\",\"phoneUser\":\"\\u7eaa\\u6210\\u7fe0\",\"idNumber\":\"372426197105044521\",\"idCardFrontUrl\":643,\"idCardBackUrl\":644,\"idCardInHandUrl\":641,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-23 21:16:37', '0000-00-00 00:00:00'),
(154, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13668863605补资料,机主：王彬', '{\"phoneNumber\":\"13668863605\",\"phoneUser\":\"\\u738b\\u5f6c\",\"idNumber\":\"370481199107034273\",\"idCardFrontUrl\":649,\"idCardBackUrl\":650,\"idCardInHandUrl\":651,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-24 11:50:36', '0000-00-00 00:00:00'),
(155, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15588642829补资料,机主：', '{\"phoneNumber\":\"15588642829\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":652,\"idCardBackUrl\":653,\"idCardInHandUrl\":654,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74004422001201610247573248899,\\u652f\\u4ed8\\u65f6\\u95f4: 20161024124554, OPENID:oy_PKwdYnnMRQ9ZtlUlJcKXgIvO4\"}', 'json', '2016-10-24 12:44:40', '0000-00-00 00:00:00'),
(156, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13969627352补资料,机主：马秀英', '{\"phoneNumber\":\"13969627352\",\"phoneUser\":\"\\u9a6c\\u79c0\\u82f1\",\"idNumber\":\"370421195301027021\",\"idCardFrontUrl\":657,\"idCardBackUrl\":658,\"idCardInHandUrl\":659,\"contactNumber\":\"\"}', 'json', '2016-10-24 15:45:14', '0000-00-00 00:00:00'),
(157, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13668860553补资料,机主：冯国青', '{\"phoneNumber\":\"13668860553\",\"phoneUser\":\"\\u51af\\u56fd\\u9752\",\"idNumber\":\"371524198707062432\",\"idCardFrontUrl\":660,\"idCardBackUrl\":661,\"idCardInHandUrl\":662,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-24 17:09:16', '0000-00-00 00:00:00'),
(158, 0, 1, 2, 1, 27193, 'WEIXIN', 0, '13668863621补资料,机主：王宵', '{\"phoneNumber\":\"13668863621\",\"phoneUser\":\"\\u738b\\u5bb5\",\"idNumber\":\"370832199910224927\",\"idCardFrontUrl\":663,\"idCardBackUrl\":664,\"idCardInHandUrl\":665,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-24 18:25:23', '0000-00-00 00:00:00'),
(159, 0, 1, 2, 1, 223104, 'WEIXIN', 0, '18366260871补资料,机主：梁京京', '{\"phoneNumber\":\"18366260871\",\"phoneUser\":\"\\u6881\\u4eac\\u4eac\",\"idNumber\":\"410322198412021818\",\"idCardFrontUrl\":666,\"idCardBackUrl\":667,\"idCardInHandUrl\":668,\"contactNumber\":\"18266653255\"}', 'json', '2016-10-24 18:51:57', '0000-00-00 00:00:00'),
(160, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '18363906269补资料,机主：陈伟明', '{\"phoneNumber\":\"18363906269\",\"phoneUser\":\"\\u9648\\u4f1f\\u660e\",\"idNumber\":\"152322198209103373\",\"idCardFrontUrl\":669,\"idCardBackUrl\":670,\"idCardInHandUrl\":671,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-24 18:54:27', '0000-00-00 00:00:00'),
(161, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18300223787补资料,机主：张洪卫', '{\"phoneNumber\":\"18300223787\",\"phoneUser\":\"\\u5f20\\u6d2a\\u536b\",\"idNumber\":\"230223198208260552\",\"idCardFrontUrl\":672,\"idCardBackUrl\":673,\"idCardInHandUrl\":674,\"contactNumber\":\"18300223797\"}', 'json', '2016-10-25 11:14:57', '0000-00-00 00:00:00'),
(162, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18300220596补资料,机主：黄磊', '{\"phoneNumber\":\"18300220596\",\"phoneUser\":\"\\u9ec4\\u78ca\",\"idNumber\":\"230715198809130232\",\"idCardFrontUrl\":676,\"idCardBackUrl\":677,\"idCardInHandUrl\":678,\"contactNumber\":\"18300220596\"}', 'json', '2016-10-25 16:59:36', '0000-00-00 00:00:00'),
(163, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18300220596补资料,机主：黄磊', '{\"phoneNumber\":\"18300220596\",\"phoneUser\":\"\\u9ec4\\u78ca\",\"idNumber\":\"230715198809130232\",\"idCardFrontUrl\":676,\"idCardBackUrl\":677,\"idCardInHandUrl\":678,\"contactNumber\":\"18300220596\"}', 'json', '2016-10-25 16:59:36', '0000-00-00 00:00:00'),
(164, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13608989710补资料,机主：史孝恒', '{\"phoneNumber\":\"13608989710\",\"phoneUser\":\"\\u53f2\\u5b5d\\u6052\",\"idNumber\":\"370826199008125716\",\"idCardFrontUrl\":679,\"idCardBackUrl\":680,\"idCardInHandUrl\":681,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-25 17:51:13', '0000-00-00 00:00:00'),
(165, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18363977159补资料,机主：张邢', '{\"phoneNumber\":\"18363977159\",\"phoneUser\":\"\\u5f20\\u90a2\",\"idNumber\":\"130126199605024216\",\"idCardFrontUrl\":683,\"idCardBackUrl\":684,\"idCardInHandUrl\":685,\"contactNumber\":\"18354233035\"}', 'json', '2016-10-25 18:10:52', '0000-00-00 00:00:00'),
(166, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '18366278553补资料,机主：李方垒', '{\"phoneNumber\":\"18366278553\",\"phoneUser\":\"\\u674e\\u65b9\\u5792\",\"idNumber\":\"372923197911092032\",\"idCardFrontUrl\":686,\"idCardBackUrl\":687,\"idCardInHandUrl\":688,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-25 18:14:05', '0000-00-00 00:00:00'),
(167, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '18366260871补资料,机主：李晓军', '{\"phoneNumber\":\"18366260871\",\"phoneUser\":\"\\u674e\\u6653\\u519b\",\"idNumber\":\"410322198808211810\",\"idCardFrontUrl\":689,\"idCardBackUrl\":690,\"idCardInHandUrl\":691,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-25 18:16:35', '0000-00-00 00:00:00'),
(168, 0, 2, 2, 1, 180153, 'WEIXIN', 0, '13792857057补资料,机主：程彦兵', '{\"phoneNumber\":\"13792857057\",\"phoneUser\":\"\\u7a0b\\u5f66\\u5175\",\"idNumber\":\"370831198209082819\",\"idCardFrontUrl\":692,\"idCardBackUrl\":693,\"idCardInHandUrl\":694,\"contactNumber\":\"13156389234\"}', 'json', '2016-10-25 19:14:31', '0000-00-00 00:00:00'),
(169, 0, 2, 2, 1, 219133, 'WEIXIN', 0, '18364248126补资料,机主：王云嵩', '{\"phoneNumber\":\"18364248126\",\"phoneUser\":\"\\u738b\\u4e91\\u5d69\",\"idNumber\":\"370211199711230510\",\"idCardFrontUrl\":697,\"idCardBackUrl\":698,\"idCardInHandUrl\":699,\"contactNumber\":\"\"}', 'json', '2016-10-26 11:01:07', '0000-00-00 00:00:00'),
(170, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18363928062补资料,机主：赵圣波', '{\"phoneNumber\":\"18363928062\",\"phoneUser\":\"\\u8d75\\u5723\\u6ce2\",\"idNumber\":\"372928199108048316\",\"idCardFrontUrl\":700,\"idCardBackUrl\":701,\"idCardInHandUrl\":702,\"contactNumber\":\"18354233035\"}', 'json', '2016-10-26 16:34:09', '0000-00-00 00:00:00'),
(171, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13668863621补资料,机主：王宵', '{\"phoneNumber\":\"13668863621\",\"phoneUser\":\"\\u738b\\u5bb5\",\"idNumber\":\"370832199910224927\",\"idCardFrontUrl\":703,\"idCardBackUrl\":704,\"idCardInHandUrl\":706,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-26 18:39:21', '0000-00-00 00:00:00'),
(172, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13668863983补资料,机主：杨波', '{\"phoneNumber\":\"13668863983\",\"phoneUser\":\"\\u6768\\u6ce2\",\"idNumber\":\"370983198608025311\",\"idCardFrontUrl\":707,\"idCardBackUrl\":709,\"idCardInHandUrl\":710,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-26 20:59:14', '0000-00-00 00:00:00'),
(173, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '18364249303补资料,机主：王存付', '{\"phoneNumber\":\"18364249303\",\"phoneUser\":\"\\u738b\\u5b58\\u4ed8\",\"idNumber\":\"372924198407143612\",\"idCardFrontUrl\":711,\"idCardBackUrl\":712,\"idCardInHandUrl\":713,\"contactNumber\":\"15954868616\"}', 'json', '2016-10-27 09:37:25', '0000-00-00 00:00:00'),
(174, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13668861792补资料,机主：王玉芳', '{\"phoneNumber\":\"13668861792\",\"phoneUser\":\"\\u738b\\u7389\\u82b3\",\"idNumber\":\"\",\"idCardFrontUrl\":714,\"idCardBackUrl\":715,\"idCardInHandUrl\":716,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-27 18:28:52', '0000-00-00 00:00:00'),
(175, 0, 2, 2, 1, 219133, 'WEIXIN', 0, '18364251819补资料,机主：孙凌浦', '{\"phoneNumber\":\"18364251819\",\"phoneUser\":\"\\u5b59\\u51cc\\u6d66\",\"idNumber\":\"372328200011290918\",\"idCardFrontUrl\":717,\"idCardBackUrl\":718,\"idCardInHandUrl\":719,\"contactNumber\":\"\"}', 'json', '2016-10-27 18:57:47', '0000-00-00 00:00:00'),
(176, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15610042281补资料,机主：', '{\"phoneNumber\":\"15610042281\",\"phoneUser\":null,\"idNumber\":null,\"idCardFrontUrl\":720,\"idCardBackUrl\":721,\"idCardInHandUrl\":722,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000312001201610287939375177,\\u652f\\u4ed8\\u65f6\\u95f4: 20161028102809, OPENID:oy_PKwU2Z6u4cEtjeOcF0Y-Kx_LI\"}', 'json', '2016-10-28 10:27:24', '0000-00-00 00:00:00'),
(177, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18300222383补资料,机主：徐龙浩', '{\"phoneNumber\":\"18300222383\",\"phoneUser\":\"\\u5f90\\u9f99\\u6d69\",\"idNumber\":\"372924199612212216\",\"idCardFrontUrl\":723,\"idCardBackUrl\":724,\"idCardInHandUrl\":725,\"contactNumber\":\"\"}', 'json', '2016-10-28 15:36:39', '0000-00-00 00:00:00'),
(178, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364227295补资料,机主：张书勇', '{\"phoneNumber\":\"18364227295\",\"phoneUser\":\"\\u5f20\\u4e66\\u52c7\",\"idNumber\":\"372929199010062116\",\"idCardFrontUrl\":729,\"idCardBackUrl\":730,\"idCardInHandUrl\":731,\"contactNumber\":\"13210037228\"}', 'json', '2016-10-28 16:55:08', '0000-00-00 00:00:00'),
(179, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '18363921378补资料,机主：杨长恩', '{\"phoneNumber\":\"18363921378\",\"phoneUser\":\"\\u6768\\u957f\\u6069\",\"idNumber\":\"412921196910233636\",\"idCardFrontUrl\":735,\"idCardBackUrl\":736,\"idCardInHandUrl\":737,\"contactNumber\":\"18266653252\"}', 'json', '2016-10-28 19:17:33', '0000-00-00 00:00:00'),
(180, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13608986979补资料,机主：陈建法', '{\"phoneNumber\":\"13608986979\",\"phoneUser\":\"\\u9648\\u5efa\\u6cd5\",\"idNumber\":\"371122198809086318\",\"idCardFrontUrl\":738,\"idCardBackUrl\":742,\"idCardInHandUrl\":740,\"contactNumber\":\"13210037228\"}', 'json', '2016-10-29 10:38:12', '0000-00-00 00:00:00'),
(181, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13608986979补资料,机主：陈建法', '{\"phoneNumber\":\"13608986979\",\"phoneUser\":\"\\u9648\\u5efa\\u6cd5\",\"idNumber\":\"371122198809086318\",\"idCardFrontUrl\":743,\"idCardBackUrl\":744,\"idCardInHandUrl\":745,\"contactNumber\":\"13210037228\"}', 'json', '2016-10-29 10:55:42', '0000-00-00 00:00:00'),
(182, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13789851220补资料,机主：何元伟', '{\"phoneNumber\":\"13789851220\",\"phoneUser\":\"\\u4f55\\u5143\\u4f1f\",\"idNumber\":\"370921198408254516\",\"idCardFrontUrl\":746,\"idCardBackUrl\":747,\"idCardInHandUrl\":748,\"contactNumber\":\"18706481167\"}', 'json', '2016-10-29 13:40:09', '0000-00-00 00:00:00'),
(183, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '13730972697补资料,机主：张国强', '{\"phoneNumber\":\"13730972697\",\"phoneUser\":\"\\u5f20\\u56fd\\u5f3a\",\"idNumber\":\"370826198203135114\",\"idCardFrontUrl\":749,\"idCardBackUrl\":750,\"idCardInHandUrl\":751,\"contactNumber\":\"13730972697\"}', 'json', '2016-10-29 16:40:12', '0000-00-00 00:00:00'),
(184, 0, 2, 2, 1, 27223, 'WEIXIN', 0, '18363939717补资料,机主：赵学钊', '{\"phoneNumber\":\"18363939717\",\"phoneUser\":\"\\u8d75\\u5b66\\u948a\",\"idNumber\":\"370282199103057912\",\"idCardFrontUrl\":753,\"idCardBackUrl\":754,\"idCardInHandUrl\":755,\"contactNumber\":\"15753238355\"}', 'json', '2016-10-30 09:28:55', '0000-00-00 00:00:00'),
(185, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '13730971707补资料,机主：解强', '{\"phoneNumber\":\"13730971707\",\"phoneUser\":\"\\u89e3\\u5f3a\",\"idNumber\":\"371326199004286479\",\"idCardFrontUrl\":756,\"idCardBackUrl\":757,\"idCardInHandUrl\":758,\"contactNumber\":\"15954868616\"}', 'json', '2016-10-30 13:15:44', '0000-00-00 00:00:00'),
(186, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '13789852317补资料,机主：苏庆望', '{\"phoneNumber\":\"13789852317\",\"phoneUser\":\"\\u82cf\\u5e86\\u671b\",\"idNumber\":\"371321198911063950\",\"idCardFrontUrl\":759,\"idCardBackUrl\":760,\"idCardInHandUrl\":761,\"contactNumber\":\"13789852317\"}', 'json', '2016-10-30 15:52:29', '0000-00-00 00:00:00'),
(187, 0, 0, 2, 4, 101226, 'WEIXIN', 0, '[未付款]15555556666补资料,机主：赵四', '{\"phoneNumber\":\"15555556666\",\"phoneUser\":\"\\u8d75\\u56db\",\"idNumber\":\"371212198512205545\",\"idCardFrontUrl\":780,\"idCardBackUrl\":781,\"idCardInHandUrl\":782,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100}', 'json', '2016-10-31 10:13:26', '0000-00-00 00:00:00'),
(188, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13668862360补资料,机主：李伟滨', '{\"phoneNumber\":\"13668862360\",\"phoneUser\":\"\\u674e\\u4f1f\\u6ee8\",\"idNumber\":\"370832198206107650\",\"idCardFrontUrl\":783,\"idCardBackUrl\":784,\"idCardInHandUrl\":785,\"contactNumber\":\"15666220577\"}', 'json', '2016-10-31 12:37:16', '0000-00-00 00:00:00'),
(189, 0, 2, 2, 1, 11137, 'WEIXIN', 0, '18366262815补资料,机主：卢立涛', '{\"phoneNumber\":\"18366262815\",\"phoneUser\":\"\\u5362\\u7acb\\u6d9b\",\"idNumber\":\"37110219960916101X\",\"idCardFrontUrl\":786,\"idCardBackUrl\":787,\"idCardInHandUrl\":788,\"contactNumber\":\"13589288610\"}', 'json', '2016-10-31 18:42:00', '0000-00-00 00:00:00'),
(190, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18364249958补资料,机主：王宗辉', '{\"phoneNumber\":\"18364249958\",\"phoneUser\":\"\\u738b\\u5b97\\u8f89\",\"idNumber\":\"370226197307073512\",\"idCardFrontUrl\":789,\"idCardBackUrl\":790,\"idCardInHandUrl\":791,\"contactNumber\":\"18364249958\"}', 'json', '2016-10-31 20:00:01', '0000-00-00 00:00:00'),
(191, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15606488069补资料,机主：赵栋梁', '{\"phoneNumber\":\"15606488069\",\"phoneUser\":\"\\u8d75\\u680b\\u6881\",\"idNumber\":\"132235197904050056\",\"idCardFrontUrl\":792,\"idCardBackUrl\":793,\"idCardInHandUrl\":794,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74008532001201611018336440299,\\u652f\\u4ed8\\u65f6\\u95f4: 20161101091709, OPENID:oy_PKwUWJv0BDxkMcO59auSduxKs\"}', 'json', '2016-11-01 09:16:14', '0000-00-00 00:00:00'),
(192, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15589842063补资料,机主：张照明', '{\"phoneNumber\":\"15589842063\",\"phoneUser\":\"\\u5f20\\u7167\\u660e\",\"idNumber\":\"372922199209105430\",\"idCardFrontUrl\":795,\"idCardBackUrl\":796,\"idCardInHandUrl\":797,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74009552001201611018341425837,\\u652f\\u4ed8\\u65f6\\u95f4: 20161101100957, OPENID:oy_PKwdjb5BV5YithE2MZLJpiKwU\"}', 'json', '2016-11-01 10:08:54', '0000-00-00 00:00:00'),
(193, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18300222795补资料,机主：高志刚', '{\"phoneNumber\":\"18300222795\",\"phoneUser\":\"\\u9ad8\\u5fd7\\u521a\",\"idNumber\":\"370921199010204214\",\"idCardFrontUrl\":798,\"idCardBackUrl\":799,\"idCardInHandUrl\":800,\"contactNumber\":\"15666220577\"}', 'json', '2016-11-01 13:11:21', '0000-00-00 00:00:00'),
(194, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18366216330补资料,机主：李永帅', '{\"phoneNumber\":\"18366216330\",\"phoneUser\":\"\\u674e\\u6c38\\u5e05\",\"idNumber\":\"410923199302016675\",\"idCardFrontUrl\":803,\"idCardBackUrl\":804,\"idCardInHandUrl\":805,\"contactNumber\":\"13668883795\"}', 'json', '2016-11-01 16:36:24', '0000-00-00 00:00:00'),
(195, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18364248805补资料,机主：李岩磊', '{\"phoneNumber\":\"18364248805\",\"phoneUser\":\"\\u674e\\u5ca9\\u78ca\",\"idNumber\":\"371522198909032132\",\"idCardFrontUrl\":806,\"idCardBackUrl\":807,\"idCardInHandUrl\":808,\"contactNumber\":\"15666220577\"}', 'json', '2016-11-01 17:54:10', '0000-00-00 00:00:00'),
(196, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364249812补资料,机主：李凤龙', '{\"phoneNumber\":\"18364249812\",\"phoneUser\":\"\\u674e\\u51e4\\u9f99\",\"idNumber\":\"150422199712203310\",\"idCardFrontUrl\":810,\"idCardBackUrl\":811,\"idCardInHandUrl\":812,\"contactNumber\":\"13589288610\"}', 'json', '2016-11-01 19:54:35', '0000-00-00 00:00:00'),
(197, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18364260313补资料,机主：孙永富', '{\"phoneNumber\":\"18364260313\",\"phoneUser\":\"\\u5b59\\u6c38\\u5bcc\",\"idNumber\":\"410928197004021233\",\"idCardFrontUrl\":813,\"idCardBackUrl\":814,\"idCardInHandUrl\":815,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-01 21:10:12', '0000-00-00 00:00:00'),
(198, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18363995836补资料,机主：王江', '{\"phoneNumber\":\"18363995836\",\"phoneUser\":\"\\u738b\\u6c5f\",\"idNumber\":\"142726199301201216\",\"idCardFrontUrl\":816,\"idCardBackUrl\":817,\"idCardInHandUrl\":818,\"contactNumber\":\"\"}', 'json', '2016-11-02 12:17:32', '0000-00-00 00:00:00'),
(199, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18364257662补资料,机主：王航飞', '{\"phoneNumber\":\"18364257662\",\"phoneUser\":\"\\u738b\\u822a\\u98de\",\"idNumber\":\"130582198808282619\",\"idCardFrontUrl\":822,\"idCardBackUrl\":823,\"idCardInHandUrl\":824,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-02 18:28:05', '0000-00-00 00:00:00'),
(200, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '15064830742补资料,机主：刘洪亮', '{\"phoneNumber\":\"15064830742\",\"phoneUser\":\"\\u5218\\u6d2a\\u4eae\",\"idNumber\":\"132926196709142139\",\"idCardFrontUrl\":826,\"idCardBackUrl\":827,\"idCardInHandUrl\":828,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-02 19:56:59', '0000-00-00 00:00:00'),
(201, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864853315补资料,机主：李凤龙', '{\"phoneNumber\":\"13864853315\",\"phoneUser\":\"\\u674e\\u51e4\\u9f99\",\"idNumber\":\"150422199712203310\",\"idCardFrontUrl\":830,\"idCardBackUrl\":831,\"idCardInHandUrl\":832,\"contactNumber\":\"13589288610\"}', 'json', '2016-11-02 20:28:31', '0000-00-00 00:00:00'),
(202, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15605427337补资料,机主：张昊晨', '{\"phoneNumber\":\"15605427337\",\"phoneUser\":\"\\u5f20\\u660a\\u6668\",\"idNumber\":\"370702199510270314\",\"idCardFrontUrl\":835,\"idCardBackUrl\":833,\"idCardInHandUrl\":834,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74008532001201611038594686197,\\u652f\\u4ed8\\u65f6\\u95f4: 20161103122611, OPENID:oy_PKwUWJv0BDxkMcO59auSduxKs\"}', 'json', '2016-11-03 12:24:59', '0000-00-00 00:00:00'),
(203, 0, 2, 2, 1, 27223, 'WEIXIN', 0, '18366216268补资料,机主：郑伟', '{\"phoneNumber\":\"18366216268\",\"phoneUser\":\"\\u90d1\\u4f1f\",\"idNumber\":\"370725198403192576\",\"idCardFrontUrl\":836,\"idCardBackUrl\":837,\"idCardInHandUrl\":838,\"contactNumber\":\"15610598830\"}', 'json', '2016-11-03 12:28:27', '0000-00-00 00:00:00'),
(204, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364251638补资料,机主：宫东喜', '{\"phoneNumber\":\"18364251638\",\"phoneUser\":\"\\u5bab\\u4e1c\\u559c\",\"idNumber\":\"371081197801239674\",\"idCardFrontUrl\":839,\"idCardBackUrl\":840,\"idCardInHandUrl\":841,\"contactNumber\":\"18364251638\"}', 'json', '2016-11-03 12:49:15', '0000-00-00 00:00:00'),
(205, 0, 1, 2, 1, 22380, 'WEIXIN', 0, '18364255778补资料,机主：李玉真', '{\"phoneNumber\":\"18364255778\",\"phoneUser\":\"\\u674e\\u7389\\u771f\",\"idNumber\":\"371322198708086926\",\"idCardFrontUrl\":846,\"idCardBackUrl\":847,\"idCardInHandUrl\":848,\"contactNumber\":\"18364255778\"}', 'json', '2016-11-04 12:25:30', '0000-00-00 00:00:00'),
(206, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864221321补资料,机主：刘从芳', '{\"phoneNumber\":\"13864221321\",\"phoneUser\":\"\\u5218\\u4ece\\u82b3\",\"idNumber\":\"372823196401151549\",\"idCardFrontUrl\":850,\"idCardBackUrl\":851,\"idCardInHandUrl\":852,\"contactNumber\":\"18706481167\"}', 'json', '2016-11-04 17:35:57', '0000-00-00 00:00:00'),
(207, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18364257635补资料,机主：李国强', '{\"phoneNumber\":\"18364257635\",\"phoneUser\":\"\\u674e\\u56fd\\u5f3a\",\"idNumber\":\"41092319540201541X\",\"idCardFrontUrl\":853,\"idCardBackUrl\":854,\"idCardInHandUrl\":855,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-04 20:08:11', '0000-00-00 00:00:00'),
(208, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18300222820补资料,机主：丁同坤', '{\"phoneNumber\":\"18300222820\",\"phoneUser\":\"\\u4e01\\u540c\\u5764\",\"idNumber\":\"\",\"idCardFrontUrl\":856,\"idCardBackUrl\":857,\"idCardInHandUrl\":858,\"contactNumber\":\"15666220577\"}', 'json', '2016-11-04 20:55:47', '0000-00-00 00:00:00'),
(209, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '15762290091补资料,机主：刘朋', '{\"phoneNumber\":\"15762290091\",\"phoneUser\":\"\\u5218\\u670b\",\"idNumber\":\"230521200004102513\",\"idCardFrontUrl\":862,\"idCardBackUrl\":861,\"idCardInHandUrl\":860,\"contactNumber\":\"13573276305\"}', 'json', '2016-11-05 11:10:03', '0000-00-00 00:00:00'),
(210, 0, 2, 2, 1, 3965, 'WEIXIN', 0, '18366219092补资料,机主：袁卫祥', '{\"phoneNumber\":\"18366219092\",\"phoneUser\":\"\\u8881\\u536b\\u7965\",\"idNumber\":\"370881198801081536\",\"idCardFrontUrl\":863,\"idCardBackUrl\":864,\"idCardInHandUrl\":865,\"contactNumber\":\"13645375375\"}', 'json', '2016-11-05 11:12:44', '0000-00-00 00:00:00'),
(211, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13792851630补资料,机主：', '{\"phoneNumber\":\"13792851630\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":868,\"idCardBackUrl\":869,\"idCardInHandUrl\":870,\"contactNumber\":\"\"}', 'json', '2016-11-05 14:58:51', '0000-00-00 00:00:00'),
(212, 0, 2, 2, 1, 27223, 'WEIXIN', 0, '18300220315补资料,机主：赵春阳', '{\"phoneNumber\":\"18300220315\",\"phoneUser\":\"\\u8d75\\u6625\\u9633\",\"idNumber\":\"230121199503230213\",\"idCardFrontUrl\":871,\"idCardBackUrl\":872,\"idCardInHandUrl\":873,\"contactNumber\":\"15666220577\"}', 'json', '2016-11-06 13:27:56', '0000-00-00 00:00:00'),
(213, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18364258512补资料,机主：刘光', '{\"phoneNumber\":\"18364258512\",\"phoneUser\":\"\\u5218\\u5149\",\"idNumber\":\"131127198706016250\",\"idCardFrontUrl\":874,\"idCardBackUrl\":875,\"idCardInHandUrl\":876,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-06 16:31:29', '0000-00-00 00:00:00'),
(214, 0, 2, 2, 4, 3977, 'WEIXIN', 0, '[已付款]15564898867补资料,机主：孙序柱', '{\"phoneNumber\":\"15564898867\",\"phoneUser\":\"\\u5b59\\u5e8f\\u67f1\",\"idNumber\":\"370923198104073954\",\"idCardFrontUrl\":877,\"idCardBackUrl\":878,\"idCardInHandUrl\":879,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74005082001201611068937248326,\\u652f\\u4ed8\\u65f6\\u95f4: 20161106172155, OPENID:oy_PKwdD5ygyziELYPRidwGMZJqo\"}', 'json', '2016-11-06 17:21:08', '0000-00-00 00:00:00'),
(215, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18765428674补资料,机主：杨代朝', '{\"phoneNumber\":\"18765428674\",\"phoneUser\":\"\\u6768\\u4ee3\\u671d\",\"idNumber\":\"612430196406241115\",\"idCardFrontUrl\":880,\"idCardBackUrl\":881,\"idCardInHandUrl\":882,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-06 17:40:50', '0000-00-00 00:00:00'),
(216, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18364258216补资料,机主：陈恭哲', '{\"phoneNumber\":\"18364258216\",\"phoneUser\":\"\\u9648\\u606d\\u54f2\",\"idNumber\":\"612526196701082939\",\"idCardFrontUrl\":883,\"idCardBackUrl\":884,\"idCardInHandUrl\":885,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-06 19:02:00', '0000-00-00 00:00:00'),
(217, 0, 2, 2, 1, 27223, 'WEIXIN', 0, '18366257713补资料,机主：金风侠', '{\"phoneNumber\":\"18366257713\",\"phoneUser\":\"\\u91d1\\u98ce\\u4fa0\",\"idNumber\":\"230121195305063049\",\"idCardFrontUrl\":886,\"idCardBackUrl\":887,\"idCardInHandUrl\":888,\"contactNumber\":\"\"}', 'json', '2016-11-07 09:22:53', '0000-00-00 00:00:00'),
(218, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '13730970180补资料,机主：孟春生', '{\"phoneNumber\":\"13730970180\",\"phoneUser\":\"\\u5b5f\\u6625\\u751f\",\"idNumber\":\"412727198902254038\",\"idCardFrontUrl\":891,\"idCardBackUrl\":892,\"idCardInHandUrl\":893,\"contactNumber\":\"15954868616\"}', 'json', '2016-11-09 09:00:39', '0000-00-00 00:00:00'),
(219, 0, 0, 2, 4, 27210, 'WEIXIN', 0, '[未付款]15605428056补资料,机主：龚昌江', '{\"phoneNumber\":\"15605428056\",\"phoneUser\":\"\\u9f9a\\u660c\\u6c5f\",\"idNumber\":\"232130195610011411\",\"idCardFrontUrl\":894,\"idCardBackUrl\":895,\"idCardInHandUrl\":896,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100}', 'json', '2016-11-09 11:26:10', '0000-00-00 00:00:00'),
(220, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15605428056补资料,机主：龚昌江', '{\"phoneNumber\":\"15605428056\",\"phoneUser\":\"\\u9f9a\\u660c\\u6c5f\",\"idNumber\":\"232130195610011411\",\"idCardFrontUrl\":897,\"idCardBackUrl\":898,\"idCardInHandUrl\":899,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201611099196154593,\\u652f\\u4ed8\\u65f6\\u95f4: 20161109130035, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2016-11-09 12:59:47', '0000-00-00 00:00:00'),
(221, 0, 2, 2, 1, 22380, 'WEIXIN', 0, '18364255778补资料,机主：李玉真', '{\"phoneNumber\":\"18364255778\",\"phoneUser\":\"\\u674e\\u7389\\u771f\",\"idNumber\":\"371322198708086926\",\"idCardFrontUrl\":900,\"idCardBackUrl\":901,\"idCardInHandUrl\":902,\"contactNumber\":\"18364255778\"}', 'json', '2016-11-09 16:38:27', '0000-00-00 00:00:00'),
(222, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18364255778补资料,机主：李玉真', '{\"phoneNumber\":\"18364255778\",\"phoneUser\":\"\\u674e\\u7389\\u771f\",\"idNumber\":\"371322198708086926\",\"idCardFrontUrl\":903,\"idCardBackUrl\":904,\"idCardInHandUrl\":905,\"contactNumber\":\"18364255778\"}', 'json', '2016-11-09 16:45:54', '0000-00-00 00:00:00'),
(223, 0, 1, 2, 1, 22380, 'WEIXIN', 0, '18363939902补资料,机主：李清宪', '{\"phoneNumber\":\"18363939902\",\"phoneUser\":\"\\u674e\\u6e05\\u5baa\",\"idNumber\":\"37292419910925241X\",\"idCardFrontUrl\":906,\"idCardBackUrl\":907,\"idCardInHandUrl\":908,\"contactNumber\":\"18678543244\"}', 'json', '2016-11-09 16:58:31', '0000-00-00 00:00:00'),
(224, 0, 2, 2, 1, 22380, 'WEIXIN', 0, '18363939902补资料,机主：李清宪', '{\"phoneNumber\":\"18363939902\",\"phoneUser\":\"\\u674e\\u6e05\\u5baa\",\"idNumber\":\"37292419910925241X\",\"idCardFrontUrl\":909,\"idCardBackUrl\":910,\"idCardInHandUrl\":911,\"contactNumber\":\"18678543244\"}', 'json', '2016-11-09 17:16:41', '0000-00-00 00:00:00'),
(225, 0, 2, 2, 4, 49223, 'WEIXIN', 0, '[已付款]15605422236补资料,机主：王金元', '{\"phoneNumber\":\"15605422236\",\"phoneUser\":\"\\u738b\\u91d1\\u5143\",\"idNumber\":\"371122198808106647\",\"idCardFrontUrl\":912,\"idCardBackUrl\":913,\"idCardInHandUrl\":914,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74008532001201611099227834705,\\u652f\\u4ed8\\u65f6\\u95f4: 20161109185708, OPENID:oy_PKwUWJv0BDxkMcO59auSduxKs\"}', 'json', '2016-11-09 18:56:24', '0000-00-00 00:00:00'),
(226, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15605428918补资料,机主：王玉刚', '{\"phoneNumber\":\"15605428918\",\"phoneUser\":\"\\u738b\\u7389\\u521a\",\"idNumber\":\"370724198601073619\",\"idCardFrontUrl\":915,\"idCardBackUrl\":916,\"idCardInHandUrl\":917,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74008532001201611099227871785,\\u652f\\u4ed8\\u65f6\\u95f4: 20161109185918, OPENID:oy_PKwUWJv0BDxkMcO59auSduxKs\"}', 'json', '2016-11-09 18:58:30', '0000-00-00 00:00:00'),
(227, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '13730971150补资料,机主：胡海云', '{\"phoneNumber\":\"13730971150\",\"phoneUser\":\"\\u80e1\\u6d77\\u4e91\",\"idNumber\":\"220603197201292551\",\"idCardFrontUrl\":918,\"idCardBackUrl\":919,\"idCardInHandUrl\":920,\"contactNumber\":\"15954868616\"}', 'json', '2016-11-09 19:51:14', '0000-00-00 00:00:00'),
(228, 0, 2, 2, 1, 123126, 'WEIXIN', 0, '13969625373补资料,机主：宋海莲', '{\"phoneNumber\":\"13969625373\",\"phoneUser\":\"\\u5b8b\\u6d77\\u83b2\",\"idNumber\":\"370212199608081541\",\"idCardFrontUrl\":921,\"idCardBackUrl\":922,\"idCardInHandUrl\":923,\"contactNumber\":\"\"}', 'json', '2016-11-09 21:17:01', '0000-00-00 00:00:00'),
(229, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '15726279809补资料,机主：刘为柱', '{\"phoneNumber\":\"15726279809\",\"phoneUser\":\"\\u5218\\u4e3a\\u67f1\",\"idNumber\":\"372423197907065819\",\"idCardFrontUrl\":926,\"idCardBackUrl\":927,\"idCardInHandUrl\":928,\"contactNumber\":\"\"}', 'json', '2016-11-10 18:33:49', '0000-00-00 00:00:00'),
(230, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15605428391补资料,机主：李树伟', '{\"phoneNumber\":\"15605428391\",\"phoneUser\":\"\\u674e\\u6811\\u4f1f\",\"idNumber\":\"370923196405242839\",\"idCardFrontUrl\":929,\"idCardBackUrl\":930,\"idCardInHandUrl\":931,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201611109328634736,\\u652f\\u4ed8\\u65f6\\u95f4: 20161110193011, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2016-11-10 19:29:24', '0000-00-00 00:00:00'),
(231, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '13730970239补资料,机主：刘世庆', '{\"phoneNumber\":\"13730970239\",\"phoneUser\":\"\\u5218\\u4e16\\u5e86\",\"idNumber\":\"320721197509064610\",\"idCardFrontUrl\":933,\"idCardBackUrl\":934,\"idCardInHandUrl\":935,\"contactNumber\":\"15954868616\"}', 'json', '2016-11-10 20:10:51', '0000-00-00 00:00:00'),
(232, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '15588680183补资料,机主：姚鹏', '{\"phoneNumber\":\"15588680183\",\"phoneUser\":\"\\u59da\\u9e4f\",\"idNumber\":\"620422199012180536\",\"idCardFrontUrl\":936,\"idCardBackUrl\":937,\"idCardInHandUrl\":938,\"contactNumber\":\"15588680183\"}', 'json', '2016-11-10 20:14:48', '0000-00-00 00:00:00'),
(233, 0, 1, 2, 1, 3965, 'WEIXIN', 0, '15588680183补资料,机主：姚鹏', '{\"phoneNumber\":\"15588680183\",\"phoneUser\":\"\\u59da\\u9e4f\",\"idNumber\":\"620422199012180536\",\"idCardFrontUrl\":939,\"idCardBackUrl\":940,\"idCardInHandUrl\":941,\"contactNumber\":\"15588680183\"}', 'json', '2016-11-11 08:50:02', '0000-00-00 00:00:00'),
(234, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18364250680补资料,机主：焦凯', '{\"phoneNumber\":\"18364250680\",\"phoneUser\":\"\\u7126\\u51ef\",\"idNumber\":\"142731199010206018\",\"idCardFrontUrl\":943,\"idCardBackUrl\":944,\"idCardInHandUrl\":945,\"contactNumber\":\"17099489874\"}', 'json', '2016-11-11 13:04:40', '0000-00-00 00:00:00'),
(235, 0, 2, 2, 1, 113120, 'WEIXIN', 0, '18364249953补资料,机主：', '{\"phoneNumber\":\"18364249953\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":946,\"idCardBackUrl\":947,\"idCardInHandUrl\":948,\"contactNumber\":\"\"}', 'json', '2016-11-11 20:02:02', '0000-00-00 00:00:00'),
(236, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18300220982补资料,机主：王希合', '{\"phoneNumber\":\"18300220982\",\"phoneUser\":\"\\u738b\\u5e0c\\u5408\",\"idNumber\":\"370284197608291816\",\"idCardFrontUrl\":949,\"idCardBackUrl\":950,\"idCardInHandUrl\":951,\"contactNumber\":\"15666220577\"}', 'json', '2016-11-11 20:40:22', '0000-00-00 00:00:00'),
(237, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13553063526补资料,机主：张荣光', '{\"phoneNumber\":\"13553063526\",\"phoneUser\":\"\\u5f20\\u8363\\u5149\",\"idNumber\":\"230702195403020514\",\"idCardFrontUrl\":952,\"idCardBackUrl\":953,\"idCardInHandUrl\":954,\"contactNumber\":\"13697650503\"}', 'json', '2016-11-12 11:17:22', '0000-00-00 00:00:00'),
(238, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15605428351补资料,机主：张海军', '{\"phoneNumber\":\"15605428351\",\"phoneUser\":\"\\u5f20\\u6d77\\u519b\",\"idNumber\":\"341222199108237472\",\"idCardFrontUrl\":955,\"idCardBackUrl\":956,\"idCardInHandUrl\":957,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201611129510481437,\\u652f\\u4ed8\\u65f6\\u95f4: 20161112111953, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2016-11-12 11:19:08', '0000-00-00 00:00:00'),
(239, 0, 2, 2, 1, 112255, 'WEIXIN', 0, '18364260219补资料,机主：王有田', '{\"phoneNumber\":\"18364260219\",\"phoneUser\":\"\\u738b\\u6709\\u7530\",\"idNumber\":\"51222519720720779X\",\"idCardFrontUrl\":958,\"idCardBackUrl\":959,\"idCardInHandUrl\":960,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-12 11:41:39', '0000-00-00 00:00:00'),
(240, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18364260681补资料,机主：王志军', '{\"phoneNumber\":\"18364260681\",\"phoneUser\":\"\\u738b\\u5fd7\\u519b\",\"idNumber\":\"410724196707115550\",\"idCardFrontUrl\":961,\"idCardBackUrl\":962,\"idCardInHandUrl\":963,\"contactNumber\":\"\"}', 'json', '2016-11-12 11:46:07', '0000-00-00 00:00:00'),
(241, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864222618补资料,机主：李化伟', '{\"phoneNumber\":\"13864222618\",\"phoneUser\":\"\\u674e\\u5316\\u4f1f\",\"idNumber\":\"370223198112070819\",\"idCardFrontUrl\":965,\"idCardBackUrl\":966,\"idCardInHandUrl\":967,\"contactNumber\":\"13210223638\"}', 'json', '2016-11-13 10:07:32', '0000-00-00 00:00:00'),
(242, 0, 2, 2, 1, 27223, 'WEIXIN', 0, '13806440580补资料,机主：薛申奎', '{\"phoneNumber\":\"13806440580\",\"phoneUser\":\"\\u859b\\u7533\\u594e\",\"idNumber\":\"370211197612081012\",\"idCardFrontUrl\":968,\"idCardBackUrl\":970,\"idCardInHandUrl\":969,\"contactNumber\":\"18653238757\"}', 'json', '2016-11-13 10:37:31', '0000-00-00 00:00:00'),
(243, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13806447253补资料,机主：邱兆贤', '{\"phoneNumber\":\"13806447253\",\"phoneUser\":\"\\u90b1\\u5146\\u8d24\",\"idNumber\":\"370785198906018111\",\"idCardFrontUrl\":971,\"idCardBackUrl\":972,\"idCardInHandUrl\":973,\"contactNumber\":\"13296425836\"}', 'json', '2016-11-13 19:08:05', '0000-00-00 00:00:00'),
(244, 0, 2, 2, 1, 112255, 'WEIXIN', 0, '18364259053补资料,机主：张景峰', '{\"phoneNumber\":\"18364259053\",\"phoneUser\":\"\\u5f20\\u666f\\u5cf0\",\"idNumber\":\"130626199003064875\",\"idCardFrontUrl\":974,\"idCardBackUrl\":975,\"idCardInHandUrl\":976,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-13 22:05:48', '0000-00-00 00:00:00'),
(245, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '13806448397补资料,机主：王福建', '{\"phoneNumber\":\"13806448397\",\"phoneUser\":\"\\u738b\\u798f\\u5efa\",\"idNumber\":\"370402198902166910\",\"idCardFrontUrl\":977,\"idCardBackUrl\":978,\"idCardInHandUrl\":979,\"contactNumber\":\"13806448397\"}', 'json', '2016-11-14 13:26:11', '0000-00-00 00:00:00'),
(246, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364230380补资料,机主：楚东虎', '{\"phoneNumber\":\"18364230380\",\"phoneUser\":\"\\u695a\\u4e1c\\u864e\",\"idNumber\":\"370283199704203516\",\"idCardFrontUrl\":984,\"idCardBackUrl\":985,\"idCardInHandUrl\":986,\"contactNumber\":\"13573276305\"}', 'json', '2016-11-14 17:11:09', '0000-00-00 00:00:00'),
(247, 0, 2, 2, 1, 123235, 'WEIXIN', 0, '18364257561补资料,机主：邢爱权', '{\"phoneNumber\":\"18364257561\",\"phoneUser\":\"\\u90a2\\u7231\\u6743\",\"idNumber\":\"130223198602255512\",\"idCardFrontUrl\":987,\"idCardBackUrl\":988,\"idCardInHandUrl\":989,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-14 19:26:35', '0000-00-00 00:00:00'),
(248, 0, 2, 2, 1, 123235, 'WEIXIN', 0, '18364258150补资料,机主：李生', '{\"phoneNumber\":\"18364258150\",\"phoneUser\":\"\\u674e\\u751f\",\"idNumber\":\"342122197810160811\",\"idCardFrontUrl\":990,\"idCardBackUrl\":991,\"idCardInHandUrl\":992,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-14 19:29:55', '0000-00-00 00:00:00'),
(249, 0, 2, 2, 1, 112225, 'WEIXIN', 0, '18364248286补资料,机主：王彩霞', '{\"phoneNumber\":\"18364248286\",\"phoneUser\":\"\\u738b\\u5f69\\u971e\",\"idNumber\":\"412724199603248262\",\"idCardFrontUrl\":993,\"idCardBackUrl\":994,\"idCardInHandUrl\":995,\"contactNumber\":\"15318796009\"}', 'json', '2016-11-15 09:37:53', '0000-00-00 00:00:00'),
(250, 0, 2, 2, 1, 14075, 'WEIXIN', 0, '18364248552补资料,机主：杨悦丽', '{\"phoneNumber\":\"18364248552\",\"phoneUser\":\"\\u6768\\u60a6\\u4e3d\",\"idNumber\":\"412734199709198308\",\"idCardFrontUrl\":999,\"idCardBackUrl\":1000,\"idCardInHandUrl\":1001,\"contactNumber\":\"15318796009\"}', 'json', '2016-11-15 09:43:27', '0000-00-00 00:00:00'),
(251, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '18364257521补资料,机主：杨念华', '{\"phoneNumber\":\"18364257521\",\"phoneUser\":\"\\u6768\\u5ff5\\u534e\",\"idNumber\":\"612322196102042816\",\"idCardFrontUrl\":1002,\"idCardBackUrl\":1003,\"idCardInHandUrl\":1004,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-15 11:39:57', '0000-00-00 00:00:00'),
(252, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '18364262281补资料,机主：牛继文', '{\"phoneNumber\":\"18364262281\",\"phoneUser\":\"\\u725b\\u7ee7\\u6587\",\"idNumber\":\"342225195801017779\",\"idCardFrontUrl\":1007,\"idCardBackUrl\":1008,\"idCardInHandUrl\":1009,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-15 18:33:59', '0000-00-00 00:00:00'),
(253, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '18364261785补资料,机主：饶光', '{\"phoneNumber\":\"18364261785\",\"phoneUser\":\"\\u9976\\u5149\",\"idNumber\":\"411523198712191315\",\"idCardFrontUrl\":1010,\"idCardBackUrl\":1011,\"idCardInHandUrl\":1012,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-15 18:56:30', '0000-00-00 00:00:00'),
(254, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18364249372补资料,机主：郑春华', '{\"phoneNumber\":\"18364249372\",\"phoneUser\":\"\\u90d1\\u6625\\u534e\",\"idNumber\":\"412727199601194048\",\"idCardFrontUrl\":1013,\"idCardBackUrl\":1014,\"idCardInHandUrl\":1015,\"contactNumber\":\"15954868616\"}', 'json', '2016-11-15 20:32:10', '0000-00-00 00:00:00'),
(255, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18364262053补资料,机主：李国像', '{\"phoneNumber\":\"18364262053\",\"phoneUser\":\"\\u674e\\u56fd\\u50cf\",\"idNumber\":\"372930197910174099\",\"idCardFrontUrl\":1017,\"idCardBackUrl\":1018,\"idCardInHandUrl\":1019,\"contactNumber\":\"18266653252\"}', 'json', '2016-11-16 17:10:46', '0000-00-00 00:00:00'),
(256, 0, 2, 2, 1, 119166, 'WEIXIN', 0, '18364261279补资料,机主：郭丙中', '{\"phoneNumber\":\"18364261279\",\"phoneUser\":\"\\u90ed\\u4e19\\u4e2d\",\"idNumber\":\"32082819700929361X\",\"idCardFrontUrl\":1020,\"idCardBackUrl\":1021,\"idCardInHandUrl\":1022,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-17 07:13:28', '0000-00-00 00:00:00'),
(257, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18300222915补资料,机主：鲁法雷', '{\"phoneNumber\":\"18300222915\",\"phoneUser\":\"\\u9c81\\u6cd5\\u96f7\",\"idNumber\":\"370982198511255317\",\"idCardFrontUrl\":1023,\"idCardBackUrl\":1024,\"idCardInHandUrl\":1025,\"contactNumber\":\"18706481167\"}', 'json', '2016-11-17 12:52:51', '0000-00-00 00:00:00'),
(258, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '18364261593补资料,机主：张飞', '{\"phoneNumber\":\"18364261593\",\"phoneUser\":\"\\u5f20\\u98de\",\"idNumber\":\"232332198705082711\",\"idCardFrontUrl\":1027,\"idCardBackUrl\":1028,\"idCardInHandUrl\":1029,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-17 13:46:29', '0000-00-00 00:00:00'),
(259, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864263006补资料,机主：冯莹', '{\"phoneNumber\":\"13864263006\",\"phoneUser\":\"\\u51af\\u83b9\",\"idNumber\":\"412829198002072827\",\"idCardFrontUrl\":1030,\"idCardBackUrl\":1031,\"idCardInHandUrl\":1032,\"contactNumber\":\"18706481167\"}', 'json', '2016-11-17 14:16:49', '0000-00-00 00:00:00'),
(260, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '18364252326补资料,机主：林港', '{\"phoneNumber\":\"18364252326\",\"phoneUser\":\"\\u6797\\u6e2f\",\"idNumber\":\"331021199702271252\",\"idCardFrontUrl\":1035,\"idCardBackUrl\":1034,\"idCardInHandUrl\":1036,\"contactNumber\":\"\"}', 'json', '2016-11-17 17:19:15', '0000-00-00 00:00:00'),
(261, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '18364261965补资料,机主：唐磊', '{\"phoneNumber\":\"18364261965\",\"phoneUser\":\"\\u5510\\u78ca\",\"idNumber\":\"\",\"idCardFrontUrl\":1037,\"idCardBackUrl\":1038,\"idCardInHandUrl\":1039,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-17 18:46:34', '0000-00-00 00:00:00'),
(262, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '18364258391补资料,机主：芦明德', '{\"phoneNumber\":\"18364258391\",\"phoneUser\":\"\\u82a6\\u660e\\u5fb7\",\"idNumber\":\"210522196602261710\",\"idCardFrontUrl\":1040,\"idCardBackUrl\":1041,\"idCardInHandUrl\":1042,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-17 19:23:25', '0000-00-00 00:00:00'),
(263, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '13864863176补资料,机主：夏忠', '{\"phoneNumber\":\"13864863176\",\"phoneUser\":\"\\u590f\\u5fe0\",\"idNumber\":\"152104197402134130\",\"idCardFrontUrl\":1043,\"idCardBackUrl\":1044,\"idCardInHandUrl\":1045,\"contactNumber\":\"15095218199\"}', 'json', '2016-11-17 20:25:20', '0000-00-00 00:00:00'),
(264, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '18364259372补资料,机主：李红宾', '{\"phoneNumber\":\"18364259372\",\"phoneUser\":\"\\u674e\\u7ea2\\u5bbe\",\"idNumber\":\"370829198601191719\",\"idCardFrontUrl\":1046,\"idCardBackUrl\":1047,\"idCardInHandUrl\":1048,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-17 21:20:39', '0000-00-00 00:00:00'),
(265, 0, 2, 2, 4, 112226, 'WEIXIN', 0, '[已付款]13165079785补资料,机主：刘增会', '{\"phoneNumber\":\"13165079785\",\"phoneUser\":\"\\u5218\\u589e\\u4f1a\",\"idNumber\":\"132227197106195517\",\"idCardFrontUrl\":1051,\"idCardBackUrl\":1052,\"idCardInHandUrl\":1053,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74006232001201611180092807422,\\u652f\\u4ed8\\u65f6\\u95f4: 20161118141534, OPENID:oy_PKweArQjhSCETLnAWzqasli88\"}', 'json', '2016-11-18 14:14:45', '0000-00-00 00:00:00'),
(266, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864227990补资料,机主：郑伟', '{\"phoneNumber\":\"13864227990\",\"phoneUser\":\"\\u90d1\\u4f1f\",\"idNumber\":\"232625197207200031\",\"idCardFrontUrl\":1054,\"idCardBackUrl\":1055,\"idCardInHandUrl\":1056,\"contactNumber\":\"18706481167\"}', 'json', '2016-11-18 15:32:53', '0000-00-00 00:00:00'),
(267, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13730973839补资料,机主：管廷仁', '{\"phoneNumber\":\"13730973839\",\"phoneUser\":\"\\u7ba1\\u5ef7\\u4ec1\",\"idNumber\":\"370211196302180512\",\"idCardFrontUrl\":1058,\"idCardBackUrl\":1059,\"idCardInHandUrl\":1060,\"contactNumber\":\"18706481167\"}', 'json', '2016-11-18 15:53:30', '0000-00-00 00:00:00'),
(268, 0, 1, 2, 1, 117185, 'WEIXIN', 0, '13730973839补资料,机主：管廷仁', '{\"phoneNumber\":\"13730973839\",\"phoneUser\":\"\\u7ba1\\u5ef7\\u4ec1\",\"idNumber\":\"370211196302180512\",\"idCardFrontUrl\":1061,\"idCardBackUrl\":1062,\"idCardInHandUrl\":1063,\"contactNumber\":\"15806427722\"}', 'json', '2016-11-18 16:30:29', '0000-00-00 00:00:00'),
(269, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '13864851229补资料,机主：周有', '{\"phoneNumber\":\"13864851229\",\"phoneUser\":\"\\u5468\\u6709\",\"idNumber\":\"232103197202101733\",\"idCardFrontUrl\":1064,\"idCardBackUrl\":1065,\"idCardInHandUrl\":1066,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-18 17:43:28', '0000-00-00 00:00:00'),
(270, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '13553062185补资料,机主：王萌', '{\"phoneNumber\":\"13553062185\",\"phoneUser\":\"\\u738b\\u840c\",\"idNumber\":\"230321198112096236\",\"idCardFrontUrl\":1067,\"idCardBackUrl\":1068,\"idCardInHandUrl\":1069,\"contactNumber\":\"18866422714\"}', 'json', '2016-11-19 12:08:52', '0000-00-00 00:00:00'),
(271, 0, 2, 2, 4, 112226, 'WEIXIN', 0, '[已付款]13165060281补资料,机主：朱毛增', '{\"phoneNumber\":\"13165060281\",\"phoneUser\":\"\\u6731\\u6bdb\\u589e\",\"idNumber\":\"412328196808155151\",\"idCardFrontUrl\":1070,\"idCardBackUrl\":1071,\"idCardInHandUrl\":1072,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000362001201611190181195814,\\u652f\\u4ed8\\u65f6\\u95f4: 20161119122355, OPENID:oy_PKwSw8ESg57YkhD0s179mm2fw\"}', 'json', '2016-11-19 12:23:09', '0000-00-00 00:00:00'),
(272, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13553062535补资料,机主：李亚璇', '{\"phoneNumber\":\"13553062535\",\"phoneUser\":\"\\u674e\\u4e9a\\u7487\",\"idNumber\":\"370284200007106421\",\"idCardFrontUrl\":1073,\"idCardBackUrl\":1074,\"idCardInHandUrl\":1075,\"contactNumber\":\"18324740782\"}', 'json', '2016-11-19 12:50:40', '0000-00-00 00:00:00'),
(273, 0, 2, 2, 4, 112226, 'WEIXIN', 0, '[已付款]13165068171补资料,机主：宋忠杨', '{\"phoneNumber\":\"13165068171\",\"phoneUser\":\"\\u5b8b\\u5fe0\\u6768\",\"idNumber\":\"320721198309170675\",\"idCardFrontUrl\":1077,\"idCardBackUrl\":1078,\"idCardInHandUrl\":1079,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000362001201611190183688033,\\u652f\\u4ed8\\u65f6\\u95f4: 20161119130351, OPENID:oy_PKwSw8ESg57YkhD0s179mm2fw\"}', 'json', '2016-11-19 13:03:04', '0000-00-00 00:00:00'),
(274, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '13969625506补资料,机主：王明金', '{\"phoneNumber\":\"13969625506\",\"phoneUser\":\"\\u738b\\u660e\\u91d1\",\"idNumber\":\"370481199610217018\",\"idCardFrontUrl\":1080,\"idCardBackUrl\":1081,\"idCardInHandUrl\":1082,\"contactNumber\":\"\"}', 'json', '2016-11-19 17:23:57', '0000-00-00 00:00:00'),
(275, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18300220380补资料,机主：赵廷波', '{\"phoneNumber\":\"18300220380\",\"phoneUser\":\"\\u8d75\\u5ef7\\u6ce2\",\"idNumber\":\"371121198010092518\",\"idCardFrontUrl\":1083,\"idCardBackUrl\":1084,\"idCardInHandUrl\":1085,\"contactNumber\":\"\"}', 'json', '2016-11-19 19:48:23', '0000-00-00 00:00:00'),
(276, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864266639补资料,机主：鞠立峰', '{\"phoneNumber\":\"13864266639\",\"phoneUser\":\"\\u97a0\\u7acb\\u5cf0\",\"idNumber\":\"371323198808182217\",\"idCardFrontUrl\":1088,\"idCardBackUrl\":1086,\"idCardInHandUrl\":1087,\"contactNumber\":\"13573276305\"}', 'json', '2016-11-20 08:43:28', '0000-00-00 00:00:00'),
(277, 0, 2, 2, 4, 22380, 'WEIXIN', 0, '[已付款]15610042258补资料,机主：王红', '{\"phoneNumber\":\"15610042258\",\"phoneUser\":\"\\u738b\\u7ea2\",\"idNumber\":\"370181198708170325\",\"idCardFrontUrl\":1089,\"idCardBackUrl\":1090,\"idCardInHandUrl\":1091,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000312001201611200261791033,\\u652f\\u4ed8\\u65f6\\u95f4: 20161120091846, OPENID:oy_PKwU2Z6u4cEtjeOcF0Y-Kx_LI\"}', 'json', '2016-11-20 09:17:41', '0000-00-00 00:00:00'),
(278, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13553062535补资料,机主：李亚璇', '{\"phoneNumber\":\"13553062535\",\"phoneUser\":\"\\u674e\\u4e9a\\u7487\",\"idNumber\":\"370284200007106421\",\"idCardFrontUrl\":1092,\"idCardBackUrl\":1093,\"idCardInHandUrl\":1094,\"contactNumber\":\"18324740782\"}', 'json', '2016-11-20 18:01:01', '0000-00-00 00:00:00'),
(279, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '补资料,机主：', '{\"phoneNumber\":\"\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":1103,\"idCardBackUrl\":1104,\"idCardInHandUrl\":1102,\"contactNumber\":\"\"}', 'json', '2016-11-20 18:48:46', '0000-00-00 00:00:00'),
(280, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '13864849932补资料,机主：姜立友', '{\"phoneNumber\":\"13864849932\",\"phoneUser\":\"\\u59dc\\u7acb\\u53cb\",\"idNumber\":\"232103197512250670\",\"idCardFrontUrl\":1105,\"idCardBackUrl\":1106,\"idCardInHandUrl\":1107,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-20 19:18:09', '0000-00-00 00:00:00'),
(281, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '15712704169补资料,机主：孙华', '{\"phoneNumber\":\"15712704169\",\"phoneUser\":\"\\u5b59\\u534e\",\"idNumber\":\"370281199209266728\",\"idCardFrontUrl\":1108,\"idCardBackUrl\":1109,\"idCardInHandUrl\":1110,\"contactNumber\":\"15712704169\"}', 'json', '2016-11-21 09:11:32', '0000-00-00 00:00:00'),
(282, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18363981075补资料,机主：田今淑', '{\"phoneNumber\":\"18363981075\",\"phoneUser\":\"\\u7530\\u4eca\\u6dd1\",\"idNumber\":\"220283197305202346\",\"idCardFrontUrl\":1111,\"idCardBackUrl\":1112,\"idCardInHandUrl\":1113,\"contactNumber\":\"18354233035\"}', 'json', '2016-11-21 12:09:23', '0000-00-00 00:00:00'),
(283, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13806442696补资料,机主：李振锋', '{\"phoneNumber\":\"13806442696\",\"phoneUser\":\"\\u674e\\u632f\\u950b\",\"idNumber\":\"37021119960228101X\",\"idCardFrontUrl\":1114,\"idCardBackUrl\":1115,\"idCardInHandUrl\":1116,\"contactNumber\":\"18561882469\"}', 'json', '2016-11-21 12:35:40', '0000-00-00 00:00:00'),
(284, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864869397补资料,机主：秦世博', '{\"phoneNumber\":\"13864869397\",\"phoneUser\":\"\\u79e6\\u4e16\\u535a\",\"idNumber\":\"220282199411125615\",\"idCardFrontUrl\":1117,\"idCardBackUrl\":1118,\"idCardInHandUrl\":1119,\"contactNumber\":\"18561678398\"}', 'json', '2016-11-21 17:03:26', '0000-00-00 00:00:00'),
(285, 0, 1, 2, 1, 112226, 'WEIXIN', 0, '补资料,机主：', '{\"phoneNumber\":\"\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":1123,\"idCardBackUrl\":1124,\"idCardInHandUrl\":1125,\"contactNumber\":\"\"}', 'json', '2016-11-22 09:22:28', '0000-00-00 00:00:00'),
(286, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '补资料,机主：', '{\"phoneNumber\":\"\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":1130,\"idCardBackUrl\":1131,\"idCardInHandUrl\":1129,\"contactNumber\":\"\"}', 'json', '2016-11-22 09:44:41', '0000-00-00 00:00:00'),
(287, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13553069835补资料,机主：薛增武', '{\"phoneNumber\":\"13553069835\",\"phoneUser\":\"\\u859b\\u589e\\u6b66\",\"idNumber\":\"370211197111191512\",\"idCardFrontUrl\":1133,\"idCardBackUrl\":1134,\"idCardInHandUrl\":1136,\"contactNumber\":\"13553069835\"}', 'json', '2016-11-22 17:09:19', '0000-00-00 00:00:00'),
(288, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364256316补资料,机主：李立国', '{\"phoneNumber\":\"18364256316\",\"phoneUser\":\"\\u674e\\u7acb\\u56fd\",\"idNumber\":\"372827197110192818\",\"idCardFrontUrl\":1140,\"idCardBackUrl\":1141,\"idCardInHandUrl\":1142,\"contactNumber\":\"18563981766\"}', 'json', '2016-11-22 17:23:35', '0000-00-00 00:00:00'),
(289, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '13165068171补资料,机主：马文全', '{\"phoneNumber\":\"13165068171\",\"phoneUser\":\"\\u9a6c\\u6587\\u5168\",\"idNumber\":\"132628196905202414\",\"idCardFrontUrl\":1144,\"idCardBackUrl\":1145,\"idCardInHandUrl\":1146,\"contactNumber\":\"18765270555\"}', 'json', '2016-11-23 11:48:54', '0000-00-00 00:00:00'),
(290, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13806449712补资料,机主：龚楚俊', '{\"phoneNumber\":\"13806449712\",\"phoneUser\":\"\\u9f9a\\u695a\\u4fca\",\"idNumber\":\"421126197209074714\",\"idCardFrontUrl\":1147,\"idCardBackUrl\":1148,\"idCardInHandUrl\":1149,\"contactNumber\":\"13806449712\"}', 'json', '2016-11-23 13:31:05', '0000-00-00 00:00:00'),
(291, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18366236206补资料,机主：高冬利', '{\"phoneNumber\":\"18366236206\",\"phoneUser\":\"\\u9ad8\\u51ac\\u5229\",\"idNumber\":\"230306197210135130\",\"idCardFrontUrl\":1150,\"idCardBackUrl\":1151,\"idCardInHandUrl\":1152,\"contactNumber\":\"18353201632\"}', 'json', '2016-11-24 10:34:00', '0000-00-00 00:00:00');
INSERT INTO `ticket` (`id`, `account_id`, `status_id`, `dept_id`, `topic_id`, `ip_address`, `source`, `is_answered`, `title`, `body`, `format`, `created`, `updated`) VALUES
(292, 0, 2, 2, 4, 117136, 'WEIXIN', 0, '[已付款]13165068538补资料,机主：田道玉', '{\"phoneNumber\":\"13165068538\",\"phoneUser\":\"\\u7530\\u9053\\u7389\",\"idNumber\":\"372323197009103013\",\"idCardFrontUrl\":1154,\"idCardBackUrl\":1155,\"idCardInHandUrl\":1156,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74006232001201611240696005365,\\u652f\\u4ed8\\u65f6\\u95f4: 20161124175545, OPENID:oy_PKweArQjhSCETLnAWzqasli88\"}', 'json', '2016-11-24 17:54:59', '0000-00-00 00:00:00'),
(293, 0, 2, 2, 4, 223104, 'WEIXIN', 0, '[已付款]13165059182补资料,机主：李清家', '{\"phoneNumber\":\"13165059182\",\"phoneUser\":\"\\u674e\\u6e05\\u5bb6\",\"idNumber\":\"410523196909103016\",\"idCardFrontUrl\":1160,\"idCardBackUrl\":1159,\"idCardInHandUrl\":1158,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74006232001201611240699158527,\\u652f\\u4ed8\\u65f6\\u95f4: 20161124181658, OPENID:oy_PKweArQjhSCETLnAWzqasli88\"}', 'json', '2016-11-24 18:16:15', '0000-00-00 00:00:00'),
(294, 0, 1, 2, 4, 223104, 'WEIXIN', 0, '[已付款]13165060131补资料,机主：刘喜林', '{\"phoneNumber\":\"13165060131\",\"phoneUser\":\"\\u5218\\u559c\\u6797\",\"idNumber\":\"210724196708115213\",\"idCardFrontUrl\":1161,\"idCardBackUrl\":1162,\"idCardInHandUrl\":1163,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74006232001201611240705151085,\\u652f\\u4ed8\\u65f6\\u95f4: 20161124185106, OPENID:oy_PKweArQjhSCETLnAWzqasli88\"}', 'json', '2016-11-24 18:50:22', '0000-00-00 00:00:00'),
(295, 0, 2, 2, 4, 3977, 'WEIXIN', 0, '[已付款]13165075509补资料,机主：张志远', '{\"phoneNumber\":\"13165075509\",\"phoneUser\":\"\\u5f20\\u5fd7\\u8fdc\",\"idNumber\":\"152321199412052178\",\"idCardFrontUrl\":1169,\"idCardBackUrl\":1170,\"idCardInHandUrl\":1171,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":100,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d50\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74005422001201611250785830364,\\u652f\\u4ed8\\u65f6\\u95f4: 20161125155437, OPENID:oy_PKwZJIWwj_m-ZA-Kcf3TE03Y8\"}', 'json', '2016-11-25 15:53:40', '0000-00-00 00:00:00'),
(296, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '13864849932补资料,机主：张留龙', '{\"phoneNumber\":\"13864849932\",\"phoneUser\":\"\\u5f20\\u7559\\u9f99\",\"idNumber\":\"412724199609208417\",\"idCardFrontUrl\":1175,\"idCardBackUrl\":1176,\"idCardInHandUrl\":1177,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-25 20:16:33', '0000-00-00 00:00:00'),
(297, 0, 1, 2, 1, 49223, 'WEIXIN', 0, '15726279726补资料,机主：李玉雪', '{\"phoneNumber\":\"15726279726\",\"phoneUser\":\"\\u674e\\u7389\\u96ea\",\"idNumber\":\"370687199611290021\",\"idCardFrontUrl\":1178,\"idCardBackUrl\":1179,\"idCardInHandUrl\":1180,\"contactNumber\":\"\"}', 'json', '2016-11-26 11:53:44', '0000-00-00 00:00:00'),
(298, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '13864259770补资料,机主：张杰', '{\"phoneNumber\":\"13864259770\",\"phoneUser\":\"\\u5f20\\u6770\",\"idNumber\":\"220822198511013428\",\"idCardFrontUrl\":1181,\"idCardBackUrl\":1182,\"idCardInHandUrl\":1183,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-26 13:49:25', '0000-00-00 00:00:00'),
(299, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18364257189补资料,机主：徐建中', '{\"phoneNumber\":\"18364257189\",\"phoneUser\":\"\\u5f90\\u5efa\\u4e2d\",\"idNumber\":\"370728196401115219\",\"idCardFrontUrl\":1188,\"idCardBackUrl\":1189,\"idCardInHandUrl\":1190,\"contactNumber\":\"15666220577\"}', 'json', '2016-11-26 17:14:08', '0000-00-00 00:00:00'),
(300, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18364257286补资料,机主：杨波', '{\"phoneNumber\":\"18364257286\",\"phoneUser\":\"\\u6768\\u6ce2\",\"idNumber\":\"370983198608025311\",\"idCardFrontUrl\":1191,\"idCardBackUrl\":1192,\"idCardInHandUrl\":1193,\"contactNumber\":\"15666220577\"}', 'json', '2016-11-26 20:45:24', '0000-00-00 00:00:00'),
(301, 0, 1, 2, 1, 18099, 'WEIXIN', 0, '13864850912补资料,机主：聂永男', '{\"phoneNumber\":\"13864850912\",\"phoneUser\":\"\\u8042\\u6c38\\u7537\",\"idNumber\":\"152326199205213575\",\"idCardFrontUrl\":1194,\"idCardBackUrl\":1195,\"idCardInHandUrl\":1196,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-27 12:10:39', '0000-00-00 00:00:00'),
(302, 0, 2, 2, 4, 223104, 'WEIXIN', 0, '[已付款]15621043789补资料,机主：姬芬', '{\"phoneNumber\":\"15621043789\",\"phoneUser\":\"\\u59ec\\u82ac\",\"idNumber\":\"370403198507217227\",\"idCardFrontUrl\":1200,\"idCardBackUrl\":1201,\"idCardInHandUrl\":1202,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201611270980280707,\\u652f\\u4ed8\\u65f6\\u95f4: 20161127143435, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2016-11-27 14:33:48', '0000-00-00 00:00:00'),
(303, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15615429505补资料,机主：孙友军', '{\"phoneNumber\":\"15615429505\",\"phoneUser\":\"\\u5b59\\u53cb\\u519b\",\"idNumber\":\"370612198307275534\",\"idCardFrontUrl\":1203,\"idCardBackUrl\":1204,\"idCardInHandUrl\":1205,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74008532001201611270999585865,\\u652f\\u4ed8\\u65f6\\u95f4: 20161127173509, OPENID:oy_PKwUWJv0BDxkMcO59auSduxKs\"}', 'json', '2016-11-27 17:34:24', '0000-00-00 00:00:00'),
(304, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '13864850912补资料,机主：聂为人男', '{\"phoneNumber\":\"13864850912\",\"phoneUser\":\"\\u8042\\u4e3a\\u4eba\\u7537\",\"idNumber\":\"152326199205213575\",\"idCardFrontUrl\":1207,\"idCardBackUrl\":1208,\"idCardInHandUrl\":1209,\"contactNumber\":\"18013161571\"}', 'json', '2016-11-27 18:49:17', '0000-00-00 00:00:00'),
(305, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]13173208580补资料,机主：张曙', '{\"phoneNumber\":\"13173208580\",\"phoneUser\":\"\\u5f20\\u66d9\",\"idNumber\":\"620422198712252516\",\"idCardFrontUrl\":1212,\"idCardBackUrl\":1213,\"idCardInHandUrl\":1214,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74009552001201611271011841468,\\u652f\\u4ed8\\u65f6\\u95f4: 20161127192852, OPENID:oy_PKwdjb5BV5YithE2MZLJpiKwU\"}', 'json', '2016-11-27 19:27:47', '0000-00-00 00:00:00'),
(306, 0, 2, 2, 4, 223104, 'WEIXIN', 0, '[已付款]13127002586补资料,机主：王丽', '{\"phoneNumber\":\"13127002586\",\"phoneUser\":\"\\u738b\\u4e3d\",\"idNumber\":\"513721198612100344\",\"idCardFrontUrl\":1215,\"idCardBackUrl\":1216,\"idCardInHandUrl\":1217,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201611271018056800,\\u652f\\u4ed8\\u65f6\\u95f4: 20161127203747, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2016-11-27 20:36:51', '0000-00-00 00:00:00'),
(307, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13789850853补资料,机主：徐凯', '{\"phoneNumber\":\"13789850853\",\"phoneUser\":\"\\u5f90\\u51ef\",\"idNumber\":\"370126199205101512\",\"idCardFrontUrl\":1218,\"idCardBackUrl\":1219,\"idCardInHandUrl\":1220,\"contactNumber\":\"13789850853\"}', 'json', '2016-11-28 20:40:04', '0000-00-00 00:00:00'),
(308, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18364256631补资料,机主：王洋', '{\"phoneNumber\":\"18364256631\",\"phoneUser\":\"\\u738b\\u6d0b\",\"idNumber\":\"370211199609260537\",\"idCardFrontUrl\":1221,\"idCardBackUrl\":1222,\"idCardInHandUrl\":1223,\"contactNumber\":\"15666220577\"}', 'json', '2016-11-29 18:49:44', '0000-00-00 00:00:00'),
(309, 0, 0, 2, 4, 219133, 'WEIXIN', 0, '[未付款]15692347381补资料,机主：郭祥龙', '{\"phoneNumber\":\"15692347381\",\"phoneUser\":\"\\u90ed\\u7965\\u9f99\",\"idNumber\":\"412321196908106934\",\"idCardFrontUrl\":1229,\"idCardBackUrl\":1230,\"idCardInHandUrl\":1231,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2016-11-29 21:02:56', '0000-00-00 00:00:00'),
(310, 0, 2, 2, 1, 111161, 'WEIXIN', 0, '13806448072补资料,机主：刘慕含', '{\"phoneNumber\":\"13806448072\",\"phoneUser\":\"\\u5218\\u6155\\u542b\",\"idNumber\":\"231085199306013129\",\"idCardFrontUrl\":1232,\"idCardBackUrl\":1233,\"idCardInHandUrl\":1234,\"contactNumber\":\"13806448072\"}', 'json', '2016-11-30 21:38:11', '0000-00-00 00:00:00'),
(311, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '18366275806补资料,机主：史世军', '{\"phoneNumber\":\"18366275806\",\"phoneUser\":\"\\u53f2\\u4e16\\u519b\",\"idNumber\":\"\",\"idCardFrontUrl\":1235,\"idCardBackUrl\":1236,\"idCardInHandUrl\":1237,\"contactNumber\":\"18363920431\"}', 'json', '2016-12-01 17:56:31', '0000-00-00 00:00:00'),
(312, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13864239158补资料,机主：赵振奎', '{\"phoneNumber\":\"13864239158\",\"phoneUser\":\"\\u8d75\\u632f\\u594e\",\"idNumber\":\"370211198301100516\",\"idCardFrontUrl\":1240,\"idCardBackUrl\":1241,\"idCardInHandUrl\":1242,\"contactNumber\":\"15689119007\"}', 'json', '2016-12-01 19:44:59', '0000-00-00 00:00:00'),
(313, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '15712704922补资料,机主：黄周敬', '{\"phoneNumber\":\"15712704922\",\"phoneUser\":\"\\u9ec4\\u5468\\u656c\",\"idNumber\":\"\",\"idCardFrontUrl\":1243,\"idCardBackUrl\":1244,\"idCardInHandUrl\":1245,\"contactNumber\":\"15712704922\"}', 'json', '2016-12-02 09:08:03', '0000-00-00 00:00:00'),
(314, 0, 1, 2, 1, 223104, 'WEIXIN', 0, '15712704635补资料,机主：李春磊', '{\"phoneNumber\":\"15712704635\",\"phoneUser\":\"\\u674e\\u6625\\u78ca\",\"idNumber\":\"320721199601252613\",\"idCardFrontUrl\":1246,\"idCardBackUrl\":1247,\"idCardInHandUrl\":1248,\"contactNumber\":\"15712704635\"}', 'json', '2016-12-02 15:32:46', '0000-00-00 00:00:00'),
(315, 0, 2, 2, 1, 22380, 'WEIXIN', 0, '13864239158补资料,机主：赵振奎', '{\"phoneNumber\":\"13864239158\",\"phoneUser\":\"\\u8d75\\u632f\\u594e\",\"idNumber\":\"370211198301100516\",\"idCardFrontUrl\":1249,\"idCardBackUrl\":1250,\"idCardInHandUrl\":1251,\"contactNumber\":\"15689119007\"}', 'json', '2016-12-02 15:48:18', '0000-00-00 00:00:00'),
(316, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13864247807补资料,机主：潘余', '{\"phoneNumber\":\"13864247807\",\"phoneUser\":\"\\u6f58\\u4f59\",\"idNumber\":\"220625199101091549\",\"idCardFrontUrl\":1252,\"idCardBackUrl\":1253,\"idCardInHandUrl\":1254,\"contactNumber\":\"13864247807\"}', 'json', '2016-12-02 17:42:00', '0000-00-00 00:00:00'),
(317, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18364257313补资料,机主：刘继良', '{\"phoneNumber\":\"18364257313\",\"phoneUser\":\"\\u5218\\u7ee7\\u826f\",\"idNumber\":\"232103198402014110\",\"idCardFrontUrl\":1258,\"idCardBackUrl\":1259,\"idCardInHandUrl\":1260,\"contactNumber\":\"15666220577\"}', 'json', '2016-12-02 19:47:02', '0000-00-00 00:00:00'),
(318, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18366252990补资料,机主：王世珍', '{\"phoneNumber\":\"18366252990\",\"phoneUser\":\"\\u738b\\u4e16\\u73cd\",\"idNumber\":\"371122199902233129\",\"idCardFrontUrl\":1261,\"idCardBackUrl\":1262,\"idCardInHandUrl\":1263,\"contactNumber\":\"\"}', 'json', '2016-12-03 08:07:54', '0000-00-00 00:00:00'),
(319, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364251679补资料,机主：薛清勇', '{\"phoneNumber\":\"18364251679\",\"phoneUser\":\"\\u859b\\u6e05\\u52c7\",\"idNumber\":\"370211197002110517\",\"idCardFrontUrl\":1264,\"idCardBackUrl\":1265,\"idCardInHandUrl\":1266,\"contactNumber\":\"18364251679\"}', 'json', '2016-12-03 08:27:33', '0000-00-00 00:00:00'),
(320, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364251736补资料,机主：迟世刚', '{\"phoneNumber\":\"18364251736\",\"phoneUser\":\"\\u8fdf\\u4e16\\u521a\",\"idNumber\":\"370727197210164518\",\"idCardFrontUrl\":1267,\"idCardBackUrl\":1268,\"idCardInHandUrl\":1269,\"contactNumber\":\"18364251736\"}', 'json', '2016-12-03 10:37:26', '0000-00-00 00:00:00'),
(321, 0, 1, 2, 1, 112226, 'WEIXIN', 0, '补资料,机主：', '{\"phoneNumber\":\"\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":1272,\"idCardBackUrl\":1273,\"idCardInHandUrl\":1274,\"contactNumber\":\"\"}', 'json', '2016-12-03 16:33:53', '0000-00-00 00:00:00'),
(322, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18364256826补资料,机主：李增泉', '{\"phoneNumber\":\"18364256826\",\"phoneUser\":\"\\u674e\\u589e\\u6cc9\",\"idNumber\":\"372325198512171213\",\"idCardFrontUrl\":1275,\"idCardBackUrl\":1276,\"idCardInHandUrl\":1277,\"contactNumber\":\"15666220577\"}', 'json', '2016-12-03 16:38:14', '0000-00-00 00:00:00'),
(323, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364251719补资料,机主：张娟', '{\"phoneNumber\":\"18364251719\",\"phoneUser\":\"\\u5f20\\u5a1f\",\"idNumber\":\"370281198001295322\",\"idCardFrontUrl\":1282,\"idCardBackUrl\":1283,\"idCardInHandUrl\":1284,\"contactNumber\":\"18364251719\"}', 'json', '2016-12-03 17:24:49', '0000-00-00 00:00:00'),
(324, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '13864259270补资料,机主：孙钦龙', '{\"phoneNumber\":\"13864259270\",\"phoneUser\":\"\\u5b59\\u94a6\\u9f99\",\"idNumber\":\"320721198811082451\",\"idCardFrontUrl\":1285,\"idCardBackUrl\":1286,\"idCardInHandUrl\":1287,\"contactNumber\":\"18013161571\"}', 'json', '2016-12-03 17:40:39', '0000-00-00 00:00:00'),
(325, 0, 2, 2, 4, 223104, 'WEIXIN', 0, '[已付款]13165060131补资料,机主：刘庆珍', '{\"phoneNumber\":\"13165060131\",\"phoneUser\":\"\\u5218\\u5e86\\u73cd\",\"idNumber\":\"372901197208143450\",\"idCardFrontUrl\":1288,\"idCardBackUrl\":1289,\"idCardInHandUrl\":1290,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74006232001201612031666282786,\\u652f\\u4ed8\\u65f6\\u95f4: 20161203184255, OPENID:oy_PKweArQjhSCETLnAWzqasli88\"}', 'json', '2016-12-03 18:42:08', '0000-00-00 00:00:00'),
(326, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18366215530补资料,机主：张聪', '{\"phoneNumber\":\"18366215530\",\"phoneUser\":\"\\u5f20\\u806a\",\"idNumber\":\"230703199004031033\",\"idCardFrontUrl\":1291,\"idCardBackUrl\":1295,\"idCardInHandUrl\":1292,\"contactNumber\":\"18562604578\"}', 'json', '2016-12-03 23:13:58', '0000-00-00 00:00:00'),
(327, 0, 2, 2, 4, 22380, 'WEIXIN', 0, '[已付款]15605427059补资料,机主：王水花', '{\"phoneNumber\":\"15605427059\",\"phoneUser\":\"\\u738b\\u6c34\\u82b1\",\"idNumber\":\"1422021960040552160\",\"idCardFrontUrl\":1296,\"idCardBackUrl\":1297,\"idCardInHandUrl\":1298,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74003782001201612041750377299,\\u652f\\u4ed8\\u65f6\\u95f4: 20161204134542, OPENID:oy_PKwQI5V2SebfuE7DLRvkg4oo4\"}', 'json', '2016-12-04 13:43:32', '0000-00-00 00:00:00'),
(328, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '18765429402补资料,机主：杨军胜', '{\"phoneNumber\":\"18765429402\",\"phoneUser\":\"\\u6768\\u519b\\u80dc\",\"idNumber\":\"130324197301305712\",\"idCardFrontUrl\":1299,\"idCardBackUrl\":1300,\"idCardInHandUrl\":1301,\"contactNumber\":\"18013161571\"}', 'json', '2016-12-04 15:53:47', '0000-00-00 00:00:00'),
(329, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '15726279726补资料,机主：姜陈伟', '{\"phoneNumber\":\"15726279726\",\"phoneUser\":\"\\u59dc\\u9648\\u4f1f\",\"idNumber\":\"37068719960706497X\",\"idCardFrontUrl\":1302,\"idCardBackUrl\":1303,\"idCardInHandUrl\":1304,\"contactNumber\":\"\"}', 'json', '2016-12-04 17:29:20', '0000-00-00 00:00:00'),
(330, 0, 2, 2, 1, 18099, 'WEIXIN', 0, '13864846960补资料,机主：包布仁得力根', '{\"phoneNumber\":\"13864846960\",\"phoneUser\":\"\\u5305\\u5e03\\u4ec1\\u5f97\\u529b\\u6839\",\"idNumber\":\"152326198411116616\",\"idCardFrontUrl\":1306,\"idCardBackUrl\":1307,\"idCardInHandUrl\":1308,\"contactNumber\":\"18013161571\"}', 'json', '2016-12-04 18:22:41', '0000-00-00 00:00:00'),
(331, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '18364249361补资料,机主：孙林玉', '{\"phoneNumber\":\"18364249361\",\"phoneUser\":\"\\u5b59\\u6797\\u7389\",\"idNumber\":\"370283198010133512\",\"idCardFrontUrl\":1305,\"idCardBackUrl\":1309,\"idCardInHandUrl\":1310,\"contactNumber\":\"15954868616\"}', 'json', '2016-12-04 18:26:38', '0000-00-00 00:00:00'),
(332, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18300221937补资料,机主：吕元鹏', '{\"phoneNumber\":\"18300221937\",\"phoneUser\":\"\\u5415\\u5143\\u9e4f\",\"idNumber\":\"371002199201243016\",\"idCardFrontUrl\":1311,\"idCardBackUrl\":1312,\"idCardInHandUrl\":1313,\"contactNumber\":\"18706481167\"}', 'json', '2016-12-04 19:15:22', '0000-00-00 00:00:00'),
(333, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13864277068补资料,机主：于萍', '{\"phoneNumber\":\"13864277068\",\"phoneUser\":\"\\u4e8e\\u840d\",\"idNumber\":\"210726197106270723\",\"idCardFrontUrl\":1314,\"idCardBackUrl\":1316,\"idCardInHandUrl\":1317,\"contactNumber\":\"13864277068\"}', 'json', '2016-12-05 09:07:25', '0000-00-00 00:00:00'),
(334, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18366215530补资料,机主：董小花', '{\"phoneNumber\":\"18366215530\",\"phoneUser\":\"\\u8463\\u5c0f\\u82b1\",\"idNumber\":\"533526199609220221\",\"idCardFrontUrl\":1318,\"idCardBackUrl\":1320,\"idCardInHandUrl\":1319,\"contactNumber\":\"15288372827\"}', 'json', '2016-12-05 13:41:54', '0000-00-00 00:00:00'),
(335, 0, 2, 2, 1, 111161, 'WEIXIN', 0, '18353269439补资料,机主：朱忠耀', '{\"phoneNumber\":\"18353269439\",\"phoneUser\":\"\\u6731\\u5fe0\\u8000\",\"idNumber\":\"370403199702152216\",\"idCardFrontUrl\":1321,\"idCardBackUrl\":1322,\"idCardInHandUrl\":1323,\"contactNumber\":\"18353269439\"}', 'json', '2016-12-05 15:21:54', '0000-00-00 00:00:00'),
(336, 0, 1, 2, 1, 117185, 'WEIXIN', 0, '13864277068补资料,机主：于萍', '{\"phoneNumber\":\"13864277068\",\"phoneUser\":\"\\u4e8e\\u840d\",\"idNumber\":\"210726197106270723\",\"idCardFrontUrl\":1327,\"idCardBackUrl\":1326,\"idCardInHandUrl\":1328,\"contactNumber\":\"15969890388\"}', 'json', '2016-12-05 16:26:40', '0000-00-00 00:00:00'),
(337, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13864862771补资料,机主：张向山', '{\"phoneNumber\":\"13864862771\",\"phoneUser\":\"\\u5f20\\u5411\\u5c71\",\"idNumber\":\"410728198605246538\",\"idCardFrontUrl\":1329,\"idCardBackUrl\":1330,\"idCardInHandUrl\":1331,\"contactNumber\":\"18238637499\"}', 'json', '2016-12-05 16:44:42', '0000-00-00 00:00:00'),
(338, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864277068补资料,机主：于萍', '{\"phoneNumber\":\"13864277068\",\"phoneUser\":\"\\u4e8e\\u840d\",\"idNumber\":\"210726197106270723\",\"idCardFrontUrl\":1338,\"idCardBackUrl\":1336,\"idCardInHandUrl\":1337,\"contactNumber\":\"15969890388\"}', 'json', '2016-12-05 18:12:36', '0000-00-00 00:00:00'),
(339, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13792853515补资料,机主：李晓', '{\"phoneNumber\":\"13792853515\",\"phoneUser\":\"\\u674e\\u6653\",\"idNumber\":\"370725198710133074\",\"idCardFrontUrl\":1339,\"idCardBackUrl\":1340,\"idCardInHandUrl\":1341,\"contactNumber\":\"13792853515\"}', 'json', '2016-12-05 18:15:06', '0000-00-00 00:00:00'),
(340, 0, 2, 2, 1, 180153, 'WEIXIN', 0, '13864221957补资料,机主：刘井辉', '{\"phoneNumber\":\"13864221957\",\"phoneUser\":\"\\u5218\\u4e95\\u8f89\",\"idNumber\":\"211319197303061619\",\"idCardFrontUrl\":1346,\"idCardBackUrl\":1345,\"idCardInHandUrl\":1347,\"contactNumber\":\"13210223638\"}', 'json', '2016-12-05 22:13:50', '0000-00-00 00:00:00'),
(341, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '17854255198补资料,机主：刘乐勤', '{\"phoneNumber\":\"17854255198\",\"phoneUser\":\"\\u5218\\u4e50\\u52e4\",\"idNumber\":\"222401196607022184\",\"idCardFrontUrl\":1348,\"idCardBackUrl\":1349,\"idCardInHandUrl\":1350,\"contactNumber\":\"18561523076\"}', 'json', '2016-12-06 10:19:22', '0000-00-00 00:00:00'),
(342, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '17864208368补资料,机主：宋宾', '{\"phoneNumber\":\"17864208368\",\"phoneUser\":\"\\u5b8b\\u5bbe\",\"idNumber\":\"370922197811126954\",\"idCardFrontUrl\":1352,\"idCardBackUrl\":1353,\"idCardInHandUrl\":1354,\"contactNumber\":\"13012478866\"}', 'json', '2016-12-06 19:19:59', '0000-00-00 00:00:00'),
(343, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '13864843196补资料,机主：刘么水', '{\"phoneNumber\":\"13864843196\",\"phoneUser\":\"\\u5218\\u4e48\\u6c34\",\"idNumber\":\"422202196910014737\",\"idCardFrontUrl\":1359,\"idCardBackUrl\":1360,\"idCardInHandUrl\":1361,\"contactNumber\":\"13864261785\"}', 'json', '2016-12-06 22:05:51', '0000-00-00 00:00:00'),
(344, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13864241715补资料,机主：蔡会滨', '{\"phoneNumber\":\"13864241715\",\"phoneUser\":\"\\u8521\\u4f1a\\u6ee8\",\"idNumber\":\"371323198309159119\",\"idCardFrontUrl\":1362,\"idCardBackUrl\":1363,\"idCardInHandUrl\":1364,\"contactNumber\":\"15863030201\"}', 'json', '2016-12-06 22:33:29', '0000-00-00 00:00:00'),
(345, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13789852251补资料,机主：蔡会滨', '{\"phoneNumber\":\"13789852251\",\"phoneUser\":\"\\u8521\\u4f1a\\u6ee8\",\"idNumber\":\"371323198309159119\",\"idCardFrontUrl\":1366,\"idCardBackUrl\":1367,\"idCardInHandUrl\":1368,\"contactNumber\":\"13789852251\"}', 'json', '2016-12-06 22:48:50', '0000-00-00 00:00:00'),
(346, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '13864846538补资料,机主：赵金波', '{\"phoneNumber\":\"13864846538\",\"phoneUser\":\"\\u8d75\\u91d1\\u6ce2\",\"idNumber\":\"130223198702165530\",\"idCardFrontUrl\":1369,\"idCardBackUrl\":1370,\"idCardInHandUrl\":1371,\"contactNumber\":\"18266653252\"}', 'json', '2016-12-07 08:28:37', '0000-00-00 00:00:00'),
(347, 0, 2, 2, 4, 117136, 'WEIXIN', 0, '[已付款]15615428776补资料,机主：杨周兴', '{\"phoneNumber\":\"15615428776\",\"phoneUser\":\"\\u6768\\u5468\\u5174\",\"idNumber\":\"620422198105213734\",\"idCardFrontUrl\":1372,\"idCardBackUrl\":1373,\"idCardInHandUrl\":1374,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201612072042944236,\\u652f\\u4ed8\\u65f6\\u95f4: 20161207113319, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2016-12-07 11:32:32', '0000-00-00 00:00:00'),
(348, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15615428815补资料,机主：张彦军', '{\"phoneNumber\":\"15615428815\",\"phoneUser\":\"\\u5f20\\u5f66\\u519b\",\"idNumber\":\"620422197102192718\",\"idCardFrontUrl\":1375,\"idCardBackUrl\":1376,\"idCardInHandUrl\":1377,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201612072042923326,\\u652f\\u4ed8\\u65f6\\u95f4: 20161207113556, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2016-12-07 11:35:11', '0000-00-00 00:00:00'),
(349, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364253329补资料,机主：赵海龙', '{\"phoneNumber\":\"18364253329\",\"phoneUser\":\"\\u8d75\\u6d77\\u9f99\",\"idNumber\":\"412725197103133435\",\"idCardFrontUrl\":1379,\"idCardBackUrl\":1380,\"idCardInHandUrl\":1381,\"contactNumber\":\"18363938492\"}', 'json', '2016-12-07 12:35:02', '0000-00-00 00:00:00'),
(350, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '13730970735补资料,机主：郭保增', '{\"phoneNumber\":\"13730970735\",\"phoneUser\":\"\\u90ed\\u4fdd\\u589e\",\"idNumber\":\"372523196711013399\",\"idCardFrontUrl\":1382,\"idCardBackUrl\":1383,\"idCardInHandUrl\":1384,\"contactNumber\":\"15954868616\"}', 'json', '2016-12-07 14:29:03', '0000-00-00 00:00:00'),
(351, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '13864846169补资料,机主：赵小冬', '{\"phoneNumber\":\"13864846169\",\"phoneUser\":\"\\u8d75\\u5c0f\\u51ac\",\"idNumber\":\"320826199102053879\",\"idCardFrontUrl\":1385,\"idCardBackUrl\":1386,\"idCardInHandUrl\":1387,\"contactNumber\":\"13864261785\"}', 'json', '2016-12-07 18:50:52', '0000-00-00 00:00:00'),
(352, 0, 2, 2, 1, 123234, 'WEIXIN', 0, '17864231880补资料,机主：祝春亮', '{\"phoneNumber\":\"17864231880\",\"phoneUser\":\"\\u795d\\u6625\\u4eae\",\"idNumber\":\"341227198605042315\",\"idCardFrontUrl\":1392,\"idCardBackUrl\":1393,\"idCardInHandUrl\":1394,\"contactNumber\":\"17864231880\"}', 'json', '2016-12-08 12:46:41', '0000-00-00 00:00:00'),
(353, 0, 2, 2, 1, 22380, 'WEIXIN', 0, '13553068300补资料,机主：刘俊飞', '{\"phoneNumber\":\"13553068300\",\"phoneUser\":\"\\u5218\\u4fca\\u98de\",\"idNumber\":\"410325199412110013\",\"idCardFrontUrl\":1395,\"idCardBackUrl\":1396,\"idCardInHandUrl\":1397,\"contactNumber\":\"18706481167\"}', 'json', '2016-12-08 13:52:39', '0000-00-00 00:00:00'),
(354, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]13165078670补资料,机主：刘英龙', '{\"phoneNumber\":\"13165078670\",\"phoneUser\":\"\\u5218\\u82f1\\u9f99\",\"idNumber\":\"150426199412151171\",\"idCardFrontUrl\":1398,\"idCardBackUrl\":1399,\"idCardInHandUrl\":1400,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201612082194517233,\\u652f\\u4ed8\\u65f6\\u95f4: 20161208202619, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2016-12-08 20:25:13', '0000-00-00 00:00:00'),
(355, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '18363936112补资料,机主：孙旭东', '{\"phoneNumber\":\"18363936112\",\"phoneUser\":\"\\u5b59\\u65ed\\u4e1c\",\"idNumber\":\"370321199610260612\",\"idCardFrontUrl\":1401,\"idCardBackUrl\":1404,\"idCardInHandUrl\":1405,\"contactNumber\":\"18363938492\"}', 'json', '2016-12-09 16:21:09', '0000-00-00 00:00:00'),
(356, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '17865421309补资料,机主：杜以波', '{\"phoneNumber\":\"17865421309\",\"phoneUser\":\"\\u675c\\u4ee5\\u6ce2\",\"idNumber\":\"371321197901026932\",\"idCardFrontUrl\":1406,\"idCardBackUrl\":1407,\"idCardInHandUrl\":1408,\"contactNumber\":\"13589363893\"}', 'json', '2016-12-09 19:13:45', '0000-00-00 00:00:00'),
(357, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '13864285687补资料,机主：刘伟华', '{\"phoneNumber\":\"13864285687\",\"phoneUser\":\"\\u5218\\u4f1f\\u534e\",\"idNumber\":\"370811196912113053\",\"idCardFrontUrl\":1409,\"idCardBackUrl\":1410,\"idCardInHandUrl\":1411,\"contactNumber\":\"13864285687\"}', 'json', '2016-12-10 12:15:31', '0000-00-00 00:00:00'),
(358, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364252550补资料,机主：马玉龙', '{\"phoneNumber\":\"18364252550\",\"phoneUser\":\"\\u9a6c\\u7389\\u9f99\",\"idNumber\":\"231025198405293719\",\"idCardFrontUrl\":1414,\"idCardBackUrl\":1415,\"idCardInHandUrl\":1416,\"contactNumber\":\"18363938492\"}', 'json', '2016-12-10 13:17:42', '0000-00-00 00:00:00'),
(359, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13864247763补资料,机主：梁家栋', '{\"phoneNumber\":\"13864247763\",\"phoneUser\":\"\\u6881\\u5bb6\\u680b\",\"idNumber\":\"320303198208280010\",\"idCardFrontUrl\":1417,\"idCardBackUrl\":1418,\"idCardInHandUrl\":1419,\"contactNumber\":\"15020051580\"}', 'json', '2016-12-10 19:31:44', '0000-00-00 00:00:00'),
(360, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18300221013补资料,机主：赵红梅', '{\"phoneNumber\":\"18300221013\",\"phoneUser\":\"\\u8d75\\u7ea2\\u6885\",\"idNumber\":\"370406198612060128\",\"idCardFrontUrl\":1420,\"idCardBackUrl\":1421,\"idCardInHandUrl\":1422,\"contactNumber\":\"18706481167\"}', 'json', '2016-12-11 10:02:46', '0000-00-00 00:00:00'),
(361, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864811613补资料,机主：唐亚东', '{\"phoneNumber\":\"13864811613\",\"phoneUser\":\"\\u5510\\u4e9a\\u4e1c\",\"idNumber\":\"371327198605064611\",\"idCardFrontUrl\":1423,\"idCardBackUrl\":1424,\"idCardInHandUrl\":1425,\"contactNumber\":\"18706481167\"}', 'json', '2016-12-11 13:49:31', '0000-00-00 00:00:00'),
(362, 0, 2, 2, 1, 180153, 'WEIXIN', 0, '13864273579补资料,机主：龚正', '{\"phoneNumber\":\"13864273579\",\"phoneUser\":\"\\u9f9a\\u6b63\",\"idNumber\":\"372925199701187713\",\"idCardFrontUrl\":1426,\"idCardBackUrl\":1428,\"idCardInHandUrl\":1429,\"contactNumber\":\"13210223638\"}', 'json', '2016-12-11 18:05:13', '0000-00-00 00:00:00'),
(363, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364253256补资料,机主：王存付', '{\"phoneNumber\":\"18364253256\",\"phoneUser\":\"\\u738b\\u5b58\\u4ed8\",\"idNumber\":\"372924198407143612\",\"idCardFrontUrl\":1427,\"idCardBackUrl\":1430,\"idCardInHandUrl\":1431,\"contactNumber\":\"18363938492\"}', 'json', '2016-12-11 18:07:00', '0000-00-00 00:00:00'),
(364, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15615428803补资料,机主：王文东', '{\"phoneNumber\":\"15615428803\",\"phoneUser\":\"\\u738b\\u6587\\u4e1c\",\"idNumber\":\"140426199307185618\",\"idCardFrontUrl\":1432,\"idCardBackUrl\":1433,\"idCardInHandUrl\":1434,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74006322001201612112494014741,\\u652f\\u4ed8\\u65f6\\u95f4: 20161211201332, OPENID:oy_PKwVAJzglJJIke39pze8Oys9g\"}', 'json', '2016-12-11 20:12:44', '0000-00-00 00:00:00'),
(365, 0, 2, 2, 1, 123234, 'WEIXIN', 0, '17864210515补资料,机主：赵海祥', '{\"phoneNumber\":\"17864210515\",\"phoneUser\":\"\\u8d75\\u6d77\\u7965\",\"idNumber\":\"372823196912021578\",\"idCardFrontUrl\":1435,\"idCardBackUrl\":1436,\"idCardInHandUrl\":1437,\"contactNumber\":\"15264259929\"}', 'json', '2016-12-12 09:51:45', '0000-00-00 00:00:00'),
(366, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]13165026110补资料,机主：那天赐', '{\"phoneNumber\":\"13165026110\",\"phoneUser\":\"\\u90a3\\u5929\\u8d50\",\"idNumber\":\"239005198903172815\",\"idCardFrontUrl\":1441,\"idCardBackUrl\":1442,\"idCardInHandUrl\":1443,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201612122572217291,\\u652f\\u4ed8\\u65f6\\u95f4: 20161212161153, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2016-12-12 16:11:08', '0000-00-00 00:00:00'),
(367, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15589848836补资料,机主：常向东', '{\"phoneNumber\":\"15589848836\",\"phoneUser\":\"\\u5e38\\u5411\\u4e1c\",\"idNumber\":\"412322197107256618\",\"idCardFrontUrl\":1444,\"idCardBackUrl\":1445,\"idCardInHandUrl\":1446,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74001342001201612122597291992,\\u652f\\u4ed8\\u65f6\\u95f4: 20161212195258, OPENID:oy_PKweCRuQBAtLbP0dspoU8sSdU\"}', 'json', '2016-12-12 19:52:08', '0000-00-00 00:00:00'),
(368, 0, 1, 2, 1, 27223, 'WEIXIN', 0, '13165051997补资料,机主：卢政奎', '{\"phoneNumber\":\"13165051997\",\"phoneUser\":\"\\u5362\\u653f\\u594e\",\"idNumber\":\"230321198712023217\",\"idCardFrontUrl\":1447,\"idCardBackUrl\":1448,\"idCardInHandUrl\":1449,\"contactNumber\":\"13796411889\"}', 'json', '2016-12-13 13:14:02', '0000-00-00 00:00:00'),
(369, 0, 0, 2, 4, 27223, 'WEIXIN', 0, '[未付款]13165051997补资料,机主：卢政奎', '{\"phoneNumber\":\"13165051997\",\"phoneUser\":\"\\u5362\\u653f\\u594e\",\"idNumber\":\"230321198712023217\",\"idCardFrontUrl\":1450,\"idCardBackUrl\":1451,\"idCardInHandUrl\":1452,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2016-12-13 13:19:51', '0000-00-00 00:00:00'),
(370, 0, 2, 2, 4, 101226, 'WEIXIN', 0, '[已付款]13165051997补资料,机主：卢政奎', '{\"phoneNumber\":\"13165051997\",\"phoneUser\":\"\\u5362\\u653f\\u594e\",\"idNumber\":\"230321198712023217\",\"idCardFrontUrl\":1453,\"idCardBackUrl\":1455,\"idCardInHandUrl\":1456,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74005422001201612132662350998,\\u652f\\u4ed8\\u65f6\\u95f4: 20161213133837, OPENID:oy_PKwUKwtpOSnHzUvc4Win2CBWQ\"}', 'json', '2016-12-13 13:37:40', '0000-00-00 00:00:00'),
(371, 0, 2, 2, 1, 180153, 'WEIXIN', 0, '13864276793补资料,机主：催心学', '{\"phoneNumber\":\"13864276793\",\"phoneUser\":\"\\u50ac\\u5fc3\\u5b66\",\"idNumber\":\"372929199004015217\",\"idCardFrontUrl\":1457,\"idCardBackUrl\":1458,\"idCardInHandUrl\":1459,\"contactNumber\":\"13210223638\"}', 'json', '2016-12-13 15:15:13', '0000-00-00 00:00:00'),
(372, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18300221931补资料,机主：张秀菊', '{\"phoneNumber\":\"18300221931\",\"phoneUser\":\"\\u5f20\\u79c0\\u83ca\",\"idNumber\":\"37292619880811484X\",\"idCardFrontUrl\":1460,\"idCardBackUrl\":1461,\"idCardInHandUrl\":1462,\"contactNumber\":\"18563981766\"}', 'json', '2016-12-13 17:48:54', '0000-00-00 00:00:00'),
(373, 0, 1, 2, 1, 49223, 'WEIXIN', 0, '13792852290补资料,机主：', '{\"phoneNumber\":\"13792852290\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":1463,\"idCardBackUrl\":1464,\"idCardInHandUrl\":1465,\"contactNumber\":\"\"}', 'json', '2016-12-14 11:41:43', '0000-00-00 00:00:00'),
(374, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '补资料,机主：', '{\"phoneNumber\":\"\",\"phoneUser\":\"\",\"idNumber\":\"\",\"idCardFrontUrl\":1466,\"idCardBackUrl\":1467,\"idCardInHandUrl\":1468,\"contactNumber\":\"\"}', 'json', '2016-12-14 11:46:19', '0000-00-00 00:00:00'),
(375, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864277968补资料,机主：王庆平', '{\"phoneNumber\":\"13864277968\",\"phoneUser\":\"\\u738b\\u5e86\\u5e73\",\"idNumber\":\"371324197602050413\",\"idCardFrontUrl\":1469,\"idCardBackUrl\":1470,\"idCardInHandUrl\":1471,\"contactNumber\":\"13864277968\"}', 'json', '2016-12-14 13:10:51', '0000-00-00 00:00:00'),
(376, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13864280062补资料,机主：郑美娟', '{\"phoneNumber\":\"13864280062\",\"phoneUser\":\"\\u90d1\\u7f8e\\u5a1f\",\"idNumber\":\"370211195908100527\",\"idCardFrontUrl\":1472,\"idCardBackUrl\":1473,\"idCardInHandUrl\":1474,\"contactNumber\":\"13864280062\"}', 'json', '2016-12-14 15:18:00', '0000-00-00 00:00:00'),
(377, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864280062补资料,机主：郑美娟', '{\"phoneNumber\":\"13864280062\",\"phoneUser\":\"\\u90d1\\u7f8e\\u5a1f\",\"idNumber\":\"370211195908100527\",\"idCardFrontUrl\":1472,\"idCardBackUrl\":1473,\"idCardInHandUrl\":1474,\"contactNumber\":\"13864280062\"}', 'json', '2016-12-14 15:18:01', '0000-00-00 00:00:00'),
(378, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '17864203039补资料,机主：夏治课', '{\"phoneNumber\":\"17864203039\",\"phoneUser\":\"\\u590f\\u6cbb\\u8bfe\",\"idNumber\":\"370722196712067017\",\"idCardFrontUrl\":1475,\"idCardBackUrl\":1476,\"idCardInHandUrl\":1477,\"contactNumber\":\"15263668655\"}', 'json', '2016-12-15 07:59:56', '0000-00-00 00:00:00'),
(379, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13553063696补资料,机主：臧传龙', '{\"phoneNumber\":\"13553063696\",\"phoneUser\":\"\\u81e7\\u4f20\\u9f99\",\"idNumber\":\"371121198212054237\",\"idCardFrontUrl\":1478,\"idCardBackUrl\":1479,\"idCardInHandUrl\":1480,\"contactNumber\":\"13370828997\"}', 'json', '2016-12-15 10:46:31', '0000-00-00 00:00:00'),
(380, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '18364228505补资料,机主：陈通', '{\"phoneNumber\":\"18364228505\",\"phoneUser\":\"\\u9648\\u901a\",\"idNumber\":\"370281198802183953\",\"idCardFrontUrl\":1482,\"idCardBackUrl\":1483,\"idCardInHandUrl\":1484,\"contactNumber\":\"15092268418\"}', 'json', '2016-12-15 14:01:28', '0000-00-00 00:00:00'),
(381, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '13864266053补资料,机主：冯玉如', '{\"phoneNumber\":\"13864266053\",\"phoneUser\":\"\\u51af\\u7389\\u5982\",\"idNumber\":\"371522198910074233\",\"idCardFrontUrl\":1486,\"idCardBackUrl\":1487,\"idCardInHandUrl\":1488,\"contactNumber\":\"13573276305\"}', 'json', '2016-12-17 08:35:37', '0000-00-00 00:00:00'),
(382, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '18364228330补资料,机主：阎红', '{\"phoneNumber\":\"18364228330\",\"phoneUser\":\"\\u960e\\u7ea2\",\"idNumber\":\"372422197212062025\",\"idCardFrontUrl\":1489,\"idCardBackUrl\":1490,\"idCardInHandUrl\":1491,\"contactNumber\":\"15863186773\"}', 'json', '2016-12-17 13:36:24', '0000-00-00 00:00:00'),
(383, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18364249605补资料,机主：吴国营', '{\"phoneNumber\":\"18364249605\",\"phoneUser\":\"\\u5434\\u56fd\\u8425\",\"idNumber\":\"37293019840201371X\",\"idCardFrontUrl\":1493,\"idCardBackUrl\":1494,\"idCardInHandUrl\":1492,\"contactNumber\":\"15954868616\"}', 'json', '2016-12-17 16:08:26', '0000-00-00 00:00:00'),
(384, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864263623补资料,机主：高近近', '{\"phoneNumber\":\"13864263623\",\"phoneUser\":\"\\u9ad8\\u8fd1\\u8fd1\",\"idNumber\":\"412723199110185520\",\"idCardFrontUrl\":1495,\"idCardBackUrl\":1496,\"idCardInHandUrl\":1497,\"contactNumber\":\"15092454640\"}', 'json', '2016-12-17 18:07:16', '0000-00-00 00:00:00'),
(385, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '13864275209补资料,机主：丁杉', '{\"phoneNumber\":\"13864275209\",\"phoneUser\":\"\\u4e01\\u6749\",\"idNumber\":\"612429198902200316\",\"idCardFrontUrl\":1498,\"idCardBackUrl\":1499,\"idCardInHandUrl\":1500,\"contactNumber\":\"13210223638\"}', 'json', '2016-12-17 19:23:58', '0000-00-00 00:00:00'),
(386, 0, 2, 2, 1, 180153, 'WEIXIN', 0, '13806443081补资料,机主：韩国义', '{\"phoneNumber\":\"13806443081\",\"phoneUser\":\"\\u97e9\\u56fd\\u4e49\",\"idNumber\":\"152127197012062439\",\"idCardFrontUrl\":1501,\"idCardBackUrl\":1502,\"idCardInHandUrl\":1503,\"contactNumber\":\"15376499837\"}', 'json', '2016-12-18 14:58:17', '0000-00-00 00:00:00'),
(387, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18253250465补资料,机主：鲍帅', '{\"phoneNumber\":\"18253250465\",\"phoneUser\":\"\\u9c8d\\u5e05\",\"idNumber\":\"210521198811270018\",\"idCardFrontUrl\":1504,\"idCardBackUrl\":1505,\"idCardInHandUrl\":1506,\"contactNumber\":\"15054240512\"}', 'json', '2016-12-19 07:33:58', '0000-00-00 00:00:00'),
(388, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13969625590补资料,机主：刘亦奥', '{\"phoneNumber\":\"13969625590\",\"phoneUser\":\"\\u5218\\u4ea6\\u5965\",\"idNumber\":\"370283200102011213\",\"idCardFrontUrl\":1510,\"idCardBackUrl\":1511,\"idCardInHandUrl\":1512,\"contactNumber\":\"18363920431\"}', 'json', '2016-12-20 15:13:49', '0000-00-00 00:00:00'),
(389, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '13864843836补资料,机主：柯有国', '{\"phoneNumber\":\"13864843836\",\"phoneUser\":\"\\u67ef\\u6709\\u56fd\",\"idNumber\":\"\",\"idCardFrontUrl\":1513,\"idCardBackUrl\":1514,\"idCardInHandUrl\":1515,\"contactNumber\":\"18013161571\"}', 'json', '2016-12-20 17:48:05', '0000-00-00 00:00:00'),
(390, 0, 2, 2, 1, 123151, 'WEIXIN', 0, '18363939818补资料,机主：赵松哲', '{\"phoneNumber\":\"18363939818\",\"phoneUser\":\"\\u8d75\\u677e\\u54f2\",\"idNumber\":\"371525199812162014\",\"idCardFrontUrl\":1516,\"idCardBackUrl\":1517,\"idCardInHandUrl\":1518,\"contactNumber\":\"18363939818\"}', 'json', '2016-12-20 21:46:01', '0000-00-00 00:00:00'),
(391, 0, 2, 2, 4, 119165, 'WEIXIN', 0, '[已付款]13165058736补资料,机主：刘宗光', '{\"phoneNumber\":\"13165058736\",\"phoneUser\":\"\\u5218\\u5b97\\u5149\",\"idNumber\":\"340321197002112590\",\"idCardFrontUrl\":1519,\"idCardBackUrl\":1520,\"idCardInHandUrl\":1521,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74006232001201612223578401800,\\u652f\\u4ed8\\u65f6\\u95f4: 20161222111953, OPENID:oy_PKweArQjhSCETLnAWzqasli88\"}', 'json', '2016-12-22 11:18:42', '0000-00-00 00:00:00'),
(392, 0, 2, 2, 1, 61156, 'WEIXIN', 0, '13687670682补资料,机主：周小利', '{\"phoneNumber\":\"13687670682\",\"phoneUser\":\"\\u5468\\u5c0f\\u5229\",\"idNumber\":\"371122198606053110\",\"idCardFrontUrl\":1522,\"idCardBackUrl\":1523,\"idCardInHandUrl\":1524,\"contactNumber\":\"15954868616\"}', 'json', '2016-12-22 17:41:10', '0000-00-00 00:00:00'),
(393, 0, 1, 2, 1, 3965, 'WEIXIN', 0, '13864843163补资料,机主：刘国雄', '{\"phoneNumber\":\"13864843163\",\"phoneUser\":\"\\u5218\\u56fd\\u96c4\",\"idNumber\":\"612101196804195611\",\"idCardFrontUrl\":1525,\"idCardBackUrl\":1527,\"idCardInHandUrl\":1528,\"contactNumber\":\"18013161571\"}', 'json', '2016-12-23 11:49:11', '0000-00-00 00:00:00'),
(394, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864240052补资料,机主：范代波', '{\"phoneNumber\":\"13864240052\",\"phoneUser\":\"\\u8303\\u4ee3\\u6ce2\",\"idNumber\":\"370283168203144533\",\"idCardFrontUrl\":1529,\"idCardBackUrl\":1530,\"idCardInHandUrl\":1531,\"contactNumber\":\"18254235622\"}', 'json', '2016-12-23 16:31:44', '0000-00-00 00:00:00'),
(395, 0, 2, 2, 1, 3965, 'WEIXIN', 0, '13864843163补资料,机主：刘国雄', '{\"phoneNumber\":\"13864843163\",\"phoneUser\":\"\\u5218\\u56fd\\u96c4\",\"idNumber\":\"\",\"idCardFrontUrl\":1532,\"idCardBackUrl\":1533,\"idCardInHandUrl\":1534,\"contactNumber\":\"18013161571\"}', 'json', '2016-12-23 17:35:19', '0000-00-00 00:00:00'),
(396, 0, 2, 2, 1, 113120, 'WEIXIN', 0, '18364256309补资料,机主：于逸飞', '{\"phoneNumber\":\"18364256309\",\"phoneUser\":\"\\u4e8e\\u9038\\u98de\",\"idNumber\":\"230202199508170017\",\"idCardFrontUrl\":1535,\"idCardBackUrl\":1536,\"idCardInHandUrl\":1537,\"contactNumber\":\"18354233035\"}', 'json', '2016-12-24 10:04:20', '0000-00-00 00:00:00'),
(397, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18300223921补资料,机主：杨银华', '{\"phoneNumber\":\"18300223921\",\"phoneUser\":\"\\u6768\\u94f6\\u534e\",\"idNumber\":\"532129197902211719\",\"idCardFrontUrl\":1538,\"idCardBackUrl\":1539,\"idCardInHandUrl\":1540,\"contactNumber\":\"15666220577\"}', 'json', '2016-12-24 19:30:56', '0000-00-00 00:00:00'),
(398, 0, 2, 2, 1, 123234, 'WEIXIN', 0, '17864207113补资料,机主：仲崇磊', '{\"phoneNumber\":\"17864207113\",\"phoneUser\":\"\\u4ef2\\u5d07\\u78ca\",\"idNumber\":\"370211198709142015\",\"idCardFrontUrl\":1541,\"idCardBackUrl\":1542,\"idCardInHandUrl\":1543,\"contactNumber\":\"13156040721\"}', 'json', '2016-12-25 11:28:01', '0000-00-00 00:00:00'),
(399, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864280739补资料,机主：程潇', '{\"phoneNumber\":\"13864280739\",\"phoneUser\":\"\\u7a0b\\u6f47\",\"idNumber\":\"370882198903121232\",\"idCardFrontUrl\":1544,\"idCardBackUrl\":1545,\"idCardInHandUrl\":1546,\"contactNumber\":\"13864280739\"}', 'json', '2016-12-25 11:51:55', '0000-00-00 00:00:00'),
(400, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18300223785补资料,机主：王占朋', '{\"phoneNumber\":\"18300223785\",\"phoneUser\":\"\\u738b\\u5360\\u670b\",\"idNumber\":\"371522199106266036\",\"idCardFrontUrl\":1547,\"idCardBackUrl\":1548,\"idCardInHandUrl\":1549,\"contactNumber\":\"15666220577\"}', 'json', '2016-12-25 18:33:33', '0000-00-00 00:00:00'),
(401, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13687678683补资料,机主：谢新合', '{\"phoneNumber\":\"13687678683\",\"phoneUser\":\"\\u8c22\\u65b0\\u5408\",\"idNumber\":\"372901197501095216\",\"idCardFrontUrl\":1550,\"idCardBackUrl\":1551,\"idCardInHandUrl\":1552,\"contactNumber\":\"18706481167\"}', 'json', '2016-12-25 18:54:42', '0000-00-00 00:00:00'),
(402, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '13864279557补资料,机主：王宗辉', '{\"phoneNumber\":\"13864279557\",\"phoneUser\":\"\\u738b\\u5b97\\u8f89\",\"idNumber\":\"370226197307073512\",\"idCardFrontUrl\":1553,\"idCardBackUrl\":1555,\"idCardInHandUrl\":1554,\"contactNumber\":\"13864279557\"}', 'json', '2016-12-26 09:36:56', '0000-00-00 00:00:00'),
(403, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '补资料,机主：李岩', '{\"phoneNumber\":\"\",\"phoneUser\":\"\\u674e\\u5ca9\",\"idNumber\":\"15222419940908755X\",\"idCardFrontUrl\":1556,\"idCardBackUrl\":1558,\"idCardInHandUrl\":1559,\"contactNumber\":\"13654855068\"}', 'json', '2016-12-26 16:09:37', '0000-00-00 00:00:00'),
(404, 0, 1, 2, 1, 112226, 'WEIXIN', 0, '15566885588补资料,机主：赵长时间', '{\"phoneNumber\":\"15566885588\",\"phoneUser\":\"\\u8d75\\u957f\\u65f6\\u95f4\",\"idNumber\":\"321242195805255467\",\"idCardFrontUrl\":1560,\"idCardBackUrl\":1561,\"idCardInHandUrl\":1562,\"contactNumber\":\"13645684587\"}', 'json', '2016-12-27 17:16:04', '0000-00-00 00:00:00'),
(405, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864249089补资料,机主：李凤梅', '{\"phoneNumber\":\"13864249089\",\"phoneUser\":\"\\u674e\\u51e4\\u6885\",\"idNumber\":\"371327198911200925\",\"idCardFrontUrl\":1563,\"idCardBackUrl\":1564,\"idCardInHandUrl\":1565,\"contactNumber\":\"13864249089\"}', 'json', '2016-12-28 15:15:20', '0000-00-00 00:00:00'),
(406, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18300221775补资料,机主：张骏', '{\"phoneNumber\":\"18300221775\",\"phoneUser\":\"\\u5f20\\u9a8f\",\"idNumber\":\"142402199004250014\",\"idCardFrontUrl\":1566,\"idCardBackUrl\":1567,\"idCardInHandUrl\":1568,\"contactNumber\":\"15666220577\"}', 'json', '2016-12-28 15:35:14', '0000-00-00 00:00:00'),
(407, 0, 2, 2, 4, 223104, 'WEIXIN', 0, '[已付款]13165066872补资料,机主：王进生', '{\"phoneNumber\":\"13165066872\",\"phoneUser\":\"\\u738b\\u8fdb\\u751f\",\"idNumber\":\"372923197011185313\",\"idCardFrontUrl\":1571,\"idCardBackUrl\":1572,\"idCardInHandUrl\":1573,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74006232001201612294405401156,\\u652f\\u4ed8\\u65f6\\u95f4: 20161229184932, OPENID:oy_PKweArQjhSCETLnAWzqasli88\"}', 'json', '2016-12-29 18:48:43', '0000-00-00 00:00:00'),
(408, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864853129补资料,机主：张国超', '{\"phoneNumber\":\"13864853129\",\"phoneUser\":\"\\u5f20\\u56fd\\u8d85\",\"idNumber\":\"372901199807187251\",\"idCardFrontUrl\":1574,\"idCardBackUrl\":1575,\"idCardInHandUrl\":1576,\"contactNumber\":\"13210037228\"}', 'json', '2016-12-29 19:53:37', '0000-00-00 00:00:00'),
(409, 0, 2, 2, 1, 180153, 'WEIXIN', 0, '13806440339补资料,机主：臧龙超', '{\"phoneNumber\":\"13806440339\",\"phoneUser\":\"\\u81e7\\u9f99\\u8d85\",\"idNumber\":\"320722198911074834\",\"idCardFrontUrl\":1579,\"idCardBackUrl\":1580,\"idCardInHandUrl\":1581,\"contactNumber\":\"\"}', 'json', '2016-12-30 11:14:25', '0000-00-00 00:00:00'),
(410, 0, 0, 2, 4, 101226, 'WEIXIN', 0, '[未付款]15621466172补资料,机主：王成宪', '{\"phoneNumber\":\"15621466172\",\"phoneUser\":\"\\u738b\\u6210\\u5baa\",\"idNumber\":\"370832197503077713\",\"idCardFrontUrl\":1582,\"idCardBackUrl\":1583,\"idCardInHandUrl\":1584,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2016-12-31 07:21:26', '0000-00-00 00:00:00'),
(411, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864852969补资料,机主：石宛丽', '{\"phoneNumber\":\"13864852969\",\"phoneUser\":\"\\u77f3\\u5b9b\\u4e3d\",\"idNumber\":\"412827198901052026\",\"idCardFrontUrl\":1585,\"idCardBackUrl\":1586,\"idCardInHandUrl\":1587,\"contactNumber\":\"13210037228\"}', 'json', '2016-12-31 17:35:03', '0000-00-00 00:00:00'),
(412, 0, 2, 2, 4, 119166, 'WEIXIN', 0, '[已付款]13173220778补资料,机主：候淑峰', '{\"phoneNumber\":\"13173220778\",\"phoneUser\":\"\\u5019\\u6dd1\\u5cf0\",\"idNumber\":\"370223196305126728\",\"idCardFrontUrl\":1588,\"idCardBackUrl\":1589,\"idCardInHandUrl\":1590,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000452001201701014756600541,\\u652f\\u4ed8\\u65f6\\u95f4: 20170101152505, OPENID:oy_PKwfDlK0k6rvz6cawW1tb6HpQ\"}', 'json', '2017-01-01 15:22:44', '0000-00-00 00:00:00'),
(413, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18364248193补资料,机主：吴凈川', '{\"phoneNumber\":\"18364248193\",\"phoneUser\":\"\\u5434\\u51c8\\u5ddd\",\"idNumber\":\"130429198412282615\",\"idCardFrontUrl\":1591,\"idCardBackUrl\":1592,\"idCardInHandUrl\":1593,\"contactNumber\":\"18354233035\"}', 'json', '2017-01-02 13:45:22', '0000-00-00 00:00:00'),
(414, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18300220561补资料,机主：王玉芳', '{\"phoneNumber\":\"18300220561\",\"phoneUser\":\"\\u738b\\u7389\\u82b3\",\"idNumber\":\"\",\"idCardFrontUrl\":1594,\"idCardBackUrl\":1595,\"idCardInHandUrl\":1596,\"contactNumber\":\"15666220577\"}', 'json', '2017-01-02 15:27:59', '0000-00-00 00:00:00'),
(415, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18300223905补资料,机主：颜婷婷', '{\"phoneNumber\":\"18300223905\",\"phoneUser\":\"\\u989c\\u5a77\\u5a77\",\"idNumber\":\"230207199701220866\",\"idCardFrontUrl\":1597,\"idCardBackUrl\":1598,\"idCardInHandUrl\":1599,\"contactNumber\":\"15666220577\"}', 'json', '2017-01-03 19:17:44', '0000-00-00 00:00:00'),
(416, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '13864845172补资料,机主：李明林', '{\"phoneNumber\":\"13864845172\",\"phoneUser\":\"\\u674e\\u660e\\u6797\",\"idNumber\":\"22052119760312251X\",\"idCardFrontUrl\":1600,\"idCardBackUrl\":1601,\"idCardInHandUrl\":1602,\"contactNumber\":\"18013161571\"}', 'json', '2017-01-06 07:42:57', '0000-00-00 00:00:00'),
(417, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864806569补资料,机主：谢文祥', '{\"phoneNumber\":\"13864806569\",\"phoneUser\":\"\\u8c22\\u6587\\u7965\",\"idNumber\":\"37082919881002495X\",\"idCardFrontUrl\":1604,\"idCardBackUrl\":1605,\"idCardInHandUrl\":1606,\"contactNumber\":\"13864806569\"}', 'json', '2017-01-06 13:05:47', '0000-00-00 00:00:00'),
(418, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '13864847318补资料,机主：闫金章', '{\"phoneNumber\":\"13864847318\",\"phoneUser\":\"\\u95eb\\u91d1\\u7ae0\",\"idNumber\":\"372402198004107531\",\"idCardFrontUrl\":1607,\"idCardBackUrl\":1608,\"idCardInHandUrl\":1609,\"contactNumber\":\"18013161571\"}', 'json', '2017-01-06 18:57:26', '0000-00-00 00:00:00'),
(419, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '13864269631补资料,机主：张庆客', '{\"phoneNumber\":\"13864269631\",\"phoneUser\":\"\\u5f20\\u5e86\\u5ba2\",\"idNumber\":\"370403198908102711\",\"idCardFrontUrl\":1610,\"idCardBackUrl\":1611,\"idCardInHandUrl\":1612,\"contactNumber\":\"18706481167\"}', 'json', '2017-01-07 13:42:31', '0000-00-00 00:00:00'),
(420, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '18363950812补资料,机主：牟凯芮', '{\"phoneNumber\":\"18363950812\",\"phoneUser\":\"\\u725f\\u51ef\\u82ae\",\"idNumber\":\"372328199803182143\",\"idCardFrontUrl\":1614,\"idCardBackUrl\":1615,\"idCardInHandUrl\":1616,\"contactNumber\":\"18363920431\"}', 'json', '2017-01-07 14:05:29', '0000-00-00 00:00:00'),
(421, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18363965568补资料,机主：李博', '{\"phoneNumber\":\"18363965568\",\"phoneUser\":\"\\u674e\\u535a\",\"idNumber\":\"370784199511175014\",\"idCardFrontUrl\":1617,\"idCardBackUrl\":1618,\"idCardInHandUrl\":1619,\"contactNumber\":\"13465881189\"}', 'json', '2017-01-08 08:47:29', '0000-00-00 00:00:00'),
(422, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864265205补资料,机主：代伟', '{\"phoneNumber\":\"13864265205\",\"phoneUser\":\"\\u4ee3\\u4f1f\",\"idNumber\":\"23012119860416162X\",\"idCardFrontUrl\":1620,\"idCardBackUrl\":1621,\"idCardInHandUrl\":1622,\"contactNumber\":\"15092454640\"}', 'json', '2017-01-08 12:40:28', '0000-00-00 00:00:00'),
(423, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13589302863补资料,机主：张晓鹏', '{\"phoneNumber\":\"13589302863\",\"phoneUser\":\"\\u5f20\\u6653\\u9e4f\",\"idNumber\":\"37132119991227341X\",\"idCardFrontUrl\":1623,\"idCardBackUrl\":1624,\"idCardInHandUrl\":1625,\"contactNumber\":\"13589302863\"}', 'json', '2017-01-08 20:48:24', '0000-00-00 00:00:00'),
(424, 0, 1, 2, 1, 117185, 'WEIXIN', 0, '13793221019补资料,机主：数里日海', '{\"phoneNumber\":\"13793221019\",\"phoneUser\":\"\\u6570\\u91cc\\u65e5\\u6d77\",\"idNumber\":\"51342819770503081X\",\"idCardFrontUrl\":1626,\"idCardBackUrl\":1627,\"idCardInHandUrl\":1628,\"contactNumber\":\"13012467088\"}', 'json', '2017-01-09 10:09:32', '0000-00-00 00:00:00'),
(425, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '13864851318补资料,机主：文静', '{\"phoneNumber\":\"13864851318\",\"phoneUser\":\"\\u6587\\u9759\",\"idNumber\":\"231182199803091423\",\"idCardFrontUrl\":1629,\"idCardBackUrl\":1630,\"idCardInHandUrl\":1632,\"contactNumber\":\"13210037228\"}', 'json', '2017-01-09 10:34:15', '0000-00-00 00:00:00'),
(426, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '17864227516补资料,机主：纪亚南', '{\"phoneNumber\":\"17864227516\",\"phoneUser\":\"\\u7eaa\\u4e9a\\u5357\",\"idNumber\":\"370782199410136435\",\"idCardFrontUrl\":1633,\"idCardBackUrl\":1634,\"idCardInHandUrl\":1635,\"contactNumber\":\"18724771189\"}', 'json', '2017-01-09 14:39:07', '0000-00-00 00:00:00');
INSERT INTO `ticket` (`id`, `account_id`, `status_id`, `dept_id`, `topic_id`, `ip_address`, `source`, `is_answered`, `title`, `body`, `format`, `created`, `updated`) VALUES
(427, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '13864822806补资料,机主：商艳伟', '{\"phoneNumber\":\"13864822806\",\"phoneUser\":\"\\u5546\\u8273\\u4f1f\",\"idNumber\":\"372926199004187319\",\"idCardFrontUrl\":1636,\"idCardBackUrl\":1637,\"idCardInHandUrl\":1638,\"contactNumber\":\"15666220577\"}', 'json', '2017-01-09 18:16:57', '0000-00-00 00:00:00'),
(428, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '18300223760补资料,机主：赵红梅', '{\"phoneNumber\":\"18300223760\",\"phoneUser\":\"\\u8d75\\u7ea2\\u6885\",\"idNumber\":\"370406198612060128\",\"idCardFrontUrl\":1639,\"idCardBackUrl\":1640,\"idCardInHandUrl\":1641,\"contactNumber\":\"15666220577\"}', 'json', '2017-01-09 21:03:09', '0000-00-00 00:00:00'),
(429, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '13687677765补资料,机主：黄佳俭', '{\"phoneNumber\":\"13687677765\",\"phoneUser\":\"\\u9ec4\\u4f73\\u4fed\",\"idNumber\":\"230231194810161516\",\"idCardFrontUrl\":1644,\"idCardBackUrl\":1645,\"idCardInHandUrl\":1646,\"contactNumber\":\"17056163798\"}', 'json', '2017-01-10 09:33:58', '0000-00-00 00:00:00'),
(430, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '13864813662补资料,机主：丁少贵', '{\"phoneNumber\":\"13864813662\",\"phoneUser\":\"\\u4e01\\u5c11\\u8d35\",\"idNumber\":\"370284197703076719\",\"idCardFrontUrl\":1647,\"idCardBackUrl\":1648,\"idCardInHandUrl\":1650,\"contactNumber\":\"15666220577\"}', 'json', '2017-01-10 21:21:21', '0000-00-00 00:00:00'),
(431, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13864285091补资料,机主：姚立发', '{\"phoneNumber\":\"13864285091\",\"phoneUser\":\"\\u59da\\u7acb\\u53d1\",\"idNumber\":\"\",\"idCardFrontUrl\":1652,\"idCardBackUrl\":1653,\"idCardInHandUrl\":1654,\"contactNumber\":\"13864285091\"}', 'json', '2017-01-11 10:58:02', '0000-00-00 00:00:00'),
(432, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '13864816117补资料,机主：魏健勋', '{\"phoneNumber\":\"13864816117\",\"phoneUser\":\"\\u9b4f\\u5065\\u52cb\",\"idNumber\":\"370811196911101819\",\"idCardFrontUrl\":1655,\"idCardBackUrl\":1656,\"idCardInHandUrl\":1657,\"contactNumber\":\"15666220577\"}', 'json', '2017-01-12 15:55:51', '0000-00-00 00:00:00'),
(433, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13864249108补资料,机主：仝西锋', '{\"phoneNumber\":\"13864249108\",\"phoneUser\":\"\\u4edd\\u897f\\u950b\",\"idNumber\":\"\",\"idCardFrontUrl\":1658,\"idCardBackUrl\":1659,\"idCardInHandUrl\":1660,\"contactNumber\":\"13210037228\"}', 'json', '2017-01-12 17:11:36', '0000-00-00 00:00:00'),
(434, 0, 2, 2, 1, 101226, 'WEIXIN', 0, '13789857570补资料,机主：马艳雯', '{\"phoneNumber\":\"13789857570\",\"phoneUser\":\"\\u9a6c\\u8273\\u96ef\",\"idNumber\":\"370211200005221022\",\"idCardFrontUrl\":1661,\"idCardBackUrl\":1662,\"idCardInHandUrl\":1663,\"contactNumber\":\"13210037228\"}', 'json', '2017-01-13 09:07:20', '0000-00-00 00:00:00'),
(435, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '13864851382补资料,机主：甄文婧', '{\"phoneNumber\":\"13864851382\",\"phoneUser\":\"\\u7504\\u6587\\u5a67\",\"idNumber\":\"410482200005109320\",\"idCardFrontUrl\":1664,\"idCardBackUrl\":1665,\"idCardInHandUrl\":1666,\"contactNumber\":\"13210037228\"}', 'json', '2017-01-14 08:18:38', '0000-00-00 00:00:00'),
(436, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '13864285206补资料,机主：朱强', '{\"phoneNumber\":\"13864285206\",\"phoneUser\":\"\\u6731\\u5f3a\",\"idNumber\":\"370211199702150519\",\"idCardFrontUrl\":1670,\"idCardBackUrl\":1668,\"idCardInHandUrl\":1669,\"contactNumber\":\"13864285206\"}', 'json', '2017-01-14 12:35:58', '0000-00-00 00:00:00'),
(437, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '13864853167补资料,机主：付鑫', '{\"phoneNumber\":\"13864853167\",\"phoneUser\":\"\\u4ed8\\u946b\",\"idNumber\":\"230303198706126612\",\"idCardFrontUrl\":1671,\"idCardBackUrl\":1672,\"idCardInHandUrl\":1673,\"contactNumber\":\"13210037228\"}', 'json', '2017-01-14 15:25:03', '0000-00-00 00:00:00'),
(438, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '13864853167补资料,机主：崔俊双', '{\"phoneNumber\":\"13864853167\",\"phoneUser\":\"\\u5d14\\u4fca\\u53cc\",\"idNumber\":\"\",\"idCardFrontUrl\":1674,\"idCardBackUrl\":1675,\"idCardInHandUrl\":1676,\"contactNumber\":\"13210037228\"}', 'json', '2017-01-15 08:33:48', '0000-00-00 00:00:00'),
(439, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13864241715补资料,机主：于振亮', '{\"phoneNumber\":\"13864241715\",\"phoneUser\":\"\\u4e8e\\u632f\\u4eae\",\"idNumber\":\"\",\"idCardFrontUrl\":1677,\"idCardBackUrl\":1678,\"idCardInHandUrl\":1679,\"contactNumber\":\"15863030201\"}', 'json', '2017-01-15 09:23:44', '0000-00-00 00:00:00'),
(440, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '13864241715补资料,机主：于振亮', '{\"phoneNumber\":\"13864241715\",\"phoneUser\":\"\\u4e8e\\u632f\\u4eae\",\"idNumber\":\"372423197303083119\",\"idCardFrontUrl\":1680,\"idCardBackUrl\":1681,\"idCardInHandUrl\":1683,\"contactNumber\":\"15863030201\"}', 'json', '2017-01-15 09:36:45', '0000-00-00 00:00:00'),
(441, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '13864241715补资料,机主：于振亮', '{\"phoneNumber\":\"13864241715\",\"phoneUser\":\"\\u4e8e\\u632f\\u4eae\",\"idNumber\":\"372423197303083119\",\"idCardFrontUrl\":1684,\"idCardBackUrl\":1685,\"idCardInHandUrl\":1686,\"contactNumber\":\"18706481167\"}', 'json', '2017-01-15 10:14:48', '0000-00-00 00:00:00'),
(442, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13864812810补资料,机主：刘利杰', '{\"phoneNumber\":\"13864812810\",\"phoneUser\":\"\\u5218\\u5229\\u6770\",\"idNumber\":\"\",\"idCardFrontUrl\":1687,\"idCardBackUrl\":1688,\"idCardInHandUrl\":1689,\"contactNumber\":\"15666220577\"}', 'json', '2017-01-15 11:14:58', '0000-00-00 00:00:00'),
(443, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '18366211758补资料,机主：冯明月', '{\"phoneNumber\":\"18366211758\",\"phoneUser\":\"\\u51af\\u660e\\u6708\",\"idNumber\":\"371524199610101612\",\"idCardFrontUrl\":1690,\"idCardBackUrl\":1691,\"idCardInHandUrl\":1692,\"contactNumber\":\"15653253960\"}', 'json', '2017-01-16 18:58:19', '0000-00-00 00:00:00'),
(444, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13792850976补资料,机主：张玉亭', '{\"phoneNumber\":\"13792850976\",\"phoneUser\":\"\\u5f20\\u7389\\u4ead\",\"idNumber\":\"\",\"idCardFrontUrl\":1693,\"idCardBackUrl\":1694,\"idCardInHandUrl\":1695,\"contactNumber\":\"15666220577\"}', 'json', '2017-01-16 21:00:56', '0000-00-00 00:00:00'),
(445, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18364250539补资料,机主：李国刚', '{\"phoneNumber\":\"18364250539\",\"phoneUser\":\"\\u674e\\u56fd\\u521a\",\"idNumber\":\"371421199905294218\",\"idCardFrontUrl\":1696,\"idCardBackUrl\":1697,\"idCardInHandUrl\":1698,\"contactNumber\":\"18561838569\"}', 'json', '2017-01-17 07:44:52', '0000-00-00 00:00:00'),
(446, 0, 2, 2, 1, 180153, 'WEIXIN', 0, '13864835910补资料,机主：位付肖', '{\"phoneNumber\":\"13864835910\",\"phoneUser\":\"\\u4f4d\\u4ed8\\u8096\",\"idNumber\":\"410923197307116043\",\"idCardFrontUrl\":1699,\"idCardBackUrl\":1700,\"idCardInHandUrl\":1701,\"contactNumber\":\"13210223638\"}', 'json', '2017-01-17 14:36:21', '0000-00-00 00:00:00'),
(447, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '13864832823补资料,机主：朱宜苓', '{\"phoneNumber\":\"13864832823\",\"phoneUser\":\"\\u6731\\u5b9c\\u82d3\",\"idNumber\":\"370481197708073260\",\"idCardFrontUrl\":1702,\"idCardBackUrl\":1703,\"idCardInHandUrl\":1704,\"contactNumber\":\"13210037228\"}', 'json', '2017-01-17 15:18:52', '0000-00-00 00:00:00'),
(448, 0, 2, 2, 1, 3989, 'WEIXIN', 0, '13864223372补资料,机主：李国强', '{\"phoneNumber\":\"13864223372\",\"phoneUser\":\"\\u674e\\u56fd\\u5f3a\",\"idNumber\":\"342224199106290118\",\"idCardFrontUrl\":1705,\"idCardBackUrl\":1706,\"idCardInHandUrl\":1707,\"contactNumber\":\"18706481167\"}', 'json', '2017-01-17 17:31:04', '0000-00-00 00:00:00'),
(449, 0, 1, 2, 1, 49223, 'WEIXIN', 0, '13589236283补资料,机主：李虹竺', '{\"phoneNumber\":\"13589236283\",\"phoneUser\":\"\\u674e\\u8679\\u7afa\",\"idNumber\":\"511111199312072721\",\"idCardFrontUrl\":1708,\"idCardBackUrl\":1709,\"idCardInHandUrl\":1710,\"contactNumber\":\"13589236283\"}', 'json', '2017-01-17 20:55:15', '0000-00-00 00:00:00'),
(450, 0, 2, 2, 1, 61156, 'WEIXIN', 0, '13864242873补资料,机主：刘荣富', '{\"phoneNumber\":\"13864242873\",\"phoneUser\":\"\\u5218\\u8363\\u5bcc\",\"idNumber\":\"413026196909094230\",\"idCardFrontUrl\":1711,\"idCardBackUrl\":1713,\"idCardInHandUrl\":1715,\"contactNumber\":\"15954868616\"}', 'json', '2017-01-18 17:21:25', '0000-00-00 00:00:00'),
(451, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13792853515补资料,机主：牛晓慧', '{\"phoneNumber\":\"13792853515\",\"phoneUser\":\"\\u725b\\u6653\\u6167\",\"idNumber\":\"410184198008196956\",\"idCardFrontUrl\":1716,\"idCardBackUrl\":1717,\"idCardInHandUrl\":1718,\"contactNumber\":\"15020051580\"}', 'json', '2017-01-20 20:25:55', '0000-00-00 00:00:00'),
(452, 0, 2, 2, 1, 3989, 'WEIXIN', 0, '13864226885补资料,机主：赵桂杰', '{\"phoneNumber\":\"13864226885\",\"phoneUser\":\"\\u8d75\\u6842\\u6770\",\"idNumber\":\"230503196909300424\",\"idCardFrontUrl\":1719,\"idCardBackUrl\":1720,\"idCardInHandUrl\":1721,\"contactNumber\":\"18706481167\"}', 'json', '2017-01-21 16:18:30', '0000-00-00 00:00:00'),
(453, 0, 1, 2, 1, 22380, 'WEIXIN', 0, '13864241985补资料,机主：于芳', '{\"phoneNumber\":\"13864241985\",\"phoneUser\":\"\\u4e8e\\u82b3\",\"idNumber\":\"370211197508260547\",\"idCardFrontUrl\":1722,\"idCardBackUrl\":1723,\"idCardInHandUrl\":1724,\"contactNumber\":\"15863030201\"}', 'json', '2017-01-21 21:00:21', '0000-00-00 00:00:00'),
(454, 0, 2, 2, 1, 3989, 'WEIXIN', 0, '13864241985补资料,机主：于芳', '{\"phoneNumber\":\"13864241985\",\"phoneUser\":\"\\u4e8e\\u82b3\",\"idNumber\":\"370211197508260547\",\"idCardFrontUrl\":1725,\"idCardBackUrl\":1726,\"idCardInHandUrl\":1727,\"contactNumber\":\"18706481167\"}', 'json', '2017-01-22 08:47:11', '0000-00-00 00:00:00'),
(455, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '18306487983补资料,机主：邵建青', '{\"phoneNumber\":\"18306487983\",\"phoneUser\":\"\\u90b5\\u5efa\\u9752\",\"idNumber\":\"372301197012231018\",\"idCardFrontUrl\":1731,\"idCardBackUrl\":1732,\"idCardInHandUrl\":1733,\"contactNumber\":\"18306487983\"}', 'json', '2017-01-22 11:57:49', '0000-00-00 00:00:00'),
(456, 0, 1, 2, 1, 113120, 'WEIXIN', 0, '18364229205补资料,机主：王化洋', '{\"phoneNumber\":\"18364229205\",\"phoneUser\":\"\\u738b\\u5316\\u6d0b\",\"idNumber\":\"372928199312025234\",\"idCardFrontUrl\":1734,\"idCardBackUrl\":1736,\"idCardInHandUrl\":1737,\"contactNumber\":\"15054240512\"}', 'json', '2017-01-22 13:43:18', '0000-00-00 00:00:00'),
(457, 0, 1, 2, 1, 113120, 'WEIXIN', 0, '18364228729补资料,机主：王化洋', '{\"phoneNumber\":\"18364228729\",\"phoneUser\":\"\\u738b\\u5316\\u6d0b\",\"idNumber\":\"372928199312025234\",\"idCardFrontUrl\":1738,\"idCardBackUrl\":1739,\"idCardInHandUrl\":1740,\"contactNumber\":\"15689133897\"}', 'json', '2017-01-22 13:46:06', '0000-00-00 00:00:00'),
(458, 0, 2, 2, 1, 113120, 'WEIXIN', 0, '18364228729补资料,机主：王化洋', '{\"phoneNumber\":\"18364228729\",\"phoneUser\":\"\\u738b\\u5316\\u6d0b\",\"idNumber\":\"372928199312025234\",\"idCardFrontUrl\":1741,\"idCardBackUrl\":1742,\"idCardInHandUrl\":1743,\"contactNumber\":\"15689133897\"}', 'json', '2017-01-22 13:51:41', '0000-00-00 00:00:00'),
(459, 0, 1, 2, 1, 27193, 'WEIXIN', 0, '13789859612补资料,机主：奈春明', '{\"phoneNumber\":\"13789859612\",\"phoneUser\":\"\\u5948\\u6625\\u660e\",\"idNumber\":\"530125198802102811\",\"idCardFrontUrl\":1744,\"idCardBackUrl\":1745,\"idCardInHandUrl\":1747,\"contactNumber\":\"15666220577\"}', 'json', '2017-01-22 20:22:54', '0000-00-00 00:00:00'),
(460, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '13864813787补资料,机主：孙守富', '{\"phoneNumber\":\"13864813787\",\"phoneUser\":\"\\u5b59\\u5b88\\u5bcc\",\"idNumber\":\"370919195805150010\",\"idCardFrontUrl\":1748,\"idCardBackUrl\":1749,\"idCardInHandUrl\":1750,\"contactNumber\":\"18706481167\"}', 'json', '2017-01-23 11:25:12', '0000-00-00 00:00:00'),
(461, 0, 2, 2, 4, 3965, 'WEIXIN', 0, '[已付款]13173218895补资料,机主：朱晓娟', '{\"phoneNumber\":\"13173218895\",\"phoneUser\":\"\\u6731\\u6653\\u5a1f\",\"idNumber\":\"371122198610052823\",\"idCardFrontUrl\":1751,\"idCardBackUrl\":1752,\"idCardInHandUrl\":1753,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000452001201701237304831353,\\u652f\\u4ed8\\u65f6\\u95f4: 20170123155043, OPENID:oy_PKwfDlK0k6rvz6cawW1tb6HpQ\"}', 'json', '2017-01-23 15:49:57', '0000-00-00 00:00:00'),
(462, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13864809376补资料,机主：张力刚', '{\"phoneNumber\":\"13864809376\",\"phoneUser\":\"\\u5f20\\u529b\\u521a\",\"idNumber\":\"370982199007026675\",\"idCardFrontUrl\":1754,\"idCardBackUrl\":1755,\"idCardInHandUrl\":1756,\"contactNumber\":\"15020051580\"}', 'json', '2017-01-24 17:56:41', '0000-00-00 00:00:00'),
(463, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '补资料,机主：v', '{\"phoneNumber\":\"\",\"phoneUser\":\"v\",\"idNumber\":\"\",\"idCardFrontUrl\":1757,\"idCardBackUrl\":1758,\"idCardInHandUrl\":1759,\"contactNumber\":\"18364228539\"}', 'json', '2017-01-25 12:39:33', '0000-00-00 00:00:00'),
(464, 0, 2, 2, 4, 49223, 'WEIXIN', 0, '[已付款]13165322290补资料,机主：张岩', '{\"phoneNumber\":\"13165322290\",\"phoneUser\":\"\\u5f20\\u5ca9\",\"idNumber\":\"220582199605072714\",\"idCardFrontUrl\":1760,\"idCardBackUrl\":1761,\"idCardInHandUrl\":1762,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000312001201702048651596561,\\u652f\\u4ed8\\u65f6\\u95f4: 20170204105315, OPENID:oy_PKwU2Z6u4cEtjeOcF0Y-Kx_LI\"}', 'json', '2017-02-04 10:52:10', '0000-00-00 00:00:00'),
(465, 0, 2, 2, 4, 113129, 'WEIXIN', 0, '[已付款]13165329985补资料,机主：陈淑华', '{\"phoneNumber\":\"13165329985\",\"phoneUser\":\"\\u9648\\u6dd1\\u534e\",\"idNumber\":\"232131197405070629\",\"idCardFrontUrl\":1763,\"idCardBackUrl\":1764,\"idCardInHandUrl\":1765,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000312001201702048716583683,\\u652f\\u4ed8\\u65f6\\u95f4: 20170204184157, OPENID:oy_PKwU2Z6u4cEtjeOcF0Y-Kx_LI\"}', 'json', '2017-02-04 18:41:05', '0000-00-00 00:00:00'),
(466, 0, 1, 2, 1, 21856, 'WEIXIN', 0, '13864245110补资料,机主：王环环', '{\"phoneNumber\":\"13864245110\",\"phoneUser\":\"\\u738b\\u73af\\u73af\",\"idNumber\":\"372923198506123848\",\"idCardFrontUrl\":1766,\"idCardBackUrl\":1767,\"idCardInHandUrl\":1768,\"contactNumber\":\"18253262866\"}', 'json', '2017-02-05 09:08:07', '0000-00-00 00:00:00'),
(467, 0, 1, 2, 1, 22380, 'WEIXIN', 0, '13864245110补资料,机主：王环环', '{\"phoneNumber\":\"13864245110\",\"phoneUser\":\"\\u738b\\u73af\\u73af\",\"idNumber\":\"372923198506123848\",\"idCardFrontUrl\":1769,\"idCardBackUrl\":1770,\"idCardInHandUrl\":1771,\"contactNumber\":\"18706481167\"}', 'json', '2017-02-05 10:10:09', '0000-00-00 00:00:00'),
(468, 0, 1, 2, 1, 112224, 'WEIXIN', 0, '18364232595补资料,机主：刘恩成', '{\"phoneNumber\":\"18364232595\",\"phoneUser\":\"\\u5218\\u6069\\u6210\",\"idNumber\":\"130925198912196619\",\"idCardFrontUrl\":1772,\"idCardBackUrl\":1773,\"idCardInHandUrl\":1774,\"contactNumber\":\"13012467088\"}', 'json', '2017-02-05 10:13:39', '0000-00-00 00:00:00'),
(469, 0, 1, 2, 1, 49223, 'WEIXIN', 0, '13792853365补资料,机主：周清生', '{\"phoneNumber\":\"13792853365\",\"phoneUser\":\"\\u5468\\u6e05\\u751f\",\"idNumber\":\"370323198112052536\",\"idCardFrontUrl\":1775,\"idCardBackUrl\":1776,\"idCardInHandUrl\":1777,\"contactNumber\":\"15020051580\"}', 'json', '2017-02-05 11:28:30', '0000-00-00 00:00:00'),
(470, 0, 1, 2, 1, 49223, 'WEIXIN', 0, '13789852251补资料,机主：毕露露', '{\"phoneNumber\":\"13789852251\",\"phoneUser\":\"\\u6bd5\\u9732\\u9732\",\"idNumber\":\"412825199210265323\",\"idCardFrontUrl\":1778,\"idCardBackUrl\":1779,\"idCardInHandUrl\":1780,\"contactNumber\":\"15020051580\"}', 'json', '2017-02-05 20:53:56', '0000-00-00 00:00:00'),
(471, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18363938910补资料,机主：艾秀丽', '{\"phoneNumber\":\"18363938910\",\"phoneUser\":\"\\u827e\\u79c0\\u4e3d\",\"idNumber\":\"23010219741005614X\",\"idCardFrontUrl\":1781,\"idCardBackUrl\":1782,\"idCardInHandUrl\":1783,\"contactNumber\":\"15063975716\"}', 'json', '2017-02-06 16:15:25', '0000-00-00 00:00:00'),
(472, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '13608988397补资料,机主：艾秀丽', '{\"phoneNumber\":\"13608988397\",\"phoneUser\":\"\\u827e\\u79c0\\u4e3d\",\"idNumber\":\"23010219741005614X\",\"idCardFrontUrl\":1784,\"idCardBackUrl\":1785,\"idCardInHandUrl\":1786,\"contactNumber\":\"15063975716\"}', 'json', '2017-02-06 16:20:37', '0000-00-00 00:00:00'),
(473, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '17863999864补资料,机主：谷佩', '{\"phoneNumber\":\"17863999864\",\"phoneUser\":\"\\u8c37\\u4f69\",\"idNumber\":\"372922198804011725\",\"idCardFrontUrl\":1788,\"idCardBackUrl\":1789,\"idCardInHandUrl\":1790,\"contactNumber\":\"15762261944\"}', 'json', '2017-02-08 16:06:56', '0000-00-00 00:00:00'),
(474, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13608983553补资料,机主：张璐', '{\"phoneNumber\":\"13608983553\",\"phoneUser\":\"\\u5f20\\u7490\",\"idNumber\":\"370284198509162140\",\"idCardFrontUrl\":1792,\"idCardBackUrl\":1793,\"idCardInHandUrl\":1794,\"contactNumber\":\"15020052833\"}', 'json', '2017-02-08 17:44:34', '0000-00-00 00:00:00'),
(475, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '17864283183补资料,机主：齐文浩', '{\"phoneNumber\":\"17864283183\",\"phoneUser\":\"\\u9f50\\u6587\\u6d69\",\"idNumber\":\"130427198803261712\",\"idCardFrontUrl\":1795,\"idCardBackUrl\":1796,\"idCardInHandUrl\":1797,\"contactNumber\":\"17864283183\"}', 'json', '2017-02-08 18:46:57', '0000-00-00 00:00:00'),
(476, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13789859612补资料,机主：奈春明', '{\"phoneNumber\":\"13789859612\",\"phoneUser\":\"\\u5948\\u6625\\u660e\",\"idNumber\":\"530125198802102811\",\"idCardFrontUrl\":1799,\"idCardBackUrl\":1800,\"idCardInHandUrl\":1801,\"contactNumber\":\"15666220577\"}', 'json', '2017-02-08 20:06:05', '0000-00-00 00:00:00'),
(477, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13864249829补资料,机主：甘心灿', '{\"phoneNumber\":\"13864249829\",\"phoneUser\":\"\\u7518\\u5fc3\\u707f\",\"idNumber\":\"410527200010269848\",\"idCardFrontUrl\":1802,\"idCardBackUrl\":1803,\"idCardInHandUrl\":1804,\"contactNumber\":\"15964920548\"}', 'json', '2017-02-10 20:53:55', '0000-00-00 00:00:00'),
(478, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13864249215补资料,机主：王博', '{\"phoneNumber\":\"13864249215\",\"phoneUser\":\"\\u738b\\u535a\",\"idNumber\":\"370832200011263135\",\"idCardFrontUrl\":1805,\"idCardBackUrl\":1808,\"idCardInHandUrl\":1807,\"contactNumber\":\"15964920548\"}', 'json', '2017-02-10 21:24:01', '0000-00-00 00:00:00'),
(479, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13789852251补资料,机主：刘建功', '{\"phoneNumber\":\"13789852251\",\"phoneUser\":\"\\u5218\\u5efa\\u529f\",\"idNumber\":\"140122198408281717\",\"idCardFrontUrl\":1811,\"idCardBackUrl\":1812,\"idCardInHandUrl\":1813,\"contactNumber\":\"15020051580\"}', 'json', '2017-02-11 18:09:37', '0000-00-00 00:00:00'),
(480, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13864820023补资料,机主：张晓波', '{\"phoneNumber\":\"13864820023\",\"phoneUser\":\"\\u5f20\\u6653\\u6ce2\",\"idNumber\":\"140225199006042210\",\"idCardFrontUrl\":1814,\"idCardBackUrl\":1815,\"idCardInHandUrl\":1816,\"contactNumber\":\"15035226050\"}', 'json', '2017-02-12 15:19:10', '0000-00-00 00:00:00'),
(481, 0, 2, 2, 1, 27223, 'WEIXIN', 0, '13730970082补资料,机主：毕春玲', '{\"phoneNumber\":\"13730970082\",\"phoneUser\":\"\\u6bd5\\u6625\\u73b2\",\"idNumber\":\"22052419830420202X\",\"idCardFrontUrl\":1821,\"idCardBackUrl\":1822,\"idCardInHandUrl\":1820,\"contactNumber\":\"15954868616\"}', 'json', '2017-02-13 17:33:12', '0000-00-00 00:00:00'),
(482, 0, 2, 2, 1, 22380, 'WEIXIN', 0, '18363991781补资料,机主：高世虎', '{\"phoneNumber\":\"18363991781\",\"phoneUser\":\"\\u9ad8\\u4e16\\u864e\",\"idNumber\":\"222426199209144718\",\"idCardFrontUrl\":1823,\"idCardBackUrl\":1824,\"idCardInHandUrl\":1825,\"contactNumber\":\"13061412858\"}', 'json', '2017-02-15 18:03:31', '0000-00-00 00:00:00'),
(483, 0, 2, 2, 1, 112255, 'WEIXIN', 0, '13864292903补资料,机主：马全胜', '{\"phoneNumber\":\"13864292903\",\"phoneUser\":\"\\u9a6c\\u5168\\u80dc\",\"idNumber\":\"420683198811224314\",\"idCardFrontUrl\":1826,\"idCardBackUrl\":1827,\"idCardInHandUrl\":1828,\"contactNumber\":\"18266653252\"}', 'json', '2017-02-16 13:04:45', '0000-00-00 00:00:00'),
(484, 0, 2, 2, 4, 112226, 'WEIXIN', 0, '[已付款]13165057961补资料,机主：张求峰', '{\"phoneNumber\":\"13165057961\",\"phoneUser\":\"\\u5f20\\u6c42\\u5cf0\",\"idNumber\":\"342625197305250011\",\"idCardFrontUrl\":1829,\"idCardBackUrl\":1830,\"idCardInHandUrl\":1831,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74006232001201702160133669391,\\u652f\\u4ed8\\u65f6\\u95f4: 20170216132127, OPENID:oy_PKweArQjhSCETLnAWzqasli88\"}', 'json', '2017-02-16 13:20:39', '0000-00-00 00:00:00'),
(485, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '18363968070补资料,机主：李晓庆', '{\"phoneNumber\":\"18363968070\",\"phoneUser\":\"\\u674e\\u6653\\u5e86\",\"idNumber\":\"142702199302051546\",\"idCardFrontUrl\":1832,\"idCardBackUrl\":1833,\"idCardInHandUrl\":1834,\"contactNumber\":\"15020051580\"}', 'json', '2017-02-16 20:30:43', '0000-00-00 00:00:00'),
(486, 0, 2, 2, 4, 22380, 'WEIXIN', 0, '[已付款]13165328805补资料,机主：姚小平', '{\"phoneNumber\":\"13165328805\",\"phoneUser\":\"\\u59da\\u5c0f\\u5e73\",\"idNumber\":\"622424199204162513\",\"idCardFrontUrl\":1835,\"idCardBackUrl\":1836,\"idCardInHandUrl\":1837,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000312001201702160191296995,\\u652f\\u4ed8\\u65f6\\u95f4: 20170216210144, OPENID:oy_PKwU2Z6u4cEtjeOcF0Y-Kx_LI\"}', 'json', '2017-02-16 21:00:39', '0000-00-00 00:00:00'),
(487, 0, 2, 2, 4, 3988, 'WEIXIN', 0, '[已付款]13127017396补资料,机主：王娜', '{\"phoneNumber\":\"13127017396\",\"phoneUser\":\"\\u738b\\u5a1c\",\"idNumber\":\"412723198408205067\",\"idCardFrontUrl\":1838,\"idCardBackUrl\":1839,\"idCardInHandUrl\":1840,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74001342001201702170235319054,\\u652f\\u4ed8\\u65f6\\u95f4: 20170217101930, OPENID:oy_PKweCRuQBAtLbP0dspoU8sSdU\"}', 'json', '2017-02-17 10:18:35', '0000-00-00 00:00:00'),
(488, 0, 0, 2, 4, 27193, 'WEIXIN', 0, '[未付款]15610490236补资料,机主：苏东艳', '{\"phoneNumber\":\"15610490236\",\"phoneUser\":\"\\u82cf\\u4e1c\\u8273\",\"idNumber\":\"150428199702270825\",\"idCardFrontUrl\":1841,\"idCardBackUrl\":1842,\"idCardInHandUrl\":1843,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2017-02-17 15:15:10', '0000-00-00 00:00:00'),
(489, 0, 2, 2, 1, 119166, 'WEIXIN', 0, '18366296871补资料,机主：张相满', '{\"phoneNumber\":\"18366296871\",\"phoneUser\":\"\\u5f20\\u76f8\\u6ee1\",\"idNumber\":\"\",\"idCardFrontUrl\":1847,\"idCardBackUrl\":1845,\"idCardInHandUrl\":1846,\"contactNumber\":\"18366296871\"}', 'json', '2017-02-17 17:21:56', '0000-00-00 00:00:00'),
(490, 0, 2, 2, 1, 3965, 'WEIXIN', 0, '18366282698补资料,机主：贾林春', '{\"phoneNumber\":\"18366282698\",\"phoneUser\":\"\\u8d3e\\u6797\\u6625\",\"idNumber\":\"230205196503090830\",\"idCardFrontUrl\":1848,\"idCardBackUrl\":1849,\"idCardInHandUrl\":1850,\"contactNumber\":\"17082666180\"}', 'json', '2017-02-18 08:55:36', '0000-00-00 00:00:00'),
(491, 0, 2, 2, 1, 3965, 'WEIXIN', 0, '18366282698补资料,机主：吴体章', '{\"phoneNumber\":\"18366282698\",\"phoneUser\":\"\\u5434\\u4f53\\u7ae0\",\"idNumber\":\"372929196704062715\",\"idCardFrontUrl\":1851,\"idCardBackUrl\":1852,\"idCardInHandUrl\":1853,\"contactNumber\":\"17082666180\"}', 'json', '2017-02-18 10:38:26', '0000-00-00 00:00:00'),
(492, 0, 2, 2, 1, 27223, 'WEIXIN', 0, '13687671302补资料,机主：王艳', '{\"phoneNumber\":\"13687671302\",\"phoneUser\":\"\\u738b\\u8273\",\"idNumber\":\"220223198203045624\",\"idCardFrontUrl\":1857,\"idCardBackUrl\":1859,\"idCardInHandUrl\":1858,\"contactNumber\":\"15954868616\"}', 'json', '2017-02-18 15:30:24', '0000-00-00 00:00:00'),
(493, 0, 2, 2, 1, 3965, 'WEIXIN', 0, '18754256874补资料,机主：崔荣东', '{\"phoneNumber\":\"18754256874\",\"phoneUser\":\"\\u5d14\\u8363\\u4e1c\",\"idNumber\":\"370826196206085733\",\"idCardFrontUrl\":1860,\"idCardBackUrl\":1861,\"idCardInHandUrl\":1863,\"contactNumber\":\"18754256874\"}', 'json', '2017-02-18 16:16:15', '0000-00-00 00:00:00'),
(494, 0, 2, 2, 1, 112255, 'WEIXIN', 0, '13864800775补资料,机主：韩尊耀', '{\"phoneNumber\":\"13864800775\",\"phoneUser\":\"\\u97e9\\u5c0a\\u8000\",\"idNumber\":\"372929199801081015\",\"idCardFrontUrl\":1862,\"idCardBackUrl\":1864,\"idCardInHandUrl\":1865,\"contactNumber\":\"18266653252\"}', 'json', '2017-02-18 16:17:23', '0000-00-00 00:00:00'),
(495, 0, 0, 2, 4, 3965, 'WEIXIN', 0, '[未付款]15610490236补资料,机主：苏东艳', '{\"phoneNumber\":\"15610490236\",\"phoneUser\":\"\\u82cf\\u4e1c\\u8273\",\"idNumber\":\"150428199702270825\",\"idCardFrontUrl\":1866,\"idCardBackUrl\":1867,\"idCardInHandUrl\":1868,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2017-02-18 18:56:00', '0000-00-00 00:00:00'),
(496, 0, 2, 2, 4, 3965, 'WEIXIN', 0, '[已付款]15610490236补资料,机主：苏东艳', '{\"phoneNumber\":\"15610490236\",\"phoneUser\":\"\\u82cf\\u4e1c\\u8273\",\"idNumber\":\"150428199702270825\",\"idCardFrontUrl\":1869,\"idCardBackUrl\":1870,\"idCardInHandUrl\":1871,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74005042001201702180426287036,\\u652f\\u4ed8\\u65f6\\u95f4: 20170218190044, OPENID:oy_PKwekIiqw2VWXq6N0QpyESi8g\"}', 'json', '2017-02-18 18:59:55', '0000-00-00 00:00:00'),
(497, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '13864845331补资料,机主：张文雅', '{\"phoneNumber\":\"13864845331\",\"phoneUser\":\"\\u5f20\\u6587\\u96c5\",\"idNumber\":\"410527200009065442\",\"idCardFrontUrl\":1881,\"idCardBackUrl\":1876,\"idCardInHandUrl\":1879,\"contactNumber\":\"15964920548\"}', 'json', '2017-02-18 20:34:53', '0000-00-00 00:00:00'),
(498, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13793220950补资料,机主：王环环', '{\"phoneNumber\":\"13793220950\",\"phoneUser\":\"\\u738b\\u73af\\u73af\",\"idNumber\":\"372923198506123848\",\"idCardFrontUrl\":1882,\"idCardBackUrl\":1883,\"idCardInHandUrl\":1884,\"contactNumber\":\"15020051580\"}', 'json', '2017-02-19 10:00:36', '0000-00-00 00:00:00'),
(499, 0, 2, 2, 1, 27210, 'WEIXIN', 0, '13792855167补资料,机主：张绍金', '{\"phoneNumber\":\"13792855167\",\"phoneUser\":\"\\u5f20\\u7ecd\\u91d1\",\"idNumber\":\"372822197501277913\",\"idCardFrontUrl\":1885,\"idCardBackUrl\":1886,\"idCardInHandUrl\":1887,\"contactNumber\":\"13954459258\"}', 'json', '2017-02-19 16:12:46', '0000-00-00 00:00:00'),
(500, 0, 2, 2, 1, 14075, 'WEIXIN', 0, '18364248252补资料,机主：陈钰', '{\"phoneNumber\":\"18364248252\",\"phoneUser\":\"\\u9648\\u94b0\",\"idNumber\":\"340824199103080618\",\"idCardFrontUrl\":1888,\"idCardBackUrl\":1889,\"idCardInHandUrl\":1890,\"contactNumber\":\"15318796009\"}', 'json', '2017-02-20 19:39:00', '0000-00-00 00:00:00'),
(501, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18364256719补资料,机主：彭元超', '{\"phoneNumber\":\"18364256719\",\"phoneUser\":\"\\u5f6d\\u5143\\u8d85\",\"idNumber\":\"\",\"idCardFrontUrl\":1891,\"idCardBackUrl\":1892,\"idCardInHandUrl\":1893,\"contactNumber\":\"15666220577\"}', 'json', '2017-02-20 20:55:24', '0000-00-00 00:00:00'),
(502, 0, 2, 2, 1, 112255, 'WEIXIN', 0, '13864286639补资料,机主：张兵', '{\"phoneNumber\":\"13864286639\",\"phoneUser\":\"\\u5f20\\u5175\",\"idNumber\":\"522122199603027439\",\"idCardFrontUrl\":1894,\"idCardBackUrl\":1895,\"idCardInHandUrl\":1896,\"contactNumber\":\"18266653252\"}', 'json', '2017-02-21 13:41:20', '0000-00-00 00:00:00'),
(503, 0, 0, 2, 4, 3977, 'WEIXIN', 0, '[未付款]15610480907补资料,机主：张祥云', '{\"phoneNumber\":\"15610480907\",\"phoneUser\":\"\\u5f20\\u7965\\u4e91\",\"idNumber\":\"370826199612010819\",\"idCardFrontUrl\":1897,\"idCardBackUrl\":1898,\"idCardInHandUrl\":1899,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2017-02-22 13:00:23', '0000-00-00 00:00:00'),
(504, 0, 0, 2, 4, 112226, 'WEIXIN', 0, '[未付款]15610480907补资料,机主：张祥云', '{\"phoneNumber\":\"15610480907\",\"phoneUser\":\"\\u5f20\\u7965\\u4e91\",\"idNumber\":\"370826199612010819\",\"idCardFrontUrl\":1900,\"idCardBackUrl\":1902,\"idCardInHandUrl\":1901,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2017-02-22 13:04:41', '0000-00-00 00:00:00'),
(505, 0, 0, 2, 4, 112224, 'WEIXIN', 0, '[未付款]15610480907补资料,机主：张祥云', '{\"phoneNumber\":\"15610480907\",\"phoneUser\":\"\\u5f20\\u7965\\u4e91\",\"idNumber\":\"370826199612010819\",\"idCardFrontUrl\":1903,\"idCardBackUrl\":1904,\"idCardInHandUrl\":1905,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2017-02-22 13:12:38', '0000-00-00 00:00:00'),
(506, 0, 0, 2, 4, 112224, 'WEIXIN', 0, '[未付款]15610480907补资料,机主：张祥云', '{\"phoneNumber\":\"15610480907\",\"phoneUser\":\"\\u5f20\\u7965\\u4e91\",\"idNumber\":\"370826199612010819\",\"idCardFrontUrl\":1906,\"idCardBackUrl\":1907,\"idCardInHandUrl\":1908,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2017-02-22 13:13:56', '0000-00-00 00:00:00'),
(507, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13792866703补资料,机主：刘金宝', '{\"phoneNumber\":\"13792866703\",\"phoneUser\":\"\\u5218\\u91d1\\u5b9d\",\"idNumber\":\"230823197612151436\",\"idCardFrontUrl\":1909,\"idCardBackUrl\":1910,\"idCardInHandUrl\":1911,\"contactNumber\":\"15020051580\"}', 'json', '2017-02-22 17:34:12', '0000-00-00 00:00:00'),
(508, 0, 0, 2, 4, 3989, 'WEIXIN', 0, '[未付款]15610480907补资料,机主：张祥云', '{\"phoneNumber\":\"15610480907\",\"phoneUser\":\"\\u5f20\\u7965\\u4e91\",\"idNumber\":\"370826199612010819\",\"idCardFrontUrl\":1912,\"idCardBackUrl\":1913,\"idCardInHandUrl\":1914,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2017-02-22 17:41:26', '0000-00-00 00:00:00'),
(509, 0, 0, 2, 4, 3989, 'WEIXIN', 0, '[未付款]15610480907补资料,机主：15610480907', '{\"phoneNumber\":\"15610480907\",\"phoneUser\":\"15610480907\",\"idNumber\":\"370826199612010819\",\"idCardFrontUrl\":1915,\"idCardBackUrl\":1916,\"idCardInHandUrl\":1917,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2017-02-22 17:44:33', '0000-00-00 00:00:00'),
(510, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '13864867032补资料,机主：李国辉', '{\"phoneNumber\":\"13864867032\",\"phoneUser\":\"\\u674e\\u56fd\\u8f89\",\"idNumber\":\"371421198410234235\",\"idCardFrontUrl\":1918,\"idCardBackUrl\":1919,\"idCardInHandUrl\":1920,\"contactNumber\":\"15621301275\"}', 'json', '2017-02-22 17:46:24', '0000-00-00 00:00:00'),
(511, 0, 2, 2, 4, 3989, 'WEIXIN', 0, '[已付款]15610480907补资料,机主：张祥云', '{\"phoneNumber\":\"15610480907\",\"phoneUser\":\"\\u5f20\\u7965\\u4e91\",\"idNumber\":\"370826199612010819\",\"idCardFrontUrl\":1921,\"idCardBackUrl\":1922,\"idCardInHandUrl\":1923,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000892001201702220913354227,\\u652f\\u4ed8\\u65f6\\u95f4: 20170222180938, OPENID:oy_PKwXtmqv5PDBgtTBjuOODPyK0\"}', 'json', '2017-02-22 18:08:39', '0000-00-00 00:00:00'),
(512, 0, 2, 2, 1, 223104, 'WEIXIN', 0, '13864289720补资料,机主：黄帮才', '{\"phoneNumber\":\"13864289720\",\"phoneUser\":\"\\u9ec4\\u5e2e\\u624d\",\"idNumber\":\"500223199707090930\",\"idCardFrontUrl\":1924,\"idCardBackUrl\":1925,\"idCardInHandUrl\":1926,\"contactNumber\":\"18266653252\"}', 'json', '2017-02-22 19:46:33', '0000-00-00 00:00:00'),
(513, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '15153258137补资料,机主：张伟', '{\"phoneNumber\":\"15153258137\",\"phoneUser\":\"\\u5f20\\u4f1f\",\"idNumber\":\"620402198208250436\",\"idCardFrontUrl\":1927,\"idCardBackUrl\":1928,\"idCardInHandUrl\":1929,\"contactNumber\":\"15153258137\"}', 'json', '2017-02-23 10:49:51', '0000-00-00 00:00:00'),
(514, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '15153258772补资料,机主：张伟', '{\"phoneNumber\":\"15153258772\",\"phoneUser\":\"\\u5f20\\u4f1f\",\"idNumber\":\"620402198208250436\",\"idCardFrontUrl\":1930,\"idCardBackUrl\":1931,\"idCardInHandUrl\":1932,\"contactNumber\":\"15153258772\"}', 'json', '2017-02-23 10:53:24', '0000-00-00 00:00:00'),
(515, 0, 1, 2, 1, 112255, 'WEIXIN', 0, '13864847318补资料,机主：郭建霞', '{\"phoneNumber\":\"13864847318\",\"phoneUser\":\"\\u90ed\\u5efa\\u971e\",\"idNumber\":\"371481197908167529\",\"idCardFrontUrl\":1933,\"idCardBackUrl\":1934,\"idCardInHandUrl\":1935,\"contactNumber\":\"18266653252\"}', 'json', '2017-02-23 17:51:09', '0000-00-00 00:00:00'),
(516, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13730977003补资料,机主：张胜杰', '{\"phoneNumber\":\"13730977003\",\"phoneUser\":\"\\u5f20\\u80dc\\u6770\",\"idNumber\":\"142601197206109110\",\"idCardFrontUrl\":1937,\"idCardBackUrl\":1938,\"idCardInHandUrl\":1939,\"contactNumber\":\"15666220577\"}', 'json', '2017-02-24 13:42:16', '0000-00-00 00:00:00'),
(517, 0, 2, 2, 1, 113120, 'WEIXIN', 0, '18364255139补资料,机主：李鹏', '{\"phoneNumber\":\"18364255139\",\"phoneUser\":\"\\u674e\\u9e4f\",\"idNumber\":\"371427198806171654\",\"idCardFrontUrl\":1940,\"idCardBackUrl\":1941,\"idCardInHandUrl\":1942,\"contactNumber\":\"18354233035\"}', 'json', '2017-02-24 17:45:23', '0000-00-00 00:00:00'),
(518, 0, 2, 2, 1, 112255, 'WEIXIN', 0, '13864847318补资料,机主：郭建霞', '{\"phoneNumber\":\"13864847318\",\"phoneUser\":\"\\u90ed\\u5efa\\u971e\",\"idNumber\":\"371481197908167529\",\"idCardFrontUrl\":1944,\"idCardBackUrl\":1945,\"idCardInHandUrl\":1946,\"contactNumber\":\"18266653252\"}', 'json', '2017-02-25 17:36:04', '0000-00-00 00:00:00'),
(519, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '18364256712补资料,机主：范镇豪', '{\"phoneNumber\":\"18364256712\",\"phoneUser\":\"\\u8303\\u9547\\u8c6a\",\"idNumber\":\"371321199809115333\",\"idCardFrontUrl\":1948,\"idCardBackUrl\":1949,\"idCardInHandUrl\":1950,\"contactNumber\":\"15666220577\"}', 'json', '2017-02-25 18:38:31', '0000-00-00 00:00:00'),
(520, 0, 2, 2, 1, 22380, 'WEIXIN', 0, '18363990573补资料,机主：马云晖', '{\"phoneNumber\":\"18363990573\",\"phoneUser\":\"\\u9a6c\\u4e91\\u6656\",\"idNumber\":\"371525199009255342\",\"idCardFrontUrl\":1951,\"idCardBackUrl\":1952,\"idCardInHandUrl\":1953,\"contactNumber\":\"13061412858\"}', 'json', '2017-02-26 18:00:03', '0000-00-00 00:00:00'),
(521, 0, 2, 2, 4, 22380, 'WEIXIN', 0, '[已付款]13165322673补资料,机主：战玉刚', '{\"phoneNumber\":\"13165322673\",\"phoneUser\":\"\\u6218\\u7389\\u521a\",\"idNumber\":\"370285198112144418\",\"idCardFrontUrl\":1954,\"idCardBackUrl\":1955,\"idCardInHandUrl\":1956,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74000312001201702271568488699,\\u652f\\u4ed8\\u65f6\\u95f4: 20170227203156, OPENID:oy_PKwU2Z6u4cEtjeOcF0Y-Kx_LI\"}', 'json', '2017-02-27 20:30:32', '0000-00-00 00:00:00'),
(522, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '18366205797补资料,机主：解靖', '{\"phoneNumber\":\"18366205797\",\"phoneUser\":\"\\u89e3\\u9756\",\"idNumber\":\"131126199904172113\",\"idCardFrontUrl\":1961,\"idCardBackUrl\":1959,\"idCardInHandUrl\":1960,\"contactNumber\":\"13573276305\"}', 'json', '2017-02-28 17:04:43', '0000-00-00 00:00:00'),
(523, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '13864245363补资料,机主：邢真真', '{\"phoneNumber\":\"13864245363\",\"phoneUser\":\"\\u90a2\\u771f\\u771f\",\"idNumber\":\"372925198711012584\",\"idCardFrontUrl\":1962,\"idCardBackUrl\":1963,\"idCardInHandUrl\":1964,\"contactNumber\":\"18253262866\"}', 'json', '2017-03-01 08:39:50', '0000-00-00 00:00:00'),
(524, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '13864832131补资料,机主：高明杰', '{\"phoneNumber\":\"13864832131\",\"phoneUser\":\"\\u9ad8\\u660e\\u6770\",\"idNumber\":\"370724196802281212\",\"idCardFrontUrl\":1972,\"idCardBackUrl\":1974,\"idCardInHandUrl\":1975,\"contactNumber\":\"13210223628\"}', 'json', '2017-03-01 10:31:07', '0000-00-00 00:00:00'),
(525, 0, 2, 2, 1, 27193, 'WEIXIN', 0, '13789859125补资料,机主：王本军', '{\"phoneNumber\":\"13789859125\",\"phoneUser\":\"\\u738b\\u672c\\u519b\",\"idNumber\":\"370284199012024839\",\"idCardFrontUrl\":1976,\"idCardBackUrl\":1977,\"idCardInHandUrl\":1978,\"contactNumber\":\"15666220577\"}', 'json', '2017-03-01 16:53:32', '0000-00-00 00:00:00'),
(526, 0, 2, 2, 1, 117136, 'WEIXIN', 0, '18765425584补资料,机主：李根喜', '{\"phoneNumber\":\"18765425584\",\"phoneUser\":\"\\u674e\\u6839\\u559c\",\"idNumber\":\"533524198507082721\",\"idCardFrontUrl\":1979,\"idCardBackUrl\":1980,\"idCardInHandUrl\":1981,\"contactNumber\":\"18266653252\"}', 'json', '2017-03-03 18:31:45', '0000-00-00 00:00:00'),
(527, 0, 2, 2, 1, 1440, 'WEIXIN', 0, '13864811330补资料,机主：.田桂龙', '{\"phoneNumber\":\"13864811330\",\"phoneUser\":\".\\u7530\\u6842\\u9f99\",\"idNumber\":\"372826196409290956\",\"idCardFrontUrl\":1982,\"idCardBackUrl\":1983,\"idCardInHandUrl\":1984,\"contactNumber\":\"15763392118\"}', 'json', '2017-03-04 13:36:43', '0000-00-00 00:00:00'),
(528, 0, 2, 2, 1, 27219, 'WEIXIN', 0, '13864818026补资料,机主：王名乐', '{\"phoneNumber\":\"13864818026\",\"phoneUser\":\"\\u738b\\u540d\\u4e50\",\"idNumber\":\"372929198708131238\",\"idCardFrontUrl\":1985,\"idCardBackUrl\":1986,\"idCardInHandUrl\":1987,\"contactNumber\":\"15666220577\"}', 'json', '2017-03-04 14:49:43', '0000-00-00 00:00:00'),
(529, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '13864837738补资料,机主：王珂', '{\"phoneNumber\":\"13864837738\",\"phoneUser\":\"\\u738b\\u73c2\",\"idNumber\":\"370921198904254814\",\"idCardFrontUrl\":1988,\"idCardBackUrl\":1989,\"idCardInHandUrl\":1990,\"contactNumber\":\"13210037228\"}', 'json', '2017-03-05 08:26:28', '0000-00-00 00:00:00'),
(530, 0, 2, 2, 1, 3977, 'WEIXIN', 0, '13864862771补资料,机主：葛均祥', '{\"phoneNumber\":\"13864862771\",\"phoneUser\":\"\\u845b\\u5747\\u7965\",\"idNumber\":\"372826197501285417\",\"idCardFrontUrl\":1991,\"idCardBackUrl\":1992,\"idCardInHandUrl\":1993,\"contactNumber\":\"18765293082\"}', 'json', '2017-03-05 09:50:35', '0000-00-00 00:00:00'),
(531, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '13864298382补资料,机主：高晓志', '{\"phoneNumber\":\"13864298382\",\"phoneUser\":\"\\u9ad8\\u6653\\u5fd7\",\"idNumber\":\"210724196809080435\",\"idCardFrontUrl\":1994,\"idCardBackUrl\":1995,\"idCardInHandUrl\":1996,\"contactNumber\":\"18013161571\"}', 'json', '2017-03-05 12:36:39', '0000-00-00 00:00:00'),
(532, 0, 2, 2, 1, 42199, 'WEIXIN', 0, '13793221023补资料,机主：王环环', '{\"phoneNumber\":\"13793221023\",\"phoneUser\":\"\\u738b\\u73af\\u73af\",\"idNumber\":\"372923198506123848\",\"idCardFrontUrl\":1997,\"idCardBackUrl\":1998,\"idCardInHandUrl\":1999,\"contactNumber\":\"15020051580\"}', 'json', '2017-03-06 11:16:22', '0000-00-00 00:00:00'),
(533, 0, 2, 2, 1, 112225, 'WEIXIN', 0, '18254225870补资料,机主：付得新', '{\"phoneNumber\":\"18254225870\",\"phoneUser\":\"\\u4ed8\\u5f97\\u65b0\",\"idNumber\":\"372901196711102854\",\"idCardFrontUrl\":2001,\"idCardBackUrl\":2002,\"idCardInHandUrl\":2003,\"contactNumber\":\"18706481167\"}', 'json', '2017-03-06 14:40:36', '0000-00-00 00:00:00'),
(534, 0, 1, 2, 1, 42199, 'WEIXIN', 0, '13792867852补资料,机主：刘红利', '{\"phoneNumber\":\"13792867852\",\"phoneUser\":\"\\u5218\\u7ea2\\u5229\",\"idNumber\":\"142702197212071544\",\"idCardFrontUrl\":2004,\"idCardBackUrl\":2005,\"idCardInHandUrl\":2006,\"contactNumber\":\"15020051580\"}', 'json', '2017-03-07 18:00:37', '0000-00-00 00:00:00'),
(535, 0, 2, 2, 1, 42199, 'WEIXIN', 0, '13792867852补资料,机主：刘红利', '{\"phoneNumber\":\"13792867852\",\"phoneUser\":\"\\u5218\\u7ea2\\u5229\",\"idNumber\":\"142702197212071544\",\"idCardFrontUrl\":2008,\"idCardBackUrl\":2009,\"idCardInHandUrl\":2010,\"contactNumber\":\"15020051580\"}', 'json', '2017-03-08 16:26:26', '0000-00-00 00:00:00'),
(536, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '13553062527补资料,机主：陈洋', '{\"phoneNumber\":\"13553062527\",\"phoneUser\":\"\\u9648\\u6d0b\",\"idNumber\":\"232324198811140639\",\"idCardFrontUrl\":2011,\"idCardBackUrl\":2012,\"idCardInHandUrl\":2013,\"contactNumber\":\"15263049097\"}', 'json', '2017-03-09 14:55:08', '0000-00-00 00:00:00'),
(537, 0, 2, 2, 1, 49223, 'WEIXIN', 0, '13864845908补资料,机主：程艳勇', '{\"phoneNumber\":\"13864845908\",\"phoneUser\":\"\\u7a0b\\u8273\\u52c7\",\"idNumber\":\"410527199607105437\",\"idCardFrontUrl\":2015,\"idCardBackUrl\":2017,\"idCardInHandUrl\":2019,\"contactNumber\":\"15964920548\"}', 'json', '2017-03-09 18:50:06', '0000-00-00 00:00:00'),
(538, 0, 2, 2, 1, 3988, 'WEIXIN', 0, '13864806550补资料,机主：王波', '{\"phoneNumber\":\"13864806550\",\"phoneUser\":\"\\u738b\\u6ce2\",\"idNumber\":\"321324198712090438\",\"idCardFrontUrl\":2020,\"idCardBackUrl\":2021,\"idCardInHandUrl\":2022,\"contactNumber\":\"18013161571\"}', 'json', '2017-03-11 14:12:27', '0000-00-00 00:00:00'),
(539, 0, 1, 2, 1, 3988, 'WEIXIN', 0, '13864806550补资料,机主：王波', '{\"phoneNumber\":\"13864806550\",\"phoneUser\":\"\\u738b\\u6ce2\",\"idNumber\":\"321324198712090438\",\"idCardFrontUrl\":2023,\"idCardBackUrl\":2024,\"idCardInHandUrl\":2025,\"contactNumber\":\"18013161571\"}', 'json', '2017-03-11 14:27:01', '0000-00-00 00:00:00'),
(540, 0, 2, 2, 1, 42199, 'WEIXIN', 0, '18366219305补资料,机主：牛梦影', '{\"phoneNumber\":\"18366219305\",\"phoneUser\":\"\\u725b\\u68a6\\u5f71\",\"idNumber\":\"412727200201064020\",\"idCardFrontUrl\":2026,\"idCardBackUrl\":2027,\"idCardInHandUrl\":2028,\"contactNumber\":\"18363938492\"}', 'json', '2017-03-11 15:11:21', '0000-00-00 00:00:00'),
(541, 0, 2, 2, 1, 27219, 'WEIXIN', 0, '13730976331补资料,机主：赵化坤', '{\"phoneNumber\":\"13730976331\",\"phoneUser\":\"\\u8d75\\u5316\\u5764\",\"idNumber\":\"372922199005044795\",\"idCardFrontUrl\":2029,\"idCardBackUrl\":2030,\"idCardInHandUrl\":2031,\"contactNumber\":\"15666220577\"}', 'json', '2017-03-11 19:40:52', '0000-00-00 00:00:00'),
(542, 0, 2, 2, 1, 112226, 'WEIXIN', 0, '13864832698补资料,机主：高新民', '{\"phoneNumber\":\"13864832698\",\"phoneUser\":\"\\u9ad8\\u65b0\\u6c11\",\"idNumber\":\"340621197606069438\",\"idCardFrontUrl\":2035,\"idCardBackUrl\":2036,\"idCardInHandUrl\":2037,\"contactNumber\":\"13210037228\"}', 'json', '2017-03-12 13:57:25', '0000-00-00 00:00:00'),
(543, 0, 2, 2, 1, 42199, 'WEIXIN', 0, '13792867309补资料,机主：李楠', '{\"phoneNumber\":\"13792867309\",\"phoneUser\":\"\\u674e\\u6960\",\"idNumber\":\"142724198905132111\",\"idCardFrontUrl\":2038,\"idCardBackUrl\":2039,\"idCardInHandUrl\":2040,\"contactNumber\":\"15020051580\"}', 'json', '2017-03-13 14:50:13', '0000-00-00 00:00:00'),
(544, 0, 2, 2, 1, 27219, 'WEIXIN', 0, '13792850819补资料,机主：李为宝', '{\"phoneNumber\":\"13792850819\",\"phoneUser\":\"\\u674e\\u4e3a\\u5b9d\",\"idNumber\":\"371122198508127630\",\"idCardFrontUrl\":2041,\"idCardBackUrl\":2042,\"idCardInHandUrl\":2043,\"contactNumber\":\"18563981766\"}', 'json', '2017-03-13 16:34:13', '0000-00-00 00:00:00'),
(545, 0, 2, 2, 1, 11137, 'WEIXIN', 0, '13864856638补资料,机主：李宁', '{\"phoneNumber\":\"13864856638\",\"phoneUser\":\"\\u674e\\u5b81\",\"idNumber\":\"13013319950707335X\",\"idCardFrontUrl\":2044,\"idCardBackUrl\":2045,\"idCardInHandUrl\":2046,\"contactNumber\":\"13589288610\"}', 'json', '2017-03-14 20:26:50', '0000-00-00 00:00:00'),
(546, 0, 2, 2, 1, 124129, 'WEIXIN', 0, '15762290509补资料,机主：满洋洋', '{\"phoneNumber\":\"15762290509\",\"phoneUser\":\"\\u6ee1\\u6d0b\\u6d0b\",\"idNumber\":\"370481199009234271\",\"idCardFrontUrl\":2047,\"idCardBackUrl\":2048,\"idCardInHandUrl\":2049,\"contactNumber\":\"17096452690\"}', 'json', '2017-03-14 21:59:33', '0000-00-00 00:00:00'),
(547, 0, 1, 2, 1, 112224, 'WEIXIN', 0, '18364252968补资料,机主：梁延常', '{\"phoneNumber\":\"18364252968\",\"phoneUser\":\"\\u6881\\u5ef6\\u5e38\",\"idNumber\":\"370832196312151330\",\"idCardFrontUrl\":2050,\"idCardBackUrl\":2051,\"idCardInHandUrl\":2052,\"contactNumber\":\"18363938492\"}', 'json', '2017-03-16 17:12:59', '0000-00-00 00:00:00'),
(548, 0, 1, 2, 1, 42199, 'WEIXIN', 0, '13793221023补资料,机主：王环环', '{\"phoneNumber\":\"13793221023\",\"phoneUser\":\"\\u738b\\u73af\\u73af\",\"idNumber\":\"372923198506123848\",\"idCardFrontUrl\":2053,\"idCardBackUrl\":2054,\"idCardInHandUrl\":2055,\"contactNumber\":\"15020051580\"}', 'json', '2017-03-17 10:58:58', '0000-00-00 00:00:00'),
(549, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '13730970672补资料,机主：商辰先', '{\"phoneNumber\":\"13730970672\",\"phoneUser\":\"\\u5546\\u8fb0\\u5148\",\"idNumber\":\"371427198910185511\",\"idCardFrontUrl\":2056,\"idCardBackUrl\":2057,\"idCardInHandUrl\":2058,\"contactNumber\":\"15954868616\"}', 'json', '2017-03-19 11:20:20', '0000-00-00 00:00:00'),
(550, 0, 1, 2, 1, 124129, 'WEIXIN', 0, '17864205242补资料,机主：殷宝龙', '{\"phoneNumber\":\"17864205242\",\"phoneUser\":\"\\u6bb7\\u5b9d\\u9f99\",\"idNumber\":\"371327198911203958\",\"idCardFrontUrl\":2059,\"idCardBackUrl\":2060,\"idCardInHandUrl\":2061,\"contactNumber\":\"18669839838\"}', 'json', '2017-03-19 14:30:06', '0000-00-00 00:00:00'),
(551, 0, 1, 2, 1, 27219, 'WEIXIN', 0, '13864822067补资料,机主：于际卫', '{\"phoneNumber\":\"13864822067\",\"phoneUser\":\"\\u4e8e\\u9645\\u536b\",\"idNumber\":\"\",\"idCardFrontUrl\":2062,\"idCardBackUrl\":2063,\"idCardInHandUrl\":2065,\"contactNumber\":\"15666220577\"}', 'json', '2017-03-19 16:18:19', '0000-00-00 00:00:00'),
(552, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '13864840561补资料,机主：王振兴', '{\"phoneNumber\":\"13864840561\",\"phoneUser\":\"\\u738b\\u632f\\u5174\",\"idNumber\":\"230182198410281618\",\"idCardFrontUrl\":2066,\"idCardBackUrl\":2067,\"idCardInHandUrl\":2068,\"contactNumber\":\"13210223638\"}', 'json', '2017-03-19 21:10:59', '0000-00-00 00:00:00'),
(553, 0, 0, 2, 4, 1440, 'WEIXIN', 0, '[未付款]15618451031补资料,机主：王伟', '{\"phoneNumber\":\"15618451031\",\"phoneUser\":\"\\u738b\\u4f1f\",\"idNumber\":\"342423199003086872\",\"idCardFrontUrl\":2069,\"idCardBackUrl\":2070,\"idCardInHandUrl\":2071,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200}', 'json', '2017-03-20 19:07:28', '0000-00-00 00:00:00'),
(554, 0, 1, 2, 1, 117136, 'WEIXIN', 0, '13864238836补资料,机主：姜蕾', '{\"phoneNumber\":\"13864238836\",\"phoneUser\":\"\\u59dc\\u857e\",\"idNumber\":\"370283198607022217\",\"idCardFrontUrl\":2072,\"idCardBackUrl\":2073,\"idCardInHandUrl\":2074,\"contactNumber\":\"13156856662\"}', 'json', '2017-03-21 09:43:31', '0000-00-00 00:00:00'),
(555, 0, 1, 2, 1, 112226, 'WEIXIN', 0, '13864835867补资料,机主：邢怀望', '{\"phoneNumber\":\"13864835867\",\"phoneUser\":\"\\u90a2\\u6000\\u671b\",\"idNumber\":\"372321198601119438\",\"idCardFrontUrl\":2075,\"idCardBackUrl\":2076,\"idCardInHandUrl\":2077,\"contactNumber\":\"13210037228\"}', 'json', '2017-03-23 15:12:36', '0000-00-00 00:00:00'),
(556, 0, 1, 2, 1, 42199, 'WEIXIN', 0, '13864261261补资料,机主：孙利', '{\"phoneNumber\":\"13864261261\",\"phoneUser\":\"\\u5b59\\u5229\",\"idNumber\":\"370983198411014213\",\"idCardFrontUrl\":2078,\"idCardBackUrl\":2079,\"idCardInHandUrl\":2080,\"contactNumber\":\"15020051580\"}', 'json', '2017-03-23 17:44:14', '0000-00-00 00:00:00'),
(557, 0, 1, 2, 1, 113120, 'WEIXIN', 0, '18364248236补资料,机主：王小熊', '{\"phoneNumber\":\"18364248236\",\"phoneUser\":\"\\u738b\\u5c0f\\u718a\",\"idNumber\":\"320625197910286236\",\"idCardFrontUrl\":2084,\"idCardBackUrl\":2085,\"idCardInHandUrl\":2086,\"contactNumber\":\"18354233035\"}', 'json', '2017-03-27 19:44:25', '0000-00-00 00:00:00'),
(558, 0, 1, 2, 1, 117136, 'WEIXIN', 0, '13864803768补资料,机主：黄长松', '{\"phoneNumber\":\"13864803768\",\"phoneUser\":\"\\u9ec4\\u957f\\u677e\",\"idNumber\":\"532124197905221515\",\"idCardFrontUrl\":2092,\"idCardBackUrl\":2093,\"idCardInHandUrl\":2094,\"contactNumber\":\"18266653252\"}', 'json', '2017-03-28 11:18:52', '0000-00-00 00:00:00'),
(559, 0, 1, 2, 1, 218201, 'WEIXIN', 0, '13864826919补资料,机主：王新利', '{\"phoneNumber\":\"13864826919\",\"phoneUser\":\"\\u738b\\u65b0\\u5229\",\"idNumber\":\"370403197001120757\",\"idCardFrontUrl\":2095,\"idCardBackUrl\":2096,\"idCardInHandUrl\":2097,\"contactNumber\":\"15163242651\"}', 'json', '2017-03-28 16:26:05', '0000-00-00 00:00:00'),
(560, 0, 1, 2, 1, 11137, 'WEIXIN', 0, '13864853735补资料,机主：王崇斌', '{\"phoneNumber\":\"13864853735\",\"phoneUser\":\"\\u738b\\u5d07\\u658c\",\"idNumber\":\"371122199802286872\",\"idCardFrontUrl\":2100,\"idCardBackUrl\":2101,\"idCardInHandUrl\":2102,\"contactNumber\":\"13589288610\"}', 'json', '2017-03-28 20:47:19', '0000-00-00 00:00:00'),
(561, 0, 1, 2, 1, 27210, 'WEIXIN', 0, '15153258526补资料,机主：丁柏军', '{\"phoneNumber\":\"15153258526\",\"phoneUser\":\"\\u4e01\\u67cf\\u519b\",\"idNumber\":\"370284199709304312\",\"idCardFrontUrl\":2103,\"idCardBackUrl\":2104,\"idCardInHandUrl\":2105,\"contactNumber\":\"17086018999\"}', 'json', '2017-03-30 09:42:10', '0000-00-00 00:00:00'),
(562, 0, 1, 2, 1, 112226, 'WEIXIN', 0, '13864867215补资料,机主：刘文龙', '{\"phoneNumber\":\"13864867215\",\"phoneUser\":\"\\u5218\\u6587\\u9f99\",\"idNumber\":\"370283199612091211\",\"idCardFrontUrl\":2106,\"idCardBackUrl\":2107,\"idCardInHandUrl\":2108,\"contactNumber\":\"15689459772\"}', 'json', '2017-04-06 11:30:43', '0000-00-00 00:00:00'),
(563, 0, 1, 2, 1, 3988, 'WEIXIN', 0, '18364249980补资料,机主：才缨宣', '{\"phoneNumber\":\"18364249980\",\"phoneUser\":\"\\u624d\\u7f28\\u5ba3\",\"idNumber\":\"230206199407050740\",\"idCardFrontUrl\":2109,\"idCardBackUrl\":2110,\"idCardInHandUrl\":2111,\"contactNumber\":\"\"}', 'json', '2017-04-07 20:25:18', '0000-00-00 00:00:00'),
(564, 0, 2, 2, 4, 112226, 'WEIXIN', 0, '[已付款]15615428296补资料,机主：赵天增', '{\"phoneNumber\":\"15615428296\",\"phoneUser\":\"\\u8d75\\u5929\\u589e\",\"idNumber\":\"370983199401175333\",\"idCardFrontUrl\":2112,\"idCardBackUrl\":2113,\"idCardInHandUrl\":2114,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74001542001201704096446088652,\\u652f\\u4ed8\\u65f6\\u95f4: 20170409195444, OPENID:oy_PKwaiSI7ewU4UEdFZGlGxRXCU\"}', 'json', '2017-04-09 19:53:52', '0000-00-00 00:00:00'),
(565, 0, 1, 2, 1, 22380, 'WEIXIN', 0, '13864242125补资料,机主：马金建', '{\"phoneNumber\":\"13864242125\",\"phoneUser\":\"\\u9a6c\\u91d1\\u5efa\",\"idNumber\":\"372526198207113313\",\"idCardFrontUrl\":2115,\"idCardBackUrl\":2116,\"idCardInHandUrl\":2117,\"contactNumber\":\"15863030201\"}', 'json', '2017-04-12 09:26:44', '0000-00-00 00:00:00'),
(566, 0, 1, 2, 1, 22380, 'WEIXIN', 0, '13864242125补资料,机主：马金建', '{\"phoneNumber\":\"13864242125\",\"phoneUser\":\"\\u9a6c\\u91d1\\u5efa\",\"idNumber\":\"372526198207113313\",\"idCardFrontUrl\":2119,\"idCardBackUrl\":2120,\"idCardInHandUrl\":2121,\"contactNumber\":\"15863030201\"}', 'json', '2017-04-13 11:22:20', '0000-00-00 00:00:00'),
(567, 0, 1, 2, 1, 123151, 'WEIXIN', 0, '13608983033补资料,机主：韩洪光', '{\"phoneNumber\":\"13608983033\",\"phoneUser\":\"\\u97e9\\u6d2a\\u5149\",\"idNumber\":\"232301197712126816\",\"idCardFrontUrl\":2122,\"idCardBackUrl\":2123,\"idCardInHandUrl\":2124,\"contactNumber\":\"18563981766\"}', 'json', '2017-04-15 07:40:58', '0000-00-00 00:00:00');
INSERT INTO `ticket` (`id`, `account_id`, `status_id`, `dept_id`, `topic_id`, `ip_address`, `source`, `is_answered`, `title`, `body`, `format`, `created`, `updated`) VALUES
(568, 0, 1, 2, 4, 123151, 'WEIXIN', 0, '[已付款]13165021517补资料,机主：邹晓媛', '{\"phoneNumber\":\"13165021517\",\"phoneUser\":\"\\u90b9\\u6653\\u5a9b\",\"idNumber\":\"130226197712296467\",\"idCardFrontUrl\":2126,\"idCardBackUrl\":2127,\"idCardInHandUrl\":2128,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74005422001201704217820799585,\\u652f\\u4ed8\\u65f6\\u95f4: 20170421161858, OPENID:oy_PKwUKwtpOSnHzUvc4Win2CBWQ\"}', 'json', '2017-04-21 16:18:01', '0000-00-00 00:00:00'),
(569, 0, 1, 2, 4, 123151, 'WEIXIN', 0, '[已付款]13165026078补资料,机主：李明广', '{\"phoneNumber\":\"13165026078\",\"phoneUser\":\"\\u674e\\u660e\\u5e7f\",\"idNumber\":\"372925198601232519\",\"idCardFrontUrl\":2129,\"idCardBackUrl\":2130,\"idCardInHandUrl\":2131,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74005422001201705232216862578,\\u652f\\u4ed8\\u65f6\\u95f4: 20170523163151, OPENID:oy_PKwUKwtpOSnHzUvc4Win2CBWQ\"}', 'json', '2017-05-23 16:31:31', '0000-00-00 00:00:00'),
(570, 0, 1, 2, 1, 123151, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2136,\"idCardBackUrl\":2137,\"idCardInHandUrl\":2138,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:38:50', '0000-00-00 00:00:00'),
(571, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2136,\"idCardBackUrl\":2137,\"idCardInHandUrl\":2138,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:39:11', '0000-00-00 00:00:00'),
(572, 0, 1, 2, 1, 123151, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2136,\"idCardBackUrl\":2137,\"idCardInHandUrl\":2138,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:39:45', '0000-00-00 00:00:00'),
(573, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2136,\"idCardBackUrl\":2137,\"idCardInHandUrl\":2138,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:40:06', '0000-00-00 00:00:00'),
(574, 0, 1, 2, 1, 123151, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2136,\"idCardBackUrl\":2137,\"idCardInHandUrl\":2138,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:40:34', '0000-00-00 00:00:00'),
(575, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2136,\"idCardBackUrl\":2137,\"idCardInHandUrl\":2138,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:40:55', '0000-00-00 00:00:00'),
(576, 0, 1, 2, 1, 123151, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2136,\"idCardBackUrl\":2137,\"idCardInHandUrl\":2138,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:41:55', '0000-00-00 00:00:00'),
(577, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2136,\"idCardBackUrl\":2137,\"idCardInHandUrl\":2138,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:42:16', '0000-00-00 00:00:00'),
(578, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2136,\"idCardBackUrl\":2137,\"idCardInHandUrl\":2138,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:43:03', '0000-00-00 00:00:00'),
(579, 0, 1, 2, 1, 1440, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2136,\"idCardBackUrl\":2137,\"idCardInHandUrl\":2138,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:43:24', '0000-00-00 00:00:00'),
(580, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:47:44', '0000-00-00 00:00:00'),
(581, 0, 1, 2, 1, 223104, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:48:05', '0000-00-00 00:00:00'),
(582, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:48:40', '0000-00-00 00:00:00'),
(583, 0, 1, 2, 1, 223104, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:49:01', '0000-00-00 00:00:00'),
(584, 0, 1, 2, 1, 101226, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:49:36', '0000-00-00 00:00:00'),
(585, 0, 1, 2, 1, 223104, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:49:57', '0000-00-00 00:00:00'),
(586, 0, 1, 2, 1, 123151, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:50:31', '0000-00-00 00:00:00'),
(587, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:50:52', '0000-00-00 00:00:00'),
(588, 0, 1, 2, 1, 123151, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:51:35', '0000-00-00 00:00:00'),
(589, 0, 1, 2, 1, 3977, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:51:56', '0000-00-00 00:00:00'),
(590, 0, 1, 2, 1, 123151, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:52:50', '0000-00-00 00:00:00'),
(591, 0, 1, 2, 1, 1440, 'WEIXIN', 0, '18363920370补资料,机主：张传强', '{\"phoneNumber\":\"18363920370\",\"phoneUser\":\"\\u5f20\\u4f20\\u5f3a\",\"idNumber\":\"370126199301135616\",\"idCardFrontUrl\":2139,\"idCardBackUrl\":2140,\"idCardInHandUrl\":2141,\"contactNumber\":\"13573276305\"}', 'json', '2017-05-24 06:53:11', '0000-00-00 00:00:00'),
(592, 0, 1, 2, 4, 101226, 'WEIXIN', 0, '[已付款]15615428717补资料,机主：马传松', '{\"phoneNumber\":\"15615428717\",\"phoneUser\":\"\\u9a6c\\u4f20\\u677e\",\"idNumber\":\"372928200103108311\",\"idCardFrontUrl\":2142,\"idCardBackUrl\":2143,\"idCardInHandUrl\":2144,\"contactNumber\":null,\"brand\":1,\"chargeMoney\":200,\"pay\":\"\\u652f\\u4ed8\\u6210\\u529f,\\u91d1\\u989d90\\u5143,\\u5fae\\u4fe1\\u8ba2\\u5355\\u53f74001542001201705272890503364,\\u652f\\u4ed8\\u65f6\\u95f4: 20170527194854, OPENID:oy_PKwaiSI7ewU4UEdFZGlGxRXCU\"}', 'json', '2017-05-27 19:48:42', '0000-00-00 00:00:00'),
(810, 6493, 1, 2, 17158, 1270, 'WEB', 0, '宽带办理;机主:栾晓东;手机:15718851473;地址:朝阳区上地三街', '{\"phoneNumber\":\"15718851473\",\"phoneUser\":\"\\u683e\\u6653\\u4e1c\",\"address\":\"\\u671d\\u9633\\u533a\\u4e0a\\u5730\\u4e09\\u8857\",\"data\":{\"title\":\"\\u5957\\u99102\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M2\\u5e74\",\"price\":1200,\"intro\":\"\\u8be6\\u7ec6\\u63cf\\u8ff0!\"}}', 'json', '2017-10-24 10:24:50', '0000-00-00 00:00:00'),
(811, 6493, 1, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:栾晓东;手机:15253213109;地址:朝阳区', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"\\u683e\\u6653\\u4e1c\",\"address\":\"\\u671d\\u9633\\u533a\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M1\\u5e74\",\"price\":600,\"intro\":\"\\u4e2d\\u56fd\\u8054\\u901a\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-10-24 10:29:13', '0000-00-00 00:00:00'),
(812, 6493, 1, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:栾晓东;手机:15253213109;地址:朝阳区上地三街', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"\\u683e\\u6653\\u4e1c\",\"address\":\"\\u671d\\u9633\\u533a\\u4e0a\\u5730\\u4e09\\u8857\",\"data\":{\"title\":\"\\u5957\\u99104\",\"name\":\"\\u9752\\u5c9b\\u79fb\\u52a8\\u5bbd\\u5e2650M100M \\u6d4b\\u8bd5\\u6570\\u636e\",\"group\":\"100M2\\u5e74\",\"price\":1480,\"intro\":\"\\u8be6\\u7ec6\\u63cf\\u8ff0\"}}', 'json', '2017-10-24 10:29:58', '0000-00-00 00:00:00'),
(813, 6493, 1, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:啊速度发;手机:15253213109;地址:朝阳区', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"\\u554a\\u901f\\u5ea6\\u53d1\",\"address\":\"\\u671d\\u9633\\u533a\",\"data\":{\"title\":\"\\u5957\\u99104\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"100M2\\u5e74\",\"price\":1680,\"intro\":\"\\u8be6\\u7ec6\\u63cf\\u8ff0\"}}', 'json', '2017-10-24 10:32:50', '0000-00-00 00:00:00'),
(814, 6493, 1, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:栾晓东;手机:15253213109;地址:朝阳区', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"\\u683e\\u6653\\u4e1c\",\"address\":\"\\u671d\\u9633\\u533a\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M1\\u5e74\",\"price\":600,\"intro\":\"\\u4e2d\\u56fd\\u8054\\u901a\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-10-24 10:33:49', '0000-00-00 00:00:00'),
(822, 6493, 2, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:栾晓东;手机:15253213109;地址:朝阳区', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"\\u683e\\u6653\\u4e1c\",\"address\":\"\\u671d\\u9633\\u533a\",\"data\":{\"title\":\"\\u5957\\u99102\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M2\\u5e74\",\"price\":1200,\"intro\":\"\\u8be6\\u7ec6\\u63cf\\u8ff0!\"}}', 'json', '2017-10-26 08:23:30', '0000-00-00 00:00:00'),
(827, 6493, 1, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:numst;手机:15253213109;地址:111', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"numst\",\"address\":\"111\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M1\\u5e74\",\"price\":600,\"intro\":\"\\u4e2d\\u56fd\\u8054\\u901a\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-10-26 17:38:06', '0000-00-00 00:00:00'),
(828, 6493, 1, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:numst;手机:15253213109;地址:111', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"numst\",\"address\":\"111\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M1\\u5e74\",\"price\":600,\"intro\":\"\\u4e2d\\u56fd\\u8054\\u901a\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-10-26 17:49:57', '0000-00-00 00:00:00'),
(829, 6493, 2, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:栾晓东;手机:15253213109;地址:111', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"\\u683e\\u6653\\u4e1c\",\"address\":\"111\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M1\\u5e74\",\"price\":600,\"intro\":\"\\u4e2d\\u56fd\\u8054\\u901a\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-10-27 08:58:13', '0000-00-00 00:00:00'),
(830, 6493, 2, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:栾晓东;手机:15253213109;地址:222', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"\\u683e\\u6653\\u4e1c\",\"address\":\"222\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u79fb\\u52a8\\u5bbd\\u5e2650M100M \\u6d4b\\u8bd5\\u6570\\u636e\",\"group\":\"50M1\\u5e74\",\"price\":500,\"intro\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-10-27 08:58:45', '0000-00-00 00:00:00'),
(831, 6493, 1, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:luan;手机:15253213109;地址:111', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"luan\",\"address\":\"111\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M1\\u5e74\",\"price\":600,\"intro\":\"\\u4e2d\\u56fd\\u8054\\u901a\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-10-27 08:59:17', '0000-00-00 00:00:00'),
(832, 6493, 1, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:luan;手机:15253213109;地址:222', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"luan\",\"address\":\"222\",\"data\":{\"title\":\"\\u5957\\u99102\",\"name\":\"\\u9752\\u5c9b\\u79fb\\u52a8\\u5bbd\\u5e2650M100M \\u6d4b\\u8bd5\\u6570\\u636e\",\"group\":\"50M2\\u5e74\",\"price\":1000,\"intro\":\"\\u8be6\\u7ec6\\u63cf\\u8ff0!\"}}', 'json', '2017-10-27 08:59:46', '0000-00-00 00:00:00'),
(833, 6493, 1, 1, 5, 2130706433, 'WEB', 0, '宽带办理;机主:测试;手机:15253213109;地址:111', '{\"phoneNumber\":\"15253213109\",\"phoneUser\":\"\\u6d4b\\u8bd5\",\"address\":\"111\",\"data\":{\"title\":\"\\u5957\\u99104\",\"name\":\"\\u9752\\u5c9b\\u79fb\\u52a8\\u5bbd\\u5e2650M100M \\u6d4b\\u8bd5\\u6570\\u636e\",\"group\":\"100M2\\u5e74\",\"price\":1480,\"intro\":\"\\u8be6\\u7ec6\\u63cf\\u8ff0\"}}', 'json', '2017-10-27 09:03:02', '0000-00-00 00:00:00'),
(834, 6593, 1, 1, 5, 192168, 'WEB', 0, '宽带办理;机主:44;手机:15764260893;地址:77', '{\"phoneNumber\":\"15764260893\",\"phoneUser\":\"44\",\"address\":\"77\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M1\\u5e74\",\"price\":600,\"intro\":\"\\u4e2d\\u56fd\\u8054\\u901a\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-11-07 10:17:35', '0000-00-00 00:00:00'),
(835, 6593, 1, 1, 5, 192168, 'WEB', 0, '宽带办理;机主:55;手机:15764260893;地址:55', '{\"phoneNumber\":\"15764260893\",\"phoneUser\":\"55\",\"address\":\"55\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u79fb\\u52a8\\u5bbd\\u5e2650M100M \\u6d4b\\u8bd5\\u6570\\u636e\",\"group\":\"50M1\\u5e74\",\"price\":500,\"intro\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-11-07 10:18:17', '0000-00-00 00:00:00'),
(836, 6594, 1, 1, 5, 192168, 'WEB', 0, '宽带办理;机主:44555;手机:13708999991;地址:44444', '{\"phoneNumber\":\"13708999991\",\"phoneUser\":\"44555\",\"address\":\"44444\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u79fb\\u52a8\\u5bbd\\u5e2650M100M \\u6d4b\\u8bd5\\u6570\\u636e\",\"group\":\"50M1\\u5e74\",\"price\":500,\"intro\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-11-07 10:42:33', '0000-00-00 00:00:00'),
(837, 6595, 1, 1, 5, 1270, 'WEB', 0, '宽带办理;机主:123;手机:13581145869;地址:1231', '{\"phoneNumber\":\"13581145869\",\"phoneUser\":\"123\",\"address\":\"1231\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M1\\u5e74\",\"price\":600,\"intro\":\"\\u4e2d\\u56fd\\u8054\\u901a\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-11-08 13:42:35', '0000-00-00 00:00:00'),
(838, 6593, 1, 1, 5, 192168, 'WEB', 0, '宽带办理;机主:fffff;手机:15764260893;地址:ffd', '{\"phoneNumber\":\"15764260893\",\"phoneUser\":\"fffff\",\"address\":\"ffd\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u8054\\u901a\\u8d85\\u725bplus\\u5bbd\\u5e2650M100M IPTV\",\"group\":\"50M1\\u5e74\",\"price\":600,\"intro\":\"\\u4e2d\\u56fd\\u8054\\u901a\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-11-08 15:35:57', '0000-00-00 00:00:00'),
(839, 6593, 1, 1, 5, 192168, 'WEB', 0, '宽带办理;机主:gg;手机:15764260893;地址:gg', '{\"phoneNumber\":\"15764260893\",\"phoneUser\":\"gg\",\"address\":\"gg\",\"data\":{\"title\":\"\\u5957\\u99101\",\"name\":\"\\u9752\\u5c9b\\u79fb\\u52a8\\u5bbd\\u5e2650M100M \\u6d4b\\u8bd5\\u6570\\u636e\",\"group\":\"50M1\\u5e74\",\"price\":500,\"intro\":\"\\u4e2d\\u56fd\\u79fb\\u52a8\\u5bbd\\u5e26\\u8d44\\u6e90\\u597d\\uff0c\\u8986\\u76d6\\u7387\\u9ad8\\uff0c\\u7a33\\u5b9a\\u4e0d\\u6389\\u7ebf \"}}', 'json', '2017-11-08 15:42:58', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `ticket_attachment`
--

CREATE TABLE `ticket_attachment` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `file_path` varchar(128) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ticket_department`
--

CREATE TABLE `ticket_department` (
  `id` int(11) NOT NULL,
  `dept_name` varchar(32) NOT NULL,
  `is_public` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ticket_department`
--

INSERT INTO `ticket_department` (`id`, `dept_name`, `is_public`, `created`, `updated`) VALUES
(1, 'ç³»ç»Ÿç»„', 1, '2016-09-10 00:00:00', '0000-00-00 00:00:00'),
(2, 'è¿ç»´ç»„', 1, '2016-09-10 00:00:00', '0000-00-00 00:00:00'),
(3, 'å®¢æœç»„', 1, '2016-09-10 00:00:00', '0000-00-00 00:00:00'),
(4, 'å”®åŽç»„', 1, '2016-09-10 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `ticket_priority`
--

CREATE TABLE `ticket_priority` (
  `id` int(11) NOT NULL,
  `priority` varchar(32) NOT NULL,
  `priority_desc` varchar(32) NOT NULL,
  `priority_color` varchar(7) NOT NULL,
  `priority_urgency` tinyint(4) NOT NULL,
  `is_public` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ticket_priority`
--

INSERT INTO `ticket_priority` (`id`, `priority`, `priority_desc`, `priority_color`, `priority_urgency`, `is_public`) VALUES
(1, 'low', 'Low', '#DDFFDD', 4, 1),
(2, 'normal', 'Normal', '#FFFFF0', 3, 1),
(3, 'high', 'High', '#FEE7E7', 2, 1),
(4, 'emergency', 'Emergency', '#FEE7E7', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ticket_status`
--

CREATE TABLE `ticket_status` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL DEFAULT '',
  `state` varchar(16) DEFAULT NULL,
  `mode` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `flags` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `properties` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ticket_status`
--

INSERT INTO `ticket_status` (`id`, `name`, `state`, `mode`, `flags`, `sort`, `properties`, `created`, `updated`) VALUES
(1, 'Open', 'open', 3, 0, 1, '{\"description\":\"Open tickets.\"}', '2016-09-09 12:02:36', '0000-00-00 00:00:00'),
(2, 'Resolved', 'closed', 1, 0, 2, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Resolved tickets\"}', '2016-09-09 12:02:36', '0000-00-00 00:00:00'),
(3, 'Closed', 'closed', 3, 0, 3, '{\"allowreopen\":true,\"reopenstatus\":0,\"description\":\"Closed tickets. Tickets will still be accessible on client and staff panels.\"}', '2016-09-09 12:02:36', '0000-00-00 00:00:00'),
(4, 'Archived', 'archived', 3, 0, 4, '{\"description\":\"Tickets only adminstratively available but no longer accessible on ticket queues and client panel.\"}', '2016-09-09 12:02:36', '0000-00-00 00:00:00'),
(5, 'Deleted', 'deleted', 3, 0, 5, '{\"description\":\"Tickets queued for deletion. Not accessible on ticket queues.\"}', '2016-09-09 12:02:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `ticket_topic`
--

CREATE TABLE `ticket_topic` (
  `id` int(11) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `is_public` tinyint(4) NOT NULL DEFAULT '1',
  `priority_id` tinyint(4) NOT NULL DEFAULT '1',
  `dept_id` tinyint(4) NOT NULL DEFAULT '0',
  `staff_id` int(11) NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL,
  `notes` text NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ticket_topic`
--

INSERT INTO `ticket_topic` (`id`, `is_active`, `is_public`, `priority_id`, `dept_id`, `staff_id`, `topic`, `notes`, `created`, `updated`) VALUES
(1, 0, 1, 1, 0, 0, '手机号码实名', '', '2016-09-09 00:00:00', '2016-09-09 00:00:00'),
(2, 0, 1, 1, 0, 0, '订单问题', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 0, 1, 1, 0, 0, '财务问题', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 1, 1, 1, 0, 0, '联通号码开卡', '', '2016-10-18 18:25:22', '2016-10-18 18:25:22'),
(5, 1, 1, 1, 0, 0, '宽带办理', '', '2017-09-26 10:56:03', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` char(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_level` tinyint(4) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `industry` tinyint(4) NOT NULL DEFAULT '0',
  `truename` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `openid` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '微信ID',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `audit_status` tinyint(11) UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_level`, `parent_id`, `remember_token`, `company`, `industry`, `truename`, `phone`, `address`, `openid`, `status`, `audit_status`, `created_at`, `updated_at`) VALUES
(1, 'root', 'y9902@163.com', '$2y$10$YvNocsWKvpER/V6LpbiHTuHz.WuKiP5DUiEe3pmYbZnNlElVOToii', 0, 0, '', '青岛全惠通网络科技有限公司', 12, '管理员', '18854200001', '青岛市黄岛香江路47号1006', '', 1, 0, '2017-09-27 22:30:17', '2017-09-27 22:30:17');

-- --------------------------------------------------------

--
-- 表的结构 `user_group`
--

CREATE TABLE `user_group` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '主键',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户组id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和所在的组关系表';

-- --------------------------------------------------------

--
-- 表的结构 `user_log`
--

CREATE TABLE `user_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `username` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录名',
  `login_ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登录IP',
  `log_level` enum('LOG','WARNING','ERROR') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '操作类型',
  `operation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作内容',
  `created_at` int(11) NOT NULL COMMENT '操作时间',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户操作记录表';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`title`,`script`) USING BTREE;

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sort` (`sort`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_name_unique` (`name`) USING BTREE;

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD KEY `permission_role_role_id_foreign` (`role_id`),
  ADD KEY `permission_id` (`permission_id`,`role_id`) USING BTREE;

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_name_unique` (`name`) USING BTREE;

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_attachment`
--
ALTER TABLE `ticket_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_department`
--
ALTER TABLE `ticket_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_priority`
--
ALTER TABLE `ticket_priority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_status`
--
ALTER TABLE `ticket_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `ticket_topic`
--
ALTER TABLE `ticket_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone` (`phone`),
  ADD KEY `users_email_unique` (`email`(191)) USING BTREE;

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `commands`
--
ALTER TABLE `commands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- 使用表AUTO_INCREMENT `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- 使用表AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- 使用表AUTO_INCREMENT `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=840;
--
-- 使用表AUTO_INCREMENT `ticket_attachment`
--
ALTER TABLE `ticket_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ticket_department`
--
ALTER TABLE `ticket_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `ticket_priority`
--
ALTER TABLE `ticket_priority`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `ticket_status`
--
ALTER TABLE `ticket_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `ticket_topic`
--
ALTER TABLE `ticket_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=302;
--
-- 使用表AUTO_INCREMENT `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- 使用表AUTO_INCREMENT `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 限制表 `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.4.15.4
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 產生時間： 2016 年 03 月 02 日 18:05
-- 伺服器版本: 5.5.48
-- PHP 版本： 5.5.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `admin_ss`
--

-- --------------------------------------------------------

--
-- 資料表結構 `ss_invite_code`
--

CREATE TABLE IF NOT EXISTS `ss_invite_code` (
  `id` int(11) NOT NULL,
  `code` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `ss_node`
--

CREATE TABLE IF NOT EXISTS `ss_node` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `type` int(3) NOT NULL,
  `server` varchar(128) NOT NULL,
  `method` varchar(64) NOT NULL,
  `custom_method` tinyint(1) NOT NULL DEFAULT '0',
  `traffic_rate` float NOT NULL DEFAULT '1',
  `info` varchar(128) NOT NULL,
  `status` varchar(128) NOT NULL,
  `offset` int(11) NOT NULL DEFAULT '0',
  `sort` int(3) NOT NULL,
  `gps_land` float NOT NULL DEFAULT '0',
  `gps_long` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 資料表結構 `ss_password_reset`
--

CREATE TABLE IF NOT EXISTS `ss_password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(32) NOT NULL,
  `token` varchar(128) NOT NULL,
  `init_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- 資料表結構 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(32) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `passwd` varchar(16) NOT NULL,
  `t` int(11) NOT NULL DEFAULT '0',
  `u` bigint(20) NOT NULL,
  `d` bigint(20) NOT NULL,
  `transfer_enable` bigint(20) NOT NULL,
  `port` int(11) NOT NULL,
  `switch` tinyint(4) NOT NULL DEFAULT '1',
  `enable` tinyint(4) NOT NULL DEFAULT '1',
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `last_get_gift_time` int(11) NOT NULL DEFAULT '0',
  `last_check_in_time` int(11) NOT NULL DEFAULT '0',
  `last_rest_pass_time` int(11) NOT NULL DEFAULT '0',
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invite_num` int(8) NOT NULL DEFAULT '0',
  `is_admin` int(2) NOT NULL DEFAULT '0',
  `ref_by` int(11) NOT NULL DEFAULT '0',
  `expire_time` int(11) NOT NULL DEFAULT '0',
  `method` varchar(64) NOT NULL DEFAULT 'aes-256-cfb',
  `is_email_verify` tinyint(4) NOT NULL DEFAULT '0',
  `reg_ip` varchar(128) NOT NULL DEFAULT '127.0.0.1',
  `credit` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user_packages`
--

CREATE TABLE IF NOT EXISTS `user_packages` (
  `id` int(11) NOT NULL,
  `packagename` varchar(255) NOT NULL,
  `package_traffic_m` bigint(20) NOT NULL DEFAULT '0',
  `package_from` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `package_due` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `package_enable` int(11) NOT NULL DEFAULT '1',
  `package_valid` int(11) NOT NULL DEFAULT '-1',
  `package_type` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user_purchase_hostory`
--

CREATE TABLE IF NOT EXISTS `user_purchase_hostory` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_info` text,
  `user_snapshot` text,
  `transaction_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user_token`
--

CREATE TABLE IF NOT EXISTS `user_token` (
  `id` int(11) NOT NULL,
  `token` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `expire_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user_traffic_log`
--

CREATE TABLE IF NOT EXISTS `user_traffic_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `u` int(11) NOT NULL,
  `d` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `rate` float NOT NULL,
  `traffic` bigint(32) NOT NULL,
  `log_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `ss_invite_code`
--
ALTER TABLE `ss_invite_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- 資料表索引 `ss_node`
--
ALTER TABLE `ss_node`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `ss_password_reset`
--
ALTER TABLE `ss_password_reset`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_packages`
--
ALTER TABLE `user_packages`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_purchase_hostory`
--
ALTER TABLE `user_purchase_hostory`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  ADD PRIMARY KEY (`id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `ss_invite_code`
--
ALTER TABLE `ss_invite_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `ss_node`
--
ALTER TABLE `ss_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `ss_password_reset`
--
ALTER TABLE `ss_password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user_packages`
--
ALTER TABLE `user_packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user_purchase_hostory`
--
ALTER TABLE `user_purchase_hostory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `user_traffic_log`
--
ALTER TABLE `user_traffic_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

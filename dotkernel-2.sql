-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2017 at 03:31 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dotkernel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isActive` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `email`, `firstName`, `lastName`, `dateCreated`, `isActive`) VALUES
(1, 'admin', '$2y$10$kC0ztOWgfx4i6e/6NeLvOejOMFhdv4tWVuhwfqmnEB0qMRkpmSivC', 'team@dotkernel.com', 'Default', 'Account', '2010-03-15 01:05:43', '1'),
(2, 'heunetik', '$2y$10$hSbdBtxwK6P4cgvbt9nJeejycNU.PmDTz6MbBRzUTrd2XMYe5dimi', 'heunetik@gmail.com', 'Szabo', 'Akos', '2017-08-02 09:30:49', '1'),
(4, 'bianca', '$2y$10$.cv3pjr/fgnoit6pRUdf0uXdTmv7KJX12bRpHHKJoNMWWQatCA.NO', 'biancamemetea94@gmail.com', 'Memetea', 'Bianca', '2017-08-04 11:50:22', '1');

-- --------------------------------------------------------

--
-- Table structure for table `adminlogin`
--

CREATE TABLE `adminlogin` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adminId` int(11) UNSIGNED NOT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateLogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adminlogin`
--

INSERT INTO `adminlogin` (`id`, `ip`, `adminId`, `referer`, `userAgent`, `dateLogin`) VALUES
(1, '127.0.0.1', 1, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:52:40'),
(2, '127.0.0.1', 1, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-02 09:28:14'),
(3, '127.0.0.1', 1, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-02 09:29:13'),
(4, '127.0.0.1', 2, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-02 09:31:26'),
(5, '127.0.0.1', 2, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-02 10:44:13'),
(6, '127.0.0.1', 2, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-03 08:17:17'),
(7, '127.0.0.1', 2, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-03 10:43:47'),
(8, '::1', 1, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-04 11:49:57'),
(9, '::1', 4, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-04 11:50:29'),
(10, '::1', 4, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-04 13:26:34'),
(11, '::1', 4, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-07 09:33:15'),
(12, '::1', 4, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-07 10:51:48'),
(13, '::1', 4, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-08 09:22:25'),
(14, '::1', 4, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-08 11:13:36'),
(15, '::1', 1, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-09 08:36:14'),
(16, '::1', 4, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-16 09:14:18'),
(17, '::1', 4, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-16 11:45:59'),
(18, '::1', 4, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36', '2017-08-17 09:45:35'),
(19, '::1', 1, 'http://localhost/bia/admin/admin/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '2017-08-21 11:02:05'),
(20, '::1', 1, 'http://localhost/biu/admin/admin/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '2017-08-24 11:03:41'),
(21, '::1', 4, 'http://localhost/biu/admin/admin/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '2017-08-25 10:18:41'),
(22, '::1', 1, 'http://localhost/biu/admin/admin/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '2017-08-25 13:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `content`, `date`) VALUES
(13, 'dsa\r\n', '2017-08-02 11:41:26'),
(35, '1111111111', '2017-08-23 09:51:06'),
(36, '2222222222222', '2017-08-22 22:01:36'),
(37, 'yhjnyg', '2017-08-22 10:38:21');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `postId` int(11) NOT NULL COMMENT 'To which post does the comment belong',
  `parent` int(11) NOT NULL COMMENT '0 if top level, parent comment ID otherwise',
  `content` text NOT NULL COMMENT 'Comment content',
  `userId` int(11) NOT NULL COMMENT 'Which user commented',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `admin` enum('N','Y') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `postId`, `parent`, `content`, `userId`, `date`, `admin`) VALUES
(1, 13, 0, '33333333', 1, '2017-08-24 09:36:23', 'N'),
(18, 13, 0, 'ewfredg', 1, '2017-08-09 09:21:48', 'N'),
(44, 35, 43, 'damnit', 1, '2017-08-23 10:13:47', 'N'),
(48, 35, 43, 'qrt', 2, '2017-08-23 11:58:12', 'N'),
(62, 13, 18, 'biu', 4, '2017-08-24 22:19:35', 'Y'),
(63, 35, 0, 'fdgfd', 4, '2017-08-24 22:27:14', 'N'),
(65, 13, 1, 'xxxxxxxxxxxxxx', 4, '2017-08-24 22:35:23', 'Y'),
(72, 13, 1, 'rrrrrrrr', 4, '2017-08-24 23:10:22', 'Y'),
(78, 13, 64, 'fre', 4, '2017-08-24 23:36:44', 'Y'),
(82, 13, 1, 'bbbbbbbb', 4, '2017-08-25 00:12:20', 'Y'),
(83, 13, 0, 'rrrrrrrrrrrrrrrrrrrrrrrrrr', 4, '2017-08-25 01:04:47', 'Y'),
(84, 13, 83, 'buuuuuuuu', 4, '2017-08-25 01:04:59', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `commentrating`
--

CREATE TABLE `commentrating` (
  `id` int(11) NOT NULL,
  `postId` int(11) NOT NULL COMMENT 'Which post',
  `userId` int(11) NOT NULL COMMENT 'By which user',
  `rating` int(1) NOT NULL COMMENT 'Rated (yes/no - 1/0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL COMMENT 'Post ID',
  `authorId` int(11) NOT NULL COMMENT 'Author ID',
  `title` varchar(25) NOT NULL COMMENT 'Post Title',
  `content` text NOT NULL COMMENT 'Content',
  `type` int(1) NOT NULL COMMENT '0 for text, 1 for media',
  `sub` varchar(10) NOT NULL COMMENT 'Category (subreddit)',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `postrating`
--

CREATE TABLE `postrating` (
  `id` int(11) NOT NULL,
  `postId` int(11) NOT NULL COMMENT 'Which post',
  `userId` int(11) NOT NULL COMMENT 'By which user',
  `rating` int(1) NOT NULL COMMENT 'Rated (yes/no - 1/0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `key` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isEditable` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `type` enum('radio','option','textarea') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'textarea',
  `possibleValues` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `key`, `value`, `title`, `comment`, `isEditable`, `type`, `possibleValues`) VALUES
(1, 'siteEmail', 'contact@dotkernel.com', 'Site Email Address', 'The email address that recieves all contact emails from the site.\r\nAlso used as Sender Email for \'forgot password\'.', '1', 'textarea', ''),
(2, 'devEmails', 'team@dotkernel.com', 'Developer Emails', 'developer emails, for debug purpose, separated by comma', '0', 'textarea', ''),
(3, 'timeFormatShort', '%d %b %Y', 'Short Date/Time Format.', '%d - day of the month as a decimal number (range 01 to 31) %b - abbreviated month name according to the current locale %B - full month name according to the current locale %m - month as a decimal number (range 01 to 12) %y - year as a decimal number without a century (range 00 to 99) %Y - year as a decimal number including the century', '1', 'option', '%d %b %Y;%d %B %Y;%d %B %y;%d %m %Y;%d %m %y;%B %d, %Y;%b %d, %Y'),
(4, 'timeFormatLong', '%b %d, %Y, %H:%M', 'Long Date/Time Format.', 'Date/time format, including hours, minutes and seconds', '1', 'option', '%d %b %Y, %H:%M;%d %B %Y, %H:%M;%d %B %y, %H:%M;%d %m %Y, %H:%M;%d %m %y, %H:%M;%B %d, %Y, %H:%M;%b %d, %Y, %H:%M'),
(7, 'resultsPerPage', '5', 'Default results per page', 'How many records will be on every page, if is not specified otherwise by a specific configuration value', '1', 'option', '5;10;20;30;40;50'),
(8, 'whoisUrl', 'http://whois.domaintools.com', '', 'Whois lookup and Domain name search', '0', 'textarea', ''),
(9, 'paginationStep', '3', 'Pagination Step', 'The maximum number of pages that are shown on either side of the current page in the pagination header.', '1', 'option', '3;4;5;6;7;8;9;10');

-- --------------------------------------------------------

--
-- Table structure for table `statisticvisit`
--

CREATE TABLE `statisticvisit` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proxyIp` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accept` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceptLanguage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceptEncoding` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `acceptCharset` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cacheControl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cookie` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xWapProfile` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xForwardedFor` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xForwardedHost` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xForwardedServer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateHit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statisticvisitmobile`
--

CREATE TABLE `statisticvisitmobile` (
  `id` int(11) UNSIGNED NOT NULL,
  `visitId` int(11) UNSIGNED NOT NULL,
  `fallBack` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brandName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browserName` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `browserVersion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceOs` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deviceOsVersion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screenWidth` int(6) NOT NULL,
  `screenHeight` int(6) NOT NULL,
  `isTablet` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `isMobile` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `isSmartphone` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `isIphone` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `isAndroid` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `isBlackberry` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `isSymbian` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `isWindowsMobile` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub`
--

CREATE TABLE `sub` (
  `id` int(11) NOT NULL,
  `subName` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastName` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isActive` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `firstName`, `lastName`, `dateCreated`, `isActive`) VALUES
(1, 'heunetik', '$2y$10$KnN13iX1Kn2/tbgnnIZ1nO5ElvQAc331BMv1eR/ukFpzCHSyUfVP2', 'test@test.com', 'Szabo', 'Akos', '2017-08-01 11:08:53', '1'),
(2, 'gigi', '$2y$10$gHJn8tsBLWAEHoV0J3Y0F.dIiQ9QutRsA17J183xcjapVov/lhyq.', 'gigi@dot.com', '', '', '2017-08-18 14:22:49', '1');

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE `userlogin` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateLogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userlogin`
--

INSERT INTO `userlogin` (`id`, `ip`, `country`, `userId`, `referer`, `userAgent`, `dateLogin`) VALUES
(1, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/register', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 11:08:53'),
(2, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:31:57'),
(3, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:33:50'),
(4, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:35:39'),
(5, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:36:11'),
(6, '::1', 'NA', 2, 'http://localhost/bia/user/register', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '2017-08-18 14:22:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminId` (`adminId`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commentrating`
--
ALTER TABLE `commentrating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postrating`
--
ALTER TABLE `postrating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `statisticvisit`
--
ALTER TABLE `statisticvisit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statisticvisitmobile`
--
ALTER TABLE `statisticvisitmobile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `visitId` (`visitId`);

--
-- Indexes for table `sub`
--
ALTER TABLE `sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminId` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `adminlogin`
--
ALTER TABLE `adminlogin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;
--
-- AUTO_INCREMENT for table `commentrating`
--
ALTER TABLE `commentrating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Post ID';
--
-- AUTO_INCREMENT for table `postrating`
--
ALTER TABLE `postrating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `statisticvisit`
--
ALTER TABLE `statisticvisit`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `statisticvisitmobile`
--
ALTER TABLE `statisticvisitmobile`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sub`
--
ALTER TABLE `sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `userlogin`
--
ALTER TABLE `userlogin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminlogin`
--
ALTER TABLE `adminlogin`
  ADD CONSTRAINT `fk_adminLogin_admin` FOREIGN KEY (`adminId`) REFERENCES `admin` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `statisticvisitmobile`
--
ALTER TABLE `statisticvisitmobile`
  ADD CONSTRAINT `statisticVisitMobile_ibfk_1` FOREIGN KEY (`visitId`) REFERENCES `statisticvisit` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `userlogin`
--
ALTER TABLE `userlogin`
  ADD CONSTRAINT `fk_userLogin_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 03, 2017 at 03:50 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.1.7-1+ubuntu16.04.1+deb.sury.org+1

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
(2, 'heunetik', '$2y$10$hSbdBtxwK6P4cgvbt9nJeejycNU.PmDTz6MbBRzUTrd2XMYe5dimi', 'heunetik@gmail.com', 'Szabo', 'Akos', '2017-08-02 09:30:49', '1');

-- --------------------------------------------------------

--
-- Table structure for table `adminLogin`
--

CREATE TABLE `adminLogin` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adminId` int(11) UNSIGNED NOT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateLogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adminLogin`
--

INSERT INTO `adminLogin` (`id`, `ip`, `adminId`, `referer`, `userAgent`, `dateLogin`) VALUES
(1, '127.0.0.1', 1, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:52:40'),
(2, '127.0.0.1', 1, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-02 09:28:14'),
(3, '127.0.0.1', 1, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-02 09:29:13'),
(4, '127.0.0.1', 2, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-02 09:31:26'),
(5, '127.0.0.1', 2, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-02 10:44:13'),
(6, '127.0.0.1', 2, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-03 08:17:17'),
(7, '127.0.0.1', 2, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-03 10:43:47');

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
(13, 'Heheh. Eh', '2017-08-02 11:01:57'),
(16, 'Testing', '2017-08-02 11:41:19'),
(17, 'Another one', '2017-08-02 11:41:23'),
(18, 'We need more', '2017-08-02 11:41:26'),
(19, 'Put more stuff', '2017-08-02 11:41:29'),
(20, 'Adding more stuff', '2017-08-03 08:42:47'),
(21, '12345', '2017-08-03 08:51:58'),
(22, 'New content', '2017-08-03 10:55:43');

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
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `commentRating`
--

CREATE TABLE `commentRating` (
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
-- Table structure for table `postRating`
--

CREATE TABLE `postRating` (
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
-- Table structure for table `statisticVisit`
--

CREATE TABLE `statisticVisit` (
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
-- Table structure for table `statisticVisitMobile`
--

CREATE TABLE `statisticVisitMobile` (
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
(1, 'heunetik', '$2y$10$KnN13iX1Kn2/tbgnnIZ1nO5ElvQAc331BMv1eR/ukFpzCHSyUfVP2', 'test@test.com', 'Szabo', 'Akos', '2017-08-01 11:08:53', '1');

-- --------------------------------------------------------

--
-- Table structure for table `userLogin`
--

CREATE TABLE `userLogin` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `userAgent` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `dateLogin` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userLogin`
--

INSERT INTO `userLogin` (`id`, `ip`, `country`, `userId`, `referer`, `userAgent`, `dateLogin`) VALUES
(1, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/register', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 11:08:53'),
(2, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:31:57'),
(3, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:33:50'),
(4, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:35:39'),
(5, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:36:11');

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
-- Indexes for table `adminLogin`
--
ALTER TABLE `adminLogin`
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
-- Indexes for table `commentRating`
--
ALTER TABLE `commentRating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `postRating`
--
ALTER TABLE `postRating`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `statisticVisit`
--
ALTER TABLE `statisticVisit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statisticVisitMobile`
--
ALTER TABLE `statisticVisitMobile`
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
-- Indexes for table `userLogin`
--
ALTER TABLE `userLogin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminId` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `adminLogin`
--
ALTER TABLE `adminLogin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `commentRating`
--
ALTER TABLE `commentRating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Post ID';
--
-- AUTO_INCREMENT for table `postRating`
--
ALTER TABLE `postRating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `statisticVisit`
--
ALTER TABLE `statisticVisit`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `statisticVisitMobile`
--
ALTER TABLE `statisticVisitMobile`
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `userLogin`
--
ALTER TABLE `userLogin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminLogin`
--
ALTER TABLE `adminLogin`
  ADD CONSTRAINT `fk_adminLogin_admin` FOREIGN KEY (`adminId`) REFERENCES `admin` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `statisticVisitMobile`
--
ALTER TABLE `statisticVisitMobile`
  ADD CONSTRAINT `statisticVisitMobile_ibfk_1` FOREIGN KEY (`visitId`) REFERENCES `statisticVisit` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `userLogin`
--
ALTER TABLE `userLogin`
  ADD CONSTRAINT `fk_userLogin_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 28, 2017 at 01:56 PM
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
(4, '127.0.0.1', 2, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-02 09:31:26'),
(5, '127.0.0.1', 2, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-02 10:44:13'),
(6, '127.0.0.1', 2, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-03 08:17:17'),
(7, '127.0.0.1', 2, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-03 10:43:47'),
(8, '127.0.0.1', 2, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-04 09:34:57'),
(9, '127.0.0.1', 2, 'http://localhost/dotkernel/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-07 12:05:54'),
(10, '89.34.170.180', 2, 'http://89.34.170.180/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-18 12:48:03'),
(11, '79.117.17.176', 2, 'http://89.34.170.180/CITit/admin/admin/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0', '2017-08-18 14:14:42'),
(12, '89.34.170.180', 2, 'http://89.34.170.180/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-22 13:25:14'),
(13, '89.34.170.180', 2, 'http://89.34.170.180/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-23 14:01:20'),
(14, '::1', 2, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-23 18:20:32'),
(15, '::1', 2, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-23 18:23:04'),
(16, '::1', 2, 'http://localhost/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-23 18:23:45'),
(17, '89.34.170.180', 2, 'http://89.34.170.180/CITit/admin/admin/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-24 12:48:20');

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL COMMENT 'Post ID',
  `authorId` int(11) NOT NULL COMMENT 'Author ID',
  `title` varchar(25) NOT NULL COMMENT 'Post Title',
  `content` text NOT NULL COMMENT 'Content',
  `type` int(1) NOT NULL COMMENT '0 for text, 1 for media',
  `sub` varchar(10) NOT NULL COMMENT 'Category (subreddit)',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `authorId`, `title`, `content`, `type`, `sub`, `date`) VALUES
(1, 1, 'theOne', 'This is the database test', 0, 'main', '2017-08-16 20:46:46'),
(2, 1, '2nd stuff', '2nd comment data stiff', 0, 'main', '2017-08-16 20:46:48'),
(3, 1, 'IMGUR test', 'http://imgur.com/a/twP6C', 1, 'main', '2017-08-16 20:46:48'),
(4, 1, 'GOOGLE test', 'www.google.com', 1, 'main', '2017-08-16 20:46:48'),
(5, 1, 'FIRST', 'testiiiiiiing', 0, 'main', '2017-08-17 14:39:00'),
(6, 1, 'IMGUR post', 'http://imgur.com/a/4f3XB', 1, 'main', '2017-08-17 14:39:30'),
(7, 1, 'IMGUR post', 'http://imgur.com/a/4f3XB', 1, 'main', '2017-08-17 14:42:01'),
(8, 1, 'Testing', 'http://imgur.com/a/4f3XB', 1, 'main', '2017-08-17 14:42:08'),
(9, 7, 'dfgh', 'http://imgur.com/a/h5lsq', 1, 'main', '2017-08-17 15:23:39'),
(10, 1, 'test bug', 'testbug', 1, 'main', '2017-08-18 09:53:24'),
(11, 1, 'beginshere', 'imgur.com/gallery/twP6C', 0, 'main', '2017-08-18 10:01:50'),
(12, 1, 'testv2', 'http://www.imgur.com/gallery/twP6C', 1, 'main', '2017-08-18 10:02:17'),
(13, 1, 'teeees', 'http://imgur.com/gallery/twP6C', 1, 'teeest', '2017-08-18 10:02:57'),
(14, 1, 'Cheeeeeck222', 'testing.com', 0, 'main', '2017-08-18 10:32:45'),
(15, 1, 'testtttt', 'test.com', 0, 'main', '2017-08-18 10:34:12'),
(16, 1, 'testtttt', 'asd.com', 0, 'main', '2017-08-18 10:35:42'),
(17, 1, 'TESRSARSARSA', 'http://hopingitworks.org', 1, 'main', '2017-08-18 10:36:46'),
(18, 1, 'google', 'http://google.com', 1, 'main', '2017-08-18 10:37:42'),
(19, 1, 'google', 'http://google.com', 1, 'main', '2017-08-18 10:37:57'),
(20, 1, 'imgur', 'http://imgur.com/a/4f3XB', 1, 'main', '2017-08-18 10:38:15'),
(21, 1, 'imgurtext', 'imgur.com/a/4f3XB', 0, 'main', '2017-08-18 10:38:34'),
(22, 1, 'imgur test', 'http://imgur.com/a/4f3XB', 1, 'main', '2017-08-18 10:40:44'),
(23, 1, 'imgur 2nd test', 'imgur.com/a/4f3XB', 0, 'main', '2017-08-18 10:41:04'),
(24, 1, 'googletest2', 'http://google.com', 1, 'main', '2017-08-18 10:44:42'),
(25, 1, 'imgursingle', 'https://i.imgur.com/LaYxFCL.jpg', 1, 'main', '2017-08-18 10:51:05'),
(26, 1, 'imgursingle2', 'http://i.imgur.com/LaYxFCL.jpg', 1, 'main', '2017-08-18 10:52:10'),
(27, 1, 'imgurlast', 'http://i.imgur.com/LaYxFCL.jpg', 1, 'main', '2017-08-18 11:00:28'),
(28, 1, 'snu', 'http://i.imgur.com/lX4gFKB.png', 1, 'main', '2017-08-18 11:01:50'),
(29, 7, 'Kappa', 'http://i0.kym-cdn.com/photos/images/facebook/000/925/494/218.png', 1, 'main', '2017-08-18 11:12:55'),
(30, 1, 'test', 'http://imgur.com/a/4f3XB', 1, 'main', '2017-08-22 09:43:52'),
(31, 1, 'reeeee', 'http://imgur.com/a/4f3XB', 1, 'main', '2017-08-22 09:44:14'),
(32, 1, 'test', 'http://imgur.com/a/4f3XB', 1, 'main', '2017-08-22 09:44:26'),
(33, 8, 'Salut', 'serbus', 0, 'ceva', '2017-08-25 12:03:25');

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

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `postId`, `parent`, `content`, `userId`, `date`) VALUES
(149, 1, 0, '[deleted]', 0, '2017-08-17 11:25:27'),
(150, 1, 0, '[deleted]', 0, '2017-08-17 11:26:59'),
(151, 1, 0, '&lt;script&gt;alert(1);&lt;/script&gt;', 1, '2017-08-17 11:27:44'),
(152, 1, 0, 'test', 1, '2017-08-17 12:10:09'),
(153, 1, 0, 'test', 1, '2017-08-17 12:11:26'),
(154, 1, 0, 'test', 1, '2017-08-17 12:12:21'),
(155, 1, 0, 'teeeee', 1, '2017-08-17 12:12:32'),
(156, 1, 0, 'test', 1, '2017-08-17 12:13:47'),
(157, 1, 0, 'test', 1, '2017-08-17 12:14:14'),
(158, 2, 0, '💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩', 7, '2017-08-17 12:37:16'),
(159, 2, 158, '💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩', 7, '2017-08-17 12:37:52'),
(160, 2, 158, '💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩💩', 7, '2017-08-17 12:38:16'),
(161, 2, 0, '[deleted]', 0, '2017-08-17 12:38:58'),
(162, 2, 161, '[deleted]', 0, '2017-08-17 12:39:06'),
(163, 2, 0, '[deleted]', 0, '2017-08-17 12:39:42'),
(164, 2, 163, '╭☞( ͡ ͡&deg; ͜ ʖ ͡ ͡&deg;)╭☞ ', 7, '2017-08-17 12:39:59'),
(165, 2, 163, '---- \\　.　.\\ 　', 7, '2017-08-17 12:40:06'),
(166, 2, 163, '---- \\　 .　\\ ', 7, '2017-08-17 12:40:15'),
(167, 2, 163, '---- / ╰U╯\\ do you like what you see', 7, '2017-08-17 12:40:23'),
(168, 2, 158, '[deleted]', 0, '2017-08-17 12:41:16'),
(169, 2, 158, '✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪✪', 7, '2017-08-17 12:44:40'),
(170, 3, 0, 'sd', 7, '2017-08-17 13:11:30'),
(171, 3, 0, '10/10', 4, '2017-08-17 13:13:00'),
(172, 3, 170, 'hd', 4, '2017-08-17 13:13:05'),
(174, 2, 163, '\'tf', 4, '2017-08-17 13:14:04'),
(175, 4, 0, 'AAECAR8GxQj+DM6uAsLOAsbOAobTAgyoArUD6wfbCe0JubQC6rsC7LsCicMCjsMC080Cps4CAA==', 7, '2017-08-17 15:22:26'),
(176, 9, 0, 'beautiful', 7, '2017-08-17 15:23:57'),
(177, 3, 0, 'http://i0.kym-cdn.com/photos/images/facebook/000/925/494/218.png', 7, '2017-08-18 11:12:14'),
(178, 30, 0, ':shit:', 7, '2017-08-18 11:13:46'),
(179, 3, 177, 'http://i0.kym-cdn.com/photos/images/facebook/000/925/494/218.png_large', 1, '2017-08-18 11:34:25'),
(180, 3, 0, 'http://i0.kym-cdn.com/photos/images/facebook/000/925/494/218.png_large', 1, '2017-08-18 11:46:20'),
(181, 30, 0, 'http://i0.kym-cdn.com/photos/images/facebook/000/925/494/218.png_large', 7, '2017-08-18 11:48:18'),
(182, 30, 181, 'http://i0.kym-cdn.com/photos/images/facebook/000/925/494/218.png_large', 1, '2017-08-18 11:51:42'),
(183, 3, 170, '[deleted]', 0, '2017-08-18 14:08:24'),
(184, 3, 0, 'Uj comment', 1, '2017-08-18 14:08:43'),
(185, 4, 0, 'http://tanitoikincseim.lapunk.hu/tarhely/tanitoikincseim/kepek/alma_sablon.jpg', 1, '2017-08-18 14:10:04'),
(186, 4, 185, '[deleted]', 0, '2017-08-19 13:54:21'),
(187, 1, 149, 'testeeer', 1, '2017-08-21 13:06:20'),
(188, 1, 149, '[deleted]', 0, '2017-08-21 13:07:34'),
(189, 1, 149, 'reeee', 1, '2017-08-21 13:21:50'),
(190, 1, 149, '[deleted]', 0, '2017-08-21 13:21:54'),
(191, 1, 0, 'testy', 1, '2017-08-21 13:53:50'),
(192, 1, 152, 'testy', 1, '2017-08-21 14:31:36'),
(193, 1, 149, '[deleted]', 1, '2017-08-21 14:42:10'),
(194, 1, 150, 'af', 7, '2017-08-21 14:47:58'),
(195, 1, 0, '&lt;script&gt;alert(1);&lt;/script&gt;', 7, '2017-08-21 14:48:49'),
(196, 5, 0, '[deleted]', 0, '2017-08-21 15:25:03'),
(197, 9, 176, 'test', 1, '2017-08-21 16:04:53'),
(198, 5, 196, 'SZLAMB', 7, '2017-08-21 16:40:07'),
(199, 1, 149, '[deleted]', 0, '2017-08-21 17:03:33'),
(200, 1, 149, 'Sdde', 7, '2017-08-21 17:04:47'),
(201, 30, 0, 'test', 1, '2017-08-22 12:46:13'),
(207, 30, 0, 'tester', 1, '2017-08-22 12:52:32'),
(208, 30, 0, 'rerrr', 1, '2017-08-22 12:54:37'),
(209, 30, 0, 'retst', 1, '2017-08-22 12:54:54'),
(210, 30, 0, 'tet', 1, '2017-08-22 12:56:47'),
(211, 30, 0, 'rettt', 1, '2017-08-22 13:02:20'),
(212, 30, 0, 'reterretetet', 1, '2017-08-22 13:03:35'),
(213, 6, 0, 'asd', 7, '2017-08-22 13:05:18'),
(214, 30, 0, 'testme', 1, '2017-08-22 13:12:06'),
(215, 30, 0, 'test', 1, '2017-08-22 13:15:33'),
(216, 30, 0, 'weee', 1, '2017-08-22 13:16:21'),
(217, 30, 0, 'test', 1, '2017-08-22 13:16:49'),
(218, 30, 0, 'errqer', 1, '2017-08-22 13:17:10'),
(219, 30, 0, 'eqereq', 1, '2017-08-22 13:19:17'),
(220, 30, 0, 'qqq', 1, '2017-08-22 13:19:35'),
(221, 30, 0, 'rrrrrrrrrrrrr', 1, '2017-08-22 13:20:40'),
(222, 7, 0, 'rereewrewr', 1, '2017-08-22 13:21:05'),
(223, 7, 0, 'rewr', 1, '2017-08-22 13:21:14'),
(224, 7, 0, 'rrrrrr', 1, '2017-08-22 13:21:24'),
(225, 7, 0, 'erererere', 1, '2017-08-22 13:22:49'),
(226, 7, 225, 'tertrete', 1, '2017-08-22 13:22:53'),
(227, 4, 0, 'Testing asd123', 1, '2017-08-22 19:33:49'),
(228, 21, 0, '[deleted]', 0, '2017-08-23 12:36:27'),
(229, 21, 228, '[deleted]', 0, '2017-08-23 12:36:32'),
(230, 25, 0, 'wow!', 1, '2017-08-24 12:01:13'),
(231, 4, 0, 'asd', 1, '2017-08-24 12:35:13'),
(232, 1, 149, '[deleted]', 0, '2017-08-24 12:50:13'),
(233, 1, 150, '[deleted]', 0, '2017-08-24 12:50:38'),
(234, 33, 0, '[deleted]', 0, '2017-08-25 12:03:50'),
(235, 33, 0, '[deleted]', 0, '2017-08-25 12:03:52'),
(236, 33, 235, 'sms', 7, '2017-08-25 13:33:55');

-- --------------------------------------------------------

--
-- Table structure for table `commentRating`
--

CREATE TABLE `commentRating` (
  `id` int(11) NOT NULL,
  `postId` int(11) NOT NULL COMMENT 'Which post',
  `userId` int(11) NOT NULL COMMENT 'By which user',
  `rating` int(1) NOT NULL COMMENT 'Rated (yes/no - 1/0)',
  `articleId` int(9) NOT NULL COMMENT 'The article on which the comment is posted'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `commentRating`
--

INSERT INTO `commentRating` (`id`, `postId`, `userId`, `rating`, `articleId`) VALUES
(35, 178, 1, 1, 30),
(36, 197, 7, 1, 9),
(37, 176, 7, 1, 9),
(38, 182, 1, 0, 30),
(39, 181, 1, 1, 30),
(40, 201, 1, -1, 30),
(41, 221, 1, -1, 30),
(42, 207, 1, 0, 30),
(43, 222, 1, 0, 7),
(44, 223, 1, 0, 7),
(45, 224, 1, -1, 7),
(46, 225, 1, -1, 7),
(47, 196, 1, 0, 5),
(48, 198, 1, -1, 5),
(49, 170, 1, 1, 3),
(50, 172, 1, -1, 3),
(51, 170, 8, 1, 3),
(52, 172, 8, -1, 3),
(53, 183, 8, 1, 3),
(54, 177, 8, -1, 3),
(55, 179, 8, -1, 3),
(56, 180, 8, -1, 3),
(57, 171, 1, 1, 3),
(58, 175, 1, -1, 4),
(60, 186, 1, -1, 4),
(61, 227, 1, 1, 4),
(62, 149, 1, 1, 1),
(63, 187, 1, -1, 1),
(65, 0, 1, 1, 1),
(66, 0, 1, -1, 19),
(67, 0, 1, 0, 2),
(68, 188, 1, 0, 1),
(69, 0, 1, 1, 3),
(70, 158, 1, -1, 2),
(71, 0, 7, 1, 1),
(72, 0, 7, 1, 8),
(73, 0, 7, -1, 21),
(74, 228, 7, 1, 21),
(75, 229, 7, 1, 21),
(76, 158, 7, 1, 2),
(77, 159, 7, 1, 2),
(78, 169, 7, 1, 2),
(79, 160, 7, 1, 2),
(80, 163, 7, 1, 2),
(81, 167, 7, 1, 2),
(82, 189, 1, 0, 1),
(83, 0, 6, 1, 1),
(84, 187, 6, 1, 1),
(85, 149, 6, 1, 1),
(86, 188, 6, 1, 1),
(87, 0, 6, -1, 2),
(88, 158, 6, 1, 2),
(89, 159, 6, 1, 2),
(90, 167, 6, 1, 2),
(91, 0, 1, -1, 21),
(92, 230, 1, 1, 25),
(93, 231, 1, 1, 4),
(94, 0, 1, 1, 25),
(95, 177, 1, 0, 3),
(96, 0, 1, 0, 10),
(97, 0, 1, 0, 4),
(98, 0, 1, 1, 15),
(99, 0, 1, -1, 18),
(100, 0, 1, 1, 30),
(101, 0, 1, 1, 31),
(102, 0, 8, 0, 31),
(103, 0, 8, 1, 33),
(104, 183, 1, 1, 3),
(105, 0, 7, 1, 33),
(106, 235, 7, -1, 33),
(107, 236, 7, 1, 33),
(108, 0, 7, 1, 3),
(109, 179, 7, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `content`, `date`) VALUES
(13, 'Heheh. Eh 12345', '2017-08-02 11:01:57'),
(16, 'Testing', '2017-08-02 11:41:19'),
(17, 'Another one', '2017-08-02 11:41:23'),
(18, 'We need more', '2017-08-02 11:41:26'),
(19, 'Put more stuff', '2017-08-02 11:41:29'),
(20, 'Adding more stuff', '2017-08-03 08:42:47'),
(21, '12345', '2017-08-03 08:51:58'),
(22, 'New content', '2017-08-03 10:55:43');

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

--
-- Dumping data for table `statisticVisit`
--

INSERT INTO `statisticVisit` (`id`, `ip`, `proxyIp`, `carrier`, `country`, `accept`, `acceptLanguage`, `acceptEncoding`, `acceptCharset`, `userAgent`, `cacheControl`, `cookie`, `xWapProfile`, `xForwardedFor`, `xForwardedHost`, `xForwardedServer`, `referer`, `dateHit`) VALUES
(1, '82.137.13.246', '82.137.13.246', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '', '', '', '', '', '', 'http://89.34.170.180/', '2017-08-09 15:13:28'),
(2, '79.117.38.240', '79.117.38.240', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '', 'PHPSESSID=ubiq0tplpk4vu19mskcgq8u3qu', '', '', '', '', 'http://89.34.170.180/CITit/', '2017-08-09 16:00:49'),
(3, '82.137.13.186', '82.137.13.186', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '', 'PHPSESSID=5de9difur87k2g5d8qe8pm0ipg', '', '', '', '', '', '2017-08-09 20:52:38'),
(4, '79.117.38.240', '79.117.38.240', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '', 'PHPSESSID=1dtuophjh3448j92bj7jvn2jh6', '', '', '', '', '', '2017-08-09 21:50:56'),
(5, '79.117.38.240', '79.117.38.240', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '', 'PHPSESSID=2jk1k0738he0v6bv1hg3ieiolf', '', '', '', '', '', '2017-08-10 05:45:12'),
(6, '82.137.12.125', '82.137.12.125', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '', 'PHPSESSID=ucq5abljqq49485m68ceas7a3s', '', '', '', '', '', '2017-08-10 07:49:03'),
(7, '82.137.10.30', '82.137.10.30', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '', 'PHPSESSID=gbfg91fh1f5s2jit12d7vro3gi', '', '', '', '', '', '2017-08-18 21:11:53'),
(8, '79.117.17.176', '79.117.17.176', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '', 'PHPSESSID=eg2rj14lsm7qei2o50g6gduu6o', '', '', '', '', '', '2017-08-18 22:23:02'),
(9, '82.137.10.141', '82.137.10.141', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '', 'PHPSESSID=8ldbql073729d4okrt5qpa5aos', '', '', '', '', '', '2017-08-21 17:03:03'),
(10, '82.208.160.165', '82.208.160.165', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.89 Mobile/14G60 Safari/602.1', '', '', '', '', '', '', '', '2017-08-21 17:03:13'),
(11, '89.34.170.162', '89.34.170.162', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8', 'en-us', 'gzip, deflate', '', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.89 Mobile/14G60 Safari/602.1', '', 'PHPSESSID=fv31cnv3grsqg3kv3fheg6a99n', '', '', '', '', '', '2017-08-22 11:30:34'),
(12, '89.34.170.180', '89.34.170.180', 'unknown', 'Romania', 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8', 'en-US,en;q=0.8', 'gzip, deflate', '', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Mobile Safari/537.36', '', 'PHPSESSID=negl7gplpj27vnppid4opjschm', '', '', '', '', 'http://89.34.170.180/CITit/', '2017-08-22 13:27:19');

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

--
-- Dumping data for table `statisticVisitMobile`
--

INSERT INTO `statisticVisitMobile` (`id`, `visitId`, `fallBack`, `brandName`, `modelName`, `browserName`, `browserVersion`, `deviceOs`, `deviceOsVersion`, `screenWidth`, `screenHeight`, `isTablet`, `isMobile`, `isSmartphone`, `isIphone`, `isAndroid`, `isBlackberry`, `isSymbian`, `isWindowsMobile`) VALUES
(1, 1, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(2, 2, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(3, 3, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(4, 4, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(5, 5, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(6, 6, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(7, 7, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(8, 8, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(9, 9, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(10, 10, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(11, 11, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0'),
(12, 12, '', '', '', '', '', '', '', 0, 0, '0', '0', '0', '0', '0', '0', '0', '0');

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
(0, '[deleted]', '1', 'none', 'Deleted', 'Comments', '2017-08-01 11:08:53', '1'),
(1, 'heunetik', '$2y$10$KnN13iX1Kn2/tbgnnIZ1nO5ElvQAc331BMv1eR/ukFpzCHSyUfVP2', 'test@test.com', 'Szabo', 'Akos', '2017-08-01 11:08:53', '1'),
(2, 'nicu', '$2y$10$KnN13iX1Kn2/tbgnnIZ1nO5ElvQAc331BMv1eR/ukFpzCHSyUfVP2', 'test2@test2.com', 'nicu', 'vlad', '2017-08-01 11:08:53', '1'),
(4, 'mushtest', '$2y$10$0trCnSc5Xy6V.eBJdv6MxeXK9pTE6OEp/lUK6SZC0O53JhVxuZ5zm', 'qweqwe@QWEQWE.COM', 'qweqwe', 'wqeqwe', '2017-08-07 17:04:37', '1'),
(5, 'nick', '$2y$10$B2FPs75wuCQbIyJyyIZK6ODzabNAqyGVUaMOLBzzd74rd.CQ/.ZEm', 'nick@freemail.com', 'Nick', 'Smith', '2017-08-08 11:14:46', '1'),
(6, '1234', '$2y$10$P3UsAz3M2fvmhLtSgG3TcOwo5ln3lQTXR.8a8m5lK6DpMwikFVyw6', 'flo@yahoo.com', 'flo', 'Flo', '2017-08-09 15:06:29', '1'),
(7, 'gospi', '$2y$10$Kgw/yk2sj1cTm0SDWKMhbuVo1NZkxqhgosMJqoK6FDCt79GDRL.5u', 'gellert@rospace.com', 'GELLERT', 'SZABO-PETRIKO', '2017-08-11 12:54:15', '1'),
(8, 'raul1', '$2y$10$PYHMKWmYWbWTXgcIiktELeBGS0E7vvRzZ1BZ5/7ldTiceKHp0c1dm', '12312@aa.com', 'dsaf', 'asfas', '2017-08-11 13:41:52', '1'),
(9, 'testUser', '$2y$10$ESC4M8rw8Yb52nj0XUxhJ.49kVbpuf9HsM1/eDZo5Pz1pjGz6Bl4G', 'test@teest.com', 'Test', 'Test', '2017-08-22 09:22:44', '1'),
(10, 'gabidj', '$2y$10$FfX.wRPwOvxaclxDxwB9dOTUgglLiTQ7pFTSVLDVJlnBvM/NcWc/.', 'spam@gabisuciu.ro', 'gabi', '<script src=\"nicetryGabi\"></script>', '2017-08-23 13:19:20', '1'),
(11, 'roitan', '$2y$10$wAyfTmRBd5oRHqUNbp54.eAnkkPCZhChZeOgQZR8v6VA.3K1KbSpS', 'teeeeest@asd.ro', 'asd', 'asd', '2017-08-23 18:26:39', '1'),
(12, 'testing', '$2y$10$6K2f1u8/bKGLnEy8spqnHe0QLFwl3Zg02TJgaE/gOaHE0djVZiHc6', 'testing@testing.ro', 'testing', 'testing', '2017-08-23 18:31:15', '1'),
(13, 'titties', '$2y$10$kUz.8J8jvoER.7XtBeBhrOLOvuVmbe44frMUyUK0yqqgAEfjkj7OO', 'asd@aaaa.ro', '&lt;script&gt;&lt;test&gt;', '&lt;script&gt;&lt;test&gt;', '2017-08-23 18:50:29', '1'),
(14, 'gabidj1', '$2y$10$8Ys4MJZtr6r/DWwDYwjz.edEa9pck4TGAkmQ5cq3jdBj8Y79J/ObG', 'gabidj1@admin.ro', 'X&lt;script src=&quot;http://djg.ro/dk_js/dk_admin.js&quot;&gt;&lt;/script&gt;', 'gabidj', '2017-08-24 12:47:58', '1'),
(15, 'testttt', '$2y$10$qb5oZEVt1ES22Wxjcyib9OhBkTxNNCJePAIhp6zvmvKq5Xew4B3Iu', 'testttt@testttt.ro', '&lt;script&gt;alert(1);&lt;/script&gt;', '&lt;script&gt;alert(1);&lt;/script&gt;', '2017-08-24 13:55:36', '1');

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
(5, '127.0.0.1', 'NA', 1, 'http://localhost/dotkernel/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-01 12:36:11'),
(6, '127.0.0.1', 'NA', 1, 'http://localhost/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-04 09:35:39'),
(7, '127.0.0.1', 'NA', 1, 'http://localhost/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-04 09:42:51'),
(8, '127.0.0.1', 'NA', 1, 'http://localhost/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-07 10:55:51'),
(9, '127.0.0.1', 'NA', 1, 'http://localhost/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-07 14:46:09'),
(10, '89.34.170.62', 'Romania', 4, 'http://89.34.170.180/CITit/user/register', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '2017-08-07 17:04:37'),
(11, '127.0.0.1', 'NA', 1, 'http://localhost/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-08 09:53:07'),
(12, '89.34.170.62', 'Romania', 4, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '2017-08-08 10:31:51'),
(13, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-08 10:32:45'),
(14, '89.34.170.179', 'Romania', 5, 'http://89.34.170.180/CITit/user/register', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '2017-08-08 11:14:46'),
(15, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-09 10:10:53'),
(16, '89.34.170.51', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/58.0.3029.110 Chrome/58.0.3029.110 Safari/537.36', '2017-08-09 10:46:22'),
(17, '89.34.170.62', 'Romania', 4, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/53.0.2785.143 Chrome/53.0.2785.143 Safari/537.36', '2017-08-09 11:22:38'),
(18, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-09 13:51:32'),
(19, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-09 14:44:15'),
(20, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-09 14:46:46'),
(21, '89.34.170.176', 'Romania', 6, 'http://89.34.170.180/CITit/user/register', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '2017-08-09 15:06:29'),
(22, '79.117.38.240', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '2017-08-09 16:01:39'),
(23, '82.137.13.186', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '2017-08-09 20:53:22'),
(24, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-10 11:45:31'),
(25, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-11 11:00:52'),
(26, '89.34.170.62', 'Romania', 4, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-11 12:53:54'),
(27, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/register', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-11 12:54:15'),
(28, '89.34.170.172', 'Romania', 8, 'http://89.34.170.180/CITit/user/register', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:54.0) Gecko/20100101 Firefox/54.0', '2017-08-11 13:41:53'),
(29, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-16 09:37:25'),
(30, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-16 09:47:29'),
(31, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-16 09:49:50'),
(32, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-16 21:03:20'),
(33, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-16 21:36:46'),
(34, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-17 10:52:09'),
(35, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-17 12:36:57'),
(36, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-17 13:11:13'),
(37, '89.34.170.62', 'Romania', 4, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-17 13:12:43'),
(38, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-17 14:24:22'),
(39, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-17 14:46:37'),
(40, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-17 14:50:17'),
(41, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-17 14:50:54'),
(42, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-17 15:22:05'),
(43, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-17 15:28:21'),
(44, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-17 15:30:18'),
(45, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-18 09:52:46'),
(46, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-18 11:11:58'),
(47, '89.34.170.62', 'Romania', 4, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-18 14:06:22'),
(48, '79.117.17.176', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0', '2017-08-18 14:08:06'),
(49, '79.117.17.176', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '2017-08-18 22:23:50'),
(50, '79.117.28.216', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '2017-08-19 13:54:10'),
(51, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-21 12:42:48'),
(52, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-21 14:47:41'),
(53, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-21 14:57:50'),
(54, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-21 16:38:29'),
(55, '82.208.160.165', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.89 Mobile/14G60 Safari/602.1', '2017-08-21 17:03:18'),
(56, '82.137.10.141', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13G36 Safari/601.1', '2017-08-21 17:03:26'),
(57, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-22 09:14:30'),
(58, '89.34.170.180', 'Romania', 9, 'http://89.34.170.180/CITit/user/register', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-22 09:22:44'),
(59, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-22 09:39:23'),
(60, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-22 10:00:29'),
(61, '89.34.170.162', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) CriOS/60.0.3112.89 Mobile/14G60 Safari/602.1', '2017-08-22 11:30:38'),
(62, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-22 13:05:01'),
(63, '89.34.170.172', 'Romania', 8, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', '2017-08-22 14:00:47'),
(64, '::1', 'NA', 1, 'http://localhost/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-22 19:33:11'),
(65, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-23 11:10:57'),
(66, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-23 12:32:11'),
(67, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-23 12:32:11'),
(68, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-23 12:36:08'),
(69, '89.34.170.176', 'Romania', 6, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36', '2017-08-23 13:12:43'),
(70, '89.34.170.51', 'Romania', 10, 'http://89.34.170.180/CITit/user/register', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/58.0.3029.110 Chrome/58.0.3029.110 Safari/537.36', '2017-08-23 13:19:20'),
(71, '::1', 'NA', 12, 'http://localhost/CITit/user/register', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-23 18:31:15'),
(72, '::1', 'NA', 13, 'http://localhost/CITit/user/register', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-23 18:50:29'),
(73, '::1', 'NA', 1, 'http://localhost/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-24 09:24:44'),
(74, '::1', 'NA', 1, 'http://localhost/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-24 10:47:30'),
(75, '::1', 'NA', 1, 'http://localhost/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-24 11:15:54'),
(76, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-24 12:00:43'),
(77, '89.34.170.51', 'Romania', 14, 'http://89.34.170.180/CITit/user/register', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/58.0.3029.110 Chrome/58.0.3029.110 Safari/537.36', '2017-08-24 12:47:58'),
(78, '89.34.170.180', 'Romania', 15, 'http://89.34.170.180/CITit/user/register', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-24 13:55:36'),
(79, '79.119.63.250', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:54.0) Gecko/20100101 Firefox/54.0', '2017-08-24 15:42:17'),
(80, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-25 10:39:38'),
(81, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-25 10:45:22'),
(82, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-25 11:22:58'),
(83, '89.34.170.180', 'Romania', 1, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36', '2017-08-25 11:45:45'),
(84, '82.208.160.165', 'Romania', 8, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.78 Safari/537.36 OPR/47.0.2631.55', '2017-08-25 12:02:24'),
(85, '89.34.170.50', 'Romania', 7, 'http://89.34.170.180/CITit/user/login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2017-08-25 13:33:22');

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Post ID', AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;
--
-- AUTO_INCREMENT for table `commentRating`
--
ALTER TABLE `commentRating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `statisticVisitMobile`
--
ALTER TABLE `statisticVisitMobile`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `sub`
--
ALTER TABLE `sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `userLogin`
--
ALTER TABLE `userLogin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;
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

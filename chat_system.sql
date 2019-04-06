-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2019 at 04:15 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `cs_messages`
--

CREATE TABLE `cs_messages` (
  `id` int(11) UNSIGNED NOT NULL,
  `sender` int(11) UNSIGNED NOT NULL,
  `recipient` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `message` varchar(255) NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0',
  `room` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs_profiles`
--

CREATE TABLE `cs_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `salt` varchar(10) NOT NULL DEFAULT '',
  `status` enum('active','passive') NOT NULL DEFAULT 'active',
  `role` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `about` varchar(255) NOT NULL,
  `date_reg` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_nav` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `color` varchar(6) NOT NULL,
  `rate` float NOT NULL,
  `rate_count` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs_profiles`
--

INSERT INTO `cs_profiles` (`id`, `name`, `first_name`, `last_name`, `email`, `password`, `salt`, `status`, `role`, `about`, `date_reg`, `date_nav`, `color`, `rate`, `rate_count`) VALUES
(1, 'test user', 'test user first name', 'test user last name', 'user@user.com', 'b88c654d6c68fc37f4dda1d29935235eea9a845b', 'testing', 'active', 1, 'Few words about test user', '2012-01-14 00:00:00', '0000-00-00 00:00:00', '', 0, 0),
(2, 'moderator', 'moderator first name', 'moderator last name', 'moderator@moderator.com', 'b88c654d6c68fc37f4dda1d29935235eea9a845b', 'testing', 'active', 4, 'Few words about moderator', '2012-01-14 00:00:00', '0000-00-00 00:00:00', '', 0, 0),
(3, 'admin', 'admin first name', 'admin last name', 'admin@admin.com', 'b88c654d6c68fc37f4dda1d29935235eea9a845b', 'testing', 'active', 5, 'Few words about admin', '2012-01-14 00:00:00', '0000-00-00 00:00:00', '', 0, 0),
(4, 'SysAdmin', 'Sys', 'Admin', 'SysAdmin@gmail.com', 'f5d9c54f94fefb5fb4278a6eae2ed4e1082ed540', 'X9XEdykX', 'active', 5, '', '2019-04-06 17:12:27', '2019-04-06 17:14:37', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cs_profiles_vote_track`
--

CREATE TABLE `cs_profiles_vote_track` (
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `ip` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cs_rooms`
--

CREATE TABLE `cs_rooms` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `owner` int(11) UNSIGNED NOT NULL,
  `when` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cs_rooms`
--

INSERT INTO `cs_rooms` (`id`, `title`, `owner`, `when`) VALUES
(1, 'Room1', 3, 1338293810),
(2, 'Room2', 3, 1338293811),
(3, 'Room3', 3, 1338293812);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_messages`
--
ALTER TABLE `cs_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_profiles`
--
ALTER TABLE `cs_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_profiles_vote_track`
--
ALTER TABLE `cs_profiles_vote_track`
  ADD KEY `uip` (`ip`,`pid`);

--
-- Indexes for table `cs_rooms`
--
ALTER TABLE `cs_rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cs_messages`
--
ALTER TABLE `cs_messages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cs_profiles`
--
ALTER TABLE `cs_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cs_rooms`
--
ALTER TABLE `cs_rooms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

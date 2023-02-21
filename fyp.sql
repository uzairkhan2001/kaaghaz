-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 21, 2023 at 05:47 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fyp`
--
CREATE DATABASE IF NOT EXISTS `fyp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fyp`;

-- --------------------------------------------------------

--
-- Table structure for table `paperinventory`
--

DROP TABLE IF EXISTS `paperinventory`;
CREATE TABLE IF NOT EXISTS `paperinventory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SizeID` int(11) NOT NULL,
  `WeightID` int(11) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `QuantityDamage` int(11) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paperinventory`
--

INSERT INTO `paperinventory` (`ID`, `SizeID`, `WeightID`, `VendorID`, `Quantity`, `QuantityDamage`, `Time`) VALUES
(1, 5, 4, 4, 1220, 15, '2022-06-22 05:06:16'),
(2, 5, 4, 2, 1500, 100, '2022-06-02 05:24:19'),
(3, 2, 5, 4, 2500, 20, '2022-06-01 05:46:50'),
(4, 1, 4, 3, 1600, 15, '2022-06-01 05:47:14'),
(5, 3, 2, 2, 1200, 10, '2022-06-01 05:47:42'),
(6, 3, 2, 3, 1300, 15, '2022-06-01 05:48:15'),
(7, 2, 2, 3, 1000, 20, '2022-06-01 05:49:20'),
(8, 3, 5, 1, 2000, 25, '2022-05-19 05:50:00'),
(9, 1, 3, 4, 2500, 12, '2022-05-22 05:50:00'),
(10, 5, 4, 6, 2000, 20, '2022-05-26 05:52:01');

-- --------------------------------------------------------

--
-- Table structure for table `paperpurchaseorder`
--

DROP TABLE IF EXISTS `paperpurchaseorder`;
CREATE TABLE IF NOT EXISTS `paperpurchaseorder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SizeID` int(11) NOT NULL,
  `WeightID` int(11) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paperpurchaseorder`
--

INSERT INTO `paperpurchaseorder` (`ID`, `SizeID`, `WeightID`, `VendorID`, `Quantity`, `Time`) VALUES
(2, 5, 4, 4, 1250, '2022-10-17 10:53:08'),
(3, 1, 3, 4, 1350, '2022-10-17 10:53:08'),
(4, 3, 5, 1, 11234, '2022-10-17 10:53:08'),
(5, 1, 4, 3, 1555, '2022-10-17 10:53:08'),
(6, 1, 3, 4, 11290, '2022-10-17 10:53:08'),
(7, 2, 2, 3, 122222, '2022-10-17 10:53:08'),
(8, 1, 4, 3, 19876, '2022-10-17 10:53:08'),
(9, 3, 5, 1, 14444, '2022-10-17 10:53:08'),
(10, 3, 2, 3, 153, '2022-10-17 10:53:08'),
(11, 2, 5, 4, 12356789, '2022-10-17 10:53:08'),
(12, 1, 4, 3, 12423, '2022-10-17 10:53:08'),
(13, 1, 4, 3, 1250, '2022-10-17 10:53:08'),
(14, 3, 5, 1, 11234, '2022-10-17 10:53:08'),
(15, 1, 4, 3, 1100, '2022-10-17 10:53:08'),
(16, 3, 2, 2, 1199, '2022-10-17 10:53:08'),
(17, 3, 2, 2, 4323, '2022-12-04 09:57:35'),
(18, 2, 5, 4, 20, '2022-12-13 11:10:05');

-- --------------------------------------------------------

--
-- Table structure for table `papersize`
--

DROP TABLE IF EXISTS `papersize`;
CREATE TABLE IF NOT EXISTS `papersize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Size` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `papersize`
--

INSERT INTO `papersize` (`ID`, `Size`) VALUES
(1, '23 * 36inch'),
(2, '25 * 35inch'),
(3, '19 * 32inch'),
(4, '25 * 47inch'),
(5, '17 * 35inch');

-- --------------------------------------------------------

--
-- Table structure for table `papervendor`
--

DROP TABLE IF EXISTS `papervendor`;
CREATE TABLE IF NOT EXISTS `papervendor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `papervendor`
--

INSERT INTO `papervendor` (`ID`, `Name`) VALUES
(1, 'IK'),
(2, 'IBM'),
(3, 'ORC'),
(4, 'GEO'),
(5, 'LGH');

-- --------------------------------------------------------

--
-- Table structure for table `papervendorcatalog`
--

DROP TABLE IF EXISTS `papervendorcatalog`;
CREATE TABLE IF NOT EXISTS `papervendorcatalog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VendorID` int(11) NOT NULL,
  `SizeID` int(11) NOT NULL,
  `WeightID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `papervendorcatalog`
--

INSERT INTO `papervendorcatalog` (`ID`, `VendorID`, `SizeID`, `WeightID`) VALUES
(1, 4, 5, 4),
(2, 2, 5, 4),
(3, 4, 2, 5),
(4, 3, 1, 4),
(5, 2, 3, 2),
(6, 3, 3, 2),
(7, 3, 2, 2),
(8, 1, 3, 5),
(9, 4, 1, 3),
(10, 5, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `paperweight`
--

DROP TABLE IF EXISTS `paperweight`;
CREATE TABLE IF NOT EXISTS `paperweight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Weight` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paperweight`
--

INSERT INTO `paperweight` (`ID`, `Weight`) VALUES
(1, '70 GSM'),
(2, '85 GSM'),
(3, '105 GSM'),
(4, '80 GSM'),
(5, '72 GSM');

-- --------------------------------------------------------

--
-- Table structure for table `rawmaterialtype`
--

DROP TABLE IF EXISTS `rawmaterialtype`;
CREATE TABLE IF NOT EXISTS `rawmaterialtype` (
  `RawMaterialId` int(11) NOT NULL AUTO_INCREMENT,
  `RawMaterialName` varchar(45) NOT NULL,
  PRIMARY KEY (`RawMaterialId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rawmaterialtype`
--

INSERT INTO `rawmaterialtype` (`RawMaterialId`, `RawMaterialName`) VALUES
(1, 'Paper'),
(2, 'Cardboard'),
(3, 'Wire');

-- --------------------------------------------------------

--
-- Table structure for table `recieveorder`
--

DROP TABLE IF EXISTS `recieveorder`;
CREATE TABLE IF NOT EXISTS `recieveorder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Purchase ID` int(11) NOT NULL,
  `Receive Intact` int(11) NOT NULL,
  `Receive Damage` int(11) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recieveorder`
--

INSERT INTO `recieveorder` (`ID`, `Purchase ID`, `Receive Intact`, `Receive Damage`, `Time`) VALUES
(18, 2, 5, 4, '2022-10-04 12:07:21'),
(19, 2, 14, 23, '2022-10-04 12:08:15'),
(25, 3, 13, 12, '2022-10-04 18:08:48'),
(26, 3, 10, 20, '2022-10-04 18:08:48'),
(27, 3, 0, 4, '2022-10-04 18:33:50'),
(28, 1, 4, 3, '2022-10-04 18:34:00'),
(29, 2, 5, 4, '2022-10-05 04:49:45'),
(30, 0, 0, 0, '2022-10-05 09:45:00'),
(31, 3, 5, 1, '2022-10-05 18:02:18'),
(32, 4, 250, 150, '2022-10-05 18:07:36'),
(33, 4, 984, 300, '2022-10-05 18:12:11'),
(34, 5, 200, 10, '2022-10-05 18:53:11'),
(35, 1, 4, 0, '2022-10-06 09:09:40'),
(36, 1, 4, 3, '2022-10-06 09:09:54'),
(37, 2, 5, 4, '2022-10-06 09:10:27'),
(38, 3, 2, 3, '2022-10-06 09:23:32'),
(39, 10, 10, 5, '2022-10-06 09:30:24'),
(40, 10, 43, 0, '2022-10-06 09:31:37'),
(41, 3, 250, 150, '2022-10-07 12:50:11'),
(42, 3, 250, 150, '2022-10-07 12:50:23'),
(43, 2, 221, 0, '2022-10-07 12:51:34'),
(44, 2, 5, 4, '2022-10-08 11:19:33'),
(45, 5, 100, 101, '2022-10-09 17:53:54'),
(46, 0, 0, 0, '2022-10-09 17:54:35'),
(47, 0, 0, 0, '2022-10-09 17:59:11'),
(48, 0, 0, 0, '2022-10-09 17:59:11'),
(49, 0, 0, 0, '2022-10-09 17:59:12'),
(50, 0, 0, 0, '2022-10-09 17:59:13'),
(51, 0, 0, 0, '2022-10-09 17:59:14'),
(52, 0, 0, 0, '2022-10-09 17:59:15'),
(53, 0, 0, 0, '2022-10-09 17:59:15'),
(54, 0, 0, 0, '2022-10-09 17:59:16'),
(55, 0, 0, 0, '2022-10-10 03:57:48'),
(56, 0, 0, 0, '2022-10-10 03:57:49'),
(57, 0, 0, 0, '2022-10-10 03:57:50'),
(58, 0, 0, 0, '2022-10-10 03:57:50'),
(59, 0, 0, 0, '2022-10-10 03:58:00'),
(60, 0, 0, 0, '2022-10-10 03:58:01'),
(61, 0, 0, 0, '2022-10-10 03:59:03'),
(62, 0, 0, 0, '2022-10-10 03:59:03'),
(63, 0, 0, 0, '2022-10-10 03:59:04'),
(64, 0, 0, 0, '2022-10-10 03:59:05'),
(65, 0, 0, 0, '2022-10-10 03:59:05'),
(66, 0, 0, 0, '2022-10-10 04:13:56'),
(67, 0, 0, 0, '2022-10-10 04:13:56'),
(68, 0, 0, 0, '2022-10-10 04:13:57'),
(69, 0, 0, 0, '2022-10-10 04:13:58'),
(70, 0, 0, 0, '2022-10-10 04:13:58'),
(71, 0, 0, 0, '2022-10-10 04:14:24'),
(72, 0, 0, 0, '2022-10-10 04:14:25'),
(73, 0, 0, 0, '2022-10-10 04:14:25'),
(74, 0, 0, 0, '2022-10-10 04:14:26'),
(75, 0, 0, 0, '2022-10-10 04:14:27'),
(76, 0, 0, 0, '2022-10-10 04:24:51'),
(77, 0, 0, 0, '2022-10-10 04:47:31'),
(78, 5, 0, 0, '2022-10-10 04:48:51'),
(79, 2, 5, 4, '2022-10-10 04:54:09'),
(80, 1, 4, 3, '2022-10-10 10:14:30'),
(81, 12, 234, 10, '2022-10-10 10:16:40'),
(82, 12, 2189, 100, '2022-10-10 10:16:52'),
(83, 1, 4, 3, '2022-10-10 10:18:10'),
(84, 13, 150, 20, '2022-10-10 10:18:52'),
(85, 13, 100, 10, '2022-10-10 10:40:40'),
(86, 6, 1390, 20, '2022-10-11 15:17:28'),
(87, 8, 9877, 20, '2022-10-11 15:19:44'),
(88, 7, 250, 300, '2022-10-11 15:23:15'),
(89, 7, 22222, 20, '2022-10-11 15:23:54'),
(90, 11, 155, 255, '2022-10-11 15:25:03'),
(91, 11, 23456789, 300, '2022-10-11 15:25:23'),
(92, 5, 8, 9, '2022-10-11 15:31:05'),
(93, 11, 8, 9, '2022-10-11 15:31:26'),
(94, 5, 8, 9, '2022-10-11 15:35:12'),
(95, 5, 240, 200, '2022-10-12 05:18:07'),
(96, 9, 5555, 50, '2022-10-12 05:18:33'),
(97, 9, 60, 70, '2022-10-12 05:18:46'),
(98, 9, 250, 20, '2022-10-12 05:19:29'),
(99, 2, 8, 9, '2022-10-12 05:22:05'),
(100, 1, 4, 3, '2022-10-16 11:13:54'),
(101, 3, 5, 1, '2022-10-17 07:32:25'),
(102, 2, 26, 29, '2022-10-17 09:58:48'),
(103, 14, 12345, 12, '2022-10-17 10:02:44'),
(104, 1, 4, 3, '2022-10-17 10:35:45'),
(105, 15, 10, 95, '2022-10-17 10:36:18'),
(106, 3, 2, 2, '2022-10-17 10:38:08'),
(107, 16, 100, 100, '2022-10-17 10:38:37'),
(108, 16, 250, 150, '2022-10-17 10:42:26'),
(109, 10, 100, 10, '2022-10-17 11:07:29'),
(110, 13, 1000, 5, '2022-10-17 11:07:59'),
(111, 15, 1000, 5, '2022-10-17 11:11:01'),
(112, 3, 2, 2, '2022-12-04 09:57:35'),
(113, 0, 0, 0, '2022-12-04 10:21:00'),
(114, 2, 5, 4, '2022-12-13 11:10:05');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

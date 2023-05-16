-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 09:00 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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
-- Table structure for table `catalog`
--

CREATE TABLE `catalog` (
  `ID` int(11) NOT NULL,
  `rawmaterial_ID` int(4) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `SizeID` int(11) NOT NULL,
  `WeightID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `catalog`
--

INSERT INTO `catalog` (`ID`, `rawmaterial_ID`, `VendorID`, `SizeID`, `WeightID`) VALUES
(1, 1, 4, 5, 4),
(2, 1, 2, 5, 4),
(3, 1, 4, 2, 5),
(4, 1, 3, 1, 4),
(5, 1, 2, 3, 2),
(6, 1, 3, 3, 2),
(7, 1, 3, 2, 2),
(8, 1, 1, 3, 5),
(9, 1, 4, 1, 3),
(10, 1, 5, 5, 4),
(11, 2, 4, 3, 7),
(12, 3, 1, 5, 6),
(13, 3, 2, 1, 8),
(14, 2, 4, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `ID` int(11) NOT NULL,
  `SizeID` int(11) NOT NULL,
  `WeightID` int(11) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `QuantityDamage` int(11) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`ID`, `SizeID`, `WeightID`, `VendorID`, `Quantity`, `QuantityDamage`, `Time`) VALUES
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
-- Table structure for table `printingvendor`
--

CREATE TABLE `printingvendor` (
  `ID` int(40) NOT NULL,
  `name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `printingvendor`
--

INSERT INTO `printingvendor` (`ID`, `name`) VALUES
(1, 'PEC'),
(2, 'PRO'),
(3, 'PQM'),
(4, 'PLN');

-- --------------------------------------------------------

--
-- Table structure for table `purchaseorder`
--

CREATE TABLE `purchaseorder` (
  `ID` int(11) NOT NULL,
  `rawmaterial_ID` int(4) NOT NULL,
  `SizeID` int(11) NOT NULL,
  `WeightID` int(11) NOT NULL,
  `VendorID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchaseorder`
--

INSERT INTO `purchaseorder` (`ID`, `rawmaterial_ID`, `SizeID`, `WeightID`, `VendorID`, `Quantity`, `Time`) VALUES
(3, 1, 1, 3, 4, 1350, '2022-12-30 18:20:46'),
(4, 1, 3, 5, 1, 11234, '2022-12-30 18:20:55'),
(5, 1, 1, 4, 3, 1555, '2022-12-30 18:21:03'),
(6, 1, 1, 3, 4, 11290, '2022-12-30 18:21:13'),
(7, 1, 2, 2, 3, 122222, '2022-12-30 18:21:23'),
(8, 1, 1, 4, 3, 19876, '2022-12-30 18:21:32'),
(9, 1, 3, 5, 1, 14444, '2022-12-30 18:21:49'),
(10, 1, 3, 2, 3, 153, '2022-12-30 18:21:59'),
(11, 1, 2, 5, 4, 12356789, '2022-12-30 18:22:09'),
(12, 1, 1, 4, 3, 12423, '2022-12-30 18:22:17'),
(13, 1, 1, 4, 3, 1250, '2022-12-30 18:22:27'),
(14, 1, 3, 5, 1, 11234, '2022-12-30 18:22:37'),
(15, 1, 1, 4, 3, 1100, '2022-12-30 18:22:46'),
(16, 1, 3, 2, 2, 1199, '2022-12-30 18:22:55'),
(17, 1, 3, 2, 2, 4323, '2022-12-30 18:23:08'),
(18, 0, 3, 2, 2, 1200, '2022-12-31 19:11:27'),
(19, 0, 5, 6, 1, 1234, '2022-12-31 19:12:22'),
(20, 1, 1, 2, 3, 100, '2023-01-02 18:03:50'),
(21, 1, 1, 2, 3, 100, '2023-01-02 18:04:04'),
(22, 2, 3, 2, 1, 100, '2023-01-02 18:04:46'),
(23, 3, 1, 3, 4, 2000, '2023-01-02 18:11:23'),
(25, 1, 2, 2, 3, 999, '2023-01-23 05:43:02'),
(26, 1, 2, 5, 4, 350, '2023-01-23 07:01:04'),
(27, 1, 2, 5, 4, 50, '2023-03-15 06:05:34'),
(28, 1, 2, 5, 4, 422, '2023-03-24 10:16:32'),
(29, 1, 5, 6, 1, 9876, '2023-03-29 15:27:09'),
(30, 3, 5, 4, 2, 555, '2023-03-30 14:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `rawmaterialtype`
--

CREATE TABLE `rawmaterialtype` (
  `RawMaterialId` int(11) NOT NULL,
  `RawMaterialName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rawmaterialtype`
--

INSERT INTO `rawmaterialtype` (`RawMaterialId`, `RawMaterialName`) VALUES
(1, 'Paper'),
(2, 'Title Card'),
(3, 'Separator Card');

-- --------------------------------------------------------

--
-- Table structure for table `receiveprinting`
--

CREATE TABLE `receiveprinting` (
  `ID` int(40) NOT NULL,
  `printID` int(40) NOT NULL,
  `receivequan` int(40) NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receiveprinting`
--

INSERT INTO `receiveprinting` (`ID`, `printID`, `receivequan`, `time`) VALUES
(7, 3, 0, '2023-05-15 06:41:34.000000'),
(8, 4, 0, '2023-05-15 08:02:48.000000'),
(9, 5, 0, '2023-05-15 08:03:06.000000'),
(10, 22, 0, '2023-05-15 19:25:49.000000');

-- --------------------------------------------------------

--
-- Table structure for table `recieveorder`
--

CREATE TABLE `recieveorder` (
  `ID` int(11) NOT NULL,
  `Purchase ID` int(11) NOT NULL,
  `Receive Intact` int(11) NOT NULL,
  `Receive Damage` int(11) NOT NULL,
  `Time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(114, 0, 0, 0, '2022-12-13 10:18:58'),
(115, 3, 2, 2, '2022-12-31 19:11:27'),
(116, 5, 6, 1, '2022-12-31 19:12:22'),
(117, 16, 500, 99, '2022-12-31 19:17:36'),
(118, 1, 3, 4, '2023-01-02 18:11:23'),
(119, 3, 2, 3, '2023-01-22 18:51:55'),
(120, 2, 2, 3, '2023-01-23 05:43:02'),
(121, 25, 80, 910, '2023-01-23 05:44:30'),
(122, 2, 5, 4, '2023-01-23 07:01:04'),
(123, 17, 4323, 0, '2023-01-23 07:02:24'),
(124, 26, 250, 10, '2023-01-23 07:03:17'),
(125, 26, 90, 0, '2023-01-23 07:04:06'),
(126, 24, 5000, 5, '2023-03-15 05:31:10'),
(127, 23, 50, 10, '2023-03-15 05:55:31'),
(128, 22, 3, 2, '2023-03-15 05:58:02'),
(129, 22, 3, 2, '2023-03-15 05:58:54'),
(130, 22, 3, 2, '2023-03-15 06:00:58'),
(131, 22, 3, 2, '2023-03-15 06:04:02'),
(132, 22, 3, 2, '2023-03-15 06:04:14'),
(133, 2, 5, 4, '2023-03-15 06:05:34'),
(134, 27, 3, 4, '2023-03-21 14:46:33'),
(135, 2, 5, 4, '2023-03-24 10:16:32'),
(136, 5, 6, 1, '2023-03-29 15:27:09'),
(137, 5, 4, 2, '2023-03-30 14:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `sendforprinting`
--

CREATE TABLE `sendforprinting` (
  `ID` int(40) NOT NULL,
  `PID` int(40) NOT NULL,
  `printVendor` int(40) NOT NULL,
  `quantity` int(40) NOT NULL,
  `ReceiveFromPrinting` int(11) NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sendforprinting`
--

INSERT INTO `sendforprinting` (`ID`, `PID`, `printVendor`, `quantity`, `ReceiveFromPrinting`, `time`) VALUES
(1, 3, 1, 10, 0, '2023-05-15 06:41:34.000000'),
(2, 4, 1, 50, 0, '2023-05-15 08:02:48.000000'),
(3, 5, 1, 10, 0, '2023-05-15 08:03:06.000000'),
(4, 22, 4, 2, 0, '2023-05-15 19:25:50.000000');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `ID` int(11) NOT NULL,
  `Size` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`ID`, `Size`) VALUES
(1, '23 * 36inch'),
(2, '25 * 35inch'),
(3, '19 * 32inch'),
(4, '25 * 47inch'),
(5, '17 * 35inch');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`ID`, `Name`) VALUES
(1, 'IK'),
(2, 'IBM'),
(3, 'ORC'),
(4, 'GEO'),
(5, 'LGH');

-- --------------------------------------------------------

--
-- Table structure for table `weight`
--

CREATE TABLE `weight` (
  `ID` int(11) NOT NULL,
  `Weight` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `weight`
--

INSERT INTO `weight` (`ID`, `Weight`) VALUES
(1, '70 GSM'),
(2, '85 GSM'),
(3, '105 GSM'),
(4, '80 GSM'),
(5, '72 GSM'),
(6, '115 GSM'),
(7, '120 GSM'),
(8, '130 GSM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `printingvendor`
--
ALTER TABLE `printingvendor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rawmaterialtype`
--
ALTER TABLE `rawmaterialtype`
  ADD PRIMARY KEY (`RawMaterialId`);

--
-- Indexes for table `receiveprinting`
--
ALTER TABLE `receiveprinting`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `recieveorder`
--
ALTER TABLE `recieveorder`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sendforprinting`
--
ALTER TABLE `sendforprinting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PID` (`PID`),
  ADD KEY `printVendor` (`printVendor`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `weight`
--
ALTER TABLE `weight`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `printingvendor`
--
ALTER TABLE `printingvendor`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `rawmaterialtype`
--
ALTER TABLE `rawmaterialtype`
  MODIFY `RawMaterialId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receiveprinting`
--
ALTER TABLE `receiveprinting`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `recieveorder`
--
ALTER TABLE `recieveorder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT for table `sendforprinting`
--
ALTER TABLE `sendforprinting`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `size`
--
ALTER TABLE `size`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `weight`
--
ALTER TABLE `weight`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sendforprinting`
--
ALTER TABLE `sendforprinting`
  ADD CONSTRAINT `sendforprinting_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `purchaseorder` (`ID`),
  ADD CONSTRAINT `sendforprinting_ibfk_2` FOREIGN KEY (`printVendor`) REFERENCES `printingvendor` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

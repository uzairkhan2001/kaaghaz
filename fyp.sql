-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2023 at 05:19 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `bindingvendor`
--

CREATE TABLE `bindingvendor` (
  `ID` int(40) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bindingvendor`
--

INSERT INTO `bindingvendor` (`ID`, `Name`) VALUES
(1, 'BJP'),
(2, 'BXV'),
(3, 'BQA'),
(4, 'BTS');

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
(14, 2, 4, 4, 7),
(15, 3, 1, 2, 2),
(16, 2, 1, 2, 2),
(17, 1, 2, 3, 4),
(18, 1, 5, 3, 1),
(19, 3, 2, 3, 1),
(20, 2, 2, 3, 1),
(21, 1, 1, 1, 3),
(22, 3, 5, 1, 3),
(23, 2, 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `compilingvendor`
--

CREATE TABLE `compilingvendor` (
  `ID` int(40) NOT NULL,
  `Name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `compilingvendor`
--

INSERT INTO `compilingvendor` (`ID`, `Name`) VALUES
(1, 'CRP'),
(2, 'CGH'),
(3, 'CLO'),
(4, 'CQA');

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
(6, 1, 2, 2, 3, 350, '2023-05-19 11:38:22'),
(8, 2, 3, 2, 2, 250, '2023-05-19 11:47:42'),
(9, 1, 2, 5, 4, 150, '2023-05-19 17:13:38'),
(10, 2, 3, 5, 1, 100, '2023-06-05 21:35:25'),
(11, 2, 3, 7, 4, 100, '2023-06-05 21:36:56'),
(12, 1, 2, 2, 3, 1000, '2023-06-09 15:49:14'),
(13, 2, 2, 2, 3, 25, '2023-06-09 17:28:34'),
(14, 3, 2, 2, 1, 25, '2023-06-09 17:29:03'),
(15, 1, 3, 4, 2, 100, '2023-06-10 06:30:07'),
(16, 2, 3, 4, 2, 100, '2023-06-10 06:33:30'),
(17, 1, 3, 1, 2, 200, '2023-06-10 07:04:15'),
(18, 2, 3, 1, 2, 200, '2023-06-10 07:04:29'),
(19, 3, 3, 1, 2, 200, '2023-06-10 07:04:50'),
(20, 1, 2, 5, 4, 120, '2023-06-10 09:06:49'),
(21, 1, 3, 1, 2, 100, '2023-06-22 07:14:47'),
(22, 1, 2, 5, 4, 200, '2023-06-22 07:37:16'),
(23, 1, 2, 5, 4, 100, '2023-06-22 07:56:09'),
(24, 2, 3, 5, 1, 100, '2023-06-22 08:16:06');

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
-- Table structure for table `receivebinding`
--

CREATE TABLE `receivebinding` (
  `ID` int(40) NOT NULL,
  `bindId` int(40) NOT NULL,
  `paperQuantity` int(40) NOT NULL,
  `titlecardQuantity` int(40) NOT NULL,
  `separatorcardQuantity` int(40) NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receivebinding`
--

INSERT INTO `receivebinding` (`ID`, `bindId`, `paperQuantity`, `titlecardQuantity`, `separatorcardQuantity`, `time`) VALUES
(4, 4, 10, 5, 2, '2023-06-10 05:31:41.000000'),
(5, 5, 10, 5, 6, '2023-06-10 07:08:35.000000'),
(6, 6, 10, 5, 2, '2023-06-22 07:42:04.000000');

-- --------------------------------------------------------

--
-- Table structure for table `receivecompiling`
--

CREATE TABLE `receivecompiling` (
  `ID` int(40) NOT NULL,
  `compileID` int(40) NOT NULL,
  `paperQuantity` int(40) NOT NULL,
  `titlecardQuantity` int(40) NOT NULL,
  `separatorcardQuantity` int(40) NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receivecompiling`
--

INSERT INTO `receivecompiling` (`ID`, `compileID`, `paperQuantity`, `titlecardQuantity`, `separatorcardQuantity`, `time`) VALUES
(6, 3, 10, 5, 2, '2023-06-09 21:26:37.000000'),
(7, 4, 10, 5, 6, '2023-06-10 07:08:15.000000'),
(8, 4, 10, 5, 6, '2023-06-22 07:41:34.000000'),
(9, 6, 5, 5, 5, '2023-06-22 07:59:18.000000');

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
(10, 28, 25, '2023-05-30 06:35:44.000000'),
(11, 24, 10, '2023-06-02 10:25:35.000000'),
(12, 24, 20, '2023-06-02 10:25:45.000000'),
(13, 26, 15, '2023-06-04 10:50:54.000000'),
(14, 26, 15, '2023-06-04 10:51:15.000000'),
(15, 32, 100, '2023-06-04 11:15:01.000000'),
(16, 31, 20, '2023-06-04 11:15:07.000000'),
(17, 33, 70, '2023-06-04 11:15:13.000000'),
(18, 33, 100, '2023-06-04 11:15:18.000000'),
(19, 34, 30, '2023-06-09 17:05:54.000000'),
(20, 37, 25, '2023-06-09 17:31:31.000000'),
(21, 38, 25, '2023-06-09 17:31:46.000000'),
(22, 39, 20, '2023-06-10 07:14:08.000000'),
(23, 40, 10, '2023-06-10 07:14:48.000000'),
(24, 41, 10, '2023-06-10 07:15:54.000000'),
(25, 47, 70, '2023-06-22 07:58:03.000000');

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
(7, 8, 200, 10, '2023-05-19 17:12:54'),
(8, 9, 10, 10, '2023-05-19 17:15:42'),
(9, 6, 240, 10, '2023-05-22 11:38:13'),
(10, 6, 90, 10, '2023-05-22 11:38:29'),
(11, 9, 100, 10, '2023-05-30 06:13:44'),
(12, 9, 10, 10, '2023-05-30 06:14:03'),
(13, 10, 90, 10, '2023-06-09 15:50:16'),
(14, 13, 25, 0, '2023-06-09 17:29:32'),
(15, 14, 25, 0, '2023-06-09 17:29:41'),
(16, 17, 100, 10, '2023-06-10 07:05:18'),
(17, 18, 100, 10, '2023-06-10 07:05:29'),
(18, 19, 100, 10, '2023-06-10 07:05:43'),
(19, 21, 50, 10, '2023-06-22 07:15:26'),
(20, 22, 100, 10, '2023-06-22 07:39:38'),
(21, 23, 90, 10, '2023-06-22 07:56:38'),
(22, 24, 90, 10, '2023-06-22 08:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `sendforbinding`
--

CREATE TABLE `sendforbinding` (
  `ID` int(40) NOT NULL,
  `compileId` int(40) NOT NULL,
  `bindingVendor` int(40) NOT NULL,
  `paperQuantity` int(40) NOT NULL,
  `titlecardQuantity` int(40) NOT NULL,
  `separatorcardQuantity` int(40) NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sendforbinding`
--

INSERT INTO `sendforbinding` (`ID`, `compileId`, `bindingVendor`, `paperQuantity`, `titlecardQuantity`, `separatorcardQuantity`, `time`) VALUES
(4, 3, 2, 10, 5, 2, '2023-06-09 23:24:50.000000'),
(5, 4, 2, 10, 5, 6, '2023-06-10 07:08:26.000000'),
(6, 3, 2, 10, 5, 2, '2023-06-22 07:41:55.000000'),
(7, 6, 2, 5, 5, 5, '2023-06-22 07:59:42.000000');

-- --------------------------------------------------------

--
-- Table structure for table `sendforcompiling`
--

CREATE TABLE `sendforcompiling` (
  `ID` int(40) NOT NULL,
  `Size` int(40) NOT NULL,
  `Weight` int(40) NOT NULL,
  `compilingVendor` int(40) NOT NULL,
  `paperQuantity` int(40) NOT NULL,
  `titlecardQuantity` int(40) NOT NULL,
  `separatorcardQuantity` int(40) NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sendforcompiling`
--

INSERT INTO `sendforcompiling` (`ID`, `Size`, `Weight`, `compilingVendor`, `paperQuantity`, `titlecardQuantity`, `separatorcardQuantity`, `time`) VALUES
(3, 2, 2, 3, 10, 5, 2, '2023-06-09 19:23:18.000000'),
(4, 2, 2, 3, 10, 5, 6, '2023-06-10 07:08:04.000000'),
(5, 3, 1, 2, 10, 5, 5, '2023-06-22 07:41:13.000000'),
(6, 3, 1, 3, 5, 5, 5, '2023-06-22 07:59:01.000000');

-- --------------------------------------------------------

--
-- Table structure for table `sendforprinting`
--

CREATE TABLE `sendforprinting` (
  `ID` int(40) NOT NULL,
  `PID` int(40) NOT NULL,
  `printVendor` int(40) NOT NULL,
  `quantity` int(40) NOT NULL,
  `time` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sendforprinting`
--

INSERT INTO `sendforprinting` (`ID`, `PID`, `printVendor`, `quantity`, `time`) VALUES
(24, 6, 2, 30, '2023-05-22 11:50:38.000000'),
(26, 6, 2, 30, '2023-05-29 15:40:50.000000'),
(27, 6, 3, 20, '2023-05-29 15:46:31.000000'),
(28, 8, 3, 25, '2023-05-29 16:12:47.000000'),
(29, 6, 2, 50, '2023-05-30 06:20:37.000000'),
(30, 6, 2, 30, '2023-06-04 10:42:13.000000'),
(31, 9, 2, 20, '2023-06-04 10:47:12.000000'),
(32, 9, 2, 100, '2023-06-04 10:47:25.000000'),
(33, 6, 3, 170, '2023-06-04 10:47:54.000000'),
(34, 10, 3, 40, '2023-06-09 15:51:05.000000'),
(35, 10, 4, 40, '2023-06-09 15:51:17.000000'),
(36, 10, 3, 10, '2023-06-09 15:51:28.000000'),
(37, 13, 2, 25, '2023-06-09 17:30:07.000000'),
(38, 14, 3, 25, '2023-06-09 17:30:29.000000'),
(39, 17, 2, 20, '2023-06-10 07:06:04.000000'),
(40, 18, 3, 20, '2023-06-10 07:06:33.000000'),
(41, 19, 2, 20, '2023-06-10 07:06:53.000000'),
(42, 21, 2, 20, '2023-06-22 07:15:47.000000'),
(43, 22, 2, 20, '2023-06-22 07:40:11.000000'),
(44, 17, 4, 10, '2023-06-22 07:46:48.000000'),
(45, 19, 3, 20, '2023-06-22 07:47:27.000000'),
(46, 17, 3, 10, '2023-06-22 07:49:33.000000'),
(47, 23, 3, 80, '2023-06-22 07:57:40.000000');

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
-- Indexes for table `bindingvendor`
--
ALTER TABLE `bindingvendor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `rawmaterial_ID` (`rawmaterial_ID`),
  ADD KEY `SizeID` (`SizeID`),
  ADD KEY `VendorID` (`VendorID`),
  ADD KEY `WeightID` (`WeightID`);

--
-- Indexes for table `compilingvendor`
--
ALTER TABLE `compilingvendor`
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
  ADD PRIMARY KEY (`ID`),
  ADD KEY `rawmaterial_ID` (`rawmaterial_ID`),
  ADD KEY `SizeID` (`SizeID`),
  ADD KEY `VendorID` (`VendorID`),
  ADD KEY `WeightID` (`WeightID`);

--
-- Indexes for table `rawmaterialtype`
--
ALTER TABLE `rawmaterialtype`
  ADD PRIMARY KEY (`RawMaterialId`);

--
-- Indexes for table `receivebinding`
--
ALTER TABLE `receivebinding`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `bindId` (`bindId`);

--
-- Indexes for table `receivecompiling`
--
ALTER TABLE `receivecompiling`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `compileID` (`compileID`);

--
-- Indexes for table `receiveprinting`
--
ALTER TABLE `receiveprinting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `printID` (`printID`);

--
-- Indexes for table `recieveorder`
--
ALTER TABLE `recieveorder`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Purchase ID` (`Purchase ID`);

--
-- Indexes for table `sendforbinding`
--
ALTER TABLE `sendforbinding`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `compileId` (`compileId`),
  ADD KEY `bindingVendor` (`bindingVendor`);

--
-- Indexes for table `sendforcompiling`
--
ALTER TABLE `sendforcompiling`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `compilingVendor` (`compilingVendor`),
  ADD KEY `Size` (`Size`),
  ADD KEY `Weight` (`Weight`);

--
-- Indexes for table `sendforprinting`
--
ALTER TABLE `sendforprinting`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `printVendor` (`printVendor`),
  ADD KEY `PID` (`PID`);

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
-- AUTO_INCREMENT for table `bindingvendor`
--
ALTER TABLE `bindingvendor`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `catalog`
--
ALTER TABLE `catalog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `compilingvendor`
--
ALTER TABLE `compilingvendor`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `rawmaterialtype`
--
ALTER TABLE `rawmaterialtype`
  MODIFY `RawMaterialId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `receivebinding`
--
ALTER TABLE `receivebinding`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `receivecompiling`
--
ALTER TABLE `receivecompiling`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `receiveprinting`
--
ALTER TABLE `receiveprinting`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `recieveorder`
--
ALTER TABLE `recieveorder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `sendforbinding`
--
ALTER TABLE `sendforbinding`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sendforcompiling`
--
ALTER TABLE `sendforcompiling`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sendforprinting`
--
ALTER TABLE `sendforprinting`
  MODIFY `ID` int(40) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

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
-- Constraints for table `catalog`
--
ALTER TABLE `catalog`
  ADD CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`rawmaterial_ID`) REFERENCES `rawmaterialtype` (`RawMaterialId`),
  ADD CONSTRAINT `catalog_ibfk_2` FOREIGN KEY (`SizeID`) REFERENCES `size` (`ID`),
  ADD CONSTRAINT `catalog_ibfk_3` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`ID`),
  ADD CONSTRAINT `catalog_ibfk_4` FOREIGN KEY (`WeightID`) REFERENCES `weight` (`ID`);

--
-- Constraints for table `purchaseorder`
--
ALTER TABLE `purchaseorder`
  ADD CONSTRAINT `purchaseorder_ibfk_1` FOREIGN KEY (`rawmaterial_ID`) REFERENCES `rawmaterialtype` (`RawMaterialId`),
  ADD CONSTRAINT `purchaseorder_ibfk_2` FOREIGN KEY (`SizeID`) REFERENCES `size` (`ID`),
  ADD CONSTRAINT `purchaseorder_ibfk_3` FOREIGN KEY (`VendorID`) REFERENCES `vendor` (`ID`),
  ADD CONSTRAINT `purchaseorder_ibfk_4` FOREIGN KEY (`WeightID`) REFERENCES `weight` (`ID`);

--
-- Constraints for table `receivebinding`
--
ALTER TABLE `receivebinding`
  ADD CONSTRAINT `receivebinding_ibfk_1` FOREIGN KEY (`bindId`) REFERENCES `sendforbinding` (`ID`);

--
-- Constraints for table `receiveprinting`
--
ALTER TABLE `receiveprinting`
  ADD CONSTRAINT `receiveprinting_ibfk_1` FOREIGN KEY (`printID`) REFERENCES `sendforprinting` (`ID`);

--
-- Constraints for table `recieveorder`
--
ALTER TABLE `recieveorder`
  ADD CONSTRAINT `recieveorder_ibfk_1` FOREIGN KEY (`Purchase ID`) REFERENCES `purchaseorder` (`ID`);

--
-- Constraints for table `sendforbinding`
--
ALTER TABLE `sendforbinding`
  ADD CONSTRAINT `sendforbinding_ibfk_2` FOREIGN KEY (`bindingVendor`) REFERENCES `bindingvendor` (`ID`);

--
-- Constraints for table `sendforcompiling`
--
ALTER TABLE `sendforcompiling`
  ADD CONSTRAINT `sendforcompiling_ibfk_1` FOREIGN KEY (`Size`) REFERENCES `size` (`ID`),
  ADD CONSTRAINT `sendforcompiling_ibfk_2` FOREIGN KEY (`Weight`) REFERENCES `weight` (`ID`);

--
-- Constraints for table `sendforprinting`
--
ALTER TABLE `sendforprinting`
  ADD CONSTRAINT `sendforprinting_ibfk_2` FOREIGN KEY (`printVendor`) REFERENCES `printingvendor` (`ID`),
  ADD CONSTRAINT `sendforprinting_ibfk_3` FOREIGN KEY (`PID`) REFERENCES `purchaseorder` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

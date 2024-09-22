-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2016 at 01:09 PM
-- Server version: 5.6.25
-- PHP Version: 5.5.27


CREATE DATABASE project_milkteamanagement;

USE project_milkteamanagement;


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


--
-- Database: `project_milkteamanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id_cus` int(11) NOT NULL,
  `id_mem` int(11) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `day` date DEFAULT NULL,
  `pay` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_cus`, `id_mem`, `district`, `day`, `pay`) VALUES
(1, 0, 'Thanh Khe', '2016-02-02', 0),
(2, 5, 'Hai Chau', '2016-03-03', 0),
(3, 0, 'Lien Chieu', '2016-10-10', 0),
(4, 0, 'Son Tra ', '2016-04-04', 0),
(5, 1, 'Ngu Hanh Son', '2016-05-05', 0),
(6, 0, 'Lien Chieu', '2016-06-06', 0),
(7, 0, 'Hai Chau', '2016-06-07', 0),
(8, 1, 'Thanh Khe', '2016-07-07', 0),
(9, 7, 'Ngu Hanh Son', '2016-08-08', 0),
(10, 0, 'Cam Le', '2016-09-09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cus_pro`
--

CREATE TABLE IF NOT EXISTS `cus_pro` (
  `id_cus` int(11) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `quantity_detail` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cus_pro`
--

INSERT INTO `cus_pro` (`id_cus`, `id_pro`, `quantity_detail`) VALUES
(1, 1, '1'),
(1, 4, '2'),
(2, 1, '3'),
(2, 2, '1'),
(2, 3, '4'),
(6, 8, '2'),
(7, 5, '3'),
(8, 5, '4'),
(9, 6, '1'),
(10, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id_mem` int(11) NOT NULL,
  `name_mem` varchar(45) DEFAULT NULL,
  `save_mark` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_mem`, `name_mem`, `save_mark`) VALUES
(0, NULL, NULL),
(1, 'Lai', '2'),
(2, 'Dung', '2'),
(3, 'Mai', '4'),
(4, 'Phuc', '2'),
(5, 'Thanh', '1'),
(6, 'Vi', '4'),
(7, 'Tuan', '2'),
(8, 'Linh', '4'),
(9, 'Cuong', '1'),
(10, 'Danh', '4');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `id_pro` int(11) NOT NULL,
  `name_pro` varchar(45) DEFAULT NULL,
  `quantity_pro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_pro`, `name_pro`, `quantity_pro`) VALUES
(1, 'Dau', 125),
(2, 'Thai Xanh', 77),
(3, 'Dao', 97),
(4, 'Socola', 89),
(5, 'Cam', 57),
(6, 'Nho', 90),
(7, 'Quyt', 85),
(8, 'Viet Quat', 93),
(9, 'Me', 69);

-- --------------------------------------------------------

--
-- Table structure for table `ship`
--

CREATE TABLE IF NOT EXISTS `ship` (
  `id_ship` int(11) NOT NULL,
  `district` varchar(45) DEFAULT NULL,
  `price_ship` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ship`
--

INSERT INTO `ship` (`id_ship`, `district`, `price_ship`) VALUES
(1, 'Hai Chau', 0),
(2, 'Lien Chieu', 15000),
(3, 'Son Tra', 10000),
(4, 'Ngu Hanh Son', 15000),
(5, 'Cam Le', 15000),
(6, 'Thanh Khe', 5000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_cus`),
  ADD KEY `fk_customer_member_idx` (`id_mem`),
  ADD KEY `fk_customer_ship1_idx` (`district`);

--
-- Indexes for table `cus_pro`
--
ALTER TABLE `cus_pro`
  ADD PRIMARY KEY (`id_cus`,`id_pro`),
  ADD KEY `fk_cus_pro_product1_idx` (`id_pro`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_mem`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_pro`);

--
-- Indexes for table `ship`
--
ALTER TABLE `ship`
  ADD PRIMARY KEY (`id_ship`),
  ADD UNIQUE KEY `district_UNIQUE` (`district`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_member` FOREIGN KEY (`id_mem`) REFERENCES `member` (`id_mem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_customer_ship1` FOREIGN KEY (`district`) REFERENCES `ship` (`district`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `cus_pro`
--
ALTER TABLE `cus_pro`
  ADD CONSTRAINT `fk_cus_pro_customer1` FOREIGN KEY (`id_cus`) REFERENCES `customer` (`id_cus`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cus_pro_product1` FOREIGN KEY (`id_pro`) REFERENCES `product` (`id_pro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- update ship price
UPDATE `project_milkteamanagement`.`ship` SET `price_ship`='10000' WHERE `id_ship`='4';
UPDATE `project_milkteamanagement`.`ship` SET `price_ship`='5000' WHERE `id_ship`='5';
UPDATE `project_milkteamanagement`.`ship` SET `price_ship`='0' WHERE `id_ship`='6';




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


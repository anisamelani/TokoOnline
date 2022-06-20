-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2022 at 02:33 AM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_toko`
--
CREATE DATABASE IF NOT EXISTS `db_toko` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `db_toko`;

-- --------------------------------------------------------

--
-- Table structure for table `beli`
--

CREATE TABLE IF NOT EXISTS `beli` (
  `id_beli` int(11) NOT NULL AUTO_INCREMENT,
  `kd_barang` varchar(5) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`id_beli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `beli`
--

INSERT INTO `beli` (`id_beli`, `kd_barang`, `nama_barang`, `jumlah`) VALUES
(1, 'B0001', 'Sepatu kets', 10),
(2, 'B0002', 'Dasi ', 12);

--
-- Triggers `beli`
--
DROP TRIGGER IF EXISTS `beli_barang`;
DELIMITER //
CREATE TRIGGER `beli_barang` AFTER INSERT ON `beli`
 FOR EACH ROW BEGIN
INSERT INTO stok SET
kd_barang=NEW.kd_barang, jumlah=NEW.jumlah
ON DUPLICATE KEY UPDATE jumlah=jumlah+new.jumlah;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jual`
--

CREATE TABLE IF NOT EXISTS `jual` (
  `id_jual` int(11) NOT NULL AUTO_INCREMENT,
  `kd_pelanggan` varchar(10) NOT NULL,
  `kd_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`id_jual`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jual`
--

INSERT INTO `jual` (`id_jual`, `kd_pelanggan`, `kd_barang`, `nama_barang`, `jumlah`) VALUES
(1, 'P0001', 'B0001', 'Sepatu kets', 2);

--
-- Triggers `jual`
--
DROP TRIGGER IF EXISTS `trigger_jual`;
DELIMITER //
CREATE TRIGGER `trigger_jual` BEFORE INSERT ON `jual`
 FOR EACH ROW BEGIN 
UPDATE stok  SET jumlah=jumlah-new.jumlah
where kd_barang=new.kd_barang;
end
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE IF NOT EXISTS `stok` (
  `kd_barang` varchar(5) NOT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`kd_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`kd_barang`, `jumlah`) VALUES
('B0001', 8),
('B0002', 12);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `usia` int(11) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `alamat`, `usia`) VALUES
(1, 'admin', 'Jakarta Selatan', 25),
(2, 'Andi', 'Yogyakarta', 28),
(3, 'Lukman sardi', 'Bandung selatan ', 19);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
--
CREATE TABLE IF NOT EXISTS `view1` (
`kd_barang` varchar(5)
,`nama_barang` varchar(20)
,`jumlah` int(11)
);
-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1` AS select `s`.`kd_barang` AS `kd_barang`,`b`.`nama_barang` AS `nama_barang`,`s`.`jumlah` AS `jumlah` from (`stok` `s` join `beli` `b` on((`s`.`kd_barang` = `b`.`kd_barang`)));

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

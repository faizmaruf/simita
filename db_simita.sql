-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 24, 2023 at 12:18 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_simita`
--

-- --------------------------------------------------------

--
-- Table structure for table `captcha`
--

CREATE TABLE `captcha` (
  `captcha_id` int(10) UNSIGNED NOT NULL,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_inv_kode`
--

CREATE TABLE `tbl_inv_kode` (
  `id` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `param1` varchar(10) NOT NULL,
  `param2` varchar(10) NOT NULL,
  `last_used` varchar(255) NOT NULL,
  `used_by` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_inv_kode`
--

INSERT INTO `tbl_inv_kode` (`id`, `nama_barang`, `keterangan`, `value`, `param1`, `param2`, `last_used`, `used_by`, `created_at`, `updated_at`) VALUES
(1, 'Laptop', 'Urut Kode Laptop', '22', 'LAP', 'IT', '00022/LAP/IT/VII/2023', 'faizmaruf', '2023-06-22 14:38:26', '2023-07-06 04:18:27'),
(2, 'Komputer', 'Urut Kode Komputer', '5', 'KOM', 'IT', '00005/KOM/IT/VII/2023', 'faizmaruf', '2023-07-02 16:15:14', '2023-07-04 08:53:51'),
(3, 'Monitor', 'Urut Kode Monitor', '5', 'MON', 'IT', '00005/MON/IT/VII/2023', 'faizmaruf', '2023-07-04 14:55:16', '2023-07-06 04:17:49'),
(4, 'Printer', 'Urut Kode Printer', '2', 'PRN', 'IT', '00002/PRN/IT/VII/2023', 'faizmaruf', '2023-07-06 09:28:40', '2023-07-12 04:57:04'),
(5, 'Device', 'Urut Kode Device', '5', 'SUP', 'IT', '00005/SUP/IT/VII/2023', 'faizmaruf', '2023-07-12 10:34:07', '2023-07-13 04:22:52');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(30) NOT NULL DEFAULT '',
  `id_kategori` int(30) DEFAULT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `merek_barang` varchar(30) DEFAULT NULL,
  `spesifikasi` varchar(250) DEFAULT NULL,
  `satuan` enum('PCS','PACK','UNIT','ROLL','METER','BUAH') DEFAULT 'PCS',
  `gid` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_departemen`
--

CREATE TABLE `tb_departemen` (
  `id_dept` int(10) NOT NULL,
  `gid` int(10) DEFAULT NULL,
  `nama` varchar(40) DEFAULT NULL,
  `parent` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_departemen`
--

INSERT INTO `tb_departemen` (`id_dept`, `gid`, `nama`, `parent`) VALUES
(2, 1, 'TECHNIC', 1),
(3, 1, 'CIVIL', 1),
(4, 1, 'IPAL', 1),
(6, 1, 'QUALITY CONTROL', 5),
(7, 1, 'PROSES CONTROL', 5),
(8, 1, 'JAHIT/ KEMAS', 5),
(9, 1, 'KEMAS', 8),
(10, 1, 'DISTRIBUSI', 8),
(16, 1, 'FINISHING', 15),
(17, 1, 'PRINTING PREP', 15),
(18, 1, 'PRINTING PROD', 15),
(19, 1, 'DESIGNER PRINTING', 15),
(21, 1, 'DYEING', 20),
(23, 1, 'WAREHOUSE', 22),
(24, 1, 'PURCHASING', 22),
(25, 1, 'MATERIAL CONTROL', 22),
(27, 1, 'PPIC PPC', 26),
(28, 1, 'MATERIAL CONTROL', 26),
(33, 1, 'PRODUKSI PPIC', 32),
(35, 1, 'WEAVING 2 DAN 3 ', 32),
(36, 1, 'QC WEAVING', 32),
(37, 1, 'FINANCE & ACCOUNTING', 0),
(38, 1, 'FINANCE', 37),
(39, 1, 'ACCOUNTING', 37),
(40, 1, 'IT', 0),
(41, 1, 'IT Support', 40),
(48, 1, 'SALES SUPPORT', 47),
(49, 1, 'SALES HEAD', 47),
(57, 2, 'TEKNIK', 0),
(58, 2, 'HRD & GA', 0),
(59, 2, 'FINANCE & ACCOUNTING', 0),
(70, 2, 'ICT', 0),
(71, 2, 'NETWARE', 70),
(72, 1, 'AFTER SALES', 0),
(73, 1, 'SERVICE ADVISOR', 72),
(74, 1, 'SERVICE ADMIN', 72),
(75, 1, 'SRO', 72),
(76, 1, 'KEPALA BENGKEL', 72),
(77, 1, 'MARKETING SUPPORT', 47),
(78, 1, 'CRO', 47),
(79, 1, 'SPAREPART ADMIN', 72),
(80, 1, 'KASIR SERVICE', 37),
(81, 1, 'KASIR BESAR', 37),
(82, 1, 'HRD/GA', 11),
(83, 1, 'SALES ADMIN', 47),
(84, 1, 'KEPALA CABANG', 47);

-- --------------------------------------------------------

--
-- Table structure for table `tb_group`
--

CREATE TABLE `tb_group` (
  `gid` int(11) NOT NULL,
  `nama_group` varchar(20) NOT NULL,
  `nama_alias` varchar(3) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `logo` varchar(50) NOT NULL,
  `logo_dashboard` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_group`
--

INSERT INTO `tb_group` (`gid`, `nama_group`, `nama_alias`, `alamat`, `logo`, `logo_dashboard`) VALUES
(1, 'Jabodetabek', 'JKT', 'Jabodetabek', 'k1.png', 'k1.png'),
(2, 'Jawa Timur', 'SBY', 'Jawa Timur', 'k7.png', 'k7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_internet`
--

CREATE TABLE `tb_internet` (
  `id_internet` int(11) NOT NULL,
  `nama_provider` varchar(45) NOT NULL,
  `nama_cabang` varchar(45) NOT NULL,
  `nomor_pelanggan` varchar(45) NOT NULL,
  `tipe_koneksi` varchar(45) NOT NULL,
  `ip_public` varchar(45) NOT NULL,
  `spesifikasi` varchar(200) NOT NULL,
  `tanggal_kontrak` date NOT NULL,
  `masa_kontrak` date NOT NULL,
  `status` varchar(13) NOT NULL,
  `biaya` varchar(45) NOT NULL,
  `gid` varchar(45) DEFAULT NULL,
  `kode_internet` varchar(45) NOT NULL,
  `createddate` datetime NOT NULL,
  `createby` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_inv_device`
--

CREATE TABLE `tb_inv_device` (
  `id_device` int(255) NOT NULL,
  `no_inventaris` varchar(255) NOT NULL,
  `lokasi` varchar(50) DEFAULT NULL,
  `jenis_device` varchar(50) DEFAULT NULL,
  `spesifikasi` varchar(200) DEFAULT NULL,
  `tgl_inv` date DEFAULT NULL,
  `harga_beli` decimal(20,0) NOT NULL,
  `status` enum('DIGUNAKAN','SIAP DIGUNAKAN','DIPERBAIKI','DIPINJAMKAN','ARSIP/DISIMPAN','RUSAK/NOT FIXABLE','HILANG/DICURI') DEFAULT 'DIGUNAKAN',
  `gid` int(20) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` varchar(20) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `updateby` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_inv_device`
--

INSERT INTO `tb_inv_device` (`id_device`, `no_inventaris`, `lokasi`, `jenis_device`, `spesifikasi`, `tgl_inv`, `harga_beli`, `status`, `gid`, `createdate`, `createby`, `updatedate`, `updateby`) VALUES
(5, '00005/SUP/IT/VII/2023', 'RUANG SERVER', 'HUB', 'GWERAGWAEGFWG', '2023-07-12', '525235', 'DIGUNAKAN', 1, '2023-07-13 04:22:52', 'faizmaruf', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_inv_history`
--

CREATE TABLE `tb_inv_history` (
  `id_history` int(11) NOT NULL,
  `no_inventaris` varchar(255) DEFAULT NULL,
  `tgl_update` datetime DEFAULT NULL,
  `status` enum('Buat Baru','Dipinjamkan','Kembali','Mutasi') DEFAULT 'Buat Baru',
  `admin` varchar(30) DEFAULT NULL,
  `id_pengguna_awal` varchar(30) DEFAULT NULL,
  `id_pengguna` varchar(30) DEFAULT NULL,
  `lokasi` varchar(50) DEFAULT NULL,
  `note` varchar(80) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` varchar(45) DEFAULT NULL,
  `lastupdate` datetime DEFAULT NULL,
  `updateby` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_inv_history`
--

INSERT INTO `tb_inv_history` (`id_history`, `no_inventaris`, `tgl_update`, `status`, `admin`, `id_pengguna_awal`, `id_pengguna`, `lokasi`, `note`, `createdate`, `createby`, `lastupdate`, `updateby`) VALUES
(1, 'NET-PMT-001', '2023-06-21 09:14:21', 'Buat Baru', 'Ahmad Sopian', NULL, NULL, 'RUANG SERVER', 'New Inventory', NULL, NULL, NULL, NULL),
(2, '00005/LAP/IT/VI/2023', '2023-06-28 04:40:06', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0001', 'U023.0001', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(3, '00006/LAP/IT/VI/2023', '2023-06-28 05:55:35', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0003', 'U023.0003', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(4, '00007/LAP/IT/VI/2023', '2023-06-28 06:42:27', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0003', 'U023.0003', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(5, '00008/LAP/IT/VI/2023', '2023-06-28 08:51:03', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0003', 'U023.0003', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(6, '00009/LAP/IT/VI/2023', '2023-06-28 08:52:17', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0003', 'U023.0003', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(7, '00010/LAP/IT/VI/2023', '2023-06-28 10:24:30', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0003', 'U023.0003', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(8, '00011/LAP/IT/VI/2023', '2023-06-28 12:19:36', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(9, '00013/LAP/IT/VII/2023', '2023-07-03 04:23:28', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(10, '00014/LAP/IT/VII/2023', '2023-07-03 04:39:57', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0001', 'U023.0001', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(11, '00015/LAP/IT/VII/2023', '2023-07-03 04:41:43', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0001', 'U023.0001', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(12, '00016/LAP/IT/VII/2023', '2023-07-03 04:45:11', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0001', 'U023.0001', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(13, '00017/LAP/IT/VII/2023', '2023-07-03 04:48:45', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0001', 'U023.0001', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(14, '00018/LAP/IT/VII/2023', '2023-07-03 04:50:36', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(15, '00019/LAP/IT/VII/2023', '2023-07-03 06:30:43', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(16, '', '2023-07-03 11:53:10', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(17, '00003/KOM/IT/VII/2023', '2023-07-04 04:03:40', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(18, '00004/KOM/IT/VII/2023', '2023-07-04 08:20:27', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(19, '00005/KOM/IT/VII/2023', '2023-07-04 08:53:51', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(20, NULL, '2023-07-04 09:57:06', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(21, NULL, '2023-07-04 09:58:55', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(22, NULL, '2023-07-04 10:00:56', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(23, NULL, '2023-07-04 10:01:21', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(24, NULL, '2023-07-04 10:01:23', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(25, NULL, '2023-07-04 10:01:24', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(26, NULL, '2023-07-04 10:01:58', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(27, '00002/MON/IT/VII/2023', '2023-07-04 10:04:12', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(28, '00002/MON/IT/VII/2023', '2023-07-06 03:59:09', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(29, '00003/MON/IT/VII/2023', '2023-07-06 04:00:39', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(30, '00004/MON/IT/VII/2023', '2023-07-06 04:11:38', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(31, '00005/MON/IT/VII/2023', '2023-07-06 04:14:39', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(32, '00005/MON/IT/VII/2023', '2023-07-06 04:17:49', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(33, '00022/LAP/IT/VII/2023', '2023-07-06 04:18:27', 'Buat Baru', 'Faiz Alauddin Maruf', 'U023.0004', 'U023.0004', NULL, 'Inventory Baru', NULL, NULL, NULL, NULL),
(34, '00001/PRN/IT/VII/2023', '2023-07-06 05:41:47', 'Buat Baru', 'Faiz Alauddin Maruf', NULL, 'U023.0004', NULL, 'New Inventory', NULL, NULL, NULL, NULL),
(35, '00002/PRN/IT/VII/2023', '2023-07-12 04:57:04', 'Buat Baru', 'Faiz Alauddin Maruf', NULL, 'U023.0004', NULL, 'New Inventory', NULL, NULL, NULL, NULL),
(36, '00001/SUP/IT/VII/2023', '2023-07-12 08:48:20', 'Buat Baru', 'Faiz Alauddin Maruf', NULL, NULL, 'RUANG SERVER', 'New Inventory', NULL, NULL, NULL, NULL),
(37, '00002/SUP/IT/VII/2023', '2023-07-13 04:16:15', 'Buat Baru', 'Faiz Alauddin Maruf', NULL, NULL, 'RUANG SERVER', 'New Inventory', NULL, NULL, NULL, NULL),
(38, '00003/SUP/IT/VII/2023', '2023-07-13 04:19:05', 'Buat Baru', 'Faiz Alauddin Maruf', NULL, NULL, 'RUANG SERVER', 'New Inventory', NULL, NULL, NULL, NULL),
(39, '00004/SUP/IT/VII/2023', '2023-07-13 04:20:34', 'Buat Baru', 'Faiz Alauddin Maruf', NULL, NULL, 'RUANG SERVER', 'New Inventory', NULL, NULL, NULL, NULL),
(40, '00005/SUP/IT/VII/2023', '2023-07-13 04:22:52', 'Buat Baru', 'Faiz Alauddin Maruf', NULL, NULL, 'RUANG SERVER', 'New Inventory', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_inv_komputer`
--

CREATE TABLE `tb_inv_komputer` (
  `id_komputer` int(20) NOT NULL,
  `no_inventaris` varchar(255) NOT NULL,
  `id_pengguna` varchar(30) DEFAULT NULL,
  `nama_komputer` varchar(50) DEFAULT NULL,
  `tipe` varchar(45) DEFAULT NULL,
  `spesifikasi` varchar(200) DEFAULT NULL,
  `serial_number` varchar(20) DEFAULT NULL,
  `kode_lisensi` varchar(50) DEFAULT NULL,
  `network` varchar(30) DEFAULT NULL,
  `tgl_inv` date DEFAULT NULL,
  `tgl_garansi` date NOT NULL,
  `harga_beli` decimal(20,0) NOT NULL,
  `status` enum('DIGUNAKAN','SIAP DIGUNAKAN','DIPERBAIKI','DIPINJAMKAN','ARSIP/DISIMPAN','RUSAK/NOT FIXABLE','HILANG/DICURI') DEFAULT 'DIGUNAKAN',
  `note` varchar(30) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `createby` varchar(20) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updateby` varchar(20) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_inv_komputer`
--

INSERT INTO `tb_inv_komputer` (`id_komputer`, `no_inventaris`, `id_pengguna`, `nama_komputer`, `tipe`, `spesifikasi`, `serial_number`, `kode_lisensi`, `network`, `tgl_inv`, `tgl_garansi`, `harga_beli`, `status`, `note`, `gid`, `createby`, `createdate`, `updateby`, `updatedate`) VALUES
(2, '00003/KOM/IT/VII/2023', 'U023.0004', 'DELL', 'LATITUDE 3331', '<p>er3qarqrefwfewqf</p>', 'DFDSSD21', 'LIC-JKT-0623001', '111.111.111.111', '2023-07-07', '2023-07-06', '34232423', 'DIGUNAKAN', 'ewfef', 1, 'faizmaruf', '2023-07-04 04:03:40', 'faizmaruf', '2023-07-13 11:47:40'),
(4, '00005/KOM/IT/VII/2023', 'U023.0004', 'HP', 'LATITUDE 3331', '<p>fsfsdvvdsv</p>', 'FEWDFW', 'LIC-JKT-0623001', '111.111.111.111', '2023-07-20', '2023-07-06', '3243124132', 'DIGUNAKAN', NULL, 1, 'faizmaruf', '2023-07-04 08:53:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_inv_laptop`
--

CREATE TABLE `tb_inv_laptop` (
  `id_laptop` int(30) NOT NULL,
  `no_inventaris` varchar(255) NOT NULL,
  `id_pengguna` varchar(30) DEFAULT NULL,
  `nama_laptop` varchar(50) DEFAULT NULL,
  `tipe_laptop` varchar(50) NOT NULL,
  `spesifikasi` varchar(300) DEFAULT NULL,
  `serial_number` varchar(20) DEFAULT NULL,
  `kode_lisensi` varchar(30) DEFAULT NULL,
  `network` varchar(30) DEFAULT NULL,
  `tgl_inv` date DEFAULT NULL,
  `tgl_garansi` date DEFAULT NULL,
  `harga_beli` decimal(10,0) NOT NULL,
  `status` enum('DIGUNAKAN','SIAP DIGUNAKAN','DIPERBAIKI','DIPINJAMKAN','ARSIP/DISIMPAN','RUSAK/NOT FIXABLE','HILANG/DICURI') DEFAULT 'DIGUNAKAN',
  `note` varchar(100) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` varchar(45) DEFAULT NULL,
  `updateby` varchar(45) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_inv_laptop`
--

INSERT INTO `tb_inv_laptop` (`id_laptop`, `no_inventaris`, `id_pengguna`, `nama_laptop`, `tipe_laptop`, `spesifikasi`, `serial_number`, `kode_lisensi`, `network`, `tgl_inv`, `tgl_garansi`, `harga_beli`, `status`, `note`, `gid`, `createdate`, `createby`, `updateby`, `updatedate`) VALUES
(18, '00018/LAP/IT/VII/2023', 'U023.0004', 'APPLE', 'LATITUDE 3330', '<p>Hdhsh</p>', '7383', 'LIC-JKT-0623001', '111.111.111.111', '2023-07-06', '2023-07-20', '5088', 'SIAP DIGUNAKAN', 'EFWEF', 1, '2023-07-03 04:50:36', 'faizmaruf', 'faizmaruf', '2023-07-06 06:42:26'),
(19, '00019/LAP/IT/VII/2023', 'U023.0004', 'APPLE', 'LATITUDE 3330', '<p>dsfsdfds</p>', '321313', 'LIC-JKT-0623001', '111.111.111.111', '2023-07-06', '2023-07-30', '312312', 'DIGUNAKAN', NULL, 1, '2023-07-03 06:30:43', 'faizmaruf', NULL, NULL),
(20, '00022/LAP/IT/VII/2023', 'U023.0004', 'DELL', 'MACBOOK PRO 2012 15 INCH', '<p>dghfgefrgergsdfbsb</p>', 'DFGERF', 'LIC-JKT-0623001', '111.111.111.111', '2023-07-28', '2023-07-20', '253523523', 'DIGUNAKAN', 'FBDB', 1, '2023-07-06 04:18:27', 'faizmaruf', 'faizmaruf', '2023-07-13 12:00:52');

-- --------------------------------------------------------

--
-- Table structure for table `tb_inv_monitor`
--

CREATE TABLE `tb_inv_monitor` (
  `id_monitor` int(30) NOT NULL,
  `no_inventaris` varchar(255) NOT NULL,
  `id_pengguna` varchar(30) DEFAULT NULL,
  `jenis_monitor` enum('LED','LCD','CRT','TOUCH SCREEN') DEFAULT 'LED',
  `spesifikasi` varchar(200) DEFAULT NULL,
  `tgl_inv` date DEFAULT NULL,
  `harga_beli` decimal(20,0) NOT NULL,
  `status` enum('DIGUNAKAN','SIAP DIGUNAKAN','DIPERBAIKI','DIPINJAMKAN','ARSIP/DISIMPAN','RUSAK/NOT FIXABLE','DIJUAL/HILANG') DEFAULT 'DIGUNAKAN',
  `note` varchar(100) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `createby` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_inv_monitor`
--

INSERT INTO `tb_inv_monitor` (`id_monitor`, `no_inventaris`, `id_pengguna`, `jenis_monitor`, `spesifikasi`, `tgl_inv`, `harga_beli`, `status`, `note`, `gid`, `createddate`, `createby`) VALUES
(1, '00002/MON/IT/VII/2023', 'U023.0004', 'LED', 'sdfsfds', '2023-07-20', '312312', 'DIGUNAKAN', NULL, 1, '2023-07-04 10:04:12', 'faizmaruf'),
(3, '00003/MON/IT/VII/2023', 'U023.0004', 'TOUCH SCREEN', 'gvfsgrwfg', '2023-07-11', '5235235235235', 'DIGUNAKAN', NULL, 1, '2023-07-06 04:00:39', 'faizmaruf'),
(4, '00004/MON/IT/VII/2023', 'U023.0004', 'LED', 'gswdgsgdsg', '2023-07-11', '52523', 'DIGUNAKAN', NULL, 1, '2023-07-06 04:11:38', 'faizmaruf'),
(7, '00005/MON/IT/VII/2023', 'U023.0004', 'LED', 'gsgdsgfefewfwef', '2023-07-24', '25352', 'DIGUNAKAN', 'dsfsd', 1, '2023-07-06 04:17:49', 'faizmaruf');

-- --------------------------------------------------------

--
-- Table structure for table `tb_inv_network`
--

CREATE TABLE `tb_inv_network` (
  `id_network` int(20) NOT NULL,
  `kode_network` varchar(30) NOT NULL,
  `namacabang` varchar(50) DEFAULT NULL,
  `lokasi` varchar(50) DEFAULT NULL,
  `jenis_network` varchar(50) DEFAULT NULL,
  `spesifikasi` varchar(200) DEFAULT NULL,
  `tgl_inv` date DEFAULT NULL,
  `harga_beli` decimal(20,0) NOT NULL,
  `status` enum('DIGUNAKAN','SIAP DIGUNAKAN','DIPERBAIKI','DIPINJAMKAN','ARSIP/DISIMPAN','RUSAK/NOT FIXABLE','HILANG/DICURI') DEFAULT 'DIGUNAKAN',
  `gid` int(20) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` varchar(20) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `updateby` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_inv_printer`
--

CREATE TABLE `tb_inv_printer` (
  `id_printer` int(20) NOT NULL,
  `no_inventaris` varchar(255) DEFAULT NULL,
  `id_pengguna` varchar(30) DEFAULT NULL,
  `jenis_printer` enum('DESKJET','LASERJET','DOTMATRIX','ALL-IN','SCANER','FAX') DEFAULT 'DESKJET',
  `merk` varchar(45) NOT NULL,
  `spesifikasi` varchar(200) DEFAULT NULL,
  `tgl_inv` date DEFAULT NULL,
  `harga_beli` decimal(20,0) NOT NULL,
  `status` enum('DIGUNAKAN','SIAP DIGUNAKAN','DIPERBAIKI','DIPINJAMKAN','ARSIP/DISIMPAN','RUSAK/NOT FIXABLE','HILANG/DICURI') DEFAULT 'DIGUNAKAN',
  `note` varchar(100) DEFAULT NULL,
  `isSewa` varchar(5) DEFAULT NULL,
  `supplier` varchar(45) DEFAULT NULL,
  `createby` varchar(20) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updateby` varchar(20) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `gid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_inv_printer`
--

INSERT INTO `tb_inv_printer` (`id_printer`, `no_inventaris`, `id_pengguna`, `jenis_printer`, `merk`, `spesifikasi`, `tgl_inv`, `harga_beli`, `status`, `note`, `isSewa`, `supplier`, `createby`, `createdate`, `updateby`, `updatedate`, `gid`) VALUES
(2, '00002/PRN/IT/VII/2023', 'U023.0004', 'ALL-IN', 'EPSON', 'gergrwa', '2023-06-27', '52345', 'DIGUNAKAN', NULL, 'False', '1', 'faizmaruf', '2023-07-12 04:57:04', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jabatan`
--

CREATE TABLE `tb_jabatan` (
  `id_jabatan` int(30) NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL,
  `jobdes` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jabatan`
--

INSERT INTO `tb_jabatan` (`id_jabatan`, `nama_jabatan`, `jobdes`) VALUES
(1, 'PRESIDEN DIREKTUR', ''),
(2, 'DIREKTUR', ''),
(3, 'SALES HEAD', ''),
(4, 'FOREMAN', ''),
(5, 'SENIOR FOREMAN', ''),
(6, 'STAFF', ''),
(7, 'SUPPORT', ''),
(8, 'KEPALA CABANG', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori`
--

INSERT INTO `tb_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Komputer'),
(2, 'Laptop'),
(3, 'Periferal'),
(4, 'Separepart'),
(5, 'Network Device'),
(6, 'ATK'),
(7, 'Monitor'),
(8, 'Printer'),
(9, 'Alat'),
(10, 'Habis Pakai');

-- --------------------------------------------------------

--
-- Table structure for table `tb_lisensi`
--

CREATE TABLE `tb_lisensi` (
  `id_lisensi` int(11) NOT NULL,
  `kode_mikrotik` varchar(45) DEFAULT NULL,
  `kode_lisensi` varchar(45) DEFAULT NULL,
  `id_supplier` varchar(20) DEFAULT NULL,
  `jenis_lisensi` varchar(45) DEFAULT NULL,
  `id_cabang` varchar(20) DEFAULT NULL,
  `key_lisensi` varchar(100) DEFAULT NULL,
  `tgl_pembelian` date DEFAULT NULL,
  `tgl_habis` date DEFAULT NULL,
  `jumlah_lisensi` varchar(45) DEFAULT NULL,
  `jumlah_terpakai` varchar(45) DEFAULT NULL,
  `keterangan` varchar(200) DEFAULT NULL,
  `createby` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updateby` varchar(45) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `gid` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_lisensi`
--

INSERT INTO `tb_lisensi` (`id_lisensi`, `kode_mikrotik`, `kode_lisensi`, `id_supplier`, `jenis_lisensi`, `id_cabang`, `key_lisensi`, `tgl_pembelian`, `tgl_habis`, `jumlah_lisensi`, `jumlah_terpakai`, `keterangan`, `createby`, `createdate`, `updateby`, `updatedate`, `gid`) VALUES
(1, NULL, 'LIC-JKT-0623001', '1', 'AntiVirus', NULL, '13213123213', '2023-06-08', '2023-05-31', '1', NULL, '<p>213213</p>', 'faizmaruf', '2023-06-28 10:20:25', NULL, NULL, '1'),
(2, NULL, 'LIC-JKT-0623001', '1', 'OS', NULL, 'WINDOWS', '2023-06-07', '2023-06-14', '432', NULL, '<p>gfdgdfg</p>', 'faizmaruf', '2023-06-28 11:34:13', NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_maintenance`
--

CREATE TABLE `tb_maintenance` (
  `no_permohonan` varchar(15) NOT NULL DEFAULT '',
  `tgl_permohonan` datetime DEFAULT NULL,
  `tgl_estimasi` date DEFAULT NULL,
  `tgl_selesai` datetime DEFAULT NULL,
  `jenis_permohonan` varchar(50) DEFAULT NULL,
  `nama_kategori` varchar(20) DEFAULT NULL,
  `no_inventaris` varchar(20) DEFAULT NULL,
  `aset_hrd` varchar(50) DEFAULT NULL,
  `catatan_pemohon` varchar(100) DEFAULT NULL,
  `nama_pemohon` varchar(50) DEFAULT 'Admin',
  `catatan_perbaikan` varchar(100) DEFAULT NULL,
  `nama_supplier` varchar(50) DEFAULT NULL,
  `biaya` decimal(10,0) DEFAULT NULL,
  `lama_garansi` varchar(45) DEFAULT NULL,
  `status` enum('OPEN','PROCESS','PENDING','CLOSED') DEFAULT 'OPEN',
  `gid` int(11) DEFAULT NULL,
  `terbilang` varchar(100) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `createby` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tb_maintenance_detail`
--

CREATE TABLE `tb_maintenance_detail` (
  `id_detail` int(50) NOT NULL,
  `no_permohonan` varchar(15) NOT NULL DEFAULT '',
  `tgl_proses` datetime DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `user` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tb_manufacture`
--

CREATE TABLE `tb_manufacture` (
  `id_manufacture` int(11) NOT NULL,
  `nama_manufacture` varchar(45) NOT NULL,
  `jenis` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_manufacture`
--

INSERT INTO `tb_manufacture` (`id_manufacture`, `nama_manufacture`, `jenis`) VALUES
(1, 'DELL', 'MERK-PC'),
(4, 'EPSON', 'MERK-PRINTER'),
(5, 'TRANSCEND', 'MERK-PERIPERAL'),
(6, 'AntiVirus', 'TIPE'),
(7, 'Microsoft Office', 'TIPE'),
(8, 'HP', 'MERK-PC'),
(9, 'ASUS', 'MERK-PC'),
(10, 'LATITUDE 3331', 'MODEL-PC'),
(11, 'LQ-2190', 'MODEL-PRINTER'),
(12, 'HDD External', 'JENIS-DEVICE'),
(13, 'Switch HUB', 'JENIS-DEVICE'),
(14, 'DELL', 'MERK-LAPTOP'),
(15, 'LATITUDE 3330', 'MODEL-LAPTOP'),
(18, 'APPLE', 'MERK-LAPTOP'),
(19, 'MACBOOK PRO 2012 15 INCH', 'MODEL-LAPTOP');

-- --------------------------------------------------------

--
-- Table structure for table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `icon` varchar(40) NOT NULL,
  `link` varchar(30) NOT NULL,
  `parent` int(11) NOT NULL,
  `role` enum('Administrator','Admin') DEFAULT 'Admin',
  `aktif` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_menu`
--

INSERT INTO `tb_menu` (`id_menu`, `nama_menu`, `icon`, `link`, `parent`, `role`, `aktif`) VALUES
(1, 'Dashboard', 'fa fa-home', 'dashboard', 0, 'Admin', 'Y'),
(2, 'Master', 'fa fa-suitcase', '#', 0, 'Administrator', 'Y'),
(3, 'Barang', 'fa fa-plus-square text-aqua', 'barang', 2, 'Administrator', 'Y'),
(4, 'Supplier', 'fa fa-truck text-aqua', 'supplier', 2, 'Administrator', 'Y'),
(5, 'Pengguna', 'fa fa-user text-aqua', 'pengguna', 2, 'Administrator', 'Y'),
(6, 'Inventory', 'fa fa-university', '#', 0, 'Admin', 'Y'),
(7, 'Laptop', 'fa fa-laptop text-aqua', 'laptop', 6, 'Admin', 'Y'),
(8, 'PC/ Komputer', 'fa fa-desktop text-aqua', 'komputer', 6, 'Admin', 'Y'),
(9, 'Monitor', 'fa fa-barcode text-aqua', 'monitor', 6, 'Admin', 'Y'),
(10, 'Printer', 'fa fa-print text-aqua', 'printer', 6, 'Admin', 'Y'),
(11, 'Device Suport', 'fa fa-sitemap text-aqua', 'device', 6, 'Admin', 'Y'),
(12, 'Transaksi', 'fa fa-th-list', '#', 0, 'Admin', 'Y'),
(13, 'Barang Masuk', 'fa fa-shopping-cart text-aqua', 'masuk', 12, 'Admin', 'Y'),
(14, 'Barang Keluar', 'fa fa-minus-square text-aqua', 'keluar', 12, 'Admin', 'Y'),
(16, 'Stok Barang', 'fa fa-th-large text-aqua', 'stok', 12, 'Admin', 'Y'),
(17, 'Maintenance', 'fa fa-wrench', '#', 0, 'Administrator', 'Y'),
(19, 'Dedpartemen', 'fa fa-align-center text-aqua', 'departemen', 2, 'Administrator', 'Y'),
(20, 'Inventory', 'fa fa-list-alt text-aqua', 'maintenance', 17, 'Administrator', 'Y'),
(22, 'Seting', 'fa fa-cogs', '#', 0, 'Administrator', 'Y'),
(23, 'Menu seting', 'fa  fa-bars text-aqua', 'menu', 22, 'Administrator', 'Y'),
(24, 'User Seting', 'fa fa-user-circle text-aqua', 'user', 22, 'Administrator', 'Y'),
(25, 'Archived', 'fa fa-save text-aqua', 'archived', 6, 'Admin', 'Y'),
(26, 'Group Seting', 'fa fa-users text-aqua', 'group', 22, 'Admin', 'Y'),
(29, 'Provider Internet', 'fa fa-signal text-aqua', 'provider', 2, 'Administrator', 'Y'),
(30, 'Koneksi Internet', 'fa fa-globe text-aqua', 'internet', 6, 'Admin', 'Y'),
(31, 'Master Referensi', 'fa fa-bullseye text-aqua', 'manufacture', 2, 'Administrator', 'Y'),
(32, 'Laporan', 'fa fa-print', '#', 0, 'Admin', 'Y'),
(33, 'Inventory Laptop', 'fa fa-file-excel-o text-aqua', 'laptop/export_excel', 32, 'Admin', 'Y'),
(34, 'Laporan Register', 'fa fa-book text-aqua', '#', 32, 'Admin', 'Y'),
(35, 'Tipe (Model)', 'fa fa-qrcode text-aqua', 'model', 2, 'Administrator', 'Y'),
(36, 'Lisensi & Password', 'fa fa-key', '#', 0, 'Administrator', 'Y'),
(37, 'AntiVirus & Software', 'fa fa-syringe', 'lisensi', 36, 'Admin', 'Y'),
(39, 'Permintaan Barang', 'fas fa-box-open text-aqua', 'permintaan', 12, 'Admin', 'Y'),
(40, 'Mikrotik', 'fa fa-unlock-alt', 'mikrotik', 36, 'Admin', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mikrotik`
--

CREATE TABLE `tb_mikrotik` (
  `id_mikrotik` int(11) NOT NULL,
  `kode_cabang` varchar(45) NOT NULL,
  `ip_public` varchar(45) NOT NULL,
  `provider` varchar(45) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `keterangan` varchar(45) DEFAULT NULL,
  `createby` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updateby` varchar(45) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelayanan`
--

CREATE TABLE `tb_pelayanan` (
  `id` int(11) NOT NULL,
  `tgl_pelayanan` datetime DEFAULT NULL,
  `id_pengguna` varchar(50) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` varchar(30) NOT NULL DEFAULT '',
  `nama_pengguna` varchar(30) NOT NULL,
  `id_dept` int(30) NOT NULL,
  `id_jabatan` int(30) NOT NULL,
  `ruang_kantor` varchar(50) NOT NULL,
  `createby` varchar(45) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nama_pengguna`, `id_dept`, `id_jabatan`, `ruang_kantor`, `createby`, `createdate`) VALUES
('U023.0004', 'SIKIT', 40, 1, 'fsdf', 'faizmaruf', '2023-06-28 12:17:36');

-- --------------------------------------------------------

--
-- Table structure for table `tb_permintaandtl`
--

CREATE TABLE `tb_permintaandtl` (
  `id_trans_detail` int(30) NOT NULL DEFAULT 0,
  `kode_permintaan` varchar(30) DEFAULT NULL,
  `tgl_permintaan` date NOT NULL,
  `kode_barang` varchar(30) DEFAULT NULL,
  `qty_permintaan` int(10) DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `gid` varchar(45) NOT NULL,
  `createddate` date DEFAULT NULL,
  `createby` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_permintaanhdr`
--

CREATE TABLE `tb_permintaanhdr` (
  `id_permintaan` int(30) NOT NULL DEFAULT 0,
  `kode_permintaan` varchar(30) DEFAULT NULL,
  `tgl_permintaan` date DEFAULT NULL,
  `id_supplier` int(20) DEFAULT NULL,
  `scan_formulir` varchar(45) DEFAULT NULL,
  `gid` int(10) DEFAULT NULL,
  `createddate` varchar(45) DEFAULT NULL,
  `createdby` varchar(45) DEFAULT NULL,
  `status_permintaan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_provider`
--

CREATE TABLE `tb_provider` (
  `id_provider` int(11) NOT NULL,
  `nama_provider` varchar(45) NOT NULL,
  `telpon_provider` varchar(45) NOT NULL,
  `nama_sales` varchar(45) NOT NULL,
  `telpon_sales` varchar(45) NOT NULL,
  `email_provider` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_referensi`
--

CREATE TABLE `tb_referensi` (
  `id_referensi` int(50) NOT NULL,
  `code_referensi` varchar(50) DEFAULT NULL,
  `nama_referensi` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_referensi`
--

INSERT INTO `tb_referensi` (`id_referensi`, `code_referensi`, `nama_referensi`) VALUES
(1, 'TIPE', 'AntiVirus'),
(2, 'TIPE', 'Software'),
(3, 'MERK-PC', 'DELL'),
(4, 'HARDWARE', 'Printer'),
(5, 'HARDWARE', 'PC'),
(6, 'HARDWARE', 'Mouse'),
(7, 'HARDWARE', 'Keyboard'),
(8, 'MERK-PRINTER', 'EPSON'),
(9, 'MERK-HDD', 'TRANCENT');

-- --------------------------------------------------------

--
-- Table structure for table `tb_remote`
--

CREATE TABLE `tb_remote` (
  `id_remote` int(11) NOT NULL,
  `namacabang` varchar(45) NOT NULL,
  `nama_user` varchar(45) NOT NULL,
  `remote_address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_status`
--

CREATE TABLE `tb_status` (
  `id_status` int(10) NOT NULL,
  `nama_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_status`
--

INSERT INTO `tb_status` (`id_status`, `nama_status`) VALUES
(1, 'DIGUNAKAN'),
(2, 'SIAP DIGUNAKAN'),
(3, 'DIPERBAIKI'),
(4, 'ARSIP/DISIMPAN'),
(5, 'RUSAK/NOT FIXABLE'),
(6, 'DIJUAL/HILANG'),
(7, 'DIPINJAMKAN');

-- --------------------------------------------------------

--
-- Table structure for table `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id_supplier` int(20) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat_supplier` varchar(100) NOT NULL,
  `telepon` varchar(20) NOT NULL,
  `nama_pic` varchar(45) NOT NULL,
  `isactive` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_supplier`
--

INSERT INTO `tb_supplier` (`id_supplier`, `nama_supplier`, `alamat_supplier`, `telepon`, `nama_pic`, `isactive`) VALUES
(1, 'DSFDFS', 'DSFDSFDSF', '08984153117', 'AFSFAF', 'True');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tipe`
--

CREATE TABLE `tb_tipe` (
  `id_tipe` int(11) NOT NULL,
  `id_manufacture` int(11) NOT NULL,
  `tipe` varchar(60) NOT NULL,
  `spesifikasi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tipe`
--

INSERT INTO `tb_tipe` (`id_tipe`, `id_manufacture`, `tipe`, `spesifikasi`) VALUES
(1, 1, 'OPTIPLEX 3310', ''),
(2, 4, 'LQ-2190', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_trans_detail`
--

CREATE TABLE `tb_trans_detail` (
  `id_trans_detail` int(30) NOT NULL,
  `id_cabang` varchar(100) DEFAULT NULL,
  `kode_transaksi` varchar(30) DEFAULT NULL,
  `tgl_transaksi` date NOT NULL,
  `kode_barang` varchar(30) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL,
  `qty_masuk` int(10) DEFAULT NULL,
  `qty_keluar` int(10) DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '0',
  `gid` varchar(45) NOT NULL,
  `createddate` date DEFAULT NULL,
  `createby` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_trans_keluar`
--

CREATE TABLE `tb_trans_keluar` (
  `id_transaksi` int(30) NOT NULL,
  `kode_transaksi` varchar(30) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `id_pengguna` varchar(30) DEFAULT NULL,
  `nohp_penerima` varchar(13) DEFAULT NULL,
  `gid` int(10) DEFAULT NULL,
  `id_cabang` varchar(45) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `createby` varchar(45) NOT NULL,
  `form_permintaan` varchar(100) DEFAULT NULL,
  `input_gambar` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_trans_keluar`
--

INSERT INTO `tb_trans_keluar` (`id_transaksi`, `kode_transaksi`, `tgl_transaksi`, `id_pengguna`, `nohp_penerima`, `gid`, `id_cabang`, `createddate`, `createby`, `form_permintaan`, `input_gambar`) VALUES
(8, 'BK-JKT-08.001', '2018-08-21', 'U018.0003', NULL, 1, 'PuloGadung', '0000-00-00 00:00:00', '', NULL, NULL),
(9, 'BK-JKT-08.002', '2018-08-22', 'U018.0005', NULL, 1, 'Bumi Serpong Damai', '0000-00-00 00:00:00', '', NULL, NULL),
(10, 'BK-JKT-08.003', '2018-08-22', 'U018.0005', NULL, 1, 'Pantai Indah Kapuk', '0000-00-00 00:00:00', '', NULL, NULL),
(11, 'BK-JKT-08.004', '2018-08-22', 'U018.0005', NULL, 1, 'Dewi Sartika', '0000-00-00 00:00:00', '', NULL, NULL),
(12, 'BK-JKT-11.001', '2018-11-26', 'U018.0006', NULL, 1, 'PuloGadung', '0000-00-00 00:00:00', '', NULL, 'default.jpg'),
(13, 'BK-JKT-11.002', '2018-11-26', 'U018.0003', NULL, 1, 'PuloGadung', '0000-00-00 00:00:00', '', NULL, 'default.jpg'),
(14, 'BK-JKT-05.001', '2019-05-27', 'U018.0006', '081219093977', 1, 'PuloGadung', '2019-05-27 06:24:47', 'root', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_trans_masuk`
--

CREATE TABLE `tb_trans_masuk` (
  `id_transaksi` int(30) NOT NULL,
  `kode_transaksi` varchar(30) DEFAULT NULL,
  `no_po` varchar(30) DEFAULT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `id_supplier` int(20) DEFAULT NULL,
  `po` varchar(45) DEFAULT NULL,
  `judul_po` varchar(100) DEFAULT NULL,
  `tgl_po` date DEFAULT NULL,
  `afa` varchar(45) DEFAULT NULL,
  `penawaran` varchar(45) DEFAULT NULL,
  `gid` int(10) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(10) NOT NULL,
  `nama_user` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `role` enum('Administrator','Admin') COLLATE latin1_general_ci DEFAULT NULL,
  `last_login` datetime NOT NULL,
  `gid` int(11) NOT NULL,
  `createdate` datetime DEFAULT NULL,
  `createby` varchar(45) COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `username`, `password`, `role`, `last_login`, `gid`, `createdate`, `createby`) VALUES
(8, 'Ahmad Sopian', 'root', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'Administrator', '2023-06-21 09:33:40', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_wilayah`
--

CREATE TABLE `tb_wilayah` (
  `id_wilayah` int(11) NOT NULL,
  `namawilayah` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_wilayah`
--

INSERT INTO `tb_wilayah` (`id_wilayah`, `namawilayah`) VALUES
(1, 'Jabodetabek'),
(2, 'Jawa Timur');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `captcha`
--
ALTER TABLE `captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `tbl_inv_kode`
--
ALTER TABLE `tbl_inv_kode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tb_departemen`
--
ALTER TABLE `tb_departemen`
  ADD PRIMARY KEY (`id_dept`);

--
-- Indexes for table `tb_group`
--
ALTER TABLE `tb_group`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `tb_internet`
--
ALTER TABLE `tb_internet`
  ADD PRIMARY KEY (`id_internet`);

--
-- Indexes for table `tb_inv_device`
--
ALTER TABLE `tb_inv_device`
  ADD PRIMARY KEY (`id_device`),
  ADD UNIQUE KEY `no_inventaris` (`no_inventaris`);

--
-- Indexes for table `tb_inv_history`
--
ALTER TABLE `tb_inv_history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `tb_inv_komputer`
--
ALTER TABLE `tb_inv_komputer`
  ADD PRIMARY KEY (`id_komputer`),
  ADD UNIQUE KEY `kode_komputer` (`no_inventaris`),
  ADD UNIQUE KEY `serial_number_UNIQUE` (`serial_number`);

--
-- Indexes for table `tb_inv_laptop`
--
ALTER TABLE `tb_inv_laptop`
  ADD PRIMARY KEY (`id_laptop`),
  ADD UNIQUE KEY `kode_laptop` (`no_inventaris`);

--
-- Indexes for table `tb_inv_monitor`
--
ALTER TABLE `tb_inv_monitor`
  ADD PRIMARY KEY (`id_monitor`),
  ADD UNIQUE KEY `kode_monitor` (`no_inventaris`);

--
-- Indexes for table `tb_inv_network`
--
ALTER TABLE `tb_inv_network`
  ADD PRIMARY KEY (`id_network`),
  ADD UNIQUE KEY `kode_network` (`kode_network`);

--
-- Indexes for table `tb_inv_printer`
--
ALTER TABLE `tb_inv_printer`
  ADD PRIMARY KEY (`id_printer`);

--
-- Indexes for table `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id_kategori`),
  ADD UNIQUE KEY `nama_kategori` (`nama_kategori`);

--
-- Indexes for table `tb_lisensi`
--
ALTER TABLE `tb_lisensi`
  ADD PRIMARY KEY (`id_lisensi`);

--
-- Indexes for table `tb_maintenance`
--
ALTER TABLE `tb_maintenance`
  ADD PRIMARY KEY (`no_permohonan`);

--
-- Indexes for table `tb_maintenance_detail`
--
ALTER TABLE `tb_maintenance_detail`
  ADD PRIMARY KEY (`id_detail`);

--
-- Indexes for table `tb_manufacture`
--
ALTER TABLE `tb_manufacture`
  ADD PRIMARY KEY (`id_manufacture`);

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `tb_mikrotik`
--
ALTER TABLE `tb_mikrotik`
  ADD PRIMARY KEY (`id_mikrotik`);

--
-- Indexes for table `tb_pelayanan`
--
ALTER TABLE `tb_pelayanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_provider`
--
ALTER TABLE `tb_provider`
  ADD PRIMARY KEY (`id_provider`);

--
-- Indexes for table `tb_referensi`
--
ALTER TABLE `tb_referensi`
  ADD PRIMARY KEY (`id_referensi`);

--
-- Indexes for table `tb_remote`
--
ALTER TABLE `tb_remote`
  ADD PRIMARY KEY (`id_remote`);

--
-- Indexes for table `tb_status`
--
ALTER TABLE `tb_status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `tb_tipe`
--
ALTER TABLE `tb_tipe`
  ADD PRIMARY KEY (`id_tipe`);

--
-- Indexes for table `tb_trans_detail`
--
ALTER TABLE `tb_trans_detail`
  ADD PRIMARY KEY (`id_trans_detail`);

--
-- Indexes for table `tb_trans_keluar`
--
ALTER TABLE `tb_trans_keluar`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_trans_masuk`
--
ALTER TABLE `tb_trans_masuk`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tb_wilayah`
--
ALTER TABLE `tb_wilayah`
  ADD PRIMARY KEY (`id_wilayah`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `captcha`
--
ALTER TABLE `captcha`
  MODIFY `captcha_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=926;

--
-- AUTO_INCREMENT for table `tbl_inv_kode`
--
ALTER TABLE `tbl_inv_kode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_departemen`
--
ALTER TABLE `tb_departemen`
  MODIFY `id_dept` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `tb_group`
--
ALTER TABLE `tb_group`
  MODIFY `gid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_internet`
--
ALTER TABLE `tb_internet`
  MODIFY `id_internet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_inv_device`
--
ALTER TABLE `tb_inv_device`
  MODIFY `id_device` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_inv_history`
--
ALTER TABLE `tb_inv_history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tb_inv_komputer`
--
ALTER TABLE `tb_inv_komputer`
  MODIFY `id_komputer` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_inv_laptop`
--
ALTER TABLE `tb_inv_laptop`
  MODIFY `id_laptop` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tb_inv_monitor`
--
ALTER TABLE `tb_inv_monitor`
  MODIFY `id_monitor` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_inv_network`
--
ALTER TABLE `tb_inv_network`
  MODIFY `id_network` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_inv_printer`
--
ALTER TABLE `tb_inv_printer`
  MODIFY `id_printer` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  MODIFY `id_jabatan` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_lisensi`
--
ALTER TABLE `tb_lisensi`
  MODIFY `id_lisensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_maintenance_detail`
--
ALTER TABLE `tb_maintenance_detail`
  MODIFY `id_detail` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_manufacture`
--
ALTER TABLE `tb_manufacture`
  MODIFY `id_manufacture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tb_pelayanan`
--
ALTER TABLE `tb_pelayanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_provider`
--
ALTER TABLE `tb_provider`
  MODIFY `id_provider` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_referensi`
--
ALTER TABLE `tb_referensi`
  MODIFY `id_referensi` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_remote`
--
ALTER TABLE `tb_remote`
  MODIFY `id_remote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_status`
--
ALTER TABLE `tb_status`
  MODIFY `id_status` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id_supplier` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_tipe`
--
ALTER TABLE `tb_tipe`
  MODIFY `id_tipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_trans_detail`
--
ALTER TABLE `tb_trans_detail`
  MODIFY `id_trans_detail` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_trans_keluar`
--
ALTER TABLE `tb_trans_keluar`
  MODIFY `id_transaksi` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_trans_masuk`
--
ALTER TABLE `tb_trans_masuk`
  MODIFY `id_transaksi` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

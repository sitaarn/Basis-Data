-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2025 at 10:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kampus`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `nip` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `bidang` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`nip`, `nama`, `bidang`) VALUES
('1985654351', 'Arif Kurniawan', 'Praktikum Basis Data'),
('1988654332', 'Viko Haryanto', 'Pemrograman Web'),
('1989654325', 'Irul Septian', 'Jaringan Komputer'),
('1991654388', 'Hana Cantika', 'Kecerdasan Artifisial'),
('1992654354', 'Artika Larasati', 'Dasar Pemrograman'),
('1995654367', 'Aji Pratomo', 'Keamanan Cyber');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nim` char(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `nama`, `jurusan`) VALUES
('1234567890', 'Andi', 'Informatika'),
('2410600101', 'Andika Surya', 'Informatika'),
('2410600102', 'Dina Safitri', 'Informatika'),
('2410600203', 'Brian Sanjaya', 'Sistem Informasi'),
('2410600204', 'Sabila Wirasyasti', 'Sistem Informasi'),
('2410600302', 'Dika Ardian', 'Teknologi Informasi'),
('2410600303', 'Bima Putra', 'Teknologi Informasi'),
('2410600401', 'Rika Ardiani', 'Ilmu Komputer'),
('2410600404', 'Nino Prastyo', 'Ilmu Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_mk` char(6) NOT NULL,
  `nama_mk` varchar(50) DEFAULT NULL,
  `sks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode_mk`, `nama_mk`, `sks`) VALUES
('MK1117', 'Kecerdasan Artifisial', 3),
('MK2001', 'Dasar Pemrograman', 2),
('MK2121', 'Pemrograman Web', 3),
('MK2301', 'Keamanan Cyber', 3),
('MK3211', 'Praktikum Basis Data', 2),
('MK5504', 'Jaringan Komputer', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tagihan`
--

CREATE TABLE `tagihan` (
  `id_tagihan` char(3) NOT NULL,
  `nim` char(10) DEFAULT NULL,
  `jenis_tagihan` varchar(20) DEFAULT NULL,
  `jumlah_tagihan` decimal(10,2) DEFAULT NULL,
  `status` enum('Belum Lunas','Lunas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tagihan`
--

INSERT INTO `tagihan` (`id_tagihan`, `nim`, `jenis_tagihan`, `jumlah_tagihan`, `status`) VALUES
('T01', '1234567890', 'UKT', 10000000.00, 'Lunas'),
('T02', '2410600101', 'UKT', 5250000.00, 'Belum Lunas'),
('T03', '2410600102', 'UKT', 7450000.00, 'Lunas'),
('T04', '2410600203', 'UKT', 6900000.00, 'Belum Lunas'),
('T05', '2410600204', 'UKT', 8800000.00, 'Belum Lunas'),
('T06', '2410600302', 'UKT', 6100000.00, 'Lunas'),
('T07', '2410600303', 'UKT', 9300000.00, 'Lunas'),
('T08', '2410600401', 'UKT', 5700000.00, 'Lunas'),
('T09', '2410600404', 'UKT', 8050000.00, 'Belum Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `temp_tabel`
--

CREATE TABLE `temp_tabel` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nip`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode_mk`);

--
-- Indexes for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD PRIMARY KEY (`id_tagihan`),
  ADD KEY `nim` (`nim`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tagihan`
--
ALTER TABLE `tagihan`
  ADD CONSTRAINT `tagihan_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

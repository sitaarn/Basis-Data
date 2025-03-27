-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2025 at 03:41 PM
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
-- Database: `akademik2`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `Nama_Dosen` varchar(50) NOT NULL,
  `Kode_MK` varchar(10) NOT NULL,
  `Ruang_Kelas` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`Nama_Dosen`, `Kode_MK`, `Ruang_Kelas`) VALUES
('Dr. Budi', 'IF101', 'A101'),
('Dr. Budi', 'SI201', 'C303'),
('Dr. Siti', 'IF102', 'B202');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` int(11) NOT NULL,
  `Nama_Mahasiswa` varchar(50) DEFAULT NULL,
  `Prodi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `Nama_Mahasiswa`, `Prodi`) VALUES
(22001, 'Andi Wijaya', 'Informatika'),
(22002, 'Rina Lestari', 'Informatika'),
(22003, 'Dika Pratama', 'Sistem Informasi');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `Kode_MK` varchar(10) NOT NULL,
  `Mata_Kuliah` varchar(50) DEFAULT NULL,
  `SKS` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`Kode_MK`, `Mata_Kuliah`, `SKS`) VALUES
('IF101', 'Basis Data', 3),
('IF102', 'Pemrograman', 4),
('SI201', 'Manajemen Proyek', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `NIM` int(11) NOT NULL,
  `Kode_MK` varchar(10) NOT NULL,
  `Nilai` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`NIM`, `Kode_MK`, `Nilai`) VALUES
(22001, 'IF101', 'A'),
(22001, 'IF102', 'B+'),
(22002, 'IF101', 'A-'),
(22003, 'SI201', 'B');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`Nama_Dosen`,`Kode_MK`),
  ADD KEY `Kode_MK` (`Kode_MK`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`Kode_MK`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`NIM`,`Kode_MK`),
  ADD KEY `Kode_MK` (`Kode_MK`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`Kode_MK`) REFERENCES `mata_kuliah` (`Kode_MK`);

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`NIM`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`Kode_MK`) REFERENCES `mata_kuliah` (`Kode_MK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

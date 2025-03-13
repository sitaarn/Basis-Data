-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 19, 2025 at 05:22 AM
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
-- Database: `data`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` varchar(20) NOT NULL,
  `Nama` varchar(30) NOT NULL,
  `Jenis_Kelamin` enum('Laki-laki','Perempuan') NOT NULL,
  `Tanggal_Lahir` date NOT NULL,
  `Program_Studi` varchar(25) NOT NULL,
  `Alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `Nama`, `Jenis_Kelamin`, `Tanggal_Lahir`, `Program_Studi`, `Alamat`) VALUES
('24156730', 'Dinni Hastono', 'Perempuan', '2005-09-22', 'Akuntansi', 'Jl. Mawar No. 17'),
('24156731', 'Hanif Dwi', 'Laki-laki', '2006-07-02', 'Akuntansi', 'Jl. Ubud No. 17'),
('24156732', 'Yuda Affandi', 'Laki-laki', '2005-11-10', 'Akuntansi', 'Jl. Kamboja No. 2'),
('24156733', 'Citra Larasati', 'Perempuan', '2006-03-08', 'Manajemen', 'Jl. Pahlawan No. 78'),
('24156734', 'Anissa Diva', 'Perempuan', '2006-01-19', 'Manajemen', 'Jl. Pattimura No. 35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD UNIQUE KEY `NPM` (`NPM`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

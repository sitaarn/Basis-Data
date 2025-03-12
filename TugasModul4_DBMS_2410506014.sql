-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2025 at 04:05 PM
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
-- Database: `data_akademik`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` char(5) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Prodi` varchar(25) NOT NULL,
  `Angkatan` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `Nama`, `Prodi`, `Angkatan`) VALUES
('24131', 'Andika Pratama', 'Informatika', '2024'),
('24132', 'Jessica Putri', 'Informatika', '2024'),
('24133', 'Bintang Putra', 'Informatika', '2024'),
('24134', 'Frida Angela', 'Informatika', '2024'),
('24135', 'Denada Aprilia', 'Informatika', '2024'),
('24136', 'Michael Wijaya', 'Informatika', '2024'),
('24137', 'Dhito Abimanyu', 'Informatika', '2024');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `ID_Matkul` char(4) NOT NULL,
  `Mata_Kuliah` varchar(30) NOT NULL,
  `SKS` int(11) NOT NULL,
  `Hari` varchar(7) NOT NULL,
  `Dosen_Pengampu` varchar(30) NOT NULL,
  `Jam_Mulai` time NOT NULL,
  `Jam_Selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`ID_Matkul`, `Mata_Kuliah`, `SKS`, `Hari`, `Dosen_Pengampu`, `Jam_Mulai`, `Jam_Selesai`) VALUES
('MK07', 'Dasar Pemrograman', 3, 'Senin', 'Andi Pratomo, S.T., M.Eng.', '08:00:00', '10:00:00'),
('MK08', 'Basis Data', 2, 'Senin', 'Dewi Rachmani, S.T., M.Eng.', '10:40:00', '12:00:00'),
('MK18', 'Bahasa Inggris', 2, 'Selasa', 'Arif Dwi S, S.T., M.Eng.', '11:45:00', '12:25:00'),
('MK26', 'Kalkulus', 3, 'Selasa', 'Adhifa Larasati, S.T., M.Eng.', '14:10:00', '16:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `ID_Nilai` int(11) NOT NULL,
  `NPM` char(5) DEFAULT NULL,
  `ID_Matkul` char(4) DEFAULT NULL,
  `Nilai` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`ID_Nilai`, `NPM`, `ID_Matkul`, `Nilai`) VALUES
(1, '24131', 'MK07', 85.50),
(2, '24131', 'MK08', 91.80),
(3, '24132', 'MK07', 80.20),
(4, '24132', 'MK08', 83.50),
(5, '24133', 'MK07', 79.50),
(6, '24133', 'MK08', 88.40),
(7, '24134', 'MK07', 77.40),
(8, '24134', 'MK08', 76.80),
(9, '24135', 'MK07', 90.20),
(10, '24135', 'MK08', 94.30),
(11, '24136', 'MK07', 78.80),
(12, '24136', 'MK08', 88.10),
(13, '24137', 'MK07', 92.30),
(14, '24137', 'MK08', 91.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NPM`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`ID_Matkul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`ID_Nilai`),
  ADD KEY `NPM` (`NPM`),
  ADD KEY `ID_Matkul` (`ID_Matkul`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `ID_Nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `mahasiswa` (`NPM`) ON DELETE CASCADE,
  ADD CONSTRAINT `nilai_ibfk_2` FOREIGN KEY (`ID_Matkul`) REFERENCES `mata_kuliah` (`ID_Matkul`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

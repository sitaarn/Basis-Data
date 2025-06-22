-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2025 at 10:46 PM
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
-- Database: `universitas`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_mhs_simple` ()   BEGIN
SELECT NPM, Nama, No_HP
FROM mahasiswa;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `tambah` (`angka1` INT, `angka2` INT) RETURNS INT(11)  BEGIN
RETURN angka1 + angka2;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID_Brg` char(4) NOT NULL,
  `Nama_Brg` varchar(50) DEFAULT NULL,
  `Stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`ID_Brg`, `Nama_Brg`, `Stok`) VALUES
('A11', 'Keyboard', 15),
('A12', 'DVD R-W', 10),
('A13', 'Modem', 6);

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `auditBarang` BEFORE INSERT ON `barang` FOR EACH ROW BEGIN
IF NOT EXISTS (SELECT ID_Brg FROM barang WHERE ID_Brg = New.ID_Brg) THEN
SET NEW.Nama_Brg = NEW.Nama_Brg;
SET NEW.Stok = NEW.Stok;
ELSE 
SET @status = CONCAT('ID', NEW.ID_Brg, 'Sudah Ada');
END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `deleteChild` AFTER DELETE ON `barang` FOR EACH ROW DELETE FROM pembelian
WHERE ID_BRG = OLD.ID_BRG
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NPM` char(5) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Alamat` varchar(60) DEFAULT NULL,
  `ID_Kelurahan` int(11) DEFAULT NULL,
  `Jenis_Kelamin` enum('P','L') DEFAULT NULL,
  `No_HP` varchar(15) DEFAULT NULL,
  `Kode_Prodi` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NPM`, `Nama`, `Alamat`, `ID_Kelurahan`, `Jenis_Kelamin`, `No_HP`, `Kode_Prodi`) VALUES
('12345', 'Imam Adi Nata', 'Kajen', 1, 'L', '081215529989', '1'),
('12346', 'Budi Sugiandhi', 'Bekasi', 109, 'L', '085643433321', '2'),
('12347', 'Toha Sitohang', 'Medan', 103, 'L', '08998787876', '2'),
('12348', 'Megawati', 'Condong Catur', 107, 'P', '0839303058', '1'),
('12349', 'PRABOWO SUBIYANTO', 'JKT', 107, 'L', '08132809811', NULL),
('12780', 'Anis Baswedan', 'Jakarta', 234, 'L', '09898877663', NULL),
('12786', 'GANJAR PRANOWO', 'JAWA TENGAH', 123, 'L', '087665356622', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `ID_Pem` int(11) NOT NULL,
  `ID_BRG` char(4) DEFAULT NULL,
  `Jml_Beli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `pembelian`
--
DELIMITER $$
CREATE TRIGGER `updateStok` AFTER INSERT ON `pembelian` FOR EACH ROW UPDATE barang
SET stok = stok + NEW.Jml_Beli
WHERE ID_BRG = NEW.ID_BRG
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateStokEdit` AFTER UPDATE ON `pembelian` FOR EACH ROW UPDATE barang
SET stok = stok + (NEW.Jml_Beli - OLD.Jml_Beli) 
WHERE ID_BRG = NEW.ID_BRG
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID_Brg`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NPM`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`ID_Pem`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

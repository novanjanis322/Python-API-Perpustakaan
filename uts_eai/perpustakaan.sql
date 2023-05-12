-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3360
-- Generation Time: May 12, 2023 at 07:03 AM
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
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_buku`
--

CREATE TABLE `tb_buku` (
  `id_buku` int(10) NOT NULL,
  `judul_buku` varchar(50) DEFAULT NULL,
  `penulis_buku` varchar(50) DEFAULT NULL,
  `penerbit` varchar(50) DEFAULT NULL,
  `tahun_terbit` varchar(5) DEFAULT NULL,
  `jenis_buku` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_buku`
--

INSERT INTO `tb_buku` (`id_buku`, `judul_buku`, `penulis_buku`, `penerbit`, `tahun_terbit`, `jenis_buku`) VALUES
(101, 'Publish News Letter', 'Amit Garg', 'MCA Department, MIET Meeru', '2011', 'education'),
(102, 'Client Server Computing', 'Lalit Kumar', 'Sun India Publications, New Delhi', '2012', 'education'),
(103, 'Mobile Computing', 'Vinay Kumar Singhal', 'K Nath & Sons, Meerut', '2011', 'education'),
(104, ' Data Structure Using C', 'Sharad Kumar Verma', 'Thakur Publications Lucknow', '2015', 'education'),
(105, 'Computer Networks', 'Saurabh Singhal', 'Thakur Publications', '2015', 'education'),
(201, 'Orientalism', 'Edward Said', 'Penguin', '1978', 'history'),
(202, 'All the President\'s Men', 'Bob Woodward', 'Random House', '1974', 'history'),
(301, 'Slaughterhouse Five', 'Kurt Vonnegut', 'Random House', '1969', 'fiction'),
(302, 'Veteran, The', 'Frederick Forsyth', 'Transworld', '2001', 'fiction'),
(701, 'On Education', 'Bertrand Russell', 'Routledge', '1926', 'philosophy'),
(702, 'Free Will', 'Sam Harris', 'FreePress', '2012', 'philosophy');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `NIM` int(10) NOT NULL,
  `nama_mahasiswa` varchar(50) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `usia` int(3) DEFAULT NULL,
  `jenis_kelamin` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `no_hp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`NIM`, `nama_mahasiswa`, `jurusan`, `tanggal_lahir`, `usia`, `jenis_kelamin`, `alamat`, `no_hp`) VALUES
(11001, 'Karen', 'S1 Informatika', '1999-01-01', 23, 'perempuan', 'jl.Kenangan no.3', '8124234235'),
(11003, 'Brian', 'S1 Informatika', '1999-01-01', 23, 'laki-laki', 'jl.Kenangan no.19', '8124234298'),
(11004, 'Jessica', 'S1 Informatika', '1999-02-01', 23, 'perempuan', 'jl.Kenangan no.3', '8124234128'),
(11009, 'Maria', 'S1 Informatika', '1997-03-01', 25, 'perempuan', 'jl.Kenangan no.3', '8123044283'),
(12001, 'Randy', 'S1 Sistem Informasi', '1997-01-30', 25, 'laki-laki', 'jl.Merdeka no.1', '8102010304'),
(12002, 'Petra', 'S1 Sistem Informasi', '1997-02-27', 25, 'laki-laki', 'jl.Merdeka no.1', '81020103056'),
(12003, 'Aurora', 'S1 Sistem Informasi', '1997-02-27', 25, 'perempuan', 'jl.Merdeka no.15', '81020103098'),
(12004, 'Gary', 'S1 Sistem Informasi', '1997-03-01', 25, 'laki-laki', 'jl.Merdeka no.1', '81020103435'),
(12005, 'Jane', 'S1 Sistem Informasi', '1997-06-22', 25, 'Perempuan', 'jl.Merdeka no.5', '8102010305354'),
(15004, 'Mario', 'S1 DKV', '1997-03-01', 25, 'laki-laki', 'jl.Pemuda no.4', '812304593021'),
(15009, 'Marrrry', 'S1 DKV', '2002-01-02', 24, 'Perempuan', 'Jl. Bubat no.139', '0213041023'),
(55555, 'Koalamon', 'S1 Ekonomi', '2002-01-01', 23, 'Perempuan', 'Jl. Boulevard no.1', '0123134');

-- --------------------------------------------------------

--
-- Table structure for table `tb_peminjaman`
--

CREATE TABLE `tb_peminjaman` (
  `id_peminjaman` int(10) NOT NULL,
  `NIM` int(10) DEFAULT NULL,
  `id_buku` int(10) DEFAULT NULL,
  `id_petugas` int(10) DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_peminjaman`
--

INSERT INTO `tb_peminjaman` (`id_peminjaman`, `NIM`, `id_buku`, `id_petugas`, `tanggal_pinjam`, `tanggal_kembali`) VALUES
(11, 12002, 702, 1001, '2022-04-01', '2022-06-01'),
(12, 12002, 105, 1001, '2022-04-01', '2022-06-01'),
(13, 12004, 702, 1001, '2022-03-01', '2022-03-30'),
(14, 12001, 105, 1004, '2022-01-01', '2022-02-01'),
(15, 12005, 301, 1002, '2022-01-01', '2022-02-01'),
(16, 12005, 701, 1006, '2022-01-15', '2022-02-01'),
(17, 11001, 105, 1003, '2022-01-01', '2022-02-01'),
(18, 11001, 702, 1003, '2022-01-01', '2022-02-10'),
(19, 15004, 301, 1009, '2022-01-01', '2022-02-10'),
(20, 15004, 701, 1011, '2022-01-15', '2022-03-01'),
(21, 15009, 301, 1004, '2022-02-15', '2022-04-01'),
(22, 15009, 702, 1010, '2022-04-01', '2022-05-01'),
(24, 55555, 701, 1006, '0000-00-00', '0000-00-00'),
(25, 55555, 701, 1006, '0000-00-00', '0000-00-00'),
(28, 11001, 701, 1006, '2000-01-01', '2000-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengembalian`
--

CREATE TABLE `tb_pengembalian` (
  `id_pengembalian` int(10) NOT NULL,
  `NIM` int(10) DEFAULT NULL,
  `id_buku` int(10) DEFAULT NULL,
  `id_petugas` int(10) DEFAULT NULL,
  `tanggal_dikembalikan` date DEFAULT NULL,
  `denda` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pengembalian`
--

INSERT INTO `tb_pengembalian` (`id_pengembalian`, `NIM`, `id_buku`, `id_petugas`, `tanggal_dikembalikan`, `denda`) VALUES
(51, 12002, 702, 1001, '2022-06-01', 0),
(52, 12002, 105, 1001, '2022-06-01', 0),
(53, 12004, 702, 1001, '2022-03-31', 5000),
(54, 12001, 105, 1004, '2022-02-11', 50000),
(55, 12005, 301, 1002, '2022-02-01', 0),
(56, 12005, 701, 1006, '2022-02-02', 5000),
(57, 11001, 105, 1003, '2022-02-01', 0),
(58, 11001, 702, 1003, '2022-03-02', 150000),
(59, 15004, 301, 1009, '2022-02-11', 50000),
(60, 15004, 701, 1011, '2022-03-01', 0),
(61, 15009, 301, 1004, '2022-04-01', 0),
(62, 15009, 702, 1010, '2022-05-06', 25000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `id_petugas` int(10) NOT NULL,
  `nama_petugas` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `usia` int(5) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_petugas`
--

INSERT INTO `tb_petugas` (`id_petugas`, `nama_petugas`, `tanggal_lahir`, `usia`, `no_hp`, `alamat`) VALUES
(1001, 'Saputra', '1989-01-01', 33, '8123094050', 'jl.Garuda no.101'),
(1002, 'Deri', '1988-01-01', 34, '8130234192', 'jl.Kenangan no. 17'),
(1003, 'Sukma', '1988-01-02', 34, '812340234', 'jl.Mulia no.123'),
(1004, 'Rahma', '1990-03-01', 32, '812304941', 'jl.Mulia no.104'),
(1005, 'Bobi', '1990-02-04', 32, '812304913', 'jl.Garuda no.103'),
(1006, 'Budi', '1986-03-03', 36, '813240694', 'jl.Veteran no.14'),
(1007, 'Feri', '1988-01-01', 34, '808234912', 'jl.Veteran no.19'),
(1008, 'Nana', '1990-03-01', 32, '897312394', 'jl.Mulia no.106'),
(1009, 'Ria', '1991-02-01', 31, '88352904', 'jl.Bunga no.11'),
(1010, 'Eni', '1988-01-01', 34, '813400921', 'jl.Mulia no.114'),
(1011, 'Dewi', '1991-01-01', 31, '8123084950', 'jl.Bunga no.14'),
(1012, 'Pamungkas', '1989-01-01', 33, '895921312', 'jl.Veteran no.11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `fk_NIM` (`NIM`),
  ADD KEY `fk_idbuku` (`id_buku`),
  ADD KEY `fk_idpetugas` (`id_petugas`);

--
-- Indexes for table `tb_pengembalian`
--
ALTER TABLE `tb_pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `fk_NIM2` (`NIM`),
  ADD KEY `fk_idbuku2` (`id_buku`),
  ADD KEY `fk_idpetugas2` (`id_petugas`);

--
-- Indexes for table `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  MODIFY `id_peminjaman` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_peminjaman`
--
ALTER TABLE `tb_peminjaman`
  ADD CONSTRAINT `fk_NIM` FOREIGN KEY (`NIM`) REFERENCES `tb_mahasiswa` (`NIM`),
  ADD CONSTRAINT `fk_idbuku` FOREIGN KEY (`id_buku`) REFERENCES `tb_buku` (`id_buku`),
  ADD CONSTRAINT `fk_idpetugas` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`);

--
-- Constraints for table `tb_pengembalian`
--
ALTER TABLE `tb_pengembalian`
  ADD CONSTRAINT `fk_NIM2` FOREIGN KEY (`NIM`) REFERENCES `tb_mahasiswa` (`NIM`),
  ADD CONSTRAINT `fk_idbuku2` FOREIGN KEY (`id_buku`) REFERENCES `tb_buku` (`id_buku`),
  ADD CONSTRAINT `fk_idpetugas2` FOREIGN KEY (`id_petugas`) REFERENCES `tb_petugas` (`id_petugas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

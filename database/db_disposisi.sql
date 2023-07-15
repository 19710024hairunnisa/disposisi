-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2023 at 07:49 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_disposisi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_surat_masuk`
--

CREATE TABLE `tb_surat_masuk` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(100) NOT NULL,
  `tgl_surat` date NOT NULL,
  `surat_from` varchar(100) NOT NULL,
  `surat_to` varchar(100) NOT NULL,
  `tgl_terima` timestamp NOT NULL DEFAULT current_timestamp(),
  `perihal` text NOT NULL,
  `keterangan` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_surat_masuk`
--

INSERT INTO `tb_surat_masuk` (`id`, `no_surat`, `tgl_surat`, `surat_from`, `surat_to`, `tgl_terima`, `perihal`, `keterangan`, `image`, `status`, `user_id`, `is_active`) VALUES
(1, '003', '2023-06-16', 'Menteri Agama, Menteri Ketenagakerjaan, Menteri Reformasi Birokrasi', 'Seluruh Kepala Daerah Provinsi', '2023-06-15 16:00:00', 'Cuti Nasional Bersama 2023', 'Perubahan Cuti Bersama untuk Tahun 2023  ', '001.jpg', '', 0, 1),
(3, '001', '2023-06-16', 'Menteri Agama, Menteri Ketenagakerjaan, Menteri Reformasi Birokrasi', 'Seluruh Kepala Daerah Provinsi', '2023-06-15 16:00:00', 'Cuti Nasional Bersama 2023', 'Perubahan Cuti Bersama untuk Tahun 2023  ', '003.jpg', '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_template_surat`
--

CREATE TABLE `tb_template_surat` (
  `id` int(11) NOT NULL,
  `nama` varchar(60) NOT NULL,
  `tunjuan_surat` varchar(60) NOT NULL,
  `tgl_kirim` datetime NOT NULL,
  `perihal` varchar(150) NOT NULL,
  `keterangan` text NOT NULL,
  `is_active` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `role` enum('admin','sekretaris') NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `username`, `password`, `email`, `full_name`, `phone`, `role`, `last_login`, `is_active`) VALUES
(1, 'caca', '$2y$10$28VJTjD0z8wRkWqMH8sv1.pZy1w3yrj2N/4hEANjia01DEI9D9c5a', 'cacamarica@gmail.com', 'hairunnisa', '081943332415', 'admin', '2023-07-15 17:19:05', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_surat_masuk`
--
ALTER TABLE `tb_surat_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_template_surat`
--
ALTER TABLE `tb_template_surat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_surat_masuk`
--
ALTER TABLE `tb_surat_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_template_surat`
--
ALTER TABLE `tb_template_surat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

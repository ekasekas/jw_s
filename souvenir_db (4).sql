-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2021 at 11:18 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `souvenir_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_transaksi`
--

CREATE TABLE `data_transaksi` (
  `id` bigint(255) NOT NULL,
  `id_transaksi` varchar(25) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `no_hp` varchar(25) NOT NULL,
  `provinsi` varchar(25) NOT NULL,
  `kota` varchar(25) NOT NULL,
  `alamat_penagihan` text NOT NULL,
  `kode_pos` varchar(25) NOT NULL,
  `expedisi` varchar(25) NOT NULL,
  `paket` varchar(25) NOT NULL,
  `estimasi` varchar(25) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `status_bayar` int(1) NOT NULL,
  `bukti_bayar` text NOT NULL,
  `atas_nama` varchar(25) NOT NULL,
  `nama_bank` varchar(25) NOT NULL,
  `no_rek` varchar(25) NOT NULL,
  `no_resi` varchar(25) NOT NULL,
  `tanggal_transaksi` datetime NOT NULL,
  `deadline` datetime NOT NULL,
  `catatan` varchar(255) NOT NULL,
  `status_tracking` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `data_transaksi`
--

INSERT INTO `data_transaksi` (`id`, `id_transaksi`, `id_user`, `nama_pelanggan`, `no_hp`, `provinsi`, `kota`, `alamat_penagihan`, `kode_pos`, `expedisi`, `paket`, `estimasi`, `ongkir`, `grand_total`, `total_bayar`, `status_bayar`, `bukti_bayar`, `atas_nama`, `nama_bank`, `no_rek`, `no_resi`, `tanggal_transaksi`, `deadline`, `catatan`, `status_tracking`) VALUES
(41, '20210623JFLPOW', 3, 'Nayla Dwi', '08338877876', 'Bali', 'Badung', 'Jalan Pasar Kumbangsari No.4', '80353', 'jne', 'CTC', '2-3 Hari', 8000, 28000, 36000, 0, '', '', '', '', '', '2021-06-23 11:40:22', '2038-05-14 11:40:22', '', '1'),
(42, '20210623NH97ZR', 3, 'Nayla Dwi', '08338877876', 'Jawa Timur', 'Bojonegoro', 'Jl Raya Dander RT 30 RW 04', '62171', 'pos', 'Paket Kilat Khusus', '4 HARI Hari', 26000, 75000, 101000, 1, 'BUKTI_7ZR.jpg', 'Nayla Dwi', 'BNI', '1211-2310-3000-4239', 'POS123456', '2021-06-23 11:42:24', '2038-05-14 11:42:24', '', '8'),
(43, '20210623LX5AUZ', 3, 'Nayla Dwi', '08338877876', 'DKI Jakarta', 'Jakarta Pusat', 'Jl KH Wahid Hasyim No.9', '10110', 'tiki', 'REG', '2 Hari', 40000, 150000, 190000, 1, 'BUKTI_AUZ.jpg', 'Nayla Dwi', 'BNI', '1211-2310-3000-4239', '', '2021-06-23 11:46:25', '2038-05-14 11:46:25', '', '2'),
(44, '20210623LQOFTP', 3, 'Nayla Dwi', '08338877876', 'Jawa Barat', 'Cirebon', 'Jalan Raya Keduanan', '45155', 'jne', 'OKE', '3-4 Hari', 26000, 50000, 76000, 1, 'BUKTI_FTP.jpg', 'Nayla Dwi', 'BNI', '1211-2310-3000-4239', 'JN1199001', '2021-06-23 11:52:16', '2038-05-14 11:52:16', '', '7'),
(45, '20210623LHZK2G', 3, 'Nayla Dwi', '08338877876', 'Jawa Timur', 'Lamongan', 'Jalan Karang Binangun RT 02 RW 01', '62293', 'jne', 'OKE', '3-4 Hari', 40000, 30000, 70000, 0, '', '', '', '', '', '2021-06-23 11:54:47', '2038-05-14 11:54:47', '', '1');

--
-- Triggers `data_transaksi`
--
DELIMITER $$
CREATE TRIGGER `history_tracking` AFTER UPDATE ON `data_transaksi` FOR EACH ROW INSERT INTO history_track VALUES (null, NEW.status_tracking, NEW.id_transaksi, 'updated', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `history_track`
--

CREATE TABLE `history_track` (
  `id_history` bigint(255) NOT NULL,
  `id_track` bigint(255) NOT NULL,
  `id_transaksi` varchar(25) NOT NULL,
  `keterangan` text NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history_track`
--

INSERT INTO `history_track` (`id_history`, `id_track`, `id_transaksi`, `keterangan`, `tanggal`) VALUES
(10, 1, '20210623NH97ZR', 'updated', '2021-06-23 12:18:17'),
(11, 1, '20210623LX5AUZ', 'updated', '2021-06-23 12:18:41'),
(12, 1, '20210623LQOFTP', 'updated', '2021-06-23 12:19:01'),
(13, 2, '20210623LQOFTP', 'updated', '2021-06-23 12:39:13'),
(14, 2, '20210623LX5AUZ', 'updated', '2021-06-23 12:39:23'),
(15, 2, '20210623NH97ZR', 'updated', '2021-06-23 12:39:29'),
(16, 7, '20210623LQOFTP', 'updated', '2021-06-23 12:42:07'),
(17, 7, '20210623NH97ZR', 'updated', '2021-06-23 12:43:27'),
(18, 8, '20210623NH97ZR', 'updated', '2021-06-23 12:45:58'),
(19, 8, '20210623LQOFTP', 'updated', '2021-06-24 22:36:13'),
(20, 7, '20210623LQOFTP', 'updated', '2021-06-24 22:36:28'),
(21, 1, '20210623LHZK2G', 'updated', '2021-06-25 06:46:26'),
(22, 1, '20210623LHZK2G', 'updated', '2021-06-25 06:47:46'),
(23, 7, '20210623NH97ZR', 'updated', '2021-06-25 07:01:25'),
(24, 6, '20210623NH97ZR', 'updated', '2021-06-25 07:01:57'),
(25, 6, '20210623NH97ZR', 'updated', '2021-06-25 07:02:03'),
(26, 7, '20210623NH97ZR', 'updated', '2021-06-25 07:02:22'),
(27, 8, '20210623NH97ZR', 'updated', '2021-06-25 07:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `master_kategori`
--

CREATE TABLE `master_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_kategori`
--

INSERT INTO `master_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Alat Makan'),
(2, 'Pouch'),
(3, 'Alat Minum'),
(4, 'Lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `master_produk`
--

CREATE TABLE `master_produk` (
  `id_produk` bigint(255) NOT NULL,
  `nama_produk` varchar(255) NOT NULL,
  `harga_satuan` bigint(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `berat` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_produk`
--

INSERT INTO `master_produk` (`id_produk`, `nama_produk`, `harga_satuan`, `foto`, `kategori`, `berat`, `stok`, `keterangan`) VALUES
(1, 'Pouch Kulit Imitasi Kode A', 6500, 'pouch_kulit.jpg', '2', 100, 48, ''),
(2, 'Pouch Kulit Imitasi Kode B', 7000, 'pouch_kulit_b.jpg', '2', 100, 50, ''),
(3, 'Sendok Garpu Pastel', 5000, 'alat_makan.jpg', '1', 100, 50, ''),
(4, 'Totebag Daun', 15000, 'totebag.jpg', '4', 200, 40, ''),
(5, 'Tumblr Kaktus', 15000, 'tumblr_kaktus.jpg', '3', 200, 45, ''),
(6, 'Tumblr Kaca Polos', 10000, 'tumblr_kaca.jpg', '3', 150, 45, ''),
(7, 'Stainless Straw', 7500, 'stainless_straw.jpg', '3', 50, 48, ''),
(8, 'Basic Mug', 3000, 'basic_mug.jpg', '3', 200, 40, '');

-- --------------------------------------------------------

--
-- Table structure for table `master_track`
--

CREATE TABLE `master_track` (
  `id_track` bigint(255) NOT NULL,
  `nama_track` varchar(255) NOT NULL,
  `keterangan_track` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_track`
--

INSERT INTO `master_track` (`id_track`, `nama_track`, `keterangan_track`) VALUES
(1, 'Order Masuk', ''),
(2, 'Proses Penyortiran', ''),
(3, 'Proses Pembersihan', ''),
(4, 'Proses Penghiasan', ''),
(5, 'Proses Pengeringan', ''),
(6, 'Proses Pengemasan', ''),
(7, 'Pengiriman', ''),
(8, 'Selesai', '');

-- --------------------------------------------------------

--
-- Table structure for table `rinci_transaksi`
--

CREATE TABLE `rinci_transaksi` (
  `id_rinci` int(11) NOT NULL,
  `id_transaksi` varchar(25) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rinci_transaksi`
--

INSERT INTO `rinci_transaksi` (`id_rinci`, `id_transaksi`, `id_produk`, `qty`) VALUES
(22, '20210623JFLPOW', 1, 2),
(23, '20210623JFLPOW', 7, 2),
(24, '20210623NH97ZR', 5, 5),
(25, '20210623LX5AUZ', 4, 10),
(26, '20210623LQOFTP', 6, 5),
(27, '20210623LHZK2G', 8, 10);

--
-- Triggers `rinci_transaksi`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `rinci_transaksi` FOR EACH ROW BEGIN
	UPDATE master_produk SET stok = stok-NEW.qty
    WHERE id_produk = NEW.id_produk;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `nama_toko` varchar(50) DEFAULT NULL,
  `lokasi` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `nama_toko`, `lokasi`, `alamat`, `no_hp`) VALUES
(1, 'Jazzy Wedding Souvenirs', '17', 'Jl. Kranggan No.33, Surabaya Indonesia', '081247118302');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` bigint(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tracking_level` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `tracking_level`) VALUES
(1, 'ekas@gmail.com', '$2y$10$0mfDZiI3ZEHXG.613hokgOFSClMAd58VvH.WLck6JVWtfJV3e.C2C', 'supervisor'),
(2, 'jazzywedding@gmail.com', '$2y$10$rTsyTllwf.dmG4gJ06UDr.oJHxYVSDvyr7JD0z1YOtNEw.xbBu2TC', 'owner'),
(3, 'nayla@gmail.com', '$2y$10$xKM0sK4Mwod/OGHi5W.sTOk.LvEp6SqidHHhfpEprx6hVY60Y69Je', 'buyer'),
(4, 'susi@gmail.com', '$2y$10$1.DxkCBrwjX8AkNgVDNPqOObEgeFMEnk78GR8Y.6GYWLF3yyAoYBS', 'buyer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `history_track`
--
ALTER TABLE `history_track`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `master_kategori`
--
ALTER TABLE `master_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `master_produk`
--
ALTER TABLE `master_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `master_track`
--
ALTER TABLE `master_track`
  ADD PRIMARY KEY (`id_track`);

--
-- Indexes for table `rinci_transaksi`
--
ALTER TABLE `rinci_transaksi`
  ADD PRIMARY KEY (`id_rinci`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_transaksi`
--
ALTER TABLE `data_transaksi`
  MODIFY `id` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `history_track`
--
ALTER TABLE `history_track`
  MODIFY `id_history` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `master_kategori`
--
ALTER TABLE `master_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_produk`
--
ALTER TABLE `master_produk`
  MODIFY `id_produk` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `master_track`
--
ALTER TABLE `master_track`
  MODIFY `id_track` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rinci_transaksi`
--
ALTER TABLE `rinci_transaksi`
  MODIFY `id_rinci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 24, 2023 at 02:35 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookmedik`
--
CREATE DATABASE IF NOT EXISTS `bookmedik` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bookmedik`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Modulo 1');

-- --------------------------------------------------------

--
-- Table structure for table `medic`
--

CREATE TABLE `medic` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medic`
--

INSERT INTO `medic` (`id`, `name`, `lastname`, `email`, `address`, `phone`, `image`, `is_active`, `created_at`, `category_id`) VALUES
(1, 'kevin', 'saavedra', 'kevinsaavedra55@gmail.com', 'centro', '04165026559', NULL, 1, '2023-01-23 01:37:54', 1),
(2, 'Carlos', 'Gonzales', 'carlos@gmail.com', 'centro', '3654654', NULL, 1, '2023-01-22 10:08:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pacient`
--

CREATE TABLE `pacient` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pacient`
--

INSERT INTO `pacient` (`id`, `name`, `lastname`, `email`, `address`, `phone`, `image`, `is_active`, `created_at`) VALUES
(1, 'kevin', 'saavedra', 'kevinsaavedra55@gmail.com', 'centro', '04165026559', NULL, 1, '2023-01-23 01:37:19'),
(2, 'Leonardo', 'Carmona', 'Leo@gmail.com', 'Centro', '3434', NULL, 1, '2023-01-22 09:49:46');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `note` text NOT NULL,
  `message` text DEFAULT NULL,
  `date_at` varchar(50) NOT NULL,
  `time_at` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `pacient_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `medic_id` int(11) NOT NULL,
  `is_web` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `title`, `note`, `message`, `date_at`, `time_at`, `created_at`, `pacient_id`, `user_id`, `medic_id`, `is_web`) VALUES
(1, 'Dolor de cabeza', 'El paciente presenta dolor de cabeza agudo con bastante frecuencia', NULL, '2023-01-10', '00:52', '2023-01-22 09:54:29', 1, 1, 1, 0),
(2, 'asffff', '', NULL, '2023-02-02', '01:57', '2023-01-22 09:54:54', 2, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `name`, `lastname`, `email`, `password`, `is_active`, `is_admin`, `created_at`) VALUES
(1, 'admin', 'admin', NULL, 'admin@gmail.com', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 1, 1, '2023-01-22 20:20:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medic`
--
ALTER TABLE `medic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `pacient`
--
ALTER TABLE `pacient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pacient_id` (`pacient_id`),
  ADD KEY `medic_id` (`medic_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medic`
--
ALTER TABLE `medic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pacient`
--
ALTER TABLE `pacient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medic`
--
ALTER TABLE `medic`
  ADD CONSTRAINT `medic_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`pacient_id`) REFERENCES `pacient` (`id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`medic_id`) REFERENCES `medic` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

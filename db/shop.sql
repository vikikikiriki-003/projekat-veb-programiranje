-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2024 at 02:10 AM
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
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `delivery_address`, `created_at`) VALUES
(3, 3, 'Srbija, Beograd, 11000, Terazije 1', '2024-08-25 00:04:04'),
(4, 3, 'Srbija, Beograd, dsa, dsadas', '2024-08-26 22:03:28'),
(5, 3, 'Srbija, Beograd, 11000, Terazije 1', '2024-08-28 01:00:55'),
(6, 3, 'Srbija, Beograd, 11000, Terazije 1', '2024-08-28 01:51:22');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_items_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_items_id`, `order_id`, `product_id`, `quantity`) VALUES
(9, 3, 2, ''),
(10, 3, 4, ''),
(11, 3, 6, ''),
(12, 3, 6, '3'),
(13, 4, 1, '3'),
(14, 4, 2, '2'),
(15, 5, 9, '7'),
(16, 6, 12, '2');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `size`, `image`, `created_at`) VALUES
(8, 'Shoes 1', '100', '42', 'pexels-mstudio-360817-1240892.jpg', '2024-08-28 00:20:20'),
(9, 'Shoes 2', '80', '43', 'pexels-goumbik-292998.jpg', '2024-08-28 00:22:29'),
(10, 'Sneakers', '70', '45', 'pexels-pluyar-786003.jpg', '2024-08-28 00:24:45'),
(11, 'Sneakers 2', '50', '39', 'pexels-mnzoutfits-1670766.jpg', '2024-08-28 00:26:02'),
(12, 'Sneakers A', '85', '44', 'pexels-momentsbypeterpatel-637076.jpg', '2024-08-28 00:26:58'),
(13, 'Sneakers sport 1', '100', '45', 'pexels-jddaniel-2385477.jpg', '2024-08-28 00:27:54'),
(15, 'Sneakers B', '62', '39', 'pexels-jose-martin-segura-benites-1422456152-27503497.jpg', '2024-08-28 00:31:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_admin` int(1) NOT NULL DEFAULT 0,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `email`, `is_admin`, `password`, `created_at`) VALUES
(1, 'name', 'username', 'user@test.com', 0, '$2y$10$3Y3S2QoE3bS1IA7jFmY02eDFMC1ouWrPHYba9FcsVs1f58rLeeqRW', '2024-08-22 23:46:36'),
(2, 'Imeprezime', 'usernameee', 'sdi@test.com', 0, '$2y$10$P2ElsbVvRWAM70HuZy8aI.kk58cNdpxRW//9gTQCi2ubPhfXCzFgC', '2024-08-22 23:53:16'),
(3, 'Admin1', 'admin1', 'admin1@admin.com', 1, '$2y$10$tHsV7.RBge04OIkThWCSkOzh.AjEsKW5fcbJaffyIZYhnLL9P79Oa', '2024-08-25 00:06:39'),
(4, 'Neko Ime', 'neko123', 'dsiajdai@mail.com', 0, '$2y$10$1yiI0WLRimz89c4y75IaYuwziPg/ZP/.aVuqTwxYj0WIprrB0pVx2', '2024-08-28 01:55:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

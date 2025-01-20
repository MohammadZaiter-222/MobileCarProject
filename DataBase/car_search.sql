-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 02, 2025 at 06:27 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_search`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `availability` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `brand`, `model`, `price`, `availability`) VALUES
(1, 'Toyota', 'Corolla', 20000.00, 1),
(2, 'Honda', 'Civic', 22000.00, 1),
(3, 'Ford', 'Focus', 18000.00, 0),
(4, 'BMW', '3 Series', 40000.00, 1),
(5, 'Mercedes-Benz', 'C-Class', 45000.00, 1),
(6, 'Tesla', 'Model 3', 50000.00, 1),
(7, 'Hyundai', 'Elantra', 19000.00, 1),
(8, 'Chevrolet', 'Malibu', 23000.00, 0),
(9, 'Nissan', 'Altima', 24000.00, 1),
(10, 'Volkswagen', 'Passat', 26000.00, 0),
(11, 'Audi', 'A4', 42000.00, 1),
(12, 'Kia', 'Optima', 21000.00, 1),
(13, 'Subaru', 'Impreza', 20500.00, 1),
(14, 'Mazda', 'Mazda3', 22000.00, 1),
(15, 'Volvo', 'S60', 38000.00, 0),
(16, 'Porsche', '911', 100000.00, 1),
(17, 'Lexus', 'ES', 40000.00, 1),
(18, 'Jeep', 'Grand Cherokee', 35000.00, 0),
(19, 'Ford', 'Explorer', 32000.00, 1),
(20, 'Chevrolet', 'Tahoe', 50000.00, 1),
(21, 'Honda', 'Accord', 25000.00, 1),
(22, 'Toyota', 'Camry', 24000.00, 1),
(23, 'BMW', 'X5', 60000.00, 1),
(24, 'Audi', 'Q5', 50000.00, 1),
(25, 'Tesla', 'Model S', 80000.00, 1),
(26, 'Hyundai', 'Tucson', 26000.00, 0),
(27, 'Kia', 'Sportage', 25000.00, 1),
(28, 'Subaru', 'Outback', 27000.00, 1),
(29, 'Mazda', 'CX-5', 28000.00, 0),
(30, 'Volvo', 'XC90', 60000.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, '', '$2y$10$zcq0K9MN4NBK2St9BCvm8eeQYBXGGRy39LDcGyiqPqsUZk2W84/sy', 'user'),
(2, 'aaa', '$2y$10$1NJ6LF6VgXTKJtokwBXO6uFWcBebxgCpDW5O5NOQe2h64mpe4ijLe', 'user'),
(3, 'aaaa', '$2y$10$gP2hJSVMB8VzY5MkObODmuO/19Zya0gfGplyUCUvqE3Fs9L4bZPpW', 'user'),
(4, 'as', '$2y$10$g4ZwynBE5YVHFQFTKgXnMewuzOplyDGXF4EhKViBUY2wkSnTzKjLa', 'user'),
(5, 'am', '$2y$10$ZOyF9N/UpAkA91amZ5alx.OW9et.1ysUyH6iriplfbC/NajpMUvdi', 'user'),
(6, 'amm', '$2y$10$KH.N7H6crogKE3UK/QeEauz9cgRMgND8O8nzdaDqiIIZEJYTAXvvi', 'user'),
(7, 'abc', '$2y$10$neNXH.bkxHKxmDYxDwfQwuWm93Tew/AopU0J9QXfRXw4o5xh4.xpy', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

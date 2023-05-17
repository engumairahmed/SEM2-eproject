-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2023 at 11:39 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_glamglow`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(255) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `delete_admin` BEFORE DELETE ON `admin` FOR EACH ROW BEGIN
    UPDATE audit_admin SET aud_adm_leavedate=CURRENT_TIMESTAMP, aud_adm_comments='Account Deleted';
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trig_insert` BEFORE INSERT ON `admin` FOR EACH ROW BEGIN
    INSERT INTO audit_admin VALUES(NULL , NEW.admin_name,NEW.admin_email,NEW.admin_contact, CURRENT_TIMESTAMP, NULL);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `aduit_user`
--

CREATE TABLE `aduit_user` (
  `aud_usr_id` int(255) NOT NULL,
  `aud_usr_name` varchar(255) NOT NULL,
  `aud_usr_email` varchar(255) NOT NULL,
  `aud_usr_contact` varchar(255) NOT NULL,
  `aud_usr_joindate` varchar(255) NOT NULL,
  `aud_usr_leavedate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_admin`
--

CREATE TABLE `audit_admin` (
  `aud_adm_id` int(255) NOT NULL,
  `aud_adm_name` varchar(255) NOT NULL,
  `aud_adm_email` varchar(255) NOT NULL,
  `aud_adm_contact` varchar(255) NOT NULL,
  `aud_adm_joindate` varchar(255) NOT NULL,
  `aud_adm_leavedate` varchar(255) DEFAULT NULL,
  `aud_adm_comments` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_category`
--

CREATE TABLE `audit_category` (
  `aud_cat_id` int(255) NOT NULL,
  `aud_cat_name` varchar(255) NOT NULL,
  `aud_cat_createdate` varchar(255) NOT NULL,
  `aud_cat_deletedate` varchar(255) NOT NULL,
  `aud_cat_updatedate` varchar(255) NOT NULL,
  `aud_cat_comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_orders`
--

CREATE TABLE `audit_orders` (
  `aud_ord_id` int(255) NOT NULL,
  `aud_ord_user` int(255) NOT NULL,
  `aud_ord_product` int(255) NOT NULL,
  `aud_ord_quantity` varchar(255) NOT NULL,
  `aud_ord_receipt` varchar(255) NOT NULL,
  `aud_ord_createdate` varchar(255) NOT NULL,
  `aud_ord_deletedate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_product`
--

CREATE TABLE `audit_product` (
  `aud_prod_id` int(255) NOT NULL,
  `aud_prod_name` varchar(255) NOT NULL,
  `aud_prod_brand` int(11) NOT NULL,
  `aud_prod_price` varchar(255) NOT NULL,
  `aud_prod_createdate` varchar(255) NOT NULL,
  `aud_prod_deletedate` varchar(255) DEFAULT NULL,
  `aud_prod_updatedate` varchar(255) DEFAULT NULL,
  `aud_prod_comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audit_product`
--

INSERT INTO `audit_product` (`aud_prod_id`, `aud_prod_name`, `aud_prod_brand`, `aud_prod_price`, `aud_prod_createdate`, `aud_prod_deletedate`, `aud_prod_updatedate`, `aud_prod_comment`) VALUES
(1, 'Mascara', 5, '400', '2023-05-14 20:55:28', NULL, NULL, 'Product added'),
(2, 'Eye Liner', 1, '500', '2023-05-17 02:02:22', NULL, NULL, 'Product added');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(255) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `brand_category` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_category`) VALUES
(1, 'Miss Rose', 2),
(2, 'Glamours', 2),
(3, 'Etude', 2),
(4, 'Loreal', 2),
(5, 'Huda Beauty', 2),
(6, 'ST London', 2),
(7, 'Medora', 2);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(255) NOT NULL,
  `cart_user` int(255) NOT NULL,
  `cart_product` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` int(255) NOT NULL,
  `cat_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(1, 'Jewelry'),
(2, 'Cosmetics');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ord_id` int(255) NOT NULL,
  `ord_user` int(255) NOT NULL,
  `ord_product` int(255) NOT NULL,
  `ord_quantity` int(255) NOT NULL,
  `ord_status` int(255) NOT NULL,
  `ord_receipt_no` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `insert_order` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
INSERT INTO audit_product VALUES(Null,NEW.ord_user,NEW.ord_product,NEW.ord_quantity,NEW.ord_receipt_no,CURRENT_TIMESTAMP,Null);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `os_id` int(255) NOT NULL,
  `os_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(255) NOT NULL,
  `prod_name` varchar(255) NOT NULL,
  `prod_brand` int(255) NOT NULL,
  `prod_category` int(255) NOT NULL,
  `prod_price` int(255) NOT NULL,
  `prod_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `prod_name`, `prod_brand`, `prod_category`, `prod_price`, `prod_image`) VALUES
(1, 'Lipsticks', 1, 2, 500, 'img/lipstick.jpg'),
(2, 'Face Powder', 2, 2, 1000, 'img/facepowder.jpg'),
(3, 'Mascara', 5, 2, 400, 'img/1684079728mascara.jpg'),
(4, 'Eye Liner', 1, 2, 500, 'img/1684270942eye linerpic.jpg');

--
-- Triggers `products`
--
DELIMITER $$
CREATE TRIGGER `insert_product` BEFORE INSERT ON `products` FOR EACH ROW BEGIN
    INSERT INTO audit_product VALUES(Null,NEW.prod_name,NEW.prod_brand,NEW.prod_price,CURRENT_TIMESTAMP,Null,Null,'Product added');
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stk_id` int(11) NOT NULL,
  `stk_product` int(11) NOT NULL,
  `stk_quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`stk_id`, `stk_product`, `stk_quantity`) VALUES
(1, 1, 100),
(2, 2, 100),
(3, 3, 100);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_contact` int(255) NOT NULL,
  `user_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `insert_user` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
INSERT INTO `audit_user` VALUES(NULL,NEW.user_name,NEW.user_email,NEW.user_contact,NEW.user_address,CURRENT_TIMESTAMP,NULL);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `aduit_user`
--
ALTER TABLE `aduit_user`
  ADD PRIMARY KEY (`aud_usr_id`);

--
-- Indexes for table `audit_admin`
--
ALTER TABLE `audit_admin`
  ADD PRIMARY KEY (`aud_adm_id`);

--
-- Indexes for table `audit_category`
--
ALTER TABLE `audit_category`
  ADD PRIMARY KEY (`aud_cat_id`);

--
-- Indexes for table `audit_orders`
--
ALTER TABLE `audit_orders`
  ADD PRIMARY KEY (`aud_ord_id`),
  ADD KEY `FK_AUD_ORD_USER` (`aud_ord_user`),
  ADD KEY `FK_AUD_ORD_PRODUCT` (`aud_ord_product`);

--
-- Indexes for table `audit_product`
--
ALTER TABLE `audit_product`
  ADD PRIMARY KEY (`aud_prod_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD KEY `FK_Brand_Category` (`brand_category`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `FK_Cart_User` (`cart_user`),
  ADD KEY `FK_Cart_Product` (`cart_product`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`ord_id`),
  ADD KEY `FK_Order_product` (`ord_product`),
  ADD KEY `FK_Order_User` (`ord_user`),
  ADD KEY `FK_Order_Status` (`ord_status`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`os_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `FK_Product_Category` (`prod_category`),
  ADD KEY `FK_Product_brand` (`prod_brand`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stk_id`),
  ADD KEY `FK_Stock_Product` (`stk_product`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aduit_user`
--
ALTER TABLE `aduit_user`
  MODIFY `aud_usr_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_admin`
--
ALTER TABLE `audit_admin`
  MODIFY `aud_adm_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_category`
--
ALTER TABLE `audit_category`
  MODIFY `aud_cat_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_orders`
--
ALTER TABLE `audit_orders`
  MODIFY `aud_ord_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_product`
--
ALTER TABLE `audit_product`
  MODIFY `aud_prod_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `ord_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `os_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `stk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_orders`
--
ALTER TABLE `audit_orders`
  ADD CONSTRAINT `FK_AUD_ORD_PRODUCT` FOREIGN KEY (`aud_ord_product`) REFERENCES `products` (`prod_id`),
  ADD CONSTRAINT `FK_AUD_ORD_USER` FOREIGN KEY (`aud_ord_user`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `FK_Brand_Category` FOREIGN KEY (`brand_category`) REFERENCES `category` (`cat_id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_Cart_Product` FOREIGN KEY (`cart_product`) REFERENCES `products` (`prod_id`),
  ADD CONSTRAINT `FK_Cart_User` FOREIGN KEY (`cart_user`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_Order_Status` FOREIGN KEY (`ord_status`) REFERENCES `order_status` (`os_id`),
  ADD CONSTRAINT `FK_Order_User` FOREIGN KEY (`ord_user`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `FK_Order_product` FOREIGN KEY (`ord_product`) REFERENCES `products` (`prod_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_Product_Category` FOREIGN KEY (`prod_category`) REFERENCES `category` (`cat_id`),
  ADD CONSTRAINT `FK_Product_brand` FOREIGN KEY (`prod_brand`) REFERENCES `brands` (`brand_id`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `FK_Stock_Product` FOREIGN KEY (`stk_product`) REFERENCES `products` (`prod_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

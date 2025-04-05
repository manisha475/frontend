-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 21, 2025 at 03:32 PM
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
-- Database: `supershop_rdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL COMMENT 'ADMINS ID',
  `admin_name` varchar(64) NOT NULL,
  `admin_email` varchar(64) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_password` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `admin_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `admin_type` enum('Root Admin','Content Manager','Sales Manager','Technical Operator') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `admin_name`, `admin_email`, `admin_image`, `admin_password`, `admin_status`, `admin_type`, `created_at`, `updated_at`) VALUES
(6, 'manisha', 'manisha@shop.com', 'ADMINIMAGE_20250121175011_360_F_559871209_pbXlOVArUal3mk6Ce60JuP13kmuIRCth-Photoroom.png', '4e2169fde3a8707df597b2a0c17242b2a27fc024', 'Active', 'Root Admin', '2025-01-21 17:50:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL COMMENT 'CATEGORIES ID',
  `category_name` varchar(64) NOT NULL,
  `category_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_status`, `created_at`, `updated_at`) VALUES
(1, 'Guitar', 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL COMMENT 'CONTACTS ID',
  `contacts_name` varchar(64) NOT NULL,
  `contacts_email` varchar(64) NOT NULL,
  `contacts_phone` varchar(32) NOT NULL,
  `contacts_overview` varchar(512) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `contacts_name`, `contacts_email`, `contacts_phone`, `contacts_overview`, `created_at`, `updated_at`) VALUES
(1, 'Jhon Doe', 'jhondoe@hotmail.com', '01645770422', 'Hi there,\r\nAll in all it was a really easy approach to creating your online store. I have complete control over how and what I want placed within my site, with the additional benefit of being able to change anything as and when I want.', '2020-07-06 10:20:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL COMMENT 'CUSTOMERS ID',
  `customer_name` varchar(128) NOT NULL,
  `customer_email` varchar(64) NOT NULL,
  `customer_mobile` varchar(16) NOT NULL,
  `customer_address` varchar(256) NOT NULL,
  `customer_password` varchar(128) NOT NULL,
  `customer_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `id` int(11) NOT NULL COMMENT 'DELIVERIES ID',
  `customer_id` int(11) NOT NULL,
  `shipping_charge` enum('50','120') NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(11) NOT NULL COMMENT 'DISCOUNT ID',
  `discount_code` varchar(256) NOT NULL,
  `price_discount_amount` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL COMMENT 'INVOICE ID',
  `invoice_id` varchar(128) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `transaction_amount` double NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL COMMENT 'NEWSLETTER ID',
  `newsletter_email` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL COMMENT 'ORDERS ID',
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `sub_total` double NOT NULL,
  `tax` double NOT NULL,
  `delivery_charge` int(11) NOT NULL,
  `discount_amount` double NOT NULL,
  `grand_total` double NOT NULL,
  `payment_method` enum('SSL COMMERZ','PayPal','Cash On Delivery') NOT NULL DEFAULT 'Cash On Delivery',
  `transaction_id` varchar(256) NOT NULL,
  `transaction_status` enum('Paid','Unpaid') NOT NULL DEFAULT 'Paid',
  `order_item_status` enum('Pending','Processing','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL COMMENT 'ORDER ITEMS ID',
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `prod_quantity` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL COMMENT 'PAGES ID',
  `page_title` text NOT NULL,
  `page_content` text NOT NULL,
  `page_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL COMMENT 'PRODUCTS ID',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `product_name` varchar(128) NOT NULL,
  `product_summary` text NOT NULL,
  `product_details` text NOT NULL,
  `product_master_image` text NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `product_discount_price` double NOT NULL,
  `discount_start` datetime NOT NULL,
  `discount_ends` datetime NOT NULL,
  `product_status` enum('In Stock','Out of Stock') NOT NULL DEFAULT 'In Stock',
  `product_featured` enum('YES','NO') NOT NULL DEFAULT 'NO',
  `product_tags` varchar(512) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `products_image_one` text DEFAULT NULL,
  `products_image_two` text DEFAULT NULL,
  `products_image_three` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `product_name`, `product_summary`, `product_details`, `product_master_image`, `product_quantity`, `product_price`, `product_discount_price`, `discount_start`, `discount_ends`, `product_status`, `product_featured`, `product_tags`, `created_at`, `updated_at`, `products_image_one`, `products_image_two`, `products_image_three`) VALUES
(71, 1, 26, 'guitar high', 'hello', 'hello', 'PRODUCT_20250121202338_1.png', 50, 1500, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'hello', '2025-01-21 20:23:38', NULL, 'PRODUCTONE_20250121202338_1.png', 'PRODUCTTWO_20250121202338_1.png', 'PRODUCTTHREE_20250121202338_1.png'),
(72, 1, 27, 'guitar highly', 'hello', 'hello', 'PRODUCT_20250121202604_images.jpeg', 20, 250, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'NO', 'hello', '2025-01-21 20:26:04', NULL, 'PRODUCTONE_20250121202604_images.jpeg', 'PRODUCTTWO_20250121202604_images.jpeg', 'PRODUCTTHREE_20250121202604_images.jpeg'),
(73, 1, 28, 'Guitar Better Music', 'hello', 'hello', 'PRODUCT_20250121202816_images (2).jpeg', 40, 45000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'In Stock', 'YES', 'hello', '2025-01-21 20:28:16', NULL, 'PRODUCTONE_20250121202816_images (2).jpeg', 'PRODUCTTWO_20250121202816_images (2).jpeg', 'PRODUCTTHREE_20250121202816_images (2).jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` int(11) NOT NULL COMMENT 'SHIPPING ID',
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `shipcstmr_name` varchar(128) NOT NULL,
  `shipcstmr_mobile` varchar(32) NOT NULL,
  `shipcstmr_profession` varchar(256) DEFAULT NULL,
  `shipcstmr_streetadd` varchar(256) NOT NULL,
  `shipcstmr_city` varchar(64) NOT NULL,
  `shipcstmr_zip` varchar(6) NOT NULL,
  `shipcstmr_country` varchar(64) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shopcarts`
--

CREATE TABLE `shopcarts` (
  `id` int(11) NOT NULL COMMENT 'SHOPCARTS ID',
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL COMMENT 'SLIDER ID',
  `slider_title` varchar(128) NOT NULL,
  `slider_file` text NOT NULL,
  `slider_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `slider_sequence` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `slider_title`, `slider_file`, `slider_status`, `slider_sequence`, `created_at`, `updated_at`) VALUES
(7, 'music', 'SLIDER_20250121181500_58493639_9400164.jpg', 'Active', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL COMMENT 'SUBCATEGORIES ID',
  `category_id` int(11) NOT NULL,
  `subcategory_name` varchar(128) NOT NULL,
  `subcategory_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `subcategory_banner` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `category_id`, `subcategory_name`, `subcategory_status`, `subcategory_banner`, `created_at`, `updated_at`) VALUES
(26, 1, 'Bass guitar', 'Active', 'SUBCATBANNER__20250121202210_Ge25ccbyKQ76Et9bBjFnxk-1200-80.jpg', '2025-01-21 19:47:01', NULL),
(27, 1, 'Twelve-string guitar', 'Active', 'SUBCATBANNER_20250121202536_taylor-blog-12-string-vs-6-headstock-1024x576.jpg', '2025-01-21 20:25:36', NULL),
(28, 1, 'Classical guitars', 'Active', 'SUBCATBANNER_20250121202715_images (1).jpeg', '2025-01-21 20:27:15', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `shipping_id` (`shipping_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `shopcarts`
--
ALTER TABLE `shopcarts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ADMINS ID', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CATEGORIES ID', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CONTACTS ID', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'CUSTOMERS ID', AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'DELIVERIES ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'DISCOUNT ID';

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'INVOICE ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'NEWSLETTER ID';

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ORDERS ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ORDER ITEMS ID', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PAGES ID';

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'PRODUCTS ID', AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SHIPPING ID', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shopcarts`
--
ALTER TABLE `shopcarts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SHOPCARTS ID', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SLIDER ID', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'SUBCATEGORIES ID', AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD CONSTRAINT `deliveries_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `deliveries_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `shippings`
--
ALTER TABLE `shippings`
  ADD CONSTRAINT `shippings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shippings_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `shopcarts`
--
ALTER TABLE `shopcarts`
  ADD CONSTRAINT `shopcarts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `shopcarts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

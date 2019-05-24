-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 02, 2019 at 02:18 AM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `InventoryManagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `Brand`
--

CREATE TABLE IF NOT EXISTS `Brand` (
  `Brand_Name` int(11) NOT NULL,
  `Best_Before_Date` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Invoice_Details`
--

CREATE TABLE IF NOT EXISTS `Invoice_Details` (
  `Sales_Quantity` int(11) NOT NULL,
  `Product_Description` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Invoice_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PO_Details`
--

CREATE TABLE IF NOT EXISTS `PO_Details` (
  `Product_ID` int(11) NOT NULL,
  `PO_Quantity` int(11) NOT NULL,
  `Product_Description` int(11) NOT NULL,
  `PO_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE IF NOT EXISTS `Product` (
  `Product_Name` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Product_Category`
--

CREATE TABLE IF NOT EXISTS `Product_Category` (
  `Category_ID` int(11) NOT NULL,
  `Category_Type` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Purchase_Details`
--

CREATE TABLE IF NOT EXISTS `Purchase_Details` (
  `Purchase_Quantity` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Product_Description` int(11) NOT NULL,
  `Invoice_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Purchase_Invoice`
--

CREATE TABLE IF NOT EXISTS `Purchase_Invoice` (
  `Invoice_ID` int(11) NOT NULL,
  `Invoice_Date` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Purchase_Order`
--

CREATE TABLE IF NOT EXISTS `Purchase_Order` (
  `PO_ID` int(11) NOT NULL,
  `PO_Date` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Sales_Invoice`
--

CREATE TABLE IF NOT EXISTS `Sales_Invoice` (
  `Sales_Date` int(11) NOT NULL,
  `Invoice_ID` int(11) NOT NULL,
  `Customer_Description` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Stock`
--

CREATE TABLE IF NOT EXISTS `Stock` (
  `Quantity` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Supplier`
--

CREATE TABLE IF NOT EXISTS `Supplier` (
  `Supplier_Name` int(11) NOT NULL,
  `Supplier_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `User_Name` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Brand`
--
ALTER TABLE `Brand`
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `Invoice_Details`
--
ALTER TABLE `Invoice_Details`
  ADD KEY `Invoice_ID` (`Invoice_ID`),
  ADD KEY `Invoice_ID_2` (`Invoice_ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Product_Description` (`Product_Description`),
  ADD KEY `Sales_Quantity` (`Sales_Quantity`);

--
-- Indexes for table `PO_Details`
--
ALTER TABLE `PO_Details`
  ADD KEY `PO_ID` (`PO_ID`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`Product_ID`),
  ADD UNIQUE KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `Product_Category`
--
ALTER TABLE `Product_Category`
  ADD PRIMARY KEY (`Category_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `Purchase_Details`
--
ALTER TABLE `Purchase_Details`
  ADD KEY `Invoice_ID` (`Invoice_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `Purchase_Invoice`
--
ALTER TABLE `Purchase_Invoice`
  ADD PRIMARY KEY (`Invoice_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Purchase_Order`
--
ALTER TABLE `Purchase_Order`
  ADD PRIMARY KEY (`PO_ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Sales_Invoice`
--
ALTER TABLE `Sales_Invoice`
  ADD PRIMARY KEY (`Invoice_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `Stock`
--
ALTER TABLE `Stock`
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `Supplier`
--
ALTER TABLE `Supplier`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Brand`
--
ALTER TABLE `Brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`);

--
-- Constraints for table `Invoice_Details`
--
ALTER TABLE `Invoice_Details`
  ADD CONSTRAINT `invoice_details_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`),
  ADD CONSTRAINT `invoice_details_ibfk_2` FOREIGN KEY (`Invoice_ID`) REFERENCES `Sales_Invoice` (`Invoice_ID`);

--
-- Constraints for table `PO_Details`
--
ALTER TABLE `PO_Details`
  ADD CONSTRAINT `po_details_ibfk_1` FOREIGN KEY (`PO_ID`) REFERENCES `Purchase_Order` (`PO_ID`);

--
-- Constraints for table `Product_Category`
--
ALTER TABLE `Product_Category`
  ADD CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`);

--
-- Constraints for table `Purchase_Details`
--
ALTER TABLE `Purchase_Details`
  ADD CONSTRAINT `purchase_details_ibfk_1` FOREIGN KEY (`Invoice_ID`) REFERENCES `Purchase_Invoice` (`Invoice_ID`),
  ADD CONSTRAINT `purchase_details_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`);

--
-- Constraints for table `Purchase_Invoice`
--
ALTER TABLE `Purchase_Invoice`
  ADD CONSTRAINT `purchase_invoice_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `Supplier` (`Supplier_ID`),
  ADD CONSTRAINT `purchase_invoice_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`);

--
-- Constraints for table `Purchase_Order`
--
ALTER TABLE `Purchase_Order`
  ADD CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`),
  ADD CONSTRAINT `purchase_order_ibfk_2` FOREIGN KEY (`Supplier_ID`) REFERENCES `Supplier` (`Supplier_ID`),
  ADD CONSTRAINT `purchase_order_ibfk_3` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`);

--
-- Constraints for table `Sales_Invoice`
--
ALTER TABLE `Sales_Invoice`
  ADD CONSTRAINT `sales_invoice_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `Users` (`User_ID`);

--
-- Constraints for table `Stock`
--
ALTER TABLE `Stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `Product` (`Product_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

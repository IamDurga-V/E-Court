-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2018 at 05:50 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supremecourt`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `casec` (OUT `$sql` VARCHAR(100))  NO SQL
SELECT ccode,category,scategory FROM casecategory$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CFS` (OUT `$sql` VARCHAR(100))  NO SQL
SELECT casetype,category,scategory,fees FROM courtfees$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `advocates`
--

CREATE TABLE `advocates` (
  `name` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `mobile_no` int(10) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `charge` varchar(30) NOT NULL,
  `acheivments` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `casecategory`
--

CREATE TABLE `casecategory` (
  `ccode` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `scategory` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `casecategory`
--

INSERT INTO `casecategory` (`ccode`, `category`, `scategory`) VALUES
(101, 'Labour Matters', 'Dismissal'),
(201, 'Rent Act Matters', 'Eviction matters of personal necessity'),
(301, 'Direct Taxes Matter', 'Income Tax Reference under Section 257'),
(401, 'Indirect Taxes Matters', 'Interpretation of the Customs Act, Rules & Regulations'),
(501, 'Land Acquisition & Requisition Matters', 'Matters challenging the acquisition proceedings'),
(601, 'Service Matters', 'Retiral benefits');

-- --------------------------------------------------------

--
-- Table structure for table `caveat`
--

CREATE TABLE `caveat` (
  `cavno` int(11) NOT NULL,
  `slci` varchar(100) NOT NULL,
  `diaryno` int(11) NOT NULL,
  `cause` varchar(100) NOT NULL,
  `padvo` varchar(100) NOT NULL,
  `radvo` varchar(100) NOT NULL,
  `cfees` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caveat`
--

INSERT INTO `caveat` (`cavno`, `slci`, `diaryno`, `cause`, `padvo`, `radvo`, `cfees`) VALUES
(10370, 'KERALA\r\nHIGH COURT OF KERALA AT ERNAKULAM\r\nBA-4811-2018\r\n09-10-2018', 42464, 'TM THOMAS Vs. ABDUL SATHAR', 'HARSHAD V. HAMEED', '', 0),
(10498, 'KERALA HIGH COURT OF KERALA AT ERNAKULAM EP-11-2016 09-11-2018', 43393, 'MV NIKESH KUMAR Vs. KM SHAJI', 'P. V. DINESH', '', 510),
(10499, 'DELHI NATIONAL GREEN TRIBUNAL AN-51-2018 11-10-2018', 0, 'NATIONAL HYDROELECTRIC POWER CORPORATION Vs. PRADIP KUMAR BHUYAN', 'Avneesh Arputham', '', 510),
(10500, 'DELHI Telecom Disputes Settlement and Appellate Tribunal TP-500-2014 30-10-2018', 0, 'CELLULAR OPERATORS ASSOCIATION OF INDIA Vs. DEPARTMENT OF TELECOMMUNICATIONS', 'Rohit Amit Sthalekar', '', 510),
(10502, 'PUNJAB HIGH COURT OF PUNJAB & HARYANA AT CHANDIGARH FAO-3946-2018 13-11-2018', 0, 'DAKSHIN HARYANA BIJLIVITRAN NIGAM HISAR Vs. M/S SHIVAJI M. JADHAV AND COMPANY', 'D.S.K. LEGAL', '', 510);

-- --------------------------------------------------------

--
-- Table structure for table `courtfees`
--

CREATE TABLE `courtfees` (
  `casetype` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  `scategory` varchar(100) NOT NULL,
  `fees` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courtfees`
--

INSERT INTO `courtfees` (`casetype`, `category`, `scategory`, `fees`) VALUES
('ARBITRATION PETITION', 'LABOUR MATTERS', 'CONTRACT LABOUR', 1432),
('CIVIL APPEAL', 'DIRECT TAXES MATTER', 'INCOME TAX REFERENCE UNDER SECTION 257', 1695),
('CRIMINAL APPEAL', 'SERVICE MATTERS', 'PAY SCALES', 1730),
('REF U/A 317(1)', 'ELECTION MATTERS', 'UNIVERSITY ELECTION MATTERS', 1765),
('REVIEW PETITION(CIVIL)', 'CRIMINAL MATTERS', 'MATTERS RELATING TO PREVENTION OF CORRUPTION ACT', 2500);

-- --------------------------------------------------------

--
-- Table structure for table `cs`
--

CREATE TABLE `cs` (
  `cno` varchar(10) NOT NULL,
  `diaryno` varchar(10) NOT NULL,
  `ctype` varchar(30) NOT NULL,
  `cyear` varchar(10) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `rname` varchar(100) NOT NULL,
  `radvocates` varchar(100) NOT NULL,
  `padvocates` varchar(100) NOT NULL,
  `judges` varchar(200) NOT NULL,
  `nh` varchar(20) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `cs`
--
DELIMITER $$
CREATE TRIGGER `display` BEFORE DELETE ON `cs` FOR EACH ROW INSERT INTO triggerjudgement VALUES(OLD.cno,OLD.diaryno,OLD.ctype,OLD.cyear,OLD.pname,OLD.rname,OLD.radvocates,OLD.padvocates,OLd.judges)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `efile`
--

CREATE TABLE `efile` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(30) NOT NULL,
  `state` varchar(10) NOT NULL,
  `district` varchar(10) NOT NULL,
  `pincode` varchar(10) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `aadharno` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `csubject` varchar(100) NOT NULL,
  `cfdetail` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `efile`
--

INSERT INTO `efile` (`id`, `name`, `dob`, `address`, `state`, `district`, `pincode`, `gender`, `aadharno`, `phone`, `email`, `csubject`, `cfdetail`) VALUES
(1, 'Sanjay Karn', '2018-11-08', 'ward no  2 main(Aashish Hardwa', 'Main Chowk', 'sdfghjkl', '847225', 'male', '2134567890987', '9546754125', 'meenamanisha337@gmail.com', 'Land Grabbing', 'sfghbdgdvc');

-- --------------------------------------------------------

--
-- Table structure for table `judgement`
--

CREATE TABLE `judgement` (
  `caseno` varchar(10) NOT NULL,
  `jd` varchar(20) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `judges`
--

CREATE TABLE `judges` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `doa` varchar(20) NOT NULL,
  `dor` varchar(20) NOT NULL,
  `nj` varchar(500) NOT NULL,
  `about` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `title` varchar(100) NOT NULL,
  `notice` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`title`, `notice`) VALUES
('Change in Id-ul-Zuha (Bakrid) holiday 20-Aug-2018', '            Government of India has declared that id-ul-zuha(Bakrid) will now be observed on 22-08-2018 instead of 23-08-2018.s');

-- --------------------------------------------------------

--
-- Table structure for table `triggerjudgement`
--

CREATE TABLE `triggerjudgement` (
  `cno` varchar(10) NOT NULL,
  `diaryno` varchar(10) NOT NULL,
  `ctype` varchar(20) NOT NULL,
  `cyear` varchar(20) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `rname` varchar(50) NOT NULL,
  `radvocates` varchar(50) NOT NULL,
  `padvocates` varchar(50) NOT NULL,
  `judges` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `triggerjudgement`
--

INSERT INTO `triggerjudgement` (`cno`, `diaryno`, `ctype`, `cyear`, `pname`, `rname`, `radvocates`, `padvocates`, `judges`) VALUES
('121', '12212', 'abc', '2020-12-01', 'dddd', 'fffff', 'qqqq', 'wwww', 'qqqq');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advocates`
--
ALTER TABLE `advocates`
  ADD PRIMARY KEY (`name`,`code`);

--
-- Indexes for table `casecategory`
--
ALTER TABLE `casecategory`
  ADD PRIMARY KEY (`ccode`);

--
-- Indexes for table `caveat`
--
ALTER TABLE `caveat`
  ADD PRIMARY KEY (`cavno`);

--
-- Indexes for table `courtfees`
--
ALTER TABLE `courtfees`
  ADD PRIMARY KEY (`casetype`,`category`,`scategory`,`fees`);

--
-- Indexes for table `efile`
--
ALTER TABLE `efile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `efile`
--
ALTER TABLE `efile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

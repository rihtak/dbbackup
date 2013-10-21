/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : gym

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-10-21 21:37:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_ic_no` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `blood_group` int(2) DEFAULT NULL COMMENT 'const A1_Negative =1;//(A1 -ve)     const A1_Positive =2;//(A1 +ve)     const A1B_Negative =3;//(A1B -ve)     const A1B_Positive =4;//(A1B +ve)     const A2_Negative =5;//(A2 -ve)     const A2_Positive =6;//(A2 +ve)     const A2B_Negative =7;//(A2B -ve)     const A2B_Positive =8;//(A2B +ve)     const B_Negative =9;//(B -ve)     const B_Positive =10;//(B +ve)     const B1_Positive =11;//(B1 +ve)     const O_Negative=12;// (O -ve)     const O_Positive=13;// (O +ve)',
  `date_of_birth` date DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', '1234abc', 'kathir', 's', 'skathiresan01@gmial.com', '1', '1', '1989-05-26', 'adf', 'sadf', 'sdaf', 'ad', 'a3f', '2013-10-17 10:52:50', '2013-10-18 20:49:04');
INSERT INTO `customers` VALUES ('2', 'sadfk', 'kkk', 'kkk', 'kk', '1', '2', '0000-00-00', 'k', 'k', 'k', 'k', 'k', '2013-10-18 17:00:52', '2013-10-18 17:00:52');
INSERT INTO `customers` VALUES ('3', '34', 'dsfak', 'skdf', 'kdfk', '1', '3', '0000-00-00', '', '', '', '', '', '2013-10-18 17:01:14', '2013-10-18 17:01:14');
INSERT INTO `customers` VALUES ('4', 'dsfa', 'sdaf', 'sadf', 'sadf', '1', '3', '0000-00-00', '', '', '', '', '', '2013-10-18 17:01:30', '2013-10-18 18:32:45');
INSERT INTO `customers` VALUES ('5', 'sdaf', 'fsa', 'safd', 'sdfa', '2', '3', '1989-05-09', '', '', '', '', '', '2013-10-18 17:01:53', '2013-10-18 17:01:53');
INSERT INTO `customers` VALUES ('6', 'dfsa', 'fdsa', 'd', 's', null, null, '0000-00-00', '', '', '', '', '', '2013-10-18 17:02:21', '2013-10-18 17:02:21');
INSERT INTO `customers` VALUES ('7', '1234', 'kathiresan', 's', 'skathiresan01@gmail.com', '1', '13', '0000-00-00', '8 15 Angalaman kovil st', '', 'Trichy', 'India', '', '2013-10-18 19:26:28', '2013-10-18 19:26:28');
INSERT INTO `customers` VALUES ('8', '12345', 'kathiresan', 's', 'skathiresan02@gmail.com', '1', '1', '0000-00-00', '8 15 Angalaman kovil st', '', 'Trichy', 'India', '', '2013-10-18 19:31:34', '2013-10-18 19:31:34');

-- ----------------------------
-- Table structure for `customer_admissions`
-- ----------------------------
DROP TABLE IF EXISTS `customer_admissions`;
CREATE TABLE `customer_admissions` (
  `admisson_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `admisson_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`admisson_id`),
  KEY `customer_id` (`customer_id`),
  KEY `customer_id_2` (`customer_id`),
  KEY `package_id` (`package_id`),
  KEY `employe_id` (`employee_id`),
  CONSTRAINT `customer_admissions_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  CONSTRAINT `customer_admissions_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`),
  CONSTRAINT `customer_admissions_ibfk_3` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of customer_admissions
-- ----------------------------

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_ic_no` varchar(255) NOT NULL,
  `employee_type` int(2) NOT NULL COMMENT '1 fulltime 2 partime',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email_id` varchar(255) DEFAULT NULL,
  `gender` int(1) DEFAULT NULL,
  `blood_group` int(2) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for `employee_admissions`
-- ----------------------------
DROP TABLE IF EXISTS `employee_admissions`;
CREATE TABLE `employee_admissions` (
  `admission_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `date_of_reliving` date DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`admission_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `employee_admissions_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee_admissions
-- ----------------------------

-- ----------------------------
-- Table structure for `gym_venue_info`
-- ----------------------------
DROP TABLE IF EXISTS `gym_venue_info`;
CREATE TABLE `gym_venue_info` (
  `gym_id` int(11) NOT NULL AUTO_INCREMENT,
  `gym_name` varchar(255) DEFAULT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `address_1` varchar(255) DEFAULT NULL,
  `address_2` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`gym_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of gym_venue_info
-- ----------------------------
INSERT INTO `gym_venue_info` VALUES ('1', 'gym 1', 'branch 1', 'address 1', 'address 2', 'city', 'pincode', '9632587412', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `package`
-- ----------------------------
DROP TABLE IF EXISTS `package`;
CREATE TABLE `package` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) NOT NULL,
  `package_duration` int(11) DEFAULT NULL,
  `package_price` float(10,2) NOT NULL,
  `package_description` text,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of package
-- ----------------------------
INSERT INTO `package` VALUES ('1', 'pack', '2', '233.00', 'des', '2013-10-18 16:58:29', '2013-10-18 16:58:29');

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `commisson_unit` double NOT NULL,
  `commision_rate` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of settings
-- ----------------------------

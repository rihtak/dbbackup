/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : college_mgmt

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-10-21 21:35:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `attendence`
-- ----------------------------
DROP TABLE IF EXISTS `attendence`;
CREATE TABLE `attendence` (
  `attentdence_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL COMMENT 'Attendence Posted by',
  `date` date NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT 'true - Present false - Absent',
  PRIMARY KEY (`attentdence_id`),
  KEY `department_id` (`department_id`,`class_id`,`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of attendence
-- ----------------------------
INSERT INTO `attendence` VALUES ('1', '1', '3', '16', '2013-08-25', '1', '1');
INSERT INTO `attendence` VALUES ('2', '1', '3', '16', '2013-08-25', '2', '0');
INSERT INTO `attendence` VALUES ('3', '1', '3', '16', '2013-08-25', '3', '1');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` int(11) NOT NULL,
  `class_name` text NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `department_id` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '1', 'I Year');
INSERT INTO `class` VALUES ('2', '1', 'II Year');
INSERT INTO `class` VALUES ('3', '1', 'III Year');
INSERT INTO `class` VALUES ('4', '1', 'IV Year');
INSERT INTO `class` VALUES ('5', '2', 'I Year');
INSERT INTO `class` VALUES ('6', '2', 'II Year');
INSERT INTO `class` VALUES ('7', '2', 'III Year');
INSERT INTO `class` VALUES ('8', '2', 'IV Year');
INSERT INTO `class` VALUES ('9', '3', 'I year');
INSERT INTO `class` VALUES ('10', '3', 'II year');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_code` varchar(20) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_code` (`department_code`),
  UNIQUE KEY `department_name` (`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'CSE', 'Computer Science and Engineering');
INSERT INTO `department` VALUES ('3', 'MSE', 'msc[Software Engineering]');

-- ----------------------------
-- Table structure for `designation`
-- ----------------------------
DROP TABLE IF EXISTS `designation`;
CREATE TABLE `designation` (
  `designation_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation_name` text NOT NULL,
  PRIMARY KEY (`designation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of designation
-- ----------------------------
INSERT INTO `designation` VALUES ('1', 'HOD');
INSERT INTO `designation` VALUES ('2', 'Staff Advisor');
INSERT INTO `designation` VALUES ('3', 'Professor');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `designation_id` int(11) NOT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `user_id` (`user_id`,`designation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', '16', '3');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `photo` text NOT NULL,
  `parent_name` text NOT NULL,
  `school_details` text NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `user_id` (`user_id`),
  KEY `class_id` (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '17', '3', '', 'Selva murugan', '');
INSERT INTO `student` VALUES ('2', '18', '3', '', 'aaa', '');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NOT NULL COMMENT '1-Admin 2-Staff 3- Student',
  `department_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `name` text NOT NULL,
  `register_no` varchar(20) NOT NULL,
  `dob` date NOT NULL,
  `mobile` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `last_login` date NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `town_city_county` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  `gcm_reg_id` text NOT NULL,
  `imei_no` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `register_no` (`register_no`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('16', '2', '1', '2010', 'Vinoths', 'ST001', '0000-00-00', '', 'vinoth@gmail.com', 'av69', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `userinfo` VALUES ('17', '3', '1', '2010', 'Aishvarya', 'CS069', '0000-00-00', '', 'aishu@gmail.com', 'av', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `userinfo` VALUES ('18', '3', '1', '2010', 'Muthu lakshmi', 'CS001', '0000-00-00', '', 'muthulakshmi@gmail.com', 'mm', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `userinfo` VALUES ('21', '1', '0', '0', 'admin', '343', '0000-00-00', '', 'admin', '1', '0000-00-00', '', '', '', '', '', '', '');

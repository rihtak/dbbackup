/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : scheduler

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-10-21 21:38:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accepted_payrates`
-- ----------------------------
DROP TABLE IF EXISTS `accepted_payrates`;
CREATE TABLE `accepted_payrates` (
  `accepted_payrates_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `pay_raye_id` int(11) NOT NULL,
  PRIMARY KEY (`accepted_payrates_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accepted_payrates
-- ----------------------------
INSERT INTO `accepted_payrates` VALUES ('1', '7', '1');
INSERT INTO `accepted_payrates` VALUES ('2', '7', '4');
INSERT INTO `accepted_payrates` VALUES ('3', '7', '5');
INSERT INTO `accepted_payrates` VALUES ('4', '3', '1');
INSERT INTO `accepted_payrates` VALUES ('5', '3', '2');
INSERT INTO `accepted_payrates` VALUES ('6', '6', '1');
INSERT INTO `accepted_payrates` VALUES ('7', '6', '3');
INSERT INTO `accepted_payrates` VALUES ('8', '8', '1');
INSERT INTO `accepted_payrates` VALUES ('9', '8', '2');
INSERT INTO `accepted_payrates` VALUES ('10', '8', '10');

-- ----------------------------
-- Table structure for `area`
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area` text NOT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of area
-- ----------------------------
INSERT INTO `area` VALUES ('1', 'East London');
INSERT INTO `area` VALUES ('2', 'Enfield');
INSERT INTO `area` VALUES ('3', 'Ilford');
INSERT INTO `area` VALUES ('4', 'North London');
INSERT INTO `area` VALUES ('5', 'North West London');
INSERT INTO `area` VALUES ('6', 'Romford');
INSERT INTO `area` VALUES ('7', 'South East London');
INSERT INTO `area` VALUES ('8', 'South West London');
INSERT INTO `area` VALUES ('9', 'West London');

-- ----------------------------
-- Table structure for `assign_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `assign_jobs`;
CREATE TABLE `assign_jobs` (
  `assign_jobs_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assign_job_date` date NOT NULL,
  `job_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `team_number` int(11) NOT NULL,
  `assign_amount` bigint(20) NOT NULL,
  `completed_amount` int(11) NOT NULL,
  `reason` int(11) NOT NULL,
  `helped_a_team_member` int(11) NOT NULL,
  `pay_rate` int(11) NOT NULL,
  `delete_flag` int(11) NOT NULL,
  `update_timestamp` datetime NOT NULL,
  PRIMARY KEY (`assign_jobs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of assign_jobs
-- ----------------------------
INSERT INTO `assign_jobs` VALUES ('2', '2013-07-10', '1', '1', '0', '100', '0', '0', '0', '1', '0', '0000-00-00 00:00:00');
INSERT INTO `assign_jobs` VALUES ('3', '2013-07-10', '3', '3', '0', '300', '250', '16', '0', '1', '0', '0000-00-00 00:00:00');
INSERT INTO `assign_jobs` VALUES ('4', '2013-07-15', '1', '3', '0', '1000', '0', '0', '0', '1', '0', '0000-00-00 00:00:00');
INSERT INTO `assign_jobs` VALUES ('7', '2013-07-15', '6', '4', '0', '1000', '500', '5', '0', '5', '0', '0000-00-00 00:00:00');
INSERT INTO `assign_jobs` VALUES ('9', '1970-01-01', '7', '1', '0', '800', '750', '17', '0', '2', '0', '2013-07-18 18:17:11');
INSERT INTO `assign_jobs` VALUES ('10', '2013-07-18', '7', '4', '0', '600', '600', '0', '0', '1', '0', '2013-07-18 18:17:01');
INSERT INTO `assign_jobs` VALUES ('11', '2013-07-18', '7', '7', '0', '400', '200', '18', '0', '1', '0', '2013-07-18 18:21:31');
INSERT INTO `assign_jobs` VALUES ('12', '2013-07-16', '7', '1', '0', '250', '250', '0', '0', '4', '0', '2013-07-18 18:24:06');
INSERT INTO `assign_jobs` VALUES ('13', '2013-07-31', '8', '1', '1', '800', '650', '17', '0', '2', '0', '2013-07-31 15:08:25');
INSERT INTO `assign_jobs` VALUES ('14', '2013-07-31', '8', '2', '1', '700', '850', '26', '13', '2', '0', '2013-07-31 15:08:31');
INSERT INTO `assign_jobs` VALUES ('15', '2013-07-31', '8', '5', '2', '600', '590', '17', '0', '1', '0', '2013-07-31 15:09:16');
INSERT INTO `assign_jobs` VALUES ('16', '2013-07-31', '8', '7', '2', '500', '499', '23', '0', '1', '0', '2013-07-31 15:09:41');
INSERT INTO `assign_jobs` VALUES ('17', '2013-07-31', '6', '2', '0', '300', '299', '1', '0', '1', '0', '2013-07-31 15:11:24');
INSERT INTO `assign_jobs` VALUES ('18', '2013-07-31', '7', '2', '0', '250', '249', '1', '0', '1', '0', '2013-08-01 14:32:20');
INSERT INTO `assign_jobs` VALUES ('19', '2013-07-30', '8', '1', '0', '250', '249', '1', '0', '1', '0', '2013-07-31 15:19:10');
INSERT INTO `assign_jobs` VALUES ('20', '2013-07-31', '7', '7', '0', '6000', '5999', '1', '0', '1', '0', '2013-07-31 15:32:15');

-- ----------------------------
-- Table structure for `client`
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` text NOT NULL,
  `contact_person_name` text NOT NULL,
  `email` text NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` text NOT NULL,
  `postcode` text NOT NULL,
  `phone_number` text NOT NULL,
  `short_form_code` text NOT NULL,
  `delete_flag` int(11) NOT NULL COMMENT '0-existing 1 - deleted',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', 'Domino\'s Hackney', 'John', 'john@gmail.com', 'test', 'test', 'test', 'test', '07881299315', 'DHAC', '0', '2013-07-10 20:01:54');
INSERT INTO `client` VALUES ('2', 'Noodle express', 'Miller', 'miller@gmail.com', '', '', '', '', 'test8', 'test9', '1', '2013-07-10 21:06:47');
INSERT INTO `client` VALUES ('3', 'StamfordHill', 'Manager', 'xyz@hotmail.com', 'sample st', 'stamford hill', 'london', 'E176ds', '02055555555', 'SH', '0', '2013-07-10 20:49:01');
INSERT INTO `client` VALUES ('4', 'EXB', 'htgtfgujyhki', 'hdjhfgm@hotmail.com', 'fcfgjk', 'fedsaf', 'sdafsdf', 'E176ds', '020877554677', 'EX', '0', '2013-07-15 18:02:38');
INSERT INTO `client` VALUES ('5', 'Abc ltd', 'john', 'john@abcltd.co.uk', '1232 street road', '', 'city', 'N17 0HF', '02081234556', 'abc', '0', '2013-07-31 19:08:20');

-- ----------------------------
-- Table structure for `designation`
-- ----------------------------
DROP TABLE IF EXISTS `designation`;
CREATE TABLE `designation` (
  `designation_id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` text NOT NULL,
  PRIMARY KEY (`designation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of designation
-- ----------------------------
INSERT INTO `designation` VALUES ('1', 'Trial');
INSERT INTO `designation` VALUES ('2', 'Distributor');
INSERT INTO `designation` VALUES ('3', 'Team Lead');
INSERT INTO `designation` VALUES ('4', 'Supervisor');
INSERT INTO `designation` VALUES ('5', 'Team Lead + Supervisor');

-- ----------------------------
-- Table structure for `designation_history`
-- ----------------------------
DROP TABLE IF EXISTS `designation_history`;
CREATE TABLE `designation_history` (
  `designation_history_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_id` bigint(20) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `designation_date` date NOT NULL,
  PRIMARY KEY (`designation_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of designation_history
-- ----------------------------
INSERT INTO `designation_history` VALUES ('1', '2', '1', '2013-07-10');
INSERT INTO `designation_history` VALUES ('2', '2', '3', '2013-07-10');
INSERT INTO `designation_history` VALUES ('3', '3', '1', '2013-07-10');
INSERT INTO `designation_history` VALUES ('4', '1', '1', '2013-07-22');
INSERT INTO `designation_history` VALUES ('5', '2', '1', '2013-07-22');
INSERT INTO `designation_history` VALUES ('6', '6', '1', '2013-07-22');
INSERT INTO `designation_history` VALUES ('7', '7', '1', '2013-07-22');
INSERT INTO `designation_history` VALUES ('8', '5', '1', '2013-07-22');
INSERT INTO `designation_history` VALUES ('9', '4', '1', '2013-07-22');
INSERT INTO `designation_history` VALUES ('10', '1', '2', '2013-07-31');

-- ----------------------------
-- Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` text NOT NULL,
  PRIMARY KEY (`document_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of document
-- ----------------------------
INSERT INTO `document` VALUES ('1', 'Passport');
INSERT INTO `document` VALUES ('2', 'ID card');
INSERT INTO `document` VALUES ('3', 'NI Card');
INSERT INTO `document` VALUES ('4', 'Visa');

-- ----------------------------
-- Table structure for `employees`
-- ----------------------------
DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL,
  `joining_date` date NOT NULL,
  `unique_ref` text NOT NULL,
  `fname` text NOT NULL,
  `surname` text NOT NULL,
  `gender` text NOT NULL,
  `dob` date NOT NULL,
  `ethnicity` text NOT NULL,
  `email` text NOT NULL,
  `mobile` bigint(11) NOT NULL,
  `phone` text NOT NULL,
  `address` text NOT NULL,
  `address2` text NOT NULL,
  `address3` text NOT NULL,
  `address4` text NOT NULL,
  `additional_address_details` text NOT NULL,
  `town` text NOT NULL,
  `country` text NOT NULL,
  `postcode` text NOT NULL,
  `photofilename` text NOT NULL,
  `ecname` text NOT NULL,
  `ecrelation` text NOT NULL,
  `ecaddress` text NOT NULL,
  `ecpostcode` text NOT NULL,
  `ecphone` text NOT NULL,
  `ec2name` text NOT NULL,
  `ec2relation` text NOT NULL,
  `ec2address` text NOT NULL,
  `ec2postcode` text NOT NULL,
  `ec2phone` text NOT NULL,
  `designation_id` int(11) NOT NULL,
  `archive_flag` int(11) NOT NULL COMMENT '0-> Unarchived 1->Acrhived',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO `employees` VALUES ('1', '6626', '2012-06-06', 'dece376b23ad9ba099bee7456c5f8a72', 'MILLIONS', 'CHALA', 'Male', '1995-01-20', 'Asian or Asian British - Other', 'abysinia007@gmail.com', '7539782435', '', '14 Block O', '', '', '', '', 'Southwark', 'United Kingdom', 'SE1 8DT', '', 'Mrs.A. Yado', 'Mother', '14 Bloc ODuchy street/', 'SE1 8DT', '07946824709', '', '', '/', '', '', '4', '0', '2013-10-02 20:39:38');
INSERT INTO `employees` VALUES ('2', '6625', '2012-06-06', '0afad35abee8c222acd27f7786248f52', 'MONIKA', 'KOSARKOVA', 'Female', '1985-01-25', 'White - Other', 'm.kosarkova@seznam.cz', '7826046632', '', '83 Pembroke Road, Walthamstow', '', '', '', '', 'London', 'Czech Republic', 'E17 9BB', '1373394811.jpg', 'Vladimir Stefanisk', 'friend', '55 Melville RdWalthamstow/London', 'E17 ', '07429433485', '', '', '/', '', '', '2', '1', '2013-10-02 20:47:01');
INSERT INTO `employees` VALUES ('3', '6624', '2012-06-06', 'fd577f08deea83b72d7c55fb2a8afffe', 'RACHAEL', 'ODUALA', 'Female', '1995-06-06', 'Mixed - Other', 'rachael_oduala@hotmail.co.uk', '7792454827', '', '37 dunnock road', '', '', '', '', 'beckton', 'Austria', 'e6 5sx', '1373362012.jpg', 'BELLA ODUALA', 'MOTHER', '37 DUNNOCK ROAD/', 'E6 5SX', '07828059010', '', '', '/', '', '', '2', '0', '2013-10-02 20:36:16');
INSERT INTO `employees` VALUES ('4', '6632', '2012-06-06', '4033fa008d4619c84621b8eae9095f46', 'CHRISTELLE MALONDA', 'BAZA', 'Female', '1988-06-02', 'Black or Black British - Afric', 'odette312001@yahoo.co.uk', '7448601273', '', '67 welbeck road', '', '', '', '', 'eastham', 'Congo', 'e6 3et', '1373877450.jpg', 'dedi nseki', 'husband', '67 welbeck roadlondon/', 'e6 3et', '07424302260', '', '', '/', '', '', '5', '1', '2013-10-02 20:47:17');
INSERT INTO `employees` VALUES ('5', '6631', '2012-06-06', 'e1abad216ee8eac356d6adc18b72dd8e', 'BLANDINE', 'BIZEAU', 'Female', '1988-01-18', 'White - Other', 'blandine.bizeau@laposte.net', '7000000000', '+33648948008', '1 Angel Lane', '', '', '', '', 'London', 'France, Metropolitan', 'E15 1BL', '', 'Tanser', 'friend', 'abingdon/', 'OX14', '07427387644', '', '', '/', '', '', '3', '0', '2013-10-02 20:36:59');
INSERT INTO `employees` VALUES ('6', '6627', '2012-06-06', '6717b7c7ea621cd8ac2ba5780fc361fc', 'NIGEL ', 'BELFON', 'Male', '1989-09-10', 'Black or Black British - Carib', 'n.belfon@live.co.uk', '7427078225', '', '97 marden square Drummond road ', '', '', '', '', 'London', 'United Kingdom', 'se162ja', '1373475791.jpg', 'gwen', 'mum', '6 eugene cotter house/', 'se171qs', '02077010700', '', '', '/', '', '', '4', '1', '2013-10-02 20:42:43');
INSERT INTO `employees` VALUES ('7', '6622', '2012-06-06', 'f72edffb402cd1485d0219924827fa42', 'MARIO', 'GANCEARUC', 'Male', '1992-01-01', 'White - English', 'gancearucmario@yahoo.ro', '7599319308', '', '334 cooperfield, chigwell', '', '', '', '', 'london', 'Romania', 'IG7 5JR', '', 'roxanne', 'knowledge', 'cooperfield, chigwell/', 'IG7 5JR', '447588402019', '', '', '/', '', '', '3', '1', '2013-10-02 20:38:08');
INSERT INTO `employees` VALUES ('8', '0', '2012-06-06', '', 'Lalith', 'Kaushik', 'Male', '0000-00-00', 'White - English', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '2013-10-02 19:56:40');
INSERT INTO `employees` VALUES ('9', '0', '2012-06-06', '', 'Lalith', 'Kaushik', 'Male', '0000-00-00', 'White - English', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '2013-10-02 19:56:30');
INSERT INTO `employees` VALUES ('10', '0', '2012-06-06', '', 'fgfh', 'fxghxgfh', 'Female', '2009-10-20', 'White - Irish', 'fgh@gmail.com', '0', '', 'g', 'rtdf', 'gdxfg', 'dfg', '', '', 'xdfg', '620123', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '2013-10-02 19:56:25');

-- ----------------------------
-- Table structure for `employees_working_days`
-- ----------------------------
DROP TABLE IF EXISTS `employees_working_days`;
CREATE TABLE `employees_working_days` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employees_id` bigint(20) NOT NULL,
  `days` int(11) NOT NULL COMMENT '1=sun,2=mon,3=Tues,4=wed,5=Thur,6=Fri,7=Sat',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employees_working_days
-- ----------------------------
INSERT INTO `employees_working_days` VALUES ('1', '9', '7');
INSERT INTO `employees_working_days` VALUES ('2', '23', '1');
INSERT INTO `employees_working_days` VALUES ('3', '23', '3');
INSERT INTO `employees_working_days` VALUES ('4', '23', '4');
INSERT INTO `employees_working_days` VALUES ('5', '23', '7');

-- ----------------------------
-- Table structure for `jobs`
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) NOT NULL,
  `expected_finish_date` date NOT NULL,
  `postcode_id` int(11) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `assigned_amount` bigint(20) NOT NULL,
  `finished_amount` bigint(20) NOT NULL,
  `job_creation_date` date NOT NULL,
  `job_completed_date` date NOT NULL,
  `map_provided_flag` int(11) NOT NULL,
  `job_completed_flag` int(11) NOT NULL COMMENT '0-incompleted; 1-completed',
  `delete_flag` int(11) NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES ('1', '1', '2013-07-13', '1', '10000', '1350', '0', '2013-07-10', '0000-00-00', '0', '0', '1');
INSERT INTO `jobs` VALUES ('2', '3', '2013-08-31', '15', '10000', '0', '0', '2013-07-10', '0000-00-00', '0', '0', '1');
INSERT INTO `jobs` VALUES ('3', '3', '2013-07-31', '21', '5000', '1800', '250', '2013-07-10', '0000-00-00', '0', '0', '0');
INSERT INTO `jobs` VALUES ('6', '4', '2013-07-15', '78', '400000', '2050', '799', '2013-07-15', '0000-00-00', '0', '0', '0');
INSERT INTO `jobs` VALUES ('7', '4', '2013-07-31', '17', '10000', '6800', '8048', '2013-07-18', '0000-00-00', '0', '0', '0');
INSERT INTO `jobs` VALUES ('8', '5', '2013-10-31', '0', '3000', '2850', '2838', '2013-07-31', '0000-00-00', '1', '0', '0');

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `access_level` int(11) NOT NULL COMMENT '1 - Admin | 2 Client | 3 Accountant',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'Admin', 'admin', '1', '1');

-- ----------------------------
-- Table structure for `pay_rate`
-- ----------------------------
DROP TABLE IF EXISTS `pay_rate`;
CREATE TABLE `pay_rate` (
  `pay_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_rate` text NOT NULL,
  PRIMARY KEY (`pay_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of pay_rate
-- ----------------------------
INSERT INTO `pay_rate` VALUES ('2', 'A+');
INSERT INTO `pay_rate` VALUES ('3', 'B');
INSERT INTO `pay_rate` VALUES ('4', 'B+');
INSERT INTO `pay_rate` VALUES ('5', 'C');
INSERT INTO `pay_rate` VALUES ('6', 'C+');
INSERT INTO `pay_rate` VALUES ('7', 'D');
INSERT INTO `pay_rate` VALUES ('8', 'D+');
INSERT INTO `pay_rate` VALUES ('9', 'E');
INSERT INTO `pay_rate` VALUES ('10', 'BB');
INSERT INTO `pay_rate` VALUES ('11', 'test');

-- ----------------------------
-- Table structure for `postcode`
-- ----------------------------
DROP TABLE IF EXISTS `postcode`;
CREATE TABLE `postcode` (
  `postcode_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) NOT NULL,
  `postcode` text NOT NULL,
  PRIMARY KEY (`postcode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of postcode
-- ----------------------------
INSERT INTO `postcode` VALUES ('1', '1', 'E1');
INSERT INTO `postcode` VALUES ('2', '1', 'E2');
INSERT INTO `postcode` VALUES ('3', '1', 'E3');
INSERT INTO `postcode` VALUES ('4', '1', 'E4');
INSERT INTO `postcode` VALUES ('5', '1', 'E5');
INSERT INTO `postcode` VALUES ('6', '1', 'E6');
INSERT INTO `postcode` VALUES ('7', '1', 'E7');
INSERT INTO `postcode` VALUES ('8', '1', 'E8');
INSERT INTO `postcode` VALUES ('9', '1', 'E9');
INSERT INTO `postcode` VALUES ('10', '1', 'E10');
INSERT INTO `postcode` VALUES ('11', '1', 'E11');
INSERT INTO `postcode` VALUES ('12', '1', 'E12');
INSERT INTO `postcode` VALUES ('13', '1', 'E13');
INSERT INTO `postcode` VALUES ('14', '1', 'E14');
INSERT INTO `postcode` VALUES ('15', '1', 'E15');
INSERT INTO `postcode` VALUES ('16', '1', 'E16');
INSERT INTO `postcode` VALUES ('17', '1', 'E17');
INSERT INTO `postcode` VALUES ('18', '1', 'E18');
INSERT INTO `postcode` VALUES ('19', '2', 'EN1');
INSERT INTO `postcode` VALUES ('20', '2', 'EN2');
INSERT INTO `postcode` VALUES ('21', '2', 'EN3');
INSERT INTO `postcode` VALUES ('22', '2', 'EN4');
INSERT INTO `postcode` VALUES ('23', '2', 'EN5');
INSERT INTO `postcode` VALUES ('24', '2', 'EN6');
INSERT INTO `postcode` VALUES ('25', '2', 'EN7');
INSERT INTO `postcode` VALUES ('26', '2', 'EN8');
INSERT INTO `postcode` VALUES ('27', '2', 'EN9');
INSERT INTO `postcode` VALUES ('28', '2', 'EN10');
INSERT INTO `postcode` VALUES ('29', '2', 'EN11');
INSERT INTO `postcode` VALUES ('30', '3', 'IG1');
INSERT INTO `postcode` VALUES ('31', '3', 'IG2');
INSERT INTO `postcode` VALUES ('32', '3', 'IG3');
INSERT INTO `postcode` VALUES ('33', '3', 'IG4');
INSERT INTO `postcode` VALUES ('34', '3', 'IG5');
INSERT INTO `postcode` VALUES ('35', '3', 'IG6');
INSERT INTO `postcode` VALUES ('36', '3', 'IG7');
INSERT INTO `postcode` VALUES ('37', '3', 'IG8');
INSERT INTO `postcode` VALUES ('38', '3', 'IG9');
INSERT INTO `postcode` VALUES ('39', '3', 'IG10');
INSERT INTO `postcode` VALUES ('40', '3', 'IG11');
INSERT INTO `postcode` VALUES ('41', '4', 'N1');
INSERT INTO `postcode` VALUES ('42', '4', 'N2');
INSERT INTO `postcode` VALUES ('43', '4', 'N3');
INSERT INTO `postcode` VALUES ('44', '4', 'N4');
INSERT INTO `postcode` VALUES ('45', '4', 'N5');
INSERT INTO `postcode` VALUES ('46', '4', 'N6');
INSERT INTO `postcode` VALUES ('47', '4', 'N7');
INSERT INTO `postcode` VALUES ('48', '4', 'N8');
INSERT INTO `postcode` VALUES ('49', '4', 'N9');
INSERT INTO `postcode` VALUES ('50', '4', 'N10');
INSERT INTO `postcode` VALUES ('51', '4', 'N11');
INSERT INTO `postcode` VALUES ('52', '4', 'N12');
INSERT INTO `postcode` VALUES ('53', '4', 'N13');
INSERT INTO `postcode` VALUES ('54', '4', 'N14');
INSERT INTO `postcode` VALUES ('55', '4', 'N15');
INSERT INTO `postcode` VALUES ('56', '4', 'N16');
INSERT INTO `postcode` VALUES ('57', '4', 'N17');
INSERT INTO `postcode` VALUES ('58', '4', 'N18');
INSERT INTO `postcode` VALUES ('59', '4', 'N19');
INSERT INTO `postcode` VALUES ('60', '4', 'N20');
INSERT INTO `postcode` VALUES ('61', '4', 'N21');
INSERT INTO `postcode` VALUES ('62', '4', 'N22');
INSERT INTO `postcode` VALUES ('63', '5', 'NW1');
INSERT INTO `postcode` VALUES ('64', '5', 'NW2');
INSERT INTO `postcode` VALUES ('65', '5', 'NW3');
INSERT INTO `postcode` VALUES ('66', '5', 'NW4');
INSERT INTO `postcode` VALUES ('67', '5', 'NW5');
INSERT INTO `postcode` VALUES ('68', '5', 'NW6');
INSERT INTO `postcode` VALUES ('69', '5', 'NW7');
INSERT INTO `postcode` VALUES ('70', '5', 'NW8');
INSERT INTO `postcode` VALUES ('71', '5', 'NW9');
INSERT INTO `postcode` VALUES ('72', '5', 'NW10');
INSERT INTO `postcode` VALUES ('73', '5', 'NW11');
INSERT INTO `postcode` VALUES ('74', '6', 'RM1');
INSERT INTO `postcode` VALUES ('75', '6', 'RM2');
INSERT INTO `postcode` VALUES ('76', '6', 'RM3');
INSERT INTO `postcode` VALUES ('77', '6', 'RM4');
INSERT INTO `postcode` VALUES ('78', '6', 'RM5');
INSERT INTO `postcode` VALUES ('79', '6', 'RM6');
INSERT INTO `postcode` VALUES ('80', '6', 'RM7');
INSERT INTO `postcode` VALUES ('81', '6', 'RM8');
INSERT INTO `postcode` VALUES ('82', '6', 'RM9');
INSERT INTO `postcode` VALUES ('83', '6', 'RM10');
INSERT INTO `postcode` VALUES ('84', '6', 'RM11');
INSERT INTO `postcode` VALUES ('85', '6', 'RM12');
INSERT INTO `postcode` VALUES ('86', '6', 'RM13');
INSERT INTO `postcode` VALUES ('87', '7', 'SE1');
INSERT INTO `postcode` VALUES ('88', '7', 'SE2');
INSERT INTO `postcode` VALUES ('89', '7', 'SE3');
INSERT INTO `postcode` VALUES ('90', '7', 'SE4');
INSERT INTO `postcode` VALUES ('91', '7', 'SE5');
INSERT INTO `postcode` VALUES ('92', '7', 'SE6');
INSERT INTO `postcode` VALUES ('93', '7', 'SE7');
INSERT INTO `postcode` VALUES ('94', '7', 'SE8');
INSERT INTO `postcode` VALUES ('95', '7', 'SE9');
INSERT INTO `postcode` VALUES ('96', '7', 'SE10');
INSERT INTO `postcode` VALUES ('97', '7', 'SE11');
INSERT INTO `postcode` VALUES ('98', '7', 'SE12');
INSERT INTO `postcode` VALUES ('99', '7', 'SE13');
INSERT INTO `postcode` VALUES ('100', '7', 'SE14');
INSERT INTO `postcode` VALUES ('101', '7', 'SE15');
INSERT INTO `postcode` VALUES ('102', '7', 'SE16');
INSERT INTO `postcode` VALUES ('103', '7', 'SE17');
INSERT INTO `postcode` VALUES ('104', '7', 'SE18');
INSERT INTO `postcode` VALUES ('105', '7', 'SE19');
INSERT INTO `postcode` VALUES ('106', '7', 'SE20');
INSERT INTO `postcode` VALUES ('107', '7', 'SE21');
INSERT INTO `postcode` VALUES ('108', '7', 'SE22');
INSERT INTO `postcode` VALUES ('109', '7', 'SE23');
INSERT INTO `postcode` VALUES ('110', '7', 'SE24');
INSERT INTO `postcode` VALUES ('111', '7', 'SE25');
INSERT INTO `postcode` VALUES ('112', '7', 'SE26');
INSERT INTO `postcode` VALUES ('113', '7', 'SE27');
INSERT INTO `postcode` VALUES ('114', '7', 'SE28');
INSERT INTO `postcode` VALUES ('115', '8', 'SW1');
INSERT INTO `postcode` VALUES ('116', '8', 'SW2');
INSERT INTO `postcode` VALUES ('117', '8', 'SW3');
INSERT INTO `postcode` VALUES ('118', '8', 'SW4');
INSERT INTO `postcode` VALUES ('119', '8', 'SW5');
INSERT INTO `postcode` VALUES ('120', '8', 'SW6');
INSERT INTO `postcode` VALUES ('121', '8', 'SW7');
INSERT INTO `postcode` VALUES ('122', '8', 'SW8');
INSERT INTO `postcode` VALUES ('123', '8', 'SW9');
INSERT INTO `postcode` VALUES ('124', '8', 'SW10');
INSERT INTO `postcode` VALUES ('125', '8', 'SW11');
INSERT INTO `postcode` VALUES ('126', '8', 'SW12');
INSERT INTO `postcode` VALUES ('127', '8', 'SW13');
INSERT INTO `postcode` VALUES ('128', '8', 'SW14');
INSERT INTO `postcode` VALUES ('129', '8', 'SW15');
INSERT INTO `postcode` VALUES ('130', '8', 'SW16');
INSERT INTO `postcode` VALUES ('131', '8', 'SW17');
INSERT INTO `postcode` VALUES ('132', '8', 'SW18');
INSERT INTO `postcode` VALUES ('133', '8', 'SW19');
INSERT INTO `postcode` VALUES ('134', '8', 'SW20');
INSERT INTO `postcode` VALUES ('135', '9', 'W1');
INSERT INTO `postcode` VALUES ('136', '9', 'W2');
INSERT INTO `postcode` VALUES ('137', '9', 'W3');
INSERT INTO `postcode` VALUES ('138', '9', 'W4');
INSERT INTO `postcode` VALUES ('139', '9', 'W5');
INSERT INTO `postcode` VALUES ('140', '9', 'W6');
INSERT INTO `postcode` VALUES ('141', '9', 'W7');
INSERT INTO `postcode` VALUES ('142', '9', 'W8');
INSERT INTO `postcode` VALUES ('143', '9', 'W9');
INSERT INTO `postcode` VALUES ('144', '9', 'W10');
INSERT INTO `postcode` VALUES ('145', '9', 'W11');
INSERT INTO `postcode` VALUES ('146', '9', 'W12');
INSERT INTO `postcode` VALUES ('147', '9', 'W13');
INSERT INTO `postcode` VALUES ('148', '9', 'W14');

-- ----------------------------
-- Table structure for `reason_for_not_completion`
-- ----------------------------
DROP TABLE IF EXISTS `reason_for_not_completion`;
CREATE TABLE `reason_for_not_completion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reason_for_not_completion
-- ----------------------------
INSERT INTO `reason_for_not_completion` VALUES ('1', 'Unexplained absence');
INSERT INTO `reason_for_not_completion` VALUES ('2', 'Contractual Day OFF');
INSERT INTO `reason_for_not_completion` VALUES ('3', 'Requested Holiday');
INSERT INTO `reason_for_not_completion` VALUES ('4', 'Confirmed Day Off');
INSERT INTO `reason_for_not_completion` VALUES ('5', 'Contract was not renewed');
INSERT INTO `reason_for_not_completion` VALUES ('6', 'Contract must be renewed');
INSERT INTO `reason_for_not_completion` VALUES ('7', 'Trial has quit');
INSERT INTO `reason_for_not_completion` VALUES ('8', 'Trial dismissed by TMD (no contract)');
INSERT INTO `reason_for_not_completion` VALUES ('9', 'Employee dismissed (on contract)');
INSERT INTO `reason_for_not_completion` VALUES ('10', 'Contract Ended (by Notice To Leave, or end of 6 weeks)');
INSERT INTO `reason_for_not_completion` VALUES ('11', 'Abandone Contract');
INSERT INTO `reason_for_not_completion` VALUES ('12', 'Employee (on contract) has had to leave immediately');
INSERT INTO `reason_for_not_completion` VALUES ('13', 'Trial caught cheating');
INSERT INTO `reason_for_not_completion` VALUES ('14', 'Employee no longer working');
INSERT INTO `reason_for_not_completion` VALUES ('15', 'Suspicious or Unclear');
INSERT INTO `reason_for_not_completion` VALUES ('16', 'Sent Home');
INSERT INTO `reason_for_not_completion` VALUES ('17', 'Sickness or Injured');
INSERT INTO `reason_for_not_completion` VALUES ('18', 'Suspended');
INSERT INTO `reason_for_not_completion` VALUES ('19', 'Office only');
INSERT INTO `reason_for_not_completion` VALUES ('20', 'Contracted day');
INSERT INTO `reason_for_not_completion` VALUES ('21', 'Property count has been done');
INSERT INTO `reason_for_not_completion` VALUES ('22', 'Unauthorised leave');
INSERT INTO `reason_for_not_completion` VALUES ('23', 'Trial');
INSERT INTO `reason_for_not_completion` VALUES ('24', 'Back checking');
INSERT INTO `reason_for_not_completion` VALUES ('25', 'signed contract');
INSERT INTO `reason_for_not_completion` VALUES ('26', 'Helped a team member');
INSERT INTO `reason_for_not_completion` VALUES ('27', 'Additional leaflets given');

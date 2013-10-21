/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : orchard

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-10-21 21:37:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `accounts`
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `holder_name` text NOT NULL,
  `bank` text NOT NULL,
  `acc_num` text NOT NULL,
  `branch` text NOT NULL,
  `ifsc_code` text NOT NULL,
  `type_flag` int(11) NOT NULL COMMENT '1-cash account,2-Security account',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO `accounts` VALUES ('5', 'Masszab Ltd', 'HSBC', '01763458', 'Bethnal Green', '400118', '0');
INSERT INTO `accounts` VALUES ('7', 'Cash', 'Cash', 'Cash', 'Cash', 'Cash', '1');
INSERT INTO `accounts` VALUES ('8', 'Security Deposit', 'Security Deposit', 'Security Deposit', 'Security Deposit', 'Security Deposit', '2');

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  `mobile` text NOT NULL,
  `telephone` text NOT NULL,
  `fax` text NOT NULL,
  `email` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '300-310 High Road', 'Ilford', 'Essex.', 'IG11QW', 'London', '020 8478 0606 ', '020 8478 0606 ', '-', 'info@orchardhallonline.co.uk');

-- ----------------------------
-- Table structure for `deposit`
-- ----------------------------
DROP TABLE IF EXISTS `deposit`;
CREATE TABLE `deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` text NOT NULL,
  `amount` double NOT NULL,
  `type` int(11) NOT NULL COMMENT '1-cash,2-bank',
  `description` text NOT NULL,
  `flag` int(11) NOT NULL COMMENT '1-refund,2-security deposit',
  `with_held` float NOT NULL,
  `with_held_account` int(11) NOT NULL,
  `mail_send_flag` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `which_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of deposit
-- ----------------------------
INSERT INTO `deposit` VALUES ('1', '1', '200', '0', '', '2', '0', '0', '0', '2012-08-10 05:36:16', '0');
INSERT INTO `deposit` VALUES ('2', '1', '300', '0', '', '2', '0', '0', '0', '2012-08-10 05:37:01', '0');
INSERT INTO `deposit` VALUES ('3', '1', '500', '0', '', '1', '0', '0', '0', '2012-08-10 05:08:17', '0');
INSERT INTO `deposit` VALUES ('4', '10', '100', '1', '', '2', '0', '0', '0', '2012-08-13 11:42:27', '0');
INSERT INTO `deposit` VALUES ('5', '10', '100', '0', '', '1', '0', '0', '0', '2012-08-13 11:08:02', '0');
INSERT INTO `deposit` VALUES ('6', '27', '1000', '1', '', '2', '0', '0', '0', '2012-08-21 05:32:41', '0');
INSERT INTO `deposit` VALUES ('7', '27', '1000', '0', '', '1', '0', '7', '0', '2012-08-21 05:08:45', '0');
INSERT INTO `deposit` VALUES ('8', '24', '100', '1', '', '2', '0', '0', '0', '2012-08-22 05:29:33', '0');
INSERT INTO `deposit` VALUES ('9', '24', '100', '0', '', '1', '0', '0', '0', '2012-08-22 05:08:54', '0');

-- ----------------------------
-- Table structure for `events`
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO `events` VALUES ('1', 'Wedding', 'Wedding');
INSERT INTO `events` VALUES ('2', 'Birthday Party', 'Birthday Party');
INSERT INTO `events` VALUES ('3', 'Engagement Party', 'Engagement Party');
INSERT INTO `events` VALUES ('4', 'Mehendi Party', 'Mehendi Party');
INSERT INTO `events` VALUES ('7', 'Dinner And Dance', 'Dinner And Dance');
INSERT INTO `events` VALUES ('9', 'Outdoor Catering', 'Outdoor Catering');
INSERT INTO `events` VALUES ('10', 'Dry Hall Hire', 'Dry Hall Hire');
INSERT INTO `events` VALUES ('11', 'Variety Show', 'Variety Show');
INSERT INTO `events` VALUES ('12', 'Pre Wedding Party', 'Pre Wedding Party');
INSERT INTO `events` VALUES ('13', 'Restaurant Catering', 'Restaurant Catering');
INSERT INTO `events` VALUES ('14', 'External Event', 'External Event');

-- ----------------------------
-- Table structure for `expense_category`
-- ----------------------------
DROP TABLE IF EXISTS `expense_category`;
CREATE TABLE `expense_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` text NOT NULL,
  `type` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expense_category
-- ----------------------------
INSERT INTO `expense_category` VALUES ('1', 'Air conditioner maintance', '2');
INSERT INTO `expense_category` VALUES ('2', 'building insurance', '2');
INSERT INTO `expense_category` VALUES ('3', 'building work and day to day maintanance', '2');
INSERT INTO `expense_category` VALUES ('4', 'Carpet cleaning', '2');
INSERT INTO `expense_category` VALUES ('5', 'cash & carry', '2');
INSERT INTO `expense_category` VALUES ('6', 'Cleaners', '2');
INSERT INTO `expense_category` VALUES ('7', 'content insurance', '2');
INSERT INTO `expense_category` VALUES ('8', 'Daily labour', '2');
INSERT INTO `expense_category` VALUES ('9', 'decoration(stage, dance floor, lighting etc)', '2');
INSERT INTO `expense_category` VALUES ('10', 'electricity bills', '2');
INSERT INTO `expense_category` VALUES ('11', 'Electronics item (Fridge, light bulbs etc)', '2');
INSERT INTO `expense_category` VALUES ('12', 'Fire alarm maintance', '2');
INSERT INTO `expense_category` VALUES ('13', 'Fixed Assets', '2');
INSERT INTO `expense_category` VALUES ('14', 'Flowers', '2');
INSERT INTO `expense_category` VALUES ('15', 'Food', '2');
INSERT INTO `expense_category` VALUES ('16', 'Fuel', '2');
INSERT INTO `expense_category` VALUES ('17', 'Gardening', '2');
INSERT INTO `expense_category` VALUES ('18', 'gas bills', '2');
INSERT INTO `expense_category` VALUES ('19', 'gas certificate', '2');
INSERT INTO `expense_category` VALUES ('20', 'Glassware and cutlery', '2');
INSERT INTO `expense_category` VALUES ('21', 'grocery', '2');
INSERT INTO `expense_category` VALUES ('22', 'Invoice-Related', '1');
INSERT INTO `expense_category` VALUES ('23', 'Laundry', '2');
INSERT INTO `expense_category` VALUES ('24', 'Licencing (Premises, music)', '2');
INSERT INTO `expense_category` VALUES ('25', 'Others', '2');
INSERT INTO `expense_category` VALUES ('26', 'outside catering', '2');
INSERT INTO `expense_category` VALUES ('27', 'outsourceing items (car hire, mehedi artist, DJ, Magician, singer etc)', '2');
INSERT INTO `expense_category` VALUES ('28', 'pest control', '2');
INSERT INTO `expense_category` VALUES ('29', 'Petrol', '2');
INSERT INTO `expense_category` VALUES ('30', 'postage', '2');
INSERT INTO `expense_category` VALUES ('31', 'Purchasing decor (chair cover, vases, lighting, table cloths)', '2');
INSERT INTO `expense_category` VALUES ('32', 'rates', '2');
INSERT INTO `expense_category` VALUES ('33', 'Rent', '2');
INSERT INTO `expense_category` VALUES ('34', 'Rubbish disposal', '2');
INSERT INTO `expense_category` VALUES ('35', 'Stationary', '2');
INSERT INTO `expense_category` VALUES ('36', 'Temporary Kitchen Staff', '2');
INSERT INTO `expense_category` VALUES ('37', 'Travel', '2');
INSERT INTO `expense_category` VALUES ('38', 'van hire', '2');
INSERT INTO `expense_category` VALUES ('39', 'wages', '2');
INSERT INTO `expense_category` VALUES ('40', 'waiters/waitress', '2');
INSERT INTO `expense_category` VALUES ('41', 'washing and polishing', '2');
INSERT INTO `expense_category` VALUES ('42', 'water bills', '2');
INSERT INTO `expense_category` VALUES ('43', 'TV Advertising', '');

-- ----------------------------
-- Table structure for `expense_details`
-- ----------------------------
DROP TABLE IF EXISTS `expense_details`;
CREATE TABLE `expense_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `expense_category` text NOT NULL,
  `others_category` text NOT NULL,
  `invoice_id` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `mode` text NOT NULL COMMENT 'cash, cheque, draft etc',
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `mode_details` text NOT NULL COMMENT 'cheque no, draft no etc',
  `supplier_id` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expense_details
-- ----------------------------
INSERT INTO `expense_details` VALUES ('1', 'Fire alarm maintance', '', '0', 'Dave Mckeown - Fire Alarm Maintenace', '', '500', '2012-08-14', '', '');
INSERT INTO `expense_details` VALUES ('2', 'Rent', '', '0', 'Rent for Passage To India', '', '5500', '2012-08-14', '', '');
INSERT INTO `expense_details` VALUES ('3', 'Others', 'TV Adverising', '0', 'Chanel 9 - 1 Month fees', '', '500', '2012-08-14', '', '');
INSERT INTO `expense_details` VALUES ('4', 'Invoice-Related', '', '6', 'Nanak Suits - Catering Food', '', '750', '2012-08-14', '', '');
INSERT INTO `expense_details` VALUES ('5', 'Others', 'Overheads', '0', 'Adjstment - Overheads', '', '3700', '2012-08-14', '', '');
INSERT INTO `expense_details` VALUES ('6', 'Others', 'Overheads', '0', '', '', '530', '2012-08-14', '', '');
INSERT INTO `expense_details` VALUES ('7', 'Others', 'IT Equipment', '0', 'Wireless Extender', '', '70', '2012-08-14', '', '');
INSERT INTO `expense_details` VALUES ('8', 'Others', 'Tools', '0', 'B & Q', '', '53.46', '2012-08-14', '', '');
INSERT INTO `expense_details` VALUES ('9', 'Others', 'Marketing', '0', 'TV Advert', '', '500', '2012-08-17', '', '9');
INSERT INTO `expense_details` VALUES ('10', 'Invoice-Related', '', '1', 'Chiocolate Fountain', '', '250', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('11', 'Invoice-Related', '', '1', 'waiters', '', '530', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('12', 'Invoice-Related', '', '1', '', '', '1300', '2012-08-22', '', '10');
INSERT INTO `expense_details` VALUES ('13', 'Invoice-Related', '', '3', 'Food', '', '1300', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('14', 'Invoice-Related', '', '3', 'Food', '', '1300', '2012-08-22', '', '10');
INSERT INTO `expense_details` VALUES ('15', 'Others', 'channel 9', '0', 'advertisemnet channel 9', '', '500', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('16', 'building work and day to day maintanance', '', '0', 'drapping jessi', '', '500', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('17', 'building work and day to day maintanance', '', '0', 'intercom', '', '400', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('18', 'Daily labour', '', '0', 'anton', '', '400', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('19', 'Invoice-Related', '', '1', 'kitchen staff', '', '400', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('20', 'Invoice-Related', '', '3', 'kitchen staff', '', '400', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('21', 'Invoice-Related', '', '1', 'event manager', '', '100', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('22', 'Daily labour', '', '0', 'jahed', '', '300', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('23', 'building work and day to day maintanance', '', '0', '', '', '11.48', '2012-08-21', '', '1');
INSERT INTO `expense_details` VALUES ('24', 'building work and day to day maintanance', '', '0', '', '', '82.96', '2012-08-21', '', '1');
INSERT INTO `expense_details` VALUES ('25', 'building work and day to day maintanance', '', '0', '', '', '9.46', '2012-08-21', '', '1');
INSERT INTO `expense_details` VALUES ('26', 'building work and day to day maintanance', '', '0', 'michael', '', '80', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('27', 'building work and day to day maintanance', '', '0', 'painting office', '', '50', '2012-08-21', '', '');
INSERT INTO `expense_details` VALUES ('28', 'building work and day to day maintanance', '', '0', '', '', '9.66', '2012-08-20', '', '1');
INSERT INTO `expense_details` VALUES ('29', 'Electronics item (Fridge, light bulbs etc)', '', '0', 'tv ', '', '274.96', '2012-08-20', '', '11');
INSERT INTO `expense_details` VALUES ('30', 'decoration(stage, dance floor, lighting etc)', '', '0', 'black ribbon from ahmed', '', '324', '2012-08-18', '', '');
INSERT INTO `expense_details` VALUES ('31', 'decoration(stage, dance floor, lighting etc)', '', '0', 'tarquise ribbon from ahmed', '', '150', '2012-08-18', '', '');
INSERT INTO `expense_details` VALUES ('32', 'Invoice-Related', '', '3', '', '', '167', '2012-08-18', '', '12');
INSERT INTO `expense_details` VALUES ('33', 'building work and day to day maintanance', '', '0', 'raj ', '', '9.99', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('34', 'building work and day to day maintanance', '', '0', 'raj ', '', '7.99', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('35', 'Invoice-Related', '', '1', 'car park attendant', '', '60', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('36', 'Invoice-Related', '', '1', 'security guard', '', '30', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('37', 'Invoice-Related', '', '3', 'millennium cash & carry', '', '280.18', '2012-08-18', '', '');
INSERT INTO `expense_details` VALUES ('38', 'building work and day to day maintanance', '', '0', 'raj', '', '24.46', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('39', 'Invoice-Related', '', '1', 'millennium cash & carry', '', '322.04', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('40', 'building work and day to day maintanance', '', '0', '', '', '53.46', '2012-08-11', '', '1');
INSERT INTO `expense_details` VALUES ('41', 'Invoice-Related', '', '1', 'gb food', '', '29.74', '2012-08-16', '', '');
INSERT INTO `expense_details` VALUES ('42', 'building work and day to day maintanance', '', '0', 'raj builder labour', '', '100', '2012-08-15', '', '');
INSERT INTO `expense_details` VALUES ('43', 'building work and day to day maintanance', '', '0', 'building work', '', '40.06', '2012-08-15', '', '');
INSERT INTO `expense_details` VALUES ('44', 'cash & carry', '', '0', 'many foods', '', '79.88', '2012-08-02', '', '');
INSERT INTO `expense_details` VALUES ('45', 'decoration(stage, dance floor, lighting etc)', '', '0', 'table runners', '', '29.9', '2012-08-13', '', '');
INSERT INTO `expense_details` VALUES ('46', 'decoration(stage, dance floor, lighting etc)', '', '0', 'chair shashe', '', '143.98', '2012-08-13', '', '');
INSERT INTO `expense_details` VALUES ('47', 'Others', 'advert', '0', 'advert prince', '', '1000', '2012-08-21', '', '');
INSERT INTO `expense_details` VALUES ('48', 'Cleaners', '', '0', 'kitchen cleaning', '', '290', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('49', 'decoration(stage, dance floor, lighting etc)', '', '0', 'chair ribbon', '', '324', '2012-08-18', '', '13');
INSERT INTO `expense_details` VALUES ('50', 'Food', '', '0', 'lidl', '', '46.5', '2012-07-07', '', '');
INSERT INTO `expense_details` VALUES ('51', 'cash & carry', '', '0', 'asda', '', '14.91', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('52', 'decoration(stage, dance floor, lighting etc)', '', '0', 'chair ribbon pink', '', '50', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('53', 'Invoice-Related', '', '7', 'tandoori chef', '', '200', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('54', 'Fuel', '', '0', 'van patrol', '', '40', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('55', 'Invoice-Related', '', '9', 'security', '', '70', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('56', 'Invoice-Related', '', '7', 'party quiz', '', '19', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('57', 'Daily labour', '', '0', 'anton', '', '200', '2012-08-18', '', '');
INSERT INTO `expense_details` VALUES ('58', 'Daily labour', '', '0', 'azaz', '', '200', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('59', 'Others', 'advert', '0', 'prince', '', '200', '2012-08-25', '', '14');
INSERT INTO `expense_details` VALUES ('60', 'building work and day to day maintanance', '', '0', 'jessi drapping', '', '470', '2012-08-24', '', '');
INSERT INTO `expense_details` VALUES ('61', 'Invoice-Related', '', '7', 'noori', '', '469', '2012-08-24', '', '');
INSERT INTO `expense_details` VALUES ('62', 'cash & carry', '', '0', '', '', '1700', '2012-08-24', '', '3');
INSERT INTO `expense_details` VALUES ('63', 'Invoice-Related', '', '6', '', '', '487.9', '2012-08-26', '', '15');
INSERT INTO `expense_details` VALUES ('64', 'Invoice-Related', '', '6', 'waiter', '', '605', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('65', 'Invoice-Related', '', '7', '', '', '250', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('66', 'decoration(stage, dance floor, lighting etc)', '', '0', 'purple bow 320', '', '160', '2012-08-25', '', '13');
INSERT INTO `expense_details` VALUES ('67', 'Invoice-Related', '', '9', 'stage', '', '275', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('68', 'Invoice-Related', '', '6', '', '', '300', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('69', 'Daily labour', '', '0', 'jahed 3 days', '', '160', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('70', 'Invoice-Related', '', '8', 'cleaning kitchen shankar and vishal 2 nite Â£30 each per nite', '', '120', '2012-08-27', '', '');
INSERT INTO `expense_details` VALUES ('71', 'Daily labour', '', '0', 'anton', '', '200', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('72', 'Invoice-Related', '', '6', 'patel', '', '40', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('73', 'Invoice-Related', '', '8', 'azaz', '', '30', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('74', 'Invoice-Related', '', '6', 'modi', '', '40', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('75', 'Invoice-Related', '', '6', 'patel', '', '40', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('76', 'Invoice-Related', '', '7', 'modi', '', '40', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('77', 'Invoice-Related', '', '6', 'rice', '', '111.96', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('78', 'cash & carry', '', '0', 'scouring sponge', '', '1.98', '2012-08-21', '', '');
INSERT INTO `expense_details` VALUES ('79', 'Invoice-Related', '', '4', '', '', '2.67', '2012-08-22', '', '16');
INSERT INTO `expense_details` VALUES ('80', 'Invoice-Related', '', '7', '', '', '151.91', '2012-08-23', '', '');
INSERT INTO `expense_details` VALUES ('81', 'Invoice-Related', '', '4', 'variety food', '', '19.46', '2012-08-23', '', '');
INSERT INTO `expense_details` VALUES ('82', 'Invoice-Related', '', '6', 'farmfood', '', '2.25', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('83', 'Invoice-Related', '', '6', '', '', '1.69', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('84', 'Invoice-Related', '', '6', 'hussain event manager', '', '100', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('85', 'Invoice-Related', '', '7', 'hussain event manager', '', '100', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('86', 'Invoice-Related', '', '3', 'hussain event manager', '', '100', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('87', 'Invoice-Related', '', '7', '', '', '1.59', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('88', 'Invoice-Related', '', '6', 'gb food', '', '149', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('89', 'Invoice-Related', '', '9', 'pound shop', '', '2', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('90', 'Invoice-Related', '', '1', 'paneer ', '', '166', '2012-08-16', '', '');
INSERT INTO `expense_details` VALUES ('91', 'Invoice-Related', '', '1', 'farm food ice cream', '', '10', '2012-08-16', '', '');
INSERT INTO `expense_details` VALUES ('92', 'Invoice-Related', '', '4', 'stage', '', '300', '2012-08-23', '', '');
INSERT INTO `expense_details` VALUES ('93', 'cash & carry', '', '0', '', '', '1.99', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('94', 'Invoice-Related', '', '1', 'ice cube', '', '20.69', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('95', 'Invoice-Related', '', '3', '', '', '4.76', '2012-08-18', '', '19');
INSERT INTO `expense_details` VALUES ('96', 'Invoice-Related', '', '1', 'ice cube', '', '5.96', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('97', 'cash & carry', '', '0', '', '', '3.98', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('98', 'cash & carry', '', '0', '', '', '5.96', '2012-08-27', '', '');
INSERT INTO `expense_details` VALUES ('99', 'cash & carry', '', '0', '', '', '7.96', '2012-08-20', '', '');
INSERT INTO `expense_details` VALUES ('100', 'cash & carry', '', '0', 'air freshner', '', '2.97', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('101', 'Daily labour', '', '0', 'raj simmi', '', '100', '2012-08-27', '', '');
INSERT INTO `expense_details` VALUES ('102', 'cash & carry', '', '0', '', '', '1.59', '2012-08-16', '', '');
INSERT INTO `expense_details` VALUES ('103', 'Invoice-Related', '', '6', 'totaram chef', '', '100', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('104', 'Invoice-Related', '', '6', 'goldi tandoori chef', '', '100', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('105', 'cash & carry', '', '0', '', '', '0.99', '2012-08-19', '', '');
INSERT INTO `expense_details` VALUES ('106', 'Invoice-Related', '', '9', '', '', '57', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('107', 'Laundry', '', '0', '', '', '500', '2012-08-24', '', '20');
INSERT INTO `expense_details` VALUES ('108', 'Invoice-Related', '', '6', 'jiglu', '', '25', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('109', 'Invoice-Related', '', '6', 'azim', '', '25', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('110', 'Invoice-Related', '', '6', 'patel', '', '30', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('111', 'Invoice-Related', '', '6', 'patel kitchen staff', '', '30', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('112', 'cash & carry', '', '0', '', '', '7.96', '2012-08-24', '', '');
INSERT INTO `expense_details` VALUES ('113', 'cash & carry', '', '0', '', '', '19.17', '2012-08-22', '', '');
INSERT INTO `expense_details` VALUES ('114', 'cash & carry', '', '0', '', '', '1.59', '2012-08-19', '', '');
INSERT INTO `expense_details` VALUES ('115', 'cash & carry', '', '0', '', '', '1.99', '2012-08-28', '', '');
INSERT INTO `expense_details` VALUES ('116', 'Invoice-Related', '', '6', 'event flower', '', '322', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('117', 'Invoice-Related', '', '7', '', '', '1.2', '2012-08-25', '', '18');
INSERT INTO `expense_details` VALUES ('118', 'Invoice-Related', '', '6', '', '', '71.94', '2012-08-25', '', '18');
INSERT INTO `expense_details` VALUES ('119', 'Invoice-Related', '', '7', '', '', '43.06', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('120', 'Invoice-Related', '', '8', '', '', '48', '2012-08-26', '', '20');
INSERT INTO `expense_details` VALUES ('121', 'Invoice-Related', '', '9', 'back drop', '', '130', '2012-08-24', '', '');
INSERT INTO `expense_details` VALUES ('122', 'Invoice-Related', '', '1', 'sri rathiga car park', '', '80', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('123', 'Invoice-Related', '', '6', 'sri rathiga car park', '', '80', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('124', 'Invoice-Related', '', '7', '', '', '255.2', '2012-08-24', '', '16');
INSERT INTO `expense_details` VALUES ('125', 'Invoice-Related', '', '10', 'car hire', '', '300', '2012-08-27', '', '');
INSERT INTO `expense_details` VALUES ('126', 'building work and day to day maintanance', '', '0', 'raj manager shutter masszab', '', '120', '2012-08-24', '', '');
INSERT INTO `expense_details` VALUES ('127', 'Invoice-Related', '', '7', 'waiter', '', '240', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('128', 'Invoice-Related', '', '1', 'dance floor', '', '400', '2012-08-17', '', '');
INSERT INTO `expense_details` VALUES ('129', 'cash & carry', '', '0', 'mizan petty cash', '', '150', '2012-08-25', '', '');
INSERT INTO `expense_details` VALUES ('130', 'Invoice-Related', '', '2', 'daud for portable burner', '', '150', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('131', 'cash & carry', '', '0', '', '', '2.07', '2012-07-07', '', '');
INSERT INTO `expense_details` VALUES ('132', 'Invoice-Related', '', '1', '', '', '23.27', '2012-08-17', '', '12');
INSERT INTO `expense_details` VALUES ('133', 'grocery', '', '0', '', '', '12.98', '2012-08-07', '', '');
INSERT INTO `expense_details` VALUES ('134', 'Daily labour', '', '0', 'anton', '', '100', '2012-08-28', '', '');
INSERT INTO `expense_details` VALUES ('135', 'Cleaners', '', '0', 'skip hire', '', '240', '2012-08-29', '', '');
INSERT INTO `expense_details` VALUES ('136', 'building work and day to day maintanance', '', '0', 'carpet', '', '180', '2012-08-23', '', '');
INSERT INTO `expense_details` VALUES ('137', 'Invoice-Related', '', '10', '', '', '1030', '2012-08-31', '', '3');
INSERT INTO `expense_details` VALUES ('138', 'Invoice-Related', '', '10', '', '', '149.12', '2012-08-31', '', '12');
INSERT INTO `expense_details` VALUES ('139', 'Invoice-Related', '', '2', 'continental ice cream', '', '193.25', '2012-08-31', '', '');
INSERT INTO `expense_details` VALUES ('140', 'Invoice-Related', '', '10', 'continental ice cream', '', '409.4', '2012-09-01', '', '');
INSERT INTO `expense_details` VALUES ('141', 'Air conditioner maintance', '', '0', 'advert', '', '300', '2012-08-31', '', '9');
INSERT INTO `expense_details` VALUES ('142', 'building work and day to day maintanance', '', '0', 'mchael', '', '543.96', '2012-08-31', '', '');
INSERT INTO `expense_details` VALUES ('143', 'Invoice-Related', '', '10', 'riental food', '', '360', '2012-08-31', '', '');
INSERT INTO `expense_details` VALUES ('144', 'Laundry', '', '0', 'white town', '', '291.64', '2012-08-31', '', '');
INSERT INTO `expense_details` VALUES ('145', 'cash & carry', '', '0', 'sainsbury', '', '3.34', '2012-08-29', '', '');
INSERT INTO `expense_details` VALUES ('146', 'Invoice-Related', '', '6', 'nita', '', '180', '2012-08-26', '', '');
INSERT INTO `expense_details` VALUES ('147', 'Invoice-Related', '', '7', 'nita', '', '200', '2012-08-31', '', '');
INSERT INTO `expense_details` VALUES ('148', 'Electronics item (Fridge, light bulbs etc)', '', '0', 'jahed', '', '60', '2012-08-31', '', '11');
INSERT INTO `expense_details` VALUES ('149', 'Invoice-Related', '', '10', 'vegetables', '', '132', '2012-08-31', '', '');
INSERT INTO `expense_details` VALUES ('150', 'Carpet cleaning', '', '0', 'ef', '', '500', '2012-09-10', '', '3');
INSERT INTO `expense_details` VALUES ('151', 'Invoice-Related', '', '8', 'vbc', '', '500', '2012-09-10', '', '2');
INSERT INTO `expense_details` VALUES ('152', 'building insurance', '', '0', 'fdbfb', '', '200', '2012-09-10', '', '2');

-- ----------------------------
-- Table structure for `invoice`
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` text NOT NULL,
  `quotation_id` text NOT NULL,
  `account_id` text NOT NULL,
  `total_cost` text NOT NULL,
  `cancel_flag` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `which_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of invoice
-- ----------------------------
INSERT INTO `invoice` VALUES ('1', 'c4ca4238a0b923820dcc509a6f75849b', '1', '5', '6250', '0', '2012-08-10 05:32:49', '3');
INSERT INTO `invoice` VALUES ('2', 'c81e728d9d4c2f636f067f89cc14862c', '2', '5', '5500', '0', '2012-08-10 05:55:24', '3');
INSERT INTO `invoice` VALUES ('3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '3', '5', '5500', '0', '2012-08-10 10:33:47', '3');
INSERT INTO `invoice` VALUES ('4', 'a87ff679a2f3e71d9181a67b7542122c', '4', '5', '1200', '0', '2012-08-10 10:49:51', '3');
INSERT INTO `invoice` VALUES ('5', 'e4da3b7fbbce2345d7772b0674a318d5', '5', '5', '1000', '0', '2012-08-10 10:54:11', '3');
INSERT INTO `invoice` VALUES ('6', '1679091c5a880faf6fb5e6087eb1b2dc', '6', '5', '6120', '0', '2012-08-10 11:03:31', '3');
INSERT INTO `invoice` VALUES ('7', '8f14e45fceea167a5a36dedd4bea2543', '7', '5', '3600', '0', '2012-08-10 11:10:16', '3');
INSERT INTO `invoice` VALUES ('8', 'c9f0f895fb98ab9159f51fd0297e236d', '8', '5', '3000', '0', '2012-08-13 10:37:15', '3');
INSERT INTO `invoice` VALUES ('9', '45c48cce2e2d7fbdea1afc51c7c6ad26', '9', '5', '3400', '0', '2012-08-13 10:42:09', '3');
INSERT INTO `invoice` VALUES ('10', 'd3d9446802a44259755d38e6d163e820', '10', '5', '5525', '1', '2012-08-13 11:11:21', '3');
INSERT INTO `invoice` VALUES ('11', '6512bd43d9caa6e02c990b0a82652dca', '11', '5', '2000', '0', '2012-08-13 11:14:35', '3');
INSERT INTO `invoice` VALUES ('12', 'c20ad4d76fe97759aa27a0c99bff6710', '12', '5', '1900', '0', '2012-08-13 11:17:27', '3');
INSERT INTO `invoice` VALUES ('13', 'c51ce410c124a10e0db5e4b97fc2af39', '13', '5', '1350', '0', '2012-08-13 11:36:21', '3');
INSERT INTO `invoice` VALUES ('14', 'aab3238922bcc25a6f606eb525ffdc56', '14', '5', '1500', '0', '2012-08-13 11:38:28', '3');
INSERT INTO `invoice` VALUES ('15', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '15', '5', '2500', '0', '2012-08-13 11:40:30', '3');
INSERT INTO `invoice` VALUES ('16', 'c74d97b01eae257e44aa9d5bade97baf', '16', '5', '5380', '0', '2012-08-13 08:38:18', '3');
INSERT INTO `invoice` VALUES ('17', '70efdf2ec9b086079795c442636b55fb', '17', '5', '2800', '0', '2012-08-13 11:27:57', '3');
INSERT INTO `invoice` VALUES ('18', '6f4922f45568161a8cdf4ad2299f6d23', '18', '5', '8750', '0', '2012-08-14 01:54:15', '3');
INSERT INTO `invoice` VALUES ('19', '1f0e3dad99908345f7439f8ffabdffc4', '19', '5', '3290', '0', '2012-08-14 02:03:04', '3');
INSERT INTO `invoice` VALUES ('20', '98f13708210194c475687be6106a3b84', '20', '5', '2500', '0', '2012-08-14 02:06:47', '3');
INSERT INTO `invoice` VALUES ('21', '3c59dc048e8850243be8079a5c74d079', '21', '5', '2800', '0', '2012-08-14 02:15:17', '3');
INSERT INTO `invoice` VALUES ('22', 'b6d767d2f8ed5d21a44b0e5886680cb9', '22', '5', '6250', '0', '2012-08-14 02:48:06', '3');
INSERT INTO `invoice` VALUES ('23', '37693cfc748049e45d87b8c7d8b9aacd', '23', '5', '6250', '0', '2012-08-17 02:36:36', '3');
INSERT INTO `invoice` VALUES ('24', '1ff1de774005f8da13f42943881c655f', '28', '5', '1540', '1', '2012-08-17 03:06:28', '3');
INSERT INTO `invoice` VALUES ('25', '8e296a067a37563370ded05f5a3bf3ec', '27', '5', '1000', '0', '2012-08-21 12:59:40', '2');
INSERT INTO `invoice` VALUES ('26', '4e732ced3463d06de0ca9a15b6153677', '29', '5', '1000', '0', '2012-08-21 04:59:04', '2');
INSERT INTO `invoice` VALUES ('27', '02e74f10e0327ad868d138f2b4fdd6f0', '30', '5', '14000', '1', '2012-08-21 05:26:29', '2');
INSERT INTO `invoice` VALUES ('28', '33e75ff09dd601bbe69f351039152189', '31', '5', '1000', '0', '2012-08-23 04:15:11', '2');
INSERT INTO `invoice` VALUES ('29', '6ea9ab1baa0efb9e19094440c317e21b', '33', '5', '4387.5', '0', '2012-08-28 10:06:32', '3');

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL,
  `items` text NOT NULL,
  `description` text NOT NULL,
  `cost_price` float NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES ('77', '1', 'Orchard Hall', 'Orchard Hall', '0', '1');
INSERT INTO `items` VALUES ('78', '2', 'Food & Beverage', 'Food & Beverage', '0', '0');
INSERT INTO `items` VALUES ('79', '3', 'Interior Services', 'Interior Services', '0', '0');
INSERT INTO `items` VALUES ('80', '4', 'Specialty Services ', 'Specialty ', '0', '0');
INSERT INTO `items` VALUES ('81', '9', 'Event Staff', 'Event Staff', '0', '0');

-- ----------------------------
-- Table structure for `package`
-- ----------------------------
DROP TABLE IF EXISTS `package`;
CREATE TABLE `package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of package
-- ----------------------------
INSERT INTO `package` VALUES ('1', 'Venue', 'Venue');
INSERT INTO `package` VALUES ('2', 'Food & Beverage', 'Food & Beverage');
INSERT INTO `package` VALUES ('3', 'Interior Services', 'Interior Services');
INSERT INTO `package` VALUES ('4', 'Specialty Services & Entertainment', 'Specialty Services & Entertainment');
INSERT INTO `package` VALUES ('9', 'Event Staff', 'Event Staff');

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` text NOT NULL,
  `type` text NOT NULL COMMENT '1-cash,2-bank',
  `amount` text NOT NULL,
  `account` int(11) NOT NULL,
  `description` text NOT NULL,
  `reason_flag` int(11) NOT NULL COMMENT '1-inc- inv,2-inc-otheracc,3-exp-cat,4-exp-inv,5-not_in_used,6-exp- toothrer,7-refund from inv',
  `other_account` int(11) NOT NULL,
  `expense_category` int(11) NOT NULL,
  `mail_send_flag` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `which_user` int(11) NOT NULL,
  `supplier_id` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('1', '1', '', '2500.00', '7', 'Income from OH10001II | Jetlander | Birthday Party | 17.08.2012', '1', '0', '0', '0', '2012-08-10 16:05:21', '0', '');
INSERT INTO `payment` VALUES ('2', '2', '', '500.00', '7', 'Income from OH10002II | mashud | Wedding | 02.09.2012', '1', '0', '0', '0', '2012-08-10 16:25:33', '0', '');
INSERT INTO `payment` VALUES ('3', '3', '', '5500.00', '7', 'Income from OH10003II | ricky |  | 18.08.2012', '1', '0', '0', '0', '2012-08-10 21:04:36', '0', '');
INSERT INTO `payment` VALUES ('4', '4', '', '180.00', '7', 'Income from OH10004II | ansha | Mehendi Party | 23.08.2012', '1', '0', '0', '0', '2012-08-10 21:20:02', '0', '');
INSERT INTO `payment` VALUES ('5', '5', '', '200.00', '7', 'Income from OH10005II | ar signature | Mehendi Party | 24.08.2012', '1', '0', '0', '0', '2012-08-10 21:24:23', '0', '');
INSERT INTO `payment` VALUES ('6', '6', '', '2400.00', '7', 'Income from OH10006II | harry | Wedding | 25.08.2012', '1', '0', '0', '0', '2012-08-10 21:33:49', '0', '');
INSERT INTO `payment` VALUES ('7', '7', '', '500.00', '7', 'Income from OH10007II | mohammad saeed | Wedding | 25.08.2012', '1', '0', '0', '0', '2012-08-10 21:40:29', '0', '');
INSERT INTO `payment` VALUES ('8', '8', '', '500.00', '7', 'Income from OH10008II | Nadia | Wedding | 26.08.2012', '1', '0', '0', '0', '2012-08-13 21:07:26', '0', '');
INSERT INTO `payment` VALUES ('9', '9', '', '500.00', '7', 'Income from OH10009II | Kannan | Wedding | 25.08.2012', '1', '0', '0', '0', '2012-08-13 21:12:51', '0', '');
INSERT INTO `payment` VALUES ('10', '10', '', '500.00', '7', 'Income from OH10010II | mashud | Outdoor Catering | 02.09.2012', '1', '0', '0', '0', '2012-08-13 21:41:34', '0', '');
INSERT INTO `payment` VALUES ('11', '11', '', '500.00', '7', 'Income from OH10011II | Sameer | Mehendi Party | 15.08.2012', '1', '0', '0', '0', '2012-08-13 21:44:46', '0', '');
INSERT INTO `payment` VALUES ('12', '12', '', '300.00', '7', 'Income from OH10012II | zahir gogalia | Wedding | 16.09.2012', '1', '0', '0', '0', '2012-08-13 21:47:37', '0', '');
INSERT INTO `payment` VALUES ('13', '13', '', '300.00', '7', 'Income from OH10013II | hamzi |  | 16.02.2013', '1', '0', '0', '0', '2012-08-13 22:06:33', '0', '');
INSERT INTO `payment` VALUES ('14', '14', '', '200.00', '7', 'Income from OH10014II | DJ DEEP | Birthday Party | 02.12.2012', '1', '0', '0', '0', '2012-08-13 22:08:39', '0', '');
INSERT INTO `payment` VALUES ('15', '15', '', '500.00', '7', 'Income from OH10015II | Mr Solanki | Birthday Party | 27.10.2012', '1', '0', '0', '0', '2012-08-13 22:10:40', '0', '');
INSERT INTO `payment` VALUES ('16', '16', '', '500.00', '7', 'Income from OH10016II | naeymah | Wedding | 29.09.2012', '1', '0', '0', '0', '2012-08-13 19:08:40', '0', '');
INSERT INTO `payment` VALUES ('17', '17', '', '300.00', '7', 'Income from OH10017II | devender singh | Wedding | 29.10.2012', '1', '0', '0', '0', '2012-08-13 21:58:11', '0', '');
INSERT INTO `payment` VALUES ('18', '10', '', '-500.00', '7', 'Refund for OH10010II | mashud | Outdoor Catering | 02.09.2012', '7', '7', '0', '0', '2012-08-13 22:09:01', '0', '');
INSERT INTO `payment` VALUES ('19', '18', '', '500.00', '7', 'Income from OH10018II | alomgir | Wedding | 28.10.2012', '1', '0', '0', '0', '2012-08-14 12:24:28', '0', '');
INSERT INTO `payment` VALUES ('20', '19', '', '300', '8', 'Income from OH10019II | bhabin Patel | Engagement Party | 04.11.2012', '1', '0', '0', '0', '2012-10-09 18:40:00', '0', '');
INSERT INTO `payment` VALUES ('21', '20', '', '300.00', '5', 'Income from OH10020II | sabrina | Wedding | 06.10.2012', '1', '0', '0', '0', '0000-00-00 00:00:00', '0', '');
INSERT INTO `payment` VALUES ('22', '21', '', '300.00', '7', 'Income from OH10021II | marry | Wedding | 26.10.2013', '1', '0', '0', '0', '2012-08-14 12:45:27', '0', '');
INSERT INTO `payment` VALUES ('23', '22', '', '500.00', '7', 'Income from OH10022IP | jazz (son) | Pre Wedding Party | 22.03.2013', '1', '0', '0', '0', '2012-08-14 13:20:31', '0', '');
INSERT INTO `payment` VALUES ('24', '', '', '-2500', '7', '', '2', '5', '0', '0', '2012-08-14 21:20:12', '0', '');
INSERT INTO `payment` VALUES ('25', '', '', '2500', '5', '', '2', '7', '0', '0', '2012-08-14 21:20:12', '0', '');
INSERT INTO `payment` VALUES ('26', '', '', '-500', '7', 'Dave Mckeown - Fire Alarm Maintenace', '3', '7', '12', '0', '2012-08-14 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('27', '', '', '-2500', '5', '', '2', '7', '0', '0', '2012-08-14 21:22:12', '0', '');
INSERT INTO `payment` VALUES ('28', '', '', '2500', '7', '', '2', '5', '0', '0', '2012-08-14 21:22:12', '0', '');
INSERT INTO `payment` VALUES ('29', '', '', '-2500', '7', 'August rates', '2', '5', '0', '0', '2012-08-14 21:22:24', '0', '');
INSERT INTO `payment` VALUES ('30', '', '', '2500', '5', 'August rates', '2', '7', '0', '0', '2012-08-14 21:22:24', '0', '');
INSERT INTO `payment` VALUES ('32', '', '', '-500', '7', 'Chanel 9 - 1 Month fees', '3', '7', '25', '0', '2012-08-14 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('33', '6', '', '-750', '7', 'Nanak Suits - Catering Food', '4', '7', '0', '0', '2012-08-24 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('34', '', '', '-3700', '7', 'Adjstment - Overheads', '3', '7', '25', '0', '2012-08-14 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('36', '', '', '-70', '7', 'Wireless Extender', '3', '7', '25', '0', '2012-08-14 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('38', '23', '', '500.00', '7', 'Income from OH10023IP | jazz (daughter) | Pre Wedding Party | 17.08.2013', '1', '0', '0', '0', '2012-08-17 13:06:52', '0', '');
INSERT INTO `payment` VALUES ('39', '24', '', '1300.00', '7', 'Income from OH10028II | raj | Outdoor Catering | 24.08.2012', '1', '0', '0', '0', '2012-08-17 13:36:43', '0', '');
INSERT INTO `payment` VALUES ('40', '1', '', '2000.00', '7', 'Income from OH10001II | Jetlander | Birthday Party | 17.08.2012', '1', '0', '0', '0', '2012-08-17 13:03:38', '0', '');
INSERT INTO `payment` VALUES ('41', '', '', '-500', '7', 'TV Advert', '3', '7', '25', '0', '2012-08-17 10:30:00', '0', '9');
INSERT INTO `payment` VALUES ('42', '1', '', '-250', '7', 'Chocolate Fountain', '4', '7', '0', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('43', '25', '', '1000.00', '7', 'Income from OH10027II | shyrose | Variety Show | 19.08.2012', '1', '0', '0', '0', '2012-08-21 23:29:54', '0', '');
INSERT INTO `payment` VALUES ('44', '26', '', '500.00', '5', 'Income from OH10029II | Redbridge Asian Mandal | Dry Hall Hire | 23.11.2012', '1', '0', '0', '0', '2012-08-21 15:29:15', '0', '');
INSERT INTO `payment` VALUES ('45', '27', '', '2000.00', '7', 'Income from OH10030II | Maher Matin | Wedding | 24.08.2012', '1', '0', '0', '1', '2012-08-21 15:57:38', '0', '');
INSERT INTO `payment` VALUES ('46', '27', '', '4000.00', '7', 'Income from OH10030II | Maher Matin | Wedding | 24.08.2012', '1', '0', '0', '1', '2012-08-21 15:59:30', '0', '');
INSERT INTO `payment` VALUES ('47', '27', '', '0.00', '7', 'OH10030II | with held Security deposit', '2', '8', '0', '0', '2012-08-21 15:38:45', '0', '');
INSERT INTO `payment` VALUES ('48', '27', '', '-6000.00', '7', 'Refund for OH10030II | Maher Matin | Wedding | 24.08.2012', '7', '7', '0', '0', '2012-08-21 16:06:06', '0', '');
INSERT INTO `payment` VALUES ('49', '1', '', '1750.00', '7', 'Income from OH10001II | Jetlander | Birthday Party | 17.08.2012', '1', '0', '0', '0', '2012-08-21 16:12:53', '0', '');
INSERT INTO `payment` VALUES ('50', '1', '', '-530', '7', 'waiters', '4', '7', '0', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('51', '24', '', '240.00', '7', 'Income from OH10028II | raj | Outdoor Catering | 24.08.2012', '1', '0', '0', '0', '2012-08-22 13:31:12', '0', '');
INSERT INTO `payment` VALUES ('52', '7', '', '1000.00', '7', 'Income from OH10007II | Mohammad Saeed | Wedding | 25.08.2012', '1', '0', '0', '0', '2012-08-22 13:32:07', '0', '');
INSERT INTO `payment` VALUES ('53', '4', '', '1020.00', '7', 'Income from OH10004II | ansha | Mehendi Party | 23.08.2012', '1', '0', '0', '0', '2012-08-22 13:32:53', '0', '');
INSERT INTO `payment` VALUES ('54', '9', '', '500.00', '7', 'Income from OH10009II | Kannan | Wedding | 25.08.2012', '1', '0', '0', '0', '2012-08-22 13:34:13', '0', '');
INSERT INTO `payment` VALUES ('55', '6', '', '600.00', '7', 'Income from OH10006II | Harry | Wedding | 26.08.2012', '1', '0', '0', '0', '2012-08-22 13:40:20', '0', '');
INSERT INTO `payment` VALUES ('56', '1', '', '-1300', '7', 'Food', '4', '7', '0', '0', '2012-08-22 10:30:00', '0', '10');
INSERT INTO `payment` VALUES ('58', '3', '', '-1300', '7', 'Food', '4', '7', '0', '0', '2012-08-22 10:30:00', '0', '10');
INSERT INTO `payment` VALUES ('60', '', '', '-500', '7', 'drapping jessi', '3', '7', '3', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('61', '', '', '-400', '7', 'intercom', '3', '7', '3', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('62', '', '', '-600', '7', 'anton', '3', '7', '8', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('63', '1', '', '-550', '7', 'kitchen staff', '4', '7', '0', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('64', '3', '', '-550', '7', 'kitchen staff', '4', '7', '0', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('65', '1', '', '-100', '7', 'event manager', '4', '7', '0', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('66', '', '', '-300', '7', 'jahed', '3', '7', '8', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('67', '', '', '-11.48', '7', '', '3', '7', '3', '0', '2012-08-21 10:30:00', '0', '1');
INSERT INTO `payment` VALUES ('68', '', '', '-82.96', '7', '', '3', '7', '3', '0', '2012-08-21 10:30:00', '0', '1');
INSERT INTO `payment` VALUES ('69', '', '', '-9.46', '7', '', '3', '7', '3', '0', '2012-08-21 10:30:00', '0', '1');
INSERT INTO `payment` VALUES ('70', '', '', '-80', '7', 'michael', '3', '7', '3', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('71', '', '', '-50', '7', 'painting office', '3', '7', '3', '0', '2012-08-21 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('72', '', '', '-9.66', '7', '', '3', '7', '3', '0', '2012-08-20 10:30:00', '0', '1');
INSERT INTO `payment` VALUES ('73', '', '', '-274.96', '7', 'tv ', '3', '7', '11', '0', '2012-08-20 10:30:00', '0', '11');
INSERT INTO `payment` VALUES ('74', '', '', '-324', '7', 'black ribbon from ahmed', '3', '7', '9', '0', '2012-08-18 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('75', '', '', '-150', '7', 'tarquise ribbon from ahmed', '3', '7', '9', '0', '2012-08-18 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('76', '3', '', '-167.00', '7', '', '4', '7', '0', '0', '2012-08-18 10:30:00', '0', '12');
INSERT INTO `payment` VALUES ('77', '', '', '-9.99', '7', 'raj ', '3', '7', '3', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('78', '', '', '-7.99', '7', 'raj ', '3', '7', '3', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('79', '1', '', '-60', '7', 'car park attendant', '4', '7', '0', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('80', '1', '', '-30', '7', 'security guard', '4', '7', '0', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('81', '3', '', '-280.18', '7', 'millennium cash & carry', '4', '7', '0', '0', '2012-08-18 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('82', '', '', '-24.46', '7', 'raj', '3', '7', '3', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('83', '', '', '-322.04', '7', 'millennium cash & carry', '3', '7', '5', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('84', '', '', '-53.46', '7', '', '3', '7', '3', '0', '2012-08-11 10:30:00', '0', '1');
INSERT INTO `payment` VALUES ('85', '1', '', '-29.74', '7', 'gb food', '4', '7', '0', '0', '2012-08-16 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('86', '', '', '-100', '7', 'raj builder labour', '3', '7', '3', '0', '2012-08-15 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('87', '', '', '-40.06', '7', 'building work', '3', '7', '3', '0', '2012-08-15 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('88', '', '', '-79.88', '7', 'many foods', '3', '7', '5', '0', '2012-08-02 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('89', '', '', '-29.90', '7', 'table runners', '3', '7', '9', '0', '2012-08-13 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('90', '', '', '-143.98', '7', 'chair shashe', '3', '7', '9', '0', '2012-08-13 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('91', '', '', '-1000', '7', 'advert prince', '3', '7', '25', '0', '2012-08-21 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('92', '24', '', '-1540.00', '7', 'Refund for OH10028II | raj | Outdoor Catering | 24.08.2012', '7', '7', '0', '0', '2012-08-22 15:57:18', '0', '');
INSERT INTO `payment` VALUES ('93', '', '', '-290', '7', 'kitchen cleaning', '3', '7', '6', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('94', '', '', '-75', '7', 'black table runner', '3', '7', '9', '0', '2012-08-18 10:30:00', '0', '13');
INSERT INTO `payment` VALUES ('95', '', '', '-46.50', '7', 'lidl', '3', '7', '15', '0', '2012-07-07 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('96', '', '', '-14.91', '7', 'asda', '3', '7', '5', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('97', '7', '', '1000.00', '7', 'Income from OH10007II | Mohammad Saeed | Wedding | 25.08.2012', '1', '0', '0', '0', '2012-08-24 18:47:45', '0', '');
INSERT INTO `payment` VALUES ('98', '6', '', '1500.00', '7', 'Income from OH10006II | Harry | Wedding | 26.08.2012', '1', '0', '0', '0', '2012-08-24 18:48:12', '0', '');
INSERT INTO `payment` VALUES ('99', '9', '', '2400.00', '7', 'Income from OH10009II | Kannan | Wedding | 25.08.2012', '1', '0', '0', '0', '2012-08-25 20:12:32', '0', '');
INSERT INTO `payment` VALUES ('100', '7', '', '1100.00', '7', 'Income from OH10007II | Mohammad Saeed | Wedding | 25.08.2012', '1', '0', '0', '0', '2012-08-25 20:13:05', '0', '');
INSERT INTO `payment` VALUES ('101', '', '', '-50', '7', 'chair ribbon pink', '3', '7', '9', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('102', '7', '', '-200', '7', 'tandoori chef', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('103', '', '', '-40', '7', 'van patrol', '3', '7', '16', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('104', '9', '', '-70', '7', 'security', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('105', '7', '', '-19.00', '7', 'party quiz', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('106', '', '', '-200', '7', 'anton', '3', '7', '8', '0', '2012-08-18 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('107', '', '', '-100', '7', 'azaz', '3', '7', '8', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('108', '', '', '-200', '7', 'prince', '3', '7', '25', '0', '2012-08-25 10:30:00', '0', '14');
INSERT INTO `payment` VALUES ('109', '', '', '-470', '7', 'jessi drapping', '3', '7', '3', '0', '2012-08-24 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('110', '7', '', '-469.25', '7', 'noori', '4', '7', '0', '0', '2012-08-24 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('111', '', '', '-1700', '7', '', '3', '7', '5', '0', '2012-08-24 10:30:00', '0', '3');
INSERT INTO `payment` VALUES ('112', '6', '', '-487.90', '7', '', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '15');
INSERT INTO `payment` VALUES ('113', '6', '', '-605', '7', 'waiter', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('114', '7', '', '-250', '7', 'stage', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('115', '', '', '-160', '7', 'purple bow 320', '3', '7', '9', '0', '2012-08-25 10:30:00', '0', '13');
INSERT INTO `payment` VALUES ('116', '9', '', '-275', '7', 'stage', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('117', '6', '', '1220.00', '7', 'Income from OH10006II | Harry | Wedding | 26.08.2012', '1', '0', '0', '0', '2012-08-27 20:47:12', '0', '');
INSERT INTO `payment` VALUES ('118', '6', '', '-300', '7', 'dj', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('119', '', '', '-160', '7', 'jahed 3 days', '3', '7', '8', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('120', '8', '', '-120', '7', 'cleaning kitchen shankar and vishal 2 nite Â£30 each per nite', '4', '7', '0', '0', '2012-08-27 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('121', '', '', '-100', '7', 'anton', '3', '7', '8', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('123', '9', '', '-60', '7', 'azaz', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('124', '6', '', '-40', '7', 'modi', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('125', '9', '', '-40', '7', 'patel', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('126', '7', '', '-40', '7', 'modi', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('127', '6', '', '-111.96', '7', 'rice', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('128', '', '', '-1.98', '7', 'scouring sponge', '3', '7', '5', '0', '2012-08-21 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('129', '4', '', '-2.67', '7', '', '4', '7', '0', '0', '2012-08-22 10:30:00', '0', '16');
INSERT INTO `payment` VALUES ('130', '7', '', '-151.91', '7', 'many food', '4', '7', '0', '0', '2012-08-23 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('131', '4', '', '-19.46', '7', 'variety food', '4', '7', '0', '0', '2012-08-23 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('132', '6', '', '-2.25', '7', 'farmfood', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('133', '6', '', '-1.69', '7', '', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('134', '6', '', '-100', '7', 'hussain event manager', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('135', '7', '', '-100', '7', 'hussain event manager', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('137', '7', '', '-1.59', '7', '', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('138', '6', '', '-149.00', '7', 'gb food', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('139', '9', '', '-2', '7', 'pound shop', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('140', '1', '', '-166', '7', 'paneer ', '4', '7', '0', '0', '2012-08-16 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('141', '1', '', '-10', '7', 'farm food ice cream', '4', '7', '0', '0', '2012-08-16 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('142', '8', '', '2000.00', '7', 'Income from OH10008II | Nadia | Wedding | 26.08.2012', '1', '0', '0', '0', '2012-08-27 21:50:52', '0', '');
INSERT INTO `payment` VALUES ('143', '4', '', '-350', '7', 'stage', '4', '7', '0', '0', '2012-08-23 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('144', '', '', '-1.99', '7', '', '3', '7', '5', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('145', '1', '', '-20.69', '7', 'ice cube', '4', '7', '0', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('146', '3', '', '-4.76', '7', '', '4', '7', '0', '0', '2012-08-18 10:30:00', '0', '19');
INSERT INTO `payment` VALUES ('147', '1', '', '-5.96', '7', 'ice cube', '4', '7', '0', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('148', '', '', '-3.98', '7', '', '3', '7', '5', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('149', '', '', '-5.96', '7', '', '3', '7', '5', '0', '2012-08-27 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('150', '', '', '-7.96', '7', '', '3', '7', '5', '0', '2012-08-20 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('151', '', '', '-2.97', '7', 'air freshner', '3', '7', '5', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('152', '', '', '-100', '7', 'raj simmi', '3', '7', '8', '0', '2012-08-27 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('153', '', '', '-1.59', '7', '', '3', '7', '5', '0', '2012-08-16 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('154', '6', '', '-100', '7', 'totaram chef', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('155', '6', '', '-100', '7', 'goldi tandoori chef', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('156', '', '', '-.99', '7', '', '3', '7', '5', '0', '2012-08-19 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('157', '9', '', '-57', '7', 'party quiz', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('158', '', '', '-500', '7', '', '3', '7', '23', '0', '2012-08-24 10:30:00', '0', '20');
INSERT INTO `payment` VALUES ('159', '9', '', '-25', '7', 'jiglu kitchen staff', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('160', '6', '', '-25', '7', 'azim kitchen staff', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('161', '6', '', '-30', '7', 'patel', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('162', '6', '', '-30', '7', 'patel kitchen staff', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('163', '', '', '-7.96', '7', '', '3', '7', '5', '0', '2012-08-24 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('164', '', '', '-19.17', '7', '', '3', '7', '5', '0', '2012-08-22 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('165', '', '', '-1.59', '7', '', '3', '7', '5', '0', '2012-08-19 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('166', '', '', '-1.99', '7', '', '3', '7', '5', '0', '2012-08-28 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('167', '6', '', '-322', '7', 'event flower', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('168', '7', '', '-1.20', '7', '', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '18');
INSERT INTO `payment` VALUES ('169', '6', '', '-71.94', '7', '', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '18');
INSERT INTO `payment` VALUES ('170', '7', '', '-43.06', '7', 'tesco', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('171', '8', '', '-48', '7', '', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '20');
INSERT INTO `payment` VALUES ('172', '9', '', '-130', '7', 'back drop', '4', '7', '0', '0', '2012-08-24 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('173', '1', '', '-80', '7', 'sri rathiga car park', '4', '7', '0', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('174', '6', '', '-80', '7', 'sri rathiga car park', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('175', '7', '', '-255.20', '7', '', '4', '7', '0', '0', '2012-08-24 10:30:00', '0', '16');
INSERT INTO `payment` VALUES ('176', '10', '', '-300', '7', 'car hire', '4', '7', '0', '0', '2012-08-27 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('177', '', '', '-120', '7', 'raj manager shutter masszab', '3', '7', '3', '0', '2012-08-24 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('178', '7', '', '-240', '7', 'waiter', '4', '7', '0', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('179', '1', '', '-400', '7', 'dance floor', '4', '7', '0', '0', '2012-08-17 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('180', '', '', '-150', '7', 'mizan petty cash', '3', '7', '5', '0', '2012-08-25 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('181', '6', '', '400.00', '7', 'Income from OH10006II | Harry | Wedding | 26.08.2012', '1', '0', '0', '0', '2012-08-28 12:02:42', '0', '');
INSERT INTO `payment` VALUES ('182', '2', '', '-150', '7', 'daud for portable burner', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('183', '', '', '-2.07', '7', '', '3', '7', '5', '0', '2012-07-07 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('184', '1', '', '-23.27', '7', '', '4', '7', '0', '0', '2012-08-17 10:30:00', '0', '12');
INSERT INTO `payment` VALUES ('185', '', '', '-12.98', '7', '', '3', '7', '21', '0', '2012-08-07 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('186', '29', '', '500.00', '7', 'Income from OH10033IP | Sarah Naeem | Wedding | 07.02.2013', '1', '0', '0', '0', '2012-08-28 20:37:01', '0', '');
INSERT INTO `payment` VALUES ('187', '', '', '-100', '7', 'anton', '3', '7', '8', '0', '2012-08-28 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('188', '', '', '-240', '7', 'skip hire', '3', '7', '6', '0', '2012-08-29 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('189', '', '', '-180', '7', 'carpet', '3', '7', '3', '0', '2012-08-23 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('190', '12', '', '1000.00', '5', 'Income from OH10012II | zahir gogalia | Wedding | 16.09.2012', '1', '0', '0', '0', '2012-08-29 11:53:16', '0', '');
INSERT INTO `payment` VALUES ('191', '10', '', '-1028.26', '7', '', '4', '7', '0', '0', '2012-08-31 10:30:00', '0', '3');
INSERT INTO `payment` VALUES ('192', '10', '', '-149.12', '7', '', '4', '7', '0', '0', '2012-08-31 10:30:00', '0', '12');
INSERT INTO `payment` VALUES ('193', '2', '', '-193.25', '7', 'continental ice cream', '4', '7', '0', '0', '2012-08-31 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('194', '10', '', '-409.40', '7', 'continental ice cream', '4', '7', '0', '0', '2012-08-31 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('195', '', '', '-300', '7', 'advert', '3', '7', '1', '0', '2012-08-31 10:30:00', '0', '9');
INSERT INTO `payment` VALUES ('196', '', '', '-543.96', '7', 'mchael', '3', '7', '3', '0', '2012-08-31 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('197', '10', '', '-360', '7', 'riental food', '4', '7', '0', '0', '2012-08-31 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('198', '', '', '-291.64', '7', 'white town', '3', '7', '23', '0', '2012-08-31 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('199', '', '', '-3.34', '7', 'sainsbury', '3', '7', '5', '0', '2012-08-29 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('200', '6', '', '-180', '7', 'nita waiter', '4', '7', '0', '0', '2012-08-26 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('201', '7', '', '-200', '7', 'nita waiter', '4', '7', '0', '0', '2012-08-31 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('202', '', '', '-54.91', '7', 'jahed', '3', '7', '11', '0', '2012-08-31 10:30:00', '0', '11');
INSERT INTO `payment` VALUES ('203', '10', '', '-132', '7', 'vegetables', '4', '7', '0', '0', '2012-08-31 10:30:00', '0', '');
INSERT INTO `payment` VALUES ('204', '28', '', '1,000.00', '7', 'Income from OH10031II | Rahaban | Dry Hall Hire | 01.09.2012', '1', '0', '0', '0', '2012-09-05 17:36:00', '0', '');
INSERT INTO `payment` VALUES ('205', '2', '', '5000.00', '7', 'Income from OH10002II | mashud | Outdoor Catering | 02.09.2012', '1', '0', '0', '0', '2012-09-05 17:36:47', '0', '');
INSERT INTO `payment` VALUES ('206', '8', '', '500.00', '7', 'Income from OH10008II | Nadia | Wedding | 26.08.2012', '1', '0', '0', '0', '2012-09-05 17:37:30', '0', '');
INSERT INTO `payment` VALUES ('207', '11', '', '500.00', '7', 'Income from OH10011II | Sameer | Mehendi Party | 15.09.2012', '1', '0', '0', '0', '2012-09-07 17:57:38', '0', '');
INSERT INTO `payment` VALUES ('208', '', '', '-500', '7', 'ef', '3', '7', '4', '0', '2012-09-10 00:00:00', '0', '3');
INSERT INTO `payment` VALUES ('209', '8', '', '-500', '7', 'vbc', '4', '7', '0', '0', '2012-09-10 00:00:00', '0', '2');
INSERT INTO `payment` VALUES ('210', '', '', '-200', '5', 'fdbfb', '3', '5', '2', '0', '2012-09-10 00:00:00', '0', '2');
INSERT INTO `payment` VALUES ('212', '', '', '7777', '5', 'social network', '8', '0', '0', '0', '2028-09-20 12:00:00', '0', '');
INSERT INTO `payment` VALUES ('213', '', '', '7877', '5', 'test', '8', '0', '0', '0', '2005-09-20 12:00:00', '0', '');
INSERT INTO `payment` VALUES ('215', '', '', '900', '7', 'test three', '8', '0', '0', '0', '2027-09-20 00:00:00', '0', '');
INSERT INTO `payment` VALUES ('216', '', '', '666', '5', 'social network', '8', '0', '0', '0', '2012-09-20 12:00:00', '0', '');

-- ----------------------------
-- Table structure for `quotation`
-- ----------------------------
DROP TABLE IF EXISTS `quotation`;
CREATE TABLE `quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` text NOT NULL,
  `booking_ref` text NOT NULL,
  `date_of_quote_booking` date NOT NULL,
  `date_of_event` date NOT NULL,
  `number_of_guests` int(11) NOT NULL,
  `client_name` text NOT NULL,
  `telephone` text NOT NULL,
  `email` text NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  `venue` text NOT NULL,
  `hire_details` text NOT NULL,
  `time_slot_from` datetime NOT NULL,
  `time_slot_to` datetime NOT NULL,
  `type_of_event` int(11) NOT NULL,
  `cost_price_total` float NOT NULL,
  `per_cost` float NOT NULL,
  `no_of_table` text NOT NULL,
  `based` text NOT NULL COMMENT 'person_based=1 item_based=2',
  `deposit` float NOT NULL,
  `note` text NOT NULL,
  `customer_price_total` float NOT NULL,
  `sms_flag` text NOT NULL,
  `email_flag` text NOT NULL,
  `email_time_stamp` datetime NOT NULL,
  `service_tax` text NOT NULL,
  `archive_flag` int(11) NOT NULL,
  `invoice_flag` int(11) NOT NULL,
  `cancel_flag` int(11) NOT NULL,
  `cancel_remarks` text NOT NULL,
  `refund_amount` text NOT NULL,
  `terms_of_conditions` text NOT NULL,
  `which_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of quotation
-- ----------------------------
INSERT INTO `quotation` VALUES ('1', 'c4ca4238a0b923820dcc509a6f75849b', '10001', '2012-08-10', '2012-08-17', '300', 'Jetlander', '07540313461', ' ', '', '', '', '', '', '', '', '2012-08-17 05:30:00', '2012-08-18 02:00:00', '2', '3170', '0', '30', '2', '500', '', '6250', '0', '0', '2012-08-12 03:20:25', '', '0', '1', '0', '', '', 'Full payment must be made 28 days before the date of function', '3');
INSERT INTO `quotation` VALUES ('2', 'c81e728d9d4c2f636f067f89cc14862c', '10002', '2012-08-10', '2012-09-02', '450', 'mashud', ' ', ' ', '', '', '', '', '', '', '', '2012-09-02 10:00:00', '2012-09-02 05:00:00', '9', '3530', '0', '', '2', '0', '', '5500', '0', '0', '2012-08-10 05:54:38', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '10003', '2012-08-10', '2012-08-18', '400', 'ricky', '', '', '', '', '', '', '', '', '', '2012-08-18 17:30:00', '2012-08-19 02:00:00', '0', '1500', '0', '40', '2', '0', '', '5500', '0', '0', '2012-08-10 10:32:21', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('4', 'a87ff679a2f3e71d9181a67b7542122c', '10004', '2012-08-10', '2012-08-23', '60', 'ansha', '', '', '', '', '', '', '', '', '', '2012-08-23 18:00:00', '2012-08-23 11:00:00', '4', '400', '0', '', '2', '0', '', '1200', '0', '0', '2012-08-10 10:49:41', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('5', 'e4da3b7fbbce2345d7772b0674a318d5', '10005', '2012-08-10', '2012-08-24', '200', 'ar signature', ' ', ' ', '', '', '', '', '', '', '', '2012-08-24 05:30:00', '2012-08-24 12:00:00', '10', '200', '0', '', '2', '0', '', '1000', '0', '0', '2012-08-10 10:53:59', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('6', '1679091c5a880faf6fb5e6087eb1b2dc', '10006', '2012-08-10', '2012-08-26', '250', 'Harry', ' ', ' ', '', '', '', '', '', '', '', '2012-08-25 11:00:00', '2012-08-25 05:30:00', '1', '3305', '0', '', '2', '750', '', '5920', '0', '0', '2012-08-10 11:03:20', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('7', '8f14e45fceea167a5a36dedd4bea2543', '10007', '2012-08-10', '2012-08-25', '150', 'Mohammad Saeed', ' ', ' ', '', '', '', '', '', '', '', '2012-08-25 10:00:00', '2012-08-25 05:30:00', '1', '1650', '0', '', '2', '400', '', '3600', '0', '0', '2012-08-10 11:10:05', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('8', 'c9f0f895fb98ab9159f51fd0297e236d', '10008', '2012-08-13', '2012-08-26', '350', 'Nadia', '', '', '', '', '', '', '', '', '', '2012-08-26 17:30:00', '2012-08-26 23:30:00', '1', '400', '0', '', '2', '0', '', '3000', '0', '0', '2012-08-13 10:37:04', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('9', '45c48cce2e2d7fbdea1afc51c7c6ad26', '10009', '2012-08-13', '2012-08-25', '400', 'Kannan', '', '', '', '', '', '', '', '', '', '2012-08-25 17:30:00', '2012-08-26 01:30:00', '1', '1200', '0', '', '2', '500', '', '3500', '0', '0', '2012-08-13 10:40:15', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('10', 'd3d9446802a44259755d38e6d163e820', '10010', '2012-08-13', '2012-09-02', '450', 'mashud', ' ', ' ', '', '', '', '', '', '', '', '2012-09-02 10:30:00', '2012-09-02 05:30:00', '9', '0', '0', '', '2', '100', '', '0', '0', '0', '2012-08-13 11:08:46', '', '1', '1', '1', '', '', '', '3');
INSERT INTO `quotation` VALUES ('11', '6512bd43d9caa6e02c990b0a82652dca', '10011', '2012-08-13', '2012-09-15', '250', 'Sameer', ' ', ' ', '', '', '', '', '', '', '', '2012-09-15 03:00:00', '2012-09-15 11:00:00', '4', '350', '0', '', '2', '0', '', '2000', '0', '0', '2012-08-13 11:14:24', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('12', 'c20ad4d76fe97759aa27a0c99bff6710', '10012', '2012-08-13', '2012-09-16', '350', 'zahir gogalia', '', '', '', '', '', '', '', '', '', '2012-09-16 11:00:00', '2012-09-16 17:30:00', '1', '400', '0', '', '2', '0', '', '2100', '0', '0', '2012-08-13 11:17:19', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('13', 'c51ce410c124a10e0db5e4b97fc2af39', '10013', '2012-08-13', '2013-02-16', '250', 'hamzi', '', '', '', '', '', '', '', '', '', '2013-02-16 17:30:00', '2013-02-17 01:30:00', '0', '350', '0', '', '2', '400', '', '1350', '0', '0', '2012-08-13 11:36:12', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('14', 'aab3238922bcc25a6f606eb525ffdc56', '10014', '2012-08-13', '2012-12-02', '250', 'DJ DEEP', '', '', '', '', '', '', '', '', '', '2012-12-02 17:30:00', '2012-12-02 23:30:00', '2', '200', '0', '', '2', '500', '', '1500', '0', '0', '2012-08-13 11:38:19', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('15', '9bf31c7ff062936a96d3c8bd1f8f2ff3', '10015', '2012-08-13', '2012-10-27', '300', 'Mr Solanki', '', '', '', '', '', '', '', '', '', '2012-10-27 17:30:00', '2012-10-28 01:30:00', '2', '400', '0', '', '2', '0', '', '2500', '0', '0', '2012-08-13 03:27:53', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('16', 'c74d97b01eae257e44aa9d5bade97baf', '10016', '2012-08-13', '2012-09-29', '250', 'naeymah', '', '', '', '', '', '', '', '', '', '2012-09-29 10:30:00', '2012-09-30 17:30:00', '1', '2405', '0', '', '2', '500', '', '5380', '0', '0', '2012-08-13 08:37:59', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('17', '70efdf2ec9b086079795c442636b55fb', '10017', '2012-08-13', '2012-10-29', '300', 'devender singh', '', '', '', '', '', '', '', '', '', '2012-10-29 11:00:00', '2012-10-29 17:30:00', '1', '600', '0', '', '2', '500', '', '2800', '0', '0', '2012-08-13 11:27:14', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('18', '6f4922f45568161a8cdf4ad2299f6d23', '10018', '2012-08-13', '2012-10-28', '500', 'alomgir', '', '', '', '', '', '', '', '', '', '2012-10-28 11:00:00', '2012-08-28 17:30:00', '1', '4300', '0', '', '2', '250', '', '8750', '0', '0', '2012-08-13 11:37:55', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('19', '1f0e3dad99908345f7439f8ffabdffc4', '10019', '2012-08-14', '2012-11-04', '150', 'bhabin Patel', '', '', '', '', '', '', '', '', '', '2012-11-04 11:00:00', '2012-11-04 16:30:00', '3', '1100', '0', '', '2', '300', '', '3290', '0', '0', '2012-08-14 02:02:48', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('20', '98f13708210194c475687be6106a3b84', '10020', '2012-08-14', '2012-10-06', '300', 'sabrina', '', '', '', '', '', '', '', '', '', '2012-10-06 04:30:00', '2012-10-06 12:30:00', '1', '400', '0', '', '2', '300', '', '2500', '0', '0', '2012-08-14 02:06:34', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('21', '3c59dc048e8850243be8079a5c74d079', '10021', '2012-08-14', '2013-10-26', '300', 'marry', '', '', '', '', '', '', '', '', '', '2013-10-26 17:30:00', '2013-10-27 01:30:00', '1', '400', '0', '', '2', '500', '', '2800', '0', '0', '2012-08-14 02:15:09', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('22', 'b6d767d2f8ed5d21a44b0e5886680cb9', '10022', '2012-08-14', '2013-03-22', '250', 'jazz (son)', '', '', '', '', '', '', '', '', '', '2013-03-22 17:30:00', '2013-03-23 01:30:00', '12', '3150', '25', '', '1', '0', '', '6250', '0', '0', '2012-08-14 02:47:54', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('23', '37693cfc748049e45d87b8c7d8b9aacd', '10023', '2012-08-17', '2013-08-17', '250', 'jazz (daughter)', '', '', '', '', '', '', '', '', '', '2013-08-17 17:30:00', '2012-08-18 01:30:00', '12', '3350', '25', '', '1', '500', '', '6250', '0', '0', '2012-08-17 02:36:27', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('24', '1ff1de774005f8da13f42943881c655f', '10024', '2012-08-17', '2013-09-07', '250', 'sunny', '', '', '', '', '', '', '', '', '', '2013-09-07 17:30:00', '2013-09-18 01:30:00', '12', '2555', '0', '', '2', '500', '', '5270', '0', '0', '2012-08-17 02:42:46', '', '0', '0', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('25', '8e296a067a37563370ded05f5a3bf3ec', '10025', '2012-08-17', '2013-08-09', '250', 'Jatinder', '', '', '', '', '', '', '', '', '', '2013-08-09 17:30:00', '2013-08-10 01:30:00', '12', '3080', '24', '', '1', '500', '', '6000', '0', '0', '2012-08-17 02:45:49', '', '0', '0', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('26', '4e732ced3463d06de0ca9a15b6153677', '10026', '2012-08-17', '2012-11-18', '400', 'rajon', '', '', '', '', '', '', '', '', '', '2012-11-18 08:00:00', '2012-11-18 23:30:00', '1', '0', '0', '', '2', '500', '', '0', '0', '0', '2012-08-17 02:53:29', '', '0', '0', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('27', '02e74f10e0327ad868d138f2b4fdd6f0', '10027', '2012-08-17', '2012-08-19', '250', 'shyrose', '', '', '', '', '', '', '', '', '', '2012-08-19 19:00:00', '2012-08-19 23:30:00', '11', '100', '0', '', '2', '0', '', '1000', '0', '0', '2012-08-17 03:01:28', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('28', '33e75ff09dd601bbe69f351039152189', '10028', '2012-08-17', '2012-08-24', '150', 'raj', ' ', ' ', '', '', '', '', '', '', '', '2012-08-24 11:00:00', '2012-08-24 05:30:00', '9', '860', '0', '', '2', '100', '', '1540', '0', '0', '2012-08-17 03:06:14', '', '1', '1', '1', '', '', '', '3');
INSERT INTO `quotation` VALUES ('29', '6ea9ab1baa0efb9e19094440c317e21b', '10029', '2012-08-21', '2012-11-23', '0', 'Redbridge Asian Mandal', '', '', '', '', '', '', '', '', '', '2012-11-23 15:30:00', '2012-10-23 23:30:00', '10', '100', '0', '', '2', '0', '', '1000', '0', '0', '2012-08-21 04:58:53', '', '0', '1', '0', '', '', '', '2');
INSERT INTO `quotation` VALUES ('30', '34173cb38f07f89ddbebc2ac9128303f', '10030', '2012-08-21', '2012-08-24', '200', 'Maher Matin', '07894491160', 'mahermatin@gmail.com', '300 High Road', '', 'Ilford', 'IG1 1QW', '', '', '', '2012-08-24 07:00:00', '2012-08-24 08:00:00', '1', '0', '0', '20', '2', '1000', '', '0', '0', '1', '2012-08-21 05:25:47', '', '1', '1', '1', '', '', 'Full payment is due 28 days before function', '2');
INSERT INTO `quotation` VALUES ('31', 'c16a5320fa475530d9583c34fd356ef5', '10031', '2012-08-23', '2012-09-01', '0', 'Rahaban', '', '', '', '', '', '', '', '', '', '2012-09-01 17:30:00', '2012-09-02 01:00:00', '10', '100', '0', '', '2', '0', '', '1000', '0', '0', '2012-08-23 04:14:56', '', '0', '1', '0', '', '', '', '2');
INSERT INTO `quotation` VALUES ('32', '6364d3f0f495b6ab9dcf8d3b5c6e0b01', '10032', '2012-08-28', '2012-11-25', '500', 'Javed', '', '', '', '', '', '', '', '', '', '2012-11-28 11:00:00', '2012-11-28 17:30:00', '1', '0', '13', '', '1', '0', '', '0', '0', '0', '2012-08-28 09:17:56', '', '0', '0', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('33', '182be0c5cdcd5072bb1864cdee4d3d6e', '10033', '2012-08-28', '2013-02-07', '270', 'Sarah Naeem', '02085528332', '', '122 Shakespeare Crescent', 'Manor Park', '', 'E12 6LP', '', '', '', '2013-02-07 17:00:00', '2013-02-08 01:00:00', '1', '0', '16.25', '', '1', '300', '', '0', '0', '0', '2012-08-28 09:56:40', '', '0', '1', '0', '', '', '', '3');
INSERT INTO `quotation` VALUES ('34', 'e369853df766fa44e1ed0ff613f563bd', '10034', '2012-08-30', '2013-08-23', '170', 'Sandip Dhillon', '7939007633', 'sandipdhillon@hotmail.co.uk', '', '', '', '', '', '', '', '2013-08-23 05:30:00', '2013-08-23 21:00:00', '12', '0', '22', '', '1', '0', '', '0', '0', '0', '2012-08-30 05:57:23', '', '0', '0', '0', '', '', '', '3');

-- ----------------------------
-- Table structure for `quotation_order`
-- ----------------------------
DROP TABLE IF EXISTS `quotation_order`;
CREATE TABLE `quotation_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `remark` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `each_price` float NOT NULL,
  `cost_price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of quotation_order
-- ----------------------------
INSERT INTO `quotation_order` VALUES ('1', '1', '1', '77', '', '1', '2800', '350');
INSERT INTO `quotation_order` VALUES ('2', '1', '2', '78', '5 Starters, 4 Mains, 2 Desserts', '1', '2100', '1600');
INSERT INTO `quotation_order` VALUES ('3', '1', '3', '79', 'Blue Sash & Blue Runners', '1', '750', '650');
INSERT INTO `quotation_order` VALUES ('4', '1', '9', '81', '2 Security Guards, 12 Staff, 1 Bartender, 1 Event Manager', '1', '600', '570');
INSERT INTO `quotation_order` VALUES ('5', '2', '2', '78', ' 4 starters, 4 main and 2 dessert', '1', '2920', '1800');
INSERT INTO `quotation_order` VALUES ('6', '2', '3', '79', '2 stage, head tables with flowers, cutlery and chair cover, crockery and car hire', '1', '1500', '800');
INSERT INTO `quotation_order` VALUES ('7', '2', '4', '80', 'drapping on the stair case', '1', '100', '80');
INSERT INTO `quotation_order` VALUES ('8', '2', '9', '81', '22 waiters and event manager', '1', '980', '850');
INSERT INTO `quotation_order` VALUES ('9', '3', '1', '77', '', '1', '3000', '400');
INSERT INTO `quotation_order` VALUES ('10', '3', '2', '78', 'food only', '1', '2500', '1100');
INSERT INTO `quotation_order` VALUES ('11', '4', '1', '77', '', '1', '700', '0');
INSERT INTO `quotation_order` VALUES ('12', '4', '2', '78', '', '1', '300', '200');
INSERT INTO `quotation_order` VALUES ('13', '4', '3', '79', '', '1', '200', '200');
INSERT INTO `quotation_order` VALUES ('14', '5', '1', '77', '', '1', '1000', '200');
INSERT INTO `quotation_order` VALUES ('15', '6', '1', '77', '', '1', '2800', '400');
INSERT INTO `quotation_order` VALUES ('16', '6', '2', '78', '', '230', '7', '1625');
INSERT INTO `quotation_order` VALUES ('17', '6', '3', '79', '', '1', '800', '650');
INSERT INTO `quotation_order` VALUES ('18', '6', '4', '80', 'dj', '1', '350', '300');
INSERT INTO `quotation_order` VALUES ('19', '6', '9', '81', '', '16', '35', '330');
INSERT INTO `quotation_order` VALUES ('20', '7', '1', '77', '', '1', '1800', '200');
INSERT INTO `quotation_order` VALUES ('21', '7', '2', '78', '', '1', '800', '550');
INSERT INTO `quotation_order` VALUES ('22', '7', '3', '79', '', '1', '350', '300');
INSERT INTO `quotation_order` VALUES ('23', '7', '4', '80', 'drapping', '1', '300', '300');
INSERT INTO `quotation_order` VALUES ('24', '7', '9', '81', '', '10', '35', '300');
INSERT INTO `quotation_order` VALUES ('25', '8', '1', '77', '', '1', '3000', '400');
INSERT INTO `quotation_order` VALUES ('26', '9', '1', '77', '', '1', '2500', '400');
INSERT INTO `quotation_order` VALUES ('27', '9', '3', '79', 'stage', '1', '900', '800');
INSERT INTO `quotation_order` VALUES ('28', '10', '2', '78', '3 course meal', '450', '7.5', '0');
INSERT INTO `quotation_order` VALUES ('29', '10', '3', '79', '2 stage with crockery and cutlery, chair cover', '1', '1000', '0');
INSERT INTO `quotation_order` VALUES ('30', '10', '4', '80', 'drapping', '1', '150', '0');
INSERT INTO `quotation_order` VALUES ('31', '10', '9', '81', 'waiting staff with event manager', '25', '40', '0');
INSERT INTO `quotation_order` VALUES ('32', '11', '1', '77', '', '1', '2000', '350');
INSERT INTO `quotation_order` VALUES ('33', '12', '1', '77', '', '1', '1900', '400');
INSERT INTO `quotation_order` VALUES ('34', '13', '1', '77', '', '1', '1350', '350');
INSERT INTO `quotation_order` VALUES ('35', '14', '1', '77', '', '1', '1500', '200');
INSERT INTO `quotation_order` VALUES ('36', '15', '1', '77', '', '1', '2500', '400');
INSERT INTO `quotation_order` VALUES ('37', '16', '1', '77', '', '1', '2500', '450');
INSERT INTO `quotation_order` VALUES ('38', '16', '2', '78', '', '250', '7', '1125');
INSERT INTO `quotation_order` VALUES ('39', '16', '3', '79', '', '25', '12', '200');
INSERT INTO `quotation_order` VALUES ('40', '16', '4', '80', '', '1', '350', '300');
INSERT INTO `quotation_order` VALUES ('41', '16', '9', '81', '', '12', '40', '330');
INSERT INTO `quotation_order` VALUES ('42', '17', '1', '77', '', '1', '2400', '300');
INSERT INTO `quotation_order` VALUES ('43', '17', '3', '79', 'baloon decoration and chair cover', '1', '400', '300');
INSERT INTO `quotation_order` VALUES ('44', '18', '1', '77', '', '1', '3000', '300');
INSERT INTO `quotation_order` VALUES ('45', '18', '2', '78', '', '500', '6.5', '2000');
INSERT INTO `quotation_order` VALUES ('46', '18', '3', '79', '2 stage, martini vases and linen, cutlery and crockery', '1', '1500', '1200');
INSERT INTO `quotation_order` VALUES ('47', '18', '9', '81', '', '25', '40', '800');
INSERT INTO `quotation_order` VALUES ('48', '19', '1', '77', '', '1', '2000', '350');
INSERT INTO `quotation_order` VALUES ('49', '19', '2', '78', '', '150', '6', '450');
INSERT INTO `quotation_order` VALUES ('50', '19', '3', '79', 'chair cover', '1', '150', '120');
INSERT INTO `quotation_order` VALUES ('51', '19', '9', '81', '', '6', '40', '180');
INSERT INTO `quotation_order` VALUES ('52', '20', '1', '77', '', '1', '2500', '400');
INSERT INTO `quotation_order` VALUES ('53', '21', '1', '77', '', '1', '2800', '400');
INSERT INTO `quotation_order` VALUES ('54', '22', '1', '77', '', '0', '0', '350');
INSERT INTO `quotation_order` VALUES ('55', '22', '2', '78', '6 starter, 4 main, 2 dessert', '0', '0', '1400');
INSERT INTO `quotation_order` VALUES ('56', '22', '3', '79', 'chair cover and ribbon', '0', '0', '500');
INSERT INTO `quotation_order` VALUES ('57', '22', '4', '80', 'jilebi stand', '0', '0', '400');
INSERT INTO `quotation_order` VALUES ('58', '22', '9', '81', '12 staff', '0', '0', '500');
INSERT INTO `quotation_order` VALUES ('59', '23', '1', '77', '', '0', '0', '350');
INSERT INTO `quotation_order` VALUES ('60', '23', '2', '78', '', '0', '0', '1300');
INSERT INTO `quotation_order` VALUES ('61', '23', '3', '79', 'chair cover, ribbon, centre piece', '0', '0', '750');
INSERT INTO `quotation_order` VALUES ('62', '23', '4', '80', 'jilebi stand', '0', '0', '450');
INSERT INTO `quotation_order` VALUES ('63', '23', '9', '81', '15', '0', '0', '500');
INSERT INTO `quotation_order` VALUES ('64', '24', '1', '77', '', '1', '2500', '450');
INSERT INTO `quotation_order` VALUES ('65', '24', '2', '78', '', '250', '7', '1250');
INSERT INTO `quotation_order` VALUES ('66', '24', '3', '79', '', '25', '10', '225');
INSERT INTO `quotation_order` VALUES ('67', '24', '4', '80', 'jilebi stand', '1', '350', '300');
INSERT INTO `quotation_order` VALUES ('68', '24', '9', '81', '', '12', '35', '330');
INSERT INTO `quotation_order` VALUES ('69', '25', '1', '77', '', '0', '0', '450');
INSERT INTO `quotation_order` VALUES ('70', '25', '2', '78', '', '0', '0', '1400');
INSERT INTO `quotation_order` VALUES ('71', '25', '3', '79', 'chair cover, ribbon, crockery', '0', '0', '800');
INSERT INTO `quotation_order` VALUES ('72', '25', '9', '81', '13', '0', '0', '430');
INSERT INTO `quotation_order` VALUES ('73', '26', '1', '77', '', '1', '2000', '0');
INSERT INTO `quotation_order` VALUES ('74', '26', '3', '79', 'stage, centre piece', '1', '1800', '0');
INSERT INTO `quotation_order` VALUES ('75', '26', '4', '80', 'ganesh', '1', '500', '0');
INSERT INTO `quotation_order` VALUES ('76', '27', '1', '77', '', '1', '1000', '100');
INSERT INTO `quotation_order` VALUES ('77', '28', '2', '78', '', '150', '8', '650');
INSERT INTO `quotation_order` VALUES ('78', '28', '4', '80', 'kitchen staff', '2', '50', '0');
INSERT INTO `quotation_order` VALUES ('79', '28', '9', '81', '', '6', '40', '210');
INSERT INTO `quotation_order` VALUES ('80', '29', '1', '77', '', '1', '1000', '100');
INSERT INTO `quotation_order` VALUES ('81', '30', '1', '77', '', '1', '3000', '0');
INSERT INTO `quotation_order` VALUES ('82', '30', '2', '78', 'xxxxxxx', '1', '3500', '0');
INSERT INTO `quotation_order` VALUES ('83', '30', '3', '79', 'xxxxxx', '1', '3500', '0');
INSERT INTO `quotation_order` VALUES ('84', '30', '4', '80', 'xxxxx', '1', '4000', '0');
INSERT INTO `quotation_order` VALUES ('85', '30', '9', '81', 'xxxxxx', '1', '0', '0');
INSERT INTO `quotation_order` VALUES ('86', '31', '1', '77', 'Dry Hall Hire', '1', '1000', '100');
INSERT INTO `quotation_order` VALUES ('87', '32', '2', '78', '4 starters, 4 main and 2 desserts', '0', '0', '0');
INSERT INTO `quotation_order` VALUES ('88', '32', '3', '79', 'stage and centre pieces with fresh flower', '0', '0', '0');
INSERT INTO `quotation_order` VALUES ('89', '32', '9', '81', '25 event staff including event manager', '0', '0', '0');
INSERT INTO `quotation_order` VALUES ('90', '33', '1', '77', '', '0', '0', '0');
INSERT INTO `quotation_order` VALUES ('91', '33', '2', '78', 'CHICKEN TIKKA, LAHORI FISH, MEAT BIRIANY WITH POTATO, CHICKEN KORAI, MIXED VEG, GAJOR KA HALWA WITH ICECREAM', '0', '0', '0');
INSERT INTO `quotation_order` VALUES ('92', '33', '3', '79', 'CENTRE PIECES WITH MARTINI VASES, STAGE, CHAIR COVER AND RIBBON', '0', '0', '0');
INSERT INTO `quotation_order` VALUES ('93', '33', '9', '81', '14 STAFF ', '0', '0', '0');
INSERT INTO `quotation_order` VALUES ('94', '34', '1', '77', '', '0', '0', '0');
INSERT INTO `quotation_order` VALUES ('95', '34', '2', '78', '3 course meal', '0', '0', '0');
INSERT INTO `quotation_order` VALUES ('96', '34', '3', '79', 'chair cover, linen, cutlery . crockery, centre pieces', '0', '0', '0');
INSERT INTO `quotation_order` VALUES ('97', '34', '9', '81', '', '0', '0', '0');

-- ----------------------------
-- Table structure for `supplier`
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('1', 'B & Q', 'Tools');
INSERT INTO `supplier` VALUES ('2', 'Maplin', 'IT Equipment');
INSERT INTO `supplier` VALUES ('3', 'Bangla City', 'Cash & Carry');
INSERT INTO `supplier` VALUES ('4', 'Creative Event Management', 'Creative Event Management');
INSERT INTO `supplier` VALUES ('5', 'Esso', 'Petrol');
INSERT INTO `supplier` VALUES ('6', 'Party Quiz', 'Party Quiz');
INSERT INTO `supplier` VALUES ('7', 'Absolute Fire', 'Fire Alarm');
INSERT INTO `supplier` VALUES ('8', 'E On', 'Electricity');
INSERT INTO `supplier` VALUES ('9', 'Channel S', 'Television');
INSERT INTO `supplier` VALUES ('10', 'P2I', 'P2I');
INSERT INTO `supplier` VALUES ('11', 'pc world', 'pc world');
INSERT INTO `supplier` VALUES ('12', 'kashmir food', 'kashmir food');
INSERT INTO `supplier` VALUES ('13', 'ahmed chair cover', 'ahmed chair cover');
INSERT INTO `supplier` VALUES ('14', 'advert ', 'advert');
INSERT INTO `supplier` VALUES ('15', 'millenium', 'cash & carry');
INSERT INTO `supplier` VALUES ('16', 'noori food', 'noori');
INSERT INTO `supplier` VALUES ('17', 'farm food', 'farm food');
INSERT INTO `supplier` VALUES ('18', 'gb food', 'gb food');
INSERT INTO `supplier` VALUES ('19', 'lidl', 'lidl');
INSERT INTO `supplier` VALUES ('20', 'crystal laundry', 'crystal');
INSERT INTO `supplier` VALUES ('21', 'but', 'asd');

-- ----------------------------
-- Table structure for `terms_of_conditions`
-- ----------------------------
DROP TABLE IF EXISTS `terms_of_conditions`;
CREATE TABLE `terms_of_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `toc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of terms_of_conditions
-- ----------------------------
INSERT INTO `terms_of_conditions` VALUES ('1', 'The Terms and Conditions vary according to the country where your billing address is located. Please choose your billing country below to view the appropriate Terms and Conditions.');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `dob` date NOT NULL,
  `mobile` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `last_login` date NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `town_city_county` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'Admin', '1987-01-11', '91903399595', 'admin', 'hello', '2013-05-28', '21', 'Appu str', 'Chennai', '600004', 'India');
INSERT INTO `userinfo` VALUES ('2', 'Maher Matin', '2012-07-08', '07894491160', 'maher@orchardhall.co.uk', '12345', '2012-09-05', '', '', '', '', '');
INSERT INTO `userinfo` VALUES ('3', 'Mohammad Sadi', '1975-12-19', '07584321727', 'sadi@orchardhall.co.uk', '12345', '2012-09-03', '', '', '', '', '');
INSERT INTO `userinfo` VALUES ('4', 'Shanara Matin', '0000-00-00', '', 's.matin@orchardhall.co.uk', '12345', '0000-00-00', '', '', '', '', '');
INSERT INTO `userinfo` VALUES ('5', 'Jahed', '1998-05-31', '07725481664', 'jahed@orchardhall.co.uk', '12345', '0000-00-00', '', '', '', '', '');
INSERT INTO `userinfo` VALUES ('6', 'Mizan', '0000-00-00', '07852864460', 'mizan@orchardhall.co.uk', '12345', '0000-00-00', '', '', '', '', '');

-- ----------------------------
-- Table structure for `venues`
-- ----------------------------
DROP TABLE IF EXISTS `venues`;
CREATE TABLE `venues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venues` text NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `town_city_county` text NOT NULL,
  `postcode` text NOT NULL,
  `country` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of venues
-- ----------------------------
INSERT INTO `venues` VALUES ('2', 'Orchard Hall', '300-310 High Road', '', 'Ilford', 'IG1 1QW', 'UK');

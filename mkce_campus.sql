/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : mkce_campus

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-10-21 21:37:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `comments`
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_board_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for `notice_board`
-- ----------------------------
DROP TABLE IF EXISTS `notice_board`;
CREATE TABLE `notice_board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `path` text NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of notice_board
-- ----------------------------
INSERT INTO `notice_board` VALUES ('1', '2', '', '', '2013-05-30 05:51:18');
INSERT INTO `notice_board` VALUES ('2', '2', '', '', '2013-05-30 05:53:17');
INSERT INTO `notice_board` VALUES ('3', '2', '', '', '2013-05-30 05:54:37');
INSERT INTO `notice_board` VALUES ('4', '2', '', '', '2013-05-30 05:56:10');
INSERT INTO `notice_board` VALUES ('5', '2', '', '', '2013-05-30 05:57:54');
INSERT INTO `notice_board` VALUES ('6', '2', '', '', '2013-05-30 05:58:40');
INSERT INTO `notice_board` VALUES ('7', '2', '', '', '2013-05-30 06:01:59');
INSERT INTO `notice_board` VALUES ('8', '2', '', '', '2013-05-30 06:03:28');
INSERT INTO `notice_board` VALUES ('9', '2', '', '', '2013-05-30 06:05:30');
INSERT INTO `notice_board` VALUES ('10', '2', '', '', '2013-05-30 06:06:31');
INSERT INTO `notice_board` VALUES ('11', '2', '', '', '2013-05-30 06:07:29');
INSERT INTO `notice_board` VALUES ('12', '2', '', '', '2013-05-30 06:09:49');
INSERT INTO `notice_board` VALUES ('13', '2', '', 'staff_uploads/', '2013-05-30 06:17:52');
INSERT INTO `notice_board` VALUES ('14', '2', '', 'staff_uploads/', '2013-05-30 06:19:55');
INSERT INTO `notice_board` VALUES ('15', '2', '', 'staff_uploads/', '2013-05-30 06:24:42');
INSERT INTO `notice_board` VALUES ('16', '2', '', 'staff_uploads/', '2013-05-30 06:36:47');
INSERT INTO `notice_board` VALUES ('17', '2', '', 'staff_uploads/', '2013-05-30 06:38:15');
INSERT INTO `notice_board` VALUES ('18', '2', '', 'staff_uploads/', '2013-05-30 06:40:14');
INSERT INTO `notice_board` VALUES ('19', '2', '', 'staff_uploads/', '2013-05-30 06:50:36');
INSERT INTO `notice_board` VALUES ('20', '2', '', 'staff_uploads/', '2013-05-30 06:53:13');
INSERT INTO `notice_board` VALUES ('21', '2', '', 'staff_uploads/avatar2.jpg', '2013-05-30 06:54:20');

-- ----------------------------
-- Table structure for `questions`
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `option_1` text NOT NULL,
  `option_2` text NOT NULL,
  `option_3` text NOT NULL,
  `option_4` text NOT NULL,
  `answer` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES ('1', 'what ', '1', '2', '3', '4', '3', '');
INSERT INTO `questions` VALUES ('2', 'this', 'saf', 'sdk', 'lsdkjgh', 'ldkfg', '2', '');
INSERT INTO `questions` VALUES ('3', 'dsflak', 'sdf', 'lksg', 'lkjh', 'lkgg', '1', '');

-- ----------------------------
-- Table structure for `reply`
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_id` int(11) NOT NULL,
  `reply_message` text NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NOT NULL COMMENT '1-Staff 2-student',
  `department_id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `name` text NOT NULL,
  `register_no` text NOT NULL,
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
  `gcm_reg_id` text NOT NULL,
  `imei_no` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '1', '3', '4', 'admin', '123456', '1980-10-24', '9638527410', 'admin@admin.com', 'admin', '0000-00-00', 'check 1', 'check 2', 'testin', '6215114', '', '', '');
INSERT INTO `userinfo` VALUES ('2', '1', '3', '1', 'simon', '12345', '2013-05-23', '451', 'admin@mkce.com', 'admin', '0000-00-00', '', '', '', '', '', '', '');
INSERT INTO `userinfo` VALUES ('3', '2', '1', '4', 'kathir', '9261', '0000-00-00', '354352354245', 'kathir@mkce.com', 'k', '0000-00-00', '', '', '', '', '', '', '');

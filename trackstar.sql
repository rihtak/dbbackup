/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : trackstar

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-10-21 21:39:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_auth_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_assignment`;
CREATE TABLE `tbl_auth_assignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` int(11) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  KEY `fk_auth_assignment_userid` (`userid`),
  CONSTRAINT `fk_auth_assignment_itemname` FOREIGN KEY (`itemname`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_assignment_userid` FOREIGN KEY (`userid`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_auth_assignment
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_auth_item`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_item`;
CREATE TABLE `tbl_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_auth_item
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_auth_item_child`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_item_child`;
CREATE TABLE `tbl_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `fk_auth_item_child_child` (`child`),
  CONSTRAINT `fk_auth_item_child_child` FOREIGN KEY (`child`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_child_parent` FOREIGN KEY (`parent`) REFERENCES `tbl_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_auth_item_child
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_comment`;
CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `issue_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_issue` (`issue_id`),
  KEY `fk_comment_owner` (`create_user_id`),
  KEY `fk_comment_update_user` (`update_user_id`),
  CONSTRAINT `fk_comment_issue` FOREIGN KEY (`issue_id`) REFERENCES `tbl_issue` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_comment_owner` FOREIGN KEY (`create_user_id`) REFERENCES `tbl_user` (`id`),
  CONSTRAINT `fk_comment_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `tbl_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_comment
-- ----------------------------
INSERT INTO `tbl_comment` VALUES ('1', 'This is my first comment', '1', null, null, null, null);
INSERT INTO `tbl_comment` VALUES ('2', 'second comment', '1', null, null, null, null);
INSERT INTO `tbl_comment` VALUES ('3', 'fdaskjf', '1', null, null, null, null);
INSERT INTO `tbl_comment` VALUES ('4', 'check', '1', null, null, null, null);

-- ----------------------------
-- Table structure for `tbl_issue`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_issue`;
CREATE TABLE `tbl_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `project_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `requester_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_issue_project` (`project_id`),
  KEY `fk_issue_owner` (`owner_id`),
  KEY `fk_issue_requester` (`requester_id`),
  CONSTRAINT `fk_issue_owner` FOREIGN KEY (`owner_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_issue_project` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_issue_requester` FOREIGN KEY (`requester_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_issue
-- ----------------------------
INSERT INTO `tbl_issue` VALUES ('1', 'Problem 1', 'issue creation', '1', '2', '1', '1', '2', '0000-00-00 00:00:00', null, '0000-00-00 00:00:00', null);
INSERT INTO `tbl_issue` VALUES ('2', 'Problem 2', 'Issue 2 added for pagination testing', '1', '1', '1', '1', '2', null, null, null, null);

-- ----------------------------
-- Table structure for `tbl_migration`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_migration
-- ----------------------------
INSERT INTO `tbl_migration` VALUES ('m000000_000000_base', '1380612114');
INSERT INTO `tbl_migration` VALUES ('m131001_072024_create_project_table', '1380612116');
INSERT INTO `tbl_migration` VALUES ('m131001_072347_create_issue_user_and_assignment_tables', '1380612454');
INSERT INTO `tbl_migration` VALUES ('m131001_072958_create_issue_user_and_assignment_tables2', '1380613401');
INSERT INTO `tbl_migration` VALUES ('m131001_074019_relation_key', '1380613401');
INSERT INTO `tbl_migration` VALUES ('m131004_133506_create_user_comments_table', '1380894136');
INSERT INTO `tbl_migration` VALUES ('m131008_093614_create_rbac_tables', '1381225331');

-- ----------------------------
-- Table structure for `tbl_project`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_project`;
CREATE TABLE `tbl_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `create_user_id` (`create_user_id`),
  KEY `create_user_id_2` (`create_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_project
-- ----------------------------
INSERT INTO `tbl_project` VALUES ('1', 'Project1', 'Testing Project 1', '0000-00-00 00:00:00', '1', '0000-00-00 00:00:00', null);
INSERT INTO `tbl_project` VALUES ('2', 'Project2', 'Testing Project 2', '0000-00-00 00:00:00', '2', '0000-00-00 00:00:00', null);

-- ----------------------------
-- Table structure for `tbl_project_user_assignment`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_project_user_assignment`;
CREATE TABLE `tbl_project_user_assignment` (
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `fk_user_project` (`user_id`),
  CONSTRAINT `fk_project_user` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_project` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_project_user_assignment
-- ----------------------------
INSERT INTO `tbl_project_user_assignment` VALUES ('1', '1');
INSERT INTO `tbl_project_user_assignment` VALUES ('1', '2');

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'User One', 'test1@\r\nnotanaddress.com', '5a105e8b9d40e1329780d62ea2265d8a', '2013-10-14 12:13:34', null, null, null, null);
INSERT INTO `tbl_user` VALUES ('2', 'User Two', 'test2@notanaddress.\r\ncom', 'ad0234829205b9033196ba818f7a872b', null, null, null, null, null);
INSERT INTO `tbl_user` VALUES ('3', 'kathir', 'skathiresan01@gmail.com', 'k', '0000-00-00 00:00:00', '2013-10-04 11:22:27', null, '2013-10-04 11:23:32', null);
INSERT INTO `tbl_user` VALUES ('4', 'vinoth', 'vinothkumar@ginfoclique.com', 'v', '0000-00-00 00:00:00', '2013-10-04 12:26:35', '0', '2013-10-04 12:26:35', '0');

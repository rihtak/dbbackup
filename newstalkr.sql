/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : newstalkr

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-10-21 21:37:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `nl_admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `nl_admin_users`;
CREATE TABLE `nl_admin_users` (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_admin_users
-- ----------------------------
INSERT INTO `nl_admin_users` VALUES ('1', 'kathir', 'skathiresan01@gmail.com', 'k', null, '2013-10-10 10:17:32', '2013-10-10 10:17:32');
INSERT INTO `nl_admin_users` VALUES ('2', 'skathir', 'skathiresan02@gmail.com', '8ce4b16b22b58894aa86c421e8759df3', null, '2013-10-10 10:22:03', '2013-10-10 10:22:03');
INSERT INTO `nl_admin_users` VALUES ('3', 'admin', 'admin@admin.com', '21232f297a57a5a743894a0e4a801fc3', '2013-10-18 14:00:13', '2013-10-10 10:24:00', '2013-10-10 10:24:00');
INSERT INTO `nl_admin_users` VALUES ('4', 'vinoth', 'vinothkumar@newstalkr.com', '9e3669d19b675bd57058fd4664205d2a', '2013-10-15 07:33:45', '2013-10-10 12:51:54', '2013-10-10 12:51:54');

-- ----------------------------
-- Table structure for `nl_analytics`
-- ----------------------------
DROP TABLE IF EXISTS `nl_analytics`;
CREATE TABLE `nl_analytics` (
  `analytics_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `window_id` varchar(45) NOT NULL COMMENT 'window unique ref id',
  `window_in_time` time NOT NULL DEFAULT '00:00:00' COMMENT 'window opened time ',
  `around_time` time NOT NULL DEFAULT '00:00:00' COMMENT 'mean time differance for window open to close timing ',
  `datetime` datetime NOT NULL COMMENT 'event date and time',
  `network_type` varchar(45) NOT NULL COMMENT 'using network types for "1-WIFI,2-GPRS,3-3G,4-HSDPA,5-HSPA+,5-4G/LTE"',
  `ip_address` varchar(45) NOT NULL,
  PRIMARY KEY (`analytics_id`),
  KEY `idx_username` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_analytics
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_content`
-- ----------------------------
DROP TABLE IF EXISTS `nl_content`;
CREATE TABLE `nl_content` (
  `content_id` int(10) NOT NULL AUTO_INCREMENT,
  `master_category_id` int(11) NOT NULL,
  `content_site_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-waiting for approval,1-approved',
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(10) NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `urls` text,
  `attribs` varchar(5120) DEFAULT NULL,
  `ordering` int(11) DEFAULT '0',
  `access` int(10) unsigned DEFAULT '0',
  `hits` int(10) unsigned DEFAULT '0',
  `featured` tinyint(3) unsigned DEFAULT '0' COMMENT 'Set if article is featured.',
  `approved_by` int(11) NOT NULL COMMENT 'approved by admin in newstalkr',
  PRIMARY KEY (`content_id`),
  KEY `idx_access` (`access`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`master_category_id`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`master_category_id`),
  KEY `fk_nl_content_content_sites1_idx` (`content_site_id`),
  KEY `master_category_id` (`master_category_id`),
  KEY `approved_by` (`approved_by`),
  CONSTRAINT `nl_content_ibfk_1` FOREIGN KEY (`content_site_id`) REFERENCES `nl_content_sites` (`content_site_id`),
  CONSTRAINT `nl_content_ibfk_2` FOREIGN KEY (`content_site_id`) REFERENCES `nl_content_sites` (`content_site_id`),
  CONSTRAINT `nl_content_ibfk_3` FOREIGN KEY (`master_category_id`) REFERENCES `nl_master_categories` (`master_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nl_content
-- ----------------------------
INSERT INTO `nl_content` VALUES ('1', '2', '1', 'sport title', 'sport alias', 'introl', 'sad', '1', '0000-00-00 00:00:00', '0', '', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', null, '0', '0', '0', '0', '3');
INSERT INTO `nl_content` VALUES ('2', '2', '1', 'check', 'SKDF', 'DSKF', 'SDKF', '1', '0000-00-00 00:00:00', '0', 'A', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'ADF', null, '0', '0', '0', '0', '3');
INSERT INTO `nl_content` VALUES ('3', '8', '4', 'text', 'test', 'test', 'fulltext', '1', '0000-00-00 00:00:00', '0', '', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', null, '0', '0', '0', '0', '3');
INSERT INTO `nl_content` VALUES ('4', '9', '6', 'text', 'sdaf', 'safd', 'sadf', '1', '0000-00-00 00:00:00', '0', '', '0000-00-00 00:00:00', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', null, '0', '0', '0', '0', '3');
INSERT INTO `nl_content` VALUES ('5', '2', '7', 'asdfsdaf', 'sadfd', 'sadf', 'asdf', '1', '0000-00-00 00:00:00', '0', 'dasf', '2013-10-16 18:42:52', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', null, '0', '0', '0', '0', '3');

-- ----------------------------
-- Table structure for `nl_content_sites`
-- ----------------------------
DROP TABLE IF EXISTS `nl_content_sites`;
CREATE TABLE `nl_content_sites` (
  `content_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) NOT NULL,
  `curl_url` varchar(255) NOT NULL,
  `enable` tinyint(1) DEFAULT '1',
  `description` mediumtext,
  `create_datetime` datetime NOT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `state` tinyint(3) DEFAULT '0' COMMENT '0-not yet started,1-inprocess',
  `approved_by` int(11) NOT NULL,
  PRIMARY KEY (`content_site_id`),
  UNIQUE KEY `id_UNIQUE` (`content_site_id`),
  KEY `approved_by` (`approved_by`),
  CONSTRAINT `nl_content_sites_ibfk_1` FOREIGN KEY (`approved_by`) REFERENCES `nl_admin_users` (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_content_sites
-- ----------------------------
INSERT INTO `nl_content_sites` VALUES ('1', 'Newyork Times Most Mailed', 'http://www.nytimes.com/most-popular-emailed', '1', 'Newyork Times Most Mailed', '2013-10-12 12:57:01', '2013-10-12 12:57:01', '0', '3');
INSERT INTO `nl_content_sites` VALUES ('2', 'Washingtonpost', 'http://www.washingtonpost.com/', '1', 'Washingtonpost ', '2013-10-12 13:02:49', '2013-10-12 13:02:49', '0', '3');
INSERT INTO `nl_content_sites` VALUES ('3', 'Salon', 'http://www.salon.com/', '1', 'Salon', '2013-10-12 13:03:49', '2013-10-12 13:03:49', '0', '3');
INSERT INTO `nl_content_sites` VALUES ('4', 'Los Angels Times', 'http://www.latimes.com/', '1', 'Los Angels Times home', '2013-10-12 13:05:22', '2013-10-12 13:05:22', '0', '3');
INSERT INTO `nl_content_sites` VALUES ('5', 'Politico', 'http://www.politico.com/', '1', 'Political News', '2013-10-12 13:08:25', '2013-10-12 13:08:25', '0', '3');
INSERT INTO `nl_content_sites` VALUES ('6', 'Techcrunch', 'http://techcrunch.com/', '1', 'Technical news', '2013-10-12 13:10:18', '2013-10-12 13:10:18', '0', '3');
INSERT INTO `nl_content_sites` VALUES ('7', 'Reddit - Politics', 'http://www.reddit.com/r/politics/', '1', '', '2013-10-12 13:15:36', '2013-10-12 13:15:36', '0', '3');
INSERT INTO `nl_content_sites` VALUES ('8', 'Sports Illurstrated', 'http://sportsillustrated.cnn.com/', '1', 'Sports', '2013-10-12 13:32:53', '2013-10-12 13:32:53', '0', '3');

-- ----------------------------
-- Table structure for `nl_content_temp`
-- ----------------------------
DROP TABLE IF EXISTS `nl_content_temp`;
CREATE TABLE `nl_content_temp` (
  `content_id` int(10) NOT NULL AUTO_INCREMENT,
  `master_category_id` int(11) NOT NULL,
  `content_site_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0-waiting for approval,1-approved',
  `created` datetime NOT NULL,
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(10) NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `urls` text,
  `attribs` varchar(5120) DEFAULT NULL,
  `ordering` int(11) DEFAULT '0',
  `access` int(10) unsigned DEFAULT '0',
  `hits` int(10) unsigned DEFAULT '0',
  `featured` tinyint(3) unsigned DEFAULT '0' COMMENT 'Set if article is featured.',
  `approved_by` int(11) NOT NULL COMMENT 'approved by admin in newstalkr',
  PRIMARY KEY (`content_id`),
  KEY `idx_access` (`access`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`master_category_id`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`master_category_id`),
  KEY `fk_nl_content_content_sites1_idx` (`content_site_id`),
  KEY `master_category_id` (`master_category_id`),
  KEY `approved_by` (`approved_by`),
  CONSTRAINT `nl_content_temp_ibfk_1` FOREIGN KEY (`master_category_id`) REFERENCES `nl_master_categories` (`master_category_id`),
  CONSTRAINT `nl_content_temp_ibfk_2` FOREIGN KEY (`content_site_id`) REFERENCES `nl_content_sites` (`content_site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nl_content_temp
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_curl_log`
-- ----------------------------
DROP TABLE IF EXISTS `nl_curl_log`;
CREATE TABLE `nl_curl_log` (
  `id` int(11) NOT NULL,
  `content_site_id` int(10) NOT NULL,
  `start_datetime` datetime NOT NULL,
  `result` tinyint(1) DEFAULT '0' COMMENT '0-error-1-success,',
  `error_code_id` int(10) NOT NULL COMMENT '1-404 error , 2-',
  `end_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nl_curl_log_content_sites1_idx` (`content_site_id`),
  KEY `fk_nl_curl_log_nl_error_code1_idx` (`error_code_id`),
  CONSTRAINT `nl_curl_log_ibfk_1` FOREIGN KEY (`content_site_id`) REFERENCES `nl_content_sites` (`content_site_id`),
  CONSTRAINT `nl_curl_log_ibfk_2` FOREIGN KEY (`error_code_id`) REFERENCES `nl_error_code` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_curl_log
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_devices`
-- ----------------------------
DROP TABLE IF EXISTS `nl_devices`;
CREATE TABLE `nl_devices` (
  `device_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `app_version` varchar(255) NOT NULL,
  `os_version` varchar(255) NOT NULL,
  `activated_datetime` datetime NOT NULL,
  PRIMARY KEY (`device_id`),
  KEY `fk_devices_nl_users1_idx` (`user_id`),
  CONSTRAINT `nl_devices_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `nl_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_devices
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_error_code`
-- ----------------------------
DROP TABLE IF EXISTS `nl_error_code`;
CREATE TABLE `nl_error_code` (
  `id` int(11) NOT NULL,
  `error_name` varchar(255) NOT NULL,
  `error_code` int(10) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_error_code
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_keywords`
-- ----------------------------
DROP TABLE IF EXISTS `nl_keywords`;
CREATE TABLE `nl_keywords` (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `content_id` int(10) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  KEY `fk_nl_content_keywords_nl_content1_idx` (`content_id`),
  CONSTRAINT `nl_keywords_ibfk_1` FOREIGN KEY (`content_id`) REFERENCES `nl_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_keywords
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_master_categories`
-- ----------------------------
DROP TABLE IF EXISTS `nl_master_categories`;
CREATE TABLE `nl_master_categories` (
  `master_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `img_src` varchar(255) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `modified_datetime` datetime DEFAULT NULL,
  `approved_by` int(11) NOT NULL,
  PRIMARY KEY (`master_category_id`),
  UNIQUE KEY `id_UNIQUE` (`master_category_id`),
  KEY `id` (`master_category_id`),
  KEY `approved_by` (`approved_by`),
  CONSTRAINT `nl_master_categories_ibfk_1` FOREIGN KEY (`approved_by`) REFERENCES `nl_admin_users` (`admin_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_master_categories
-- ----------------------------
INSERT INTO `nl_master_categories` VALUES ('2', 'Sports', '1', '', '2013-10-10 15:05:56', '2013-10-17 18:19:22', '3');
INSERT INTO `nl_master_categories` VALUES ('3', 'Politics', '1', '', '2013-10-10 15:07:58', '2013-10-10 15:14:21', '3');
INSERT INTO `nl_master_categories` VALUES ('5', 'World News', '1', '', '2013-10-12 12:44:21', '2013-10-12 12:44:21', '3');
INSERT INTO `nl_master_categories` VALUES ('6', 'News', '1', '', '2013-10-12 12:44:41', '2013-10-12 12:44:41', '3');
INSERT INTO `nl_master_categories` VALUES ('7', 'Gaming', '1', '', '2013-10-12 12:45:09', '2013-10-12 12:45:09', '3');
INSERT INTO `nl_master_categories` VALUES ('8', 'Technology', '1', '', '2013-10-12 12:45:23', '2013-10-12 12:45:23', '3');
INSERT INTO `nl_master_categories` VALUES ('9', 'Science', '1', '', '2013-10-12 12:45:40', '2013-10-12 12:45:40', '3');
INSERT INTO `nl_master_categories` VALUES ('10', 'Movies', '1', '', '2013-10-12 12:45:53', '2013-10-12 12:45:53', '3');
INSERT INTO `nl_master_categories` VALUES ('11', 'Health', '1', 'report.png', '2013-10-17 18:26:42', '2013-10-17 18:26:42', '3');

-- ----------------------------
-- Table structure for `nl_payments`
-- ----------------------------
DROP TABLE IF EXISTS `nl_payments`;
CREATE TABLE `nl_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `txn_id` varchar(100) NOT NULL,
  `txn_type` varchar(20) NOT NULL,
  `payment_date` datetime NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `residence_country` varchar(20) NOT NULL,
  `pending_reason` varchar(20) NOT NULL,
  `payment_gross` varchar(20) NOT NULL,
  `mc_currency` varchar(20) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `payer_status` varchar(20) NOT NULL,
  `verify_sign` varchar(150) NOT NULL,
  `test_ipn` varchar(20) NOT NULL,
  `payer_email` varchar(255) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `payer_id` varchar(150) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nl_payments_nl_users_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nl_payments
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_talkit`
-- ----------------------------
DROP TABLE IF EXISTS `nl_talkit`;
CREATE TABLE `nl_talkit` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) NOT NULL,
  `content_id` int(10) NOT NULL,
  `create_datetime` datetime NOT NULL,
  `first_talkit_datetime` datetime DEFAULT NULL,
  `state` tinyint(3) DEFAULT '0' COMMENT '0-not yet talkit,1-talkit now,2-talkit paused,3- talkit skipped,4- talkit completed',
  `talkit_completed_percentage` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_nl_talkit_nl_content1_idx` (`content_id`),
  KEY `fk_nl_talkit_nl_users1_idx` (`user_id`),
  CONSTRAINT `nl_talkit_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `nl_users` (`user_id`),
  CONSTRAINT `nl_talkit_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `nl_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_talkit
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_users`
-- ----------------------------
DROP TABLE IF EXISTS `nl_users`;
CREATE TABLE `nl_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `app_settings_email` varchar(255) NOT NULL,
  `app_settings_alert_frequency` varchar(100) NOT NULL,
  `block` tinyint(3) NOT NULL DEFAULT '0',
  `send_email` tinyint(3) DEFAULT '0',
  `register_date` datetime NOT NULL,
  `last_visit_date` datetime NOT NULL,
  `params` text,
  `device_name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `idx_name` (`name`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nl_users
-- ----------------------------
INSERT INTO `nl_users` VALUES ('1', 'kathir', 'kathir@newstalkr.com', '03c7c0ace395d80182db07ae2c30f034', '', '', '0', '0', '0000-00-00 00:00:00', '2013-10-17 10:46:14', null, 'iphone', '');
INSERT INTO `nl_users` VALUES ('2', 'vinothkumar', 'vinothkumar@newstalkr.com', '03c7c0ace395d80182db07ae2c30f034', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '', '');
INSERT INTO `nl_users` VALUES ('3', 'suresh', 'suresh@newstalkr.com', '03c7c0ace395d80182db07ae2c30f034', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '', '');
INSERT INTO `nl_users` VALUES ('4', 'ravi', 'ravi@newstalkr.com', '03c7c0ace395d80182db07ae2c30f034', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, 'iphone', '');
INSERT INTO `nl_users` VALUES ('5', 'sayee', 'sayee@newstalkr.com', '03c7c0ace395d80182db07ae2c30f034', '', '', '0', '0', '0000-00-00 00:00:00', '2013-10-15 06:22:14', null, 'iphone', '');
INSERT INTO `nl_users` VALUES ('6', 'c', 'c', '4a8a08f09d37b73795649038408b5f33', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '', '');
INSERT INTO `nl_users` VALUES ('7', 'kathiresan', 'c', '4a8a08f09d37b73795649038408b5f33', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '', '');
INSERT INTO `nl_users` VALUES ('8', 'a', 'admin', 'c4ca4238a0b923820dcc509a6f75849b', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '', '');
INSERT INTO `nl_users` VALUES ('9', 'check', 'check', '4a8a08f09d37b73795649038408b5f33', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '', '');
INSERT INTO `nl_users` VALUES ('10', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '', '');
INSERT INTO `nl_users` VALUES ('11', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '', '');
INSERT INTO `nl_users` VALUES ('12', 'demo', 'demo', '8277e0910d750195b448797616e091ad', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '', '');
INSERT INTO `nl_users` VALUES ('13', 'deepa', 'd', '8277e0910d750195b448797616e091ad', '', '', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', null, '', '');
INSERT INTO `nl_users` VALUES ('14', 'kathir', 'k', '8ce4b16b22b58894aa86c421e8759df3', '', '', '0', '0', '0000-00-00 00:00:00', '2013-10-15 07:33:14', null, '', '');

-- ----------------------------
-- Table structure for `nl_user_categories`
-- ----------------------------
DROP TABLE IF EXISTS `nl_user_categories`;
CREATE TABLE `nl_user_categories` (
  `user_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `note` varchar(255) NOT NULL,
  `description` mediumtext,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text,
  `metadata` varchar(2048) DEFAULT NULL COMMENT 'JSON encoded metadata properties.',
  PRIMARY KEY (`user_category_id`),
  KEY `cat_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_alias` (`alias`),
  KEY `fk_nl_categories_nl_users1_idx` (`user_id`),
  CONSTRAINT `nl_user_categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `nl_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nl_user_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_user_category_content`
-- ----------------------------
DROP TABLE IF EXISTS `nl_user_category_content`;
CREATE TABLE `nl_user_category_content` (
  `user_category_id` int(10) NOT NULL,
  `content_id` int(10) NOT NULL,
  `create_datetime` datetime NOT NULL,
  PRIMARY KEY (`content_id`,`user_category_id`),
  KEY `fk_nl_user_category_content_nl_user_categories1_idx` (`user_category_id`),
  KEY `fk_nl_user_category_content_nl_content1_idx` (`content_id`),
  KEY `user_category_id` (`user_category_id`),
  KEY `user_category_id_2` (`user_category_id`),
  CONSTRAINT `nl_user_category_content_ibfk_1` FOREIGN KEY (`user_category_id`) REFERENCES `nl_user_categories` (`user_category_id`),
  CONSTRAINT `nl_user_category_content_ibfk_2` FOREIGN KEY (`content_id`) REFERENCES `nl_content` (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_user_category_content
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_user_category_keyword`
-- ----------------------------
DROP TABLE IF EXISTS `nl_user_category_keyword`;
CREATE TABLE `nl_user_category_keyword` (
  `user_category_id` int(10) NOT NULL,
  `keyword_id` int(10) NOT NULL,
  PRIMARY KEY (`user_category_id`,`keyword_id`),
  KEY `fk_nl_user_category_keyword_nl_user_categories1_idx` (`user_category_id`),
  KEY `fk_nl_user_category_keyword_nl_content_keywords1_idx` (`keyword_id`),
  CONSTRAINT `nl_user_category_keyword_ibfk_1` FOREIGN KEY (`user_category_id`) REFERENCES `nl_user_categories` (`user_category_id`),
  CONSTRAINT `nl_user_category_keyword_ibfk_2` FOREIGN KEY (`keyword_id`) REFERENCES `nl_keywords` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of nl_user_category_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for `nl_user_log`
-- ----------------------------
DROP TABLE IF EXISTS `nl_user_log`;
CREATE TABLE `nl_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time_stamp` datetime NOT NULL,
  `ip_address` varchar(150) NOT NULL,
  `access_device` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0-destkop,1-mobile',
  `device_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_nl_user_log_nl_users1_idx` (`user_id`),
  KEY `fk_nl_user_log_devices1_idx` (`device_id`),
  CONSTRAINT `nl_user_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `nl_users` (`user_id`),
  CONSTRAINT `nl_user_log_ibfk_2` FOREIGN KEY (`device_id`) REFERENCES `nl_devices` (`device_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nl_user_log
-- ----------------------------

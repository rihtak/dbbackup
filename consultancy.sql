/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : consultancy

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2013-10-21 21:36:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `branch_info`
-- ----------------------------
DROP TABLE IF EXISTS `branch_info`;
CREATE TABLE `branch_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `branch_code` text NOT NULL,
  `branch_name` text NOT NULL COMMENT '1-main,2-sub',
  `city` text NOT NULL,
  `district` text NOT NULL,
  `address` text NOT NULL,
  `c_p_name` text NOT NULL COMMENT 'contact person name',
  `c_p_mobile` text NOT NULL COMMENT 'contact person no',
  `c_p_email` text NOT NULL COMMENT 'contact person email',
  `office_phone_no` text NOT NULL,
  `flag` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of branch_info
-- ----------------------------

-- ----------------------------
-- Table structure for `candidate_applied_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `candidate_applied_jobs`;
CREATE TABLE `candidate_applied_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of candidate_applied_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `candidate_experience`
-- ----------------------------
DROP TABLE IF EXISTS `candidate_experience`;
CREATE TABLE `candidate_experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `functional_area_id` int(11) NOT NULL,
  `total_experience_id` int(11) NOT NULL,
  `salary` text NOT NULL COMMENT 'per year',
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`,`functional_area_id`,`total_experience_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of candidate_experience
-- ----------------------------
INSERT INTO `candidate_experience` VALUES ('1', '1', '3', '4', '90000');
INSERT INTO `candidate_experience` VALUES ('2', '1', '5', '2', '90000');
INSERT INTO `candidate_experience` VALUES ('3', '1', '3', '4', '140000');

-- ----------------------------
-- Table structure for `candidate_info`
-- ----------------------------
DROP TABLE IF EXISTS `candidate_info`;
CREATE TABLE `candidate_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `father_name` text NOT NULL,
  `dob` date NOT NULL,
  `gender` int(11) NOT NULL,
  `photo_path` int(11) NOT NULL,
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `country` text NOT NULL,
  `state` text NOT NULL,
  `city` text NOT NULL,
  `pincode` text NOT NULL,
  `mobile_no` text NOT NULL,
  `experience_flag` int(11) NOT NULL COMMENT '0 fresher 1 experience',
  `skill_set_ids` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of candidate_info
-- ----------------------------
INSERT INTO `candidate_info` VALUES ('1', '0', '1', 'd', 'k', 'aa', '2013-05-04', '2', '0', 'a', 'b', 'b', 'd', 'e', 'f', '96000', '0', '1,4');
INSERT INTO `candidate_info` VALUES ('2', '0', '4', 'Simon', '', '', '0000-00-00', '0', '0', '', '', '', '', '', '', '98455 56780', '0', '');

-- ----------------------------
-- Table structure for `candidate_qualification`
-- ----------------------------
DROP TABLE IF EXISTS `candidate_qualification`;
CREATE TABLE `candidate_qualification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `graduation_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `year_passing` int(11) NOT NULL,
  `percentage` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of candidate_qualification
-- ----------------------------
INSERT INTO `candidate_qualification` VALUES ('1', '1', '1', '4', '2011', '89');
INSERT INTO `candidate_qualification` VALUES ('2', '1', '5', '382', '1999', '89');

-- ----------------------------
-- Table structure for `candidate_resume`
-- ----------------------------
DROP TABLE IF EXISTS `candidate_resume`;
CREATE TABLE `candidate_resume` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `resume_path` text NOT NULL,
  `tittle` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `candidate_id` (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of candidate_resume
-- ----------------------------

-- ----------------------------
-- Table structure for `company_info`
-- ----------------------------
DROP TABLE IF EXISTS `company_info`;
CREATE TABLE `company_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_name` text NOT NULL,
  `c_p_name` text NOT NULL COMMENT 'contact person name',
  `address_1` text NOT NULL,
  `address_2` text NOT NULL,
  `city` text NOT NULL,
  `state` text NOT NULL,
  `country` text NOT NULL,
  `zipcode` text NOT NULL,
  `phone_no` text NOT NULL,
  `email` text NOT NULL,
  `industry_type` int(11) NOT NULL,
  `no_of_employee` int(11) NOT NULL,
  `logo_path` text NOT NULL,
  `profile_path` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of company_info
-- ----------------------------
INSERT INTO `company_info` VALUES ('1', '0', '2', 'k', 'k', '', '', '', '', '', '', '', '', '0', '0', '', '');
INSERT INTO `company_info` VALUES ('2', '0', '3', 'Wooga', 'Rithak', '', '', '', '', '', '', '', '', '0', '0', '', '');

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` text NOT NULL,
  `graduation_id` int(11) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'B.Sc. - Hotel & Catering Management', '1', '2013-05-09 23:56:04');
INSERT INTO `course` VALUES ('2', 'B.Sc. - Computer Science', '1', '2013-05-09 23:56:04');
INSERT INTO `course` VALUES ('3', 'B.Sc. - Bio-Chemistry', '1', '2013-05-09 23:56:04');
INSERT INTO `course` VALUES ('4', 'B.Sc. - Microbiology', '1', '2013-05-09 23:56:04');
INSERT INTO `course` VALUES ('5', 'B.Sc. - Visual Communication', '1', '2013-05-09 23:56:04');
INSERT INTO `course` VALUES ('6', 'B.Com - Commerce', '1', '2013-05-09 23:56:04');
INSERT INTO `course` VALUES ('7', 'B.B.A - Business Administration', '1', '2013-05-09 23:56:04');
INSERT INTO `course` VALUES ('8', 'M.Sc. - Applied Microbiology', '2', '2013-05-09 23:56:04');
INSERT INTO `course` VALUES ('9', 'M.Sc. - Bio-Chemistry', '2', '2013-05-09 23:56:04');
INSERT INTO `course` VALUES ('10', 'M.Phil. - Bio-Chemistry', '2', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('11', 'B.A. Economics', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('12', 'B.Sc. Chemistry', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('13', 'B.Sc. Computer Science', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('14', 'B.Sc. Information Technology', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('15', 'B.Sc. Mathematics', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('16', 'B.Sc. Physics', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('17', 'B.Sc. Visual Communication', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('18', 'B.B.A. Business Administration', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('19', 'B.C.A. Computer Application', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('20', 'B.C.S. Corporate Secretaryship', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('21', 'B.Com. (Regular)', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('22', 'B.Com. Corporate Secretaryship', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('23', 'B.Lit. English', '1', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('24', 'M.A. Economics', '2', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('25', 'M.Com. (Regular)', '2', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('26', 'M.Sc. Chemistry', '2', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('27', 'M.Sc. Information Technology', '2', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('28', 'M.Sc. Mathematics', '2', '2013-05-09 23:56:05');
INSERT INTO `course` VALUES ('29', 'M.Sc. Physics', '2', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('30', 'M.Phil. Economics', '6', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('31', 'M.Phil. Mathematics', '6', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('32', 'M.Phil. Physics', '6', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('33', 'Ph.D. Economics', '6', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('34', 'Ph.D. Physics', '6', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('35', 'B.A. English', '1', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('36', 'B.A. History', '1', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('37', 'B.A. Tamil', '1', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('38', 'B.Sc. Bio-Chemistry', '1', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('39', 'B.Sc. Botany', '1', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('40', 'B.Sc. Geography', '1', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('41', 'B.Sc. Zoology', '1', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('42', 'M.A. English', '2', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('43', 'M.A. History', '2', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('44', 'M.B.E. Business Economics', '2', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('45', 'M.Sc. Applied Maths', '2', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('46', 'M.Sc. Bio-Chemistry', '2', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('47', 'M.Sc. Environmental Science', '2', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('48', 'M.Sc. Zoology', '2', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('49', 'M.Phil. Bio-Chemistry', '6', '2013-05-09 23:56:06');
INSERT INTO `course` VALUES ('50', 'M.Phil. English', '6', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('51', 'Ph.D. English', '6', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('52', 'B.Sc. Electronics', '1', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('53', 'B.B.M. Business Management', '1', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('54', 'M.A. Tamil', '2', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('55', 'M.Phil. Tamil', '6', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('56', 'B.A. Co-Operation', '1', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('57', 'B.A. Corporate Secretaryship', '1', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('58', 'B.A. Tourism & Travel Management', '1', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('59', 'M.Phil. Commerce', '6', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('60', 'Ph.D. Commerce', '6', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('61', 'M.Sc. Computer Science', '2', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('62', 'B.Sc. Bio-Technology', '1', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('63', 'M.S.W. Social Work', '2', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('64', 'M.Sc. Bio-Technology', '2', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('65', 'M.Sc. Micro Biology', '2', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('66', 'M.Phil. Chemistry', '6', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('67', 'B.Sc. Microbiology', '1', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('68', 'B.Sc. Nutrition & Dietetics', '1', '2013-05-09 23:56:07');
INSERT INTO `course` VALUES ('69', 'B.Sc. Psychology', '1', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('70', 'M.C.S. Corporate Secretaryship', '2', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('71', 'M.Sc. Foods & Nutrition', '2', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('72', 'M.Sc. Home Management', '2', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('73', 'M.Sc. Nutrition and Dietetics', '2', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('74', 'M.Sc. Plant Biotechnology', '2', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('75', 'M.Phil. History', '6', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('76', 'M.Phil. Zoology', '6', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('77', 'Ph.D. History', '6', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('78', 'Ph.D. Tamil', '6', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('79', 'Ph.D. Zoology', '6', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('80', 'B.A. Defence & Strategic Studies', '1', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('81', 'M.Sc. Bio-Informatics', '2', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('82', 'B.A. Political Science', '1', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('83', 'B.Sc. Home Science', '1', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('84', 'B.Sc. Interior Decoration', '1', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('85', 'M.Sc. Fashion Technology', '2', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('86', 'M.Sc. Textile & Clothing', '2', '2013-05-09 23:56:08');
INSERT INTO `course` VALUES ('87', 'M.Phil. Psychology', '6', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('88', 'B.A. Sociology', '1', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('89', 'B.Sc. Statistics', '1', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('90', 'M.A. Philosophy, Religion and Culture', '2', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('91', 'M.A. Sociology', '2', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('92', 'M.Sc. Biomedical Science', '2', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('93', 'M.Sc. Statistics', '2', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('94', 'M.Phil. Social Work', '6', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('95', 'M.Phil. Statistics', '6', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('96', 'Ph.D. Chemistry', '6', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('97', 'Ph.D. Mathematics', '6', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('98', 'Ph.D. Social Work', '6', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('99', 'Ph.D. Statistics', '6', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('100', 'B.Sc. Physical Education', '1', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('101', 'B.Lit. Tamil', '1', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('102', 'M.A. Mass Communication', '2', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('103', 'M.A. Public Administration', '2', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('104', 'M.Sc. Botany', '2', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('105', 'M.Phil. Botany', '6', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('106', 'M.Phil. Philosophy, Religious & Culture', '6', '2013-05-09 23:56:09');
INSERT INTO `course` VALUES ('107', 'Ph.D. Botany', '6', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('108', 'B.A. Arabic', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('109', 'M.A. Arabic', '2', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('110', 'B.Sc. Geology', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('111', 'M.A. Sanskrit', '2', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('112', 'M.Sc. Applied Microbiology', '2', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('113', 'M.Sc. Geology', '2', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('114', 'M.Phil. Sanskrit', '6', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('115', 'B.A. Music', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('116', 'B.A. Sanskrit', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('117', 'B.A. Social Work', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('118', 'B.S.W. Social Work', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('119', 'M.I.B. International Business', '2', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('120', 'M.Sc. Electronics', '2', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('121', 'B.Sc. Hotel Management & Catering Technology', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('122', 'B.Sc. Electronic Media', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('123', 'B.Sc. Electronics & Communication', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('124', 'B.A. Police Administration', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('125', 'B.Com. Computer Application', '1', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('126', 'M.Sc. Applied Electronics', '2', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('127', 'M.Sc. Food Service Management & Dietetics', '2', '2013-05-09 23:56:10');
INSERT INTO `course` VALUES ('128', 'M.Sc. Gene Technology', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('129', 'M.Sc. Electronic Media', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('130', 'B.D.S. Dental Surgery', '1', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('131', 'M.D.S. Community Dentistry', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('132', 'M.D.S. Conservative Dentistry', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('133', 'M.D.S. Oral & Maxillofacial Surgery', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('134', 'M.D.S. Oral Medicine', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('135', 'M.D.S. Oral Pathology', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('136', 'M.D.S. Orthodontics', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('137', 'M.D.S. Periodontics', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('138', 'M.D.S. Prosthodontics', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('139', 'M.D.S. Pedodontics', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('140', 'B.E. Computer Science and Engineering', '1', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('141', 'B.E. Electronics and Communication Engineering', '1', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('142', 'B.E. Electrical and Electronics Engineering', '1', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('143', 'B.E. Mechanical Engineering', '1', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('144', 'B.E. Civil Engineering', '1', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('145', 'B.Tech. Information Technology', '1', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('146', 'Master of Business Administration (MBA)', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('147', 'Master of Computer Application (MCA)', '2', '2013-05-09 23:56:11');
INSERT INTO `course` VALUES ('148', 'Mechanical Engineering', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('149', 'Electrical & Electronics Engineering', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('150', 'Electronics & Communication Engineering', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('151', 'Computer Science & Engineering', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('152', 'Bio Technology Bio Informatics', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('153', 'Bio-Medical Engineering', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('154', 'Electronics & Instrumentation Engineering', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('155', 'Information Technology', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('156', 'Mechatronics', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('157', 'Instrumentation & Control Engineering', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('158', 'Civil Engineering', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('159', 'Production Engineering', '1', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('160', 'Computer Aided Design (CAD)', '2', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('161', 'VLSI Design', '2', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('162', 'Optical Communication', '2', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('163', 'Applied Electronics', '2', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('164', 'Computer Science & Engineering', '2', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('165', 'Advanced Communication System', '2', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('166', 'Power Electrical & Drives', '2', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('167', 'Information Technology', '2', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('168', 'Advanced Computing', '2', '2013-05-09 23:56:12');
INSERT INTO `course` VALUES ('169', 'Digital Communication & Networking', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('170', 'Embedded System Technologies', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('171', 'Thermal Engineering', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('172', 'Manufacture Engineering', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('173', 'Structural Engineering', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('174', 'Software Engineering', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('175', 'Instrumentation Engineering', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('176', 'M.B.A. - Master of Business Administration', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('177', 'M.C.A. - Master of Computer Applications', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('178', 'B.E. - Electronics and Communication Engineering', '1', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('179', 'B.E. - Electrical and Electronics Engineering', '1', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('180', 'B.E. - Computer Science and Engineering', '1', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('181', 'B.E. - Mechanical Engineering', '1', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('182', 'B.E. - Civil Engineering', '1', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('183', 'B.Tech. - Information Technology', '1', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('184', 'M.C.A. - Master of Computer Applications (3 Years)', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('185', 'M.B.A. - Master of Business Administration (2 Years *The courses offered by ACT are accredited by NBA.', '2', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('186', 'B.Arch. Architecture', '1', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('187', 'B.Tech. Aeronautical Engineering', '1', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('188', 'B.Tech. Automobile Engineering', '1', '2013-05-09 23:56:13');
INSERT INTO `course` VALUES ('189', 'B.Tech. Civil Engineering', '1', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('190', 'B.Tech. Computer Science', '1', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('191', 'B.Tech. Electrical & Electronics', '1', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('192', 'B.Tech. Electronics & Communication', '1', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('193', 'B.Tech. Electronics & Instrumentation', '1', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('194', 'B.Tech. Mechanical Engineering', '1', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('195', 'B.Tech. Polymer Technology', '1', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('196', 'M.Tech. System Engineering & Operations Research', '2', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('197', 'M.Tech. Structural Engineering', '2', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('198', 'M.Tech. Construction Engineering and Project Management', '2', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('199', 'M.Tech. CAD â€“ CAM', '2', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('200', 'M.Tech. Manufacturing Engineering', '2', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('201', 'M.Tech. Polymer Technology (Specialization in Nanotechnology)', '2', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('202', 'M.Tech. Power System Engineering', '2', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('203', 'M.Tech. Power Electronics and Drives', '2', '2013-05-09 23:56:14');
INSERT INTO `course` VALUES ('204', 'M.Tech. Software Engineering', '2', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('205', 'M.Tech. Computer Science & Engineering', '2', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('206', 'M.Tech. Communication Systems', '2', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('207', 'M.Tech. VLSI & Embedded Systems', '2', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('208', 'M.Tech. Electronics and Instrumentation Engineering', '2', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('209', 'M.Tech. Information Technology', '2', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('210', 'M.Tech. Optoelectronics & Laser Technology', '2', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('211', 'Bachelor of Dental Surgery (B.D.S.)', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('212', 'B.Sc. (Nursing)', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('213', 'Bachelor of Physiotherapy (B.P.T.)', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('214', 'Master of Physiotherapy (M.P.T.)', '2', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('215', 'Industrial Bio - Technology', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('216', 'Instrumentation and Control Engineering', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('217', 'Bio Medical Instrumentation Engineering', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('218', 'Chemical Engineering', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('219', 'Computer & Software Systems Engineering', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('220', 'Mechatronics Engineering', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('221', 'Bio - Informatics', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('222', 'Bio - Technology', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('223', 'Electronics & Tele-Communication Systems Engineering', '1', '2013-05-09 23:56:15');
INSERT INTO `course` VALUES ('224', 'B.Tech Applied Electronics', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('225', 'B.Tech Bio - Technology', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('226', 'B.Tech Communication System Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('227', 'B.Tech Computer Science Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('228', 'B.Tech Computer Systems & Networking Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('229', 'B.Tech Computer Integrated Manufacturing Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('230', 'B.Tech Computer Aided Design Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('231', 'B.Tech Industrial Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('232', 'B.Tech Machine Design Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('233', 'B.Tech Power Electronics & Drives Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('234', 'B.Tech VLSI Design and Embedded System Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('235', 'MBA (Full Time / Part Time)', '2', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('236', 'MCA (Full Time / Part Time)', '2', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('237', 'Engineering & Technology - 3 years', '2', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('238', 'B.E. - Marine Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('239', 'B.E. - Aeronautical Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('240', 'B.E. - Automobile Engineering', '1', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('241', 'M.E. - CAD', '2', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('242', 'M.E. - Computer Science and Engineering', '2', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('243', 'M.E. - Communication Systems', '2', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('244', 'M.E. - Embedded System Technologies', '2', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('245', 'M.E. - Computer Integrated Manufacturing', '2', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('246', 'M.E. - Engineering Design', '2', '2013-05-09 23:56:16');
INSERT INTO `course` VALUES ('247', 'M.E. - Computer Networks', '2', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('248', 'M.E â€“ Software Engineering', '2', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('249', 'M.C.A. - Master of Computer Application', '2', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('250', 'M.Sc. - Information Technology', '2', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('251', 'B.Tech. Biomedical Engineering', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('252', 'B.E. Computer Science & Engineering', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('253', 'B.E. Electronics and Communications Engineering', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('254', 'M.E. - Applied Electronics', '2', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('255', 'M.E. - Computer Science & Engineering', '2', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('256', 'M.E. - Power Electronics & Drives', '2', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('257', 'Master of Computer Applications (MCA)', '2', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('258', 'B.E. - Electronics and Communication Engineering - ECE', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('259', 'B.E. - Electrical and Electronics Engineering - EEE', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('260', 'B.E. - Computer Science and Engineering - CSE', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('261', 'B.E. - Mechanical Engineering (MECH)', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('262', 'B.E. - Electrical & Electronics Engineering (EEE)', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('263', 'B.E. - Electronics & Communication Engineering (ECE)', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('264', 'B.E. - Computer Science & Engineering (CSE)', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('265', 'B.E. - Civil Engineering (CIVIL)', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('266', 'B.Tech. - Information Technology (IT)', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('267', 'Aeronautical Engineering', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('268', 'Computer Science and Engineering', '1', '2013-05-09 23:56:17');
INSERT INTO `course` VALUES ('269', 'Electrical & Electronics', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('270', 'Engineering Information Technology', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('271', 'M.E. Computer Science', '2', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('272', 'M.E. Applied Electronics Management Studies', '2', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('273', 'B.E. - Electronics & Instrumentation Engineering (EIE)', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('274', 'B.Tech. Plastic Technology', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('275', 'M.Tech. Plastic Technology', '2', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('276', 'B.E. Apparel Technology', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('277', 'B.Tech. Ceramic Technology', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('278', 'B.Tech. Chemical Engineering', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('279', 'B.Tech. Food Technology', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('280', 'B.Tech. Industrial Bio-Technology', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('281', 'B.Tech. Leather Technology', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('282', 'B.Tech. Petroleum Refining and Petro Chemical Tech', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('283', 'B.Tech. Pharmaceutical Technology', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('284', 'B.Tech. Textile Technology', '1', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('285', 'M.E. Environmental Science & Technology', '2', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('286', 'M.E. Food Technology', '2', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('287', 'M.E. Leather Technology', '2', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('288', 'M.Tech. Bio-Pharmaceutical Engineering', '2', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('289', 'M.Tech. Bio-Technology', '2', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('290', 'M.Tech. Ceramic Technology', '2', '2013-05-09 23:56:18');
INSERT INTO `course` VALUES ('291', 'M.Tech. Chemical Engineering', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('292', 'M.Tech. Footwear Science and Engineering', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('293', 'M.Tech. Petroleum Refining and Petrochemicals', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('294', 'M.Tech. Textile Technology', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('295', 'B.E. Agriculture and Irrigation Engineering', '1', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('296', 'B.E. Bio-Medical Engineering', '1', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('297', 'B.E. Civil Engineering - Tamil Medium', '1', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('298', 'B.E. Geo Informatics', '1', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('299', 'B.E. Industrial Engineering', '1', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('300', 'B.E. Manufacturing Engineering', '1', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('301', 'B.E. Material Science and Engineering', '1', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('302', 'B.E. Mechanical Engineering - Tamil Medium', '1', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('303', 'B.E. Mining Engineering', '1', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('304', 'B.E. Printing Technology', '1', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('305', 'M.E. Applied Electronics', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('306', 'M.E. Communication Systems', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('307', 'M.E. Computer Aided Design', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('308', 'M.E. Computer Integrated Manufacturing', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('309', 'M.E. Computer Science and Engineering', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('310', 'M.E. Construction Engineering and Management', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('311', 'M.E. Control & Instrumentation Engineering', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('312', 'M.E. Embedded Systems Technology', '2', '2013-05-09 23:56:19');
INSERT INTO `course` VALUES ('313', 'M.E. Energy Engineering', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('314', 'M.E. Engineering Design', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('315', 'M.E. Environmental Engineering', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('316', 'M.E. Environmental Management', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('317', 'M.E. Geo-Informatics', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('318', 'M.E. High Voltage Engineering', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('319', 'M.E. Hydrology and Water Resources Engineering', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('320', 'M.E. Industrial Engineering', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('321', 'M.E. Internal Combustion Engineering', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('322', 'M.E. Irrigation Water Management', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('323', 'M.E. Manufacturing System & Management', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('324', 'M.E. Medical Electronics', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('325', 'M.E. Multimedia Technology', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('326', 'M.E. Optical Communication Engineering', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('327', 'M.E. Power Electronics and Drives', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('328', 'M.E. Power Systems Engineering', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('329', 'M.E. Printing Technology', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('330', 'M.E. Product Design and Development', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('331', 'M.E. Quality Engineering and Management', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('332', 'M.E. Refrigeration & Air Conditioning', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('333', 'M.E. Software Engineering', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('334', 'M.E. Soil Mechanics and Foundation Engineering', '2', '2013-05-09 23:56:20');
INSERT INTO `course` VALUES ('335', 'M.E. Structural Engineering', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('336', 'M.E. System Engineering & Operation Research', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('337', 'M.E. Urban Engineering', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('338', 'M.E. VLSI Design', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('339', 'M.Tech. Bio-Medical Engineering', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('340', 'M.Tech. Costal Management', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('341', 'M.Tech. Nano Science and Technology', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('342', 'M.Tech. Polymer Science and Engineering', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('343', 'M.Tech. Remote Sensing', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('344', 'B.E. Aeronautical Engineering', '1', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('345', 'B.E. Automobile Engineering', '1', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('346', 'B.E. Electronics And Instrumentation Engineering', '1', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('347', 'B.E. Production Engineering', '1', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('348', 'B.Tech. Rubber and Plastic Technology', '1', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('349', 'M.E. Aeronautical Engineering', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('350', 'M.E. Automobile Engineering', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('351', 'M.E. Avionics', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('352', 'M.E. Communication and Networking', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('353', 'M.E. Instrumentation Engineering', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('354', 'M.E. Manufacturing Engineering', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('355', 'M.E. Mechatronics', '2', '2013-05-09 23:56:21');
INSERT INTO `course` VALUES ('356', 'B.Tech. Bio Technology', '1', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('357', 'M.E. CAD/CAM Engineering', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('358', 'M.Sc. Computer Technology (Integrated)', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('359', 'B.Arch. Interior Design', '1', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('360', 'B.E. Petroleum Engineering', '1', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('361', 'B.Tech. Bio Informatics Engineering', '1', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('362', 'B.Tech. TeleCommunication Engineering', '1', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('363', 'M.E. Computer and Communication Engineering', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('364', 'M.E. Digital Communication and Network Engineering', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('365', 'M.E. Electronics Engineering', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('366', 'M.E. Network Engineering', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('367', 'M.E. Thermal Engineering', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('368', 'M.Tech. Bio-Informatics', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('369', 'M.Arch. Digital Architecture', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('370', 'B.E. Instrumentation and Control Engineering', '1', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('371', 'M.E. CAD', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('372', 'M.E. Embedded System', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('373', 'M.E. Pervasive Computing Technology', '2', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('374', 'B.H.M.S Homoeopathic Medicine and Surgery', '1', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('375', 'Dip. in Hotel Management & Catering Technology', '3', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('376', 'Certificate Course in Food & Beverage Service', '5', '2013-05-09 23:56:22');
INSERT INTO `course` VALUES ('377', 'Certificate Course in Front Office Management', '5', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('378', 'Certificate Course in Hotel Management', '5', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('379', 'Certificate Course in Waiter in Flight & Railway Catering', '5', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('380', 'M.Sc. Hotel Management & Catering Science', '2', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('381', 'Post Dip. in Hotel Management', '4', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('382', 'Certificate Course in Bakery & Confectionary', '5', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('383', 'Certificate Course in Food & Beverage Production', '5', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('384', 'Certificate Course in House Keeping', '5', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('385', 'Dip. in Culinary Arts Management', '3', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('386', 'Dip. in Hospitality & Restaurant Management', '3', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('387', 'Dip. in Pastry & Confectionary Arts', '3', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('388', 'Post Dip. in Hospitality Management', '4', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('389', 'B.Sc. Catering & Hotel Administration', '1', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('390', 'M.B.A. Business Administration', '2', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('391', 'M.C.A. Computer Applications', '2', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('392', 'P.G.P.M Post Graduate Programme in Management', '2', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('393', 'P.G.D.B.M Business Management', '4', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('394', 'P.G.D.F.M Financial Management', '4', '2013-05-09 23:56:23');
INSERT INTO `course` VALUES ('395', 'P.G.D.M Post Graduate Diploma in Management', '4', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('396', 'P.G.D.B.A Business Administration', '4', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('397', 'M.D. Radiothrapy', '2', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('398', 'D.M. Oncology', '2', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('399', 'M.Ch. Surgical Oncology', '2', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('400', 'Diploma in Radio Therapy', '3', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('401', 'M.D. Pathology', '2', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('402', 'Diploma in Clinical Pathology', '3', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('403', 'M.B.B.S. Medicine and Surgery', '1', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('404', 'M.D. Anaesthesiology', '2', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('405', 'M.D. General Medicine', '2', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('406', 'M.D. Microbiology', '2', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('407', 'M.D. Obstetrtics & Gynaecology', '2', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('408', 'M.D. Paediatrics', '2', '2013-05-09 23:56:24');
INSERT INTO `course` VALUES ('409', 'M.S. ENT', '2', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('410', 'M.S. General Surgery', '2', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('411', 'M.S. Orthopaedics', '2', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('412', 'D.M. Gastroenterology', '2', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('413', 'D.M. Nephrology', '2', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('414', 'M.Ch. Plastic Surgery', '2', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('415', 'M.Ch. Urology/Genito-Urinary Surgery', '2', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('416', 'Diploma in Anesthesia', '3', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('417', 'Diploma in Child Health', '3', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('418', 'Diploma in Obstetrics & Gynaecology', '3', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('419', 'Diploma in Orthopaedics', '3', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('420', 'Diploma in Oto-Rhino-Laryngology', '3', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('421', 'M.D. Anatomy', '2', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('422', 'M.D. Bio-Chemistry', '2', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('423', 'M.D. Community Medicine', '2', '2013-05-09 23:56:25');
INSERT INTO `course` VALUES ('424', 'M.D. Dermatology, Venereology and Leprosy', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('425', 'M.D. Forensic Medicine', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('426', 'M.D. Geriatrics', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('427', 'M.D. Pharmacology', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('428', 'M.D. Physiology', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('429', 'M.D. Psychiatry', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('430', 'M.D. Radio Diagnosis / Radiology', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('431', 'M.D. Tuberculosis and Respiratory Diseases', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('432', 'M.D. Venereology', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('433', 'M.S. Anatomy', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('434', 'M.S. Ophthalmology', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('435', 'D.M. Cardiology', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('436', 'D.M. Clinical Haematology', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('437', 'D.M. Neurology', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('438', 'D.M. Rheumatology', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('439', 'M.Ch. Endocrine Surgery', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('440', 'M.Ch. Neuro Surgery', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('441', 'M.Ch. Paediatric Surgery', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('442', 'M.Ch. Thoracic Surgery', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('443', 'M.Ch. Vascular Surgery', '2', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('444', 'Diploma in Dermatology, Venereology and Leprosy', '3', '2013-05-09 23:56:26');
INSERT INTO `course` VALUES ('445', 'Diploma in Diabetology', '3', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('446', 'Diploma in Ophthalmology', '3', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('447', 'Diploma in Physical Medicine and Rehabilitation', '3', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('448', 'Diploma in Psychological Medicine', '3', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('449', 'Diploma in Public Health', '3', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('450', 'Diploma in Radio-Diagnosis', '3', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('451', 'Diploma in Tuberculosis and Chest Diseases', '3', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('452', 'M.Ch. Surgical Gastroenterology', '2', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('453', 'M.Ch. Cardio Thoracic Surgery', '2', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('454', 'B.Sc. Nursing', '1', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('455', 'M.Sc. Community Health Nursing', '2', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('456', 'M.Sc. Medical Surgical Nursing', '2', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('457', 'M.Sc. Obstretics and Gynaecology Nursing', '2', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('458', 'M.Sc. Paediatric Nursing', '2', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('459', 'M.Sc. Pshyciatric Nursing', '2', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('460', 'B.O.T. Occupational Therapy', '1', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('461', 'B.Pharm. Pharmacy', '1', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('462', 'M.Pharm. Pharmaceutical Chemistry', '2', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('463', 'M.Pharm. Pharmaceutics', '2', '2013-05-09 23:56:27');
INSERT INTO `course` VALUES ('464', 'M.Pharm. Pharmacognosy', '2', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('465', 'M.Pharm. Pharmacology', '2', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('466', 'M.Pharm. Pharmaceutical Analysis', '2', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('467', 'D.Pharm. Pharmacy', '3', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('468', 'M.Pharm. Pharmacy Practice', '2', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('469', 'M.Pharm. Quality Assurance', '2', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('470', 'B.P.T. Physiotherapy', '1', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('471', 'M.P.T. Advanced P.T. in Cardio Pulmonary Diseases', '2', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('472', 'M.P.T. Advanced P.T. in Neurology', '2', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('473', 'M.P.T. Advanced P.T. in Orthopaedics', '2', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('474', 'M.P.T. Hand Conditions', '2', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('475', 'M.P.T. Sports Physiotherapy', '2', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('476', 'Dip. in Automobile Engineering', '3', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('477', 'Dip. in Civil Engineering', '3', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('478', 'Dip. in Electrical and Electronics Engineering', '3', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('479', 'Dip. in Instrumentation and Control Engineering', '3', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('480', 'Dip. in Mechanical Engineering', '3', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('481', 'Dip. in Mechanical Engineering (Foundry)', '3', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('482', 'Dip. in Mechanical Engineering (Refrigeration and Ac)', '3', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('483', 'Post Dip. in Refrigeration and AC', '4', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('484', 'Dip. in Computer Engineering', '3', '2013-05-09 23:56:28');
INSERT INTO `course` VALUES ('485', 'Dip. in Electronics and Communication Engineering', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('486', 'Dip. in Fisheries Technology', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('487', 'Dip. in Marine Engineering', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('488', 'Dip. in Prosthetics And Orthotics', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('489', 'Post Dip. in Industrial Engineering', '4', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('490', 'Post Dip. in Structural Engineering', '4', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('491', 'Dip. in Architectural Assistantship', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('492', 'Dip. in Environmental Pollution and Control', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('493', 'Dip. in Garment Technology', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('494', 'Dip. in Modern Office Practice', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('495', 'Dip. in Mechanical Engineering (Tool and Die Design)', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('496', 'Post Dip. in Die and Tool Design', '4', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('497', 'Dip. in Chemical Engineering', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('498', 'Dip. in Polymer Technology', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('499', 'Dip. in Leather Technology', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('500', 'Dip. in Printing Technology', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('501', 'Dip. in Textile Technology', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('502', 'Post Dip. in Computer Aided Textile Manufacturing', '4', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('503', 'Dip. in Direction, Screen Play Writing and T V Production', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('504', 'Dip. in Film Editing and T V Production', '3', '2013-05-09 23:56:29');
INSERT INTO `course` VALUES ('505', 'Dip. in Film Tech and T V Production (Cinematography)', '3', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('506', 'Dip. in Film Tech and T V Production (Film Processing)', '3', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('507', 'Dip. in Film Tech and T V Production (Sound Recording and', '3', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('508', 'Certificate Course in Acting', '5', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('509', 'Post Dip. in Industrial Safety', '4', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('510', 'Dip. in Information Technology', '3', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('511', 'Dip. in Electronics (Robotics)', '3', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('512', 'B.S.M.S Siddha Medicine and Surgery', '1', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('513', 'M.D. (Siddha) Gunapadam', '2', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('514', 'M.D. (Siddha) Maruthuvam', '2', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('515', 'M.D. (Siddha) Kuzanthai Maruthuvam', '2', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('516', 'M.D. (Siddha) Noi Nadal', '2', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('517', 'M.D. (Siddha) Sirappu Maruthuvam', '2', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('518', 'B.Ed. Education', '1', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('519', 'D.T.Ed. Dip. in Teacher Education', '3', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('520', 'M.Ed. Education', '2', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('521', 'B.P.Ed. Physical Education', '1', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('522', 'M.P.Ed. Physical Education', '2', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('523', 'P.G.D. Communicative Skills', '4', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('524', 'P.G.D.C.A Computer Applications', '4', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('525', 'B.Sc. Hotel Management & Catering Science', '1', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('526', 'M.D. Physical Medicine & Rehabilitation', '2', '2013-05-09 23:56:30');
INSERT INTO `course` VALUES ('527', 'M.D. Radiology', '2', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('528', 'M.Sc. E-Commerce & Web Design', '2', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('529', 'M.Sc. Information Science & Management', '2', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('530', 'M.Sc. Organic Chemistry', '2', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('531', 'M.Sc. Software Science (Integrated )', '2', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('532', 'M.Phil. Microbiology', '6', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('533', 'Ph.D. Microbiology', '6', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('534', 'M.Sc. Industrial Microbiology', '2', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('535', 'M.Com. Computer Applications', '2', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('536', 'Dip. in Mechatronics Engineering', '3', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('537', 'M.Phil. Computer Science', '6', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('538', 'B.Sc. Fashion Technology', '1', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('539', 'B.Sc. Textile & Fashion Designing', '1', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('540', 'M.Phil. Bio-Technology', '6', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('541', 'Ph.D. Bio-Chemistry', '6', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('542', 'Ph.D. Bio-Technology', '6', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('543', 'P.G.D. Business Administration', '4', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('544', 'P.G.D. Operations Research', '4', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('545', 'B.A. Psychology', '1', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('546', 'M.Sc. Applied Physics', '2', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('547', 'M.Phil. Communication & Journalism', '6', '2013-05-09 23:56:31');
INSERT INTO `course` VALUES ('548', 'M.Phil. Electronics', '6', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('549', 'M.Phil. Environmental Science', '6', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('550', 'M.Phil. Foods & Nutrition', '6', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('551', 'B.Com. E-Commerce', '1', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('552', 'M.A. Business Economics', '2', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('553', 'M.Phil. Management', '6', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('554', 'Ph.D. Business Management', '6', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('555', 'B.Com. Co-Operation', '1', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('556', 'M.A. Co-operation', '2', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('557', 'M.Com. Co-Operation', '2', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('558', 'M.Phil. Co-Operation', '6', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('559', 'B.Lit. Economics', '1', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('560', 'M.Com. Finance & Control', '2', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('561', 'M.A. Applied Psychology', '2', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('562', 'M.Com. International Business', '2', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('563', 'M.F.C. Finance & Control', '2', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('564', 'M.Sc. Software Systems (Integrated )', '2', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('565', 'M.Sc. Costume Design & Fashion Technology', '2', '2013-05-09 23:56:32');
INSERT INTO `course` VALUES ('566', 'P.G.D. Bio-Informatics', '4', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('567', 'P.G.D. International Business', '4', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('568', 'P.G.D. Marketing Management', '4', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('569', 'P.G.D. Multimedia System', '4', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('570', 'P.G.D. Tourism and Travel Management', '4', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('571', 'M.Phil. Communication', '6', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('572', 'B.Sc. Clinical Lab Technology', '1', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('573', 'M.Com. Corporate Secretaryship', '2', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('574', 'M.Sc. Hospital Administration', '2', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('575', 'P.G.D. Clinical Lab Technician', '4', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('576', 'P.G.D. Hospital Health Care Management', '4', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('577', 'M.Sc. Computer Communication', '2', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('578', 'M.Sc. Industrial Biotechnology', '2', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('579', 'M.Phil. Business Management', '6', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('580', 'P.G.D. Banking Management', '4', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('581', 'B.Sc. Textile & Clothing', '1', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('582', 'M.Phil. Costume Design & Fashion Technology', '6', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('583', 'M.Phil. Hindi', '6', '2013-05-09 23:56:33');
INSERT INTO `course` VALUES ('584', 'M.Sc. Advanced Communication System', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('585', 'M.Sc. Finance & Computer Applications', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('586', 'M.Sc. Electronics & Communication', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('587', 'M.Sc. Foreign Trade Policy', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('588', 'Aeronautical Engineering(AE)', '1', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('589', 'Computer Science and Engineering(CSE)', '1', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('590', 'Electrical and Electronics Engineering(EEE)', '1', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('591', 'Electronics and Communication Engineering(ECE)', '1', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('592', 'Mechanical Engineering(ME)', '1', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('593', 'B.E-Mechatronics Engineering', '1', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('594', 'Master of Business Administration(MBA)', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('595', 'Master of Computer Application(MCA)', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('596', 'M.E Aeronautical Engineering', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('597', 'M.E Communication Systems', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('598', 'B.Sc. Applied Science', '1', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('599', 'B.Sc. Computer Technology', '1', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('600', 'M.E. Heat Power Engineering', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('601', 'M.Sc. Computer Technology', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('602', 'M.Sc. Software Engineering (Integrated)', '2', '2013-05-09 23:56:34');
INSERT INTO `course` VALUES ('603', 'B.E. Metallurgical Engineering', '1', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('604', 'B.Tech. Fashion Technology', '1', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('605', 'B.Sc. Apparel and Fashion Technology', '1', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('606', 'M.E. Control Systems Engineering', '2', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('607', 'M.E. Electrical Machines', '2', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('608', 'M.E. Industrial Metallurgy', '2', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('609', 'M.E. Infrastructure Engineering', '2', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('610', 'M.E. Lean Manufacturing', '2', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('611', 'M.E. Product Design and Commerce', '2', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('612', 'M.E. Production Engineering', '2', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('613', 'M.Sc. Materials Science', '2', '2013-05-09 23:56:35');
INSERT INTO `course` VALUES ('614', 'B.E. Mechatronics Engineering', '1', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('615', 'M.Tech. Apparel Technology & Management', '2', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('616', 'B.E. Marine Engineering', '1', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('617', 'B.Tech. Environmental Engineering', '1', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('618', 'M.O.T. Advanced O.T. Neurology', '2', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('619', 'M.O.T. Advanced O.T. Orthopaedics', '2', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('620', 'M.O.T. Advanced O.T. Paediatrics', '2', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('621', 'M.O.T. Advanced O.T. Psychiatry', '2', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('622', 'M.Pharm. Pharmaceutical Bio Technology', '2', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('623', 'M.P.T. Advanced P.T. in Obstetrics & Gynaecology', '2', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('624', 'M.P.T. Paediatric Neurology', '2', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('625', 'Dip. in Textile Processing', '3', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('626', 'Dip. in Apparel Technology', '3', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('627', 'Dip. in Computer Networking', '3', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('628', 'Dip. in Mechanical Engineering (Design and Drafting)', '3', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('629', 'Post Dip. in Computer Applications', '4', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('630', 'Dip. in Computer Science and Engineering', '3', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('631', 'Dip. in Fashion Technology', '3', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('632', 'Dip. in Automobile Technology', '3', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('633', 'B.Sc. Software Engineering', '1', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('634', 'B.A.M.S Ayurvedic Medicine and Surgery', '1', '2013-05-09 23:56:36');
INSERT INTO `course` VALUES ('635', 'B.E Civil Engineering', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('636', 'B.E Computer Science and Engineering', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('637', 'B.E Electronics and Communication Engineering', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('638', 'B.E Electrical and Electronics Engineering', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('639', 'B.E Mechanical Engineering', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('640', 'M.E Computer Science Engineering', '2', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('641', 'M.E Applied Electronics', '2', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('642', 'B.E - Computer Science and Engineering', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('643', 'B.E - Electrical & Electronics Engineering', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('644', 'B.E - Electronics & Communication Engineering', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('645', 'B.E - Mechanical Engineering', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('646', 'B.E - Electronics And Instrumentations B.E. - Civil Engineering B.Tech. - Information Technology', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('647', 'B.Tech Information Technology', '1', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('648', 'M.C.A Master of Computer Applications', '2', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('649', 'M.B.A Master of Business Administration', '2', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('650', 'M.P.T. Advanced P.T. in Paediatric Neurology', '2', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('651', 'Dip. in Petrochemical Engineering', '3', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('652', 'M.Pharm. Industrial Pharmacy', '2', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('653', 'Dip. in Ceramic Technology', '3', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('654', 'Dip. in Agriculture Technology', '3', '2013-05-09 23:56:37');
INSERT INTO `course` VALUES ('655', 'B.Sc. Bio-Informatics', '1', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('656', 'M.Sc. Analytical Chemistry', '2', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('657', 'M.Sc. Food Processing', '2', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('658', 'M.Sc. Textile & Fashion Designing', '2', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('659', 'Electronics & Communication Engg', '1', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('660', 'Electrical and Electronics Engg.', '1', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('661', 'Electronics & Instrumentation Engg.', '1', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('662', 'M.E. Computer Science & Engg', '2', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('663', 'M.E.Power Electronics & Drives', '2', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('664', 'M.E.VLSI Design', '2', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('665', 'Master of Computer Applications', '2', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('666', 'Master of Business Administration', '2', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('667', 'Computer Science & Engineering', '6', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('668', 'Electronics & Communication Engg', '6', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('669', 'Management Studies', '6', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('670', 'M.Sc. Information Technology (Integrated)', '2', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('671', 'B.E. Medical Electronics Engineering', '1', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('672', 'M.P.T. Community Physiotherapy', '2', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('673', 'Dip. in Metallurgy', '3', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('674', 'Dip. in Textile Technology (Knitting)', '3', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('675', 'Certificate Course in Hotel Operation & Management', '5', '2013-05-09 23:56:38');
INSERT INTO `course` VALUES ('676', 'Dip. in Production Engineering', '3', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('677', 'Dip. in Petrochemical Technology', '3', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('678', 'Dip. in Chemical Technology', '3', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('679', 'M.Phil. Corporate Secretaryship', '6', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('680', 'M.Sc. Software Systems', '2', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('681', 'B.Sc. Costume Design & Fashion', '1', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('682', 'B.Sc. Industrial Electronics', '1', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('683', 'M.Sc. Software Science', '2', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('684', 'B.A. Geography', '1', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('685', 'B.Sc. Hospital Management', '1', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('686', 'M.Sc. Industrial Electronics', '2', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('687', 'B.A. Indian Culture', '1', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('688', 'M.Sc. Industrial Chemistry', '2', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('689', 'B.Sc. Applied Physics', '1', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('690', 'M.Sc. Visual Communication', '2', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('691', 'B.Sc. Hotel Management', '1', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('692', 'M.Sc. Cyber Technology', '2', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('693', 'M.Tech. Renewable Energy', '2', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('694', 'M.E. Highway and Transport Management', '2', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('695', 'Post Dip. in Construction Technology', '4', '2013-05-09 23:56:39');
INSERT INTO `course` VALUES ('696', 'Post Dip. in Interior Design', '4', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('697', 'M.A. Applied Economics', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('698', 'M.Sc. Wildlife Biology', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('699', 'B.E - Civil Engineering', '1', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('700', 'B.E - Electronics and Communication Engineering', '1', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('701', 'B.E - Electrical and Electronics Engineering', '1', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('702', 'B.Tech - Information Technology', '1', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('703', 'B.E â€“ Bio-Medical Engineering', '1', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('704', 'Â ', '1', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('705', 'M.E - Power Electronics & Drives', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('706', 'M.E - Applied Electronics', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('707', 'M.E -Computer Science and Engineering', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('708', 'M.E - Computer and Communication', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('709', 'M.E - VLSI Design', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('710', 'M.Tech â€“ Remote Sensing', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('711', 'M.E - Structural Engineering', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('712', 'M.E - Engineering Design', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('713', 'B.Sc. Tourism and Hospitality Management', '1', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('714', 'B.E. â€“ Civil Engineering', '1', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('715', 'M.E. Wireless Technology', '2', '2013-05-09 23:56:40');
INSERT INTO `course` VALUES ('716', 'M.Sc. Applied Chemistry', '2', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('717', 'B.Sc. Tourism & Hospitality Management', '1', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('718', 'Dip. in Plastic Technology', '3', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('719', 'B.Tech. Electro Chemical Engineering', '1', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('720', 'M.Tech. Electro Chemical Engineering', '2', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('721', 'B.Sc. Genetics', '1', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('722', 'B.E.(Civil Engineering)', '1', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('723', 'B.E.(Electrical & Electronics Engineering)', '1', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('724', 'B.E.(Electronics & Communication Engg.)', '1', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('725', 'B.E.(Computer Science & Engineering)', '1', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('726', 'B.E.(Mechanical Engineering)', '1', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('727', 'B.Tech.(Information Technology)', '1', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('728', 'B.Tech.(Industrial Bio-Technology)', '1', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('729', 'M.B.A.', '2', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('730', 'M.C.A', '2', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('731', 'M.E.(Communication Systems)', '2', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('732', 'M.E.(Computer Science & Engg.)', '2', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('733', 'M.E.(Structural Engg.)', '2', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('734', 'M.E.(CAD/CAM )', '2', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('735', 'M.E.(Industrial Safety Engineering)', '2', '2013-05-09 23:56:41');
INSERT INTO `course` VALUES ('736', 'M.E.(Power Electronics and Drives)', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('737', 'M.Tech (Nano Science and Technology)', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('738', 'M.Sc. Medical Physics', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('739', 'Post Dip. in Lmottomg and Hoisery Technology', '4', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('740', 'Dip. in Packaging Technology', '3', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('741', 'B.Tech.- Information Technology', '1', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('742', 'M.E. - Aeronautical Engineering', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('743', 'M.E. - CAD / CAM M.E. - Computer Science and Engineering', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('744', 'M.E. - Computer and Communication', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('745', 'M.E. - Power Electronics and Drives', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('746', 'Electrical and Electronics Engineering', '1', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('747', 'Computer Science Engineering', '1', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('748', 'Automobile Engineering', '1', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('749', 'M.E - Aeronautical Engineering', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('750', 'M.E - CAD/CAM', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('751', 'M.E - Computer Science Engineering', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('752', 'M.D. (Siddha) Nanju Noolum Maruthuva Neethi Noolum', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('753', 'M.Sc. Software Engineering', '2', '2013-05-09 23:56:42');
INSERT INTO `course` VALUES ('754', 'B.E. Textiles Fashion Technology', '1', '2013-05-09 23:56:43');

-- ----------------------------
-- Table structure for `experience`
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience` (
  `experience_id` int(11) NOT NULL AUTO_INCREMENT,
  `limit` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`experience_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of experience
-- ----------------------------
INSERT INTO `experience` VALUES ('1', '0 - 1 year', '');
INSERT INTO `experience` VALUES ('2', '1 - 2 year', '');
INSERT INTO `experience` VALUES ('3', '2 - 5 year', '');
INSERT INTO `experience` VALUES ('4', 'Above 5 yrs', '');

-- ----------------------------
-- Table structure for `functional_area`
-- ----------------------------
DROP TABLE IF EXISTS `functional_area`;
CREATE TABLE `functional_area` (
  `functional_area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` text NOT NULL,
  `category` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`functional_area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of functional_area
-- ----------------------------
INSERT INTO `functional_area` VALUES ('1', 'Web Devlopment', '', '');
INSERT INTO `functional_area` VALUES ('2', 'Multimedia', '', '');
INSERT INTO `functional_area` VALUES ('3', 'Data Trainer', '', '');
INSERT INTO `functional_area` VALUES ('4', 'Team Leader', '', '');
INSERT INTO `functional_area` VALUES ('5', 'DBA', '', '');
INSERT INTO `functional_area` VALUES ('6', 'Programmer', '', '');

-- ----------------------------
-- Table structure for `graduation`
-- ----------------------------
DROP TABLE IF EXISTS `graduation`;
CREATE TABLE `graduation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `graduation_name` text NOT NULL,
  `title` text NOT NULL,
  `time stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of graduation
-- ----------------------------
INSERT INTO `graduation` VALUES ('1', 'Under Graduate Courses', '', '2013-05-07 07:33:05');
INSERT INTO `graduation` VALUES ('2', 'Post Graduate Courses', '', '2013-05-07 07:33:06');
INSERT INTO `graduation` VALUES ('3', 'Diploma Courses', '', '2013-05-07 07:33:06');
INSERT INTO `graduation` VALUES ('4', 'Post Diploma Courses', '', '2013-05-07 07:33:06');
INSERT INTO `graduation` VALUES ('5', 'Certificate Courses ', '', '2013-05-07 07:33:06');
INSERT INTO `graduation` VALUES ('6', 'Research Programme', '', '2013-05-07 07:33:06');

-- ----------------------------
-- Table structure for `job_info`
-- ----------------------------
DROP TABLE IF EXISTS `job_info`;
CREATE TABLE `job_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `last_date` date NOT NULL,
  `posted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `location` text NOT NULL,
  `vaccancy` int(11) NOT NULL,
  `experience_flag` int(11) NOT NULL,
  `key_skills_ids` text NOT NULL,
  `qualification_ids` text NOT NULL,
  `accept_flag` int(11) NOT NULL,
  `block_flag` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of job_info
-- ----------------------------

-- ----------------------------
-- Table structure for `skill_set`
-- ----------------------------
DROP TABLE IF EXISTS `skill_set`;
CREATE TABLE `skill_set` (
  `skill_set_id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`skill_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of skill_set
-- ----------------------------
INSERT INTO `skill_set` VALUES ('1', 'C', 'computer programing language');
INSERT INTO `skill_set` VALUES ('2', 'C++', 'computer programing language');
INSERT INTO `skill_set` VALUES ('3', 'Java', 'computer programing language');
INSERT INTO `skill_set` VALUES ('4', 'PHP', 'computer programing language');
INSERT INTO `skill_set` VALUES ('5', 'DBMS', 'computer programing language');
INSERT INTO `skill_set` VALUES ('6', '.NET', 'computer programing language');
INSERT INTO `skill_set` VALUES ('7', 'Multimedia', 'computer programing language');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` int(11) NOT NULL COMMENT '1-Candidate 2-Company',
  `email` text NOT NULL,
  `password` text NOT NULL,
  `last_login` date NOT NULL,
  `gcm_reg_id` text NOT NULL,
  `imei_no` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', '1', 'a@d3a.com', 'd', '0000-00-00', '', '');
INSERT INTO `userinfo` VALUES ('2', '2', 'skathiresan01@gmail.com', 'k', '0000-00-00', '', '');
INSERT INTO `userinfo` VALUES ('3', '2', 'simon@ginfoclique.com', '1', '0000-00-00', '', '');
INSERT INTO `userinfo` VALUES ('4', '1', 'simon@ginfoclique.com', '5', '0000-00-00', '', '');

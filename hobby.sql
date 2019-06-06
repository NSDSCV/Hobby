/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : hobby

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2019-06-06 11:01:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for complaintcomment
-- ----------------------------
DROP TABLE IF EXISTS `complaintcomment`;
CREATE TABLE `complaintcomment` (
  `pid` varchar(255) DEFAULT NULL,
  `bename` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `rid` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  KEY `comcomment001` (`pid`),
  KEY `Complaint comment02` (`bename`),
  KEY `Complaint comment03` (`name`),
  KEY `Complaint comment04` (`rid`),
  CONSTRAINT `comcomment001` FOREIGN KEY (`pid`) REFERENCES `post` (`id`),
  CONSTRAINT `Complaint comment02` FOREIGN KEY (`bename`) REFERENCES `user` (`username`),
  CONSTRAINT `Complaint comment03` FOREIGN KEY (`name`) REFERENCES `user` (`username`),
  CONSTRAINT `Complaint comment04` FOREIGN KEY (`rid`) REFERENCES `reply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for complaintpost
-- ----------------------------
DROP TABLE IF EXISTS `complaintpost`;
CREATE TABLE `complaintpost` (
  `pid` varchar(255) DEFAULT NULL,
  `bename` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  KEY `compost001` (`bename`),
  KEY `compost002` (`name`),
  KEY `compost003` (`pid`),
  CONSTRAINT `compost001` FOREIGN KEY (`bename`) REFERENCES `user` (`username`),
  CONSTRAINT `compost002` FOREIGN KEY (`name`) REFERENCES `user` (`username`),
  CONSTRAINT `compost003` FOREIGN KEY (`pid`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `title` varchar(200) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `hot` int(255) DEFAULT NULL,
  `content` longtext,
  `uid` varchar(50) DEFAULT NULL,
  `tid` int(20) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  KEY `1` (`uid`),
  KEY `2` (`tid`),
  KEY `id` (`id`),
  CONSTRAINT `1` FOREIGN KEY (`uid`) REFERENCES `user` (`username`),
  CONSTRAINT `2` FOREIGN KEY (`tid`) REFERENCES `theme` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `info` longtext,
  `time` datetime DEFAULT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `pid` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  KEY `q1` (`uid`),
  KEY `q2` (`pid`),
  KEY `id` (`id`),
  CONSTRAINT `q1` FOREIGN KEY (`uid`) REFERENCES `user` (`username`),
  CONSTRAINT `q2` FOREIGN KEY (`pid`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for replycomment
-- ----------------------------
DROP TABLE IF EXISTS `replycomment`;
CREATE TABLE `replycomment` (
  `id` varchar(255) DEFAULT NULL,
  `uid` varchar(50) DEFAULT NULL,
  `rid` varchar(255) DEFAULT NULL,
  `info` longtext,
  `time` datetime DEFAULT NULL,
  KEY `1111` (`uid`),
  KEY `2222` (`rid`),
  CONSTRAINT `1111` FOREIGN KEY (`uid`) REFERENCES `user` (`username`),
  CONSTRAINT `2222` FOREIGN KEY (`rid`) REFERENCES `reply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `tname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(255) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `status` int(5) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `emaillive` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `activecode` varchar(255) DEFAULT NULL,
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

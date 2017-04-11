/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : jfinal

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-04-10 10:05:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `state` int(1) NOT NULL DEFAULT '0' COMMENT '状态：0=停止，1=启动',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `exp` varchar(50) NOT NULL COMMENT '表达式',
  `clazz` varchar(255) NOT NULL COMMENT '实现类',
  `info` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('1', '0', '每5s', '*/5 * * * * ?', 'com.zhao.task.EverySecond', '每5s来一发');
INSERT INTO `task` VALUES ('2', '0', '每时', '0 0 0/1 * * ?', 'com.zhao.task.EveryHourJob', '每小时统计一次');
INSERT INTO `task` VALUES ('12', '0', '每天', '59 59 23 * * ?', 'com.zhao.task.EveryDayJob', '每天23点59分59秒跑一下');

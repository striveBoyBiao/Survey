/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : questionnaire

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2017-04-19 22:36:28
*/
use questionnaire;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', null, null);
INSERT INTO `address` VALUES ('2', '4', '8', '76');
INSERT INTO `address` VALUES ('3', '5', '1', '2');
INSERT INTO `address` VALUES ('4', '6', '9', '89');
INSERT INTO `address` VALUES ('5', '7', '8', '76');
INSERT INTO `address` VALUES ('6', '8', '15', '177');
INSERT INTO `address` VALUES ('7', '9', '13', '149');

-- ----------------------------
-- Table structure for birthday
-- ----------------------------
DROP TABLE IF EXISTS `birthday`;
CREATE TABLE `birthday` (
  `birthdayId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `month` varchar(255) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`birthdayId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of birthday
-- ----------------------------
INSERT INTO `birthday` VALUES ('1', '1', '1994', '8', '18');
INSERT INTO `birthday` VALUES ('2', '4', '2010', '2', '9');
INSERT INTO `birthday` VALUES ('3', '5', '2007', '5', '1');
INSERT INTO `birthday` VALUES ('4', '6', '2005', '2', '17');
INSERT INTO `birthday` VALUES ('5', '7', '2004', '3', '16');
INSERT INTO `birthday` VALUES ('6', '8', '2006', '3', '16');
INSERT INTO `birthday` VALUES ('7', '9', '2003', '3', '16');

-- ----------------------------
-- Table structure for destroyuser
-- ----------------------------
DROP TABLE IF EXISTS `destroyuser`;
CREATE TABLE `destroyuser` (
  `destroyUserId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `destroyReason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`destroyUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of destroyuser
-- ----------------------------

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `historyId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `questionnaireId` int(11) DEFAULT NULL,
  `historyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`historyId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('4', '1', '19', '2017-04-03 10:59:11');
INSERT INTO `history` VALUES ('5', '5', '19', '2017-04-03 10:59:47');
INSERT INTO `history` VALUES ('6', '1', '21', '2017-04-03 15:47:30');
INSERT INTO `history` VALUES ('7', '5', '21', '2017-04-03 16:24:51');
INSERT INTO `history` VALUES ('8', '5', '20', '2017-04-03 16:25:32');
INSERT INTO `history` VALUES ('9', '1', '22', '2017-04-06 22:50:22');
INSERT INTO `history` VALUES ('10', '1', '23', '2017-04-14 23:42:05');
INSERT INTO `history` VALUES ('11', '8', '24', '2017-04-18 21:46:59');
INSERT INTO `history` VALUES ('12', '1', '27', '2017-04-19 22:12:37');
INSERT INTO `history` VALUES ('13', '1', '26', '2017-04-19 22:18:50');
INSERT INTO `history` VALUES ('14', '8', '27', '2017-04-19 22:31:12');
INSERT INTO `history` VALUES ('15', '8', '26', '2017-04-19 22:31:47');

-- ----------------------------
-- Table structure for iscomplete
-- ----------------------------
DROP TABLE IF EXISTS `iscomplete`;
CREATE TABLE `iscomplete` (
  `isCompleteId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `questionnaireId` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`isCompleteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iscomplete
-- ----------------------------

-- ----------------------------
-- Table structure for like
-- ----------------------------
DROP TABLE IF EXISTS `like`;
CREATE TABLE `like` (
  `likeId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `likeThing` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`likeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of like
-- ----------------------------

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `optionId` int(11) NOT NULL AUTO_INCREMENT,
  `questionId` int(11) DEFAULT NULL,
  `A` varchar(255) DEFAULT NULL,
  `B` varchar(255) DEFAULT NULL,
  `C` varchar(255) DEFAULT NULL,
  `D` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`optionId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('1', '15', '小龙女 ', '郭襄', null, null);
INSERT INTO `options` VALUES ('2', '16', '小乔', '大乔', '貂蝉', null);
INSERT INTO `options` VALUES ('3', '17', '小龙女 ', '郭襄', null, null);
INSERT INTO `options` VALUES ('4', '18', '小乔', '大乔', '貂蝉', null);
INSERT INTO `options` VALUES ('5', '19', '小乔', '大乔', '貂蝉', null);
INSERT INTO `options` VALUES ('6', '20', '小龙女', '郭襄', null, null);
INSERT INTO `options` VALUES ('7', '21', '鬼武士', '神枪手', null, null);
INSERT INTO `options` VALUES ('8', '22', '上海', '无锡', null, null);
INSERT INTO `options` VALUES ('9', '23', '安陆', '洑水', null, null);
INSERT INTO `options` VALUES ('10', '24', '白兆山', '银杏树', '安陆广场', null);
INSERT INTO `options` VALUES ('11', '25', '林都花园', '东方', null, null);
INSERT INTO `options` VALUES ('12', '26', '麻糖', '白花菜', null, null);
INSERT INTO `options` VALUES ('13', '27', '小明家', '小红家', null, null);
INSERT INTO `options` VALUES ('14', '28', '请', '不请', '待确定', null);
INSERT INTO `options` VALUES ('15', '29', '东方明珠塔', '外滩', '世博园', null);
INSERT INTO `options` VALUES ('16', '30', '荷花', '雪', null, null);
INSERT INTO `options` VALUES ('17', '31', '臭豆腐', '热干面', '麻球', null);
INSERT INTO `options` VALUES ('18', '32', '雾', '雪', null, null);
INSERT INTO `options` VALUES ('19', '33', '人美', '物美', '景美', null);

-- ----------------------------
-- Table structure for profession
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession` (
  `professionId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`professionId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of profession
-- ----------------------------
INSERT INTO `profession` VALUES ('1', '5', '4', '12', '8');
INSERT INTO `profession` VALUES ('2', '1', '4', '3', '10');
INSERT INTO `profession` VALUES ('3', '8', '4', '15', '9');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `questionId` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaireId` int(11) DEFAULT NULL,
  `questionName` varchar(255) DEFAULT NULL,
  `questionType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`questionId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('15', '16', '你是谁？', '6');
INSERT INTO `question` VALUES ('16', '16', '你爱谁？', '7');
INSERT INTO `question` VALUES ('17', '17', '你是谁？', '6');
INSERT INTO `question` VALUES ('18', '17', '你爱谁？', '7');
INSERT INTO `question` VALUES ('19', '18', '英雄联盟中谁最美丽？', '7');
INSERT INTO `question` VALUES ('20', '19', '你喜欢谁？', '6');
INSERT INTO `question` VALUES ('21', '20', '你喜欢玩什么英雄', '6');
INSERT INTO `question` VALUES ('22', '21', '你住在哪？', '6');
INSERT INTO `question` VALUES ('23', '22', '有哪些城镇？', '6');
INSERT INTO `question` VALUES ('24', '22', '有哪些地方？', '7');
INSERT INTO `question` VALUES ('25', '22', '安陆有哪些房区', '6');
INSERT INTO `question` VALUES ('26', '22', '有哪些吃的？', '6');
INSERT INTO `question` VALUES ('27', '23', '去哪玩？', '6');
INSERT INTO `question` VALUES ('28', '23', '请假吗？', '7');
INSERT INTO `question` VALUES ('29', '24', '哪里最好看？', '7');
INSERT INTO `question` VALUES ('30', '25', '下雨天？', '6');
INSERT INTO `question` VALUES ('31', '26', '你喜欢吃?', '7');
INSERT INTO `question` VALUES ('32', '27', '雪花纷飞', '6');
INSERT INTO `question` VALUES ('33', '27', '最美的事物', '7');

-- ----------------------------
-- Table structure for questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `questionnaire`;
CREATE TABLE `questionnaire` (
  `questionnaireId` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaireName` varchar(255) NOT NULL,
  `createTime` datetime NOT NULL,
  `completeStatus` int(255) DEFAULT NULL,
  `questionnaireStatus` varchar(255) DEFAULT NULL,
  `questionnaireType` varchar(255) DEFAULT NULL,
  `stopTime` datetime DEFAULT NULL,
  PRIMARY KEY (`questionnaireId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of questionnaire
-- ----------------------------
INSERT INTO `questionnaire` VALUES ('16', '情时明月', '2017-03-20 23:41:46', '0', '已完成', '问卷列表', '2017-03-30 11:48:20');
INSERT INTO `questionnaire` VALUES ('17', '流星蝴蝶剑', '2017-03-22 20:36:27', '0', '已完成', '问卷列表', '2017-04-01 11:48:26');
INSERT INTO `questionnaire` VALUES ('18', '风花雪月', '2017-03-25 16:52:22', '0', '已完成', '快速回答', '2017-04-01 11:48:47');
INSERT INTO `questionnaire` VALUES ('19', '在神雕侠侣你喜欢谁？', '2017-03-26 11:40:42', '2', '已完成', '快速回答', '2017-04-05 11:49:01');
INSERT INTO `questionnaire` VALUES ('20', 'DNF', '2017-03-26 11:47:39', '1', '已完成', '快速回答', '2017-04-05 11:47:39');
INSERT INTO `questionnaire` VALUES ('21', '生活在于什么', '2017-03-26 11:54:05', '2', '已完成', '快速回答', '2017-04-05 11:54:05');
INSERT INTO `questionnaire` VALUES ('22', '想知道孝感吗？', '2017-04-04 21:38:36', '2', '已完成', '问卷列表', '2017-04-14 21:38:36');
INSERT INTO `questionnaire` VALUES ('23', '五一', '2017-04-14 23:41:26', '1', '发布中', '问卷列表', '2017-04-24 23:41:26');
INSERT INTO `questionnaire` VALUES ('24', '上海景色', '2017-04-15 10:33:19', '1', '发布中', '快速回答', '2017-04-25 10:33:19');
INSERT INTO `questionnaire` VALUES ('25', '景色', '2017-04-15 10:42:46', '0', '发布中', '快速回答', '2017-04-25 10:42:46');
INSERT INTO `questionnaire` VALUES ('26', '美食', '2017-04-15 10:45:52', '2', '发布中', '快速回答', '2017-04-25 10:45:52');
INSERT INTO `questionnaire` VALUES ('27', '江南风景', '2017-04-19 22:11:00', '2', '发布中', '问卷列表', '2017-04-29 22:11:00');

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result` (
  `resultId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `questionnaireId` int(11) DEFAULT NULL,
  `questionId` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resultId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES ('13', '1', '19', '20', 'A');
INSERT INTO `result` VALUES ('14', '5', '19', '20', 'B');
INSERT INTO `result` VALUES ('15', '1', '21', '22', 'A');
INSERT INTO `result` VALUES ('16', '5', '21', '22', 'A');
INSERT INTO `result` VALUES ('17', '5', '20', '21', 'A');
INSERT INTO `result` VALUES ('18', '1', '22', '23', 'A');
INSERT INTO `result` VALUES ('19', '1', '22', '24', 'A');
INSERT INTO `result` VALUES ('20', '1', '22', '25', 'A');
INSERT INTO `result` VALUES ('21', '1', '22', '26', 'B');
INSERT INTO `result` VALUES ('22', '1', '23', '27', 'A');
INSERT INTO `result` VALUES ('23', '1', '23', '28', 'A');
INSERT INTO `result` VALUES ('24', '8', '24', '29', 'A');
INSERT INTO `result` VALUES ('25', '1', '27', '32', 'A');
INSERT INTO `result` VALUES ('26', '1', '27', '33', 'B');
INSERT INTO `result` VALUES ('27', '1', '26', '31', 'A');
INSERT INTO `result` VALUES ('28', '8', '27', '32', 'B');
INSERT INTO `result` VALUES ('29', '8', '27', '33', 'C');
INSERT INTO `result` VALUES ('30', '8', '26', '31', 'C');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userNickName` varchar(255) NOT NULL,
  `userAccount` varchar(255) NOT NULL,
  `userPassword` varchar(255) NOT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `userPhone` varchar(11) DEFAULT NULL,
  `userSalary` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `likeMusic` varchar(255) DEFAULT NULL,
  `wish` varchar(255) DEFAULT NULL,
  `userType` varchar(255) DEFAULT NULL,
  `isDestroy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '管理员', 'admin', '123456', '1', '15971417393', '118', '5', '喜欢西湖,坐看美人，笑看天下', 'Dream Flew', '上王者', '管理员', '否');
INSERT INTO `user` VALUES ('3', '少司令', '15827252170', '123456', '2', null, null, null, null, null, null, '用户', '否');
INSERT INTO `user` VALUES ('4', '石兰', '1778513', '123456', '2', null, null, null, null, null, null, '用户', '否');
INSERT INTO `user` VALUES ('5', '少司令', '123', '123', '2', '15827252170', '112', '3', '欣欣之火', 'Dream', '游遍全国', '用户', '是');
INSERT INTO `user` VALUES ('6', '小乔', '123456', '123456', '2', null, null, null, null, null, null, '用户', '否');
INSERT INTO `user` VALUES ('7', '11', '11', '11', '1', null, null, null, null, null, null, '用户', '否');
INSERT INTO `user` VALUES ('8', '小红', '1234', '1234', '1', '', '112', '4', '续爱', '奔跑', '黑客', '用户', '否');
INSERT INTO `user` VALUES ('9', '嘻嘻', '12345', '123456', '1', null, null, null, null, null, null, '用户', '否');

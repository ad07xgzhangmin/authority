-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.27


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema authority
--

CREATE DATABASE IF NOT EXISTS authority;
USE authority;

--
-- Definition of table `base_fields`
--

DROP TABLE IF EXISTS `base_fields`;
CREATE TABLE `base_fields` (
  `field_id` int(9) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段ID',
  `field` varchar(64) DEFAULT NULL COMMENT '字段',
  `field_name` varchar(128) DEFAULT NULL COMMENT '字段名称',
  `value_field` varchar(128) DEFAULT NULL COMMENT '字段值',
  `display_field` varchar(128) DEFAULT NULL COMMENT '字段显示值',
  `enabled` int(2) unsigned DEFAULT NULL COMMENT '是否启用',
  `sort` int(2) unsigned DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='系统字段设置表';

--
-- Dumping data for table `base_fields`
--

/*!40000 ALTER TABLE `base_fields` DISABLE KEYS */;
INSERT INTO `base_fields` (`field_id`,`field`,`field_name`,`value_field`,`display_field`,`enabled`,`sort`) VALUES 
 (37,'sex','性别','0','男',1,1),
 (38,'sex','性别','1','女',1,2),
 (39,'sex','性别','2','其他',1,3),
 (40,'sex','性别','3','保密',0,4),
 (41,'pagesize','每页显示条数','10','10条/页',1,1),
 (42,'pagesize','每页显示条数','20','20条/页',1,2),
 (43,'pagesize','每页显示条数','30','30条/页',1,3),
 (44,'pagesize','每页显示条数','50','50条/页',1,4),
 (45,'theme','风格','xtheme-blue.css','经典蓝色',1,1),
 (46,'theme','风格','xtheme-gray.css','简约灰色',1,2),
 (47,'leaf','父模块','0','父节点',1,1),
 (48,'leaf','父模块','1','子节点',1,2),
 (49,'expanded','展开状态','0','收缩',1,1),
 (50,'expanded','展开状态','1','展开',1,2),
 (51,'isdisplay','是否显示','0','否',1,1),
 (52,'isdisplay','是否显示','1','是',1,2),
 (53,'pagesize','每页显示条数','100','100条/页',1,5),
 (54,'pagesize','每页显示条数','200','200条/页',1,6),
 (55,'pagesize','每页显示条数','500','500条/页',0,7),
 (56,'enabled','是否启用','0','禁用',1,2),
 (57,'enabled','是否启用','1','启用',1,1),
 (58,'theme','风格','ext-all-xtheme-brown02.css','灰棕色',1,5),
 (59,'theme','风格','xtheme-calista.css','绿黄双重色',0,8),
 (60,'theme','风格','xtheme-indigo.css','靛青',1,9),
 (61,'theme','风格','xtheme-slate.css','石板色',1,14),
 (62,'theme','风格','xtheme-olive.css','绿色',1,11),
 (63,'theme','风格','xtheme-black.css','黑色',1,6),
 (64,'theme','风格','xtheme-darkgray.css','暗灰',1,7),
 (65,'theme','风格','xtheme-slickness.css','全黑',1,15),
 (66,'theme','风格','ext-all-xtheme-brown.css','红棕色',1,4),
 (67,'theme','风格','ext-all-xtheme-red03.css','粉红',1,6),
 (68,'theme','风格','xtheme-purple.css','紫色',1,13),
 (69,'theme','风格','ext-all-xtheme-blue03.css','灰色',1,3),
 (70,'theme','风格','xtheme-midnight.css','午夜',1,10),
 (71,'theme','风格','xtheme-pink.css','粉红色',1,12);
/*!40000 ALTER TABLE `base_fields` ENABLE KEYS */;


--
-- Definition of table `base_modules`
--

DROP TABLE IF EXISTS `base_modules`;
CREATE TABLE `base_modules` (
  `module_id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(64) NOT NULL,
  `module_url` varchar(64) DEFAULT NULL,
  `parent_id` int(9) unsigned DEFAULT NULL,
  `leaf` int(1) unsigned DEFAULT NULL,
  `expanded` int(1) unsigned DEFAULT NULL,
  `display_index` int(2) unsigned DEFAULT NULL,
  `is_display` int(1) unsigned DEFAULT NULL,
  `en_module_name` varchar(64) DEFAULT NULL,
  `icon_css` varchar(128) DEFAULT NULL,
  `information` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='系统模块表';

--
-- Dumping data for table `base_modules`
--

/*!40000 ALTER TABLE `base_modules` DISABLE KEYS */;
INSERT INTO `base_modules` (`module_id`,`module_name`,`module_url`,`parent_id`,`leaf`,`expanded`,`display_index`,`is_display`,`en_module_name`,`icon_css`,`information`) VALUES 
 (1,'系统设置',NULL,0,0,1,1,1,'System Settings','system_settings',NULL),
 (2,'供应商管理',NULL,0,0,1,2,1,'Operator','abc',NULL),
 (11,'角色管理','/role',1,1,0,3,1,'Role Management','role',NULL),
 (12,'用户管理','/user',1,1,0,2,1,'User Management','user',NULL),
 (13,'模块管理','/module',1,1,0,1,1,'Module Management','module',NULL),
 (14,'系统字段管理','/field',1,1,1,4,1,'field','field',NULL),
 (21,'供应商信息','/oprator',2,1,0,1,1,'oprator','cde',NULL);
/*!40000 ALTER TABLE `base_modules` ENABLE KEYS */;


--
-- Definition of table `base_role_module`
--

DROP TABLE IF EXISTS `base_role_module`;
CREATE TABLE `base_role_module` (
  `role_module_id` int(9) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色模块ID',
  `role_id` int(9) unsigned DEFAULT NULL COMMENT '角色ID',
  `module_id` int(9) unsigned DEFAULT NULL COMMENT '模块ID',
  PRIMARY KEY (`role_module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='角色模块表';

--
-- Dumping data for table `base_role_module`
--

/*!40000 ALTER TABLE `base_role_module` DISABLE KEYS */;
INSERT INTO `base_role_module` (`role_module_id`,`role_id`,`module_id`) VALUES 
 (1,2,2),
 (2,2,21),
 (3,1,1),
 (4,1,2),
 (5,1,13),
 (6,1,12),
 (7,1,11),
 (8,1,14),
 (9,1,21);
/*!40000 ALTER TABLE `base_role_module` ENABLE KEYS */;


--
-- Definition of table `base_roles`
--

DROP TABLE IF EXISTS `base_roles`;
CREATE TABLE `base_roles` (
  `role_id` int(9) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `role_desc` varchar(128) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- Dumping data for table `base_roles`
--

/*!40000 ALTER TABLE `base_roles` DISABLE KEYS */;
INSERT INTO `base_roles` (`role_id`,`role_name`,`role_desc`) VALUES 
 (1,'管理员','管理员'),
 (2,'测试角色','测试角色');
/*!40000 ALTER TABLE `base_roles` ENABLE KEYS */;


--
-- Definition of table `base_user_role`
--

DROP TABLE IF EXISTS `base_user_role`;
CREATE TABLE `base_user_role` (
  `user_role_id` int(9) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户角色ID',
  `user_id` int(9) unsigned NOT NULL COMMENT '用户ID',
  `role_id` int(9) unsigned NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

--
-- Dumping data for table `base_user_role`
--

/*!40000 ALTER TABLE `base_user_role` DISABLE KEYS */;
INSERT INTO `base_user_role` (`user_role_id`,`user_id`,`role_id`) VALUES 
 (1,2,1),
 (2,1,2);
/*!40000 ALTER TABLE `base_user_role` ENABLE KEYS */;


--
-- Definition of table `base_users`
--

DROP TABLE IF EXISTS `base_users`;
CREATE TABLE `base_users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(64) NOT NULL COMMENT '账号',
  `password` varchar(128) NOT NULL COMMENT '密码\r\norg.springframework.security.crypto.password.StandardPasswordEncoder.StandardPasswordEncoder(CharSequence secret)',
  `real_name` varchar(64) DEFAULT NULL COMMENT '用户真实姓名',
  `sex` int(1) unsigned DEFAULT NULL COMMENT '性别 0:男 1:女',
  `email` varchar(64) DEFAULT NULL COMMENT '电子邮件地址',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机',
  `office_phone` varchar(32) DEFAULT NULL COMMENT '办公电话',
  `error_count` int(2) unsigned DEFAULT '0' COMMENT '密码错误次数',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(32) DEFAULT NULL COMMENT '上次登录IP地址',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- Dumping data for table `base_users`
--

/*!40000 ALTER TABLE `base_users` DISABLE KEYS */;
INSERT INTO `base_users` (`user_id`,`account`,`password`,`real_name`,`sex`,`email`,`mobile`,`office_phone`,`error_count`,`last_login_time`,`last_login_ip`,`remark`) VALUES 
 (1,'test','ddee6e95fae5bb5f8890a6f9ef7d0d1db744ca4417e94c05595ef280046a49021eba3291ee9c9cf8','测试用户',0,'test@qq.com','119','110',0,NULL,NULL,NULL),
 (2,'admin','6043ae1095884cf9663d140ee6450b49b8489b3aa073a8eec024492b976ee2a24aee0c272369121b','超级管理员',0,'admin@whty.com.cn','119','110',0,NULL,'127.0.0.1','用户信息');
/*!40000 ALTER TABLE `base_users` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

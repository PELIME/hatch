-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.62 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 pelime 的数据库结构
CREATE DATABASE IF NOT EXISTS `pelime` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pelime`;

-- 导出  表 pelime.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色表';

-- 正在导出表  pelime.sys_role 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 pelime.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `expired` int(11) NOT NULL DEFAULT '0' COMMENT '是否过期',
  `locked` int(11) NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `enabled` int(11) NOT NULL DEFAULT '0' COMMENT '是否启用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户信息';

-- 正在导出表  pelime.sys_user 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 pelime.sys_user_role 结构
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_USERROLE_USER` (`user_id`),
  KEY `FK_USERROLE_ROLE` (`role_id`),
  CONSTRAINT `FK_USERROLE_USER` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `FK_USERROLE_ROLE` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  pelime.sys_user_role 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

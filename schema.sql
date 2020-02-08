-- 创建数据库
create database if not exists demo;
-- 使用数据库
USE `demo`;

-- 建表
DROP TABLE IF EXISTS `xc_share_battery_abnormal_record`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT;

#!/usr/bin/env bash

#创建数据表
#如果创建的表存在 加上了 [IF NOT EXISTS] 系统不提示错误 否则系统提示错误
CREATE TABLE [IF NOT EXISTS] `table_name` (
    column_name data_type,
    ...
);

#创建表tb1
#warn 工资应该使用decimal
# FLOAT(8,2) 范围 000000.00 - 999999.99
CREATE TABLE `tb1` (
    `username` VARCHAR(20),
    `age` TINYINT UNSIGNED,
    `salary` FLOAT(8,2) UNSIGNED
);

#查看创建的数据表
SHOW TABLES;
SHOW TABLES FROM `mysql`;
SELECT DATABASE();

#查看数据表结构
SHOW COLUMNS FROM `tb1`;

#数据表插入数据
#省略列名称要为所有的列赋值
INSERT INTO `tb1` VALUES('tom',25,7863.25);
INSERT INTO `tb1`(`username`,`salary`) VALUES('john',4500.69);
INSERT `tb1`(`username`,`age`) VALUES('marry',23);

#查询
# * 表示字段过滤 不是记录过滤
SELECT * FROM `tb1`;

# 字段空值与非空
# 字段允许为空 NULL 可以省略
CREATE TABLE `tb2` (
    `username` VARCHAR(20) NOT NULL,
    `age` TINYINT UNSIGNED NULL
);
SHOW COLUMNS FROM `tb2`;
INSERT `tb2`(`username`,`age`) VALUES('leo',NULL);
INSERT `tb2`(`username`,`age`) VALUES(NULL,22);
SELECT * FROM `tb2`;

# 自增ID 保证一张表数据记录唯一性
# 起始值为1 地增量为1 字段必须是数值型 整型 或者 浮点数
# 该字段设置为浮点数 小数位数需要设置为0 如 FLOAT(7,0)
# warn 自增长 AUTO_INCREMENT 必须和 PRIMARY KEY 一起使用
CREATE TABLE `tb3` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL
);

# 定义主键可以写 KEY 或者 PRIMARY KEY
CREATE TABLE `tb4` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(30) NOT NULL
);
SHOW COLUMNS FROM `tb4`;

# 自增主键字段无需赋值
INSERT INTO `tb4` (`username`) VALUES('tom');
INSERT INTO `tb4` (`username`) VALUES('john');
INSERT INTO `tb4` (`username`) VALUES('rose');
INSERT INTO `tb4` (`username`) VALUES('dimitar');
SELECT * FROM `tb4`;

# 创建表 只有 PRIMARY KEY 没有 AUTO_INCREMENT
CREATE TABLE `tb5` (
    `id` SMALLINT UNSIGNED PRIMARY KEY,
    `username` VARCHAR(30) NOT NULL
);
SHOW COLUMNS FROM `tb5`;

INSERT `tb5` VALUES(1,'tom');
INSERT `tb5` VALUES(2,'john');
INSERT `tb5` VALUES(2,'rose');

# UNIQUE KEY
CREATE TABLE `tb6` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(30) NOT NULL UNIQUE KEY,
    `age` TINYINT UNSIGNED
);
SHOW COLUMNS FROM `tb6`;

INSERT `tb6` (`username`,`age`) VALUES('tom',21);
INSERT `tb6` (`username`,`age`) VALUES('rose',22);
INSERT `tb6` (`username`,`age`) VALUES('rose',23);
SELECT * FROM `tb6`;

# UNIQUE KEY 的字段可以为 NULL
CREATE TABLE `tb7` (
    `username` VARCHAR(30) UNIQUE KEY
);
SHOW COLUMNS FROM `tb7`;
INSERT `tb7` VALUES(NULL);
INSERT `tb7` VALUES('rose');
INSERT `tb7` VALUES('rose');
SELECT * FROM `tb7`;

# DEFAULT 默认约束
CREATE TABLE `tb8` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(30) NOT NULL UNIQUE KEY,
    `sex` ENUM('male','female','unknown') NOT NULL DEFAULT 'unknown'
);
SHOW COLUMNS FROM `tb8`;

CREATE TABLE `tb9` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(30) NOT NULL UNIQUE KEY,
    `sex` ENUM('male','female','unknown') DEFAULT 'unknown'
);


INSERT `tb9` (`username`) VALUES('tom');
SELECT * FROM `tb9`;

# 外键约束 FOREIGN KEY
CREATE TABLE `province` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `pname` VARCHAR(20) NOT NULL
);
SHOW CREATE TABLE `province`;

#ERROR 1005 (HY000): Can't create table 'test.user' (errno: 150)
CREATE TABLE `user` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(10) NOT NULL,
    `pid` BIGINT,
     FOREIGN KEY (`pid`) REFERENCES `province` (`id`)
);

# ERROR 1005 (HY000): Can't create table 'test.user' (errno: 150)
CREATE TABLE `user` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(10) NOT NULL,
    `pid` SMALLINT,
     FOREIGN KEY (`pid`) REFERENCES `province` (`id`)
);


CREATE TABLE `user` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(10) NOT NULL,
    `pid` SMALLINT UNSIGNED,
     FOREIGN KEY (`pid`) REFERENCES `province` (`id`)
);

SHOW INDEXES FROM `province`;
SHOW INDEXES FROM `user`;
SHOW CREATE TABLE `user`;

#外键约束 ON DELETE CASCADE 在删除province.id时 user1做删除操作
CREATE TABLE `user1` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(10) NOT NULL,
    `pid` SMALLINT UNSIGNED,
     FOREIGN KEY (`pid`) REFERENCES `province` (`id`) ON DELETE CASCADE
);
SHOW CREATE TABLE `user1`;

INSERT `province` (`pname`) VALUES('A');
INSERT `province` (`pname`) VALUES('B');
INSERT `province` (`pname`) VALUES('C');
SELECT * FROM `province`;

INSERT `user1` (`username`,`pid`) VALUES('tom',3);
INSERT `user1` (`username`,`pid`) VALUES('john',7);
INSERT `user1` (`username`,`pid`) VALUES('john',1);
INSERT `user1` (`username`,`pid`) VALUES('rose',3);
SELECT * FROM `user1`;

DELETE FROM `province` WHERE `id`=3;
SELECT * FROM `province`;
SELECT * FROM `user1`;

#修改数据表
#添加/删除列
SHOW COLUMNS FROM `user1`;
ALTER TABLE `user1` ADD COLUMN `age` TINYINT UNSIGNED NOT NULL DEFAULT 1;
ALTER TABLE `user1` ADD `password` VARCHAR(32) NOT NULL AFTER `username`;
ALTER TABLE `user1` ADD `truename` VARCHAR(32) NOT NULL FIRST;
SHOW COLUMNS FROM `user1`;

ALTER TABLE `user1` DROP `truename`;
SHOW COLUMNS FROM `user1`;
ALTER TABLE `user1` DROP `password`,DROP `age`;

#添加约束
CREATE TABLE `user2` (
    `username` VARCHAR(10) NOT NULL,
    `pid` SMALLINT UNSIGNED
);
SHOW CREATE TABLE `user2`;
ALTER TABLE `user2` ADD COLUMN `id` SMALLINT UNSIGNED;
SHOW COLUMNS FROM `user2`;
ALTER TABLE `user2` ADD CONSTRAINT primary_key_constraint_user2_id PRIMARY KEY (`id`);
ALTER TABLE `user2` ADD CONSTRAINT unique_key_constraint_user2_username UNIQUE KEY (`username`);
SHOW CREATE TABLE `user2`;
#添加外键约束
ALTER TABLE `user2` ADD CONSTRAINT foreign_key_constraint_user2_pid FOREIGN KEY (`pid`) REFERENCES `province` (`id`);

ALTER TABLE `user2` ADD COLUMN `age` TINYINT UNSIGNED NOT NULL;
SHOW COLUMNS FROM `user2`;
ALTER TABLE `user2` ALTER `age` SET DEFAULT 10;
SHOW COLUMNS FROM `user2`;
ALTER TABLE `user2` ALTER `age` DROP DEFAULT;
SHOW COLUMNS FROM `user2`;

ALTER TABLE `user2` DROP PRIMARY KEY;

SHOW INDEXES FROM `user2`;
ALTER TABLE `user2` DROP INDEX unique_key_constraint_user2_username;

SHOW CREATE TABLE `user2`;
ALTER TABLE `user2` DROP FOREIGN KEY `user2_ibfk_1`;

ALTER TABLE `user2` DROP KEY foreign_key_constraint_user2_pid;

#修改列定义
ALTER TABLE `user2` MODIFY COLUMN `id` SMALLINT UNSIGNED NOT NULL DEFAULT 0 FIRST;
SHOW COLUMNS FROM `user2`;

ALTER TABLE `user2` MODIFY COLUMN `id` TINYINT UNSIGNED NOT NULL DEFAULT 0 FIRST;
SHOW COLUMNS FROM `user2`;

#修改列定义和列名称
ALTER TABLE `user2` CHANGE COLUMN `pid` `p_id` TINYINT UNSIGNED NOT NULL DEFAULT 0;
SHOW COLUMNS FROM `user2`;

#更名数据表
ALTER TABLE `user2` RENAME `user2new`;
RENAME TABLE `user2new` to `user2`;
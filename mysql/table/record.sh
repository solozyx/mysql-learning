#!/usr/bin/env bash

CREATE TABLE `user4` (
    `id` SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(20) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `age` TINYINT UNSIGNED NOT NULL DEFAULT 1,
    `sex` BOOLEAN
);

INSERT `user4` VALUES (NULL,'tom','123',25,1);
INSERT `user4` VALUES (NULL,'john','123',25,1);
INSERT `user4` VALUES (DEFAULT,'rose','123',25,0);
SELECT * FROM `user4`;

#ERROR 1136 (21S01): Column count doesn't match value count at row 1
INSERT `user4` VALUES ('jick','123',25,0);

INSERT `user4` VALUES (DEFAULT,'jick','123',3*7-5,0);
SELECT * FROM `user4` WHERE `username`='jick';

INSERT `user4` VALUES (DEFAULT,'mary','123',DEFAULT,1);
SELECT * FROM `user4` WHERE `username`='mary';
INSERT `user4` VALUES (DEFAULT,'tik','123',NULL,1);

INSERT `user4` VALUES
    (DEFAULT,'joe',md5('123'),DEFAULT,1),
    (DEFAULT,'tiger','123',20,0);
SELECT * FROM `user4` WHERE `username`='joe' OR `username`='tiger';

#INSERT - SET
INSERT `user4` SET `username`='ben',`password`='456';
SELECT * FROM `user4` WHERE `username`='ben';

# UPDATE - SET
UPDATE `user4` SET `age`=`age`+5;
UPDATE `user4` SET `password`=md5('123456'),`sex`=0;

UPDATE `user4` SET `age`=1 WHERE `id`%2!=0;
UPDATE `user4` SET `age`=2 WHERE `id`%2=0;

# 删除记录DELETE
DELETE FROM `user4` WHERE `id`%2=0;

INSERT `user4` VALUES (DEFAULT,'kiki','123',DEFAULT,1);

# SELECT
SELECT 3 + 5;
SELECT `id`,`username` FROM `user4`;
SELECT `username`,`id` FROM `user4`;
SELECT `user4`.`id`,`user4`.`username` FROM `user4`;

SELECT `id` AS `userId`,`username` AS `uname` FROM `user4`;

# username 做了 id 的别名，别名和表中字段冲突，结果集别名就覆盖了真实字段
# AS 别名的 AS 不建议省略
SELECT `id` `username` FROM `user4`;

SELECT * FROM `user4` WHERE `id`>7;
SELECT * FROM `user4`;

# SELECT - GROUP BY
SELECT * FROM `user4` GROUP BY 1;
SELECT * FROM `user4` GROUP BY `sex`;
# SELECT - HAVING
SELECT * FROM `user4` GROUP BY `username` HAVING `age` > 35;
SELECT `sex` FROM `user4` GROUP BY 1 HAVING COUNT(`id`) >= 2;
# SELECT - ORDER BY
SELECT * FROM `user4` ORDER BY`username` ASC;
SELECT * FROM `user4` ORDER BY`username` DESC;
SELECT * FROM `user4` ORDER BY`sex` ASC;
SELECT * FROM `user4` ORDER BY`sex` ASC,`id` DESC;

# SELECT - LIMIT
SELECT * FROM `user4` LIMIT 2;
SELECT * FROM `user4` LIMIT 2,1;

SELECT * FROM `user4` ORDER BY `id` DESC LIMIT 2,1;

CREATE TABLE IF NOT EXISTS `user5` (
    `id` TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(20)
);

INSERT `user5` (`username`)
    SELECT `username` FROM `user4` WHERE `id`>=3;


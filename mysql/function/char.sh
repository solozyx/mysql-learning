#!/usr/bin/env bash

SELECT CONCAT('solozyx','MySQL');
SELECT CONCAT('solozyx','-','MySQL');

CREATE TABLE IF NOT EXISTS `test`(
    `first_name` VARCHAR(20) NULL,
    `last_name`  VARCHAR(10) NULL
);

DESC `test`;

INSERT INTO `test` VALUES
    ('A','B'),
    ('C','D'),
    ('tom%',123),
    (NULL,11);

SELECT * FROM `test`;

SELECT CONCAT(`first_name`,`last_name`) AS `fullname` FROM `test`;

SELECT CONCAT_WS('*','A','B','C','D');

SELECT CONCAT_WS('-','solozyx','MySQL','FUNCTION') AS `ws`;

# 保留到小数点后 2位
SELECT FORMAT(10086.1234,2);
SELECT FORMAT(10086.12345,4);
SELECT FORMAT(10086.12345,0);
SELECT FORMAT(10086.52345,0);

SELECT LOWER('MySQL');
SELECT UPPER('MySQL');

SELECT LEFT('MySQL',1);
SELECT LEFT('MySQL',2);

SELECT UPPER(LEFT('MySQL',2));
SELECT LOWER(LEFT('MySQL',2));

SELECT RIGHT('MySQL',3);
SELECT LOWER(RIGHT('MySQL',3));

SELECT LENGTH('MySQL');
SELECT LENGTH('M ySQL');

SELECT LTRIM('   MySQL   ');
SELECT RTRIM('   MySQL   ');
SELECT TRIM('   MySQL   ');
SELECT 'MySQL';

SELECT LENGTH(LTRIM('   MySQL   '));
SELECT LENGTH(TRIM('   MySQL   '));
SELECT LENGTH('MySQL');

# 删除 FROM 后的 字符串中 前导LEADING 字符 '?'
SELECT TRIM(LEADING '?' FROM '??MySQL???');

# 删除 FROM 后的 字符串中 后导TRAILING 字符 '?'
SELECT TRIM(TRAILING '?' FROM '??MySQL???');

# 删除 FROM 后的 字符串中 前导LEADING 后导TRAILING 字符 '?'
SELECT TRIM(BOTH '?' FROM '??MySQL???');

SELECT TRIM(BOTH '?' FROM '??My???????SQL???');

# 把字符串中的 ? 替换为 空字符
SELECT REPLACE('??My??SQL???','?','');

# 把字符串中的 ? 替换为 !*
SELECT REPLACE('??My??SQL???','?','!*');

# 把字符串中的 ?? 替换为 *
SELECT REPLACE('??My??SQL???','??','*');

# SUBSTRING
# 从哪个字符串
# start index
# 取几个
SELECT SUBSTRING('MySQL',2,2);
SELECT SUBSTRING('MySQL',2);
SELECT SUBSTRING('MySQL',-2);

SELECT SUBSTRING('MySQL',2,-1);

# 模式匹配 % 任意个字符包括0个 _ 任意1个字符

# MySQL 的 % 类似windows系统的 * 代表任意个数的字符 含0个
SELECT 'MySQL' LIKE 'M%';

SELECT * FROM `test`;

SELECT * FROM `test`
    WHERE `first_name` LIKE '%o%';

SELECT * FROM `test`
    WHERE `first_name` LIKE '%%%';

SELECT * FROM `test`
    WHERE `first_name` LIKE '%';

# 字符1后面的% 不做通配符 认为是标准 百分号 处理
SELECT * FROM `test`
    WHERE `first_name` LIKE '%1%%' ESCAPE 1;

SELECT * FROM `test`
    WHERE `first_name` LIKE '%1%%' ESCAPE '1';

SELECT * FROM `test`
    WHERE `first_name` LIKE '%a%%' ESCAPE 'a';





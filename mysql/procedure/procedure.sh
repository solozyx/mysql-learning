#!/usr/bin/env bash


--------------------------------------------------------
mysql> DESC `test`;
+------------+----------------------+------+-----+---------+----------------+
| Field      | Type                 | Null | Key | Default | Extra          |
+------------+----------------------+------+-----+---------+----------------+
| id         | smallint(5) unsigned | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(20)          | YES  |     | NULL    |                |
| last_name  | varchar(10)          | YES  |     | NULL    |                |
+------------+----------------------+------+-----+---------+----------------+
3 rows in set (0.03 sec)
mysql>
--------------------------------------------------------


# 不带参数的存储过程
CREATE PROCEDURE store_procedure1()
    SELECT VERSION();

# 调用存储过程
CALL store_procedure1;
CALL store_procedure1();

DELIMITER &&

CREATE PROCEDURE remove_user_by_id(IN id INT UNSIGNED)
    BEGIN
        DELETE FROM `user4` WHERE `id` = id;
    END &&

DELIMITER ;

CALL remove_user_by_id(3);

DROP PROCEDURE remove_user_by_id;

DELIMITER @@

CREATE PROCEDURE remove_user_by_id(IN user_id INT UNSIGNED)
    BEGIN
        DELETE FROM `test` WHERE `id` = user_id;
    END @@

DELIMITER ;

CALL remove_user_by_id(3);

# 删除id不固定的记录 返回剩余记录数量
# DELETE + COUNT(`id`) 2个语句 必须使用 BEGIN ... END
# 返回值 类型 OUT

DELIMITER %%

CREATE PROCEDURE remove_user_by_id_and_return_user_counts(
    IN user_id INT UNSIGNED,OUT user_counts INT UNSIGNED)
    BEGIN
        DELETE FROM `test` WHERE `id` = user_id;
        SELECT COUNT(`id`) FROM `test` INTO user_counts;
    END %%

DELIMITER ;

SET @myvar1 = 7;
SELECT @myvar1;

# SQL中写变量语法 @user_total_counts
# 局部变量
# - 在 BEGIN ... END 语句块声明局部变量
# - 在 BEGIN ... END 语句块之间有效
# - 在 BEGIN ... END 语句块 运行完成后局部变量消失
#
# 用户变量
# SELECT COUNT(`id`) FROM `test` INTO user_counts;
# SET @myvar1 = 7;
# 与MySQL客户端绑定,只对当前用户所使用的客户端生效
#
CALL remove_user_by_id_and_return_user_counts(4,@user_total_counts);

SELECT @user_total_counts;

# 得到插入和更新的被影响到的记录数
SELECT ROW_COUNT();

DESC `user4`;
DELETE FROM `user4`;
SELECT * FROM `user4`;
INSERT INTO `user4` VALUES
    (NULL,'user1',MD5('user1'),1,1),
    (NULL,'user2',MD5('user2'),2,0),
    (NULL,'user3',MD5('user3'),3,1);
SELECT * FROM `user4`;
SELECT ROW_COUNT();

UPDATE `user4` SET `username` = 'user11' WHERE `username` = 'user1';
SELECT ROW_COUNT();

DELETE FROM `user4` WHERE `username` = 'user1';
DELETE FROM `user4` WHERE `username` = 'user11';
SELECT ROW_COUNT();

# 可以带有多个IN参数 和 OUT返回值

# 根据 first_name 删除用户 IN 类型参数
# 返回1 删除的用户 OUT 类型参数
# 返回2 剩余的用户 OUT 类型参数

DROP PROCEDURE remove_user_by_id_and_return_infos;

DELIMITER **

CREATE PROCEDURE remove_user_by_id_and_return_infos(
    IN delete_first_name_prefix VARCHAR(128),
    OUT deleted_user_counts INT UNSIGNED,
    OUT remain_user_counts INT UNSIGNED)
    BEGIN
        DELETE FROM `test` WHERE `first_name` LIKE CONCAT(delete_first_name_prefix,'%');
        SELECT ROW_COUNT() INTO deleted_user_counts;
        SELECT COUNT(`id`) FROM `test` INTO remain_user_counts;
    END **

DELIMITER ;

CALL remove_user_by_id_and_return_infos('x',@deleted_user_counts,@remain_user_counts);
SELECT @deleted_user_counts;
SELECT @remain_user_counts;
SELECT COUNT(id) FROM `test`;
SELECT * FROM `test`;












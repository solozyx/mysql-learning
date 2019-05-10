#!/usr/bin/env bash

SET NAMES gbk;

USE `test`;

SELECT NOW();
SELECT DATE_FORMAT(NOW(),'%Y年%m月%d日 %H时:%i分:%s秒');

CREATE FUNCTION now_to_local() RETURNS VARCHAR(30)
    RETURN DATE_FORMAT(NOW(),'%Y年%m月%d日 %H时:%i分:%s秒');

SELECT NOW_TO_LOCAL();
SELECT now_to_local();


CREATE FUNCTION num_avg(num1 SMALLINT UNSIGNED,num2 SMALLINT UNSIGNED)
    RETURNS FLOAT(10,2) UNSIGNED
    RETURN (num1+num2)/2;

SELECT num_avg(1,2);

SELECT * FROM `test`;

DELIMITER $$

CREATE FUNCTION add_user(first_name VARCHAR(20)) RETURNS INT UNSIGNED
    BEGIN
        INSERT INTO `test`(`first_name`) VALUES (first_name);
        RETURN LAST_INSERT_ID();
    END $$


SELECT add_user('user_fun_1') $$

DELIMITER ;

SELECT add_user('user_fun_2');

#!/usr/bin/env bash

SELECT CONNECTION_ID();

SELECT DATABASE();

DESC `test`;
SELECT LAST_INSERT_ID();

# error
# ALTER TABLE `test` ADD COLUMN `id` SAMLLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY FIRST;

alter table `test` add `id` smallint unsigned key auto_increment first;

SELECT * FROM `test`;

INSERT INTO `test` VALUES(NULL,'a','b');

SELECT LAST_INSERT_ID();

INSERT INTO `test` VALUES(NULL,'x1','y1'),
(NULL,'x2','y2'),
(NULL,'x3','y3');

SELECT LAST_INSERT_ID();

SELECT USER();
SELECT VERSION();



#!/usr/bin/env bash
mysql -h127.0.0.1 -uroot -P3306 -proot
SHOW DATABASES;
CREATE DATABASE `test`;
USE `test`;
#查看当前在哪个数据库
SELECT DATABASE();
SHOW TABLES;
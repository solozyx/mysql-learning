#!/usr/bin/env bash

SELECT 3 + 5;

SELECT CEIL(3.00);
SELECT CEIL(3.01);
SELECT FLOOR(3.01);
SELECT FLOOR(3.99);

SELECT 3 / 4;
SELECT 3 DIV 4;

SELECT 5 % 3;
SELECT 5 MOD 3;

SELECT 5.5 MOD 3.333;

# 3^2
SELECT POWER(3,2);

SELECT ROUND(3.652,2);
SELECT ROUND(3.652,1);
SELECT ROUND(3.652,0);

SELECT TRUNCATE(1253.891,2);
SELECT TRUNCATE(1253.897,2);
SELECT TRUNCATE(1253.897,1);
SELECT TRUNCATE(1253.897,0);
SELECT TRUNCATE(1253.897,-1);
SELECT TRUNCATE(1253.897,-2);
SELECT TRUNCATE(1253.897,-3);
SELECT TRUNCATE(1253.897,-4);



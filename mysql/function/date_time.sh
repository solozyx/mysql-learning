#!/usr/bin/env bash

SELECT NOW();

SELECT CURDATE();
SELECT CURTIME();

SELECT DATE_ADD(CURDATE(),INTERVAL 365 DAY);
SELECT DATE_ADD('2019-5-10',INTERVAL 365 DAY);
SELECT DATE_ADD('2019-05-10',INTERVAL 365 DAY);

SELECT DATE_ADD(CURDATE(),INTERVAL -365 DAY);
SELECT DATE_ADD('2019-5-10',INTERVAL -365 DAY);
SELECT DATE_ADD('2019-05-10',INTERVAL -365 DAY);

SELECT DATE_ADD(CURDATE(),INTERVAL 1 YEAR);
SELECT DATE_ADD(CURDATE(),INTERVAL 1 MONTH);
SELECT DATE_ADD(CURDATE(),INTERVAL 1 WEEK);

SELECT DATEDIFF('2018-5-10','2019-5-10');

SELECT DATE_FORMAT('2019-5-10','%m/%d/%Y');
SELECT DATE_FORMAT('2019-5-10','%m/%d/%y');


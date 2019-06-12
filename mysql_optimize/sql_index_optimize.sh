#!/usr/bin/env bash

mysql> select version();
+-----------+
| version() |
+-----------+
| 5.7.26    |
+-----------+
1 row in set (0.00 sec)
mysql>

show variables like 'slow_query_log';
set global slow_query_log = ON;

show variables like '%log%';
show variables like 'log_queries_not_using_indexes';
set global log_queries_not_using_indexes = ON;

show variables like 'long_query_time';
set global long_query_time = 1;

show variables like 'slow%';

select * from store limit 10;

mysqldumpslow -h

mysqldumpslow -t 3  /usr/local/mysql/data/CentOS3-slow.log | more

# 安装 pt-query-digest
yum -y install perl-DBI perl-DBD-MySQL perl-Time-HiRes perl-IO-Socket-SSL
wget percona.com/get/pt-query-digest
chmod u+x pt-query-digest

explain select max (`payment_date`) from `payment`\G

# 全表扫描 创建 覆盖索引
create index index_payment_date on `payment`(`payment_date`);

create table `t`(`id` tinyint);
create table `t1`(`tid` tinyint);

insert into `t` values(1),(2),(null);
select count(*),count(id) from `t`;

SELECT COUNT(`release_year`=2006 OR NULL) AS '2006 films',
      COUNT(`release_year`=2007 OR NULL) AS '2007 films'
      FROM `film`;

SELECT COUNT(`release_year`='2006' OR NULL) AS '2006 films',
      COUNT(`release_year`='2007' OR NULL) AS '2007 films'
      FROM `film`;

INSERT INTO `t1` VALUES(1);

# 子查询
SELECT * FROM `t` WHERE `t`.`id` IN (SELECT `t1`.`tid` FROM `t1`);

# 内连接
SELECT `t`.`id` FROM `t`
    JOIN `t1`
        ON `t`.`id` = `t1`.`tid`;

INSERT INTO `t1` VALUES(1);
SELECT `t1`.`tid` FROM `t1`;
SELECT `t`.`id` FROM `t`;

SELECT * FROM `t` WHERE `t`.`id` IN (SELECT `t1`.`tid` FROM `t1`);

SELECT `t`.`id` FROM `t`
    JOIN `t1`
        ON `t`.`id` = `t1`.`tid`;

SELECT DISTINCT `t`.`id` FROM `t`
    JOIN `t1`
        ON `t`.`id` = `t1`.`tid`;

desc `actor`;
SHOW CREATE TABLE `actor`\G
desc `film_actor`;
SHOW CREATE TABLE `film_actor`\G


EXPLAIN SELECT `actor`.`first_name`,`actor`.`last_name`,COUNT(*)
    FROM `film_actor` INNER JOIN `actor` USING(`actor_id`)
        GROUP BY `film_actor`.`actor_id`\G


EXPLAIN SELECT `actor`.`first_name`,`actor`.`last_name`,c.cnt
    FROM `actor` INNER JOIN (
        SELECT `actor_id`,COUNT(*) AS cnt FROM `film_actor` GROUP BY `actor_id`
    )AS c USING(`actor_id`) \G


EXPLAIN SELECT `film_id`,`description` FROM `film` ORDER BY `title` LIMIT 50, 5\G

EXPLAIN SELECT `film_id`,`description` FROM `film` ORDER BY `film_id` LIMIT 50, 5\G
EXPLAIN SELECT `film_id`,`description` FROM `film` ORDER BY `film_id` LIMIT 500, 5\G
EXPLAIN SELECT `film_id`,`description` FROM `film` ORDER BY `film_id` LIMIT 800, 5\G

EXPLAIN SELECT `film_id`,`description` FROM `film`
    WHERE `film_id` > 55 AND `film_id` <= 60
        ORDER BY `film_id` LIMIT 1, 5\G


EXPLAIN SELECT `film_id`,`description` FROM `film`
    WHERE `film_id` > 500 AND `film_id` <= 505
        ORDER BY `film_id` LIMIT 1, 5\G


EXPLAIN SELECT `film_id`,`description` FROM `film`
    WHERE `film_id` > 800 AND `film_id` <= 805
        ORDER BY `film_id` LIMIT 1, 5\G

SELECT COUNT(DISTINCT `customer_id`),COUNT(DISTINCT `staff_id`) FROM `payment`;

use information_schema;

SELECT a.TABLE_SCHEMA AS '???', a.TABLE_NAME AS '??', a.INDEX_NAME AS '??1', b.INDEX_NAME AS '??2', a.COLUMN_NAME AS '????'
    FROM STATISTICS a
    JOIN STATISTICS b
    ON a.TABLE_SCHEMA=b.TABLE_SCHEMA
        AND a.TABLE_NAME=b.TABLE_NAME
        AND a.SEQ_IN_INDEX=b.SEQ_IN_INDEX
        AND a.COLUMN_NAME=b.COLUMN_NAME
            WHERE a.SEQ_IN_INDEX=1
                AND a.INDEX_NAME<>b.INDEX_NAME\G

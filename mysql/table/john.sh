#!/usr/bin/env bash


CREATE TABLE IF NOT EXISTS `tdb_goods`(
    `goods_id`    SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `goods_name`  VARCHAR(150) NOT NULL,
    `goods_cate`  VARCHAR(40)  NOT NULL,
    `brand_name`  VARCHAR(40)  NOT NULL,
    `goods_price` DECIMAL(15,3) UNSIGNED NOT NULL DEFAULT 0,
    `is_show`     BOOLEAN NOT NULL DEFAULT 1,
    `is_saleoff`  BOOLEAN NOT NULL DEFAULT 0
);

SHOW COLUMNS FROM `tdb_goods`;

INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('R510VC 15.6英寸笔记本','笔记本','华硕','3399',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('Y400N 14.0英寸笔记本电脑','笔记本','联想','4899',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('G150TH 15.6英寸游戏本','游戏本','雷神','8499',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('X550CC 15.6英寸笔记本','笔记本','华硕','2799',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('X240(20ALA0EYCD) 12.5英寸超极本','超级本','联想','4999',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('U330P 13.3英寸超极本','超级本','联想','4299',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('SVP13226SCB 13.3英寸触控超极本','超级本','索尼','7999',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('iPad mini MD531CH/A 7.9英寸平板电脑','平板电脑','苹果','1998',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('iPad Air MD788CH/A 9.7英寸平板电脑 （16G WiFi版）','平板电脑','苹果','3388',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES(' iPad mini ME279CH/A 配备 Retina 显示屏 7.9英寸平板电脑 （16G WiFi版）','平板电脑','苹果','2788',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('IdeaCentre C340 20英寸一体电脑 ','台式机','联想','3499',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('Vostro 3800-R1206 台式电脑','台式机','戴尔','2899',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('iMac ME086CH/A 21.5英寸一体电脑','台式机','苹果','9188',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('AT7-7414LP 台式电脑 （i5-3450四核 4G 500G 2G独显 DVD 键鼠 Linux ）','台式机','宏碁','3699',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('Z220SFF F4F06PA工作站','服务器/工作站','惠普','4288',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('PowerEdge T110 II服务器','服务器/工作站','戴尔','5388',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('Mac Pro MD878CH/A 专业级台式电脑','服务器/工作站','苹果','28888',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES(' HMZ-T3W 头戴显示设备','笔记本配件','索尼','6999',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('商务双肩背包','笔记本配件','索尼','99',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('X3250 M4机架式服务器 2583i14','服务器/工作站','IBM','6888',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('玄龙精英版 笔记本散热器','笔记本配件','九州风神','',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES(' HMZ-T3W 头戴显示设备','笔记本配件','索尼','6999',DEFAULT,DEFAULT);
INSERT tdb_goods (goods_name,goods_cate,brand_name,goods_price,is_show,is_saleoff) VALUES('商务双肩背包','笔记本配件','索尼','99',DEFAULT,DEFAULT);

# 聚合函数只有1个返回值
SELECT AVG(`goods_price`) FROM `tdb_goods`;
# 四舍五入 保留到小数点后2位
SELECT ROUND(AVG(`goods_price`),2) FROM `tdb_goods`;

SELECT `goods_id`,`goods_name`,`goods_price` FROM `tdb_goods`
    WHERE `goods_price` >= 5636.36;

SELECT `goods_id`,`goods_name`,`goods_price` FROM `tdb_goods`
    WHERE `goods_price` >=
        (SELECT ROUND(AVG(`goods_price`),2) FROM `tdb_goods`);

SELECT `goods_id`,`goods_name`,`goods_price` FROM `tdb_goods`
    WHERE `goods_price` >=
        (SELECT `goods_price` FROM `tdb_goods` WHERE `goods_cate` = '超级本');

SELECT `goods_id`,`goods_name`,`goods_price` FROM `tdb_goods`
    WHERE `goods_price` >
        ANY (SELECT `goods_price` FROM `tdb_goods` WHERE `goods_cate` = '超级本');

SELECT `goods_id`,`goods_name`,`goods_price` FROM `tdb_goods`
    WHERE `goods_price` >
        ALL (SELECT `goods_price` FROM `tdb_goods` WHERE `goods_cate` = '超级本');

SELECT `goods_id`,`goods_name`,`goods_price` FROM `tdb_goods`
    WHERE `goods_price` =
        ALL (SELECT `goods_price` FROM `tdb_goods` WHERE `goods_cate` = '超级本');

SELECT `goods_id`,`goods_name`,`goods_price` FROM `tdb_goods`
    WHERE `goods_price` =
        SOME (SELECT `goods_price` FROM `tdb_goods` WHERE `goods_cate` = '超级本');


SELECT `goods_id`,`goods_name`,`goods_price` FROM `tdb_goods`
    WHERE `goods_price` <>
        ALL (SELECT `goods_price` FROM `tdb_goods` WHERE `goods_cate` = '超级本');

SELECT `goods_id`,`goods_name`,`goods_price` FROM `tdb_goods`
    WHERE `goods_price` NOT IN
       (SELECT `goods_price` FROM `tdb_goods` WHERE `goods_cate` = '超级本');

CREATE TABLE IF NOT EXISTS `tdb_goods_cate`(
    `cate_id`    SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `cate_name`  VARCHAR(40) NOT NULL
);

SELECT `goods_cate` FROM `tdb_goods` GROUP BY `goods_cate`;

INSERT `tdb_goods_cate`(`cate_name`)
    SELECT `goods_cate` FROM `tdb_goods` GROUP BY `goods_cate`;

SELECT  * FROM `tdb_goods_cate`;
SELECT `goods_id`,`goods_cate` FROM `tdb_goods`;

# JOIN

# 更新 `tdb_goods` 表
# tdb_goods 内连接 tdb_goods_cate 表
# ON 连接条件
# SET 更新的值
UPDATE `tdb_goods`
    INNER JOIN `tdb_goods_cate`
    ON `goods_cate` = `cate_name`
    SET `goods_cate` = `cate_id`;


SELECT `brand_name` FROM `tdb_goods` GROUP BY `brand_name`;


CREATE TABLE IF NOT EXISTS `tdb_goods_brand`
(
    `brand_id`    SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `brand_name`  VARCHAR(40) NOT NULL
)
SELECT `brand_name` FROM `tdb_goods` GROUP BY `brand_name`;
SELECT * FROM `tdb_goods_brand`;

# 更新 `tdb_goods` 表
# tdb_goods 内连接 tdb_goods_brand 表
# ON 连接条件
# SET 更新的值
UPDATE `tdb_goods`
    INNER JOIN `tdb_goods_brand`
    ON `tdb_goods`.`brand_name` = `tdb_goods_brand`.`brand_name`
    SET `tdb_goods`.`brand_name` = `tdb_goods_brand`.`brand_id`;

SELECT `goods_id`,`goods_cate`,`brand_name` FROM `tdb_goods`;

DESC `tdb_goods`;

ALTER TABLE `tdb_goods`
    CHANGE `goods_cate` `cate_id` SMALLINT UNSIGNED NOT NULL,
    CHANGE `brand_name` `brand_id` SMALLINT UNSIGNED NOT NULL;
DESC `tdb_goods`;

INSERT `tdb_goods_cate`(`cate_name`) VALUES('路由器'),('交换机'),('网卡');

INSERT `tdb_goods_brand`(`brand_name`) VALUES('海尔'),('清华同方'),('神舟');

INSERT `tdb_goods`(`goods_name`,`cate_id`,`brand_id`,`goods_price`)
    VALUES(' LaserJet Pro P1606dn 黑白激光打印机','12','4','1849');


SELECT `goods_id`,`cate_id`,`brand_id` FROM `tdb_goods`;
SELECT `cate_id`,`cate_name` FROM `tdb_goods_cate`;

SELECT `goods_id`,`goods_name`,`tdb_goods_cate`.`cate_id`
    FROM `tdb_goods` INNER JOIN `tdb_goods_cate`
    ON `tdb_goods`.`cate_id` = `tdb_goods_cate`.`cate_id`;

SELECT `goods_id`,`goods_name`,`tdb_goods_cate`.`cate_id`
    FROM `tdb_goods` LEFT JOIN `tdb_goods_cate`
    ON `tdb_goods`.`cate_id` = `tdb_goods_cate`.`cate_id`;


SELECT `goods_id`,`goods_name`,`tdb_goods_cate`.`cate_id`
    FROM `tdb_goods` RIGHT JOIN `tdb_goods_cate`
    ON `tdb_goods`.`cate_id` = `tdb_goods_cate`.`cate_id`;


SELECT `goods_id`,`goods_name`,`cate_name`,`brand_name`
    FROM `tdb_goods` AS g
        INNER JOIN `tdb_goods_cate` AS c ON g.`cate_id` = c.`cate_id`
        INNER JOIN `tdb_goods_brand` AS b ON g.`brand_id` = b.`brand_id`;


SELECT `goods_id`,`cate_name`,`brand_name`
    FROM `tdb_goods` AS g
        INNER JOIN `tdb_goods_cate` AS c ON g.`cate_id` = c.`cate_id`
        INNER JOIN `tdb_goods_brand` AS b ON g.`brand_id` = b.`brand_id`;

SELECT * FROM `tdb_goods_cate`;

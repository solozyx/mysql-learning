#!/usr/bin/env bash

# 无限分类的数据表设计

CREATE TABLE IF NOT EXISTS `tdb_goods_types`(
     `type_id`   SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     `type_name` VARCHAR(20) NOT NULL,
     `parent_id` SMALLINT UNSIGNED NOT NULL DEFAULT 0
);

DESC `tdb_goods_types`;

INSERT tdb_goods_types(type_name,parent_id) VALUES('家用电器',DEFAULT);
INSERT tdb_goods_types(type_name,parent_id) VALUES('电脑、办公',DEFAULT);
INSERT tdb_goods_types(type_name,parent_id) VALUES('大家电',1);
INSERT tdb_goods_types(type_name,parent_id) VALUES('生活电器',1);
INSERT tdb_goods_types(type_name,parent_id) VALUES('平板电视',3);
INSERT tdb_goods_types(type_name,parent_id) VALUES('空调',3);
INSERT tdb_goods_types(type_name,parent_id) VALUES('电风扇',4);
INSERT tdb_goods_types(type_name,parent_id) VALUES('饮水机',4);
INSERT tdb_goods_types(type_name,parent_id) VALUES('电脑整机',2);
INSERT tdb_goods_types(type_name,parent_id) VALUES('电脑配件',2);
INSERT tdb_goods_types(type_name,parent_id) VALUES('笔记本',9);
INSERT tdb_goods_types(type_name,parent_id) VALUES('超级本',9);
INSERT tdb_goods_types(type_name,parent_id) VALUES('游戏本',9);
INSERT tdb_goods_types(type_name,parent_id) VALUES('CPU',10);
INSERT tdb_goods_types(type_name,parent_id) VALUES('主机',10);

SELECT * FROM `tdb_goods_types`;

# 自身连接
SELECT sub.`type_id`,sub.`type_name`,parent.`type_name`
    FROM `tdb_goods_types` AS sub
        LEFT JOIN `tdb_goods_types` AS parent
            ON sub.`parent_id` = parent.`type_id`;


SELECT parent.`type_id`,parent.`type_name`,sub.`type_name`
    FROM `tdb_goods_types` AS parent
        LEFT JOIN `tdb_goods_types` AS sub
            ON parent.`type_id` = sub.`parent_id`;


SELECT parent.`type_id`,parent.`type_name`,sub.`type_name`
    FROM `tdb_goods_types` AS parent
        LEFT JOIN `tdb_goods_types` AS sub
            ON parent.`type_id` = sub.`parent_id`
                GROUP BY parent.`type_name`
                ORDER BY parent.`type_id`;


SELECT parent.`type_id`,parent.`type_name`,COUNT(sub.`type_name`) AS `child_count`
    FROM `tdb_goods_types` AS parent
        LEFT JOIN `tdb_goods_types` AS sub
            ON parent.`type_id` = sub.`parent_id`
                GROUP BY parent.`type_name`
                ORDER BY parent.`type_id`;


SELECT `goods_id`,`goods_name` FROM `tdb_goods`
    GROUP BY `goods_name`
        HAVING COUNT(`goods_name`) >= 2
    ORDER BY `goods_id`;


DELETE t1 FROM `tdb_goods` AS t1
    LEFT JOIN (SELECT `goods_id`,`goods_name` FROM `tdb_goods`
                GROUP BY `goods_name` HAVING COUNT(`goods_name`) >= 2) AS t2
        ON t1.`goods_name` = t2.`goods_name`
            WHERE t1.`goods_id` > t2.`goods_id`;


SELECT `goods_id`,`goods_name` FROM `tdb_goods`;
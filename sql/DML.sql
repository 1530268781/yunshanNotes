#DML语言 数据操作语言
/*
插入：insert
修改:update
删除：delete
*/

#一、插入语句
/*
方式一：
语法：
insert into 表名(列名1，...) values(值1，...)
*/

#1.插入的值的类型要与列的类型一致,且一一对应
INSERT INTO beauty(id,NAME,sex,borndate,phone,photo,boyfriend_id)
VALUES(13,'唐艺昕','女','1990-4-23','19822223333',NULL,2);

#2.不可以为null的列必须插入值；可以为null的列如何插入值
#方式一
INSERT INTO beauty(id,NAME,sex,borndate,phone,photo,boyfriend_id)
VALUES(13,'唐艺昕','女','1990-4-23','19822223333',NULL,2);

#方式二（不写列名）
INSERT INTO beauty(id,NAME,sex,borndate,phone,boyfriend_id)
VALUES(14,'金星','女','1990-4-23','19822223333',2);

#3.列的顺序可以调换
INSERT INTO beauty(NAME,sex,phone,id)
VALUES('蒋欣','女','1235677764',15);

#4.可以省略列名，默认所有列，且列的顺序和表中列的顺序一致
INSERT INTO beauty
VALUES(16,'张飞','男',NULL,'119',NULL,NULL);


/*
方式二：
语法：
insert into 表名
set 列名1=值1，列名2=值2，...
*/
INSERT INTO beauty
SET id=17,NAME='刘涛',phone='1928384940984'

#两种方式对比
#方式一支持插入多行，方式二不支持
INSERT INTO beauty
VALUES(18,'唐艺昕','女','1990-4-23','19822223333',NULL,2),
(19,'唐艺昕','女','1990-4-23','19822223333',NULL,2),
(20,'唐艺昕','女','1990-4-23','19822223333',NULL,2);

#方式一支持子查询，方式二不支持
INSERT INTO beauty(id,NAME,phone)
SELECT 21,'宋茜','123478583493';

#二、修改数据
/*
1.修改单表的记录
update 表名
set 列=新值，列=新值
where 筛选条件;

2.修改多表的记录【补充】
(1)sql192语法：
update 表1 别名，表2 别名
set 列=值，...
where 连接条件
and 筛选条件

(2)sql199语法：
update 表1 别名
inner|left|right join 表2 别名
on 连接条件
set 列=值，...
where 筛选条件

*/

#1.修改单表
#案例1：修改beauty表中姓唐的电话为000000000
UPDATE beauty
SET phone='000000000'
WHERE NAME LIKE '唐%'

#修改boys表中id为2的名称为张飞，魅力值为10
UPDATE boys
SET boyname='张飞',userCP=10
WHERE id=2;

#2.修改多表
#案例1：修改张无忌的女朋友的手机号为11111111
UPDATE boys bo
INNER JOIN beauty be 
ON bo.`id`=be.`boyfriend_id`
SET phone='1111111111'
WHERE bo.boyName='张无忌';

#案例2：修改没有男朋友的女生的男朋友编号都为2
#(1)左外连接
SELECT * FROM
beauty be LEFT OUTER JOIN boys bo
ON be.`boyfriend_id`=bo.`id`

UPDATE beauty be
LEFT OUTER JOIN boys bo 
ON be.`boyfriend_id`=bo.`id`
SET boyfriend_id=2
WHERE boyfriend_id IS NULL

#(2)右外连接
SELECT * FROM
boys bo RIGHT OUTER JOIN beauty be
ON bo.`id`=be.`boyfriend_id`

UPDATE boys bo 
LEFT OUTER JOIN beauty be
ON bo.`id`=be.`boyfriend_id`
SET boyfriend_id=2
WHERE boyfriend_id IS NULL

#三、删除语句
/*
方式一：delete
语法：
	1.单表的删除
	delete from 表名 where 筛选条件
	
	2.多表的删除【补充】
	（1）sql192语法
		delete 表1的别名，表2的别名 （要删除哪个表的记录就写哪个表别名）
		from 表1 别名，表2 别名
		where 连接条件
		and 筛选条件
	（2）sql199语法
		delete 表1的别名，表2的别名
		from 表1 别名
		inner|left|right| join 表2 别名
		on 连接条件
		where 筛选条件
	
方式二：truncate 删除整个表的数据
语法：truncate table 表名；
*/

#1.单表的删除
#案例：删除手机号以9结尾的女神信息
DELETE FROM beauty WHERE phone LIKE '%9'

#2.多表的删除
#案例：删除张无忌女朋友的信息
DELETE be
FROM boys bo 
JOIN beauty be
ON be.`boyfriend_id`=bo.`id`
WHERE bo.`boyName`='张无忌';

#案例：删除黄晓明及其女朋友的信息
DELETE be,bo
FROM boys bo 
JOIN beauty be
ON be.`boyfriend_id`=bo.`id`
WHERE bo.`boyName`='黄晓明';

#3.truncate删除（清空表数据）
TRUNCATE TABLE boys

/*
truncate table boys 与 delete from boys 对比 【面试题】
1.都能清空表数据
2.truncate删除效率稍微高一点点
3.用delete删除在插入数据，自增长序列的值从断点开始；用truncate删除再插入数据，自增长序列的值从1开始
4.delete删除有返回值；truncate删除没有返回值
5.truncate删除后不能回滚，delete删除可以回滚
*/



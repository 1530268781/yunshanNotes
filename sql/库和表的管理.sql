#DDL
/*
数据定义语言
库和表的管理：创建、修改、删除
创建：create
修改：alter
删除：drop
*/

#一、库的管理
#1.库的创建
/*
语法：create database 库名
*/
CREATE DATABASE books;
#如果库不存在则创建
CREATE DATABASE IF NOT EXISTS books;


#2.库的修改（一般不修改）
RENAME DATABASE books TO 新库名;【不安全，已废弃】

#更改库的字符集设置（默认utf8）
ALTER DATABASE books CHARACTER SET gbk;


#3.库的删除
DROP DATABASE books;
#如果存在则删除
DROP DATABASE IF EXISTS books;



#二、表的管理
#1.表的创建
/*
create table 表名(
	列名 列的类型 [(长度) 约束],
	列名 列的类型 [(长度) 约束],
	列名 列的类型 [(长度) 约束],
	...
	列名 列的类型 [(长度) 约束],
)
*/

#案例：创建表book
USE books;
CREATE TABLE IF NOT EXISTS book(
	id INT,#编号
	bName VARCHAR(20),#书名
	price DOUBLE,#价格
	author VARCHAR(20),#作者编号
	pulishDate DATETIME#出版日期
);
DESC book;

#案例：创建表author
CREATE TABLE author(
	id INT,
	au_name VARCHAR(20),
	nation VARCHAR(20)
)
DESC author;

#2.表的修改
/*
alter table 表名 add|drop|modify|change column
*/
#（1）修改列名
ALTER TABLE book CHANGE COLUMN publishDate pubData DATETIME;

#（2）修改列的类型或约束
ALTER TABLE book MODIFY COLUMN pubData TIMESTAMP;

#（3）添加新列
ALTER TABLE author ADD COLUMN annual DOUBLE; #年薪

#（4）删除列
ALTER TABLE author DROP COLUMN annual;
ALTER TABLE author DROP COLUMN IF NOT EXISTS annual;


#（5）修改表名
ALTER TABLE author RENAME TO book_author;

#3.表的删除
DROP TABLE book_author;
DROP TABLE IF EXISTS book_author;


SHOW TABLES;


#4.表的复制
INSERT INTO author VALUES
(1,'村上春树','日本'),
(2,'莫言','中国'),
(3,'冯唐','中国'),
(4,'金庸','中国');

#(1)仅仅复制表的结构
CREATE TABLE copy LIKE author;

#(2)复制表的结构+数据
CREATE TABLE copy1 SELECT * FROM author;

#(3)只复制部分数据
CREATE TABLE copy2
SELECT id,au_name
FROM author
WHERE nation='中国';

#(4)仅仅复制表的部分结构
CREATE TABLE copy3
SELECT id,au_name
FROM author
WHERE 1=2; #恒不成立，没有数据

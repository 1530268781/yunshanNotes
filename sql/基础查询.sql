#查询基础
/*
语法：select 查询列名`departments` from 表名;
*/
#1.查询表中单个字段
SELECT 
  last_name 
FROM
  employees ;

#2.查询表中多个字段
SELECT 
  last_name,
  salary,
  email 
FROM
  employees ;

#3.查询所有字段
SELECT * FROM employees

#4.查询常量值
SELECT 100

#5.查询表达式
SELECT 100%98

#6.查询函数
SELECT VERSION();

#7.为字段起别名
/*
便于理解
如果要查询的字段有重名的情况，使用别名可以区分开来
*/
#方式1
SELECT 100%98 AS 结果
SELECT last_name AS 姓,first_name AS 名 FROM employees
#方式2
SELECT last_name 姓,first_name 名 FROM employees
#别名中含特殊符号(用双引号)
SELECT salary AS "out put" FROM employees

#8.去重(关键字：distinct)
SELECT DISTINCT department_id FROM employees

#9.+号的作用
/*
select 100+90;两个操作数都为数值型，则做加法运算
其中一方为字符型，试图将字符型转换为数值型
select '100'+90;	=190
select 'John'+90;	=0+90=90
select null+90;只要其中一方为null,则结果肯定为null
*/

#10.拼接(关键字：concat)
SELECT CONCAT(last_name,first_name) AS 姓名 FROM employees
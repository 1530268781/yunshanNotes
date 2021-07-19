SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct <=> NULL
	
#案例三：查询员工号为176的姓名、部门号和年薪
/*
年薪=salary*12*(1+年薪率)
年薪率可能为NULL，为NULL时当作0
年薪=salary*12*IFNULL(commission_pct,0)
*/
SELECT
	last_name,
	department_id,
	salary*12*(1+IFNULL(commission_pct,0)) AS 年薪
FROM
	employees
	
#进阶三：排序查询
/*
语法:
select
	要查询的东西
from
	表
【where 
	条件】

order by 排序的字段|表达式|别名|函数 【asc|desc】
*/
#案例一：查询员工信息，要求按工资从高到低排序
SELECT *
FROM employees
ORDER BY salary ASC;

#案例二：查询部门编号>=90的员工信息，按入职时间的先后排序
SELECT * 
FROM employees 
WHERE department_id >= 90 
ORDER BY hiredate ASC;

#案例三：按年薪高低显示员工的信息和年薪【按表达式|别名排序】
SELECT *,salary*12*(1+IFNULL(commission_pct,0)) 年薪
FROM employees
ORDER BY salary*12*(1+IFNULL(commission_pct,0)) DESC;

SELECT *,salary*12*(1+IFNULL(commission_pct,0)) 年薪
FROM employees
ORDER BY 年薪 DESC;

#案例四：按姓名的长度显示员工信姓名和工资【按函数排序】
SELECT LENGTH(last_name) 姓名长度,last_name,salary
FROM employees
ORDER BY LENGTH(last_name) DESC;

#案例五：查询员工信息，要求先按工资升序排序，如果工资相同，再按员工编号降序排序【按多个字段排序】
SELECT *
FROM employees
ORDER BY salary ASC,employee_id DESC;
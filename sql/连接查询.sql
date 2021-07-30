#连接查询（多表查询）

SELECT * FROM beauty;

SELECT * FROM boys;

#笛卡尔乘积现象(没有有效的连接条件)
SELECT * FROM beauty,boys;
SELECT `name`,boyName FROM beauty,boys;

#添加有效的连接条件
SELECT `name`,boyName FROM beauty,boys
WHERE beauty.boyfriend_id = boys.id;

/*
分类：
	按年代分类：
	sq129标准：仅支持内连接
	sql199标准【推荐】支持内连接+外连接（左外连接、右外连接）+交叉连接
	
	按功能分：
		内连接：
			等值连接
			非等职连接
			自连接
		外连接：
			左外连接
			右外连接
			全外连接
		交叉连接
*/

#sql92标准
#1.等值连接
#案例1：查询女生名对应的男生名
SELECT `name`,boyName FROM beauty,boys
WHERE beauty.boyfriend_id = boys.id;

#案例2：查询员工名和对应的部门名
SELECT last_name,department_name
FROM employees,departments
WHERE employees.`department_id`=departments.`department_id`;

#2.为表名起别名
#案例1：查询员工号、工种号、工种名
SELECT last_name,employees.job_id,job_title
FROM employees,jobs
WHERE employees.`job_id`=jobs.`job_id`;

SELECT last_name,e.job_id,job_title
FROM employees AS e,jobs AS j
WHERE e.`job_id`=j.`job_id`;

#3.加筛选条件
#案例1：查询有奖金的员工们和部门名
SELECT last_name,department_name
FROM employees e,departments d
WHERE e.`department_id`=d.`department_id`
AND e.`commission_pct` IS NOT NULL; 
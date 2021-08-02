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
	sq129标准：仅支持内连接（等值、非等值、自连接）
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

#为表名起别名
#案例1：查询员工号、工种号、工种名
SELECT last_name,employees.job_id,job_title
FROM employees,jobs
WHERE employees.`job_id`=jobs.`job_id`;

SELECT last_name,e.job_id,job_title
FROM employees AS e,jobs AS j
WHERE e.`job_id`=j.`job_id`;

#加筛选条件
#案例1：查询有奖金的员工们和部门名
SELECT last_name,department_name
FROM employees e,departments d
WHERE e.`department_id`=d.`department_id`
AND e.`commission_pct` IS NOT NULL; 

#2.非等值连接 
#案例1：查询员工的工资和工资级别
SELECT salary,grade_level
FROM employees,job_grades g
WHERE salary BETWEEN g.`lowest_sal` AND `highest_salary`;

#3.自连接
#案例1：查询员工名和上级的名称
SELECT e1.last_name 员工名,e2.last_name 领导名
FROM employees e1,employees e2
WHERE e1.manager_id = e2.employee_id

#sql99标准
/*
语法：
	select 查询列表
	from 表1 别名 【连接类型】
	join 表2 别名
	on 连接条件
	【where 筛选条件】
	【group by 分组】
	【having 筛选条件】
	【order by 排序列表】
	
分类：
	内连接：inner
	外连接：
		左外：left 【outer】
		右外：right 【outer】
		全外：full 【outer】
	交叉连接：cross
*/
#一、内连接
/*
语法：
select 查询列表
from 表1 别名
inner join 表2 别名
On 连接条件
*/
#（1）等值连接
#案例1：查询员工名和对应的部门名
SELECT last_name,department_name
FROM employees e
INNER JOIN departments d
ON e.`department_id`=d.`department_id`

#案例2：查询有奖金的员工们和部门名
SELECT last_name,department_name
FROM employees e
INNER JOIN departments d
ON e.`department_id`=d.`department_id`
WHERE e.`commission_pct` IS NOT NULL; 

#（2）非等值连接
#案例1：查询员工的工资和工资级别
SELECT salary,grade_level
FROM employees e
INNER JOIN job_grades g
ON e.salary BETWEEN g.`lowest_sal` AND `highest_salary`;

#（3）自连接
#案例1：查询员工名和上级的名称
SELECT e1.last_name 员工名,e2.last_name 领导名
FROM employees e1
INNER JOIN employees e2
ON e1.manager_id = e2.employee_id

#二、外连接
/*
应用场景：一个表中有，另外一个表没有的记录
1.外连接查询结果为主表中的所有记录
	如果从表中有和它匹配的，则显示匹配的值
	如果没有和它匹配的，则显示null
	外连接查询结果=内连接结果+主表中有而从表中没有的记录
2.left join:左边是主表
right join:右边是主表
*/
#案例1：查询男朋友不在男生表中女生名
SELECT be.name,bo.*
FROM beauty be
LEFT OUTER JOIN boys bo
ON be.`boyfriend_id`=bo.`id`
WHERE bo.`id` IS NULL;

#案例2：查询哪个部门没有员工
SELECT d.*,e.employee_id
FROM departments d
LEFT OUTER JOIN employees e
ON d.`department_id` = e.`department_id`
WHERE e.`employee_id` IS NULL

#三、交叉连接(笛卡尔乘积)
SELECT be.*,bo.*
FROM beauty be
CROSS JOIN boys bo;
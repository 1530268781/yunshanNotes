#分组查询
/*
语法：
select column,group_function(column)
from table
[where condition]
[group by group_by_expression]
[order by column]
[having condition]
tip:查询列表比较特殊，要求是分组函数和group by后出现的字段(每个...)
先按照where筛选条件进行分组，然后根据分组函数查询对应的值,最后进行having筛选
（注意：先where筛选在分组，where筛选是在未分组的原始表上进行的）
（注意：先查询在having筛选，having筛选是在查询结果集上进行的）
如查询每个部门平均工资，先按照部门id分组
然后在查询每个组的平均工资
*/

#引入:查询所有部门的平均工资
SELECT AVG(salary) FROM employees

#1.简单分组查询
#案例1：查询每个部门的平均工资
SELECT department_id,AVG(salary) 平均工资
FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC

#案例2：查询每个工种的最高工资
SELECT job_id,MAX(salary) 最高工资
FROM employees
GROUP BY job_id

#案例3：查询每个位置上的部门个数
SELECT COUNT(*),location_id
FROM departments
GROUP BY location_id

#2.添加where筛选条件
#案例1：查询邮箱中包含a字符，每个部门的平均工资
SELECT AVG(salary),department_id
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;

#案例2：查询每个领导手下有奖金的员工的最高工资
SELECT MAX(salary),manager_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY manager_id;

#3.添加having筛选条件
#案例1：查询哪个部门的员工个数大于2
#错误写法：count(*)>2是筛选的整个原始表
SELECT department_id,COUNT(*) 员工个数
FROM employees
WHERE COUNT(*)>2
GROUP BY department_id;

#正确写法：（1）先分组查询每个部门的员工个数；（2）根据结果再过滤查询员工个数大于2的部门
SELECT department_id,COUNT(*) 员工个数
FROM employees
GROUP BY department_id
HAVING COUNT(*)>2;

#案例2：查询每个工种"有奖金的"员工的"最高工资>12000的"工种编号和最高工资
/*
筛选条件1：有奖金的
筛选条件2：最高工资>12000
分组条件：每个工种
思路：先筛选出有奖金的项，按照工种分组，查询出每个分组的最高工资和工种编号，最后从结果集筛选出最高工资大于12000的
*/
SELECT job_id,MAX(salary)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary)>12000;

#案例3：查询“领导编号>102的“每个领导手下的”最低工资>5000的“领导编号以及最低工资
/*
筛选条件1：领导编号>102
筛选条件2：最低工资>5000
分组条件：每个领导
思路：先筛选领导编号>102的项，按照领导编号分组，查询出领导编号和最低工资，最后从结果集筛选出最低工资<5000的
*/
SELECT manager_id,MIN(salary)
FROM employees
WHERE manager_id>102
GROUP BY manager_id
HAVING MIN(salary)>5000
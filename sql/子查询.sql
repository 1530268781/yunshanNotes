#子查询
/*
说明：当一个查询语句中又嵌套了另外一个select语句，则倍
嵌套的select语句称为子查询或内查询

分类：
按子查询出现的位置进行分类：
1.select后面：
	要求：子查询的结果为单行多列（标量子查询）
2.from后面
	要求：子查询的结果可以为多行多列
3.where或having后面
	要求：子查询的结果必须为单列
		单行子查询
		多行子查询
4.exists后面
	要求：子查询结果必须为单列（相关子查询）

特点：
	子查询要包含在括号中；
	子查询放在比较条件右侧
	子查询的查询优先于主查询
	单行子查询对应了 单行操作符：> < <= >= = <>
	多行子查询对应了 多行操作符：any/some  all in
*/
#一、单行子查询
#案例1.查询和Zlotkey相同部门的员工姓名和工资名
#(1)查询Zlotkey的部门编号
SELECT department_id 
FROM employees
WHERE last_name = 'Zlotkey';

#(2)查询department_id=(1)的员工工资和姓名
SELECT last_name,salary
FROM employees
WHERE department_id = (
	SELECT department_id 
	FROM employees
	WHERE last_name = 'Zlotkey'
);

#案例2.查询工资比公司平均工资高的员工姓名和工资
SELECT last_name,salary
FROM employees
WHERE salary >= (
	SELECT AVG(salary)
	FROM employees
)

#多行子查询
/*
in:判断某字段是否在列表内
any/some:判断某字段的值是否满足任意一个
x>any() <=> x>min()
x=any() <=> x in ()
x<any() <=> x<max()
all:判断某字段的值是否满足所有
x>all() <=> x>max()
x<all() <=> x<max()
*/
#案例1：返回location_id是1400或1700的部门中的所有员工姓名
SELECT last_name	
FROM employees
WHERE department_id IN (
	SELECT DISTINCT department_id
	FROM departments
	WHERE location_id IN (1400,1700)
);

#案例2：返回其他部门中比job_id为IT_PROG部门中任意工资低的员工号、姓名、job_id、salary
SELECT * 
FROM employees
WHERE salary < ANY(
	SELECT DISTINCT salary
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG'

SELECT * 
FROM employees
WHERE salary < (
	SELECT  MAX(salary)
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG';

#放在from后面
#案例：查询每个部门的平均工资的工资级别
#（1）每个部门的平均工资
SELECT AVG(salary),department_id
FROM employees
GROUP BY department_id

#(2)连接：查询平均工资的工资级别
SELECT dep_ag.department_id,dep_ag.ag,g.grade
FROM sal_grade g
JOIN (
	SELECT AVG(salary) ag,department_id
	FROM employees
	GROUP BY department_id
) dep_ag ON dep_ag.ag BETWEEN g.min_salary AND g.max_salary;

#放在exists后面
#案例：查询有无名字叫“张三丰”的员工
SELECT EXISTS(
	SELECT *
	FROM employees
	WHERE last_name = '张三丰'
) 有无;


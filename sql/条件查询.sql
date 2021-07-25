#条件查询
/*
语法：select 查询列表 from 表名 while 筛选条件;
*/

/*
按条件表达式筛选
*/
#案例一：查询工资>12000的员工信息
SELECT
	*
FROM
	employees
WHERE
	salary>12000;

#案例二：查询部门编号不等于90的员工名和部门编号
SELECT
	last_name,
	department_id
FROM 
	employees
WHERE 
	department_id<>90;
	
/*
按逻辑表达式筛选
*/
#案例一：查询工资在10000到20000之间的员工名、工资以及奖金
SELECT
	last_name,
	salary,
	commission_pct
FROM
	employees
WHERE 	
	salary>=10000 AND salary<=20000;
	
#案例二：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
SELECT
	*
FROM
	employees
WHERE
	NOT(department_id>=90 AND department_id<=110) OR salary>15000;
	
/*
模糊查询
like
between and
in
is null
is not null
*/
#-------like
#案例一：查询员工名字以s开头的员工信息（通配符：%任意多个字符，_任意单个字符）
SELECT
	*
FROM 
	employees
WHERE
	last_name LIKE 's%'

#案例二：查询员工名字中第三个字符为i,第四个字符为e的员工名和工资
SELECT
	last_name,
	salary
FROM
	employees
WHERE
	last_name LIKE '__i_e%' 
	
/*
转义字符 \
自定义转义字符 '$' ESCAPE '$'
*/

#--------between and（可以替换 <  and  >）
#案例：查询员工号在100到120之间的员工信息
SELECT
	*
FROM
	employees
WHERE 
	employee_id BETWEEN 100 AND 120

#------in（可以替换 = or = or = ……）
#案例：查询员工的工种编号是 IT_PROG、AD_VP、AD_PRES中的一个的员工名和工种编号
SELECT
	last_name,
	job_id
FROM
	employees
WHERE
	job_id='IT_PROG' OR job_id='AD_VP' OR job_id='AD_PRES';
	
SELECT
	last_name,
	job_id
FROM
	employees
WHERE
	job_id IN ('IT_PROG','AD_VP','AD_PRES');
	
#----is （not）null
/*
判断null值不能用 = 和 <>,而要用 is 和 is not
*/
#案例一：查询没有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NULL
	
#案例二：查询有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NOT NULL

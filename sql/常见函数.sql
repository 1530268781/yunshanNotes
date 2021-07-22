#常见函数
/*
好处：隐藏实现细节，提高代码重用性
调用：select 函数名(实参列表) 【from 表】
*/

#一、字符函数
#(1)length()：获取参数值的字节个数(汉字占3个字节)
SELECT LENGTH('john');
SELECT LENGTH('张三丰');

#(2)concat():拼接字符串
SELECT CONCAT(last_name,'_',first_name) FROM employees;

#(3)upper()、lower():转换为大/小写
SELECT CONCAT(UPPER(last_name),LOWER(first_name)) 姓名 FROM employees;

#(4)substr():截取字符串	注意：索引从1开始
#--截取从指定索引处开始后面所有字符
SELECT SUBSTR('李莫愁爱上了陆展元',7) output;

#--截取从指定索引处开始指定长度字符
SELECT SUBSTR('李莫愁爱上了陆展元',1,3) output;

#案例：姓名中首字符大写，其他字符小写，用—连接，显示处理
SELECT CONCAT(UPPER(SUBSTR(last_name,1,1)),SUBSTR(last_name,2),'-',LOWER(first_name))
AS 姓名 FROM employees;

#(5)instr():返回字串第一次出现的索引，如果找不到则返回0
SELECT INSTR('杨不悔爱上了殷六侠','爱上') AS output;

#(6)trim():去除字符串前后空格或指定字符
SELECT TRIM('     张翠山     ') AS output;
SELECT TRIM('a' FROM 'aaaaaaa张aaa翠山aaaaa') AS output;

#(7)lpad():用指定字符串左填充到指定长度
SELECT LPAD('殷素素',10,'&') AS output;

#(8)rpad():用指定字符串右填充到指定长度
SELECT RPAD('殷素素','10','$') AS output;

#(9)replace():替换字符串
SELECT REPLACE('张无忌爱上了周芷若周芷若','周芷若','赵敏');


#二、数学函数
#(1)round:四舍五入
SELECT ROUND(1.55);
SELECT ROUND(1.235,2);

#(2)ceil:向上取整,返回>=该参数的最小整数
SELECT CEIL(1.1);
SELECT CEIL(-2.1);

#(3)floor:向下取整，返回<=该参数的最大整
SELECT FLOOR(-9.99);

#(4)truncate:截断
SELECT TRUNCATE(-1.2234,2);

#(5)mod:取余函数
/*
取余原理：
mod(a,b):= a-(a/b)*b
mod(-10,-3)=-10-(-10/-3)*(-3)=-10-(-9)=-1
*/
SELECT MOD(10,3);
SELECT MOD(10,-3);

#三、日期函数
#now 返回当前系统日期+时间
SELECT NOW();

#curdate 返回当前日期
SELECT CURDATE();

#curtime 返回当前时间
SELECT CURTIME();

#获取指定部分的年、月、日、小时、分、秒
SELECT YEAR(NOW()) 年;
SELECT YEAR('1999-10-10') 年;

SELECT MONTH(NOW()) 月;
SELECT MONTHNAME(NOW()) 月名;

#将字符串转换为日期
SELECT STR_TO_DATE('3-3-1999','%c-%d-%Y') AS out_put

#将日期转换为字符
SELECT DATE_FORMAT(hiredate,'%m月/%d日 %y年') AS out_put
FROM employees;

#四、其他函数
SELECT VERSION();
SELECT DATABASE();
SELECT USER();

#五、流程控制函数
#(1)if函数：if else 效果
SELECT IF(10<5,'小','大');

SELECT 
	last_name,
	commission_pct,
	IF(commission_pct IS NULL,'没有奖金','有奖金') AS 备注
FROM employees;

#(2)case函数：作为一个新字段，与前面字段用逗号隔开
#switch case的效果
/*
case 要判断的表达式
when 常量1 then 要显示的值1或语句1；
when 常量2 then 要显示的值2或语句2；
...
else 要显示的值n或语句n;
end
*/
/*
案例一：查询员工的工资，要求
部门号=30，显示工资1.1倍
部门号=40，显示工资1.2倍
部门号=50，显示工资1.3倍
其他部门，显示原工资
*/
SELECT salary AS 原始工资,department_id,
CASE department_id
WHEN 30 THEN salary*1.1
WHEN 40 THEN salary*1.2
WHEN 50 THEN salary*1.3
ELSE salary
END
AS 新工资
FROM employees;

#多重if的效果
/*
case 
when 表达式1 then 要显示的值1或语句1；
when 表达式2 then 要显示的值2或语句2；
...
else 要显示的值n或语句n;
end
*/
/*
案例：查询工资级别，要求
工资>20000,显示A级别
工资>15000，显示B级别
工资<15000,显示C级别
*/
SELECT last_name,salary,
CASE 
WHEN salary>20000 THEN 'A'
WHEN salary>15000 THEN 'B'
WHEN salary>10000 THEN 'C'
ELSE 'D'
END AS 工资级别
FROM employees

#二、分组函数
/*
功能：做统计使用，又称为聚合函数、统计函数或组函数
sum 求和、avg 平均值、max 最大值、min 最小值、count 计算个数
*/
#1.简单使用
SELECT SUM(salary) AS 工资总和 FROM employees;
SELECT MAX(salary) AS 最高工资 FROM employees;
SELECT MIN(salary) AS 最低工资 FROM employees;
SELECT AVG(salary) AS 平均工资 FROM employees;
SELECT COUNT(salary) AS 有工资的人数 FROM employees;
SELECT SUM(salary)/COUNT(salary) AS 平均工资 FROM employees;

#2.参数支持那些类型
/*
sum,avg一般处理数值型；
max,min,count可以处理任何类型；
*/
SELECT SUM(last_name),AVG(last_name) FROM employees;

SELECT MAX(last_name),MIN(last_name) FROM employees;

#3.以上分组函数都忽略null值；
SELECT IF(COUNT(commission_pct)-COUNT(salary)<>0,'不相等','相等') 
FROM employees;

#4.和distinct搭配
#查看有几种工资
SELECT COUNT(DISTINCT salary) FROM employees;

#5.count函数的详细介绍
#统计表的行数（不忽略null值）
SELECT COUNT(*) FROM employees;
SELECT COUNT(1) FROM employees;	#除了1可以是任意常量值

#6.和分组函数一同查询的字段要求是group by后的字段

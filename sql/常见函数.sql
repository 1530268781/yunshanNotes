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


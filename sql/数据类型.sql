#常见的数据类型
/*
数值型：
	整型
	小数：定点数，浮点数
字符型：
	较短文本：char、varchar
	较长文本：text、blob(较长的二进制数)
日期型:
*/

#一、整形:
/*
tinyint smallint mediumint int/integer bigint
1	2		3	4	8
特点：
a.默认是有符号，如果要设置无符号，需要添加关键字unsigned
b.如果插入的数值超出了整型的范围，会报out of range异常，并且插入临界值
c.如果不设置长度，会有默认长度。
长度代表了显示的最大宽度，如果不够会用0在左边填充，但必须搭配zerofill使用
*/
#1.如何设置有无符号
CREATE TABLE tab_int(
	t1 INT,
	t2 INT UNSIGNED,
	t3 INT(8) ZEROFILL
);

#二、小数：
#1.浮点型 float(M,D) double(M,D)
#2.定点型 dec(M,D)  decimal(M,D)

/*
（1）M:整数部位+小数部位	D:小数部位	超过范围插入临界值
（2）M和D可以省略，如果是decimal，默认M是10，D是0；如果是float和double，则会根据插入的数值精度来决定
（3）定点型的精度较高，如果要求插入的数值精度较高（如货币运算等）则考虑使用
*/


CREATE TABLE tab_float(
	f1 FLOAT(5,2),
	f2 DOUBLE(5,2),
	f3 DECIMAL(5,2,
);

INSERT INTO tab_float VALUES(123,45,123.45,123.45)


#三、字符型
/*
较短文本：char varchar
较长文本：tet blob
*/
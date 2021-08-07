#常见约束

/*
含义：一种限制，用于限制表中的数据，为了保证表中数据的准确可靠性（一致性）

分类：六大约束
	NOT NULL：非空。用于保证该字段非空（如姓名、学号）
	DEFAULT：默认。用于保证该字段有默认值（如姓名）
	PRIMARY KEY：主键。用于保证该字段唯一且非空（如学号、员工编号）
	UNIQUE：唯一。用于保证该字段的值唯一性，可以为空（如座位号）
	CHECK：检查【mysql不支持】。（如年龄、性别）
	FOREIGIN KEY：外键。用于限制两个表的关系，用于保证该字段的值必须来自于主表的关联列的值
		在从表中添加外键约束，用于引用主表中某列的值（比如学生表的专业编号，员工表的部门编号，员工表的工种编号）

添加约束的时机：
	1.创建表时
	2.修改表时
	
约束的添加分类：
	列级约束（六大约束都支持，但foreign key没有效果
	表级约束（除了非空、默认，其他都支持）
			
create table 表名(
	字段名 字段类型 列级约束，
	字段名 字段类型，
	...
	表级约束
)
*/

#一、创建表时添加约束
#1.添加列级约束
/*
create table 表名(
	字段名 字段类型 列级约束，
	字段名 字段类型 列级约束，
	...
)
*/
CREATE DATABASE students;
USE students;

CREATE TABLE major(
	id INT PRIMARY KEY,
	marjorName VARCHAR(20)
);
CREATE TABLE stuinfo(
	id INT PRIMARY KEY, #主键
	stuName VARCHAR(20) NOT NULL, #非空
	gender CHAR(1) CHECK(gender='男' OR gender='女'),#检查
	seat INT UNIQUE, #唯一
	age INT DEFAULT 18, #默认
	marjorId INT REFERENCES major(id) #外键：引用marjor表中的id为外键
);
#查看约束信息
DESC stuinfo;
#查看stuinfo表中所有的索引，包括主键、外键、唯一
SHOW INDEX FROM stuinfo;


#2.添加表级约束
/*
create table 表名(
	字段名 字段类型,
	字段名 字段类型,
	...
	constraint [约束名] 约束类型（字段名），
	constraint [约束名] 约束类型（字段名）
	...
)
*/
DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo(
	id INT,
	stuName VARCHAR(20),
	gender CHAR(1),
	seat INT,
	majorId INT,
	CONSTRAINT pk PRIMARY KEY(id), #主键
	CONSTRAINT uq UNIQUE(seat),	#唯一
	CONSTRAINT ck CHECK(gender='男' OR gender='女'),#检查
	CONSTRAINT fk_stuinfo_major FOREIGN KEY(majorid) REFERENCES major(id)#外键
); 

#3.通用的写法(表级约束写外键约束)
CREATE TABLE IF NOT EXISTS studinfo(
	id INT PRIMARY KEY,
	stuName VARCHAR(20) NOT NULL,
	gender CHAR(1) CHECK(gender='男' OR gender='女'),
	age INT DEFAULT 18,
	seat INT UNICODE,
	marjorId INT,
	CONSTRAINT fk_stuinfo_major FOREIGN KEY(majorId) REFERENCES major(id)
);

#4.primary key VS unique
		保证唯一性	是否允许为空	一个表中可有几个
PRIMARY KEY         √			×		一个
UNIQUE 		    √			√		多个
	
#5.foreign key
/*
	1.要求在从表设置外键关系
	2.从表中外键列的类型和主表的关联列的类型要求一致或兼容，名称可以不一样
	3.要求主表中的关联列必须是一个key(主键或唯一键）
	4.插入数据时，先插入主表，再插入从表；删除数据时，先删除从表，再删除主表
*/


#二、修改表时添加约束
#修改字段类型时一起修改约束类型
/*
添加列级约束：
	alter table 表名 modify column 字段名 字段类型 新约束;
	
添加表级约束：
	alter table 表名 add 【constraint 约束名】 约束类型(字段名) 【外键的引用】 
*/
#1.添加非空约束
ALTER TABLE stuinfo MODIFIER COLUMN stuName VARCHAR(20) NOT NULL;

#2.添加默认约束
ALTER TABLE stuinfo MODIFY age INT DEFAULT 18;

#3.添加主键
#（1）列级约束
ALTER TABLE stuinfo MODIFIER COLUMN id INT PRIMARY KEY;
#（2）表级约束
ALTER TABLE stuinfo ADD PRIMARY KEY(id);

#4.添加唯一键
#（1）列级约束
ALTER TABLE stuinfo MODIFY COLUMN id INT UNIQUE;
#（2）表级约束
ALTER TABLE stuinfo ADD UNIQUE(seat);

#5.添加外键
ALTER TABLE stuinfo ADD FOREIGN KEY(majorId) REFERENCES major(id);
ALTER TABLE stuinfo ADD CONSTRAINT fk_sutinfo_major FOREIGN KEY(majorId) REFERENCES major(id);


#三、修改表时删除约束
#1.删除非空约束
ALTER TABLE stuinfo MODIFY COLUMN stuName VARCHAR(20) NULL;

#2.删除默认约束
ALTER TABLE stuinfo MODIFIER COLUMN age INT;

#3.删除主键
ALTER TABLE stuinfo DROP PRIMARY KEY;
ALTER TABLE stuinfo MODIFY COLUMN id PRIMARY KEY;

#4.删除唯一键
ALTER TABLE stuinfo DROP INDEX seat;

#5.删除外键
ALTER TABLE stuinfo DROP FOREIGN KEY fk_stuinfo_major;



#标识列（自增长列）
/*
又称为自增长列
含义：可以不用手动的插入值，系统提供默认的序列值

特点：
	1.标识列要求是一个key
	2.一个表中最多有一个标识列
	3.标识列的类型只能是数值型：int float double
	4.表示列可以通过SET auto_increment_increment=3设置步长；通过插入值设置初始值
*/

#一、创建表时设置标识列
CREATE TABLE tab_indentity(
	id INT PRIMARY KEY AUTO_INCREMENT,
	NAME VARCHAR(20)
);

TRUNCATE TABLE tab_indentity;
INSERT INTO tab_indentity(NAME) VALUES('john');
INSERT INTO tab_indentity VALUES(NULL,'lucy');

#查看自增长变量
SHOW VARIABLES LIKE '%auto_increment%';
#修改自增长步长
SET auto_increment_increment=3;

#二、修改表时设置标识列
ALTER TABLE tab_indentity MODIFIER COLUMN id INT PRIMARY KEY AUTO_INCREMENT;

#修改表时删除标识列
ALTER TABLE tab_indentity MODIFIER COLUMN id INT;
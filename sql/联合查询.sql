#联合查询
/*
说明：查询结果之间没有关联，这个时候往往使用联合查询（union查询）
语法：
select 字段|常量|表达式|函数 【from 表】 【where 条件】 union 【all】
select 字段|常量|表达式|函数 【from 表】 【where 条件】 union 【all】
select 字段|常量|表达式|函数 【from 表】 【where 条件】 union  【all】
.....
select 字段|常量|表达式|函数 【from 表】 【where 条件】

注意：要求列数相等，
	union自动去重/union all 支持重复项
*/
#案例：
SELECT `name` FROM beauty
UNION
SELECT `boyname` FROM boys

#分页查询
/*
语法：
select 查询列表
from 表1 别名
join 表2 别名
where 筛选条件
group by 分组
having 分组后筛选
order by 排序列表
limit 起始条目索引(默认0)，显示的条目数

执行顺序：
1.from
2.join
3.on
4.where
5.group by
6.having
7.select
8.order by
9.limit
*/

#案例1：查询员工信息的前五条
SELECT * FROM employees LIMIT 5
SELECT * FROM employees LIMIT 0,5

#案例2：查询有奖金的，员工工资较高的第11名到第20名
SELECT last_name,salary
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC
LIMIT 10,10

/*
公式：
	如果要显示的页数是page,每页显示的条目数是size
select *
from employees
limit (page-1)*size,size;
page	size=10
1	limit 0,10
2	limit 10,10
3	limit 20,10
4	limit 30,10
*/


#案例一：创建视图查询每个部门的平均工资
CREATE VIEW my_view1
AS
SELECT AVG(salary) ag,department_id
FROM employees
GROUP BY department_id;

SELECT * FROM my_view1;

#查询部门平均工资在10000以上的部门

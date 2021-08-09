#TCL
/*
事务：

事务的ACID属性：原子性、
*/
#查看mysql支持的存储引擎
SHOW ENGINES;

/*
事务的创建
隐式事务：事务没有明显的启动和结束标记
比如insert、update、delete语句

显式事务：事务具有明显的开启和结束的标记。前提：必须先设置自动提交功能为禁用

步骤一：开启事务
set autocommit=0;
start transaction;	[可选]

步骤二：编写事务中的sql语句(select insert update delete)
语句1；
语句2；
...

步骤三：结束事务（提交或回滚）
commit；提交事务
rollback; 回滚事务
*/

#开启事务
SET autocommit=0;
START TRANSACTION;
#编写事务sql语句
UPDATE  boys SET userCP=100 WHERE boyName='张飞';
UPDATE  boys SET userCp=100 WHERE boyName='段誉';
#结束事务
COMMIT;
#rollback;

SELECT * FROM boys;
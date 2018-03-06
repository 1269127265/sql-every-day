create trigger abc1 on jut172
for insert,update,delete
as 

UPDATE a set a.createuser=b.f1248 from JUT170 a,JUT172 b where a.F1257=b.f125 -- 声明变量触发事件
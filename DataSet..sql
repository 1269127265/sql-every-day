

实现
1）有相同的数据，直接返回（返回值：0）；
2）有主键相同，但是数据不同的数据，进行更新处理（返回值：2）；
3）没有数据，进行插入数据处理（返回值：1）。

Create proc Insert_Update 
 
@Id varchar(20), 
 
@Name varchar(20), 
 
@Telephone varchar(20), 
 
@Address varchar(20), 
 
@Job varchar(20), 
 
@returnValue int output
 
as
 
declare
 
@tmpName varchar(20), 
 
@tmpTelephone varchar(20),
 
 
@tmpJob varchar(20),
 
@tmpAddress varchar(20)
 
if exists(select * from dbo.DemoData where id=@Id) 
 
begin
 
select @tmpName=Name,@tmpTelephone=Telephone,@tmpAddress=Address,@tmpJob=Job from dbo.DemoData where id=@Id 
 
if ((@tmpName=@Name) and (@tmpTelephone=@Telephone) and (@tmpAddress=@Address)and (@tmpJob=@Job)) 
 
begin
 
set @returnValue=0 --有相同的数据，直接返回值 
 
end
 
else
 
begin
 
update dbo.DemoData set Name=@Name,Telephone=@Telephone,Address=@Address,Job=@Job where id=@Id 
 
set @returnValue=2 --有主键相同的数据，进行更新处理 
 
end
 
end
 
else
 
begin
 
insert into dbo.DemoData values(@Id,@Name,@Telephone,@Address,@Job) 
 
set @returnValue=1 --没有相同的数据，进行插入处理 
 
end
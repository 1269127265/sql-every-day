

ʵ��
1������ͬ�����ݣ�ֱ�ӷ��أ�����ֵ��0����
2����������ͬ���������ݲ�ͬ�����ݣ����и��´�������ֵ��2����
3��û�����ݣ����в������ݴ�������ֵ��1����

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
 
set @returnValue=0 --����ͬ�����ݣ�ֱ�ӷ���ֵ 
 
end
 
else
 
begin
 
update dbo.DemoData set Name=@Name,Telephone=@Telephone,Address=@Address,Job=@Job where id=@Id 
 
set @returnValue=2 --��������ͬ�����ݣ����и��´��� 
 
end
 
end
 
else
 
begin
 
insert into dbo.DemoData values(@Id,@Name,@Telephone,@Address,@Job) 
 
set @returnValue=1 --û����ͬ�����ݣ����в��봦�� 
 
end
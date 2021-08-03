create procedure proc_First
as
begin 
  print 'Hello World'
end

exec proc_First

select * from authors

create proc proc_GetAuthorFromCity(@authorcity varchar(20))
as
begin
  select * from authors where city = @authorcity
end

exec proc_GetAuthorFromCity 'Oakland'

--Create a table emp with id-identity,name and age
--create a stored procedure proc_InsertEmployee
--The procudure should insert in to the table

create table tblEmp(
id int identity(1,1) primary key,
name varchar(20),
age int)

create proc proc_InsertEmployee(@ename varchar(20),@eage int)
as
begin
  insert into tblEmp(name,age) values(@ename,@eage)
end

exec proc_InsertEmployee 'Domu',34

select * from publishers

alter proc proc_InsertEmployee(@ename varchar(20),@eage int)
as
begin
  declare
    @empCount int
	set @empCount = (select count(id) from tblEmp)
	insert into tblEmp(name,age) values(@ename,@eage)
	if(@empCount > 0)
    begin
	  print concat('you are the ', @empcount+1, 'employee')
	end
    else
	  print 'You are the first employee,. Wow' 
end

--Create aprocedure that will print the total sales amount for a given publisher name
create proc proc_GetTotalsale(@pname varchar(50))
as
begin
    declare @total float
	set @total= (select sum(qty*price) 'Total Amount' from sales s join titles t
	on t.title_id = s.title_id
	where t.pub_id = (select pub_id from publishers where pub_name = @pname))
	print concat('The total sale for ',@pname,' is ',@total)
end

exec proc_GetTotalsale 'New Moon Books'

create proc proc_GetBackTotalsale(@pname varchar(50),@total float out)
as
begin
	set @total= (select sum(qty*price) 'Total Amount' from sales s join titles t
	on t.title_id = s.title_id
	where t.pub_id = (select pub_id from publishers where pub_name = @pname))
	print concat('The total sale for ',@pname,' is ',@total)
end

declare 
  @tot float
begin
   exec proc_GetBackTotalsale 'New Moon Books' , @tot out
   print @tot
end

create function fn_Sample()
returns varchar(20)
as
begin
   return 'Hello'
end

select dbo.fn_Sample()

create function fn_CalTax(@pname varchar(20))
returns float
as
begin
  declare @total float
	set @total= (select sum(qty*price) 'Total Amount' from sales s join titles t
	on t.title_id = s.title_id
	where t.pub_id = (select pub_id from publishers where pub_name = @pname))
	set @total = @total +(@total*12.2/100)
	return @total
end

select dbo.fn_CalTax('New Moon Books')
--create a function that will take a pulisher name and print the total 
--advance paid to authors for the books published by them
create function fun_pub(@pname varchar(20))
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
create function fun_pub(@pname varchar(20))returns floatas begin    declare @totaladv float    set @totaladv=(select sum(advance)'Total advance' from titles t join publishers p    on t.pub_id=p.pub_id    where t.pub_id=(select pub_id from publishers where pub_name=@pname))    return @totaladvendselect dbo.fun_pub('New Moon Books')--table valued functionscreate function fn_GetTitlesAndAdvance(@pname varchar(20))returns @MyTable table(Bookname varchar(50),book_advance float)asbegin   insert into @MyTable select title, advance from titles where pub_id=   (select pub_id from publishers where pub_name=@pname)   return;endselect * from dbo.fn_GetTitlesAndAdvance('New Moon Books')create table tbl_sample(f1 int,f2 varchar(20))select * from tbl_Samplebegin tran tran_sample  insert into tbl_sample values(1,'hello')  if((select COUNT(*) from tbl_sample)>5)     rollback  else     commitcreate table tbl_acc(accno int primary key,balance float)insert into tbl_acc values(1,1000)insert into tbl_acc values(2,10000)sp_help tbl_acccreate table atm(id int primary key,amount float,balance float,status varchar(100))insert into atm values(101,0,100000,'Init')select * from tbl_accselect * from atmbegin tran tran_Withdraw  declare     @bal float,	@atmid int	set @atmid = (select max(id) from atm)+1    set @bal = (select balance from atm where id = (select max(id) from atm))	insert into atm values(@atmid, 2000,@bal-2000,'success')	update tbl_acc set balance = balance-2000 where accno= 2	if((select balance from tbl_acc where accno= 2)>500)	  commit	else	 rollbackcreate proc proc_Transact(@accno int, @amount float)asbegin  begin tran tran_Withdraw  declare     @bal float,	@atmid int	set @atmid = (select max(id) from atm)+1    set @bal = (select balance from atm where id = (select max(id) from atm))	insert into atm values(@atmid, @amount,@bal-@amount,'success')	update tbl_acc set balance = balance-@amount where accno= @accno	if((select balance from tbl_acc where accno= @accno)>500)	  commit	else	 rollbackendproc_Transact 1,1000select * from tbl_accselect * from atm--create table tbl_sample--(f1 int,f2 varchar(20))create trigger trg_InsertSampleon tbl_Samplefor insertasbegin  print 'Hello'endinsert into tbl_sample values(1,'sakj')select * from tbl_accselect * from atmalter table atmadd accNum int references tbl_acc(accno)create trigger trg_insert_atmon atmfor insertasbegin   update tbl_acc set balance = balance - (select amount from inserted) where accno = (select accNum from inserted)endinsert into atm values(104,500,96500,'success',1)
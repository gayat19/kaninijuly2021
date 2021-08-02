use pubs

--basic select query
Select * from titles
--Projection
select title from titles
select title, price from titles
select title Book_Name, price from titles
select title as Book_Name, price from titles
select title as "Book Name", price "Book Price" from titles

--Selection
select * from titles where price>10
select * from titles where price between 2 and 10
select * from titles where type = 'business'
select * from titles where type = 'business' or type='popular_comp'
select * from titles where type in( 'business' ,'popular_comp','psychology')
select * from titles where type not in ( 'business' ,'popular_comp','psychology')
select * from titles where title like 'The%'
select * from titles where title like '_e%'

select price Book_Price from titles where title like '_e%'

select * from titles where price is null
select * from titles where price is not null
select * from titles where type = 'business' and price >10

--aggr
select sum(price) from titles
select sum(price) 'Price sum' from titles
--not right
select sum(price),title from titles
--multiple agg function allowed
select sum(price) 'Price sum', avg(price) 'Average of price', Min(price) 'Minimum price' from titles

--Group by
select * from titles
select type,count(title) 'Number of books' from titles
group by type 
select pub_id,count(title) 'Number of books' from titles
group by pub_id
select type,count(title) 'Number of books', avg(price) 'Average price' from titles
group by type 
select state,count(au_id) 'Number of authors' from authors group by state
select title_id,sum(qty) 'total quantity' from sales group by title_id

select pub_id,count(emp_id)'No of employee' from employee group by pub_id

--sorting
select * from titles order by price
select * from titles order by price desc

select * from titles order by pubdate 

--where, group by and order by
select pub_id, count(title) from titles 
where price>8
group by pub_id 
order by pub_id desc

select pub_id, count(title) from titles 
where price>8
group by pub_id 
order by 2
--(or)
select pub_id, count(title) from titles 
where price>8
group by pub_id 
order by count(title)

--having
select pub_id, count(title) from titles 
where price>8
group by pub_id 
having count(title)>3
order by count(title)

select * from sales

 select state,city,count(au_id)  from authors where contract=1group by state,cityorder by state,cityselect * from publishersselect * from titlesselect pub_id from publisherswhere pub_name='Binnet & Hardley'select * from titles where pub_id = '0877'select * from titles where pub_id = (select pub_id from publisherswhere pub_name='Binnet & Hardley')select * from publishersselect title from titles where title_id =(select title_id from titleauthor where au_id =(select au_id from authors where au_fname = 'Cheryl'))select pub_id,count(title_id) from titleswhere pub_id in(select pub_id from publishers where country = 'USA')group by pub_idhaving count(title_id)>1order by 2
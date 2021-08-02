--create a query that will fetch the employees are in the publisher 
--who publish the books that cost more than 10
select concat(fname,' ',lname) Employee_Name from employee where pub_id in 
(select pub_id from titles where price > 10)

select * from sales

select * from titles

select * from publishers

--print the title and the quantity sold 
-- inner join
select title 'Book Name', qty 'Numbers Sold'
from titles join sales
on titles.title_id = sales.title_id
--same as above but with instance name
select title 'Book Name', qty 'Numbers Sold'
from titles t join sales s
on t.title_id = s.title_id

--print the pulisher name and the title name
select title, pub_name from titles t join publishers p
on t.pub_id = p.pub_id
order by 2

select * from authors
select * from titleauthor
select * from titles

--author name and teh title name
select concat(au_fname,' ',au_lname) ,title
from titles t join titleauthor ta on t.title_id = ta.title_id
join authors a on ta.au_id=a.au_id

--print the total price of book, the book name and the publishe name that are sold
select pub_name 'Publisher Name' , title 'Book Name', price*qty 'Total Price' from publishers p join titles ton p.pub_id = t.pub_id join sales s on s.title_id = t.title_id

--lest print all the publisher's name and the books name if they have published any

select title, pub_name from 
publishers p left outer join titles t on t.pub_id=p.pub_id
order by 2

--fetch all the authors name and the title id of their book
select concat(a.au_fname,' ',a.au_lname) 'Author name', title from authors a left outer join titleauthor ta on a.au_id = ta.au_id left outer join titles t on t.title_id = ta.title_id
select * from publishers





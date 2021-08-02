--Creating a databse
--ensure you are in master database when you create a database
create database dbFlowerStore28July21

--selectingthe created databse
use dbFlowerStore28July21

--DDL
--creating table
create table Areas
(area varchar(50) primary key,
zipcode char(6))

sp_help Areas

create table Customers
(id int identity(101,1) primary key,
name varchar(50) not null,
age int default 18,
email varchar(150),
phone varchar(15),
address varchar(500),
customer_area varchar(50) references Areas(area))

sp_help Customers

create table Flowers
(id int identity(1,1) constraint pk_flower_id primary key,
name varchar(50),
occasion varchar(50),
unitPrice float check(unitPrice>=0),
available_Quantity int check(available_Quantity >=0))

sp_help Flowers

create table Discounts
(offerID char(4),
flower_id int constraint fk_flower_offer foreign key references Flowers(id),
disount_percent float,
start_date datetime,
end_date datetime,
offercode varchar(20))

sp_help Discounts

alter table Discounts
alter column offerId char(4) not null

alter table Discounts
add constraint pk_offer_id primary key(offerid)

create table FlowerArea
(flower_Id int constraint fk_flower_area foreign key references Flowers(id),
flower_area varchar(50) references Areas(area),
primary key(flower_id,flower_area))

sp_help FlowerArea

--Cart					
--CustomerID	FlowerID	Quantity	CartPrice	CartDate	OfferID
create table Cart
(Customer_Id int references Customers(id),
flower_id int references Flowers(id),
quantity int,
carp_price float,
offer_id char(4) references Discounts(offerId),
constraint pk_cart primary key(Customer_Id,flower_id))

sp_help cart

create table orders(orderid int identity(1,1) primary key,customer_id int references customers(id),total_price float,payment_status varchar(20),);
create table  orderdetails(order_id int references orders(orderid),flower_id int references Flowers(id),
quantity int,
price float,
offer_id char(4) references Discounts(offerId),
primary key(order_id,flower_id))

--DML-insert,update,delete
insert into areas values('ABC','123456')
insert into areas values('XYZ','876543')
--failed inserts
--duplicate value in primary key
insert into areas values('ABC','654321')
--null is not allower in primary key
insert into areas values(null,'654321')
--thevalue id more than the size for zipcode
insert into areas values('EFG','65432134')
select * from Areas

insert into Customers(Name,Age,Email,Phone,Address,customer_area)
values('Ramu',23,'ramu@gmail.com','9876543210','12,1st Cross','ABC')
insert into Customers(Name,Age,Email,Phone,Address,customer_area)
values('Bimu',29,'bimu@gmail.com','4321098765','34,4th Main','ABC')
--failed inserts
--should not provide value for identity column
insert into Customers 
values(103,'Bimu',29,'bimu@gmail.com','4321098765','34,4th Main','ABC')
--foreign key error
insert into Customers(Name,Age,Email,Phone,Address,customer_area)
values('Bimu',29,'bimu@gmail.com','4321098765','34,4th Main','BBB')
select * from Customers


--create table Flowers
--(id int identity(1,1) constraint pk_flower_id primary key,
--name varchar(50),
--occasion varchar(50),
--unitPrice float check(unitPrice>=0),
--available_Quantity int check(available_Quantity >=0))

insert into Flowers(name,occasion,unitPrice,available_Quantity) values('Lily','Birthday',12.3,10)

insert into Flowers(name,occasion,unitPrice,available_Quantity) values('Rose','Anniversery',15.0,20)


--failed inserts
--check constraint conflict
insert into Flowers(name,occasion,unitPrice,available_Quantity) values('Lily','Birthday',12.3,-1)
select * from Flowers

--create table Discounts
--(offerID char(4),
--flower_id int constraint fk_flower_offer foreign key references Flowers(id),
--disount_percent float,
--start_date datetime,
--end_date datetime,
--offercode varchar(20))

insert into Discounts values('O001',1,3.5,'2021-07-01','2021-07-15','JulyOffer')
insert into Discounts values('O002',1,2.5,'2021-07-16 06:00:00.000','2021-07-15','JulyOffer')
select * from Discounts

insert into FlowerArea values(1,'ABC')
insert into FlowerArea values(1,'XYZ')

--Failed insert
--Same combination not allowed
insert into FlowerArea values(1,'XYZ')
select * from FlowerArea

--insert into Discounts values('O001',1,3.5,'2021-07-01','2021-07-15','JulyOffer')
update Discounts set start_date='2021-07-03' ,end_date = '2021-07-18' WHERE offerID = 'O001'


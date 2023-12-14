create database inventorymanagementsystem
create table brands(
bid numeric(5),
bname varchar(20)
);
select * from brands
use inventorymanagementsystem
alter table brands
add primary key(bid);
create table inv_user(
user_id varchar(20),
name varchar(20),
password varchar(20),
last_login timestamp,
user_type varchar(10)
);
create table categories(
cid numeric(5),
catagory_name varchar(20)
); 
alter table categories
add primary key
(cid);
alter table inv_user
add primary key
(user_id);
create table product(
pid numeric(5) primary key,
cid numeric(5) references categories(cid),
bid numeric(5) references brands(bid),
sid numeric(5),
pname varchar(20),
p_stock numeric(5),
price numeric(5),
added_date date);
drop table stores
create table stores(
sid numeric(5) primary key,
sname varchar(20),
address varchar(20),
mobno numeric(10));
alter table product
add foreign key(sid)references stores(sid);
create table provides(
bid numeric(5)references brands(bid),
sid numeric(5)references stores(sid),
discount numeric(5));
create table customer_cart(
cust_id numeric(5) primary key,
name varchar(20),
mobno numeric(10)
);
create table select_product(
cust_id numeric(5) references customer_cart(cust_id),
pid numeric(5)references product(pid),
quantity numeric(4));
create table transaction(
id numeric(5) primary key,
total_amount numeric(5),
paid numeric(5),
due numeric(5),
gst numeric(3),
payment_method varchar(10),
cart_id numeric(5) references customer_cart(cust_id));
create table invoice(
item_no numeric(5),
product_name varchar(20),
quantity numeric(5),
net_price numeric(5),
transaction_id numeric(5) references transaction(id));	
select * from brands
insert into brands values(
1,'APPLE'),
(2,'SAMSUNG'),
(3,'NIKE'),
(4,'FORTUNE')
select * from inv_user

insert into inv_user values(
'hars@gmail.com','Harsh Khanewal','1111','30/10/18 10:20','manager'),
('prashant@gmail.com','Prashant','0011','20/10/18 10:30','Accountant'),
('vidit@gmail.com','Vidit','1234','31/10/18 12:40','Admin')
select * from categories
insert into categories values(
1,'electronic'),
(2,'clothing'),
(3,'grocery')
select * from stores
insert into stores values(
1,'suraj','lucknow','1111111111'),
(2,'rakesh','haryana','2222222222'),
(3,'ram kumar','chennai','3333333333')
select * from product
insert into product values(
1,1,1,1,'Airpods',3,19000,'27/10/18'),
(2,1,1,1,'Smart Watch',3,19000,'27/10/18'),
(3,2,3,2,'Air Max',6,7000,'27/10/18'),
(4,3,4,3,'REFINED OIL',6,750,'25/10/18'),
(5,2,1,1,'IPHONE',4,45000,'24/10/18')
select * from provides
insert into provides values(
1,1,12),
(2,2,7),
(3,3,15),
(1,2,7),
(3,4,10),
(5,6,19)
select * from customer_cart
insert into customer_cart values(
1,'Ram',7654236545),
(2,'Shyam',7777777777),
(3,'Mohan',7777777775)
select * from select_product
 insert into select_product values(
 1,2,1),
 (2,4,6),
 (3,6,7)
 select * from transaction
  insert into transaction values
  (1,57000,57000,0,570,'cash',2),
  (2,19000,17000,2000,190,'cash',3),
  (3,21000,12000,9000,160,'cash',4)
use inventorymanagementsystem
show tables


create database product_asm

go
use product_asm

go
create table dbo.category (
			category_id int primary key not null,
			category_name varchar(100) not null,
			
)
insert into dbo.category values (1, 'Iphone' )
insert into dbo.category values (2, 'Computer')
insert into dbo.category values (3, 'Fridge')
insert into dbo.category values (4, 'Television')
insert into dbo.category values (5, 'Earphone')

drop table dbo.category
select * from category

go
create table dbo.product(
				product_id int primary key not null,
				product_name varchar(100) not null unique,
				product_price int not null,
				product_quantity int not null,
)
insert into dbo.product values (1, 'Iphone', 120.000 , 50)
insert into dbo.product values (2, 'Computer ', 250.000, 30)
insert into dbo.product values (3, 'Fridge', 350.000, 35)
insert into dbo.product values (4, 'Television', 500.000, 15)
insert into dbo.product values (5, 'Earphone', 20.000, 25)

drop table dbo.product

select * from product

go
create table dbo.customer (
			customer_id int primary key not null,
			customer_name varchar(100) not null unique,
			customer_address varchar(100) not null,
			customer_phone int not null,
			customer_email varchar(100) not null,
			customer_gender char(100)
)
insert into dbo.customer values (1, 'Le Khanh Vui', 'Son La', 03422145, 'Lkvui21@gmail.com','male')
insert into dbo.customer values (2, 'Vu A Dai ', 'Ha Noi ', 03224532, 'Vudai233@gmail.com','male')
insert into dbo.customer values (3, 'Son', 'Son La', 0382432, 'Son32@gmail.com','male')
insert into dbo.customer values (4, 'Truong', 'Ha Noi', 036226789, 'TruongN2113@gmail.com','male')
insert into dbo.customer values (5, 'Manh', 'Quang Ninh', 03524124, 'Manh2132@gmail.com','male')

select * from dbo.customer

go
create table dbo.transactions (
				transactions_id int primary key not null,
				product_id int not null,
				product_name varchar(100) not null,
				customer_id int not null,
				customer_name varchar(100) not null,
				transactions_date date not null,
				transactions_quantity int not null,
				transactions_totalprice varchar(100) not null,
				FOREIGN KEY (product_id) REFERENCES dbo.product(product_id),
				FOREIGN KEY (product_name) REFERENCES dbo.product(product_name),
				FOREIGN KEY (customer_id) REFERENCES dbo.customer(customer_id),
				FOREIGN KEY (customer_name) REFERENCES dbo.customer(customer_name)
)
insert into transactions values (1, 2, 'Computer', 1, 'Le Khanh Vui', '2024-02-12', 3,'360.000')
insert into transactions values (2, 1, 'Iphone', 2, 'Vu A Dai', '2024-04-19', 3, '750.000')
insert into transactions values (3, 5, 'Earphone', 4, 'Truong', '2024-08-20', 5, '100.000')
insert into transactions values (4, 4, 'Television', 3, 'Son', '2024-07-21 ', 2, '1.000.000')
insert into transactions values (5, 3, 'Fridge', 5, 'Manh', '2024-06-20', 1, '350.000')

select * from transactions
drop table dbo.transcations
go
create table dbo.orders (
    orders_id int primary key not null,
    product_id int not null,
    orders_date date not null,
    orders_products int not null
)
insert into dbo.orders values (1, 2, '2024-02-12', 4);
insert into dbo.orders values (2, 1, '2024-04-19', 2);
insert into dbo.orders values (3, 5, '2024-08-20', 3 );
insert into dbo.orders values (4, 4, '2024-07-21', 2);
insert into dbo.orders values (5, 3, '2024-06-20', 1);

select * from dbo.orders

go
create table dbo.topsell (
				topseller_id int primary key not null,
				topseller_date date not null,
				topseller_product int not null,
				product_id int not null,
				product_name varchar(100) not null,
				customer_id int not null,
				customer_name varchar(100) not null,
				FOREIGN KEY (product_id) REFERENCES dbo.product(product_id),
				FOREIGN KEY (product_name) REFERENCES dbo.product(product_name),
				FOREIGN KEY (customer_id) REFERENCES dbo.customer(customer_id),
				FOREIGN KEY (customer_name) REFERENCES dbo.customer(customer_name)
)

select * from dbo.topsell
drop table dbo.topseller
go
create table dbo.account (
		username varchar(100) primary key not null,
		u_password varchar(100) not null,
		u_role varchar(100) not null
)
insert into dbo.account values ('admin', '2107', 'admin')
insert into dbo.account values ('customer', '1234','customer')

select * from dbo.account

go
CREATE TABLE UserStore (
	id int primary key identity not null,
    Username NVARCHAR(50) NOT NULL,
    Password NVARCHAR(100) NOT NULL,
	hash nvarchar (100) not null
)
select * from UserStore
alter table UserStore drop column Password
drop table UserStore

SELECT TOP 3
    p.product_name,
    SUM(o.orders_products) AS total_sold
FROM
    dbo.orders o
JOIN
    dbo.product p ON o.product_id = p.product_id
GROUP BY
    p.product_name
ORDER BY
    total_sold DESC;




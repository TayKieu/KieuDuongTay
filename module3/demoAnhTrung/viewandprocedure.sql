create database viewandprocedure;
use viewandprocedure;
create table products(
id int not null primary key,
productCode int,
productName varchar(45),
productPrice tinyint,
productAmount int,
productDescription varchar(45),
productStatus varchar(45)
);
insert into products
value (1,2,"but",7,100,"PhiLong","Con Hang"),
(2,3,"vo",10,100,"PhiLong","Con Hang"),
(3,4,"sach",7,100,"PhiHo","Het Hang");
-- index
create unique index pc on products(productCode);
alter table products add index idx_name_price(productName,productPrice); 
explain select productCode from products
where productCode = 3;
-- view
create or replace view info 
as 
	select productCode, productName, productPrice, productStatus
    from products;
select * from info;

update info
set productPrice = 12
where productCode = 2;

-- drop view info;

-- procedure
-- 1. lay tat ca thong tin tu products
DELIMITER $$
create procedure getInfo()
begin
	select * from products;
end $$
DELIMITER ;
call getInfo();

-- 2. them 1 san pham moi
 DELIMITER $$
 create procedure addNew2 (in a int, in b int,in c varchar(45),in d int, in e tinyint, in f varchar(45), in g varchar(45))
 begin
	insert into products(id,productCode,productName,productPrice,productAmount,productDescription,productStatus) 
    value (a, b, c, d, e, f, g);
end $$
 DELIMITER ;
call addNew2(5,6,'Banh',8,100,'Chocopie','Het Hang');
select * from products;

-- 3. sua thong tin san pham theo id
DELIMITER $$ 
create procedure updateData (in a int, in b int,in c varchar(45),in d int, in e tinyint, in f varchar(45), in g varchar(45))
begin 
	update products
    set productCode = b,productName = c,productPrice = d,productAmount = e,productDescription = f,productStatus = g
    where id = a;
end $$
DELIMITER ;
call updateData(3,7,'Banh',8,100,'Chocopie','Het Hang');
select * from products;
call updateData(3,4,"sach",7,100,"PhiHo","Het Hang")

-- 4. xoa san pham theo id
DELIMITER $$
create procedure deleteData (in a int)
begin
	delete from products
    where id = a;
end $$
DELIMITER ;
call deleteData(3);
select * from products;
call addNew2(3,4,"sach",7,100,"PhiHo","Het Hang");
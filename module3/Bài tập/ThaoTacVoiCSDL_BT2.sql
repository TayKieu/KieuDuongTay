use quanlybanhang;
insert into customer
values (1,'Minh Quan',10),
	   (2,'Ngoc Oanh',20),
       (3,'Hong Ha',50); 
       
insert into product
values(1,'May Giat',3),
	  (2,'Tu Lanh',5),
      (3,'Dieu Hoa',7),
      (4,'Quat',1),
      (5,'Bep Dien',2);

insert into orders(oID,cID,oDate)
values(1,1,STR_TO_DATE("3-21-2006", "%m-%d-%Y")),
	  (2,2,STR_TO_DATE("3-23-2006", "%m-%d-%Y")),
	  (3,1,STR_TO_DATE("3-16-2006", "%m-%d-%Y"));

insert into orderdetail
values(1,1,3),
	  (1,3,7),
	  (1,4,2),
	  (2,1,1),
	  (3,1,8),
	  (2,5,4),
	  (2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng order
select oID, oDate, oToTalPrices 
from orders;

select c.cID, c.cName, p.pName
from customer c
join orders o on c.cID = o.cID
join orderdetail od on od.oID = o.oID
join product p on p.pID = od.pID ;

select c.cID, c.cName, c.cAge from customer c
left join orders o on c.cID = o.cID
where o.cID is null;

select od.oID,
	   o.oDate,
       sum(od.odQTY*p.pPrice) as price
from orderdetail od join product p on od.pID = p.pID
join orders o on o.oID = od.oID
group by od.oID


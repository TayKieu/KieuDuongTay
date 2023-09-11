create database quanlybanhang;
use quanlybanhang;
create table customer(
cID int not null primary key,
cName varchar(40),
cAge int);
create table orders(
oID int not null primary key,
cID int not null,
oDate date,
oTotalPrices int,
foreign key (cID) references customer(cID));
create table product(
pID int not null primary key,
pName varchar(40),
pPrice int);
create table orderdetail(
oID int not null,
pID int not null,
odQTY int,
unique(oID,pID),
primary key (Oid, pId),
foreign key (oID) references orders(oID),
foreign key (pID) references product(pID));
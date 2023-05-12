create database quanlythuvien;
use quanlythuvien;
create table book(
id_book int not null primary key auto_increment,
name_book varchar(50),
author varchar(50),
description varchar(50),
amount int 
);
create table student(
id_student int not null primary key auto_increment,
name_student varchar(100),
class varchar(50));
create table borrowcard(
id_borrow int not null primary key auto_increment,
id_book int,
id_student int,
foreign key(id_book) references book(id_book),
foreign key(id_student) references student(id_student),
status boolean,
date_borrow date,
date_return date);
insert into book(id_book,name_book,author,description,amount)values
(
1,'so do','vu trong phung','xuan toc do' ,10),
(2,'truyen kieu','nguyen du','thuy kieu' ,10),
(3,'tat den','ngo tat to','abc' ,10);




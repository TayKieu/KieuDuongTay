create database tcomplex;
use tcomplex;
create table matbang(
Ma varchar(20) not null primary key,
dientich int,
trangthai varchar(40),
tang int,
loaivanphong int not null,
giathue int,
ngaybatdau date,
ngayketthuc date,
foreign key (loaivanphong) references loaimatbang(MaLoai));

create table loaimatbang(
MaLoai int not null primary key,
tenloai varchar(50));

insert into loaimatbang value (1,'Cho Thue'),(2,'Tron Goi');
insert into matbang value ('MB1',100,'Trong',2,1,20000,'1967-02-06','2013-06-15'),
('MB2',200,'Trong',2,1,20000,'1967-02-06','2013-06-15'),
('MB3',500,'Trong',2,1,20000,'1967-02-06','2013-06-15'),
('MB4',400,'Trong',2,1,20000,'1967-02-06','2013-06-15');
truncate table matbang;
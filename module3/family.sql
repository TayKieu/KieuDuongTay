create database family;
use family;
create table thanhvien(
CCCD varchar(100) not null primary key,
hoten varchar(100),
ngaysinh date,
MaHoKhau int not null,
foreign key (MaHoKhau) references hokhau(Ma));

create table hokhau(
Ma int not null primary key,
tenchuho varchar(100),
soluongthanhvien int,
ngaylaphokhau date,
diachi varchar(100) 
);

insert into thanhvien value (0241,'kieu tay bac','2013-06-15',5),
(02412,'kieu duong tay','2003-12-15',1),
(02468,'kieu duong dong','1998-12-15',2),
(02368,'kieu duong nam','2003-01-15',3),
(02748,'kieu duong trung','2001-12-15',4),
(0241234,'kieu duong bac','2003-06-15',5);
insert into hokhau value (1,'nguyen van A',3,'1967-02-06','Da Nang'),
(2,'nguyen van B',3,'1967-02-06','Da Nang'),
(3,'nguyen van C',3,'1967-02-06','Da Nang'),
(4,'nguyen van D',3,'1967-02-06','Da Nang'),
(5,'nguyen van E',3,'1967-02-06','Da Nang');
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select * from hokhau h join thanhvien t on h.Ma = t.MaHoKhau group by h.Ma

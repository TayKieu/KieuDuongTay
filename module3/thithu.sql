create database HOCVIEN;
use HOCVIEN;
create table tbl_hocvien(
MaHocVien varchar(10) not null primary key,
TenHocVien varchar(50),
NgaySinh datetime,
GioiTinh varchar(3),
DiemThi double);
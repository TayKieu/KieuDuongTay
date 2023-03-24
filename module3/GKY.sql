create database quanlysieuthi;
use quanlysieuthi;
create table sanpham(
MaSanPham int not null primary key,
TenSanPham varchar(40),
NgayNhapHang date,
TinhTrang bool,
MaMatHang int not null,
foreign key(MaMatHang) references mathang(MaMatHang)  );
create table mathang(
MaMatHang int not null primary key,
TenMatHang varchar(40),
NhaSanXuat varchar(40)
);
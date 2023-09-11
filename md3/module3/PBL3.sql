create database pbl3;
use pbl3;

create table NHANVIEN(
MaNV int not null primary key,
HoTenNV varchar(45),
NgaySinh date,
DiaChi varchar(45),
CCCD varchar(45),
SDT varchar(20),
Email varchar(45),
GioiTinh bool,
MaChucVu int not null,
MaKPI int not null,
foreign key(MaChucVu) references CHUCVU(MaChucVu),
foreign key(MaKPI) references KPI(MaKPI)
);
create table CHUCVU(
MaChucVu int not null primary key,
TenChucVu varchar(45));
create table TAIKHOAN(
TenTK varchar(45),
MK varchar(45),
MaNV int not null,
foreign key(MaNV) references NHANVIEN (MaNV)
);
create table KPI(
MaKPI int not null primary key,
MaLoaiKPI int not null,
KPI double,
MucDoHoanThanh double,
foreign key(MaLoaiKPI) references LoaiKPI(MaLoaiKPI));
create table LoaiKPI(
MaLoaiKPI int not null primary key,
TenLoaiKPI varchar(45));
create table LUONGTHUONG(
MaLT int not null primary key,
LT double,
MaKPI int not null,
foreign key(MaKPI) references KPI(MaKPI));
create table KHACHHANG(
MaKH int not null primary key,
KH_HoTen varchar(45),
KH_NgaySinh date,
KH_DiaChi varchar(45),
KH_SDT varchar(45),
KH_Email varchar(45),
KH_GioiTinh bool,
MaLoaiKH int not null,
foreign key(MaLoaiKH) references LOAIKHACHHANG(MaLoaiKH));
create table LOAIKHACHHANG(
MaLoaiKH int not null primary key,
TenLoaiKH varchar(45));
create table HOPDONG(
MaHD int not null primary key,
NgayBatDau datetime,
NgayKetThuc datetime,
TongTien double,
TienDatCoc double,
MaNV int not null,
MaKH int not null,
TinhTrang bool,
foreign key(MaNV) references NHANVIEN(MaNV),
foreign key(MaKH) references KHACHHANG(Matb_calendarusersKH));
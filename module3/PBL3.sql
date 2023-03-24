create database danhgiananglucnhanvien;
use danhgiananglucnhanvien;
create table nhanvien(
id_nv int not null primary key,
ten_nv varchar(40),
gt_nv bool,
ns_nv date,
sdt_nv tinyint,
dc_nv varchar(45));

create table giamdoc(
id_gd int not null primary key,
ten_gd varchar(40),
gt_gd bool,
ns_gd date,
sdt_gd tinyint,
dc_gd varchar(45));

create table kehoachlamviec(
id_khlv int not null primary key,
ngaygiao_khlv date,
thoiluonglamviec int,
id_nv int not null,
id_gd int not null,
foreign key(id_nv) references nhanvien(id_nv),
foreign key(id_gd)references giamdoc(id_gd));

create table calam(
SoCa int not null primary key,
TGvaolam datetime,
TGtanlam datetime,
id_khlv int not null,
foreign key(id_khlv) references kehoachlamviec(id_khlv)
);

create table KPI(
SoKPI int not null primary key,
kpi_thang int,
kpi_nam int,
id_khlv int not null,
foreign key(id_khlv) references kehoachlamviec(id_khlv));

create table donhang(
id_dh int not null primary key,
soluong int,
ngaydathang datetime,
gia double);

create table luong (
id_luong int not null primary key,
sotien tinyint,
ngaynhan date
);
create table xeploai(
loaiNV varchar(40),
luongthuong tinyint,
id_nv int not null,
id_luong int not null,
primary key(id_nv,id_luong),
foreign key(id_nv) references nhanvien(id_nv),
foreign key(id_luong) references luong(id_luong)
);

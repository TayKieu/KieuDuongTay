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
foreign key(id_nv) references nhanvien(id_nv),
foreign key(id_gd)references giamdoc(id_gd));

create table calam(
SoCa int not null primary key,
TGvaolam datetime,
TGtanlam datetime,
foreign key(id_khlv) references kehoachlamviec(id_khlv)
);

create table KPI(
SoKPI int not null primary key,
kpi_thang int,
kpi_nam int,
foreign key(id_khlv) references kehoachlamviec(id_khlv));

create table 
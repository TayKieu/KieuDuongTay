use chuyendoierd;
create table phieuxuat(
SoPX int not null primary key,
NgayXuat date );
create table vattu(
MaVTu int not null primary key,
TenVTu varchar(40)) ;
create table phieunhap(
SoPN int not null primary key,
NgayNhap date);
create table dondh(
SoDH int not null primary key,
NgayDH date
);
create table nhacc(
MaNCC int not null primary key,
TenNCC varchar(45),
DiaChi varchar(45)
);
create table sdt(
MaSDT int not null primary key,
sdt varchar(10),
MaNCC int not null,
foreign key (MaNCC) references nhacc(MaNCC)
);
create table chitietphieuxuat(
DGXuat int,
SLXuat int,
SoPX int not null,
MaVTu int not null,
unique(SoPX,MaVTu),
primary key(SoPX,MaVTu),
foreign key (SoPX) references phieuxuat(SoPX),
foreign key (MaVTu) references vattu(MaVTu) );
create table chitietphieunhap(
DGNhap int,
SLNhap int,
MaVTu int not null,
SoPN int not null,
unique(SLNhap, MaVTu),
primary key(MaVTu,SoPN),
foreign key (MaVTu) references vattu(MaVTu),
foreign key (SoPN) references phieunhap(SoPN)
);
create table chitietdondathang(
MaVTu int not null ,
SoDH int not null,
unique(MaVTu,SoDH),
primary key(MaVTu,SoDH),
foreign key (MaVTu) references vattu(MaVTu),
foreign key (SoDH) references dondh(SoDH));

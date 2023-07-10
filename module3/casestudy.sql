create database casestudy;
use casestudy;

create table vi_tri(
ma_vi_tri int not null primary key,
ten_vi_tri varchar(45));

create table trinh_do(
ma_trinh_do int not null primary key,
ten_trinh_do varchar(45));

create table bo_phan(
ma_bo_phan int not null primary key,
ten_bo_phan varchar(45));

create table nhan_vien(
ma_nhan_vien int not null primary key,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int ,
ma_trinh_do int ,
ma_bo_phan int ,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan));

CREATE TABLE loai_khach (
ma_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
ten_loai_khach VARCHAR(45)
);

CREATE TABLE khach_hang (
ma_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
ma_loai_khach INT,
ho_ten VARCHAR(45),
ngay_sinh DATE,
gioi_tinh BIT(1),
so_cmnd VARCHAR(45),
so_dien_thoai VARCHAR(45),
email VARCHAR(45),
dia_chi VARCHAR(45),
FOREIGN KEY (ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);

CREATE TABLE kieu_thue (
ma_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
ten_kieu_thue VARCHAR(45)
);

CREATE TABLE loai_dich_vu (
ma_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE dich_vu (
ma_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
ten_dich_vu VARCHAR(45),
dien_tich INT,
chi_phi_thue DOUBLE,
so_nguoi_toi_da INT,
ma_kieu_thue INT,
ma_loai_dich_vu INT,
tieu_chuan_phong VARCHAR(45),
mo_ta_tien_nghi_khac VARCHAR(45),
dien_tich_ho_boi DOUBLE,
so_tang INT,
FOREIGN KEY (ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
FOREIGN KEY (ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
ma_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
ten_dich_vu_di_kem VARCHAR(45),
gia DOUBLE,
don_vi VARCHAR(10),
trang_thai VARCHAR(45)
);

CREATE TABLE hop_dong (
ma_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
ngay_lam_hop_dong DATETIME,
ngay_ket_thuc DATETIME,
tien_dat_coc DOUBLE,
ma_nhan_vien INT,
ma_khach_hang INT,
ma_dich_vu INT,
FOREIGN KEY (ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
FOREIGN KEY (ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet (
ma_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
ma_hop_dong INT,
ma_dich_vu_di_kem INT,
so_luong INT,
FOREIGN KEY (ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
FOREIGN KEY (ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

INSERT INTO vi_tri (ma_vi_tri, ten_vi_tri)
VALUE(1, 'Quản Lý'),
	 (2, 'Nhân Viên');
SELECT * FROM vi_tri;
     
INSERT INTO trinh_do (ma_trinh_do, ten_trinh_do)
VALUE(1, 'Trung Cấp'),
     (2, 'Cao Đẳng'),
     (3, 'Đại Học'),
     (4, 'Sau Đại Học');
SELECT * FROM trinh_do;
     
INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan)
VALUE(1, 'Sale-Marketing'),
	 (2, 'Hành chính'),
     (3, 'Phục vụ'),
     (4, 'Quản lý');
SELECT * FROM bo_phan;
     
INSERT INTO nhan_vien
VALUE(1, 'Nguyễn Văn An', '1970-11-07',	'456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng',	1, 3, 1),
     (2, 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
     (3, 'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
     (4, 'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
     (5, 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
     (6, 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
     (7, 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
     (8, 'Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
     (9, 'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
     (10, 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);
 SELECT * FROM nhan_vien;
 
INSERT INTO loai_khach (ma_loai_khach, ten_loai_khach)
VALUE(1, 'Diamond'),
     (2, 'Platinium'),
     (3, 'Gold'),
     (4, 'Silver'),
     (5, 'Member');
SELECT * FROM loai_khach;
     
INSERT INTO khach_hang
VALUE(1, 5, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng'),
     (2, 3, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
     (3, 1, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
     (4, 1, 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
     (5, 4, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
     (6, 4, 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
     (7, 1, 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
     (8, 3, 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
     (9, 1, 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
     (10, 2, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');
SELECT * FROM khach_hang;
     
INSERT INTO kieu_thue (ma_kieu_thue, ten_kieu_thue)
VALUE(1, 'year'),
     (2, 'month'),
     (3, 'day'),
     (4, 'hour');
SELECT * FROM kieu_thue;
     
INSERT INTO loai_dich_vu (ma_loai_dich_vu, ten_loai_dich_vu)
VALUE(1, 'Villa'),
     (2, 'House'),
     (3, 'Room');
SELECT * FROM loai_dich_vu;
    
INSERT INTO dich_vu
VALUE(1, 'Villa Beach Front', 25000, 10000000, 10, 3, 1, 'vip', 'Có hồ bơi', 500, 4),
     (2, 'House Princess 01', 14000, 5000000, 7, 2, 2, 'vip', 'Có thêm bếp nướng', null, 3),
     (3, 'Room Twin 01', 5000, 1000000, 2, 4, 3, 'normal', 'Có tivi', null, null),
     (4, 'Villa No Beach Front', 22000, 9000000, 8, 3, 1, 'normal', 'Có hồ bơi', 300, 3),
     (5, 'House Princess 02', 10000, 4000000, 5, 3, 2, 'normal', 'Có thêm bếp nướng', null, 2),
     (6, 'Room Twin 02', 3000, 900000, 2, 4, 3, 'normal', 'Có tivi', null, null);
SELECT * FROM dich_vu;

INSERT INTO dich_vu_di_kem
VALUE(1, 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
     (2, 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
     (3, 'Thuê xe đạp', 20000, 'chiếc', 'tốt'),
     (4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
     (5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
     (6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');
SELECT * FROM dich_vu_di_kem;
     
INSERT INTO hop_dong
VALUE(1, '2020-12-08', '2020-12-08', 0, 3, 1, 3),
     (2, '2020-07-14', '2020-07-21', 200000, 7, 3, 1),
     (3, '2021-03-15', '2021-03-17', 50000, 3, 4, 2),
     (4, '2021-01-14', '2021-01-18', 100000, 7, 5, 5),
     (5, '2021-07-14', '2021-07-15', 0, 7, 2, 6),
     (6, '2021-06-01', '2021-06-03', 0, 7, 7, 6),
     (7, '2021-09-02', '2021-09-05', 100000, 7, 4, 4),
     (8, '2021-06-17', '2021-06-18', 150000, 3, 4, 1),
     (9, '2020-11-19', '2020-11-19', 0, 3, 4, 3),
     (10, '2021-04-12', '2021-04-14', 0, 10, 3, 5),
     (11, '2021-04-25', '2021-04-25', 0, 2, 2, 1),
     (12, '2021-05-25', '2021-05-27', 0, 7, 10, 1);
SELECT * FROM hop_dong;
     
INSERT INTO hop_dong_chi_tiet
VALUE(1,  2, 4, 5),
     (2, 2, 5, 8),
     (3, 2, 6, 15),
     (4, 3, 1, 1),
     (5, 3, 2, 11),
     (6, 1, 3, 1),
     (7, 1, 2, 2),
     (8, 12, 2, 2);
SELECT * FROM hop_dong_chi_tiet;

-- câu 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien
where ho_ten like 'h%' and length(ho_ten) <= 17
or ho_ten like 't%' and length(ho_ten) <= 17
or ho_ten like 'k%' and length(ho_ten) <= 17;

-- SELECT
--    *
-- FROM
--    nhan_vien
-- WHERE
--    SUBSTRING_INDEX(ho_ten, ' ', - 1) REGEXP '^[HTK]'
--    AND CHAR_LENGTH(ho_ten) <= 15;

-- 3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang 
where timestampdiff(year,ngay_sinh,now()) >= 18 and  timestampdiff(year,ngay_sinh,now()) <= 50 and dia_chi like '% Đà Nẵng' or dia_chi like '% Quảng Trị';

-- SELECT
-- *
-- FROM
-- 	khach_hang
-- WHERE
-- 	TIMESTAMPDIFF(Year,ngay_sinh,now())  BETWEEN 18 AND 50
-- 	and(dia_chi like '%Da Nang%'
-- 		OR dia_chi like '%Quang Tri%');

-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select hd.ma_khach_hang, kh.ho_ten, count(hd.ma_khach_hang) as so_lan_dat_phong
from khach_hang kh join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by hd.ma_khach_hang
order by so_lan_dat_phong;

-- SELECT
--    kh.ho_ten,
--    count(hd.ma_khach_hang) so_lan_dat
-- from
--    khach_hang kh
--    JOIN loai_khach lk USING(ma_loai_khach)
--    JOIN hop_dong hd USING (ma_khach_hang)
-- WHERE
--    lk.ten_loai_khach = 'Diamond'
-- GROUP BY
--    hd.ma_khach_hang
-- ORDER BY
--    so_lan_dat;

-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong,
-- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với
-- tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng *
-- Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem,
-- hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những
-- khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra)
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT
    ma_khach_hang,
    ho_ten,
    ten_loai_khach,
    t.ma_hop_dong,
    ten_dich_vu,
    ngay_lam_hop_dong,
    ngay_ket_thuc,
    (IFNULL(sum(so_luong * gia), 0) + IFNULL(t.cpt, 0)) tongtien
from
    khach_hang
    LEFT JOIN loai_khach USING(ma_loai_khach)
    LEFT JOIN hop_dong USING(ma_khach_hang)
    LEFT JOIN hop_dong_chi_tiet USING(ma_hop_dong)
    LEFT JOIN dich_vu_di_kem USING(ma_dich_vu_di_kem)
    LEFT JOIN (
        SELECT
            ten_dich_vu,
            ma_hop_dong,
            sum(chi_phi_thue) cpt
        from
            khach_hang
            LEFT JOIN hop_dong USING(ma_khach_hang)
            LEFT JOIN dich_vu USING(ma_dich_vu)
        GROUP BY
            ma_hop_dong
    ) t USING(ma_hop_dong)
GROUP BY
    ma_hop_dong;
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
select hd.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where hd.ma_dich_vu not in(select hd1.ma_dich_vu from dich_vu dv1 join hop_dong hd1 where quarter(hd1.ngay_lam_hop_dong) = 1 and
year(hd1.ngay_lam_hop_dong) =2021)
group by hd.ma_dich_vu;

-- SELECT
--    ma_dich_vu,
--    ten_dich_vu,
--    dien_tich,
--    chi_phi_thue,
--    ten_loai_dich_vu
-- from
--    dich_vu
--    JOIN loai_dich_vu USING (ma_loai_dich_vu)
-- WHERE
--    ma_dich_vu not in (
--        SELECT
--            ma_dich_vu
--        from
--            dich_vu
--            join hop_dong using (ma_dich_vu)
--        WHERE
--            month(ngay_lam_hop_dong) BETWEEN 1
--            and 3
--            and year(ngay_lam_hop_dong) = 2021
--    );

-- 7.Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT
    ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from
    dich_vu dv
    JOIN loai_dich_vu USING (ma_loai_dich_vu)
WHERE
    EXISTS (
        SELECT
            1
        FROM
            hop_dong
        WHERE
            dv.ma_dich_vu = ma_dich_vu
            and year(ngay_lam_hop_dong) = 2020
    )
    and 
    NOT EXISTS (
            SELECT
            1
        FROM
            hop_dong
        WHERE
            dv.ma_dich_vu = ma_dich_vu
            and year(ngay_lam_hop_dong) = 2021
    );
    
-- 8.Hiển thị thông tin ho_ten khách hàng cótrong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- c1
select distinct ho_ten from khach_hang;
-- c2
select ho_ten from khach_hang group by ho_ten;
-- c3
select ho_ten from khach_hang
union
select ho_ten from khach_hang;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi
-- tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt
-- phòng.
select month(ngay_lam_hop_dong) as thang, count(ma_khach_hang) as so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = '2021'
group by thang
order by thang;

-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu
-- dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở
-- dich_vu_di_kem).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, coalesce(sum(hdct.so_luong),0)as so_luong_dich_vu_di_kem 
from hop_dong hd left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong;	

-- 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách
-- hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc
-- “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai
from dich_vu_di_kem dvdk join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = 'Diamond' and kh.dia_chi like '% Vinh' or kh.dia_chi like '% Quãng Ngãi';

-- 12. Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách
-- hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở
-- dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được
-- khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được
-- khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT
    ma_hop_dong,
    nv.ho_ten nhan_vien,
    kh.ho_ten khach_hang,
    kh.so_dien_thoai,
    ten_dich_vu,
    SUM(tien_dat_coc) tong_tien_coc,
    SUM(so_luong) tong_so_luong_dvdk,
    ngay_lam_hop_dong
from
    hop_dong
    LEFT JOIN nhan_vien nv USING (ma_nhan_vien)
    LEFT JOIN dich_vu USING (ma_dich_vu)
    LEFT JOIN khach_hang kh USING (ma_khach_hang)
    LEFT JOIN hop_dong_chi_tiet USING (ma_hop_dong)
    LEFT JOIN dich_vu_di_kem USING (ma_dich_vu_di_kem)
WHERE
    ma_khach_hang IN (
        SELECT
            ma_khach_hang
        FROM
            khach_hang
            JOIN hop_dong USING(ma_khach_hang)
        WHERE
            ngay_lam_hop_dong BETWEEN '2020-10-01'
            AND '2020-12-30'
    )
    and ma_khach_hang NOT IN (
        SELECT
            ma_khach_hang
        FROM
            khach_hang
            JOIN hop_dong USING(ma_khach_hang)
        WHERE
            ngay_lam_hop_dong BETWEEN '2021-01-01'
            AND '2021-06-30'
    )
GROUP BY
    ma_hop_dong;

-- 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các
-- Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử
-- dụng nhiều như nhau).
select hdct.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem,sum(hdct.so_luong) as so_luong, dvdk.gia, dvdk.don_vi, dvdk.trang_thai
from dich_vu_di_kem dvdk 
	join hop_dong_chi_tiet hdct using (ma_dich_vu_di_kem)
group by hdct.ma_dich_vu_di_kem
having so_luong >= (select max(so_luong) from hop_dong_chi_tiet);

-- solution1
-- SELECT
--    ma_dich_vu_di_kem,
--    ten_dich_vu_di_kem,
--    sum(so_luong) tong_so_luong_dvdk
-- FROM
--    dich_vu_di_kem
--    JOIN hop_dong_chi_tiet USING(ma_dich_vu_di_kem)
-- GROUP by
--    ma_dich_vu_di_kem
-- having
--    tong_so_luong_dvdk >= all(
--        select
--            sum(so_luong) tong_so_luong_dvdk
--       FROM
--            hop_dong_chi_tiet
--        GROUP by
--            ma_dich_vu_di_kem
--    );
	
-- solution2	
-- With count_used AS (
--    SELECT
--        ma_dich_vu_di_kem,
--        ten_dich_vu_di_kem,
--        sum(so_luong) tong_so_luong_dvdk
--    FROM
--        dich_vu_di_kem
--        JOIN hop_dong_chi_tiet USING(ma_dich_vu_di_kem)
--    GROUP by
--        ma_dich_vu_di_kem
-- )
-- SELECT
--    ma_dich_vu_di_kem,
--    ten_dich_vu_di_kem,
--    tong_so_luong_dvdk
-- FROM
--    count_used
-- WHERE
--    tong_so_luong_dvdk = (
--        SELECT
--            max(tong_so_luong_dvdk)
--        FROM
--            count_used
--    );

-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một
-- lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong,
-- ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính
-- dựa trên việc count các ma_dich_vu_di_kem).
SET  sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(ma_dich_vu_di_kem) as so_lan_su_dung
from dich_vu_di_kem dvdk
        join hop_dong_chi_tiet hdct using(ma_dich_vu_di_kem)
        join hop_dong hd using (ma_hop_dong)
        join dich_vu dv using (ma_dich_vu)
        join loai_dich_vu ldv using (ma_loai_dich_vu)
group by ma_dich_vu_di_kem
having so_lan_su_dung = 1;

-- 15.Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten,
-- ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được
-- tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(hd.ma_nhan_vien) as so_hop_dong
from nhan_vien nv join trinh_do td using (ma_trinh_do)
	join bo_phan bp using (ma_bo_phan)
    join hop_dong hd using (ma_nhan_vien)
where year(ngay_lam_hop_dong) between 2020 and 2021
group by hd.ma_nhan_vien
having so_hop_dong <= 3 ;

-- 16. Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete from nhan_vien nv
where not exists (
	select hd.ma_nhan_vien
    from hop_dong hd
    where hd.ma_nhan_vien = nv.ma_nhan_vien
    and year(hd.ngay_lam_hop_dong) between 2019 and 2021);

-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum
-- lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
UPDATE
    khach_hang
set
    ma_loai_khach = 1
WHERE
    ma_khach_hang in (
        select
            t.ma_khach_hang
        from
            (
                SELECT
                    kh.ma_khach_hang,
                    kh.ho_ten,
                    lk.ten_loai_khach,
                    hd.ma_hop_dong,
                    dv.ten_dich_vu,
                    hd.ngay_lam_hop_dong,
                    hd.ngay_ket_thuc,
                    (sum(dvdk.gia * hdct.so_luong) + tmp.gia_dv) tong_tien
                FROM
                    khach_hang kh
                    left JOIN loai_khach lk USING (ma_loai_khach)
                    left join hop_dong hd USING (ma_khach_hang)
                    left join dich_vu dv USING (ma_dich_vu)
                    left JOIN hop_dong_chi_tiet hdct USING (ma_hop_dong)
                    left join dich_vu_di_kem dvdk USING (ma_dich_vu_di_kem)
                    left JOIN (
                        SELECT
                            kh.ma_khach_hang as ma_khach_hang,
                            sum(dv.chi_phi_thue) as gia_dv
                        from
                            khach_hang kh
                            join hop_dong hd USING (ma_khach_hang)
                            join dich_vu dv USING (ma_dich_vu)
                        GROUP by
                            kh.ma_khach_hang
                    ) as tmp USING (ma_khach_hang)
                where
                    ten_loai_khach = 'Platinium'
                GROUP by
                    kh.ma_khach_hang
                HAVING
                    tong_tien > 1000000
            ) t
    );
-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
delete from khach_hang kh
where not exists (select 1
					from hop_dong hd
                    where kh.ma_khach_hang = hd.ma_khach_hang
                    and year(ngay_lam_hop_dong) < 2021);

-- 19.Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
UPDATE
    dich_vu_di_kem
set
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem in (
        SELECT
            tmp.ma_dich_vu_di_kem
        FROM
            (
                SELECT
                    ma_dich_vu_di_kem,
                    sum(so_luong) t
                FROM
                    dich_vu
                    JOIN hop_dong USING(ma_dich_vu)
                    JOIN hop_dong_chi_tiet USING(ma_hop_dong)
                GROUP by
                    ma_dich_vu_di_kem
                having
                    t > 10
            ) tmpcalam
    );
-- 20. Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ
-- thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang),
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select ma_nhan_vien as id,ho_ten,email,so_dien_thoai, ngay_sinh, dia_chi
from nhan_vien
union 
select ma_khach_hang ,ho_ten,email,so_dien_thoai,ngay_sinh,dia_chi
from khach_hang;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

SELECT
    *
FROM
    nhan_vien
WHERE
    SUBSTRING_INDEX(ho_ten, ' ', - 1) REGEXP '^[HTK]'
    AND CHAR_LENGTH(ho_ten) <= 15;
    
	
	
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT
	*
FROM
	khach_hang
WHERE
	TIMESTAMPDIFF(Year,ngay_sinh,now())  BETWEEN 18 AND 50
	and(dia_chi like '%Da Nang%'
		OR dia_chi like '%Quang Tri%');



-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần 
--	đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT
    kh.ho_ten,
    count(hd.ma_khach_hang) so_lan_dat
from
    khach_hang kh
    JOIN loai_khach lk USING(ma_loai_khach)
    JOIN hop_dong hd USING (ma_khach_hang)
WHERE
    lk.ten_loai_khach = 'Diamond'
GROUP BY
    hd.ma_khach_hang
ORDER BY
    so_lan_dat;



-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
--	tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và 
--	Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng.
--	(những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT
    ma_khach_hang,
    ho_ten,
    ten_loai_khach,
    t.ma_hop_dong,
    ten_dich_vu,
    ngay_lam_hop_dong,
    ngay_ket_thuc,
    (IFNULL(sum(so_luong * gia), 0) + IFNULL(t.cpt, 0)) tongtien
from
    khach_hang
    LEFT JOIN loai_khach USING(ma_loai_khach)
    LEFT JOIN hop_dong USING(ma_khach_hang)
    LEFT JOIN hop_dong_chi_tiet USING(ma_hop_dong)
    LEFT JOIN dich_vu_di_kem USING(ma_dich_vu_di_kem)
    LEFT JOIN (
        SELECT
            ten_dich_vu,
            ma_hop_dong,
            sum(chi_phi_thue) cpt
        from
            khach_hang
            LEFT JOIN hop_dong USING(ma_khach_hang)
            LEFT JOIN dich_vu USING(ma_dich_vu)
        GROUP BY
            ma_hop_dong
    ) t USING(ma_hop_dong)
GROUP BY
    ma_hop_dong;
    
	
    
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
--	chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

SELECT
    ma_dich_vu,
    ten_dich_vu,
    dien_tich,
    chi_phi_thue,
    ten_loai_dich_vu
from
    dich_vu
    JOIN loai_dich_vu USING (ma_loai_dich_vu)
WHERE
    ma_dich_vu not in (
        SELECT
            ma_dich_vu
        from
            dich_vu
            join hop_dong using (ma_dich_vu)
        WHERE
            month(ngay_lam_hop_dong) BETWEEN 1
            and 3
            and year(ngay_lam_hop_dong) = 2021
    );



-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT
    ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from
    dich_vu dv
    JOIN loai_dich_vu USING (ma_loai_dich_vu)
WHERE
    EXISTS (
        SELECT
            1
        FROM
            hop_dong
        WHERE
            dv.ma_dich_vu = ma_dich_vu
            and year(ngay_lam_hop_dong) = 2020
    )
    and 
    NOT EXISTS (
            SELECT
            1
        FROM
            hop_dong
        WHERE
            dv.ma_dich_vu = ma_dich_vu
            and year(ngay_lam_hop_dong) = 2021
    );
    


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau. Sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
 
SELECT
    DISTINCT(ho_ten)
FROM
    khach_hang;


SELECT
    ho_ten
FROM
    khach_hang
GROUP BY
    ho_ten;
    

SELECT
    ho_ten
FROM
    khach_hang
UNION
SELECT
    ho_ten
FROM
    khach_hang;
    


-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT
    tmp.thang,
    IFNULL(co.so_lan_khach_dat, 0)
FROM
    (
        SELECT
            1 AS thang
        UNION
        SELECT
            2 AS thang
        UNION
        SELECT
            3 AS thang
        UNION
        SELECT
            4 AS thang
        UNION
        SELECT
            5 AS thang
        UNION
        SELECT
            6 AS thang
        UNION
        SELECT
            7 AS thang
        UNION
        SELECT
            8 AS thang
        UNION
        SELECT
            9 AS thang
        UNION
        SELECT
            10 AS thang
        UNION
        SELECT
            11 AS thang
        UNION
        SELECT
            12 AS thang
    ) AS tmp
    LEFT JOIN (
        SELECT
            month(ngay_lam_hop_dong) AS thang,
            count(ma_khach_hang) AS so_lan_khach_dat
        FROM
            hop_dong
        WHERE
            YEAR(ngay_lam_hop_dong) = '2021'
        GROUP BY
            thang
    ) AS co USING (thang);



-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT
    hd.ma_hop_dong,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    sum(hd.tien_dat_coc) tong_tien_coc,
    IFNULL(sum(hdct.so_luong), 0) so_luong_dich_vu_di_kem
FROM
    hop_dong hd
    left JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP by
    hd.ma_hop_dong;
	
	

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT
    ma_dich_vu_di_kem,
    ten_dich_vu_di_kem
from
    dich_vu_di_kem
    JOIN hop_dong_chi_tiet USING (ma_dich_vu_di_kem)
    JOIN hop_dong hd USING (ma_hop_dong)
    JOIN khach_hang USING (ma_khach_hang)
    JOIN loai_khach USING (ma_loai_khach)
WHERE
    ten_loai_khach = 'Diamond'
    and (
        dia_chi like '%Vinh%'
        or dia_chi like '%Quang Ngai%'
    );



-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ 
-- đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT
    ma_hop_dong,
    nv.ho_ten nhan_vien,
    kh.ho_ten khach_hang,
    kh.so_dien_thoai,
    ten_dich_vu,
    SUM(tien_dat_coc) tong_tien_coc,
    SUM(so_luong) tong_so_luong_dvdk,
    ngay_lam_hop_dong
from
    hop_dong
    LEFT JOIN nhan_vien nv USING (ma_nhan_vien)
    LEFT JOIN dich_vu USING (ma_dich_vu)
    LEFT JOIN khach_hang kh USING (ma_khach_hang)
    LEFT JOIN hop_dong_chi_tiet USING (ma_hop_dong)
    LEFT JOIN dich_vu_di_kem USING (ma_dich_vu_di_kem)
WHERE
    ma_khach_hang IN (
        SELECT
            ma_khach_hang
        FROM
            khach_hang
            JOIN hop_dong USING(ma_khach_hang)
        WHERE
            ngay_lam_hop_dong BETWEEN '2020-10-01'
            AND '2020-12-30'
    )
    and ma_khach_hang NOT IN (
        SELECT
            ma_khach_hang
        FROM
            khach_hang
            JOIN hop_dong USING(ma_khach_hang)
        WHERE
            ngay_lam_hop_dong BETWEEN '2021-01-01'
            AND '2021-06-30'
    )
GROUP BY
    ma_hop_dong;
    
    
	
-- 13.  Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).


-- solution1
SELECT
    ma_dich_vu_di_kem,
    ten_dich_vu_di_kem,
    sum(so_luong) tong_so_luong_dvdk
FROM
    dich_vu_di_kem
    JOIN hop_dong_chi_tiet USING(ma_dich_vu_di_kem)
GROUP by
    ma_dich_vu_di_kem
having
    tong_so_luong_dvdk >= all(
        select
            sum(so_luong) tong_so_luong_dvdk
        FROM
            hop_dong_chi_tiet
        GROUP by
            ma_dich_vu_di_kem
    );
	
-- solution2	
With count_used AS (
    SELECT
        ma_dich_vu_di_kem,
        ten_dich_vu_di_kem,
        sum(so_luong) tong_so_luong_dvdk
    FROM
        dich_vu_di_kem
        JOIN hop_dong_chi_tiet USING(ma_dich_vu_di_kem)
    GROUP by
        ma_dich_vu_di_kem
)
SELECT
    ma_dich_vu_di_kem,
    ten_dich_vu_di_kem,
    tong_so_luong_dvdk
FROM
    count_used
WHERE
    tong_so_luong_dvdk = (
        SELECT
            max(tong_so_luong_dvdk)
        FROM
            count_used
    );
    


-- 14.  Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị
-- bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

SELECT
		ma_hop_dong,
		ten_loai_dich_vu,
        ten_dich_vu_di_kem,
        count(ma_dich_vu_di_kem) so_lan_dung_dvdk
    FROM
        dich_vu_di_kem
        JOIN hop_dong_chi_tiet USING(ma_dich_vu_di_kem)
        JOIN hop_dong USING (ma_hop_dong)
        JOIN dich_vu USING (ma_dich_vu)
        JOIN loai_dich_vu USING (ma_loai_dich_vu)
    GROUP by
        ma_dich_vu_di_kem
        HAVING so_lan_dung_dvdk = 1;
        


-- 15.  Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

SELECT
    ma_nhan_vien,
    ho_ten,
    ten_trinh_do,
    ten_bo_phan,
    so_dien_thoai,
    dia_chi,
    count(hd.ma_nhan_vien) tong_so_hop_dong
FROM
    nhan_vien
    JOIN trinh_do USING (ma_trinh_do)
    JOIN bo_phan USING (ma_bo_phan)
    JOIN hop_dong hd USING (ma_nhan_vien)
where
    year(ngay_lam_hop_dong) BETWEEN 2020
    and 2021
GROUP by
    hd.ma_nhan_vien
having
    tong_so_hop_dong <= 3;	
	
	
	
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

DELETE FROM
    nhan_vien nv
WHERE
    NOT EXISTS (
        select
            1
        from
            hop_dong
        WHERE
            ma_nhan_vien = nv.ma_nhan_vien
            and YEAR(ngay_lam_hop_dong) BETWEEN 2019
            and 2021
    )
	
	
	
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinium lên Diamond, chỉ cập nhật những khách hàng
-- đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ

UPDATE
    khach_hang
set
    ma_loai_khach = 1
WHERE
    ma_khach_hang in (
        select
            t.ma_khach_hang
        from
            (
                SELECT
                    kh.ma_khach_hang,
                    kh.ho_ten,
                    lk.ten_loai_khach,
                    hd.ma_hop_dong,
                    dv.ten_dich_vu,
                    hd.ngay_lam_hop_dong,
                    hd.ngay_ket_thuc,
                    (sum(dvdk.gia * hdct.so_luong) + tmp.gia_dv) tong_tien
                FROM
                    khach_hang kh
                    left JOIN loai_khach lk USING (ma_loai_khach)
                    left join hop_dong hd USING (ma_khach_hang)
                    left join dich_vu dv USING (ma_dich_vu)
                    left JOIN hop_dong_chi_tiet hdct USING (ma_hop_dong)
                    left join dich_vu_di_kem dvdk USING (ma_dich_vu_di_kem)
                    left JOIN (
                        SELECT
                            kh.ma_khach_hang as ma_khach_hang,
                            sum(dv.chi_phi_thue) as gia_dv
                        from
                            khach_hang kh
                            join hop_dong hd USING (ma_khach_hang)
                            join dich_vu dv USING (ma_dich_vu)
                        GROUP by
                            kh.ma_khach_hang
                    ) as tmp USING (ma_khach_hang)
                where
                    ten_loai_khach = 'Platinium'
                GROUP by
                    kh.ma_khach_hang
                HAVING
                    tong_tien > 1000000
            ) t
    );
	
	
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- After set CASCADE or SET FOREIGN_KEY_CHECKS=OFF;
	
DELETE FROM
    khach_hang kh
WHERE
    NOT EXISTS (
        select
            1
        FROM
            hop_dong
        WHERE
            kh.ma_khach_hang = ma_khach_hang
            and YEAR(ngay_lam_hop_dong) >= 2021
    );
	
	
	
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

UPDATE
    dich_vu_di_kem
set
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem in (
        SELECT
            tmp.ma_dich_vu_di_kem
        FROM
            (
                SELECT
                    ma_dich_vu_di_kem,
                    sum(so_luong) t
                FROM
                    dich_vu
                    JOIN hop_dong USING(ma_dich_vu)
                    JOIN hop_dong_chi_tiet USING(ma_hop_dong)
                GROUP by
                    ma_dich_vu_di_kem
                having
                    t > 10
            ) tmp
    );
	
	
	
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT
    ma_nhan_vien as id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    nhan_vien
UNION ALL
SELECT
    ma_khach_hang,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    khach_hang;
	
	
	
-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng nam 2021

create view v_nhan_vien as
select
    ma_nhan_vien,
    ho_ten,
    dia_chi,
    so_dien_thoai
from
    nhan_vien
    JOIN hop_dong USING(ma_nhan_vien)
WHERE
    dia_chi like '%Đà Nẵng%'
    and year(ngay_lam_hop_dong) = 2021;
	
	
	
-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
   
update v_nhan_vien set dia_chi = 'Liên Chiểu';



-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(p_ma_khach_hang int)
BEGIN
delete from khach_hang WHERE ma_khach_hang = p_ma_khach_hang;
END
// DELIMITER ;



-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải
-- thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

DELIMITER // 
CREATE PROCEDURE sp_them_moi_hop_dong
(
  p_ma_hop_dong int,
  p_ngay_lam_hop_dong date,
  p_ngay_ket_thuc date, 
  p_tien_dat_coc double,
  p_ma_nhan_vien int, 
  p_ma_khach_hang int,
  p_ma_dich_vu int
) 
BEGIN 
DECLARE lastid int;
select 
  max(ma_hop_dong) into lastid 
from 
  hop_dong;
  
if (p_ma_hop_dong <> lastid + 1) THEN
 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Invalid Id';
ELSEIF (p_ngay_lam_hop_dong is null) THEN
 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Invalid Start Date';
 ELSEIF (p_ma_nhan_vien not in (select ma_nhan_vien from nhan_vien)) then
 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Invalid Ma Nhan Vien';
  ELSEIF (p_ma_khach_hang not in (select ma_khach_hang from khach_hang)) then
 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Invalid Mha Khach Hang';
  ELSEIF (p_ma_dich_vu not in (select ma_dich_vu from dich_vu)) then
 SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Invalid Ma Dich Vu';
else INSERT INTO hop_dong (
  ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
  ma_nhan_vien, ma_khach_hang, ma_dich_vu
) VALUE(
  p_ma_hop_dong, p_ngay_lam_hop_dong, p_ngay_ket_thuc, p_tien_dat_coc, 
  p_ma_nhan_vien, p_ma_khach_hang, p_ma_dich_vu
);
end if;
END 
// DELIMITER ;



-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi
-- còn lại có trong bảng hop_dong ra giao diện console của database.

DELIMITER //
CREATE TRIGGER tr_xoa_hop_dong
AFTER DELETE on hop_dong FOR EACH ROW
BEGIN
set @c= (select count(*) from hop_dong);
signal SQLSTATE '01000' set MESSAGE_TEXT = @c;
END
// DELIMITER ;

delete from hop_dong where ma_hop_dong =1;



-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không,
-- với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, 
--nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.

DELIMITER //
CREATE trigger tr_cap_nhat_hop_dong
after UPDATE on hop_dong FOR EACH ROW
BEGIN
if new.ngay_lam_hop_dong + 2 > new.ngay_ket_thuc then signal SQLSTATE '02000' set MESSAGE_TEXT = 'Invaild start date';
end if;
END
// DELIMITER ;



-- 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng
-- mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên
-- toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là 1 tham số của function này.

SET GLOBAL log_bin_trust_function_creators = 1;


DELIMITER //
create FUNCTION func_dem_dich_vu()
RETURNS  int
BEGIN
DECLARE res int;
select count(*) INTO res from (select sum(chi_phi_thue) t from dich_vu
join hop_dong using(ma_dich_vu)
group by ma_dich_vu
having t > 2000000) as tmp;
return res;
END
// DELIMITER ;
select func_dem_dich_vu();


DELIMITER //
CREATE FUNCTION func_tinh_thoi_gian_hop_dong(p_ma_khach_hang int)
RETURNS int
begin
DECLARE res int;
select max(tmp.t) into res from (select datediff(ngay_ket_thuc, ngay_lam_hop_dong) t from hop_dong
WHERE ma_khach_hang= p_ma_khach_hang) as tmp;
RETURN res;
end
// DELIMITER ;
select func_tinh_thoi_gian_hop_dong(5);



-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ
-- đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong
-- sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.

DELIMITER //
CREATE PROCEDURE sp_xoa_dich_vu_va_hd_room()
BEGIN
SET @myvar := (SELECT GROUP_CONCAT(ma_hop_dong SEPARATOR ',')  from dich_vu
JOIN loai_dich_vu using(ma_loai_dich_vu)
JOIN hop_dong using(ma_dich_vu)
WHERE ten_loai_dich_vu = 'Room' and  year(ngay_lam_hop_dong) BETWEEN 2015 and 2020);

DELETE FROM hop_dong_chi_tiet  WHERE FIND_IN_SET(ma_hop_dong,@myvar);
DELETE FROM hop_dong  WHERE FIND_IN_SET(ma_hop_dong,@myvar);
DELETE from dich_vu
WHERE ma_dich_vu in ( SELECT DISTINCT
			ma_dich_vu
		FROM
			hop_dong
		WHERE
			 FIND_IN_SET(ma_hop_dong,@myvar));
END
// DELIMITER ;
call sp_xoa_dich_vu_va_hd_room();
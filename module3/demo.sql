
-- lấy thông tin học viên có tên bắt đầu bằng "m"
select ma_hv, ten, ngay_sinh, dia_chi, ma_lop
from hoc_vien
where ten like "% m%";

-- đếm số lượng hv của mỗi lớp 
select ma_lop, count(ma_hv) as sl
from hoc_vien 
group by ma_lop;

-- lấy mã lớp có tổng số hv > 2
select ma_lop, count (ma_hv) as sl
from hoc_vien
group by ma_lop
having sl >2 ;

-- sắp xếp theo địa chỉ,
-- nếu địa chỉ trùng thì sx theo ngày sinh giảm dần
select * from hoc_vien
order by dia_chi, ngay_sinh desc;

-- lấy thông tin hv
-- và cho biết hv đó đang theo học tại lớp nào, khóa nào (chỉ những bạn đang có lớp) 
select ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
from hoc_vien
inner join lop on hoc_vien.ma_lop = lop.ma_lop;

-- lấy thông tin hv và cho biết hv đang theo học lớp nào, khóa nào (bao gồm các bạn ch có lớp)
select ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
from hoc_vien
left join lop on hoc_vien.ma_lop = lop.ma_lop;

-- lấy tất cả thông tin của 2 bảng
select ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
from hoc_vien
left join lop on hoc_vien.ma_lop = lop.ma_lop
union 
select ma_hv, ten, ngay_sinh, dia_chi, lop.ma_lop, khoa
from hoc_vien
right join lop on hoc_vien.ma_lop = lop.ma_lop;

-- lấy ngày sinh lớn nhất theo từng địa chỉ
select dia_chi, max(ngay_sinh)
from hoc_vien
group by dia_chi;

-- thêm vào chuỗi "CGDN-..."
select ma_hv , ten, dia_chi, ngay_sinh, concat('CGDN-', ma_lop) as ma_lop
from hoc_vien
where ma_lop is not null;

-- hiển thị năm sinh, không có tháng và ngày
select ma_hv, ten, dia_chi, ngay_sinh, year(now()) - year(ngay_sinh) as tuoi
from hoc_vien;

-- hoặc
select ma_hv, ten, dia_chi, ngay_sinh, timestampdiff(Year, ngay_sinh, now())
from hoc_vien;

-- lấy thông tin hv có tuổi lớn nhất
select hv.*, ngay_sinh
from hoc_vien hv
where ngay_sinh = (select min(ngay_sinh) from hoc_vien);

-- hoặc
select * from hoc_vien hv 
order by ngay_sinh
limit 1;

-- lấy 3 record từ hv_04
select * 
from hoc_vien hv
limit 2,3;

-- lấy thông tin tên gv/hv và trình độ tương ứng
create or replace view ten_trinh_do
as 
	select ten, trinh_do
    from giao_vien
    union 
    select ten, "cử nhân" as trinh_do
    from hoc_vien;

select * from ten_trinh_do;

-- trường hợp không thể sửa(update) view vì lệnh quá phức tạp
update ten_trinh_do
set trinh_do = "bác sĩ"
where ten = "Cong";

-- trường hợp có thể sửa 
create or replace view hoc_vien_ten
as 
	select ma_hv, ten
    from hoc_vien;
select * from hoc_vien_ten;

update hoc_vien_ten
set ten = "Nam"
where ma_hv = 'hv_03';

-- MySQL cung cấp lệnh kiểm tra view nào có thể sửa được
select table_name, is_updatable 
from information_schema.views
where table_schema = 'demo';

-- explain để xem index đã chạy trên mấy row
explain select * from hoc_vien
where ten = 'Linh';

-- viết thủ tục tính tổng 2 số nguyên truyền vào
DELIMITER $$
create procedure sum_number(in a int, in b int, out c int)
begin 
	set c = a + b;
end $$
DELIMITER ;
 
call sum_number(5,9, @tong);
select @tong;

-- viết thủ tục nhận vào 1 số nguyên 
-- và tăng giá trị số nguyên lên 1
DELIMITER $$
create procedure add_number(inout a int)
begin 
	set a = a + 1;
end $$
DELIMITER ;

set @a = 1;
call add_number(@a);
select @a;
use quanlysinhvien;
-- tat ca sinh vien
select * from student;
-- sinh vien dang theo hoc;
select * from student
where status = true;
-- danh sach mon hoc co thoi gian <10;
select * from subject 
where credit < 10;
-- danh sach hoc vien lop A1
select StudentID, StudentName, ClassName
from student 
inner join class on class.ClassID = student.ClassID
where ClassName = 'A1';
-- diem mon CF cua cac hoc vien
select student.StudentID, student.StudentName, subject.SubName, mark.Mark
from student
 join Mark on student.StudentID = Mark.StudentID
 join subject on subject.SubID = Mark.SubID
where subject.SubName = 'CF';


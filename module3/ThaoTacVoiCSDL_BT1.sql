use quanlysinhvien;
select * from student
where StudentName like 'h%';

select * from class 
where StartDate like '%-12%';

select * from subject 
where credit >=3 and credit <=5;

update student 
set ClassID = '2'
where StudentName = 'Hung';

select student.StudentName, subject.SubName, mark.Mark 
from mark join student on student.StudentID = mark.StudentID
join subject on subject.SubID = mark.SubID
order by mark.Mark desc, student.StudentName asc;



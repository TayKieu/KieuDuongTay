use quanlysinhvien;

select Address ,count(StudentID) as StundentAmount
from student
group by Address;

select st.StudentID, st.StudentName, avg(m.Mark) as AverageMark
from student st join mark m on st.StudentID = m.StudentID 
group by st.StudentID;

select st.StudentID, st.StudentName, avg(m.Mark) as AverageMark
from student st join mark m on st.StudentID = m.StudentID 
group by st.StudentID
having AverageMark >= all(select avg(Mark) from mark group by mark.StudentID)

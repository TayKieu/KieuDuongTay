use quanlysinhvien;
select * from subject
order by Credit desc
limit 1;

select s.SubID, s.SubName, s.Credit, s.Status, m.Mark from subject s
join mark m on s.SubID = m.SubID
order by m.Mark desc
limit 1;

select st.StudentID, st.StudentName,st.Address,st.Phone,st.Status, avg(mark) as AverageMark from student st 
left join Mark m on st.StudentID = m.StudentID
group by st.StudentID
order by AverageMark desc

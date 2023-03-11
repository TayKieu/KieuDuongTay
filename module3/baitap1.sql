use student;
create table class(
id_class int,
name_class varchar(45),
primary key(id_class));

create table teacher(
id_teacher int,
name_teacher varchar(45),
age_teacher int,
country_teacher varchar(45),
primary key (id_teacher));

select* from class;
insert into class(id_class,name_class)
value(1,'a0922i1');

select* from teacher;
insert into teacher(id_teacher,name_teacher,age_teacher,country_teacher)
value(1,'Quoc',30,'danang');



create database calendar;
use calendar;
create table tb_calendar(
id int not null auto_increment primary key,
date datetime,
event varchar(50),
location varchar(50),
startime datetime,
endtime datetime);
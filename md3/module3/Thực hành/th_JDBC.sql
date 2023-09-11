create database demo;
use demo;
create table users(
id int not null primary key auto_increment,
name varchar(50) not null,
email varchar(120) not null,
country varchar(120));
insert into users(name, email, country) values('tay','tay@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');
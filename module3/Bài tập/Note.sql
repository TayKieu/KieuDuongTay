create database iNotes;
use iNotes;
create table note_type(
type_id int not null primary key,
name varchar(100),
description varchar(200));
create table note(
id int not null primary key,
title varchar(100),
content varchar(500),
type_id int not null,
foreign key (type_id) references note_type(type_id));
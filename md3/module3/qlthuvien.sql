create database book_management;

use book_management;

create table book(
id varchar(255) primary key,
bname varchar(255),
author varchar(255),
`description` varchar(255),
quantity varchar(255)
);

create table student(
id varchar(255) primary key,
sname varchar(255),
class varchar(255)
);

create table card(
id varchar(255) primary key,
bid varchar(255),
sid varchar(255),
`status` boolean default 1,
dateIn date,
dateOut date,
constraint fk_card_book foreign key (bid) references book(id),
constraint fk_card_student foreign key (sid) references student(id)
);

insert into book value 
('S-0001','So do','Vu trong phung','nvc la xuan','10'),
('S-0002','Truyn kieu','Vu trong phung','nvc la xuan','15'),
('S-0003','DOemmon','Vu trong phung','nvc la xuan','15');

insert into student value
(1, 'Nam', 'A09'),
(2, 'Ba', 'A09'),
(3, 'Bon', 'A01'),
(4, 'Sau', 'A03'),
(5, 'Quang', 'A02');

insert into card(id,bid,sid,dateIn,dateOut) value 
('MS-0001','S-0001',1,'2023-10-12','2023-12-12'),
('MS-0002','S-0002',1,'2023-10-12','2023-12-12'),
('MS-0003','S-0003',2,'2023-10-12','2023-12-12'),
('MS-0004','S-0003',3,'2023-10-12','2023-12-12');

select * from book;
select * from card;

select card.id, bid, sid, status dateIn, dateOut from card  
join book on card.bid = book.id  
join student on card.sid = student.id
where student.sname like concat('%',"",'%') and book.bname like concat('%',"",'%') and status = 1;

-- DELIMITER $$
-- CREATE PROCEDURE updateBooking(in bid varchar(255))
-- BEGIN
-- set @newQuantity = (select quantity from book where id = bid) - 1;
-- update book set quantity = @newQuantity where id = bid;
-- END
-- $$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE returnBook(in cid varchar(255))
BEGIN
update card set status = 0, dateOut = date(now()) where id = cid;
set @bookId = (select bid from card where id = cid);

set @newQuantity = (select quantity from book where id = @bookId) + 1;
update book set quantity = @newQuantity where id = @bookId;
END
$$ DELIMITER ;

DELIMITER $$
CREATE PROCEDURE createCard(
	in _id varchar(255),
    in _bid varchar(255),
    in _sid varchar(255),
    in _dateIn date,
    in _dateOut date)
BEGIN
insert into card(id,bid,sid,dateIn,dateOut) value(_id,_bid,_sid,_dateIn,_dateOut);
set @newQuantity = (select quantity from book where id = _bid) - 1;
update book set quantity = @newQuantity where id = _bid;
END
$$ DELIMITER ;

Call createCard('MS-0013','S-0003','2','2023-5-5','2023-5-6');
Call returnBook('MS-0006');
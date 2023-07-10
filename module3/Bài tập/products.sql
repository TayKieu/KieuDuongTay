create database products;
use products;

create table category(
id_category int primary key not null,
categoryName varchar(120) not null 
);

create table product(
id int primary key not null auto_increment,
`name` varchar(120),
cost int,
quantity int,
color varchar(30),
`describe` varchar(200),
id_category int,
foreign key (id_category) references category(id_category)
);



-- tìm sản phẩm theo id
DELIMITER $$	

CREATE PROCEDURE get_product_by_id(IN product_id INT)

BEGIN

    SELECT p.id, p.`name`, p.cost, p.quantity, p.color, p.`describe`, c.categoryName

    FROM product p
    
    Join category c on p.id_category = c.id_category

    where p.id = product_id;

    END$$

DELIMITER ;



-- hiển thị list 

DELIMITER $$

CREATE PROCEDURE select_all_product()

BEGIN

    SELECT p.id, p.`name`, p.cost, p.quantity, p.color, p.`describe`, c.categoryName

    FROM product p
    
    Join category c on p.id_category = c.id_category
    
    order by p.id;

    END$$

DELIMITER ;




-- tìm id theo tên
DELIMITER $$
CREATE PROCEDURE get_id_by_name(in name_ctgr varchar(120))

BEGIN

    SELECT id_category

    FROM category
    
    Where categoryName = name_ctgr ;
    
	END$$
DELIMITER ;
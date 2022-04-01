create database de_mo;
use de_mo;
create table products(
id int primary key auto_increment, 
product_code int, 
product_name varchar(20), 
product_price double, 
product_amount int, 
product_description varchar(100), 
product_status bit);

insert into products(product_code, product_name, product_price, product_amount, product_description, product_status) value
(1, 'áo', 20, 3, 'màu vàng', 1),
(3, 'quần', 50, 5, 'màu trắng', 0),
(2, 'mũ', 15, 3, 'màu đen', 0),
(5, 'váy', 40, 1, 'màu hồng', 1);
-- Bước 3:
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table products add index product_code_idx(product_code);
select * from products where product_code = 5;
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table products add index products_name_price_idx(product_name, product_price);
select * from products where product_name = 'mũ' or product_price = 50;
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_name = 'mũ' or product_price = 50;
-- So sánh câu truy vấn trước và sau khi tạo index
-- tạo index nhanh hơn


-- Bước 4:
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_view as 
select product_code, product_name, product_price, product_amount
from products; 
-- Tiến hành sửa đổi view
create or replace view products_view as
select product_code, product_name, product_price, product_amount, id
from products;

-- Tiến hành xoá view
drop view products_view;

-- Bước 5:

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
	delimiter //
    create procedure find_all_product()
    begin
		select * from products;
    end //
    delimiter ;
    call find_all_product();
    
-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure insert_product(product_code int,  product_name varchar(20), product_price double, product_amount int, product_description varchar(100), product_status bit)
begin
insert into products(product_code, product_name, product_price, product_amount, product_description, product_status) value
(product_code,  product_name, product_price, product_amount, product_description, product_status);
end //
delimiter ;
call insert_product(7,'dù',10,2,'ni lông',1);
call find_all_product();

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_product_id (update_id int,product_code int,  product_name varchar(20), product_price double, product_amount int, product_description varchar(100), product_status bit)
begin
update products
set product_code = product_code,  product_name = product_name,  product_price =  product_price, 
product_amount = product_amount, product_description = product_description , product_status = product_status
where id= update_id;
end //
delimiter ;
call update_product_id(3,8,'áo mưa',43,7,'cao su',0);
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product_id(delete_id int)
begin
delete 
from products
where id = delete_id;
end //
delimiter ;
call delete_product_id(1);


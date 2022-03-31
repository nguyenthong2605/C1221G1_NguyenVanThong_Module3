use quan_ly_ban_hang;

insert into customer(cName, cAge) value
('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

insert into orders(cID, oDate) value
(1, '2006-3-21'),
(2, '2006-3-23'),
(1, '2006-3-16');

insert into product(pName, pPrice) value
('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

insert into oderdetail(oID, pID, odQTY) value
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select *
from orders;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select cName, pName
from customer
join orders on customer.cID = orders.cID
join oderdetail on orders.oID = oderdetail.oID
join product on product.pID = oderdetail.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select cName
from customer
left join orders on customer.cID = orders.cID
where orders.cID is null;
 
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select orders.oID, orders.oDate, sum(pPrice * odQTY)
from orders
inner join oderdetail on orders.oID = oderdetail.oID
inner join product on product.pID = oderdetail.pID
group by orders.oID;





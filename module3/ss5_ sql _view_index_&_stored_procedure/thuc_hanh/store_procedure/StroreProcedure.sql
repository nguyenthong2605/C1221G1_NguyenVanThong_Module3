use classicmodels;
delimiter //

create procedure findAllCustomers()

begin

  select * from customers;

end //

delimiter ;

call findAllCustomers();


drop procedure if exists `findAllCustomers`;
delimiter //
create procedure findAllCustomers()

begin

select * from customers where customerNumber = 175;

end //
delimiter ;


call findAllCustomers();
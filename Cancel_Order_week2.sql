use LittleLemonDB;
drop procedure if exists CancelOrder;
delimiter $
create procedure CancelOrder(Ordid int) 
begin
delete from Orders where OrderID=Ordid;
select concat("Order ", Ordid, " is cancelled") as Confirmation;
end$
delimiter ;

call CancelOrder(5)


select * from Customer;
select * from Product;
select * from Shipping;
select * from Orders;
select * from Order_items;

-------------------- 1 --------------------
select * from Customer where first_name like 'r%'
union
select * from Customer where first_name like '%g%';

-------------------- 2 --------------------
SELECT * FROM Order_items
WHERE unit_price > (SELECT  AVG(unit_price) FROM Order_items );

-------------------- 3 --------------------
select * from Order_items
where order_id like '%2'
order by quantity*unit_price desc

-------------------- 4 --------------------
select ot.order_item_id, o.order_id, c.first_name, p.product_name, s.shipper_name, o.status
from (Customer c
inner join Orders o on c.customer_id=o.customer_id)
inner join Shipping s on s.shipper_id=o.shipper_id
inner join Order_items ot on ot.order_id=o.order_id
inner join Product p on p.product_id=ot.product_id;
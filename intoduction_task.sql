
select * from Customer;
select * from Product;
select * from Shipping;
select * from Orders;
select * from Order_items;

-------------------- 1 --------------------
select * from Customer where last_name like 'MY%'
union
select * from Customer where last_name like '%SE%';

-------------------- 2 --------------------
select * from Customer where last_name like '%B[ru]%'

-------------------- 3 --------------------
SELECT * FROM Order_items
WHERE unit_price > (SELECT  AVG(unit_price) FROM Order_items );

-------------------- 4 --------------------
select * from Order_items 
order by quantity*unit_price desc

-------------------- 5 --------------------
select ot.order_item_id, o.order_id, c.first_name, p.product_name, s.shipper_name, o.status
from (Customer c
inner join Orders o on c.customer_id=o.customer_id)
inner join Shipping s on s.shipper_id=o.shipper_id
inner join Order_items ot on ot.order_id=o.order_id
inner join Product p on p.product_id=ot.product_id;
/*---------------------------------Query 1———————————*/
select ProductName, to_char(COALESCE(avg(cast (Discount as decimal(10,2))),0), '99999999900.00') as AverageDiscount 
	from Product left outer join OrderItems on Product.ProductId = OrderItems.ProductId
	group by ProductName 
	order by AverageDiscount desc;

/*---------------------------------Query 2———————————*/
select
PhoneNo as PhoneNO,
count(*) as CountOfCustomers
from Customer group by PhoneNo
having count(*) > 1
order by CountOfCustomers desc;

-- /*---------------------------------Query 3———————————*/
select p.productid, p.productname, s.firstname, s.lastname 
	from inventory i, product p, supplier s 
	where i.productid = p.productid and p.supplierid = s.supplierid and totalStock = 0 
	order by ProductId;

-- /*---------------------------------Query 4———————————*/
select c.customerid,  c.lastname, to_char(avg(oi.discount),'99999999900.00') as AverageDiscount 
	from customer c, orders o, orderitems oi 
	where c.customerid = o.customerid and o.orderid = oi.orderid 
	group by c.customerid, c.lastname  
	order by c.customerid;

-- /*---------------------------------Query 5———————————*/
select * from  ( 
	select p.productname, count(quantity) as NumberOfItemsSold 
		from product p, orderitems oi 
		where p.productid = oi.productid 
		group by p.productname 
		order by count(quantity) desc) 
where rownum <= 3;

-- /*---------------------------------Query 6———————————*/
select c.firstname, c.lastname, c.phoneno 
	from customer c, orders o 
	where c.customerid = o.customerid and o.status like 'delayed'
	group by  c.firstname, c.lastname, c.phoneno
	order by c.firstname;

-- /*---------------------------------Query 7———————————*/
select * from (
	select c.customerid, to_char(sum((oi.quantity * oi.unitprice*(1-discount*0.01))),'9999900.00') as revenue 
	from orders o, orderitems oi, customer c 
	where o.orderid = oi.orderid and c.customerid = o.customerid  
	group by c.customerid order by revenue desc) 
where rownum <=4;

-- /*---------------------------------Query 8———————————*/
select * from (
	select p.category, count(distinct(c.customerid)) as DistinctNumberOfCustomers 
	from customer c, orders o, orderitems oi, product p 
	where c.customerid = o.customerid and o.orderid = oi.orderid and oi.productid = p.productid 
	group by p.category 
	order by count(distinct(c.customerid)) desc) 
where rownum <= 3;

-- /*---------------------------------Query 9———————————*/
select c.firstname, c.lastname, t.orderid, t.totalAmount 
	from (
		select o.customerid, o.orderid, to_char(sum((oi.quantity * oi.unitprice*(1-discount*0.01))),'9999900.00') as totalAmount 
		from orders o, orderitems oi 
		where o.orderid = oi.orderid and o.status = 'delayed' 
		group by o.customerid,o.orderid) t, customer c 
	where t.customerid = c.customerid and t.totalAmount > 1000
	order by t.totalAmount desc ;

-- /*---------------------------------Query 10———————————*/
select s.supplierid, s.lastname, count(p.productid) as NumberOfDifferentProducts 
	from product p, supplier s 
	where p.supplierid = s.supplierid 
	group by s.supplierid, s.lastname 
	having count(p.productid) > 2 
	order by count(p.productid) desc;


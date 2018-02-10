-- CS348 Project 1 - Harris Christiansen

-- Query 1
select
ProductName as "ProductName",
(select avg(Discount) from OrderItems where OrderItems.ProductId=Product.ProductID) as "AverageDiscount"
from Product;

-- Query 2
select
PhoneNo as "PhoneNO",
count(*) as "CountOfCustomers"
from Customer group by PhoneNo
order by "CountOfCustomers" desc;

-- Query 3
select
ProductId as "ProductId",
ProductName as "ProductName",
(select FirstName from Supplier where Supplier.SupplierId=Product.SupplierId) as "FirstName",
(select LastName from Supplier where Supplier.SupplierId=Product.SupplierId) as "LastName"
from Product where (select count(*) from OrderItems where OrderItems.ProductId = Product.ProductId) = 0
order by ProductId;

-- Query 4
select
CustomerId as "CustomerId",
LastName as "LastName",
(select AVG((select OrderItems.Discount from OrderItems where OrderItems.OrderId = Orders.Orderid)) from Orders where Orders.CustomerId=Customer.CustomerId) as "AverageDiscount"
from Customer
order by CustomerId;

 -- Query 5
select
ProductName as "ProductName",
(select count(*) from OrderItems where OrderItems.ProductId=Product.ProductID) as "NumberOfItemsSold"
from Product
order by "NumberOfItemsSold" desc
FETCH NEXT 3 ROWS ONLY;

-- Query 6
select
FirstName as "FirstName",
LastName as "LastName",
PhoneNo as "PhoneNo"
from Customer
where (select count(*) from Orders where Orders.CustomerId = Customer.CustomerId and Orders.Status = 'delayed') > 0
order by FirstName;

-- Query 7
select
CustomerId as "CustomerId",
(select sum((select (OrderItems.UnitPrice * OrderItems.Quantity) from OrderItems where OrderItems.OrderId = Orders.OrderId)) from Orders where Orders.CustomerId=Customer.CustomerId) as "Revenue"
from Customer
where (select sum((select OrderItems.UnitPrice from OrderItems where OrderItems.OrderId = Orders.Orderid)) from Orders where Orders.CustomerId=Customer.CustomerId) > 0
order by "Revenue" desc
FETCH NEXT 4 ROWS ONLY;

-- Query 8
select
Category as "Category",
avg((select count(CustomerId) from Product prod left join OrderItems on OrderItems.ProductId = Product.ProductId left join Orders on Orders.OrderId = OrderItems.OrderId where prod.Category = Product.Category)) as "DistinctNumberOfCustomers"
from
Product group by Category
order by "DistinctNumberOfCustomers" desc
FETCH NEXT 3 ROWS ONLY;

-- Query 9
select
FirstName as "FirstName",
LastName as "LastName",
0 as "OrderId",
(select sum((select (OrderItems.UnitPrice * OrderItems.Quantity) from OrderItems where OrderItems.OrderId = Orders.OrderId)) from Orders where Orders.CustomerId = Customer.CustomerId and Orders.Status = 'delayed') as "TotalAmount"
from Customer
where (select sum((select (OrderItems.UnitPrice * OrderItems.Quantity) from OrderItems where OrderItems.OrderId = Orders.OrderId)) from Orders where Orders.CustomerId = Customer.CustomerId and Orders.Status = 'delayed') > 0
order by "TotalAmount" desc;

-- Query 10
select
SupplierId as "SupplierId",
LastName as "LastName",
(select count(*) from Product where Product.SupplierId = Supplier.SupplierId) as "NumberOfDifferentProducts"
from
Supplier
where (select count(*) from Product where Product.SupplierId = Supplier.SupplierId) >= 3
order by "NumberOfDifferentProducts" desc;

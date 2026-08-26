select * from Customers
select * from Orders
select * from Products

--1) Identify pairs of customers who live in the same country
select a.CustomerName,b.CustomerName
from customers a
join Customers b
on a.Country=b.Country and a.CustomerID <> b.CustomerID and a.CustomerID>b.CustomerID


--2) Find the customer who has spent the most on their orders
select customername from
(select CustomerName,sum(price) [amount spent],DENSE_RANK() over(order by sum(price) desc) [DR]
from Customers c
inner join Orders o
on c.CustomerID=o.CustomerID  inner join Products p on o.productID=p.ProductID
group by CustomerName) m where DR=1

select * from Customers
select * from Orders
--3) Find customers who have ordered more than one type of products
select customerName,count(ProductID) [amount spent] from Customers c
join Orders o
on c.CustomerID=o.CustomerID
group by CustomerName
having count(productId)>1



select * from Customers
select * from Orders
select * from Products
--4) List all products and their corresponding orders, using a RIGHT JOIN, including products that have never been ordered.
select OrderID,p.ProductID,ProductName from orders o right join products p on o.productID=p.productID

--5) Retrieve all orders placed by customers from the USA.
select OrderID from Customers c inner join orders o on c.CustomerID=o.CustomerID where Country=('USA') 

--6) Find the names of customers who have ordered a product priced above $500.
select * from customers c left join orders o on c.CustomerID=o.CustomerID inner join products p on o.ProductID=p.ProductID
where price>500
--
select distinct CustomerName from customers c inner join orders o on c.CustomerID=o.CustomerID left join products p on o.ProductID=p.ProductID
where price>500

--7) Find customers who have ordered the same product more than once.
select distinct m.customeName from
(select CustomerName,ProductID,count(OrderID) from customers c inner join orders o on c.CustomerID=o.CustomerID
group by CustomerName,ProductID
having count(orderID)>1) m
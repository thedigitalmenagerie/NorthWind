-- 1. What is the undiscounted subtotal for each Order (identified by OrderID). --

/* select OrderID,
	sum(UnitPrice * Quantity) [Undiscounted Subtotal]
from [Order Details]
group by OrderID */

-- 2. What products are currently for sale (not discontinued)? --


/* select ProductName, Products.UnitPrice, Discount, Discontinued
from [Order Details]
	join [Products]
		on Products.ProductID = [Order Details].ProductID
where Discount != 0 and Discontinued != 1 */


-- 3. What is the cost after discount for each order?  Discounts should be applied as a percentage off.--

/* select OrderID,
	sum(UnitPrice * Quantity) [Undiscounted Subtotal],
sum((UnitPrice * Quantity) * (1 - Discount)) [Discounted Total]
from [Order Details]
group by OrderID */

/* 4. I need a list of sales figures broken down by category name.
Include the total $ amount sold over all time and the total number of items sold.*/

/* select CategoryName, sum([Order Details].UnitPrice * Quantity) [Total Sales], sum(Quantity) [Total Units Sold]
from Categories
	join Products on Categories.CategoryID = Products.CategoryID
	join [Order Details] on Products.ProductID = [Order Details].ProductID
group by CategoryName */

-- 5. What are our 10 most expensive products? --

/* select TOP(10) UnitPrice, ProductName
from Products
group by UnitPrice, ProductName
order by UnitPrice DESC */

-- 6. In which quarter in 1997 did we have the most revenue?--

/* select TOP(1)
	sum(case
		when month(OrderDate) between 1 and 3 then (UnitPrice * Quantity) * (1 - Discount) else 0 end) [Total Sales Q1 1997],
	sum(case
		when month(OrderDate) between 4 and 6 then (UnitPrice * Quantity) * (1 - Discount) else 0 end) [Total Sales Q2 1997],
	sum(case
		when month(OrderDate) between 7 and 9 then (UnitPrice * Quantity) * (1 - Discount) else 0 end) [Total Sales Q3 1997],
	sum(case
		when month(OrderDate) between 10 and 12 then (UnitPrice * Quantity) * (1 - Discount) else 0 end) [Total Sales Q4 1997]
from Orders
	join [Order Details] on Orders.OrderID = [Order Details].OrderID
where year(OrderDate) = 1997 */


/* select TOP(1)
	Employee.FirstName,
	Employee.LastName,
	sum(case when InvoiceDate between '2009-01-01 00:00:00:000' AND '2009-12-31 00:00:00:000' then Total else 0 end) [Total Sales]
from Invoice
	join Customer on Customer.CustomerId = Invoice.CustomerId
	join Employee on Employee.EmployeeId = Customer.SupportRepId
group by Employee.FirstName, Employee.LastName
order by [Total Sales] DESC */

-- 7. Which products have a price that is higher than average?--
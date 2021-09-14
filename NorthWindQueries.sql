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
-- 6. In which quarter in 1997 did we have the most revenue?--
-- 7. Which products have a price that is higher than average?--
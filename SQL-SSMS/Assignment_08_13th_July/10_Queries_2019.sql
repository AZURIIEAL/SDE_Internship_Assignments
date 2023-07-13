
--    ASSIGNMENT:08
--<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
--1. What is the Name, ProductID and Weight for the item with Product Number 'RM-M823'
SELECT Name,ProductID,Weight from SalesLT.Product WHERE ProductNumber = 'RM-M823'

--2 List products with weight greater than 500. For those products, show the following information: Product ID, Name, ListPrice and calculated Gross Margin (difference between list price and standard cost)
SELECT
  ProductID,[Name],ListPrice,
  (ListPrice -StandardCost) AS GrossMargin FROM SalesLT.Product
WHERE [Weight] > 500;

--3. How many Products are there with the standard weight between 400 and 500
SELECT COUNT(*) FROM SalesLT.Product WHERE 400 < [Weight] AND [Weight] <500;
--OR--
SELECT COUNT(*) FROM SalesLT.Product WHERE [Weight] BETWEEN 400 AND 500;

--4. How many Yellow colored bikes are there (Bikes can be identified by the Product number starting with 'BK')
SELECT COUNT(*) AS Bikes FROM SalesLT.Product WHERE ProductNumber LIKE 'BK%' AND Color='Yellow' 

--5. Find average, maximum and minimum list price for each Product line (exclude products where Product line is NULL), sort descending by Average Standard Cost.
SELECT ExtractString,AVG(ListPrice) AvgListPrice,MAX(ListPrice) MaxListPrice,MIN(ListPrice) MinListPrice,AVG(StandardCost) AvgStdCost
FROM(
		SELECT SUBSTRING(ProductNumber, 1, 2) AS ExtractString,ListPrice,StandardCost 
		FROM SalesLT.Product
	)AS T 
GROUP BY ExtractString 
ORDER BY (AvgStdCost) DESC;

select * from SalesLT.Product

--__________________________Evening___________13 th JULY 2023________________________________________________________________________________________

--1.Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest. For each order show the CompanyName and the SubTotal and the total weight of the order.
SELECT A.CompanyName, B.SubTotal, SUM( D.Weight * C.OrderQty)
FROM SalesLT.Customer A
INNER JOIN SalesLT.SalesOrderHeader B
	ON A.CustomerID = B.CustomerID
INNER JOIN SalesLT.SalesOrderDetail C
	ON B.SalesOrderID = C.SalesOrderID
INNER JOIN SalesLT.Product D
	ON C.ProductID = D.ProductID
GROUP BY A.CompanyName, B.SubTotal
ORDER BY B.SubTotal DESC

--2. How many products in ProductCategory ‘Cranksets’ have been sold to an address in ‘London’
SELECT * From SalesLT.ProductCategory WHERE Name='Cranksets'

SELECT *
FROM ( 
SELECT * FROM SalesLT.ProductCategory pc
INNER JOIN SalesLT.Product sp ON pc.ProductCategoryID = sp.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail sod ON sp.ProductID = sod.ProductID
INNER JOIN SalesLT.SalesOrderHeader soh ON pc.ProductCategoryID = sp.ProductCategoryID
INNER JOIN SalesLT.Product sp ON pc.ProductCategoryID = sp.ProductCategoryID
)t


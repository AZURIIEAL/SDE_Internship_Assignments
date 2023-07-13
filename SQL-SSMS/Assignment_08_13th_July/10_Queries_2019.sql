
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
SELECT COUNT(*) FROM SalesLT.Product WHERE ProductNumber LIKE 'BK%' AND Color='Yellow'

--5. Find average, maximum and minimum list price for each Product line (exclude products where Product line is NULL), sort descending by Average Standard Cost.
SELECT ExtractString,AVG(ListPrice) AvgListPrice,MAX(ListPrice) MaxListPrice,MIN(ListPrice) MinListPrice,AVG(StandardCost) AvgStdCost
FROM(
		SELECT SUBSTRING(ProductNumber, 1, 2) AS ExtractString,ListPrice,StandardCost 
		FROM SalesLT.Product
	)AS T 
GROUP BY ExtractString 
ORDER BY (AvgStdCost) DESC;










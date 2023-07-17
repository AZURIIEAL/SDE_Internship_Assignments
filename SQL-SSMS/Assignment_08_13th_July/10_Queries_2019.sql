
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
SELECT A.CompanyName, B.SubTotal, SUM( D.Weight * C.OrderQty) AS TotalWeight
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
SELECT COUNT(*) FROM SalesLT.ProductCategory pc
INNER JOIN SalesLT.Product sp 
	ON pc.ProductCategoryID = sp.ProductCategoryID
INNER JOIN SalesLT.SalesOrderDetail sod 
	ON sp.ProductID = sod.ProductID
INNER JOIN SalesLT.SalesOrderHeader soh 
	ON sod.SalesOrderID= soh.SalesOrderID 
INNER JOIN SalesLT.Customer C 
	ON soh.CustomerID = C.CustomerID
INNER JOIN SalesLT.CustomerAddress CA 
	ON C.CustomerID = CA.CustomerID
INNER JOIN SalesLT.[Address] A 
	ON CA.AddressID = A.AddressID
WHERE pc.Name='Cranksets' AND City='London'

/*3.For every customer with a ‘Main Office’ in Dallas show AddressLine1 of the ‘Main Office’ and AddressLine1 of the ‘Shipping’ address
- if there is no shipping address leave it blank. Use one row per customer.*/



SELECT 
    MO.AddressLine1 AS MainOfficeAddressLine1,
    ISNULL(SA.AddressLine1, '') AS ShippingAddressLine1
FROM 
    SalesLT.Customer AS C
    INNER JOIN SalesLT.CustomerAddress AS CA_MO 
	ON C.CustomerID = CA_MO.CustomerID
	--joining customer addres and customer and address,to het a hold of address id , customer id and address type.
    INNER JOIN SalesLT.Address AS MO
	ON CA_MO.AddressID = MO.AddressID

	--Now we need to left join it(we are actually filter cutting it and then joing the whole table after filtering)
    LEFT JOIN SalesLT.CustomerAddress AS CA_SA 
	ON C.CustomerID = CA_SA.CustomerID AND CA_SA.AddressType = 'Shipping'
	--now we will join the whole filtered table.
    LEFT JOIN SalesLT.Address AS SA 
	ON CA_SA.AddressID = SA.AddressID
WHERE 
-- Till here  we will get everything like no seperation in between so we need another where
--Addimg a where for applying the dallas and main office filter
    MO.City = 'Dallas' AND CA_MO.AddressType = 'Main Office';


	--.....................................................................
/*
4.For each order show the SalesOrderID and SubTotal calculated  in three ways: 
   A) From the SalesOrderHeader  (Order header table)
   B) Sum of OrderQtyUnitPrice  ( Order Detail table ) 
   C) Sum of OrderQtyListPrice (Product table)
*/





SELECT a.SalesOrderID,SubTotal,t2.SubTotal2,t1.SubTotal_3 FROM SalesLT.SalesOrderHeader as a
INNER JOIN (SELECT SalesOrderID,SUM(UnitPrice*OrderQty) SubTotal_2 FROM SalesLT.SalesOrderDetail
GROUP BY SalesOrderID)as t
on a.SalesOrderID = t.SalesOrderID --
INNER JOIN (SELECT SalesOrderID,SUM(ListPrice*OrderQty) SubTotal_3 FROM SalesLT.Product sp
INNER JOIN SalesLT.SalesOrderDetail sod ON sod.ProductID = sp.ProductID
GROUP BY SalesOrderID) as t1 
on t.SalesOrderID = t1.SalesOrderID --
INNER JOIN (SELECT SalesOrderID,SUM(UnitPrice*OrderQty) SubTotal2 FROM SalesLT.SalesOrderDetail
GROUP BY SalesOrderID
)as t2 on t.SalesOrderID = t2.SalesOrderID


--5.Show the best selling item by value.
SELECT TOP 1 P.[Name],P.[ProductID], --Selcting the top 1
SUM(SOD.OrderQty*(P.ListPrice-P.StandardCost)) --qty times the difference between the list price and standard cost ie profit.
AS [Profit] --name the coloumn as profit
FROM SalesLT.Product AS P
INNER JOIN SalesLT.SalesOrderDetail AS SOD
ON SOD.ProductID= P.ProductID
GROUP BY P.ProductID,P.[Name]
ORDER BY [Profit] DESC; --we need the biggest profit in top

/*6.From which city 
    a) most no of order
    b) most profitable city 
    c) which hasn't placed any orders*/


--  a) most no of order
SELECT TOP 1 --As we need the most number of orders (hence top1)
    A.City,
    COUNT(O.SalesOrderID) AS OrderCount
FROM
    SalesLT.SalesOrderHeader AS O
    INNER JOIN SalesLT.Address AS A
	ON O.ShipToAddressID = A.AddressID --map the address id to shipping id
GROUP BY
    A.City --Group by city and then order it in descending way and then selecct the top 1
ORDER BY
    OrderCount DESC;--The biggest value




--b) most profitable city 
SELECT TOP 1
    A.City,
    SUM(O.SubTotal + O.TaxAmt + O.Freight) AS TotalProfit
FROM
    SalesLT.SalesOrderHeader AS O
    JOIN SalesLT.Address AS A 
	ON O.ShipToAddressID = A.AddressID
GROUP BY
    A.City
ORDER BY
    TotalProfit DESC;

-- Cities that haven't placed any orders

SELECT
    A.City
FROM
    SalesLT.Address AS A
LEFT JOIN
    SalesLT.SalesOrderHeader AS O 
	ON O.ShipToAddressID = A.AddressID
WHERE
    O.SalesOrderID IS NULL;



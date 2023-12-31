--ASSIGNMENT:07
--10 Queries from the AdventureWorksLT2019 Db
-->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
--1.Show the CompanyName for James D. Kramer
SELECT CompanyName FROM SalesLT.Customer WHERE FirstName ='James'AND MiddleName='D.' AND LastName='Kramer';

--2.Show all the addresses listed for 'Modular Cycle Systems'
SELECT AddressLine1,AddressLine2,City,StateProvince,CountryRegion,PostalCode FROM SalesLT.Address
WHERE AddressID IN (SELECT AddressID FROM SalesLT.CustomerAddress WHERE
CustomerID IN(SELECT CustomerID FROM SalesLT.Customer WHERE CompanyName='Modular Cycle Systems'));

--Corrected
SELECT A.AddressLine1, A.AddressLine2, A.City, A.StateProvince, A.CountryRegion, A.PostalCode
FROM SalesLT.Address A
INNER JOIN SalesLT.CustomerAddress CA ON A.AddressID = CA.AddressID
INNER JOIN SalesLT.Customer C ON CA.CustomerID = C.CustomerID
WHERE C.CompanyName = 'Modular Cycle Systems';


--3.Show OrdeQty, the Name and the ListPrice of the order made by CustomerID 635
SELECT Name,ListPrice,OrderQty 
FROM SalesLT.Product as sp
INNER JOIN SalesLT.SalesOrderDetail AS sod
ON sod.ProductID=sp.ProductID
INNER JOIN SalesLT.SalesOrderHeader AS soh
ON soh.SalesOrderID=sod.SalesOrderID
WHERE soh.CustomerID = 30025 OR soh.CustomerID = 635; --No customerID 635 did order

--4.Show the first name and the email address of customer with CompanyName 'Bike World'
SELECT FirstName,EmailAddress FROM SalesLT.Customer WHERE CompanyName = 'Bike World';
 --Changed.
SELECT FirstName, EmailAddress
FROM SalesLT.Customer
WHERE CompanyName = 'Bike World'
GROUP BY FirstName, EmailAddress;


--5.Show the CompanyName for all customers with an address in City 'Dallas'.
SELECT DISTINCT CompanyName FROM SalesLT.Address AS A
INNER JOIN SalesLT.CustomerAddress AS CA
ON A.AddressID = CA.AddressID
INNER JOIN SalesLT.Customer AS C
ON CA.CustomerID = C.CustomerID
WHERE A.City='Dallas';

--6.How many items with ListPrice more than $1000 have been sold
--By Nesting:
SELECT COUNT(*) AS TotalCount
FROM
(
  SELECT ProductID
  FROM SalesLT.SalesOrderDetail
  GROUP BY ProductID
  HAVING ProductID IN
    (SELECT ProductID
     FROM SalesLT.Product
     WHERE ListPrice > 1000))as t --DerivedRuntime table

--7.Give the CompanyName of those customers with orders over $100000. Include the subtotal plus tax plus freight.
--From Tables SalesLT.SalesOrderHeader and SalesLT.CustomerID
SELECT CompanyName
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON
c.CustomerID = soh.CustomerID
WHERE soh.SubTotal + soh.TaxAmt + soh.Freight > 100000
GROUP BY CompanyName -- Changed

--8.Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'
--From Tables SalesLT.Customer,SalesLT.SalesOrderHeader,SalesOrderDetail,SalesLT.Product
SELECT SUM(OrderQty) AS TotalLeftRacingSocks
FROM SalesLT.Customer c
INNER JOIN SalesLT.SalesOrderHeader soh ON
c.CustomerID = soh.CustomerID
INNER JOIN SalesLT.SalesOrderDetail sod ON
soh.SalesOrderID = sod.SalesOrderID
INNER JOIN SalesLT.Product p ON
sod.ProductID = p.ProductID
WHERE c.CompanyName = 'Riding Cycles'
  AND p.Name = 'Racing Socks, L'

--9.�Single Item Order� is a customer order where only one item is ordered. Show the SalesOrderID and the UnitPrice for every Single Item Order.         
SELECT SalesOrderID,UnitPrice FROM SalesLT.SalesOrderDetail WHERE SalesOrderID IN (
SELECT SalesOrderID FROM SalesLT.SalesOrderDetail
GROUP BY SalesOrderID HAVING COUNT(*) = 1);

--10.Show the product description for culture �fr� for product with ProductID 736.
--From tables SalesLT.ProductDescription,SalesLT.ProductModelProductDescription,SalesLT.ProductModel,SalesLT.Product
SELECT pd.Description
FROM SalesLT.ProductDescription pd
INNER JOIN SalesLT.ProductModelProductDescription pmpd ON
pd.ProductDescriptionID = pmpd.ProductDescriptionID
INNER JOIN SalesLT.ProductModel pm ON
pmpd.ProductModelID = pm.ProductModelID
INNER JOIN SalesLT.Product p ON
pm.ProductModelID = p.ProductModelID
WHERE pmpd.Culture = 'fr'
  AND p.ProductID = 736;

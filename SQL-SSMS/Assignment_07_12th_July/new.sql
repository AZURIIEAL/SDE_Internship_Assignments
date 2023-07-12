--1.Show the CompanyName for James D. Kramer
SELECT CompanyName FROM SalesLT.Customer WHERE FirstName ='James'AND MiddleName='D.' AND LastName='Kramer';

--2.Show all the addresses listed for 'Modular Cycle Systems'
SELECT AddressLine1,AddressLine2,City,StateProvince,CountryRegion,PostalCode FROM SalesLT.Address
WHERE AddressID IN (SELECT AddressID FROM SalesLT.CustomerAddress WHERE
CustomerID IN(SELECT CustomerID FROM SalesLT.Customer WHERE CompanyName='Modular Cycle Systems'));

--3.Show OrdeQty, the Name and the ListPrice of the order made by CustomerID 635
SELECT Name,ListPrice,OrderQty 
FROM SalesLT.Product as sp
INNER JOIN SalesLT.SalesOrderDetail AS sod
ON sod.ProductID=sp.ProductID
INNER JOIN SalesLT.SalesOrderHeader AS soh
ON soh.SalesOrderID=sod.SalesOrderID
WHERE soh.CustomerID = 30025 OR soh.CustomerID = 635; --No customerID 635 did order

--4.Show the first name and the email address of customer with CompanyName 'Bike World'
SELECT DISTINCT FirstName,EmailAddress FROM SalesLT.Customer WHERE CompanyName = 'Bike World';

--5.Show the CompanyName for all customers with an address in City 'Dallas'.
SELECT DISTINCT CompanyName FROM SalesLT.Address AS A
INNER JOIN SalesLT.CustomerAddress AS CA
ON A.AddressID = CA.AddressID
INNER JOIN SalesLT.Customer AS C
ON CA.CustomerID = C.CustomerID
WHERE A.City='Dallas';

--6.How many items with ListPrice more than $1000 have been sold
SELECT COUNT(*) FROM SalesLT.SalesOrderDetail WHERE ProductID IN (SELECT ProductID FROM SalesLT.Product WHERE ListPrice > 1000 )


--7.Give the CompanyName of those customers with orders over $100000. Include the subtotal plus tax plus freight.




 


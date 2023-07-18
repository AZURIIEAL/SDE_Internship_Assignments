-- Assignment no:09 >> To Apply Exists in Queries
--____________________________________________________

--6.How many items with ListPrice more than $1000 have been sold
SELECT COUNT(DISTINCT sod.ProductID) AS CountOfDistinctProductID
FROM SalesLT.SalesOrderDetail sod
WHERE EXISTS (
    SELECT 1
    FROM SalesLT.Product p
    WHERE p.ProductID = sod.ProductID
    AND p.ListPrice > 1000
);

-- OR --

SELECT COUNT(1) ProductCount
FROM SalesLT.Product PR
WHERE EXISTS (SELECT 1 FROM SalesLT.SalesOrderDetail SO WHERE PR.ProductID = SO.ProductID)
AND PR.ListPrice > 1000

--8.Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'
--From Tables SalesLT.Customer,SalesLT.SalesOrderHeader,SalesOrderDetail,SalesLT.Product
SELECT SUM(OrderQty) AS TotalLeftRacingSocks
FROM SalesLT.SalesOrderDetail sod
WHERE EXISTS (
    SELECT 1
    FROM SalesLT.SalesOrderHeader soh
    INNER JOIN SalesLT.Customer c ON soh.CustomerID = c.CustomerID
    WHERE c.CompanyName = 'Riding Cycles'
    AND soh.SalesOrderID = sod.SalesOrderID
)
AND EXISTS (
    SELECT 1
    FROM SalesLT.Product p
    WHERE p.ProductID = sod.ProductID
    AND p.Name = 'Racing Socks, L'
);
SELECT * FROM SalesLT.SalesOrderHeader
--9.“Single Item Order” is a customer order where only one item is ordered. Show the SalesOrderID and the UnitPrice for every Single Item Order.         

SELECT SalesOrderID, UnitPrice
FROM SalesLT.SalesOrderDetail sod
WHERE EXISTS (
    SELECT *
    FROM SalesLT.SalesOrderDetail soh
    WHERE soh.SalesOrderID = sod.SalesOrderID
    GROUP BY soh.SalesOrderID
    HAVING COUNT(*) = 1
);

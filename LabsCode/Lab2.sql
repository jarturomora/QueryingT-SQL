-- Code for Lab 2 - Querying with Transact-SQL

---------------------------------------------------------
--Challenge 1: Retrieve Data for Transportation Reports--
---------------------------------------------------------
--Step 1: Retrieve a list of cities
SELECT DISTINCT City, StateProvince FROM SalesLT.Address;
--Step 2: Retrieve heaviest products
SELECT TOP 10 PERCENT Name AS ProductName, Weight AS ProductWeight FROM SalesLT.Product ORDER BY Weight DESC;
--Step 3: Retrieve the heaviest 100 products not including the heaviest ten 
SELECT TOP 100 Name AS ProductName, Weight AS ProductWeight
FROM SalesLT.Product
WHERE Name NOT IN (SELECT TOP 10 Name FROM SalesLT.Product ORDER BY Weight DESC)
ORDER BY Weight DESC;

SELECT Name FROM SalesLT.Product ORDER BY Weight DESC
OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY;

--------------------------------------
--Challenge 2: Retrieve Product Data--
--------------------------------------
--Step 1: Retrieve product details for product model 1
SELECT Name AS ProductName, Color, Size FROM SalesLT.Product WHERE ProductModelID = 1;
--Step 2: Filter product by color and size
SELECT ProductNumber, Name AS ProductName FROM SalesLT.Product WHERE Color IN ('Black', 'Red', 'White') AND Size IN ('S', 'M');
--Step 3: Filter products by product number
SELECT ProductNumber, Name AS ProductName, ListPrice FROM SalesLT.Product WHERE ProductNumber LIKE 'BK-%';
--Step 4: Retrieve specific products by product number
SELECT ProductNumber, Name AS ProductName, ListPrice FROM SalesLT.Product WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';
--Code for Lab 1 - Introduction to T-SQL

---------------------------------------
--Challenge 1: Retrieve Customer Data--
---------------------------------------
--Step 1: Retrieve customers details
SELECT TOP 10 * FROM SalesLT.Customer;
--Step 2: Retrieve customer name data
SELECT Title, FirstName, ISNULL(MiddleName, 'None') AS 'Middle Name', LastName, ISNULL(Suffix, 'None') AS Suffix
FROM SalesLT.Customer
ORDER BY FirstName;
--Step 3: Retrieve customer names and phone numbers
SELECT SalesPerson, Title + ' ' + LastName AS CustomerName, Phone
FROM SalesLT.Customer
ORDER BY SalesPerson;

--------------------------------------------------
--Challenge 2: Retrieve Customers and Sales Data--
--------------------------------------------------
--Step 1: Retrieve a list of customer companies
SELECT STR(CustomerID) + ':' + CompanyName AS 'Customer Companies'
FROM SalesLT.Customer
ORDER BY 'Customer Companies';
--Step 2: Retrieve a list of sales order revisions
SELECT * FROM SalesLT.SalesOrderHeader;
SELECT SalesOrderNumber + ' (' + REPLACE(STR(RevisionNumber), ' ', '') + ')' AS 'Record of Sales Orders'
FROM SalesLT.SalesOrderHeader
ORDER BY SalesOrderNumber;

--------------------------------------------------
--Challenge 2: Retrieve Customer Contact Details--
--------------------------------------------------
--Step 1: Retrieve customer contact names if known
SELECT DISTINCT FirstName + ISNULL(' '+ MiddleName, '') + ' ' + LastName AS FullName
FROM SalesLT.Customer
ORDER BY FullName;
--Step 2: Retrieve primary contact details
--Updating DB to remove some e-mails
UPDATE SalesLT.Customer
SET EmailAddress = NULL
WHERE CustomerID % 7 = 1;
--Step 2 implementation
SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

----------------------------------------
--Chalenge 3: Retrieve shipping status--
----------------------------------------
--Updating DB to remove some shipping dates
UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;
-- Step 3 implementation
SELECT SalesOrderID, 
	CASE
		WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
		ELSE 'Shipped'
	END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;
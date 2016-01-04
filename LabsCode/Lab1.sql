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
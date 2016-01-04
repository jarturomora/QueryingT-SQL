--Code for Lab 1 - Introduction to T-SQL

--Challenge 1: Retrieve customer data
--Step 1: Retrieve customers details
SELECT * FROM SalesLT.Customer;
--Step 2: Retrieve customer name data
SELECT Title, FirstName, ISNULL(MiddleName, 'None') AS 'Middle Name', LastName, ISNULL(Suffix, 'None') AS Suffix
FROM SalesLT.Customer
ORDER BY FirstName;
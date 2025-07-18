/*****************************************************************************************************************
NAME:    3.4 QA
PURPOSE: Answer 8 questions for 3.3

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/17/2025   TRAVIS GRAHAM 1. Built this script for EC IT143


NOTES: 
Questions and Answers to the AdventureWorks db IT143 3.3 Questions and 3.4 Answers
 
******************************************************************************************************************/

-- Q1: What are the five most expensive products based on list price? (From Alex O.)
-- A1: 
SELECT GETDATE() AS my_date;

SELECT TOP 5 ProductNumber, Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

-- Q2: How many employees were hired in 2013? (From Kalemba F.E.) Note: Kalemba's question used 2014, but there are no 2014 hires so I changed it to 2013 to make it more interesting)
-- A2: 
SELECT COUNT(*) AS Total_Hired_In_2013
FROM HumanResources.Employee
WHERE HireDate >= '2013-01-01' AND HireDate < '2014-01-01';

-- Q3: Which sales representative had the highest total sales in 2013? Please include their name and employee ID. (From Andrew P.)
-- A3: 
SELECT TOP 1 
    p.FirstName,
    p.LastName,
    s.SalesYTD
FROM Sales.SalesPerson s
JOIN Person.Person p ON s.BusinessEntityID = p.BusinessEntityID
ORDER BY s.SalesYTD DESC;

-- Q4: List all customers who placed orders in 2024, including their names and order totals.
-- A4:
SELECT 
    p.Name AS ProductName,
    SUM(od.OrderQty) AS TotalQuantityOrdered
FROM Sales.SalesOrderDetail od
JOIN Production.Product p ON od.ProductID = p.ProductID
GROUP BY p.Name
HAVING SUM(od.OrderQty) > 500
ORDER BY TotalQuantityOrdered DESC;

-- Q5: The boss has asked to see a report that we need help with. How do we get a report that takes the “ProductID”, “StartDate”, “StandardCost” from the Production.ProductCostHistory table and then adds in the products “Name” from the Production.Product table? We need the following sort order: “productid” ascending, “startdate” descending. (From me)
-- A5: 
SELECT 
    pch.ProductID,
    p.Name AS ProductName,
    pch.StartDate,
    pch.StandardCost
FROM Production.ProductCostHistory pch
JOIN Production.Product p ON pch.ProductID = p.ProductID
ORDER BY pch.ProductID ASC, pch.StartDate DESC;

-- Q6: The CFO is trying to determine if there are any employees that are salaried who belong to a job titles that is supposed to be hourly. How do we provide a report that shows the employee’s full name, job title and if they are flagged salaried or not? (From me)
-- A6:
SELECT 
    p.FirstName + ' ' + p.LastName AS FullName,
    e.JobTitle,
    e.SalariedFlag
FROM HumanResources.Employee e
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
ORDER BY e.JobTitle ASC, e.SalariedFlag ASC;

--Q7: Which tables in AdventureWorks contain a column named "ModifiedDate"? (From Kalemba F.E.)
--A7: 
SELECT 
    t.TABLE_SCHEMA,
    t.TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS t
WHERE COLUMN_NAME = 'ModifiedDate'
ORDER BY t.TABLE_SCHEMA, t.TABLE_NAME;

--Q8: What are the names of all the views available in the Sales schema? (From Scott B.)
--A8: 
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'Sales'
ORDER BY TABLE_NAME;
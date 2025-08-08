/*****************************************************************************************************************
NAME:    6.4 Performance Analysis
PURPOSE: Performance Analysis, Execution Plans, Costs

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/07/2025   TGRAHAM       1. Built this script for EC IT143 6.4

NOTES: 
 
******************************************************************************************************************/
USE AdventureWorks2022
GO

SELECT *
FROM [Person].[Person]
WHERE FirstName = 'James';
-- Estimated Subtree cost 0.396159
-- Missing Index (Impact 93.4148): CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>] ON [Person].[Person] ([FirstName]) 

CREATE NONCLUSTERED INDEX [I_Person_FirstName] ON [Person].[Person] ([FirstName])

-- Estimated subtree cost is now 0.283269

-- What are some use cases for SQL Server Profiler?
-- Creating a trace and selecting the appropriate things to monitor can help you see how queries are performing with your database. 
-- Keep an eye on the queries being run and how they impact the database.

-- What are the major steps you need to follow to use SQL Server Profiler?
-- Connect to the sql server (within sql server profiler), create a trace and customize the items you want to monitor. 
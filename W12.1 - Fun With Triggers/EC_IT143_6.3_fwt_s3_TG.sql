/*****************************************************************************************************************
NAME:    Fun with Functions
PURPOSE: IT143 6.3 T-SQL Data Manipulation—Fun with Triggers

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/06/2025   TGRAHAM       1. Built this script for IT143 6.3 T-SQL Data Manipulation—Fun with Triggers


NOTES: 

 
******************************************************************************************************************/

-- Q1: How to keep track of when a record was last modified?
-- A1: Initial insert below..
-- USE EC_IT143_DA
-- GO

-- ALTER TABLE dbo.t_hello_world
-- ADD last_modified_date DATETIME DEFAULT GETDATE();

-- Q2: How to keep track of when a record was last modified? 
-- A2: Maybe use an after update trigger?
-- https://stackoverflow.com/questions/9522982/t-sql-trigger-update
-- https://stackoverflow.com/questions/4574010/how-to-create-trigger-to-keep-track-of-last-changed-data


/*****************************************************************************************************************
NAME:    Fun with Functions
PURPOSE: IT143 6.3 T-SQL Data Manipulation—Fun with Functions

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/05/2025   TGRAHAM       1. Built this script for IT143 6.3 T-SQL Data Manipulation—Fun with Functions


NOTES: 

 
******************************************************************************************************************/

-- Q1: How to extract the first name AND last name from the contact name?
-- A1: 
-- The ContactName field contains a full name (first and last). 
-- We only want the first and last name seperated. 

-- All those other things are great and all, but in the case of answering the question I will stick to a simple ad hoc query!
USE EC_IT143_DA
GO

SELECT 
    CASE
        WHEN CHARINDEX(' ', ContactName) > 0
            THEN SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1)
        ELSE ''
    END AS FirstName,

    CASE
        WHEN CHARINDEX(' ', ContactName) > 0
            THEN REVERSE(SUBSTRING(REVERSE(ContactName), 1, CHARINDEX(' ', REVERSE(ContactName)) - 1))
        ELSE ContactName
    END AS LastName
FROM dbo.t_w3_schools_customers;


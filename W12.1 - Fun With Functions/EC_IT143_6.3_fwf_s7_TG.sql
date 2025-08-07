/*****************************************************************************************************************
NAME:    Fun with Functions
PURPOSE: IT143 6.3 T-SQL Data Manipulation—Fun with Functions

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/05/2025   TGRAHAM       1. Built this script for IT143 6.3 T-SQL Data Manipulation—Fun with Functions


NOTES: 

 
******************************************************************************************************************/

-- Q1: How to extract the first name from the contact name?
-- A1: 
-- The ContactName field contains a full name (first and last). 
-- We only want the first name. We need to build a function that can extract just the first name. e.g. Joe Smith -> Joe
USE EC_IT143_DA
GO

-- Common Table Expression to compare ad hoc vs. UDF

WITH NameComparison AS (
    SELECT 
        ContactName,

        -- ad hoc logic
        CASE
            WHEN CHARINDEX(' ', ContactName) > 0
                THEN SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1)
            ELSE ContactName
        END AS AdHocFirstName,

        -- UDF
        dbo.fn_GetFirstName(ContactName) AS UdfFirstName
    FROM dbo.t_w3_schools_customers
)

-- Return any rows where the results differ
SELECT *
FROM NameComparison
WHERE AdHocFirstName <> UdfFirstName
      OR (AdHocFirstName IS NULL AND UdfFirstName IS NOT NULL)
      OR (AdHocFirstName IS NOT NULL AND UdfFirstName IS NULL);


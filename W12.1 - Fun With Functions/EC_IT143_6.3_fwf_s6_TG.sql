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

-- AD HOC QUERY
SELECT 
    CASE
        WHEN CHARINDEX(' ', ContactName) > 0
            THEN SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1)
        ELSE ''
    END AS FirstName
FROM dbo.t_w3_schools_customers;

-- UDF SCALAR FUNCTION CREATION
CREATE FUNCTION dbo.fn_GetFirstName (@FullName NVARCHAR(255))
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @FirstName NVARCHAR(255)

    -- Check if there's a space
    IF CHARINDEX(' ', @FullName) > 0
        SET @FirstName = SUBSTRING(@FullName, 1, CHARINDEX(' ', @FullName) - 1)
    ELSE
        SET @FirstName = @FullName  -- Return full name if no space

    RETURN @FirstName
END

--RECALLING THE UDF
SELECT dbo.fn_GetFirstName(ContactName) AS FirstName
FROM dbo.t_w3_schools_customers;

--AD HOC QUERY AND THE UDF FUNCTION YIELD SAME RESULTS
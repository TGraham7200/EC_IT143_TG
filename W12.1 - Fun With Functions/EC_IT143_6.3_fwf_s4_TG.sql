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

-- Resources used to help formulate below code: https://anyonconsulting.com/business_intelligence/how-to-get-first-name-and-last-name-out-from-a-full-name-string-in-sql-server-instance/#:~:text=To%20solve%20this%20matter%2C%20I,with%20the%20method%20showcased%20below.&text=Database%20related%20issues%3F and https://stackoverflow.com/questions/5145791/extracting-first-name-and-last-name plus more
USE EC_IT143_DA
GO

SELECT 
    CASE
        WHEN CHARINDEX(' ', ContactName) > 0 --checking to see if there is a space in the contactname field and its position
            THEN SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1) --if there was a space, it extracts the part before the space
        ELSE ''
    END AS FirstName --sets column name
FROM dbo.t_w3_schools_customers;

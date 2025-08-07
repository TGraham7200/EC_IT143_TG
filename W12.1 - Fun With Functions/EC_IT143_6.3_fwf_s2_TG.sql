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
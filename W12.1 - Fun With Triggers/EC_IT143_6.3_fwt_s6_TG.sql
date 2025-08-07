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



-- Q2: How to keep track of when a record was last modified? 
-- A2: Maybe use an after update trigger?

-- Q3: Did it work?
-- A3: Yes

USE EC_IT143_DA
GO

-- Remove stuff if it is already there
DELETE FROM dbo.t_hello_world
	WHERE my_message IN('Hello World2', 'Hello World3', 'Hello World4');

-- Load test rows
INSERT INTO dbo.t_hello_world(my_message)
VALUES ('Hello World2'), ('Hello World3');

--See if the trigger worked
SELECT t.*
	FROM dbo.t_hello_world AS t;

-- Try it again
UPDATE dbo.t_hello_world SET my_message = 'Hello World4'
	WHERE my_message = 'Hello World3';

--See if the trigger worked
SELECT t.*
FROM dbo.t_hello_world AS t;

-- Q4: How to keep track of who last modified a record?
-- A4: This works for server user and initial INSERT...

ALTER TABLE dbo.t_hello_world
ADD last_modified_by VARCHAR(50) DEFAULT SUSER_NAME();



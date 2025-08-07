/*****************************************************************************************************************
NAME:    Fun with Functions
PURPOSE: IT143 6.3 T-SQL Data Manipulation—Fun with Triggers

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/06/2025   TGRAHAM       1. Built this script for IT143 6.3 T-SQL Data Manipulation—Fun with Triggers


NOTES: 
Keeps track of the last modified date for each row in the table
 
******************************************************************************************************************/
USE EC_IT143_DA
GO

CREATE TRIGGER trg_hello_world_last_mod ON dbo.t_hello_world
AFTER UPDATE
AS

	UPDATE dbo.t_hello_world
		SET
			last_modified_date = GETDATE()
		WHERE my_message IN
		(
			SELECT DISTINCT
				my_message
			FROM Inserted
		);
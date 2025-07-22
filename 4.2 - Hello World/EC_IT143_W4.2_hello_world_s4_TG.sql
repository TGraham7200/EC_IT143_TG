USE EC_IT143_DA;
DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO
CREATE VIEW dbo.v_hello_world_load
AS

/******************************************************************************************************************
NAME: dvo.v_hello_world_load
PURPOSE: Create the Hello World - Load view

MODIFICATION LOG:
Ver		Date		Author		Description
-----	---------	---------	-----------------------------------
1.0		7/21/25		TGRAHAM		1. EC IT143 4.2

Notes:
Th is script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation

******************************************************************************************************************/

SELECT 'Hello World' AS my_message
	, GETDATE() AS current_date_time;